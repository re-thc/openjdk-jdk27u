/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

package compiler.vectorapi;

import compiler.lib.ir_framework.*;
import java.util.Arrays;
import jdk.incubator.vector.ByteVector;
import jdk.incubator.vector.VectorOperators;
import jdk.test.lib.Asserts;

/*
 * @test
 * @summary Prove guarded secondary cursors without assuming that signed sums cannot overflow
 * @requires vm.compiler2.enabled
 * @modules jdk.incubator.vector
 * @library /test/lib /
 * @run driver compiler.vectorapi.TestGuardedVectorCursor
 */
public class TestGuardedVectorCursor {
    private static final byte[] DATA = new byte[4096];
    private static final byte[] OUTPUT = new byte[64];
    private static final byte[] WORK = new byte[4096];
    private static final int[] WIDTHS = new int[128];
    private static final int[] SKIPPING_WIDTHS = new int[128];
    private static final int[] LIMITS = new int[128];
    private static int marker;

    static {
        for (int i = 0; i < DATA.length; i++) DATA[i] = (byte) (13 * i + 5);
        for (int i = 0; i < WIDTHS.length; i++) {
            WIDTHS[i] = i % 17;
            SKIPPING_WIDTHS[i] = WIDTHS[i] | ((i & 1) << 17);
        }
        Arrays.fill(LIMITS, 2048);
    }

    public static void main(String[] args) {
        // Keep default loop unrolling: source vector loads can be cloned.
        TestFramework.runWithFlags("--add-modules=jdk.incubator.vector",
                                   "-Djdk.incubator.vector.VECTOR_ACCESS_OOB_CHECK=2");
    }

    @Test
    @IR(failOn = {"RangeCheck.*Objects::checkIndex.*ByteVector::fromArray"},
        counts = {IRNode.LOAD_VECTOR_B, IRNode.VECTOR_SIZE_16, ">=1"},
        phase = CompilePhase.AFTER_MACRO_EXPANSION,
        applyIfCPUFeatureOr = {"sse2", "true", "asimd", "true"}, applyIf = {"MaxVectorSize", ">=16"})
    public static int sample(byte[] data, int limit, int[] widths) {
        int ceiling = data.length - 32;
        int cursor = 0;
        int checksum = 0;
        for (int i = 0; i < widths.length; i++) {
            int width = widths[i] & 0x1ffff;
            if (width != 0 && width > limit - cursor) throw new IllegalArgumentException();
            if (cursor + width <= ceiling && width <= 16) {
                checksum += ByteVector.fromArray(ByteVector.SPECIES_128, data, cursor)
                                      .reduceLanes(VectorOperators.ADD);
            }
            cursor += width;
        }
        return cursor ^ checksum;
    }

    @Test
    @IR(failOn = {"RangeCheck.*Objects::checkIndex.*ByteVector::fromArray"},
        counts = {IRNode.LOAD_VECTOR_B, IRNode.VECTOR_SIZE_16, ">=1"},
        phase = CompilePhase.AFTER_MACRO_EXPANSION,
        applyIfCPUFeatureOr = {"sse2", "true", "asimd", "true"}, applyIf = {"MaxVectorSize", ">=16"})
    public static int copyAfterStore(byte[] data, byte[] output, int limit, int[] widths) {
        int ceiling = data.length - 32;
        int cursor = 0;
        for (int i = 0; i < widths.length; i++) {
            int width = widths[i] & 0x1ffff;
            if (width != 0 && width > limit - cursor) throw new IllegalArgumentException();
            if (cursor + width <= ceiling && width <= 16) {
                data[cursor] ^= 1;
                marker++;
                ByteVector.fromArray(ByteVector.SPECIES_128, data, cursor).intoArray(output, i & 15);
            }
            cursor += width;
        }
        return cursor;
    }

    @Test
    @IR(counts = {"RangeCheck.*Objects::checkIndex.*ByteVector::fromArray", ">=1"},
        phase = CompilePhase.AFTER_MACRO_EXPANSION,
        applyIfCPUFeatureOr = {"sse2", "true", "asimd", "true"}, applyIf = {"MaxVectorSize", ">=16"})
    public static int seeded(byte[] data, int limit, int cursor, int[] widths) {
        int ceiling = data.length - 32;
        for (int i = 0; i < widths.length; i++) {
            int width = widths[i] & 0x1ffff;
            if (width != 0 && width > limit - cursor) throw new IllegalArgumentException();
            if (cursor + width <= ceiling && width <= 16) {
                ByteVector.fromArray(ByteVector.SPECIES_128, data, cursor).intoArray(OUTPUT, i & 15);
            }
            cursor += width;
        }
        return cursor;
    }

