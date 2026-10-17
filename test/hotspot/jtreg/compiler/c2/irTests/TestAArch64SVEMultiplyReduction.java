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

import compiler.lib.ir_framework.*;
import jdk.incubator.vector.IntVector;
import jdk.incubator.vector.LongVector;
import jdk.incubator.vector.VectorOperators;
import jdk.test.lib.Asserts;
import jdk.test.lib.Platform;

/*
 * @test
 * @summary Check SVE integer multiply reductions and short-vector fallbacks.
 * @requires vm.compiler2.enabled
 * @modules jdk.incubator.vector
 * @library /test/lib /
 * @run driver/timeout=480 compiler.c2.irTests.TestAArch64SVEMultiplyReduction
 */
public class TestAArch64SVEMultiplyReduction {
    private static final int SIZE = 2048;
    private static final int[] LENGTHS = {0, 1, 2, 3, 4, 7, 8, 15, 16, 17, 31, 32, 33,
                                          63, 64, 65, 127, 128, 129, 1023, 1024, 1027};
    private static final long[] INITIAL = {0, 1, -1, 17, Integer.MIN_VALUE, Integer.MAX_VALUE,
                                           Long.MIN_VALUE, Long.MAX_VALUE};
    private static final int[] INTS = new int[SIZE];
    private static final long[] LONGS = new long[SIZE];

    public static void main(String[] args) {
        TestFramework framework = new TestFramework().setDefaultWarmup(1000);
        framework.addFlags("--add-modules=jdk.incubator.vector");
        framework.addFlags("-XX:+SuperWordReductions", "-XX:LoopMaxUnroll=8",
                           "-XX:LoopUnrollLimit=250");
        if (Platform.isAArch64()) {
            // Unsupported requested lengths are capped by the VM; IR checks use
            // the final flags, so a 128-bit SVE host still tests its fallback.
            framework.addScenarios(new Scenario(0, "-XX:UseSVE=0", "-XX:MaxVectorSize=16"),
                                   new Scenario(1, "-XX:UseSVE=1", "-XX:MaxVectorSize=16"),
                                   new Scenario(2, "-XX:UseSVE=1", "-XX:MaxVectorSize=32"),
                                   new Scenario(3, "-XX:UseSVE=1", "-XX:MaxVectorSize=64",
                                               "-XX:LoopMaxUnroll=16"));
        }
        framework.start();
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"},
        applyIfAnd = {"UseSVE", "> 0", "MaxVectorSize", "> 16"},
        counts = {"reduce_mulI_sve", ">0"}, phase = CompilePhase.MATCHING)
    public static int testIntMulReduction(int from, int length, int initial) {
        int acc = initial;
        for (int i = from; i < from + length; i++) {
            acc *= INTS[i];
        }
        return acc;
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"},
        applyIfAnd = {"UseSVE", "> 0", "MaxVectorSize", "> 16"},
        counts = {"reduce_mulL_sve", ">0"}, phase = CompilePhase.MATCHING)
    public static long testLongMulReduction(int from, int length, long initial) {
        long acc = initial;
        for (int i = from; i < from + length; i++) {
            acc *= LONGS[i];
        }
        return acc;
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"},
        applyIfAnd = {"UseSVE", "> 0", "MaxVectorSize", "> 16"},
        counts = {"reduce_mulI_sve", ">0"}, phase = CompilePhase.MATCHING)
    public static int testIntVector(int offset) {
        return IntVector.fromArray(IntVector.SPECIES_PREFERRED, INTS, offset)
                        .reduceLanes(VectorOperators.MUL);
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"},
        applyIfAnd = {"UseSVE", "> 0", "MaxVectorSize", "> 16"},
        counts = {"reduce_mulL_sve", ">0"}, phase = CompilePhase.MATCHING)
    public static long testLongVector(int offset) {
        return LongVector.fromArray(LongVector.SPECIES_PREFERRED, LONGS, offset)
                         .reduceLanes(VectorOperators.MUL);
    }

