/*
 * Copyright (c) 2026, Huawei Technologies Co., Ltd. All rights reserved.
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

package compiler.c2.irTests;

import java.util.Arrays;
import java.util.function.LongUnaryOperator;

import compiler.lib.ir_framework.*;
import jdk.incubator.vector.LongVector;
import jdk.incubator.vector.VectorMask;
import jdk.incubator.vector.VectorOperators;
import jdk.incubator.vector.VectorSpecies;
import jdk.test.lib.Asserts;
import jdk.test.lib.Platform;

/*
 * @test
 * @bug 8384963
 * @summary Check vector long multiply reassociation, overflow and masked compound values
 * @requires vm.compiler2.enabled
 * @modules jdk.incubator.vector
 * @library /test/lib /
 * @run driver compiler.c2.irTests.TestLongVectorMultiplyReassociation
 */
public class TestLongVectorMultiplyReassociation {
    private static final VectorSpecies<Long> SPECIES = LongVector.SPECIES_PREFERRED;
    private static final int SIZE = 3033;
    private static final int[] LENGTHS = {0, 1, 3, 7, 15, 16, 17, 31, 32, 33, 63, 65, 127, 3000};
    private static final long[] VALUES = {0, 1, -1, 2, -3, Long.MIN_VALUE, Long.MAX_VALUE,
                                         0x1234_5678_9abc_def0L, 0x7fff_ffffL, 0x1_0000_0001L};
    private static final long[] A = new long[SIZE];
    private static final long[] B = new long[SIZE];
    private static final long[] D = new long[SIZE];
    private static final long[] V = new long[SPECIES.length()];
    private int iteration;

    static {
        for (int i = 0; i < SIZE; i++) {
            A[i] = VALUES[i % VALUES.length];
            B[i] = i * -0x3344_5566_7788L + 0x7fff_0000_1234_5678L;
        }
    }

    public static void main(String[] args) {
        TestFramework framework = new TestFramework();
        framework.addFlags("--add-modules=jdk.incubator.vector");
        if (Platform.isAArch64()) {
            framework.addScenarios(new Scenario(0, "-XX:UseSVE=0", "-XX:MaxVectorSize=16"),
                                   new Scenario(1, "-XX:UseSVE=1", "-XX:MaxVectorSize=16"),
                                   new Scenario(2, "-XX:UseSVE=1", "-XX:MaxVectorSize=32"),
                                   new Scenario(3, "-XX:UseSVE=1", "-XX:MaxVectorSize=64"));
        }
        framework.start();
    }

    @Test
    @IR(applyIfAnd = {"UseSuperWord", "true", "MaxVectorSize", ">= 32"},
        applyIfCPUFeatureOr = {"sve", "true", "avx512dq", "true"},
        counts = {IRNode.MUL_VL, IRNode.VECTOR_SIZE_ANY, ">0"})
    private static void testLoop(int start, int end) {
        for (int i = start; i < end; i++) {
            long x = A[i];
            D[i] = x * x * x * x;
        }
    }

    @Test
    private static void testDifferentLeaves(int start, int end) {
        for (int i = start; i < end; i++) {
            D[i] = A[i] * A[i] * A[i] * B[i];
        }
    }

    @Test
    @IR(applyIf = {"MaxVectorSize", ">= 32"},
        applyIfCPUFeatureOr = {"sve", "true", "avx512dq", "true"},
        counts = {IRNode.MUL_VL, IRNode.VECTOR_SIZE_ANY, "2"})
    private static void testVectorChain(int offset) {
        LongVector x = LongVector.fromArray(SPECIES, A, offset);
        x.mul(x).mul(x).mul(x).intoArray(V, 0);
    }

    @Test
    @IR(applyIf = {"MaxVectorSize", ">= 32"},
        applyIfCPUFeatureOr = {"sve", "true", "avx512dq", "true"},
        counts = {IRNode.MUL_VL, IRNode.VECTOR_SIZE_ANY, "2"})
    private static void testVectorRightChain(int offset) {
        LongVector x = LongVector.fromArray(SPECIES, A, offset);
        x.mul(x.mul(x.mul(x))).intoArray(V, 0);
    }

    @Test
    @IR(applyIf = {"MaxVectorSize", ">= 32"},
        applyIfCPUFeatureOr = {"sve", "true", "avx512dq", "true"},
        counts = {IRNode.MUL_VL, IRNode.VECTOR_SIZE_ANY, "3"})
    private static void testCompoundValue(int offset) {
        LongVector x = LongVector.fromArray(SPECIES, A, offset);
        LongVector y = LongVector.fromArray(SPECIES, B, offset);
        LongVector value = x.mul(y);
        value.mul(value).mul(value).mul(value).intoArray(V, 0);
    }

