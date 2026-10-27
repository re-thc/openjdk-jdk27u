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
 * @summary Fold integral vector self-comparisons and constant-mask blends
 * @library /test/lib /
 * @modules jdk.incubator.vector
 * @run driver compiler.vectorapi.TestVectorSelfCompare
 */
package compiler.vectorapi;

import compiler.lib.ir_framework.IR;
import compiler.lib.ir_framework.IRNode;
import compiler.lib.ir_framework.Run;
import compiler.lib.ir_framework.RunInfo;
import compiler.lib.ir_framework.Test;
import compiler.lib.ir_framework.TestFramework;
import jdk.incubator.vector.*;
import static jdk.incubator.vector.VectorOperators.*;

public class TestVectorSelfCompare {
    private static final byte[] BYTES = new byte[64];
    private static final short[] SHORTS = new short[32];
    private static final int[] INTS = new int[16];
    private static final long[] LONGS = new long[8];
    private static final byte[] TABLE = new byte[64];
    private static final byte[] RESULT = new byte[64];
    private static final int[] BLEND_RESULT = new int[4];
    private static final boolean[] MASK = new boolean[16];
    private static final boolean[] SELF = {true, false, false, true, false, true, false, true, false, true};
    private static final byte[] BYTE_RESULTS = new byte[160];
    private static final short[] SHORT_RESULTS = new short[80];
    private static final int[] INT_RESULTS = new int[40];
    // x86 rejects two-lane VectorStoreMask; four lanes exercise native long comparisons.
    private static final long[] LONG_RESULTS = new long[40];
    static {
        for (int i = 0; i < 64; i++) {
            BYTES[i] = (byte) (i * 31 - 127);
            TABLE[i] = (byte) (i * 7 + 1);
        }
        for (int i = 0; i < MASK.length; i++) MASK[i] = (i & 1) == 0;
        for (int i = 0; i < SHORTS.length; i++) SHORTS[i] = (short) (i * 8191);
        for (int i = 0; i < INTS.length; i++) INTS[i] = Integer.rotateLeft(0x80000001, i);
        for (int i = 0; i < LONGS.length; i++) LONGS[i] = Long.rotateLeft(0x8000000000000001L, i);
    }
    private static void check(boolean value) {
        if (!value) throw new AssertionError();
    }
    public static void main(String[] args) {
        // Populate shared access-check profiles before capturing IR.
        TestFramework framework = new TestFramework().setDefaultWarmup(10000)
                .addFlags("--add-modules=jdk.incubator.vector");
        framework.start();
    }

    @Test
    @IR(failOn = {IRNode.VECTOR_MASK_CMP, IRNode.VECTOR_BLEND_B},
        counts = {IRNode.LOAD_VECTOR_B, IRNode.VECTOR_SIZE_16, "> 0"},
        applyIfCPUFeatureOr = {"avx2", "true", "asimd", "true", "rvv", "true"},
        applyIf = {"MaxVectorSize", ">= 16"})
    public static void selfByte() {
        ByteVector v = ByteVector.fromArray(ByteVector.SPECIES_128, BYTES, 0);
        ByteVector w = ByteVector.fromArray(ByteVector.SPECIES_128, BYTES, 16);
        v.blend(w, v.compare(EQ, v)).intoArray(BYTE_RESULTS, 0);
        v.blend(w, v.compare(NE, v)).intoArray(BYTE_RESULTS, 16);
        v.blend(w, v.compare(LT, v)).intoArray(BYTE_RESULTS, 32);
        v.blend(w, v.compare(LE, v)).intoArray(BYTE_RESULTS, 48);
        v.blend(w, v.compare(GT, v)).intoArray(BYTE_RESULTS, 64);
        v.blend(w, v.compare(GE, v)).intoArray(BYTE_RESULTS, 80);
        v.blend(w, v.compare(ULT, v)).intoArray(BYTE_RESULTS, 96);
        v.blend(w, v.compare(ULE, v)).intoArray(BYTE_RESULTS, 112);
        v.blend(w, v.compare(UGT, v)).intoArray(BYTE_RESULTS, 128);
        v.blend(w, v.compare(UGE, v)).intoArray(BYTE_RESULTS, 144);
    }
    @Run(test = "selfByte")
    public static void runSelfByte() {
        selfByte();
        for (int op = 0; op < SELF.length; op++) {
            for (int i = 0; i < 16; i++) {
                boolean select = SELF[op];
                check(BYTE_RESULTS[op * 16 + i] == BYTES[i + (select ? 16 : 0)]);
            }
        }
    }