    @Test
    @IR(counts = {"RangeCheck.*Objects::checkIndex.*ByteVector::fromArray", ">=1"},
        phase = CompilePhase.AFTER_MACRO_EXPANSION,
        applyIfCPUFeatureOr = {"sse2", "true", "asimd", "true"}, applyIf = {"MaxVectorSize", ">=16"})
    public static int conditional(byte[] data, int limit, int[] widths, boolean check) {
        int ceiling = data.length - 32;
        int cursor = 0;
        for (int i = 0; i < widths.length; i++) {
            int width = widths[i] & 0x1ffff;
            if (check && width != 0 && width > limit - cursor) throw new IllegalArgumentException();
            if (cursor + width <= ceiling && width <= 16) {
                ByteVector.fromArray(ByteVector.SPECIES_128, data, cursor).intoArray(OUTPUT, i & 15);
            }
            cursor += width;
        }
        return cursor;
    }

    @Test
    @IR(counts = {"RangeCheck.*Objects::checkIndex.*ByteVector::fromArray", ">=1"},
        phase = CompilePhase.AFTER_MACRO_EXPANSION,
        applyIfCPUFeatureOr = {"sse2", "true", "asimd", "true"}, applyIf = {"MaxVectorSize", ">=16"})
    public static int varyingLimit(byte[] data, int[] limits, int[] widths) {
        int ceiling = data.length - 32;
        int cursor = 0;
        for (int i = 0; i < widths.length; i++) {
            int width = widths[i] & 0x1ffff;
            if (width != 0 && width > limits[i] - cursor) throw new IllegalArgumentException();
            if (cursor + width <= ceiling && width <= 16) {
                ByteVector.fromArray(ByteVector.SPECIES_128, data, cursor).intoArray(OUTPUT, i & 15);
            }
            cursor += width;
        }
        return cursor;
    }

    @Test
    @IR(counts = {"RangeCheck.*Objects::checkIndex.*ByteVector::fromArray", ">=1"},
        phase = CompilePhase.AFTER_MACRO_EXPANSION,
        applyIfCPUFeatureOr = {"sse2", "true", "asimd", "true"}, applyIf = {"MaxVectorSize", ">=16"})
    public static int uncheckedBackedge(byte[] data, int limit, int[] widths) {
        int ceiling = data.length - 32;
        int cursor = 0;
        for (int i = 0; i < widths.length; i++) {
            int width = widths[i] & 0x1ffff;
            if ((widths[i] & 0x20000) != 0) {
                cursor += width;
                continue;
            }
            if (width != 0 && width > limit - cursor) throw new IllegalArgumentException();
            if (cursor + width <= ceiling && width <= 16) {
                ByteVector.fromArray(ByteVector.SPECIES_128, data, cursor).intoArray(OUTPUT, i & 15);
            }
            cursor += width;
        }
        return cursor;
    }

    @Test
    @IR(counts = {"RangeCheck.*Objects::checkIndex.*ByteVector::fromArray", ">=1"},
        phase = CompilePhase.AFTER_MACRO_EXPANSION,
        applyIfCPUFeatureOr = {"sse2", "true", "asimd", "true"}, applyIf = {"MaxVectorSize", ">=16"})
    public static int negativeWidth(byte[] data, int limit, int[] widths) {
        int ceiling = data.length - 32;
        int cursor = 0;
        for (int i = 0; i < widths.length; i++) {
            int width = widths[i];
            if (width != 0 && width > limit - cursor) throw new IllegalArgumentException();
            if (cursor + width <= ceiling && width <= 16) {
                ByteVector.fromArray(ByteVector.SPECIES_128, data, cursor).intoArray(OUTPUT, i & 15);
            }
            cursor += width;
        }
        return cursor;
    }

    @Test
    @IR(counts = {"RangeCheck.*Objects::checkIndex.*ByteVector::fromArray", ">=1"},
        phase = CompilePhase.AFTER_MACRO_EXPANSION,
        applyIfCPUFeatureOr = {"sse2", "true", "asimd", "true"}, applyIf = {"MaxVectorSize", ">=16"})
    public static int changedUpdate(byte[] data, int limit, int[] widths) {
        int ceiling = data.length - 32;
        int cursor = 0;
        for (int i = 0; i < widths.length; i++) {
            int width = widths[i] & 0x1ffff;
            if (width != 0 && width > limit - cursor) throw new IllegalArgumentException();
            if (cursor + width <= ceiling && width <= 16) {
                ByteVector.fromArray(ByteVector.SPECIES_128, data, cursor).intoArray(OUTPUT, i & 15);
            }
            cursor += width + 1;
        }
        return cursor;
    }

