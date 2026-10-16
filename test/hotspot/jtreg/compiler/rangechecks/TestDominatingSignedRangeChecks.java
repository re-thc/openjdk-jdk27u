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
 * @summary Eliminate a constant array bounds check proved by dominating signed guards
 * @requires vm.compiler2.enabled
 * @library /test/lib /
 * @run driver compiler.rangechecks.TestDominatingSignedRangeChecks
 */

package compiler.rangechecks;

import compiler.lib.ir_framework.IR;
import compiler.lib.ir_framework.IRNode;
import compiler.lib.ir_framework.Run;
import compiler.lib.ir_framework.Test;
import compiler.lib.ir_framework.TestFramework;
import compiler.lib.ir_framework.Warmup;
import jdk.test.lib.Asserts;

public class TestDominatingSignedRangeChecks {
    private static final byte[] SMALL = new byte[64];
    private static final byte[] OTHER = new byte[131];
    private static final long[] LONGS = new long[64];
    private static final Object[] OBJECTS = new Object[64];
    private static final int[] INTS = new int[64];
    private static int marker;
    private static final int[] INPUTS = {
        Integer.MIN_VALUE, Integer.MIN_VALUE + 1, -132, -131, -65, -64, -1,
        0, 1, 2, 62, 63, 64, 65, 129, 130, 131, 132,
        Integer.MAX_VALUE - 1, Integer.MAX_VALUE
    };

    static {
        for (int i = 0; i < OTHER.length; i++) {
            OTHER[i] = (byte)(37 * i + 11);
            if (i < SMALL.length) {
                SMALL[i] = OTHER[i];
                LONGS[i] = 0x1_0000_0001L * i;
                OBJECTS[i] = "slot_" + i;
            }
        }
    }

    public static void main(String[] args) {
        TestFramework framework = new TestFramework();
        framework.addFlags(args);
        framework.start();
    }

    // The two signed guards return different results. Their exits cannot just
    // be merged into a single check. Neither guard alone proves the access safe.
    @Test
    @IR(failOn = {IRNode.CMP_U, IRNode.RANGE_CHECK_TRAP}, counts = {IRNode.LOAD_UB, "1"})
    public static int testLookup64(int index) {
        if (index < 64) {
            return index <= 0 ? 0 : SMALL[index] & 0xff;
        }
        return index;
    }

    @Test
    @IR(failOn = {IRNode.CMP_U, IRNode.RANGE_CHECK_TRAP}, counts = {IRNode.LOAD_UB, "1"})
    public static int testLookup131(int index) {
        if (index < 131) {
            return index <= 0 ? 0 : OTHER[index] & 0xff;
        }
        return index;
    }

    @Test
    @IR(failOn = {IRNode.CMP_U, IRNode.RANGE_CHECK_TRAP})
    public static int testInclusiveZero(int index) {
        if (index < 64) {
            return index < 0 ? -1 : SMALL[index] & 0xff;
        }
        return index;
    }

    @Test
    @IR(failOn = {IRNode.CMP_U, IRNode.RANGE_CHECK_TRAP})
    public static int testReversedGuards(int index) {
        if (index <= 0) {
            return 0;
        }
        return index < 64 ? SMALL[index] & 0xff : index;
    }

    @Test
    @IR(failOn = {IRNode.CMP_U, IRNode.RANGE_CHECK_TRAP})
    public static long testLongLoad(int index) {
        if (index < 64) {
            return index <= 0 ? 0 : LONGS[index];
        }
        return index;
    }

    @Test
    @IR(failOn = {IRNode.CMP_U, IRNode.RANGE_CHECK_TRAP})
    public static Object testObjectLoad(int index) {
        if (index < 64) {
            return index <= 0 ? "zero" : OBJECTS[index];
        }
        return "large";
    }

    @Test
    @IR(failOn = {IRNode.CMP_U, IRNode.RANGE_CHECK_TRAP})
    public static int testIntStore(int index) {
        if (index < 64) {
            return index <= 0 ? 0 : (INTS[index] = 3 * index);
        }
        return index;
    }

    @Test
    public static int testNoLowerGuard(int index) {
        if (index < 64) {
            return SMALL[index] & 0xff;
        }
        return index;
    }

    @Test
    public static int testNoUpperGuard(int index) {
        return index <= 0 ? 0 : SMALL[index] & 0xff;
    }

    @Test
    public static int testMerge(int index, boolean smallBound) {
        if (smallBound) {
            if (index >= 64) {
                return index;
            }
        } else if (index >= 131) {
            return index;
        }
        return index <= 0 ? 0 : SMALL[index] & 0xff;
    }

    @Test
    public static int testDifferentIndex(int index, int delta) {
        if (index < 64) {
            return index <= 0 ? 0 : SMALL[index + delta] & 0xff;
        }
        return index;
    }