    @Test
    public static void maskedByte() {
        ByteVector v = ByteVector.fromArray(ByteVector.SPECIES_128, BYTES, 0);
        ByteVector w = ByteVector.fromArray(ByteVector.SPECIES_128, BYTES, 16);
        VectorMask<Byte> mask = VectorMask.fromArray(ByteVector.SPECIES_128, MASK, 0);
        v.blend(w, v.compare(EQ, v, mask)).intoArray(BYTE_RESULTS, 0);
        v.blend(w, v.compare(NE, v, mask)).intoArray(BYTE_RESULTS, 16);
        v.blend(w, v.compare(LT, v, mask)).intoArray(BYTE_RESULTS, 32);
        v.blend(w, v.compare(LE, v, mask)).intoArray(BYTE_RESULTS, 48);
        v.blend(w, v.compare(GT, v, mask)).intoArray(BYTE_RESULTS, 64);
        v.blend(w, v.compare(GE, v, mask)).intoArray(BYTE_RESULTS, 80);
        v.blend(w, v.compare(ULT, v, mask)).intoArray(BYTE_RESULTS, 96);
        v.blend(w, v.compare(ULE, v, mask)).intoArray(BYTE_RESULTS, 112);
        v.blend(w, v.compare(UGT, v, mask)).intoArray(BYTE_RESULTS, 128);
        v.blend(w, v.compare(UGE, v, mask)).intoArray(BYTE_RESULTS, 144);
    }
    @Run(test = "maskedByte")
    public static void runMaskedByte() {
        maskedByte();
        for (int op = 0; op < SELF.length; op++) {
            for (int i = 0; i < 16; i++) {
                boolean select = SELF[op] && MASK[i];
                check(BYTE_RESULTS[op * 16 + i] == BYTES[i + (select ? 16 : 0)]);
            }
        }
    }

    @Test
    @IR(failOn = {IRNode.VECTOR_MASK_CMP, IRNode.VECTOR_BLEND_S},
        counts = {IRNode.LOAD_VECTOR_S, IRNode.VECTOR_SIZE_8, "> 0"},
        applyIfCPUFeatureOr = {"avx2", "true", "asimd", "true", "rvv", "true"},
        applyIf = {"MaxVectorSize", ">= 16"})
    public static void selfShort() {
        ShortVector v = ShortVector.fromArray(ShortVector.SPECIES_128, SHORTS, 0);
        ShortVector w = ShortVector.fromArray(ShortVector.SPECIES_128, SHORTS, 8);
        v.blend(w, v.compare(EQ, v)).intoArray(SHORT_RESULTS, 0);
        v.blend(w, v.compare(NE, v)).intoArray(SHORT_RESULTS, 8);
        v.blend(w, v.compare(LT, v)).intoArray(SHORT_RESULTS, 16);
        v.blend(w, v.compare(LE, v)).intoArray(SHORT_RESULTS, 24);
        v.blend(w, v.compare(GT, v)).intoArray(SHORT_RESULTS, 32);
        v.blend(w, v.compare(GE, v)).intoArray(SHORT_RESULTS, 40);
        v.blend(w, v.compare(ULT, v)).intoArray(SHORT_RESULTS, 48);
        v.blend(w, v.compare(ULE, v)).intoArray(SHORT_RESULTS, 56);
        v.blend(w, v.compare(UGT, v)).intoArray(SHORT_RESULTS, 64);
        v.blend(w, v.compare(UGE, v)).intoArray(SHORT_RESULTS, 72);
    }
    @Run(test = "selfShort")
    public static void runSelfShort() {
        selfShort();
        for (int op = 0; op < SELF.length; op++) {
            for (int i = 0; i < 8; i++) {
                boolean select = SELF[op];
                check(SHORT_RESULTS[op * 8 + i] == SHORTS[i + (select ? 8 : 0)]);
            }
        }
    }

    @Test
    public static void maskedShort() {
        ShortVector v = ShortVector.fromArray(ShortVector.SPECIES_128, SHORTS, 0);
        ShortVector w = ShortVector.fromArray(ShortVector.SPECIES_128, SHORTS, 8);
        VectorMask<Short> mask = VectorMask.fromArray(ShortVector.SPECIES_128, MASK, 0);
        v.blend(w, v.compare(EQ, v, mask)).intoArray(SHORT_RESULTS, 0);
        v.blend(w, v.compare(NE, v, mask)).intoArray(SHORT_RESULTS, 8);
        v.blend(w, v.compare(LT, v, mask)).intoArray(SHORT_RESULTS, 16);
        v.blend(w, v.compare(LE, v, mask)).intoArray(SHORT_RESULTS, 24);
        v.blend(w, v.compare(GT, v, mask)).intoArray(SHORT_RESULTS, 32);
        v.blend(w, v.compare(GE, v, mask)).intoArray(SHORT_RESULTS, 40);
        v.blend(w, v.compare(ULT, v, mask)).intoArray(SHORT_RESULTS, 48);
        v.blend(w, v.compare(ULE, v, mask)).intoArray(SHORT_RESULTS, 56);
        v.blend(w, v.compare(UGT, v, mask)).intoArray(SHORT_RESULTS, 64);
        v.blend(w, v.compare(UGE, v, mask)).intoArray(SHORT_RESULTS, 72);
    }
    @Run(test = "maskedShort")
    public static void runMaskedShort() {
        maskedShort();
        for (int op = 0; op < SELF.length; op++) {
            for (int i = 0; i < 8; i++) {
                boolean select = SELF[op] && MASK[i];
                check(SHORT_RESULTS[op * 8 + i] == SHORTS[i + (select ? 8 : 0)]);
            }
        }
    }