    @Test
    @IR(counts = {"RangeCheck.*Objects::checkIndex.*ByteVector::fromArray", ">=1"},
        phase = CompilePhase.AFTER_MACRO_EXPANSION,
        applyIfCPUFeatureOr = {"sse2", "true", "asimd", "true"}, applyIf = {"MaxVectorSize", ">=16"})
    public static int mismatchedPhis(byte[] data, int limit, int[] widths) {
        int ceiling = data.length - 32;
        int cursor = 0;
        for (int i = 0; i < widths.length; i++) {
            int width = widths[i] & 0x1ffff;
            int step;
            int end;
            if ((widths[i] & 0x20000) == 0) {
                if (width != 0 && width > limit - cursor) throw new IllegalArgumentException();
                step = width;
                end = cursor;
            } else {
                step = 0;
                end = cursor + width;
            }
            // The merged end is not cursor + step: its Phi arms are reversed.
            if (end <= ceiling && width <= 16) {
                ByteVector.fromArray(ByteVector.SPECIES_128, data, cursor).intoArray(OUTPUT, i & 15);
            }
            cursor += step;
        }
        return cursor;
    }

    @Test
    @IR(counts = {"RangeCheck.*Objects::checkIndex.*ByteVector::fromArray", ">=1"},
        phase = CompilePhase.AFTER_MACRO_EXPANSION,
        applyIfCPUFeatureOr = {"sse2", "true", "asimd", "true"}, applyIf = {"MaxVectorSize", ">=16"})
    public static int shortSlack(byte[] data, int limit, int[] widths) {
        int ceiling = data.length - 8;
        int cursor = 0;
        for (int i = 0; i < widths.length; i++) {
            int width = widths[i] & 0x1ffff;
            if (width != 0 && width > limit - cursor) throw new IllegalArgumentException();
            if (cursor + width <= ceiling && width <= 16) {
                ByteVector.fromArray(ByteVector.SPECIES_128, data, cursor).intoArray(OUTPUT, i & 15);
            }
            cursor += width;
        }
        return cursor;
    }

    @Run(test = {"sample", "copyAfterStore", "seeded", "conditional", "varyingLimit",
                 "uncheckedBackedge", "negativeWidth", "changedUpdate", "mismatchedPhis", "shortSlack"})
    public static void runAll(RunInfo info) {
        Asserts.assertEquals(sample(DATA, 2048, WIDTHS), reference(DATA, 2048, WIDTHS));
        Asserts.assertEquals(seeded(DATA, 2048, 0, WIDTHS), 988);
        Asserts.assertEquals(conditional(DATA, 2048, WIDTHS, true), 988);
        Asserts.assertEquals(conditional(DATA, 2048, WIDTHS, false), 988);
        Asserts.assertEquals(varyingLimit(DATA, LIMITS, WIDTHS), 988);
        Asserts.assertEquals(uncheckedBackedge(DATA, 2048, SKIPPING_WIDTHS), 988);
        Asserts.assertEquals(negativeWidth(DATA, 2048, WIDTHS), 988);
        Asserts.assertEquals(changedUpdate(DATA, 2048, WIDTHS), 1116);
        int checkedWidths = 0;
        for (int width : SKIPPING_WIDTHS) {
            if ((width & 0x20000) == 0) checkedWidths += width;
        }
        Asserts.assertEquals(mismatchedPhis(DATA, 2048, SKIPPING_WIDTHS), checkedWidths);
        Asserts.assertEquals(shortSlack(DATA, 2048, WIDTHS), 988);
        System.arraycopy(DATA, 0, WORK, 0, DATA.length);
        Asserts.assertEquals(copyAfterStore(WORK, OUTPUT, 2048, WIDTHS), 988);
        // Profile the skipped fast path before compilation as well.
        sample(new byte[0], -1, new int[] {0});
        sample(DATA, Integer.MAX_VALUE, new int[] {0, 17, 100000, 1, 0});
        if (info.isWarmUp()) return;

        boolean compiled = info.isTestC2Compiled("sample");
        for (int length = 0; length <= 65; length++) {
            byte[] data = Arrays.copyOf(DATA, length);
            for (int limit : new int[] {Integer.MIN_VALUE, -1, 0, 128}) {
                int[] widths = limit < 1 ? new int[] {0, 0, 0} : new int[] {0, 1, 16, 17, 0};
                Asserts.assertEquals(sample(data, limit, widths), reference(data, limit, widths));
            }
        }
        Asserts.assertTrue(!compiled || info.isTestC2Compiled("sample"),
                           "Short-array cases must exercise the compiled guarded cursor");
        checkMemory(info);
        checkCounterexamples();
    }