    @Test
    public static int testIntMaskedVector(int offset, int active) {
        return IntVector.fromArray(IntVector.SPECIES_PREFERRED, INTS, offset)
                        .reduceLanes(VectorOperators.MUL, IntVector.SPECIES_PREFERRED.indexInRange(0, active));
    }

    @Test
    public static long testLongMaskedVector(int offset, int active) {
        return LongVector.fromArray(LongVector.SPECIES_PREFERRED, LONGS, offset)
                         .reduceLanes(VectorOperators.MUL, LongVector.SPECIES_PREFERRED.indexInRange(0, active));
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"}, failOn = {"reduce_mulI_sve"},
        phase = CompilePhase.MATCHING)
    public static int testIntShortVector(int offset) {
        return IntVector.fromArray(IntVector.SPECIES_128, INTS, offset)
                        .reduceLanes(VectorOperators.MUL);
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"}, failOn = {"reduce_mulL_sve"},
        phase = CompilePhase.MATCHING)
    public static long testLongShortVector(int offset) {
        return LongVector.fromArray(LongVector.SPECIES_128, LONGS, offset)
                         .reduceLanes(VectorOperators.MUL);
    }

    @Run(test = {"testIntMulReduction", "testLongMulReduction", "testIntVector",
                 "testLongVector", "testIntShortVector", "testLongShortVector",
                 "testIntMaskedVector", "testLongMaskedVector"})
    public void run(RunInfo info) {
        if (info.isWarmUp()) {
            fill(0);
            check(3, 1027, 17);
        } else {
            for (int pattern = 0; pattern < 5; pattern++) {
                fill(pattern);
                for (int from : new int[] {0, 1, 3, 16}) {
                    for (int length : LENGTHS) {
                        for (long initial : INITIAL) {
                            check(from, length, initial);
                        }
                    }
                }
            }
        }
    }

    private static void fill(int pattern) {
        for (int i = 0; i < SIZE; i++) {
            long v = switch (pattern) {
                case 0 -> (i % 7) * 2L + 1; // odd products stay nonzero after overflow
                case 1 -> -((i % 5) * 2L + 1);
                case 2 -> (i % 13 == 0) ? 0 : 3;
                case 3 -> (i & 1) == 0 ? Long.MIN_VALUE : Long.MAX_VALUE;
                default -> (i & 1) == 0 ? 0x7fff_ffffL : 0x8000_0001L;
            };
            INTS[i] = (int) v;
            LONGS[i] = v;
        }
    }

    private static void check(int from, int length, long initial) {
        Asserts.assertEQ(testIntMulReduction(from, length, (int) initial),
                         expectedInt(from, length, (int) initial));
        Asserts.assertEQ(testLongMulReduction(from, length, initial),
                         expectedLong(from, length, initial));
        Asserts.assertEQ(testIntVector(from),
                         expectedInt(from, IntVector.SPECIES_PREFERRED.length(), 1));
        Asserts.assertEQ(testLongVector(from),
                         expectedLong(from, LongVector.SPECIES_PREFERRED.length(), 1));
        Asserts.assertEQ(testIntShortVector(from), expectedInt(from, 4, 1));
        Asserts.assertEQ(testLongShortVector(from), expectedLong(from, 2, 1));
        int activeInts = Math.min(length, IntVector.SPECIES_PREFERRED.length());
        int activeLongs = Math.min(length, LongVector.SPECIES_PREFERRED.length());
        Asserts.assertEQ(testIntMaskedVector(from, activeInts), expectedInt(from, activeInts, 1));
        Asserts.assertEQ(testLongMaskedVector(from, activeLongs), expectedLong(from, activeLongs, 1));
    }

    @DontCompile
    private static int expectedInt(int from, int length, int initial) {
        int acc = initial;
        for (int i = from; i < from + length; i++) {
            acc *= INTS[i];
        }
        return acc;
    }

    @DontCompile
    private static long expectedLong(int from, int length, long initial) {
        long acc = initial;
        for (int i = from; i < from + length; i++) {
            acc *= LONGS[i];
        }
        return acc;
    }
}
