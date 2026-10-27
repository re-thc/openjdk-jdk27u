/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
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
 * @summary Bound dominance walks when proving guarded vector cursors
 * @requires vm.compiler2.enabled
 * @modules jdk.incubator.vector
 * @library /test/lib /
 * @run driver compiler.vectorapi.TestGuardedVectorCursorBudget
 */
public class TestGuardedVectorCursorBudget {
    private static final byte[] DATA = new byte[4096];
    private static final int[] FLAGS = new int[256];
    private static final int[] WIDTHS = new int[16];

    static {
        Arrays.fill(DATA, (byte) 1);
        for (int i = 0; i < WIDTHS.length; i++) WIDTHS[i] = i;
    }

    public static void main(String[] args) {
        TestFramework.runWithFlags("--add-modules=jdk.incubator.vector",
                                   "-Djdk.incubator.vector.VECTOR_ACCESS_OOB_CHECK=2");
    }

    @ForceInline
    private static void guard(int[] flags, int index) {
        if (flags[index & 255] < 0) throw new IllegalArgumentException();
    }

    @Test
    @IR(counts = {"RangeCheck.*Objects::checkIndex.*ByteVector::fromArray", ">=1",
                  IRNode.LOAD_VECTOR_B, IRNode.VECTOR_SIZE_16, ">=1"},
        phase = CompilePhase.AFTER_MACRO_EXPANSION,
        applyIfCPUFeatureOr = {"sse2", "true", "asimd", "true"}, applyIf = {"MaxVectorSize", ">=16"})
    public static int deepControl(byte[] data, int limit, int[] widths, int[] flags) {
        int ceiling = data.length - 32;
        int cursor = 0;
        int checksum = 0;
        for (int i = 0; i < widths.length; i++) {
            // Each inlined guard adds an If and its successful projection to
            // the dominator chain. The indices vary with i, preventing loop
            // unswitching. Put them before the cursor guard: the local searches
            // for the update and end guards remain short, while the initial
            // dominance query alone exceeds the shared 192-step proof budget.
            guard(flags, i + 0); guard(flags, i + 1); guard(flags, i + 2); guard(flags, i + 3);
            guard(flags, i + 4); guard(flags, i + 5); guard(flags, i + 6); guard(flags, i + 7);
            guard(flags, i + 8); guard(flags, i + 9); guard(flags, i + 10); guard(flags, i + 11);
            guard(flags, i + 12); guard(flags, i + 13); guard(flags, i + 14); guard(flags, i + 15);
            guard(flags, i + 16); guard(flags, i + 17); guard(flags, i + 18); guard(flags, i + 19);
            guard(flags, i + 20); guard(flags, i + 21); guard(flags, i + 22); guard(flags, i + 23);
            guard(flags, i + 24); guard(flags, i + 25); guard(flags, i + 26); guard(flags, i + 27);
            guard(flags, i + 28); guard(flags, i + 29); guard(flags, i + 30); guard(flags, i + 31);
            guard(flags, i + 32); guard(flags, i + 33); guard(flags, i + 34); guard(flags, i + 35);
            guard(flags, i + 36); guard(flags, i + 37); guard(flags, i + 38); guard(flags, i + 39);
            guard(flags, i + 40); guard(flags, i + 41); guard(flags, i + 42); guard(flags, i + 43);
            guard(flags, i + 44); guard(flags, i + 45); guard(flags, i + 46); guard(flags, i + 47);
            guard(flags, i + 48); guard(flags, i + 49); guard(flags, i + 50); guard(flags, i + 51);
            guard(flags, i + 52); guard(flags, i + 53); guard(flags, i + 54); guard(flags, i + 55);
            guard(flags, i + 56); guard(flags, i + 57); guard(flags, i + 58); guard(flags, i + 59);
            guard(flags, i + 60); guard(flags, i + 61); guard(flags, i + 62); guard(flags, i + 63);
            guard(flags, i + 64); guard(flags, i + 65); guard(flags, i + 66); guard(flags, i + 67);
            guard(flags, i + 68); guard(flags, i + 69); guard(flags, i + 70); guard(flags, i + 71);
            guard(flags, i + 72); guard(flags, i + 73); guard(flags, i + 74); guard(flags, i + 75);
            guard(flags, i + 76); guard(flags, i + 77); guard(flags, i + 78); guard(flags, i + 79);
            guard(flags, i + 80); guard(flags, i + 81); guard(flags, i + 82); guard(flags, i + 83);
            guard(flags, i + 84); guard(flags, i + 85); guard(flags, i + 86); guard(flags, i + 87);
            guard(flags, i + 88); guard(flags, i + 89); guard(flags, i + 90); guard(flags, i + 91);
            guard(flags, i + 92); guard(flags, i + 93); guard(flags, i + 94); guard(flags, i + 95);
            guard(flags, i + 96); guard(flags, i + 97); guard(flags, i + 98); guard(flags, i + 99);
            guard(flags, i + 100); guard(flags, i + 101); guard(flags, i + 102); guard(flags, i + 103);
            guard(flags, i + 104); guard(flags, i + 105); guard(flags, i + 106); guard(flags, i + 107);
            guard(flags, i + 108); guard(flags, i + 109); guard(flags, i + 110); guard(flags, i + 111);
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

    @Run(test = "deepControl")
    @Warmup(200)
    public static void run(RunInfo info) {
        Asserts.assertEquals(deepControl(DATA, 2048, WIDTHS, FLAGS), 120 ^ (16 * WIDTHS.length));
        if (info.isWarmUp()) return;
        Asserts.assertEquals(deepControl(DATA, -1, new int[] {0}, FLAGS), 16);
        int[] flags = FLAGS.clone();
        flags[97] = -1;
        expect(IllegalArgumentException.class, () -> deepControl(DATA, 2048, WIDTHS, flags));
        expect(IllegalArgumentException.class, () -> deepControl(DATA, -1, new int[] {1}, FLAGS));
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