    // Use long arithmetic, independently of the signed subtract guard in the test.
    private static int reference(byte[] data, int limit, int[] widths) {
        long cursor = 0;
        int checksum = 0;
        for (int value : widths) {
            int width = value & 0x1ffff;
            if (width != 0 && cursor + width > Math.max(limit, 0)) throw new IllegalArgumentException();
            if (cursor + width <= data.length - 32 && width <= 16) {
                byte sum = 0;
                for (int j = 0; j < 16; j++) sum += data[(int) cursor + j];
                checksum += sum;
            }
            cursor += width;
        }
        return (int) cursor ^ checksum;
    }

    private static void checkMemory(RunInfo info) {
        byte[] data = Arrays.copyOf(DATA, 64);
        byte[] expected = data.clone();
        int[] widths = {0, 1, 16, 0, 2};
        int cursor = 0;
        for (int i = 0; i < widths.length; i++) {
            expected[cursor] ^= 1;
            System.arraycopy(expected, cursor, expected, i & 15, 16);
            cursor += widths[i];
        }
        boolean compiled = info.isTestC2Compiled("copyAfterStore");
        Asserts.assertEquals(copyAfterStore(data, data, 64, widths), cursor);
        Asserts.assertTrue(Arrays.equals(data, expected));
        Asserts.assertTrue(!compiled || info.isTestC2Compiled("copyAfterStore"),
                           "The aliasing case must exercise compiled memory ordering");
        int before = marker;
        Asserts.assertEquals(copyAfterStore(new byte[15], null, -1, new int[] {0}), 0);
        Asserts.assertEquals(marker, before);
        expect(IllegalArgumentException.class, () -> copyAfterStore(data, null, -1, new int[] {1}));
        Asserts.assertEquals(marker, before);
        byte first = data[0];
        expect(NullPointerException.class, () -> copyAfterStore(data, null, 64, new int[] {0}));
        Asserts.assertEquals(data[0], (byte) (first ^ 1));
        Asserts.assertEquals(marker, before + 1);
    }

    private static void checkCounterexamples() {
        byte[] data = new byte[64];
        int[] maximum = new int[16385];
        Arrays.fill(maximum, 131071);
        maximum[maximum.length - 1] = 16383;
        Asserts.assertEquals(sample(data, Integer.MAX_VALUE, maximum), Integer.MAX_VALUE);
        int[] overflow = Arrays.copyOf(maximum, maximum.length + 1);
        overflow[overflow.length - 1] = 1;
        expect(IllegalArgumentException.class, () -> sample(data, Integer.MAX_VALUE, overflow));
        expect(IllegalArgumentException.class, () -> sample(data, -1, new int[] {1}));
        expect(NullPointerException.class, () -> sample(null, 0, new int[] {0}));
        expect(IndexOutOfBoundsException.class,
               () -> seeded(data, Integer.MIN_VALUE, Integer.MAX_VALUE, new int[] {1}));
        expect(IndexOutOfBoundsException.class, () -> seeded(data, 0, -1, new int[] {0}));
        expect(IndexOutOfBoundsException.class, () -> conditional(data, 0, overflow, false));
        int[] limits = new int[overflow.length];
        Arrays.fill(limits, Integer.MAX_VALUE);
        limits[limits.length - 1] = Integer.MIN_VALUE;
        expect(IndexOutOfBoundsException.class, () -> varyingLimit(data, limits, overflow));
        int[] skipping = overflow.clone();
        for (int i = 0; i < skipping.length - 1; i++) skipping[i] |= 0x20000;
        expect(IndexOutOfBoundsException.class, () -> uncheckedBackedge(data, Integer.MIN_VALUE, skipping));
        expect(IndexOutOfBoundsException.class, () -> negativeWidth(data, 0, new int[] {-1, 0}));
        int[] mismatched = overflow.clone();
        mismatched[mismatched.length - 1] |= 0x20000;
        expect(IndexOutOfBoundsException.class,
               () -> mismatchedPhis(data, Integer.MAX_VALUE, mismatched));
        expect(IndexOutOfBoundsException.class, () -> shortSlack(new byte[8], 0, new int[] {0}));
        expect(IndexOutOfBoundsException.class, () -> shortSlack(new byte[32], 32, new int[] {17, 0}));
        int[] changed = new int[16387];
        Arrays.fill(changed, 0, 16383, 131071);
        changed[16383] = 131069;
        expect(IndexOutOfBoundsException.class, () -> changedUpdate(data, Integer.MAX_VALUE, changed));
    }

    private static void expect(Class<? extends Throwable> expected, Runnable action) {
        try {
            action.run();
        } catch (Throwable t) {
            if (expected.isInstance(t)) return;
            throw new AssertionError("Expected " + expected + ", got " + t, t);
        }
        throw new AssertionError("Expected " + expected);
    }
}