    @Test
    @IR(failOn = {IRNode.VECTOR_MASK_CMP, IRNode.VECTOR_BLEND_I},
        counts = {IRNode.LOAD_VECTOR_I, IRNode.VECTOR_SIZE_4, "> 0"},
        applyIfCPUFeatureOr = {"avx2", "true", "asimd", "true", "rvv", "true"},
        applyIf = {"MaxVectorSize", ">= 16"})
    public static void selfInt() {
        IntVector v = IntVector.fromArray(IntVector.SPECIES_128, INTS, 0);
        IntVector w = IntVector.fromArray(IntVector.SPECIES_128, INTS, 4);
        v.blend(w, v.compare(EQ, v)).intoArray(INT_RESULTS, 0);
        v.blend(w, v.compare(NE, v)).intoArray(INT_RESULTS, 4);
        v.blend(w, v.compare(LT, v)).intoArray(INT_RESULTS, 8);
        v.blend(w, v.compare(LE, v)).intoArray(INT_RESULTS, 12);
        v.blend(w, v.compare(GT, v)).intoArray(INT_RESULTS, 16);
        v.blend(w, v.compare(GE, v)).intoArray(INT_RESULTS, 20);
        v.blend(w, v.compare(ULT, v)).intoArray(INT_RESULTS, 24);
        v.blend(w, v.compare(ULE, v)).intoArray(INT_RESULTS, 28);
        v.blend(w, v.compare(UGT, v)).intoArray(INT_RESULTS, 32);
        v.blend(w, v.compare(UGE, v)).intoArray(INT_RESULTS, 36);
    }
    @Run(test = "selfInt")
    public static void runSelfInt() {
        selfInt();
        for (int op = 0; op < SELF.length; op++) {
            for (int i = 0; i < 4; i++) {
                boolean select = SELF[op];
                check(INT_RESULTS[op * 4 + i] == INTS[i + (select ? 4 : 0)]);
            }
        }
    }

    @Test
    public static void maskedInt() {
        IntVector v = IntVector.fromArray(IntVector.SPECIES_128, INTS, 0);
        IntVector w = IntVector.fromArray(IntVector.SPECIES_128, INTS, 4);
        VectorMask<Integer> mask = VectorMask.fromArray(IntVector.SPECIES_128, MASK, 0);
        v.blend(w, v.compare(EQ, v, mask)).intoArray(INT_RESULTS, 0);
        v.blend(w, v.compare(NE, v, mask)).intoArray(INT_RESULTS, 4);
        v.blend(w, v.compare(LT, v, mask)).intoArray(INT_RESULTS, 8);
        v.blend(w, v.compare(LE, v, mask)).intoArray(INT_RESULTS, 12);
        v.blend(w, v.compare(GT, v, mask)).intoArray(INT_RESULTS, 16);
        v.blend(w, v.compare(GE, v, mask)).intoArray(INT_RESULTS, 20);
        v.blend(w, v.compare(ULT, v, mask)).intoArray(INT_RESULTS, 24);
        v.blend(w, v.compare(ULE, v, mask)).intoArray(INT_RESULTS, 28);
        v.blend(w, v.compare(UGT, v, mask)).intoArray(INT_RESULTS, 32);
        v.blend(w, v.compare(UGE, v, mask)).intoArray(INT_RESULTS, 36);
    }
    @Run(test = "maskedInt")
    public static void runMaskedInt() {
        maskedInt();
        for (int op = 0; op < SELF.length; op++) {
            for (int i = 0; i < 4; i++) {
                boolean select = SELF[op] && MASK[i];
                check(INT_RESULTS[op * 4 + i] == INTS[i + (select ? 4 : 0)]);
            }
        }
    }

    @Test
    @IR(failOn = {IRNode.VECTOR_MASK_CMP, IRNode.VECTOR_BLEND_L},
        counts = {IRNode.LOAD_VECTOR_L, IRNode.VECTOR_SIZE_4, "> 0"},
        applyIfCPUFeatureOr = {"avx2", "true", "sve", "true", "rvv", "true"},
        applyIf = {"MaxVectorSize", ">= 32"})
    public static void selfLong() {
        LongVector v = LongVector.fromArray(LongVector.SPECIES_256, LONGS, 0);
        LongVector w = LongVector.fromArray(LongVector.SPECIES_256, LONGS, 4);
        v.blend(w, v.compare(EQ, v)).intoArray(LONG_RESULTS, 0);
        v.blend(w, v.compare(NE, v)).intoArray(LONG_RESULTS, 4);
        v.blend(w, v.compare(LT, v)).intoArray(LONG_RESULTS, 8);
        v.blend(w, v.compare(LE, v)).intoArray(LONG_RESULTS, 12);
        v.blend(w, v.compare(GT, v)).intoArray(LONG_RESULTS, 16);
        v.blend(w, v.compare(GE, v)).intoArray(LONG_RESULTS, 20);
        v.blend(w, v.compare(ULT, v)).intoArray(LONG_RESULTS, 24);
        v.blend(w, v.compare(ULE, v)).intoArray(LONG_RESULTS, 28);
        v.blend(w, v.compare(UGT, v)).intoArray(LONG_RESULTS, 32);
        v.blend(w, v.compare(UGE, v)).intoArray(LONG_RESULTS, 36);
    }
    @Run(test = "selfLong")
    public static void runSelfLong() {
        selfLong();
        for (int op = 0; op < SELF.length; op++) {
            for (int i = 0; i < 4; i++) {
                boolean select = SELF[op];
                check(LONG_RESULTS[op * 4 + i] == LONGS[i + (select ? 4 : 0)]);
            }
        }
    }