    @Test
    public static int testNullable(int index, boolean useNull) {
        byte[] array = useNull ? null : SMALL;
        if (index < 64) {
            return index <= 0 ? 0 : array[index] & 0xff;
        }
        return index;
    }

    @Test
    public static int testEffectBeforeFault(int index, boolean useNull) {
        byte[] array = useNull ? null : SMALL;
        if (index < 64) {
            if (index <= 0) {
                return 0;
            }
            marker = index;
            return array[index] & 0xff;
        }
        return index;
    }

    @Test
    public static int testVariableLength(int index, byte[] array) {
        if (index < 64) {
            return index <= 0 ? 0 : array[index] & 0xff;
        }
        return index;
    }

    private static int expected(int index, int size) {
        return index > 0 && index < size ? (37 * index + 11) & 0xff : Math.max(0, index);
    }

    private static void expectBounds(Runnable action) {
        try {
            action.run();
        } catch (ArrayIndexOutOfBoundsException expected) {
            return;
        }
        throw new AssertionError("Missing array bounds exception");
    }

    @Run(test = {"testLookup64", "testLookup131", "testInclusiveZero", "testReversedGuards",
                 "testLongLoad", "testObjectLoad", "testIntStore", "testNoLowerGuard", "testNoUpperGuard",
                 "testMerge", "testDifferentIndex", "testNullable", "testEffectBeforeFault", "testVariableLength"})
    @Warmup(2000)
    public static void check() {
        for (int index : INPUTS) {
            Asserts.assertEQ(testLookup64(index), expected(index, 64));
            Asserts.assertEQ(testLookup131(index), expected(index, 131));
            int inclusiveResult = index < 0 ? -1 : index < 64 ? (37 * index + 11) & 0xff : index;
            Asserts.assertEQ(testInclusiveZero(index), inclusiveResult);
            Asserts.assertEQ(testReversedGuards(index), expected(index, 64));
            long longResult = index > 0 && index < 64 ? 0x1_0000_0001L * index : Math.max(0, index);
            Asserts.assertEQ(testLongLoad(index), longResult);
            Object objectResult = index <= 0 ? "zero" : index >= 64 ? "large" : "slot_" + index;
            Asserts.assertEQ(testObjectLoad(index), objectResult);
            int storeResult = index > 0 && index < 64 ? 3 * index : Math.max(0, index);
            Asserts.assertEQ(testIntStore(index), storeResult);
            if (index > 0 && index < 64) {
                Asserts.assertEQ(INTS[index], storeResult);
            }

            if (index < 0) {
                expectBounds(() -> testNoLowerGuard(index));
            } else {
                Asserts.assertEQ(testNoLowerGuard(index), index < 64 ? (37 * index + 11) & 0xff : index);
            }
            if (index >= 64) {
                expectBounds(() -> testNoUpperGuard(index));
            } else {
                Asserts.assertEQ(testNoUpperGuard(index), expected(index, 64));
            }
            Asserts.assertEQ(testMerge(index, true), expected(index, 64));
            if (index >= 64 && index < 131) {
                expectBounds(() -> testMerge(index, false));
            } else {
                Asserts.assertEQ(testMerge(index, false), expected(index, 64));
            }
            Asserts.assertEQ(testNullable(index, false), expected(index, 64));
            if (index > 0 && index < 64) {
                try {
                    testNullable(index, true);
                    throw new AssertionError("Missing null exception");
                } catch (NullPointerException expected) {
                }
                marker = -1;
                try {
                    testEffectBeforeFault(index, true);
                    throw new AssertionError("Missing null exception");
                } catch (NullPointerException expected) {
                }
                Asserts.assertEQ(marker, index);
                expectBounds(() -> testVariableLength(index, new byte[1]));
            } else {
                Asserts.assertEQ(testNullable(index, true), Math.max(0, index));
                marker = -1;
                Asserts.assertEQ(testEffectBeforeFault(index, true), Math.max(0, index));
                Asserts.assertEQ(marker, -1);
                Asserts.assertEQ(testVariableLength(index, new byte[1]), Math.max(0, index));
            }
            marker = -1;
            Asserts.assertEQ(testEffectBeforeFault(index, false), expected(index, 64));
            Asserts.assertEQ(marker, index > 0 && index < 64 ? index : -1);
            Asserts.assertEQ(testVariableLength(index, SMALL), expected(index, 64));
        }
        Asserts.assertEQ(testDifferentIndex(1, 1), expected(2, 64));
        Asserts.assertEQ(testDifferentIndex(63, 0), expected(63, 64));
        expectBounds(() -> testDifferentIndex(1, 63));
        expectBounds(() -> testDifferentIndex(1, Integer.MAX_VALUE));
        expectBounds(() -> testDifferentIndex(63, -64));
    }
}
