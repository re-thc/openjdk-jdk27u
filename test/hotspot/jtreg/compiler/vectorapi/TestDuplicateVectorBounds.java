/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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
import jdk.test.lib.Asserts;

/*
 * @test
 * @summary Eliminate duplicate vector bounds checks without losing cast or memory dependencies
 * @requires vm.compiler2.enabled
 * @modules jdk.incubator.vector
 * @library /test/lib /
 * @run driver compiler.vectorapi.TestDuplicateVectorBounds
 */
public class TestDuplicateVectorBounds {
    private static final byte[] TARGET = new byte[64];
    private static final byte[] SOURCE = new byte[4096];
    private static final long[] LENGTHS = new long[128];
    private static int marker;

    static {
        for (int i = 0; i < SOURCE.length; i++) SOURCE[i] = (byte) i;
        for (int i = 0; i < LENGTHS.length; i++) LENGTHS[i] = i % 17;
    }

    public static void main(String[] args) {
        TestFramework.runWithFlags("--add-modules=jdk.incubator.vector", "-XX:LoopMaxUnroll=0",
                                   "-Djdk.incubator.vector.VECTOR_ACCESS_OOB_CHECK=2");
    }

    // RangeCheck nodes become ordinary If nodes during final graph reshaping;
    // inspect the graph before that lowering.
    @Test
    @IR(failOn = {"RangeCheck.*Objects::checkIndex.*ByteVector::fromArray"}, phase = CompilePhase.AFTER_MACRO_EXPANSION,
        counts = {IRNode.LOAD_VECTOR_B, IRNode.VECTOR_SIZE_16, "1"},
        applyIfCPUFeatureOr = {"sse2", "true", "asimd", "true"},
        applyIf = {"MaxVectorSize", ">=16"})
    public static int copy(byte[] literals, int literalSize, long[] packed) {
        int literal = 0;
        int wildIn = literals.length - 32;
        for (int i = 0; i < packed.length; i++) {
            int ll = (int) packed[i] & 0x1ffff;
            if (ll != 0 && ll > literalSize - literal) throw new IllegalArgumentException();
            if (literal + ll <= wildIn && ll <= 16) {
                int bound = literals.length - 15;
                if (bound < 0 || Integer.compareUnsigned(literal, bound) >= 0) throw new AssertionError();
                ByteVector.fromArray(ByteVector.SPECIES_128, literals, literal).intoArray(TARGET, i & 15);
            }
            literal += ll;
        }
        return literal;
    }

    // Compile all methods before any exception case can pollute the shared
    // Preconditions.checkIndex profile and disable its intrinsic in other tests.
    @Run(test = {"copy", "copyFrom", "ordered", "differentOffset", "differentIndex", "differentArray",
                 "signed", "conditional", "storeBetween"})
    public static void runAll(RunInfo info) {
        runCopy();
        if (!info.isWarmUp()) checkAliasing(info);
        runGuards(info);
        runCopyFrom(info);
    }

    private static void runCopy() {
        byte[] expected = new byte[64];
        int literal = 0;
        for (int i = 0; i < LENGTHS.length; i++) {
            if (literal + LENGTHS[i] <= SOURCE.length - 32) {
                System.arraycopy(SOURCE, literal, expected, i & 15, 16);
            }
            literal += LENGTHS[i];
        }
        Asserts.assertEquals(copy(SOURCE, 2048, LENGTHS), literal);
        Asserts.assertTrue(Arrays.equals(TARGET, expected));
    }

    // The unsigned guard can pass for short arrays: its bound wraps below zero.
    // A marker between the guards also makes their order observable.
    // The checkIndex result must stay pinned below the signed guard. The vector
    // load created later during intrinsic expansion depends on this result.
    @Test
    @IR(failOn = {IRNode.RANGE_CHECK},
        counts = {"CastII.*non-floating", ">=1", IRNode.LOAD_VECTOR_B, IRNode.VECTOR_SIZE_16, "1"},
        phase = CompilePhase.AFTER_MACRO_EXPANSION,
        applyIfCPUFeatureOr = {"sse2", "true", "asimd", "true"},
        applyIf = {"MaxVectorSize", ">=16"})
    public static int ordered(byte[] source, int index) {
        int bound = source.length - 15;
        if (Integer.compareUnsigned(index, bound) >= 0) return -1;
        marker++;
        if (bound < 0) return -2;
        ByteVector.fromArray(ByteVector.SPECIES_128, source, index).intoArray(TARGET, 0);
        return 0;
    }

    @Test
    @IR(counts = {IRNode.RANGE_CHECK, ">=1"}, phase = CompilePhase.AFTER_MACRO_EXPANSION,
        applyIfCPUFeatureOr = {"sse2", "true", "asimd", "true"},
        applyIf = {"MaxVectorSize", ">=16"})
    public static void differentOffset(byte[] source, int index) {
        int bound = source.length - 14;
        if (bound < 0 || Integer.compareUnsigned(index, bound) >= 0) throw new IllegalArgumentException();
        ByteVector.fromArray(ByteVector.SPECIES_128, source, index).intoArray(TARGET, 0);
    }