    @Test
    public static void maskedLong() {
        LongVector v = LongVector.fromArray(LongVector.SPECIES_256, LONGS, 0);
        LongVector w = LongVector.fromArray(LongVector.SPECIES_256, LONGS, 4);
        VectorMask<Long> mask = VectorMask.fromArray(LongVector.SPECIES_256, MASK, 0);
        v.blend(w, v.compare(EQ, v, mask)).intoArray(LONG_RESULTS, 0);
        v.blend(w, v.compare(NE, v, mask)).intoArray(LONG_RESULTS, 4);
        v.blend(w, v.compare(LT, v, mask)).intoArray(LONG_RESULTS, 8);
        v.blend(w, v.compare(LE, v, mask)).intoArray(LONG_RESULTS, 12);
        v.blend(w, v.compare(GT, v, mask)).intoArray(LONG_RESULTS, 16);
        v.blend(w, v.compare(GE, v, mask)).intoArray(LONG_RESULTS, 20);
        v.blend(w, v.compare(ULT, v, mask)).intoArray(LONG_RESULTS, 24);
        v.blend(w, v.compare(ULE, v, mask)).intoArray(LONG_RESULTS, 28);
        v.blend(w, v.compare(UGT, v, mask)).intoArray(LONG_RESULTS, 32);
        v.blend(w, v.compare(UGE, v, mask)).intoArray(LONG_RESULTS, 36);
    }
    @Run(test = "maskedLong")
    public static void runMaskedLong() {
        maskedLong();
        for (int op = 0; op < SELF.length; op++) {
            for (int i = 0; i < 4; i++) {
                boolean select = SELF[op] && MASK[i];
                check(LONG_RESULTS[op * 4 + i] == LONGS[i + (select ? 4 : 0)]);
            }
        }
    }

    @Test
    @IR(failOn = {IRNode.VECTOR_MASK_CMP, IRNode.VECTOR_BLEND_B, IRNode.SUB_VB},
        counts = {IRNode.LOAD_VECTOR_B, IRNode.VECTOR_SIZE_16, "> 0"},
        applyIfCPUFeatureOr = {"avx2", "true", "asimd", "true", "rvv", "true"},
        applyIf = {"MaxVectorSize", ">= 16"})
    public static void lookup128() {
        ByteVector index = ByteVector.fromArray(ByteVector.SPECIES_128, BYTES, 0).and((byte) 15);
        ByteVector.fromArray(ByteVector.SPECIES_128, TABLE, 0)
                  .rearrange(index.toShuffle()).intoArray(RESULT, 0);
    }
    @Run(test = "lookup128")
    public static void runLookup128() {
        lookup128();
        for (int i = 0; i < 16; i++) check(RESULT[i] == TABLE[BYTES[i] & 15]);
    }

    @Test
    @IR(failOn = {IRNode.VECTOR_MASK_CMP, IRNode.VECTOR_BLEND_B, IRNode.SUB_VB},
        counts = {IRNode.LOAD_VECTOR_B, IRNode.VECTOR_SIZE_32, "> 0"},
        applyIfCPUFeatureOr = {"avx2", "true", "sve", "true"},
        applyIf = {"MaxVectorSize", ">= 32"})
    public static void lookup256() {
        ByteVector index = ByteVector.fromArray(ByteVector.SPECIES_256, BYTES, 0).and((byte) 31);
        ByteVector.fromArray(ByteVector.SPECIES_256, TABLE, 0)
                  .rearrange(index.toShuffle()).intoArray(RESULT, 0);
    }
    @Run(test = "lookup256")
    public static void runLookup256() {
        lookup256();
        for (int i = 0; i < 32; i++) check(RESULT[i] == TABLE[BYTES[i] & 31]);
    }

    @Test
    @IR(failOn = {IRNode.VECTOR_MASK_CMP, IRNode.VECTOR_BLEND_B, IRNode.SUB_VB},
        counts = {IRNode.LOAD_VECTOR_B, IRNode.VECTOR_SIZE_64, "> 0"},
        applyIfCPUFeatureOr = {"avx512bw", "true", "sve", "true"},
        applyIf = {"MaxVectorSize", ">= 64"})
    public static void lookup512() {
        ByteVector index = ByteVector.fromArray(ByteVector.SPECIES_512, BYTES, 0).and((byte) 63);
        ByteVector.fromArray(ByteVector.SPECIES_512, TABLE, 0)
                  .rearrange(index.toShuffle()).intoArray(RESULT, 0);
    }
    @Run(test = "lookup512")
    public static void runLookup512() {
        lookup512();
        for (int i = 0; i < 64; i++) check(RESULT[i] == TABLE[BYTES[i] & 63]);
    }

    @Test
    @IR(failOn = {IRNode.VECTOR_MASK_CMP, IRNode.VECTOR_BLEND_B, IRNode.SUB_VB},
        counts = {IRNode.LOAD_VECTOR_B, IRNode.VECTOR_SIZE_16, "> 0"},
        applyIfCPUFeatureOr = {"avx2", "true", "asimd", "true", "rvv", "true"},
        applyIf = {"MaxVectorSize", ">= 16"})
    public static void select128() {
        ByteVector index = ByteVector.fromArray(ByteVector.SPECIES_128, BYTES, 0).and((byte) 15);
        index.selectFrom(ByteVector.fromArray(ByteVector.SPECIES_128, TABLE, 0)).intoArray(RESULT, 0);
    }
    @Run(test = "select128")
    public static void runSelect128() {
        select128();
        for (int i = 0; i < 16; i++) check(RESULT[i] == TABLE[BYTES[i] & 15]);
    }

