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
import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.ValueLayout;
import java.nio.ByteOrder;
import jdk.incubator.vector.ByteVector;
import jdk.incubator.vector.DoubleVector;
import jdk.incubator.vector.FloatVector;
import jdk.incubator.vector.LongVector;
import jdk.incubator.vector.ShortVector;
import jdk.incubator.vector.VectorOperators;
import compiler.lib.ir_framework.*;
import jdk.test.lib.Asserts;
import jdk.test.lib.Platform;

/*
 * @test
 * @summary Check fused SVE narrowing stores, cast semantics, offsets and tails.
 * @requires vm.compiler2.enabled
 * @modules jdk.incubator.vector
 * @library /test/lib /
 * @run driver/timeout=480 compiler.c2.irTests.TestAArch64SVENarrowingCastStore
 */
public class TestAArch64SVENarrowingCastStore {
    private static final ByteOrder ORDER = ByteOrder.nativeOrder();
    private static final MemorySegment ALIASED = Arena.ofAuto().allocate(128, 8);
    private static final MemorySegment HEAP_ALIASED = MemorySegment.ofArray(new byte[128]);
    private static final int SIZE = 2048;
    private static final int[] LENGTHS = {0, 1, 2, 3, 4, 7, 8, 15, 16, 17, 31, 32, 33,
                                          63, 64, 65, 127, 128, 129, 1023, 1024, 1027};
    private static final double[] DOUBLE_VALUES = {
        0.0, -0.0, Double.NaN, Double.longBitsToDouble(0xfff8_0000_0000_1234L),
        Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY, Double.MAX_VALUE, -Double.MAX_VALUE,
        Double.MIN_VALUE, -Double.MIN_VALUE, Float.MIN_VALUE, -Float.MIN_VALUE,
        Float.MIN_NORMAL, -Float.MIN_NORMAL, Float.MAX_VALUE, -Float.MAX_VALUE,
        1.0 + 0x1.0p-24, Math.nextUp(1.0 + 0x1.0p-24), Math.nextDown(1.0 + 0x1.0p-24),
        -1.0 - 0x1.0p-24, 0x1.0p-150, Math.nextUp(0x1.0p-150),
        32767.9, 32768.0, -32768.9, -32769.0, 65535.9, 65536.0,
        Integer.MAX_VALUE, (double) Integer.MAX_VALUE + 1, (double) Integer.MAX_VALUE - 0.5,
        Integer.MIN_VALUE, (double) Integer.MIN_VALUE - 1, (double) Integer.MIN_VALUE + 0.5,
        0.99, -0.99, 1234.75, -1234.75
    };
    private static final long[] LONG_VALUES = {
        0, 1, -1, 127, 128, 255, 256, -128, -129, -256,
        32767, 32768, -32768, -32769, Integer.MIN_VALUE, Integer.MAX_VALUE,
        (1L << 24) - 1, 1L << 24, (1L << 24) + 1, (1L << 24) + 3,
        -((1L << 24) + 1), -((1L << 24) + 3), Long.MIN_VALUE, Long.MAX_VALUE,
        // Values just beyond float midpoints expose rounding through double.
        (1L << 62) + (1L << 38) + 1, -((1L << 62) + (1L << 38) + 1)
    };
    private static final double[] DOUBLES = new double[SIZE];
    private static final long[] LONGS = new long[SIZE];
    private static final short[] SHORTS = new short[SIZE];
    private static final float[] FLOATS = new float[SIZE];
    private static final byte[] BYTES = new byte[SIZE];
    private static final short SHORT_SENTINEL = 0x5a5a;
    private static final float FLOAT_SENTINEL = -12345.25f;
    private static final byte BYTE_SENTINEL = 0x5a;

    static {
        for (int i = 0; i < SIZE; i++) {
            DOUBLES[i] = DOUBLE_VALUES[i % DOUBLE_VALUES.length];
            LONGS[i] = LONG_VALUES[i % LONG_VALUES.length];
        }
    }