    @Test
    private static void testMaskedValue(int offset, long bits) {
        LongVector x = LongVector.fromArray(SPECIES, A, offset);
        LongVector value = x.mul(x, VectorMask.fromLong(SPECIES, bits));
        value.mul(value).mul(value).mul(value).intoArray(V, 0);
    }

    @Test
    private static void testNegativeAndValue(int offset) {
        LongVector value = LongVector.fromArray(SPECIES, A, offset).and(-2L);
        value.mul(value).mul(value).mul(value).intoArray(V, 0);
    }

    @Test
    private static void testMaskedAndValue(int offset, long bits) {
        LongVector x = LongVector.fromArray(SPECIES, A, offset);
        LongVector value = x.lanewise(VectorOperators.AND, 0xffff_ffffL, VectorMask.fromLong(SPECIES, bits));
        value.mul(value).mul(value).mul(value).intoArray(V, 0);
    }

    @Test
    private static void testMaskedUnsignedShiftValue(int offset, long bits) {
        LongVector x = LongVector.fromArray(SPECIES, A, offset);
        LongVector value = x.lanewise(VectorOperators.LSHR, 32, VectorMask.fromLong(SPECIES, bits));
        value.mul(value).mul(value).mul(value).intoArray(V, 0);
    }

    @Test
    private static void testMaskedSignedShiftValue(int offset, long bits) {
        LongVector x = LongVector.fromArray(SPECIES, A, offset);
        LongVector value = x.lanewise(VectorOperators.ASHR, 32, VectorMask.fromLong(SPECIES, bits));
        value.mul(value).mul(value).mul(value).intoArray(V, 0);
    }

    @Test
    private static void testVectorDifferentLeaves(int offset) {
        LongVector x = LongVector.fromArray(SPECIES, A, offset);
        LongVector y = LongVector.fromArray(SPECIES, B, offset);
        x.mul(x).mul(x).mul(y).intoArray(V, 0);
    }

    @Test
    private static void testTwoSquares(int offset) {
        LongVector x = LongVector.fromArray(SPECIES, A, offset);
        LongVector y = LongVector.fromArray(SPECIES, B, offset);
        x.mul(x).mul(y.mul(y)).intoArray(V, 0);
    }

    @Test
    private static void testThreeFactors(int offset) {
        LongVector x = LongVector.fromArray(SPECIES, A, offset);
        x.mul(x).mul(x).intoArray(V, 0);
    }

    @Test
    private static void testFiveFactors(int offset) {
        LongVector x = LongVector.fromArray(SPECIES, A, offset);
        x.mul(x).mul(x).mul(x).mul(x).intoArray(V, 0);
    }

    @Test
    private static void testMaskedChild(int offset, long bits) {
        LongVector x = LongVector.fromArray(SPECIES, A, offset);
        VectorMask<Long> mask = VectorMask.fromLong(SPECIES, bits);
        x.mul(x, mask).mul(x).mul(x).intoArray(V, 0);
    }

    @Test
    private static void testMaskedMiddle(int offset, long bits) {
        LongVector x = LongVector.fromArray(SPECIES, A, offset);
        VectorMask<Long> mask = VectorMask.fromLong(SPECIES, bits);
        x.mul(x).mul(x, mask).mul(x).intoArray(V, 0);
    }

    @Test
    private static void testMaskedRoot(int offset, long bits) {
        LongVector x = LongVector.fromArray(SPECIES, A, offset);
        VectorMask<Long> mask = VectorMask.fromLong(SPECIES, bits);
        x.mul(x).mul(x).mul(x, mask).intoArray(V, 0);
    }

    @Test
    private static void testTwoMaskedChildren(int offset, long bits) {
        LongVector x = LongVector.fromArray(SPECIES, A, offset);
        VectorMask<Long> mask = VectorMask.fromLong(SPECIES, bits);
        x.mul(x, mask).mul(x.mul(x, mask.not())).intoArray(V, 0);
    }