    @Test
    @IR(failOn = {IRNode.VECTOR_MASK_CMP, IRNode.VECTOR_BLEND_B, IRNode.SUB_VB},
        counts = {IRNode.LOAD_VECTOR_B, IRNode.VECTOR_SIZE_32, "> 0"},
        applyIfCPUFeatureOr = {"avx2", "true", "sve", "true"},
        applyIf = {"MaxVectorSize", ">= 32"})
    public static void select256() {
        ByteVector index = ByteVector.fromArray(ByteVector.SPECIES_256, BYTES, 0).and((byte) 31);
        index.selectFrom(ByteVector.fromArray(ByteVector.SPECIES_256, TABLE, 0)).intoArray(RESULT, 0);
    }
    @Run(test = "select256")
    public static void runSelect256() {
        select256();
        for (int i = 0; i < 32; i++) check(RESULT[i] == TABLE[BYTES[i] & 31]);
    }

    @Test
    @IR(failOn = {IRNode.VECTOR_MASK_CMP, IRNode.VECTOR_BLEND_B, IRNode.SUB_VB},
        counts = {IRNode.LOAD_VECTOR_B, IRNode.VECTOR_SIZE_64, "> 0"},
        applyIfCPUFeatureOr = {"avx512bw", "true", "sve", "true"},
        applyIf = {"MaxVectorSize", ">= 64"})
    public static void select512() {
        ByteVector index = ByteVector.fromArray(ByteVector.SPECIES_512, BYTES, 0).and((byte) 63);
        index.selectFrom(ByteVector.fromArray(ByteVector.SPECIES_512, TABLE, 0)).intoArray(RESULT, 0);
    }
    @Run(test = "select512")
    public static void runSelect512() {
        select512();
        for (int i = 0; i < 64; i++) check(RESULT[i] == TABLE[BYTES[i] & 63]);
    }

    @Test
    @IR(failOn = {IRNode.VECTOR_BLEND_I},
        counts = {IRNode.LOAD_VECTOR_I, IRNode.VECTOR_SIZE_4, "> 0"},
        applyIfCPUFeatureOr = {"avx2", "true", "asimd", "true", "rvv", "true"},
        applyIf = {"MaxVectorSize", ">= 16"})
    public static void blendFalse() {
        IntVector a = IntVector.fromArray(IntVector.SPECIES_128, INTS, 0);
        IntVector b = IntVector.fromArray(IntVector.SPECIES_128, INTS, 4);
        a.blend(b, IntVector.SPECIES_128.maskAll(false)).intoArray(BLEND_RESULT, 0);
    }
    @Run(test = "blendFalse")
    public static void runBlendFalse() {
        blendFalse();
        for (int i = 0; i < 4; i++) check(BLEND_RESULT[i] == INTS[i + 0]);
    }

    @Test
    @IR(failOn = {IRNode.VECTOR_BLEND_I},
        counts = {IRNode.LOAD_VECTOR_I, IRNode.VECTOR_SIZE_4, "> 0"},
        applyIfCPUFeatureOr = {"avx2", "true", "asimd", "true", "rvv", "true"},
        applyIf = {"MaxVectorSize", ">= 16"})
    public static void blendTrue() {
        IntVector a = IntVector.fromArray(IntVector.SPECIES_128, INTS, 0);
        IntVector b = IntVector.fromArray(IntVector.SPECIES_128, INTS, 4);
        a.blend(b, IntVector.SPECIES_128.maskAll(true)).intoArray(BLEND_RESULT, 0);
    }
    @Run(test = "blendTrue")
    public static void runBlendTrue() {
        blendTrue();
        for (int i = 0; i < 4; i++) check(BLEND_RESULT[i] == INTS[i + 4]);
    }

    private static final float[] FLOATS = {Float.intBitsToFloat(0x7fc12345), -0.0f, Float.POSITIVE_INFINITY, 1.0f};
    private static final float[] OTHER_FLOATS = {42.0f, 1.0f, -1.0f, Float.NEGATIVE_INFINITY};
    private static final double[] DOUBLES = {Double.longBitsToDouble(0x7ff8123456789abcL), -0.0d, Double.POSITIVE_INFINITY, 1.0d};
    private static final double[] OTHER_DOUBLES = {42.0d, 1.0d, -1.0d, Double.NEGATIVE_INFINITY};
    private static final float[] FLOAT_RESULTS = new float[16];
    private static final double[] DOUBLE_RESULTS = new double[16];

    @Test
    @IR(counts = {IRNode.VECTOR_MASK_CMP, "> 0"},
        applyIfCPUFeatureOr = {"avx2", "true", "asimd", "true", "rvv", "true"},
        applyIf = {"MaxVectorSize", ">= 16"})
    public static void nanFloat() {
        FloatVector v = FloatVector.fromArray(FloatVector.SPECIES_128, FLOATS, 0);
        FloatVector w = FloatVector.fromArray(FloatVector.SPECIES_128, OTHER_FLOATS, 0);
        v.blend(w, v.compare(EQ, v)).intoArray(FLOAT_RESULTS, 0);
        v.blend(w, v.compare(NE, v)).intoArray(FLOAT_RESULTS, 4);
        v.blend(w, v.compare(LE, v)).intoArray(FLOAT_RESULTS, 8);
        v.blend(w, v.compare(GE, v)).intoArray(FLOAT_RESULTS, 12);
    }
    @Run(test = "nanFloat")
    public static void runNaNFloat() {
        nanFloat();
        for (int op = 0; op < 4; op++) {
            for (int i = 0; i < 4; i++) {
                boolean select = op == 1 ? Float.isNaN(FLOATS[i]) : !Float.isNaN(FLOATS[i]);
                float expected = select ? OTHER_FLOATS[i] : FLOATS[i];
                check(Float.floatToRawIntBits(FLOAT_RESULTS[op * 4 + i]) == Float.floatToRawIntBits(expected));
            }
        }
    }

