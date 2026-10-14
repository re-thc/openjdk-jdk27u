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

import compiler.lib.ir_framework.*;
import jdk.incubator.vector.IntVector;
import jdk.incubator.vector.VectorOperators;
import jdk.incubator.vector.VectorSpecies;
import jdk.test.lib.Asserts;
import jdk.test.lib.Platform;

/*
 * @test
 * @summary Check reusable SVE multiply broadcasts and short-vector fallbacks
 * @requires vm.compiler2.enabled
 * @modules jdk.incubator.vector
 * @library /test/lib /
 * @run driver compiler.c2.irTests.TestAArch64SVEMulVConstants
 */
public class TestAArch64SVEMulVConstants {
    private static final int SIZE = 3033;
    private static final VectorSpecies<Integer> SPECIES = IntVector.SPECIES_PREFERRED;
    private static final int[] LENGTHS = {0, 1, 7, 15, 16, 17, 31, 32, 33, 63, 65, 127, 3000};
    private static final int[] OFFSETS = {0, 1, 3};
    private static final int[] FACTORS = {0, 1, -1, -7, -311, -104729,
                                         Byte.MIN_VALUE, Byte.MAX_VALUE, Short.MIN_VALUE, Short.MAX_VALUE,
                                         Integer.MIN_VALUE, Integer.MAX_VALUE};
    private static final byte[] BYTE_A = new byte[SIZE];
    private static final byte[] BYTE_B = new byte[SIZE];
    private static final byte[] BYTE_D1 = new byte[SIZE];
    private static final byte[] BYTE_D2 = new byte[SIZE];
    private static final short[] SHORT_A = new short[SIZE];
    private static final short[] SHORT_B = new short[SIZE];
    private static final short[] SHORT_D1 = new short[SIZE];
    private static final short[] SHORT_D2 = new short[SIZE];
    private static final int[] INT_A = new int[SIZE];
    private static final int[] INT_B = new int[SIZE];
    private static final int[] INT_D1 = new int[SIZE];
    private static final int[] INT_D2 = new int[SIZE];
    private int iteration;

    // Reject a broadcast as the destructive first source of a matched SVE multiply.
    private static final String MULTIPLY_BEFORE_BROADCAST =
            "(?ms)^\\s*\\d+\\s+vmul[BSI]_sve\\s+===\\s+_\\s+(\\d+)\\b.*?" +
            "^\\s*\\1\\s+replicateI\\b";
    private static final String BROADCAST_BEFORE_MULTIPLY =
            "(?ms)^\\s*(\\d+)\\s+replicateI\\b.*?" +
            "^\\s*\\d+\\s+vmul[BSI]_sve\\s+===\\s+_\\s+\\1\\b";

