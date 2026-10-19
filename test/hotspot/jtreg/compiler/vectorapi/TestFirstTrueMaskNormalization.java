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

/*
 * @test
 * @summary Fold boolean-byte normalization into NEON firstTrue mask queries.
 * @requires (os.arch == "aarch64") & vm.compiler2.enabled
 * @library /test/lib /
 * @modules jdk.incubator.vector
 * @run driver compiler.vectorapi.TestFirstTrueMaskNormalization
 */
package compiler.vectorapi;

import compiler.lib.ir_framework.*;
import jdk.incubator.vector.*;
import jdk.test.lib.Asserts;

public class TestFirstTrueMaskNormalization {
    private static final String FUSED = "\\bvstoremask_firsttrueB_neon\\b";
    private static final String UNFUSED = "\\b(?:vstoremaskB_neon|vstoremask_narrow_neon|vmask_firsttrue_neon)\\b";
    private static final String NARROW = "\\bvstoremask_narrow_neon\\b";
    private static final String NORMALIZE_BYTE = "\\bvstoremaskB_neon\\b";
    private static final String FIRST_TRUE = "\\bvmask_firsttrue_neon\\b";
    private static final byte[] BA = new byte[16], BB = new byte[16];
    private static final short[] SA = new short[8], SB = new short[8];
    private static final int[] IA = new int[4], IB = new int[4];
    private static final long[] LA = new long[2], LB = new long[2];
    private static final float[] FA = new float[4], FB = new float[4];
    private static final double[] DA = new double[2], DB = new double[2];
    private static final boolean[] STORED = new boolean[16];
    private static int iteration;