    @Test
    @IR(counts = {IRNode.VECTOR_MASK_CMP, "> 0"},
        applyIfCPUFeatureOr = {"avx2", "true", "sve", "true", "rvv", "true"},
        applyIf = {"MaxVectorSize", ">= 32"})
    public static void nanDouble() {
        DoubleVector v = DoubleVector.fromArray(DoubleVector.SPECIES_256, DOUBLES, 0);
        DoubleVector w = DoubleVector.fromArray(DoubleVector.SPECIES_256, OTHER_DOUBLES, 0);
        v.blend(w, v.compare(EQ, v)).intoArray(DOUBLE_RESULTS, 0);
        v.blend(w, v.compare(NE, v)).intoArray(DOUBLE_RESULTS, 4);
        v.blend(w, v.compare(LE, v)).intoArray(DOUBLE_RESULTS, 8);
        v.blend(w, v.compare(GE, v)).intoArray(DOUBLE_RESULTS, 12);
    }
    @Run(test = "nanDouble")
    public static void runNaNDouble() {
        nanDouble();
        for (int op = 0; op < 4; op++) {
            for (int i = 0; i < 4; i++) {
                boolean select = op == 1 ? Double.isNaN(DOUBLES[i]) : !Double.isNaN(DOUBLES[i]);
                double expected = select ? OTHER_DOUBLES[i] : DOUBLES[i];
                check(Double.doubleToRawLongBits(DOUBLE_RESULTS[op * 4 + i]) == Double.doubleToRawLongBits(expected));
            }
        }
    }

    private static final long[] LONG128_A = {Long.MIN_VALUE, Long.MAX_VALUE};
    private static final long[] LONG128_B = {Long.MIN_VALUE, Long.MIN_VALUE};
    private static final double[] DOUBLE128_A = {Double.longBitsToDouble(0x7ff8123456789abcL), -0.0d};
    private static final double[] DOUBLE128_B = {1.0d, +0.0d};
    private static final boolean[] MASK128_RESULT = new boolean[20];

    // C2 residency alone does not establish native Vector API lowering.
    // The AArch64 IR rules check native lowering separately.
    private static boolean mask128Before(RunInfo info) {
        if (info.isWarmUp()) return false;
        boolean required = info.isC2CompilationEnabled() && !info.isCompilationSkipped();
        boolean compiled = info.isTestC2Compiled();
        System.out.println("MASK128_RESIDENCY method=" + info.getTest().getName()
                + " arch=" + System.getProperty("os.arch") + " beforeC2=" + compiled);
        if (required) check(compiled);
        return required;
    }

    private static void mask128After(RunInfo info, boolean required) {
        if (info.isWarmUp()) return;
        boolean compiled = info.isTestC2Compiled();
        System.out.println("MASK128_RESIDENCY method=" + info.getTest().getName()
                + " afterC2=" + compiled + " deoptimized=" + (required && !compiled));
        if (required) check(compiled);
    }

    private static boolean long128Expected(int op, long a, long b) {
        int order = op < 6 ? Long.compare(a, b) : Long.compareUnsigned(a, b);
        return switch (op) {
            case 0 -> order == 0;
            case 1 -> order != 0;
            case 2, 6 -> order < 0;
            case 3, 7 -> order <= 0;
            case 4, 8 -> order > 0;
            default -> order >= 0;
        };
    }

    private static boolean double128Expected(int op, double a, double b) {
        return switch (op) {
            case 0 -> a == b;
            case 1 -> a != b;
            case 2 -> a < b;
            case 3 -> a <= b;
            case 4 -> a > b;
            default -> a >= b;
        };
    }

    @Test
    @IR(failOn = {IRNode.VECTOR_MASK_CMP},
        applyIfPlatform = {"aarch64", "true"},
        applyIfCPUFeature = {"asimd", "true"},
        applyIf = {"MaxVectorSize", ">= 16"})
    public static long long128SelfToLong() {
        LongVector a = LongVector.fromArray(LongVector.SPECIES_128, LONG128_A, 0);
        return (a.compare(EQ, a).toLong() << 0) |
               (a.compare(NE, a).toLong() << 2) |
               (a.compare(LT, a).toLong() << 4) |
               (a.compare(LE, a).toLong() << 6) |
               (a.compare(GT, a).toLong() << 8) |
               (a.compare(GE, a).toLong() << 10) |
               (a.compare(ULT, a).toLong() << 12) |
               (a.compare(ULE, a).toLong() << 14) |
               (a.compare(UGT, a).toLong() << 16) |
               (a.compare(UGE, a).toLong() << 18);
    }
    @Run(test = "long128SelfToLong")
    public static void runLong128SelfToLong(RunInfo info) {
        boolean required = mask128Before(info);
        long expected = 0;
        for (int op = 0; op < 10; op++) {
            for (int lane = 0; lane < 2; lane++) {
                if (long128Expected(op, LONG128_A[lane], LONG128_A[lane])) expected |= 1L << (2 * op + lane);
            }
        }
        check(long128SelfToLong() == expected);
        mask128After(info, required);
    }

