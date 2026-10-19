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
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
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
 * @summary Pack raw NEON byte128 comparison masks directly into a long.
 * @requires vm.compiler2.enabled
 * @library /test/lib /
 * @modules jdk.incubator.vector
 * @run driver compiler.c2.aarch64.TestByteMaskToLong
 */
package compiler.c2.aarch64;

import compiler.lib.ir_framework.*;
import jdk.incubator.vector.*;
import jdk.test.lib.Asserts;
import jdk.test.lib.Platform;

public class TestByteMaskToLong {
    private static final String FUSED = "\\bvstoremask_tolongB16_neon\\b";
    private static final String NORMALIZE = "\\bvstoremaskB_neon\\b";
    private static final String NARROW = "\\bvstoremask_narrow_neon\\b";
    private static final String TO_LONG = "\\bvmask_tolong_neon\\b";
    private static final String SVE_TO_LONG = "\\bvmask_tolong_sve(?:2)?\\b";
    private static final byte[] A = new byte[16], B = new byte[16];
    private static final byte[] C = new byte[16], D = new byte[16];
    private static final byte[] BLOCK_A = new byte[64], BLOCK_B = new byte[64];
    private static final boolean[] BOOLS = new boolean[16], STORED = new boolean[16];
    private static final short[] SA = new short[8], SB = new short[8];
    private static final int[] IA = new int[4], IB = new int[4];
    private static final long[] LA = new long[2], LB = new long[2];
    private static final float[] FA = new float[4], FB = new float[4];
    private static final double[] DA = new double[2], DB = new double[2];
    private static int iteration;

