/*
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

/*
 * @test
 * @summary Exercise aliasing and later control transformations after signed range proofs
 * @requires vm.compiler2.enabled
 * @library /test/lib /
 * @run driver compiler.rangechecks.TestDominatingSignedRangeDependencies
 */

package compiler.rangechecks;

import compiler.lib.ir_framework.Run;
import compiler.lib.ir_framework.Test;
import compiler.lib.ir_framework.TestFramework;
import compiler.lib.ir_framework.Warmup;
import jdk.test.lib.Asserts;

public class TestDominatingSignedRangeDependencies {
    private static final byte[] TABLE = new byte[64];
    private static final int[] DESTINATION = new int[64];
    private static final int[] OTHER_SOURCE = new int[64];
    private static int marker;
    private static final int[] INPUTS = {
        Integer.MIN_VALUE, Integer.MIN_VALUE + 1, -65, -64, -1,
        0, 1, 2, 62, 63, 64, 65, Integer.MAX_VALUE - 1, Integer.MAX_VALUE
    };
    private static final int[] REPLACEMENTS = {Integer.MIN_VALUE, 0x7f00ff00, Integer.MAX_VALUE};
    private static final int[] TRIPS = {-1, 0, 1, 3};

    static {
        for (int i = 0; i < TABLE.length; i++) {
            TABLE[i] = (byte)(37 * i + 11);
        }
    }

    public static void main(String[] args) {
        TestFramework framework = new TestFramework();
        framework.addFlags(args);
        framework.start();
    }

    // Replacement is independent of the loaded value: old+1 would impose a
    // data dependency that could hide an incorrectly reordered load and store.
    @Test
    public static int testAliasedReadBeforeWrite(int index, int replacement, boolean sameArray) {
        int[] source = sameArray ? DESTINATION : OTHER_SOURCE;
        if (index < 64) {
            if (index <= 0) {
                return 0;
            }
            int old = source[index];
            DESTINATION[index] = replacement;
            return old;
        }
        return index;
    }

    // These duplicate guards challenge a later subsuming transformation. Only
    // phase/event evidence can establish whether it occurred after the fold.
    @Test
    public static int testDuplicateUpperGuard(int index) {
        if (index < 64) {
            if (index <= 0) {
                return 0;
            }
            if (index < 64) {
                return TABLE[index] & 0xff;
            }
        }
        return index;
    }

    @Test
    public static int testDuplicateLowerGuard(int index) {
        if (index <= 0) {
            return 0;
        }
        if (index < 64) {
            if (index <= 0) {
                return -7;
            }
            return TABLE[index] & 0xff;
        }
        return index;
    }

    // The index Phi and the following repeated choice expose splitting and
    // control simplification around an access. The false choice must bypass
    // the load, including with a null array and otherwise invalid index.
    @Test
    public static int testDiamondIndex(int index, boolean chooseIndex, boolean useNull) {
        int selected = chooseIndex ? index : -1;
        byte[] array = useNull ? null : TABLE;
        if (selected < 64) {
            if (selected <= 0) {
                return 0;
            }
            marker = 1;
            int value = array[selected] & 0xff;
            if (chooseIndex) {
                return value;
            }
            return value + 1;
        }
        return selected;
    }

    // Zero-trip, invariant-choice and duplicated-guard paths expose loop
    // cloning/unswitching opportunities. Invalid and null bypasses must stay
    // bypasses even if a load's proving guard is later simplified.
    @Test
    public static int testInvariantLoop(int index, int trips, boolean bypass, boolean useNull) {
        byte[] array = useNull ? null : TABLE;
        int total = 0;
        for (int trip = 0; trip < trips; trip++) {
            if (bypass) {
                total++;
                continue;
            }
            if (index < 64) {
                if (index <= 0) {
                    total += 2;
                    continue;
                }
                if (index < 64) {
                    marker = trip + 1;
                    total += array[index] & 0xff;
                }
            } else {
                total += index;
            }
        }
        return total;
    }

    // Entry constraints do not bound the changing Phi on all later trips.
    // In particular, the second trip can reach 0, 64 or a wrapped negative.
    @Test
    public static int testGuardBeforeLoop(int index, int step, int trips) {
        if (index < 64) {
            if (index <= 0) {
                return 0;
            }
            int current = index;
            int total = 0;
            for (int trip = 0; trip < trips; trip++) {
                marker = trip + 1;
                total += TABLE[current] & 0xff;
                current += step;
            }
            return total;
        }
        return index;
    }

    private static int fixture(int index) {
        return (37 * index + 11) & 0xff;
    }

    private static int lookupResult(int index) {
        return index > 0 && index < 64 ? fixture(index) : Math.max(0, index);
    }

    private static int destinationFixture(int index) {
        return 0x13572468 ^ index;
    }

    private static int sourceFixture(int index) {
        return 0x24681357 ^ index;
    }