    @Test
    @IR(failOn = {IRNode.VECTOR_MASK_CMP},
        applyIfPlatform = {"aarch64", "true"},
        applyIfCPUFeature = {"asimd", "true"},
        applyIf = {"MaxVectorSize", ">= 16"})
    public static void long128SelfIntoArray() {
        LongVector a = LongVector.fromArray(LongVector.SPECIES_128, LONG128_A, 0);
        a.compare(EQ, a).intoArray(MASK128_RESULT, 0);
        a.compare(NE, a).intoArray(MASK128_RESULT, 2);
        a.compare(LT, a).intoArray(MASK128_RESULT, 4);
        a.compare(LE, a).intoArray(MASK128_RESULT, 6);
        a.compare(GT, a).intoArray(MASK128_RESULT, 8);
        a.compare(GE, a).intoArray(MASK128_RESULT, 10);
        a.compare(ULT, a).intoArray(MASK128_RESULT, 12);
        a.compare(ULE, a).intoArray(MASK128_RESULT, 14);
        a.compare(UGT, a).intoArray(MASK128_RESULT, 16);
        a.compare(UGE, a).intoArray(MASK128_RESULT, 18);
    }
    @Run(test = "long128SelfIntoArray")
    public static void runLong128SelfIntoArray(RunInfo info) {
        boolean required = mask128Before(info);
        long128SelfIntoArray();
        for (int op = 0; op < 10; op++) {
            for (int lane = 0; lane < 2; lane++) {
                check(MASK128_RESULT[2 * op + lane] == long128Expected(op, LONG128_A[lane], LONG128_A[lane]));
            }
        }
        mask128After(info, required);
    }

    @Test
    @IR(counts = {IRNode.VECTOR_MASK_CMP, "> 0"},
        applyIfPlatform = {"aarch64", "true"},
        applyIfCPUFeature = {"asimd", "true"},
        applyIf = {"MaxVectorSize", ">= 16"})
    public static long long128DifferentToLong() {
        LongVector a = LongVector.fromArray(LongVector.SPECIES_128, LONG128_A, 0);
        LongVector b = LongVector.fromArray(LongVector.SPECIES_128, LONG128_B, 0);
        return (a.compare(EQ, b).toLong() << 0) |
               (a.compare(NE, b).toLong() << 2) |
               (a.compare(LT, b).toLong() << 4) |
               (a.compare(LE, b).toLong() << 6) |
               (a.compare(GT, b).toLong() << 8) |
               (a.compare(GE, b).toLong() << 10) |
               (a.compare(ULT, b).toLong() << 12) |
               (a.compare(ULE, b).toLong() << 14) |
               (a.compare(UGT, b).toLong() << 16) |
               (a.compare(UGE, b).toLong() << 18);
    }
    @Run(test = "long128DifferentToLong")
    public static void runLong128DifferentToLong(RunInfo info) {
        boolean required = mask128Before(info);
        long expected = 0;
        for (int op = 0; op < 10; op++) {
            for (int lane = 0; lane < 2; lane++) {
                if (long128Expected(op, LONG128_A[lane], LONG128_B[lane])) expected |= 1L << (2 * op + lane);
            }
        }
        check(long128DifferentToLong() == expected);
        mask128After(info, required);
    }

    @Test
    @IR(counts = {IRNode.VECTOR_MASK_CMP, "> 0"},
        applyIfPlatform = {"aarch64", "true"},
        applyIfCPUFeature = {"asimd", "true"},
        applyIf = {"MaxVectorSize", ">= 16"})
    public static void long128DifferentIntoArray() {
        LongVector a = LongVector.fromArray(LongVector.SPECIES_128, LONG128_A, 0);
        LongVector b = LongVector.fromArray(LongVector.SPECIES_128, LONG128_B, 0);
        a.compare(EQ, b).intoArray(MASK128_RESULT, 0);
        a.compare(NE, b).intoArray(MASK128_RESULT, 2);
        a.compare(LT, b).intoArray(MASK128_RESULT, 4);
        a.compare(LE, b).intoArray(MASK128_RESULT, 6);
        a.compare(GT, b).intoArray(MASK128_RESULT, 8);
        a.compare(GE, b).intoArray(MASK128_RESULT, 10);
        a.compare(ULT, b).intoArray(MASK128_RESULT, 12);
        a.compare(ULE, b).intoArray(MASK128_RESULT, 14);
        a.compare(UGT, b).intoArray(MASK128_RESULT, 16);
        a.compare(UGE, b).intoArray(MASK128_RESULT, 18);
    }
    @Run(test = "long128DifferentIntoArray")
    public static void runLong128DifferentIntoArray(RunInfo info) {
        boolean required = mask128Before(info);
        long128DifferentIntoArray();
        for (int op = 0; op < 10; op++) {
            for (int lane = 0; lane < 2; lane++) {
                check(MASK128_RESULT[2 * op + lane] == long128Expected(op, LONG128_A[lane], LONG128_B[lane]));
            }
        }
        mask128After(info, required);
    }