    @Test
    @IR(counts = {IRNode.RANGE_CHECK, ">=1"}, phase = CompilePhase.AFTER_MACRO_EXPANSION,
        applyIfCPUFeatureOr = {"sse2", "true", "asimd", "true"},
        applyIf = {"MaxVectorSize", ">=16"})
    public static void differentIndex(byte[] source, int index) {
        int bound = source.length - 15;
        if (bound < 0 || Integer.compareUnsigned(index, bound) >= 0) throw new IllegalArgumentException();
        ByteVector.fromArray(ByteVector.SPECIES_128, source, index + 1).intoArray(TARGET, 0);
    }

    @Test
    @IR(counts = {IRNode.RANGE_CHECK, ">=1"}, phase = CompilePhase.AFTER_MACRO_EXPANSION,
        applyIfCPUFeatureOr = {"sse2", "true", "asimd", "true"},
        applyIf = {"MaxVectorSize", ">=16"})
    public static void differentArray(byte[] checked, byte[] source, int index) {
        int bound = checked.length - 15;
        if (bound < 0 || Integer.compareUnsigned(index, bound) >= 0) throw new IllegalArgumentException();
        ByteVector.fromArray(ByteVector.SPECIES_128, source, index).intoArray(TARGET, 0);
    }

    @Test
    @IR(counts = {IRNode.RANGE_CHECK, ">=1"}, phase = CompilePhase.AFTER_MACRO_EXPANSION,
        applyIfCPUFeatureOr = {"sse2", "true", "asimd", "true"},
        applyIf = {"MaxVectorSize", ">=16"})
    public static void signed(byte[] source, int index) {
        int bound = source.length - 15;
        if (bound < 0 || index >= bound) throw new IllegalArgumentException();
        ByteVector.fromArray(ByteVector.SPECIES_128, source, index).intoArray(TARGET, 0);
    }

    @Test
    @IR(counts = {IRNode.RANGE_CHECK, ">=1"}, phase = CompilePhase.AFTER_MACRO_EXPANSION,
        applyIfCPUFeatureOr = {"sse2", "true", "asimd", "true"},
        applyIf = {"MaxVectorSize", ">=16"})
    public static void conditional(byte[] source, int index, boolean check) {
        int bound = source.length - 15;
        if (check && (bound < 0 || Integer.compareUnsigned(index, bound) >= 0)) {
            throw new IllegalArgumentException();
        }
        ByteVector.fromArray(ByteVector.SPECIES_128, source, index).intoArray(TARGET, 0);
    }

    @Test
    public static void storeBetween(byte[] source, byte[] target, int index, byte value) {
        int bound = source.length - 15;
        if (bound < 0 || Integer.compareUnsigned(index, bound) >= 0) throw new IllegalArgumentException();
        source[index] = value;
        ByteVector.fromArray(ByteVector.SPECIES_128, source, index).intoArray(target, 0);
    }

    private static void runGuards(RunInfo info) {
        byte[] target = new byte[64];
        ordered(SOURCE, 1);
        ordered(SOURCE, -1);
        ordered(new byte[0], 0);
        differentOffset(SOURCE, 1);
        differentIndex(SOURCE, 1);
        differentArray(SOURCE, SOURCE, 1);
        signed(SOURCE, 1);
        conditional(SOURCE, 1, true);
        conditional(SOURCE, 1, false);
        storeBetween(SOURCE, target, 1, (byte) 42);
        Asserts.assertEquals(target[0], (byte) 42);
        if (info.isWarmUp()) return;

        boolean orderedWasC2Compiled = info.isTestC2Compiled("ordered");
        for (int length = 0; length < 33; length++) {
            byte[] source = new byte[length];
            for (int index : new int[] {-1, 0, 1, 15, 16, 17, Integer.MAX_VALUE, Integer.MIN_VALUE}) {
                int bound = length - 15;
                int before = marker;
                int expected = Integer.compareUnsigned(index, bound) >= 0 ? -1 : bound < 0 ? -2 : 0;
                Asserts.assertEquals(ordered(source, index), expected);
                Asserts.assertEquals(marker, before + (Integer.compareUnsigned(index, bound) >= 0 ? 0 : 1));
                if (index < 0 || index > length - 16) {
                    expect(IndexOutOfBoundsException.class, () -> conditional(source, index, false));
                }
            }
        }
        Asserts.assertTrue(!orderedWasC2Compiled || info.isTestC2Compiled("ordered"),
                           "The short-array guard cases must execute without deoptimizing ordered");
        expect(IndexOutOfBoundsException.class, () -> differentOffset(new byte[32], 17));
        expect(IndexOutOfBoundsException.class, () -> differentIndex(new byte[32], 16));
        expect(IndexOutOfBoundsException.class, () -> differentArray(SOURCE, new byte[15], 0));
        expect(IndexOutOfBoundsException.class, () -> signed(SOURCE, -1));
        expect(NullPointerException.class, () -> ordered(null, 0));
        expect(NullPointerException.class, () -> differentArray(SOURCE, null, 0));
        expect(IllegalArgumentException.class, () -> differentArray(new byte[0], null, 0));
        byte[] source = new byte[32];
        expect(NullPointerException.class, () -> storeBetween(source, null, 0, (byte) 7));
        Asserts.assertEquals(source[0], (byte) 7);
        expect(IndexOutOfBoundsException.class, () -> storeBetween(source, new byte[15], 0, (byte) 8));
        Asserts.assertEquals(source[0], (byte) 8);
        expect(IllegalArgumentException.class, () -> storeBetween(new byte[0], null, 0, (byte) 1));
    }