    static {
        for (int i = 0; i < SIZE; i++) {
            BYTE_A[i] = (byte) (i * 7 - 120);
            BYTE_B[i] = (byte) (90 - i * 5);
            SHORT_A[i] = (short) (i * 19 - 30000);
            SHORT_B[i] = (short) (25000 - i * 23);
            INT_A[i] = i * 0x12345 - 0x5678_9abc;
            INT_B[i] = 0x1357_2468 - i * 0x54321;
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
    @IR(applyIfPlatform = {"aarch64", "true"},
        applyIfAnd = {"UseSVE", "> 0", "MaxVectorSize", "> 16", "UseSuperWord", "true"},
        failOn = {MULTIPLY_BEFORE_BROADCAST, BROADCAST_BEFORE_MULTIPLY}, counts = {"vmulB_sve", ">0"}, phase = CompilePhase.MATCHING)
    private static void testByte(int start, int end, byte factor) {
        for (int i = start; i < end; i++) {
            BYTE_D1[i] = (byte) (factor * BYTE_A[i]);
            BYTE_D2[i] = (byte) (factor * BYTE_B[i]);
        }
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"},
        applyIfAnd = {"UseSVE", "> 0", "MaxVectorSize", "> 16", "UseSuperWord", "true"},
        failOn = {MULTIPLY_BEFORE_BROADCAST, BROADCAST_BEFORE_MULTIPLY}, counts = {"vmulS_sve", ">0"}, phase = CompilePhase.MATCHING)
    private static void testShort(int start, int end, short factor) {
        for (int i = start; i < end; i++) {
            SHORT_D1[i] = (short) (factor * SHORT_A[i]);
            SHORT_D2[i] = (short) (factor * SHORT_B[i]);
        }
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"},
        applyIfAnd = {"UseSVE", "> 0", "MaxVectorSize", "> 16", "UseSuperWord", "true"},
        failOn = {MULTIPLY_BEFORE_BROADCAST, BROADCAST_BEFORE_MULTIPLY}, counts = {"vmulI_sve", ">0"}, phase = CompilePhase.MATCHING)
    private static void testInt(int start, int end, int factor) {
        for (int i = start; i < end; i++) {
            INT_D1[i] = factor * INT_A[i];
            INT_D2[i] = factor * INT_B[i];
        }
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"},
        applyIfAnd = {"UseSVE", "> 0", "MaxVectorSize", "> 16"},
        counts = {"vmulI_sve", "1"}, phase = CompilePhase.MATCHING)
    private static void testSingleUseBroadcast(int offset, int factor) {
        IntVector broadcast = IntVector.broadcast(SPECIES, factor);
        IntVector data = IntVector.fromArray(SPECIES, INT_A, offset);
        data.mul(broadcast).lanewise(VectorOperators.XOR, data).intoArray(INT_D1, offset);
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"},
        applyIfAnd = {"UseSVE", "> 0", "MaxVectorSize", "> 16"},
        counts = {"vmulI_sve", "2"}, phase = CompilePhase.MATCHING)
    private static void testSharedBroadcastAndData(int offset, int factor) {
        IntVector broadcast = IntVector.broadcast(SPECIES, factor);
        IntVector a = IntVector.fromArray(SPECIES, INT_A, offset);
        IntVector b = IntVector.fromArray(SPECIES, INT_B, offset);
        a.mul(broadcast).lanewise(VectorOperators.XOR, a).intoArray(INT_D1, offset);
        b.mul(broadcast).lanewise(VectorOperators.XOR, b).intoArray(INT_D2, offset);
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"},
        applyIfAnd = {"UseSVE", "> 0", "MaxVectorSize", "> 16"},
        failOn = {"vmulI_sve"}, counts = {"\\bvaddImmI(?:_\\d+)?\\b", "1"}, phase = CompilePhase.MATCHING)
    private static void testCommutedMultiply(int offset, int factor) {
        IntVector broadcast = IntVector.broadcast(SPECIES, factor);
        IntVector data = IntVector.fromArray(SPECIES, INT_A, offset);
        IntVector left = data.mul(broadcast);
        IntVector right = broadcast.mul(data);
        left.lanewise(VectorOperators.XOR, right)
            .lanewise(VectorOperators.XOR, data.add(42)).intoArray(INT_D1, offset);
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"},
        applyIfAnd = {"UseSVE", "> 0", "MaxVectorSize", "> 16"},
        counts = {"\\bvmla(?:_\\d+)?\\b", "1"}, phase = CompilePhase.MATCHING)
    private static void testMultiplyAdd(int offset, int factor) {
        IntVector broadcast = IntVector.broadcast(SPECIES, factor);
        IntVector data = IntVector.fromArray(SPECIES, INT_A, offset);
        data.mul(broadcast).add(data).intoArray(INT_D1, offset);
    }

    @Test
    @IR(applyIfPlatform = {"aarch64", "true"},
        applyIfAnd = {"UseSVE", "> 0", "MaxVectorSize", "> 16"},
        counts = {"\\bvmls(?:_\\d+)?\\b", "1"}, phase = CompilePhase.MATCHING)
    private static void testMultiplySubtract(int offset, int factor) {
        IntVector broadcast = IntVector.broadcast(SPECIES, factor);
        IntVector data = IntVector.fromArray(SPECIES, INT_A, offset);
        data.sub(data.mul(broadcast)).intoArray(INT_D1, offset);
    }

    @Run(test = {"testByte", "testShort", "testInt", "testSingleUseBroadcast", "testSharedBroadcastAndData",
                 "testCommutedMultiply", "testMultiplyAdd", "testMultiplySubtract"})
    private void run(RunInfo info) {
        int cases = LENGTHS.length * OFFSETS.length * FACTORS.length;
        if (info.isWarmUp()) {
            // Profile a long loop for the wide-vector matching assertions.
            // Check short lengths, offsets and all boundary factors after compilation.
            int factor = FACTORS[iteration++ % FACTORS.length];
            testByte(0, 3000, (byte) factor);
            testShort(0, 3000, (short) factor);
            testInt(0, 3000, factor);
            for (int i = 0; i < 10; i++) {
                testSingleUseBroadcast(0, factor);
                testSharedBroadcastAndData(0, factor);
                testCommutedMultiply(0, factor);
                testMultiplyAdd(0, factor);
                testMultiplySubtract(0, factor);
            }
        } else {
            for (int i = 0; i < cases; i++) {
                check(i);
            }
        }
    }

    private static void check(int id) {
        int length = LENGTHS[id % LENGTHS.length];
        int start = OFFSETS[id / LENGTHS.length % OFFSETS.length];
        int end = start + length;
        int factor = FACTORS[id / (LENGTHS.length * OFFSETS.length)];
        Arrays.fill(BYTE_D1, (byte) 42);
        Arrays.fill(BYTE_D2, (byte) 42);
        Arrays.fill(SHORT_D1, (short) 42);
        Arrays.fill(SHORT_D2, (short) 42);
        Arrays.fill(INT_D1, 42);
        Arrays.fill(INT_D2, 42);
        testByte(start, end, (byte) factor);
        testShort(start, end, (short) factor);
        testInt(start, end, factor);
        for (int i = 0; i < SIZE; i++) {
            boolean active = i >= start && i < end;
            Asserts.assertEquals(BYTE_D1[i], active ? (byte) ((byte) factor * BYTE_A[i]) : (byte) 42);
            Asserts.assertEquals(BYTE_D2[i], active ? (byte) ((byte) factor * BYTE_B[i]) : (byte) 42);
            Asserts.assertEquals(SHORT_D1[i], active ? (short) ((short) factor * SHORT_A[i]) : (short) 42);
            Asserts.assertEquals(SHORT_D2[i], active ? (short) ((short) factor * SHORT_B[i]) : (short) 42);
            Asserts.assertEquals(INT_D1[i], active ? factor * INT_A[i] : 42);
            Asserts.assertEquals(INT_D2[i], active ? factor * INT_B[i] : 42);
        }
        testSingleUseBroadcast(start, factor);
        for (int i = start; i < start + SPECIES.length(); i++) {
            Asserts.assertEquals(INT_D1[i], (factor * INT_A[i]) ^ INT_A[i]);
        }
        testSharedBroadcastAndData(start, factor);
        for (int i = start; i < start + SPECIES.length(); i++) {
            Asserts.assertEquals(INT_D1[i], (factor * INT_A[i]) ^ INT_A[i]);
            Asserts.assertEquals(INT_D2[i], (factor * INT_B[i]) ^ INT_B[i]);
        }
        testMultiplyAdd(start, factor);
        for (int i = start; i < start + SPECIES.length(); i++) {
            Asserts.assertEquals(INT_D1[i], factor * INT_A[i] + INT_A[i]);
        }
        testCommutedMultiply(start, factor);
        for (int i = start; i < start + SPECIES.length(); i++) {
            Asserts.assertEquals(INT_D1[i], INT_A[i] + 42);
        }
        testMultiplySubtract(start, factor);
        for (int i = start; i < start + SPECIES.length(); i++) {
            Asserts.assertEquals(INT_D1[i], INT_A[i] - factor * INT_A[i]);
        }
    }
}