    private static void checkAlias(int index, int replacement, boolean sameArray) {
        // Reset before every call, including bypasses, then verify every slot.
        // No call, volatile operation or synchronization separates load/store
        // inside the compiled method under test.
        for (int slot = 0; slot < 64; slot++) {
            DESTINATION[slot] = destinationFixture(slot);
            OTHER_SOURCE[slot] = sourceFixture(slot);
        }
        boolean access = index > 0 && index < 64;
        int expectedOld = access ? (sameArray ? destinationFixture(index) : sourceFixture(index))
                                 : Math.max(0, index);
        Asserts.assertEQ(testAliasedReadBeforeWrite(index, replacement, sameArray), expectedOld);
        for (int slot = 0; slot < 64; slot++) {
            int expectedNew = access && slot == index ? replacement : destinationFixture(slot);
            Asserts.assertEQ(DESTINATION[slot], expectedNew);
            Asserts.assertEQ(OTHER_SOURCE[slot], sourceFixture(slot));
        }
    }

    private static void expectNull(Runnable action) {
        try {
            action.run();
        } catch (NullPointerException expected) {
            return;
        }
        throw new AssertionError("Missing null exception");
    }

    private static void expectBounds(Runnable action) {
        try {
            action.run();
        } catch (ArrayIndexOutOfBoundsException expected) {
            return;
        }
        throw new AssertionError("Missing array bounds exception");
    }

    private static void checkEntryLoop(int index, int step, int trips,
                                       int expectedResult, int expectedMarker, boolean throwsBounds) {
        marker = -1;
        if (throwsBounds) {
            expectBounds(() -> testGuardBeforeLoop(index, step, trips));
        } else {
            Asserts.assertEQ(testGuardBeforeLoop(index, step, trips), expectedResult);
        }
        Asserts.assertEQ(marker, expectedMarker);
    }

    // No no-CmpU assertion is a phase oracle here. The validation plan also
    // requires actual helper execution and load/cast dependency lineage across
    // a subsequent transformation; a source shape alone proves neither event.
    @Run(test = {"testAliasedReadBeforeWrite", "testDuplicateUpperGuard", "testDuplicateLowerGuard",
                 "testDiamondIndex", "testInvariantLoop", "testGuardBeforeLoop"})
    @Warmup(2000)
    public static void check() {
        for (int index : INPUTS) {
            Asserts.assertEQ(testDuplicateUpperGuard(index), lookupResult(index));
            Asserts.assertEQ(testDuplicateLowerGuard(index), lookupResult(index));
            for (int replacement : REPLACEMENTS) {
                checkAlias(index, replacement, false);
                checkAlias(index, replacement, true);
            }
            for (boolean chooseIndex : new boolean[] {false, true}) {
                for (boolean useNull : new boolean[] {false, true}) {
                    marker = -1;
                    boolean access = chooseIndex && index > 0 && index < 64;
                    if (access && useNull) {
                        expectNull(() -> testDiamondIndex(index, chooseIndex, true));
                    } else {
                        int result = chooseIndex ? lookupResult(index) : 0;
                        Asserts.assertEQ(testDiamondIndex(index, chooseIndex, useNull), result);
                    }
                    Asserts.assertEQ(marker, access ? 1 : -1);
                }
            }
            for (int trips : TRIPS) {
                for (boolean bypass : new boolean[] {false, true}) {
                    for (boolean useNull : new boolean[] {false, true}) {
                        marker = -1;
                        boolean access = trips > 0 && !bypass && index > 0 && index < 64;
                        if (access && useNull) {
                            expectNull(() -> testInvariantLoop(index, trips, bypass, true));
                            Asserts.assertEQ(marker, 1);
                        } else {
                            int perTrip = bypass ? 1 : index <= 0 ? 2
                                                                  : index < 64 ? fixture(index) : index;
                            int result = trips > 0 ? perTrip * trips : 0;
                            Asserts.assertEQ(testInvariantLoop(index, trips, bypass, useNull), result);
                            Asserts.assertEQ(marker, access ? trips : -1);
                        }
                    }
                }
            }
        }
        // Fixed cases separate entry safety from the bounds of later values.
        checkEntryLoop(63, 1, 2, 0, 2, true);
        checkEntryLoop(1, -1, 2, fixture(1) + fixture(0), 2, false);
        checkEntryLoop(1, -1, 3, 0, 3, true);
        checkEntryLoop(1, Integer.MAX_VALUE, 2, 0, 2, true);
        checkEntryLoop(63, Integer.MIN_VALUE, 2, 0, 2, true);
        checkEntryLoop(1, 0, 3, 3 * fixture(1), 3, false);
        checkEntryLoop(63, 1, 0, 0, -1, false);
        checkEntryLoop(63, 1, -1, 0, -1, false);
        checkEntryLoop(0, Integer.MAX_VALUE, 3, 0, -1, false);
        checkEntryLoop(Integer.MIN_VALUE, 1, 3, 0, -1, false);
        checkEntryLoop(Integer.MAX_VALUE, 1, 3, Integer.MAX_VALUE, -1, false);
    }
}