    public static void main(String[] args) {
        TestFramework framework = new TestFramework().setDefaultWarmup(1000);
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
    @IR(applyIfPlatform = {"aarch64", "true"},
        applyIfAnd = {"UseSVE", "> 0", "MaxVectorSize", "32"},
        counts = {"storeV_vcastDtoS_sve8", ">0"}, phase = CompilePhase.MATCHING)
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIfNot = {"MaxVectorSize", "32"},
        failOn = {"storeV_vcastDtoS_sve8"}, phase = CompilePhase.MATCHING)
    public static void testD2S(int srcOffset, int dstOffset, int length) {
        for (int i = 0; i < length; i++) {
            SHORTS[i + dstOffset] = (short) DOUBLES[i + srcOffset];
        }
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"},
        applyIfAnd = {"UseSVE", "> 0", "MaxVectorSize", "32"},
        counts = {"storeV_vcastDtoF_sve16", ">0"}, phase = CompilePhase.MATCHING)
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIfNot = {"MaxVectorSize", "32"},
        failOn = {"storeV_vcastDtoF_sve16"}, phase = CompilePhase.MATCHING)
    public static void testD2F(int srcOffset, int dstOffset, int length) {
        for (int i = 0; i < length; i++) {
            FLOATS[i + dstOffset] = (float) DOUBLES[i + srcOffset];
        }
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"},
        applyIfAnd = {"UseSVE", "> 0", "MaxVectorSize", "32"},
        counts = {"storeV_vcastLtoF_sve16", ">0"}, phase = CompilePhase.MATCHING)
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIfNot = {"MaxVectorSize", "32"},
        failOn = {"storeV_vcastLtoF_sve16"}, phase = CompilePhase.MATCHING)
    public static void testL2F(int srcOffset, int dstOffset, int length) {
        for (int i = 0; i < length; i++) {
            FLOATS[i + dstOffset] = (float) LONGS[i + srcOffset];
        }
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"},
        applyIfAnd = {"UseSVE", "> 0", "MaxVectorSize", "32"},
        counts = {"storeV_vcastLtoB_sve4", ">0"}, phase = CompilePhase.MATCHING)
    @IR(applyIfPlatform = {"aarch64", "true"}, applyIfNot = {"MaxVectorSize", "32"},
        failOn = {"storeV_vcastLtoB_sve4"}, phase = CompilePhase.MATCHING)
    public static void testL2B(int srcOffset, int dstOffset, int length) {
        for (int i = 0; i < length; i++) {
            BYTES[i + dstOffset] = (byte) LONGS[i + srcOffset];
        }
    }

    @Test
    public static void testD2SAlias() {
        DoubleVector src = DoubleVector.fromMemorySegment(DoubleVector.SPECIES_256, ALIASED, 32, ORDER);
        ((ShortVector) src.convertShape(VectorOperators.D2S, ShortVector.SPECIES_64, 0))
                .intoMemorySegment(ALIASED, 34, ORDER);
    }

    @Test
    public static void testD2FAlias() {
        DoubleVector src = DoubleVector.fromMemorySegment(DoubleVector.SPECIES_256, ALIASED, 32, ORDER);
        ((FloatVector) src.convertShape(VectorOperators.D2F, FloatVector.SPECIES_128, 0))
                .intoMemorySegment(ALIASED, 34, ORDER);
    }

    @Test
    public static void testL2FAlias() {
        LongVector src = LongVector.fromMemorySegment(LongVector.SPECIES_256, ALIASED, 32, ORDER);
        ((FloatVector) src.convertShape(VectorOperators.L2F, FloatVector.SPECIES_128, 0))
                .intoMemorySegment(ALIASED, 34, ORDER);
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"}, failOn = {"storeV_vcastLtoB_sve4"},
        phase = CompilePhase.MATCHING)
    public static void testL2BAlias() {
        LongVector src = LongVector.fromMemorySegment(LongVector.SPECIES_256, ALIASED, 32, ORDER);
        ((ByteVector) src.convertShape(VectorOperators.L2B, ByteVector.SPECIES_64, 0))
                .intoMemorySegment(ALIASED, 34, ORDER);
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"}, failOn = {"storeV_vcastDtoF_sve16"},
        phase = CompilePhase.MATCHING)
    public static void testSharedCastStore() {
        DoubleVector src = DoubleVector.fromMemorySegment(DoubleVector.SPECIES_256, ALIASED, 32, ORDER);
        FloatVector converted = (FloatVector) src.convertShape(VectorOperators.D2F, FloatVector.SPECIES_128, 0);
        // Cover a shared conversion with two overlapping destinations.
        converted.intoMemorySegment(ALIASED, 0, ORDER);
        converted.intoMemorySegment(ALIASED, 34, ORDER);
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"}, failOn = {"storeV_vcastDtoF_sve16"},
        phase = CompilePhase.MATCHING)
    public static void testHeapAliasFallback() {
        // C2 retains the fallback for a float access to a known byte[] segment.
        DoubleVector src = DoubleVector.fromMemorySegment(DoubleVector.SPECIES_256, HEAP_ALIASED, 32, ORDER);
        ((FloatVector) src.convertShape(VectorOperators.D2F, FloatVector.SPECIES_128, 0))
                .intoMemorySegment(HEAP_ALIASED, 34, ORDER);
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"}, failOn = {"storeV_vcastDtoF_sve16"},
        phase = CompilePhase.MATCHING)
    public static void testSharedArrayCast(int srcOffset) {
        DoubleVector src = DoubleVector.fromArray(DoubleVector.SPECIES_256, DOUBLES, srcOffset);
        FloatVector converted = (FloatVector) src.convertShape(VectorOperators.D2F, FloatVector.SPECIES_128, 0);
        converted.intoArray(FLOATS, 0);
        converted.intoArray(FLOATS, 8);
    }

    @Run(test = {"testD2S", "testD2F", "testL2F", "testL2B", "testD2SAlias",
                 "testD2FAlias", "testL2FAlias", "testL2BAlias", "testSharedCastStore",
                 "testHeapAliasFallback", "testSharedArrayCast"})
    public void run(RunInfo info) {
        if (info.isWarmUp()) {
            check(0, 3, 1027);
            checkAliases(0);
            checkSharedArrayCast(0);
        } else {
            for (int index = 0; index < Math.max(DOUBLE_VALUES.length, LONG_VALUES.length); index++) {
                checkAliases(index);
                checkSharedArrayCast(index);
            }
            for (int srcOffset : new int[] {0, 1, 3, 16}) {
                for (int dstOffset : new int[] {0, 1, 3, 16}) {
                    for (int length : LENGTHS) {
                        check(srcOffset, dstOffset, length);
                    }
                }
            }
        }
    }

    @DontCompile
    private static void checkSharedArrayCast(int srcOffset) {
        Arrays.fill(FLOATS, FLOAT_SENTINEL);
        testSharedArrayCast(srcOffset);
        for (int i = 0; i < SIZE; i++) {
            int lane = i < 4 ? i : i >= 8 && i < 12 ? i - 8 : -1;
            checkFloat(FLOATS[i], lane >= 0 ? (float) DOUBLES[srcOffset + lane] : FLOAT_SENTINEL);
        }
    }

    @DontCompile
    private static void check(int srcOffset, int dstOffset, int length) {
        Arrays.fill(SHORTS, SHORT_SENTINEL);
        Arrays.fill(FLOATS, FLOAT_SENTINEL);
        Arrays.fill(BYTES, BYTE_SENTINEL);
        testD2S(srcOffset, dstOffset, length);
        testD2F(srcOffset, dstOffset, length);
        testL2B(srcOffset, dstOffset, length);
        for (int i = 0; i < SIZE; i++) {
            boolean written = i >= dstOffset && i < dstOffset + length;
            int src = i - dstOffset + srcOffset;
            Asserts.assertEQ(SHORTS[i], written ? (short) DOUBLES[src] : SHORT_SENTINEL);
            Asserts.assertEQ(BYTES[i], written ? (byte) LONGS[src] : BYTE_SENTINEL);
            checkFloat(FLOATS[i], written ? (float) DOUBLES[src] : FLOAT_SENTINEL);
        }
        // Both float-producing loops reuse the same destination array.
        Arrays.fill(FLOATS, FLOAT_SENTINEL);
        testL2F(srcOffset, dstOffset, length);
        for (int i = 0; i < SIZE; i++) {
            boolean written = i >= dstOffset && i < dstOffset + length;
            checkFloat(FLOATS[i], written ? (float) LONGS[i - dstOffset + srcOffset] : FLOAT_SENTINEL);
        }
    }

    @DontCompile
    private static void checkAliases(int index) {
        for (int conversion = 0; conversion < 6; conversion++) {
            MemorySegment segment = conversion == 5 ? HEAP_ALIASED : ALIASED;
            byte[] expected = new byte[128];
            Arrays.fill(expected, BYTE_SENTINEL);
            MemorySegment reference = MemorySegment.ofArray(expected);
            // Snapshot all source lanes before an overlapping destination write.
            double[] ds = new double[4];
            long[] ls = new long[4];
            for (int lane = 0; lane < 4; lane++) {
                ds[lane] = DOUBLE_VALUES[(index + lane) % DOUBLE_VALUES.length];
                ls[lane] = LONG_VALUES[(index + lane) % LONG_VALUES.length];
                if (conversion < 2 || conversion >= 4) {
                    reference.set(ValueLayout.JAVA_DOUBLE_UNALIGNED, 32 + lane * 8, ds[lane]);
                } else {
                    reference.set(ValueLayout.JAVA_LONG_UNALIGNED, 32 + lane * 8, ls[lane]);
                }
            }
            segment.copyFrom(reference);
            switch (conversion) {
                case 0 -> testD2SAlias();
                case 1 -> testD2FAlias();
                case 2 -> testL2FAlias();
                case 3 -> testL2BAlias();
                case 4 -> testSharedCastStore();
                case 5 -> testHeapAliasFallback();
            }
            for (int lane = 0; lane < 4; lane++) {
                switch (conversion) {
                    case 0 -> reference.set(ValueLayout.JAVA_SHORT_UNALIGNED, 34 + lane * 2, (short) ds[lane]);
                    case 1, 5 -> reference.set(ValueLayout.JAVA_FLOAT_UNALIGNED, 34 + lane * 4, (float) ds[lane]);
                    case 2 -> reference.set(ValueLayout.JAVA_FLOAT_UNALIGNED, 34 + lane * 4, (float) ls[lane]);
                    case 3 -> reference.set(ValueLayout.JAVA_BYTE, 34 + lane, (byte) ls[lane]);
                    case 4 -> {
                        reference.set(ValueLayout.JAVA_FLOAT_UNALIGNED, lane * 4, (float) ds[lane]);
                        reference.set(ValueLayout.JAVA_FLOAT_UNALIGNED, 34 + lane * 4, (float) ds[lane]);
                    }
                }
            }
            if (conversion == 3) {
                // The minimum byte species has eight lanes; the upper four are zero.
                for (int lane = 4; lane < 8; lane++) {
                    reference.set(ValueLayout.JAVA_BYTE, 34 + lane, (byte) 0);
                }
            }
            for (int i = 0; i < 128; i++) {
                boolean floatStore = (conversion == 1 || conversion == 2 || conversion >= 4) && i >= 34 && i < 50;
                boolean sharedFloatStore = conversion == 4 && i < 16;
                if (floatStore || sharedFloatStore) {
                    int start = sharedFloatStore ? 0 : 34;
                    if ((i - start) % 4 == 0) {
                        checkFloat(segment.get(ValueLayout.JAVA_FLOAT_UNALIGNED, i),
                                   reference.get(ValueLayout.JAVA_FLOAT_UNALIGNED, i));
                    }
                } else {
                    Asserts.assertEQ(segment.get(ValueLayout.JAVA_BYTE, i), expected[i]);
                }
            }
        }
    }

    @DontCompile
    private static void checkFloat(float actual, float expected) {
        if (Float.isNaN(expected)) {
            Asserts.assertTrue(Float.isNaN(actual));
        } else {
            Asserts.assertEQ(Float.floatToRawIntBits(actual), Float.floatToRawIntBits(expected));
        }
    }
}