    // An arbitrary entry cursor prevents the separate zero-based induction proof
    // from satisfying this rule. This must exercise direct duplicate recognition.
    @Test
    @IR(failOn = {"RangeCheck.*Objects::checkIndex.*ByteVector::fromArray"}, phase = CompilePhase.AFTER_MACRO_EXPANSION,
        counts = {IRNode.LOAD_VECTOR_B, IRNode.VECTOR_SIZE_16, "1"},
        applyIfCPUFeatureOr = {"sse2", "true", "asimd", "true"},
        applyIf = {"MaxVectorSize", ">=16"})
    public static int copyFrom(byte[] literals, byte[] target, int literalSize, int literal, long[] packed) {
        int wildIn = literals.length - 32;
        for (int i = 0; i < packed.length; i++) {
            int ll = (int) packed[i] & 0x1ffff;
            if (ll != 0 && ll > literalSize - literal) throw new IllegalArgumentException();
            if (literal + ll <= wildIn && ll <= 16) {
                int bound = literals.length - 15;
                if (bound < 0 || Integer.compareUnsigned(literal, bound) >= 0) throw new AssertionError();
                ByteVector.fromArray(ByteVector.SPECIES_128, literals, literal).intoArray(target, i & 15);
            }
            literal += ll;
        }
        return literal;
    }

    private static void runCopyFrom(RunInfo info) {
        byte[] target = new byte[64];
        Asserts.assertEquals(copyFrom(SOURCE, target, 2048, 0, LENGTHS), 988);
        if (info.isWarmUp()) return;
        Asserts.assertEquals(copyFrom(new byte[0], null, -1, 0, new long[] {0}), 0);
        Asserts.assertEquals(copyFrom(SOURCE, target, Integer.MAX_VALUE, Integer.MAX_VALUE, new long[] {0}),
                             Integer.MAX_VALUE);
        expect(IllegalArgumentException.class, () -> copyFrom(SOURCE, target, -1, 0, new long[] {1}));
        expect(IllegalArgumentException.class, () -> copyFrom(SOURCE, target, Integer.MAX_VALUE,
                                                              Integer.MAX_VALUE, new long[] {1}));
        expect(NullPointerException.class, () -> copyFrom(null, target, 0, 0, new long[] {0}));
        expect(NullPointerException.class, () -> copyFrom(SOURCE, null, 2048, 0, new long[] {0}));
        expect(IndexOutOfBoundsException.class, () -> copyFrom(SOURCE, new byte[15], 2048, 0, new long[] {0}));
    }

    // Exercise aliasing before any cold exception path can deoptimize these methods.
    private static void checkAliasing(RunInfo info) {
        boolean storeWasC2Compiled = info.isTestC2Compiled("storeBetween");
        byte[] source = new byte[32];
        for (int i = 0; i < source.length; i++) source[i] = (byte) i;
        byte[] expected = source.clone();
        expected[1] = 99;
        System.arraycopy(expected, 1, expected, 0, 16);
        storeBetween(source, source, 1, (byte) 99);
        Asserts.assertTrue(Arrays.equals(source, expected));
        Asserts.assertTrue(!storeWasC2Compiled || info.isTestC2Compiled("storeBetween"),
                           "The intervening-store alias case must execute without deoptimizing");

        boolean copyWasC2Compiled = info.isTestC2Compiled("copyFrom");
        byte[] alias = new byte[64];
        for (int i = 0; i < alias.length; i++) alias[i] = (byte) i;
        expected = alias.clone();
        long[] lengths = {0, 1, 16, 0, 2};
        int literal = 0;
        for (int i = 0; i < lengths.length; i++) {
            int ll = (int) lengths[i];
            System.arraycopy(expected, literal, expected, i & 15, 16);
            literal += ll;
        }
        Asserts.assertEquals(copyFrom(alias, alias, 64, 0, lengths), literal);
        Asserts.assertTrue(Arrays.equals(alias, expected));
        Asserts.assertTrue(!copyWasC2Compiled || info.isTestC2Compiled("copyFrom"),
                           "The running-copy alias case must execute without deoptimizing");
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