    @Test
    @IR(counts = {IRNode.VECTOR_MASK_CMP, "> 0"},
        applyIfPlatform = {"aarch64", "true"},
        applyIfCPUFeature = {"asimd", "true"},
        applyIf = {"MaxVectorSize", ">= 16"})
    public static long double128SelfToLong() {
        DoubleVector a = DoubleVector.fromArray(DoubleVector.SPECIES_128, DOUBLE128_A, 0);
        return (a.compare(EQ, a).toLong() << 0) |
               (a.compare(NE, a).toLong() << 2) |
               (a.compare(LT, a).toLong() << 4) |
               (a.compare(LE, a).toLong() << 6) |
               (a.compare(GT, a).toLong() << 8) |
               (a.compare(GE, a).toLong() << 10);
    }
    @Run(test = "double128SelfToLong")
    public static void runDouble128SelfToLong(RunInfo info) {
        boolean required = mask128Before(info);
        long expected = 0;
        for (int op = 0; op < 6; op++) {
            for (int lane = 0; lane < 2; lane++) {
                if (double128Expected(op, DOUBLE128_A[lane], DOUBLE128_A[lane])) expected |= 1L << (2 * op + lane);
            }
        }
        check(double128SelfToLong() == expected);
        mask128After(info, required);
    }

    @Test
    @IR(counts = {IRNode.VECTOR_MASK_CMP, "> 0"},
        applyIfPlatform = {"aarch64", "true"},
        applyIfCPUFeature = {"asimd", "true"},
        applyIf = {"MaxVectorSize", ">= 16"})
    public static void double128SelfIntoArray() {
        DoubleVector a = DoubleVector.fromArray(DoubleVector.SPECIES_128, DOUBLE128_A, 0);
        a.compare(EQ, a).intoArray(MASK128_RESULT, 0);
        a.compare(NE, a).intoArray(MASK128_RESULT, 2);
        a.compare(LT, a).intoArray(MASK128_RESULT, 4);
        a.compare(LE, a).intoArray(MASK128_RESULT, 6);
        a.compare(GT, a).intoArray(MASK128_RESULT, 8);
        a.compare(GE, a).intoArray(MASK128_RESULT, 10);
    }
    @Run(test = "double128SelfIntoArray")
    public static void runDouble128SelfIntoArray(RunInfo info) {
        boolean required = mask128Before(info);
        double128SelfIntoArray();
        for (int op = 0; op < 6; op++) {
            for (int lane = 0; lane < 2; lane++) {
                check(MASK128_RESULT[2 * op + lane] == double128Expected(op, DOUBLE128_A[lane], DOUBLE128_A[lane]));
            }
        }
        mask128After(info, required);
    }

    @Test
    @IR(counts = {IRNode.VECTOR_MASK_CMP, "> 0"},
        applyIfPlatform = {"aarch64", "true"},
        applyIfCPUFeature = {"asimd", "true"},
        applyIf = {"MaxVectorSize", ">= 16"})
    public static long double128DifferentToLong() {
        DoubleVector a = DoubleVector.fromArray(DoubleVector.SPECIES_128, DOUBLE128_A, 0);
        DoubleVector b = DoubleVector.fromArray(DoubleVector.SPECIES_128, DOUBLE128_B, 0);
        return (a.compare(EQ, b).toLong() << 0) |
               (a.compare(NE, b).toLong() << 2) |
               (a.compare(LT, b).toLong() << 4) |
               (a.compare(LE, b).toLong() << 6) |
               (a.compare(GT, b).toLong() << 8) |
               (a.compare(GE, b).toLong() << 10);
    }
    @Run(test = "double128DifferentToLong")
    public static void runDouble128DifferentToLong(RunInfo info) {
        boolean required = mask128Before(info);
        long expected = 0;
        for (int op = 0; op < 6; op++) {
            for (int lane = 0; lane < 2; lane++) {
                if (double128Expected(op, DOUBLE128_A[lane], DOUBLE128_B[lane])) expected |= 1L << (2 * op + lane);
            }
        }
        check(double128DifferentToLong() == expected);
        mask128After(info, required);
    }

    @Test
    @IR(counts = {IRNode.VECTOR_MASK_CMP, "> 0"},
        applyIfPlatform = {"aarch64", "true"},
        applyIfCPUFeature = {"asimd", "true"},
        applyIf = {"MaxVectorSize", ">= 16"})
    public static void double128DifferentIntoArray() {
        DoubleVector a = DoubleVector.fromArray(DoubleVector.SPECIES_128, DOUBLE128_A, 0);
        DoubleVector b = DoubleVector.fromArray(DoubleVector.SPECIES_128, DOUBLE128_B, 0);
        a.compare(EQ, b).intoArray(MASK128_RESULT, 0);
        a.compare(NE, b).intoArray(MASK128_RESULT, 2);
        a.compare(LT, b).intoArray(MASK128_RESULT, 4);
        a.compare(LE, b).intoArray(MASK128_RESULT, 6);
        a.compare(GT, b).intoArray(MASK128_RESULT, 8);
        a.compare(GE, b).intoArray(MASK128_RESULT, 10);
    }
    @Run(test = "double128DifferentIntoArray")
    public static void runDouble128DifferentIntoArray(RunInfo info) {
        boolean required = mask128Before(info);
        double128DifferentIntoArray();
        for (int op = 0; op < 6; op++) {
            for (int lane = 0; lane < 2; lane++) {
                check(MASK128_RESULT[2 * op + lane] == double128Expected(op, DOUBLE128_A[lane], DOUBLE128_B[lane]));
            }
        }
        mask128After(info, required);
    }
}