    public static void main(String[] args) {
        TestFramework framework = new TestFramework().addFlags("--add-modules=jdk.incubator.vector");
        if (Platform.isAArch64()) {
            framework.addFlags("-XX:UseSVE=0", "-XX:MaxVectorSize=16");
        }
        framework.start();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_TO_LONG, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.MATCHING, counts = {FUSED, "1"}, failOn = {NORMALIZE, TO_LONG})
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "> 0"},
        phase = CompilePhase.MATCHING, counts = {SVE_TO_LONG, "1"}, failOn = {FUSED})
    public static long byte128() {
        return ByteVector.fromArray(ByteVector.SPECIES_128, A, 0)
                .compare(VectorOperators.NE, ByteVector.fromArray(ByteVector.SPECIES_128, B, 0)).toLong();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_TO_LONG, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.MATCHING, counts = {NORMALIZE, "1", TO_LONG, "1"}, failOn = {FUSED})
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "> 0"},
        phase = CompilePhase.MATCHING, counts = {SVE_TO_LONG, "1"}, failOn = {FUSED})
    public static long byte64() {
        return ByteVector.fromArray(ByteVector.SPECIES_64, A, 0)
                .compare(VectorOperators.NE, ByteVector.fromArray(ByteVector.SPECIES_64, B, 0)).toLong();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_TO_LONG, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.MATCHING, counts = {FUSED, "1"}, failOn = {NORMALIZE, TO_LONG})
    public static long unsigned128() {
        return ByteVector.fromArray(ByteVector.SPECIES_128, A, 0)
                .compare(VectorOperators.ULE, ByteVector.fromArray(ByteVector.SPECIES_128, B, 0)).toLong();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_TO_LONG, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.MATCHING, counts = {FUSED, "1"}, failOn = {NORMALIZE, TO_LONG})
    public static long and128() {
        return ByteVector.fromArray(ByteVector.SPECIES_128, A, 0).compare(VectorOperators.NE,
                ByteVector.fromArray(ByteVector.SPECIES_128, B, 0)).and(
                ByteVector.fromArray(ByteVector.SPECIES_128, C, 0).compare(VectorOperators.LT,
                ByteVector.fromArray(ByteVector.SPECIES_128, D, 0))).toLong();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_TO_LONG, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.MATCHING, counts = {FUSED, "1"}, failOn = {NORMALIZE, TO_LONG})
    public static long or128() {
        return ByteVector.fromArray(ByteVector.SPECIES_128, A, 0).compare(VectorOperators.NE,
                ByteVector.fromArray(ByteVector.SPECIES_128, B, 0)).or(
                ByteVector.fromArray(ByteVector.SPECIES_128, C, 0).compare(VectorOperators.LT,
                ByteVector.fromArray(ByteVector.SPECIES_128, D, 0))).toLong();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_TO_LONG, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.MATCHING, counts = {FUSED, "1"}, failOn = {NORMALIZE, TO_LONG})
    public static long xor128() {
        return ByteVector.fromArray(ByteVector.SPECIES_128, A, 0).compare(VectorOperators.NE,
                ByteVector.fromArray(ByteVector.SPECIES_128, B, 0)).xor(
                ByteVector.fromArray(ByteVector.SPECIES_128, C, 0).compare(VectorOperators.LT,
                ByteVector.fromArray(ByteVector.SPECIES_128, D, 0))).toLong();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_TO_LONG, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.MATCHING, counts = {FUSED, "1"}, failOn = {NORMALIZE, TO_LONG})
    public static long not128() {
        return ByteVector.fromArray(ByteVector.SPECIES_128, A, 0)
                .compare(VectorOperators.NE, ByteVector.fromArray(ByteVector.SPECIES_128, B, 0)).not().toLong();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_TO_LONG, "4", IRNode.VECTOR_STORE_MASK, "4"})
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.MATCHING, counts = {FUSED, "4"}, failOn = {NORMALIZE, TO_LONG})
    public static long block64() {
        long m0 = ByteVector.fromArray(ByteVector.SPECIES_128, BLOCK_A, 0)
                .compare(VectorOperators.NE, ByteVector.fromArray(ByteVector.SPECIES_128, BLOCK_B, 0)).toLong();
        long m1 = ByteVector.fromArray(ByteVector.SPECIES_128, BLOCK_A, 16)
                .compare(VectorOperators.NE, ByteVector.fromArray(ByteVector.SPECIES_128, BLOCK_B, 16)).toLong();
        long m2 = ByteVector.fromArray(ByteVector.SPECIES_128, BLOCK_A, 32)
                .compare(VectorOperators.NE, ByteVector.fromArray(ByteVector.SPECIES_128, BLOCK_B, 32)).toLong();
        long m3 = ByteVector.fromArray(ByteVector.SPECIES_128, BLOCK_A, 48)
                .compare(VectorOperators.NE, ByteVector.fromArray(ByteVector.SPECIES_128, BLOCK_B, 48)).toLong();
        return m0 | (m1 << 16) | (m2 << 32) | (m3 << 48);
    }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_TO_LONG, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.MATCHING, counts = {NORMALIZE, "1", TO_LONG, "1"}, failOn = {FUSED})
    public static long shared128() {
        var mask = ByteVector.fromArray(ByteVector.SPECIES_128, A, 0)
                .compare(VectorOperators.NE, ByteVector.fromArray(ByteVector.SPECIES_128, B, 0));
        mask.intoArray(STORED, 0);
        return mask.toLong();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_TO_LONG, "1"}, failOn = {IRNode.VECTOR_STORE_MASK})
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.MATCHING, counts = {TO_LONG, "1"}, failOn = {FUSED, NORMALIZE})
    public static long normalized128() {
        return VectorMask.fromArray(ByteVector.SPECIES_128, BOOLS, 0).toLong();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_TO_LONG, "1"}, failOn = {IRNode.VECTOR_STORE_MASK})
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.MATCHING, counts = {TO_LONG, "1"}, failOn = {FUSED, NORMALIZE})
    public static long normalized64() {
        return VectorMask.fromArray(ByteVector.SPECIES_64, BOOLS, 0).toLong();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_TO_LONG, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.MATCHING, counts = {NARROW, "1", TO_LONG, "1"}, failOn = {FUSED})
    public static long short128() {
        return ShortVector.fromArray(ShortVector.SPECIES_128, SA, 0)
                .compare(VectorOperators.NE, ShortVector.fromArray(ShortVector.SPECIES_128, SB, 0)).toLong();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_TO_LONG, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.MATCHING, counts = {NARROW, "1", TO_LONG, "1"}, failOn = {FUSED})
    public static long int128() {
        return IntVector.fromArray(IntVector.SPECIES_128, IA, 0)
                .compare(VectorOperators.NE, IntVector.fromArray(IntVector.SPECIES_128, IB, 0)).toLong();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_TO_LONG, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.MATCHING, counts = {NARROW, "1", TO_LONG, "1"}, failOn = {FUSED})
    public static long long128() {
        return LongVector.fromArray(LongVector.SPECIES_128, LA, 0)
                .compare(VectorOperators.NE, LongVector.fromArray(LongVector.SPECIES_128, LB, 0)).toLong();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_TO_LONG, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.MATCHING, counts = {NARROW, "1", TO_LONG, "1"}, failOn = {FUSED})
    public static long float128() {
        return FloatVector.fromArray(FloatVector.SPECIES_128, FA, 0)
                .compare(VectorOperators.NE, FloatVector.fromArray(FloatVector.SPECIES_128, FB, 0)).toLong();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.VECTOR_MASK_TO_LONG, "1", IRNode.VECTOR_STORE_MASK, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIf = {"UseSVE", "0"},
        phase = CompilePhase.MATCHING, counts = {NARROW, "1", TO_LONG, "1"}, failOn = {FUSED})
    public static long double128() {
        return DoubleVector.fromArray(DoubleVector.SPECIES_128, DA, 0)
                .compare(VectorOperators.NE, DoubleVector.fromArray(DoubleVector.SPECIES_128, DB, 0)).toLong();
    }

    @Run(test = {"byte128", "byte64", "unsigned128", "and128", "or128", "xor128", "not128",
                 "block64", "shared128", "normalized128", "normalized64", "short128", "int128",
                 "long128", "float128", "double128"})
    public static void run(RunInfo info) {
        check(iteration++ & 65535);
        if (!info.isWarmUp()) {
            assertCompiled(info);
            // This also exhausts all 256 low-byte patterns for byte64.
            // Zero, all, alternating and every single-bit byte128 mask occur here.
            for (int mask = 0; mask < 65536; mask++) check(mask);
            checkBlockEdges();
            checkFloatingPointEdges();
            // New inputs can deoptimize a compiled test. Check all targets
            // again after every exhaustive and edge-case oracle has run.
            assertCompiled(info);
        }
    }

    private static void assertCompiled(RunInfo info) {
        for (String name : new String[] {"byte128", "byte64", "unsigned128", "and128", "or128",
                                        "xor128", "not128", "block64", "shared128", "normalized128",
                                        "normalized64", "short128", "int128", "long128", "float128", "double128"}) {
            TestFramework.assertCompiledByC2(info.getTest(name));
        }
    }

    private static int rotate16(int mask, int shift) {
        return ((mask << shift) | (mask >>> (16 - shift))) & 65535;
    }

    private static void checkBlockEdges() {
        for (long bits : new long[] {0, -1, 0x5555555555555555L, 0xAAAAAAAAAAAAAAAAL}) {
            for (int i = 0; i < 64; i++) BLOCK_B[i] = ((bits >>> i) & 1) == 0 ? BLOCK_A[i] : (byte)(BLOCK_A[i] ^ 1);
            Asserts.assertEQ(block64(), bits, "block edge");
        }
        for (int lane = 0; lane < 64; lane++) {
            System.arraycopy(BLOCK_A, 0, BLOCK_B, 0, 64);
            BLOCK_B[lane] ^= 1;
            Asserts.assertEQ(block64(), 1L << lane, "block single lane");
        }
    }

    private static void check(int mask) {
        for (int i = 0; i < 16; i++) {
            A[i] = (byte)(i * 13 + mask);
            B[i] = ((mask >>> i) & 1) == 0 ? A[i] : (byte)(A[i] ^ 0x80);
            C[i] = (byte)((i * 7 + mask) & 63);
            D[i] = ((rotate16(mask, 5) >>> i) & 1) == 0 ? C[i] : (byte)(C[i] + 1);
            BOOLS[i] = ((mask >>> i) & 1) != 0;
        }
        for (int i = 0; i < 64; i++) {
            BLOCK_A[i] = (byte)(mask + i);
            int rotated = rotate16(mask, (i / 16) * 3);
            BLOCK_B[i] = ((rotated >>> (i & 15)) & 1) == 0 ? BLOCK_A[i] : (byte)(BLOCK_A[i] ^ 1);
        }
        for (int i = 0; i < 8; i++) { SA[i] = (short)i; SB[i] = (short)(i + ((mask >>> i) & 1)); }
        for (int i = 0; i < 4; i++) { IA[i] = i; IB[i] = i + ((mask >>> i) & 1); FA[i] = i; FB[i] = i + ((mask >>> i) & 1); }
        for (int i = 0; i < 2; i++) { LA[i] = i; LB[i] = i + ((mask >>> i) & 1); DA[i] = i; DB[i] = i + ((mask >>> i) & 1); }
        long first = 0, second = 0, unsigned = 0, block = 0;
        for (int i = 0; i < 16; i++) {
            if (A[i] != B[i]) first |= 1L << i;
            if (C[i] < D[i]) second |= 1L << i;
            if (Byte.toUnsignedInt(A[i]) <= Byte.toUnsignedInt(B[i])) unsigned |= 1L << i;
        }
        for (int i = 0; i < 64; i++) if (BLOCK_A[i] != BLOCK_B[i]) block |= 1L << i;
        Asserts.assertEQ(byte128(), first, "byte128");
        Asserts.assertEQ(byte64(), first & 255, "byte64");
        Asserts.assertEQ(unsigned128(), unsigned, "unsigned128");
        Asserts.assertEQ(and128(), first & second, "and128");
        Asserts.assertEQ(or128(), first | second, "or128");
        Asserts.assertEQ(xor128(), first ^ second, "xor128");
        Asserts.assertEQ(not128(), (~first) & 65535, "not128");
        Asserts.assertEQ(block64(), block, "block64");
        Asserts.assertEQ(normalized128(), first, "normalized128");
        Asserts.assertEQ(normalized64(), first & 255, "normalized64");
        Asserts.assertEQ(shared128(), first, "shared128");
        for (int i = 0; i < 16; i++) Asserts.assertEQ(STORED[i], ((first >>> i) & 1) != 0, "shared store");
        Asserts.assertEQ(short128(), first & 255, "short128");
        Asserts.assertEQ(int128(), first & 15, "int128");
        Asserts.assertEQ(long128(), first & 3, "long128");
        checkFloatingPoint();
    }

    private static void checkFloatingPoint() {
        long floats = 0, doubles = 0;
        for (int i = 0; i < 4; i++) if (FA[i] != FB[i]) floats |= 1L << i;
        for (int i = 0; i < 2; i++) if (DA[i] != DB[i]) doubles |= 1L << i;
        Asserts.assertEQ(float128(), floats, "float128");
        Asserts.assertEQ(double128(), doubles, "double128");
    }

    private static void checkFloatingPointEdges() {
        float[] fs = {Float.NaN, Float.NEGATIVE_INFINITY, Float.POSITIVE_INFINITY, -0.0f, 0.0f};
        double[] ds = {Double.NaN, Double.NEGATIVE_INFINITY, Double.POSITIVE_INFINITY, -0.0, 0.0};
        for (int p = 0; p < fs.length; p++) for (int q = 0; q < fs.length; q++) {
            for (int i = 0; i < 4; i++) { FA[i] = fs[(p + i) % fs.length]; FB[i] = fs[(q + i) % fs.length]; }
            for (int i = 0; i < 2; i++) { DA[i] = ds[(p + i) % ds.length]; DB[i] = ds[(q + i) % ds.length]; }
            checkFloatingPoint();
        }
    }
}