    @Run(test = {"testLoop", "testDifferentLeaves", "testVectorChain", "testVectorRightChain",
                 "testCompoundValue", "testMaskedValue", "testNegativeAndValue", "testMaskedAndValue",
                 "testMaskedUnsignedShiftValue", "testMaskedSignedShiftValue", "testVectorDifferentLeaves",
                 "testTwoSquares", "testThreeFactors", "testFiveFactors",
                 "testMaskedChild", "testMaskedMiddle", "testMaskedRoot", "testTwoMaskedChildren"})
    private void run(RunInfo info) {
        if (info.isWarmUp()) {
            check(iteration++ % (LENGTHS.length * 4), true);
        } else {
            for (int i = 0; i < LENGTHS.length * 4; i++) {
                check(i, false);
            }
        }
    }

    private static void check(int id, boolean warmup) {
        int start = id % 4;
        int end = start + LENGTHS[id / 4];
        Arrays.fill(D, 42);
        testLoop(start, end);
        for (int i = 0; i < SIZE; i++) {
            long x = A[i];
            Asserts.assertEquals(D[i], i >= start && i < end ? x * x * x * x : 42);
        }
        Arrays.fill(D, 42);
        testDifferentLeaves(start, end);
        for (int i = 0; i < SIZE; i++) {
            long x = A[i];
            Asserts.assertEquals(D[i], i >= start && i < end ? x * x * x * B[i] : 42);
        }
        int firstOffset = warmup ? id % VALUES.length : 0;
        int lastOffset = warmup ? firstOffset + 1 : VALUES.length;
        for (int offset = firstOffset; offset < lastOffset; offset++) {
            testVectorChain(offset);
            checkVector(offset, 4, false);
            testVectorRightChain(offset);
            checkVector(offset, 4, false);
            testCompoundValue(offset);
            for (int lane = 0; lane < SPECIES.length(); lane++) {
                long value = A[offset + lane] * B[offset + lane];
                Asserts.assertEquals(V[lane], value * value * value * value);
            }
            testNegativeAndValue(offset);
            for (int lane = 0; lane < SPECIES.length(); lane++) {
                long value = A[offset + lane] & -2L;
                Asserts.assertEquals(V[lane], value * value * value * value);
            }
            testVectorDifferentLeaves(offset);
            checkVector(offset, 3, true);
            testTwoSquares(offset);
            for (int lane = 0; lane < SPECIES.length(); lane++) {
                long x = A[offset + lane], y = B[offset + lane];
                Asserts.assertEquals(V[lane], (x * x) * (y * y));
            }
            testThreeFactors(offset);
            checkVector(offset, 3, false);
            testFiveFactors(offset);
            checkVector(offset, 5, false);
            for (long bits : new long[] {0, -1, 0x5, 0xa}) {
                testMaskedValue(offset, bits);
                for (int lane = 0; lane < SPECIES.length(); lane++) {
                    long x = A[offset + lane];
                    long value = (bits & (1L << lane)) != 0 ? x * x : x;
                    Asserts.assertEquals(V[lane], value * value * value * value);
                }
                testMaskedAndValue(offset, bits);
                checkMaskedValue(offset, bits, x -> x & 0xffff_ffffL);
                testMaskedUnsignedShiftValue(offset, bits);
                checkMaskedValue(offset, bits, x -> x >>> 32);
                testMaskedSignedShiftValue(offset, bits);
                checkMaskedValue(offset, bits, x -> x >> 32);
                testMaskedChild(offset, bits);
                checkMasked(offset, bits);
                testMaskedMiddle(offset, bits);
                checkMasked(offset, bits);
                testMaskedRoot(offset, bits);
                checkMasked(offset, bits);
                testTwoMaskedChildren(offset, bits);
                checkVector(offset, 3, false);
            }
        }
    }

    private static void checkVector(int offset, int factors, boolean differentLast) {
        for (int lane = 0; lane < SPECIES.length(); lane++) {
            long x = A[offset + lane];
            long expected = 1;
            for (int k = 0; k < factors; k++) {
                expected *= x;
            }
            if (differentLast) {
                expected *= B[offset + lane];
            }
            Asserts.assertEquals(V[lane], expected);
        }
    }

    private static void checkMaskedValue(int offset, long bits, LongUnaryOperator operation) {
        for (int lane = 0; lane < SPECIES.length(); lane++) {
            long x = A[offset + lane];
            long value = (bits & (1L << lane)) == 0 ? x : operation.applyAsLong(x);
            Asserts.assertEquals(V[lane], value * value * value * value);
        }
    }

    private static void checkMasked(int offset, long bits) {
        for (int lane = 0; lane < SPECIES.length(); lane++) {
            long x = A[offset + lane];
            boolean active = (bits & (1L << lane)) != 0;
            long expected = x * x * x;
            if (active) {
                expected *= x;
            }
            Asserts.assertEquals(V[lane], expected);
        }
    }
}