    public static void main(String[] args) {
        new TestFramework().addFlags("--add-modules=jdk.incubator.vector", "-XX:UseSVE=0").start();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_FIRST_TRUE, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(phase = CompilePhase.MATCHING, counts = {FUSED, "1"}, failOn = {UNFUSED})
    public static int byte64() {
        return ByteVector.fromArray(ByteVector.SPECIES_64, BA, 0)
                .compare(VectorOperators.NE, ByteVector.fromArray(ByteVector.SPECIES_64, BB, 0))
                .firstTrue();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_FIRST_TRUE, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(phase = CompilePhase.MATCHING, counts = {FUSED, "1"}, failOn = {UNFUSED})
    public static int byte128() {
        return ByteVector.fromArray(ByteVector.SPECIES_128, BA, 0)
                .compare(VectorOperators.NE, ByteVector.fromArray(ByteVector.SPECIES_128, BB, 0))
                .firstTrue();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_FIRST_TRUE, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(phase = CompilePhase.MATCHING, counts = {NARROW, "1", FIRST_TRUE, "1"}, failOn = {FUSED})
    public static int short64() {
        return ShortVector.fromArray(ShortVector.SPECIES_64, SA, 0)
                .compare(VectorOperators.NE, ShortVector.fromArray(ShortVector.SPECIES_64, SB, 0))
                .firstTrue();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_FIRST_TRUE, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(phase = CompilePhase.MATCHING, counts = {NARROW, "1", FIRST_TRUE, "1"}, failOn = {FUSED})
    public static int short128() {
        return ShortVector.fromArray(ShortVector.SPECIES_128, SA, 0)
                .compare(VectorOperators.NE, ShortVector.fromArray(ShortVector.SPECIES_128, SB, 0))
                .firstTrue();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_FIRST_TRUE, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(phase = CompilePhase.MATCHING, counts = {NARROW, "1", FIRST_TRUE, "1"}, failOn = {FUSED})
    public static int int64() {
        return IntVector.fromArray(IntVector.SPECIES_64, IA, 0)
                .compare(VectorOperators.NE, IntVector.fromArray(IntVector.SPECIES_64, IB, 0))
                .firstTrue();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_FIRST_TRUE, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(phase = CompilePhase.MATCHING, counts = {NARROW, "1", FIRST_TRUE, "1"}, failOn = {FUSED})
    public static int int128() {
        return IntVector.fromArray(IntVector.SPECIES_128, IA, 0)
                .compare(VectorOperators.NE, IntVector.fromArray(IntVector.SPECIES_128, IB, 0))
                .firstTrue();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_FIRST_TRUE, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(phase = CompilePhase.MATCHING, counts = {NARROW, "1", FIRST_TRUE, "1"}, failOn = {FUSED})
    public static int long128() {
        return LongVector.fromArray(LongVector.SPECIES_128, LA, 0)
                .compare(VectorOperators.NE, LongVector.fromArray(LongVector.SPECIES_128, LB, 0))
                .firstTrue();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_FIRST_TRUE, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(phase = CompilePhase.MATCHING, counts = {NARROW, "1", FIRST_TRUE, "1"}, failOn = {FUSED})
    public static int float64() {
        return FloatVector.fromArray(FloatVector.SPECIES_64, FA, 0)
                .compare(VectorOperators.NE, FloatVector.fromArray(FloatVector.SPECIES_64, FB, 0))
                .firstTrue();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_FIRST_TRUE, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(phase = CompilePhase.MATCHING, counts = {NARROW, "1", FIRST_TRUE, "1"}, failOn = {FUSED})
    public static int float128() {
        return FloatVector.fromArray(FloatVector.SPECIES_128, FA, 0)
                .compare(VectorOperators.NE, FloatVector.fromArray(FloatVector.SPECIES_128, FB, 0))
                .firstTrue();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_FIRST_TRUE, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(phase = CompilePhase.MATCHING, counts = {NARROW, "1", FIRST_TRUE, "1"}, failOn = {FUSED})
    public static int double128() {
        return DoubleVector.fromArray(DoubleVector.SPECIES_128, DA, 0)
                .compare(VectorOperators.NE, DoubleVector.fromArray(DoubleVector.SPECIES_128, DB, 0))
                .firstTrue();
    }

    // Shared normalization must remain available for another consumer.
    @Test(compLevel = CompLevel.C2)
    @IR(phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_FIRST_TRUE, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(phase = CompilePhase.MATCHING, counts = {NORMALIZE_BYTE, "1", FIRST_TRUE, "1"}, failOn = {FUSED})
    public static int shared() {
        var mask = ByteVector.fromArray(ByteVector.SPECIES_128, BA, 0)
                .compare(VectorOperators.NE, ByteVector.fromArray(ByteVector.SPECIES_128, BB, 0));
        mask.intoArray(STORED, 0);
        return mask.firstTrue();
    }

    @Run(test = {"byte64", "byte128", "short64", "short128", "int64", "int128", "long128", "float64", "float128", "double128", "shared"})
    public static void run(RunInfo info) {
        check(iteration++ & 65535);
        if (!info.isWarmUp()) {
            for (String name : new String[] {"byte64", "byte128", "short64", "short128", "int64", "int128", "long128", "float64", "float128", "double128", "shared"}) {
                // Honor framework modes that intentionally exclude compilation.
                TestFramework.assertCompiledByC2(info.getTest(name));
            }
            for (int mask = 0; mask <= 65535; mask++) check(mask);
            checkFloatingPointEdges();
        }
    }

    public static void check(int mask) {
        for (int i = 0; i < BB.length; i++) BB[i] = (byte)((mask >>> i) & 1);
        for (int i = 0; i < SB.length; i++) SB[i] = (short)((mask >>> i) & 1);
        for (int i = 0; i < IB.length; i++) IB[i] = (int)((mask >>> i) & 1);
        for (int i = 0; i < LB.length; i++) LB[i] = (long)((mask >>> i) & 1);
        for (int i = 0; i < FB.length; i++) { FA[i] = 0; FB[i] = (float)((mask >>> i) & 1); }
        for (int i = 0; i < DB.length; i++) { DA[i] = 0; DB[i] = (double)((mask >>> i) & 1); }
        Asserts.assertEQ(byte64(), Math.min(8, Integer.numberOfTrailingZeros(mask & 255)), "byte64");
        Asserts.assertEQ(byte128(), Math.min(16, Integer.numberOfTrailingZeros(mask & 65535)), "byte128");
        Asserts.assertEQ(short64(), Math.min(4, Integer.numberOfTrailingZeros(mask & 15)), "short64");
        Asserts.assertEQ(short128(), Math.min(8, Integer.numberOfTrailingZeros(mask & 255)), "short128");
        Asserts.assertEQ(int64(), Math.min(2, Integer.numberOfTrailingZeros(mask & 3)), "int64");
        Asserts.assertEQ(int128(), Math.min(4, Integer.numberOfTrailingZeros(mask & 15)), "int128");
        Asserts.assertEQ(long128(), Math.min(2, Integer.numberOfTrailingZeros(mask & 3)), "long128");
        Asserts.assertEQ(float64(), Math.min(2, Integer.numberOfTrailingZeros(mask & 3)), "float64");
        Asserts.assertEQ(float128(), Math.min(4, Integer.numberOfTrailingZeros(mask & 15)), "float128");
        Asserts.assertEQ(double128(), Math.min(2, Integer.numberOfTrailingZeros(mask & 3)), "double128");
        Asserts.assertEQ(shared(), Math.min(16, Integer.numberOfTrailingZeros(mask)), "shared");
        for (int lane = 0; lane < 16; lane++) {
            Asserts.assertEQ(STORED[lane], ((mask >>> lane) & 1) != 0, "stored mask");
        }
    }

    public static void checkFloatingPointEdges() {
        float[] fs = {Float.NaN, Float.NEGATIVE_INFINITY, Float.POSITIVE_INFINITY, -0.0f, 0.0f};
        double[] ds = {Double.NaN, Double.NEGATIVE_INFINITY, Double.POSITIVE_INFINITY, -0.0, 0.0};
        for (int p = 0; p < fs.length; p++) for (int q = 0; q < fs.length; q++) {
            for (int i = 0; i < 4; i++) { FA[i] = fs[(p + i) % fs.length]; FB[i] = fs[(q + i) % fs.length]; }
            for (int i = 0; i < 2; i++) { DA[i] = ds[(p + i) % ds.length]; DB[i] = ds[(q + i) % ds.length]; }
            int f64 = 2, f128 = 4, d128 = 2;
            for (int i = 3; i >= 0; i--) if (FA[i] != FB[i]) { f128 = i; if (i < 2) f64 = i; }
            for (int i = 1; i >= 0; i--) if (DA[i] != DB[i]) d128 = i;
            Asserts.assertEQ(float64(), f64, "float64 edge");
            Asserts.assertEQ(float128(), f128, "float128 edge");
            Asserts.assertEQ(double128(), d128, "double128 edge");
        }
    }
}
