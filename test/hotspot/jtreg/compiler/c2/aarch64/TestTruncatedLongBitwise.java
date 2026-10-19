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
 * @summary Fold int truncation into register-form long bitwise operations on AArch64.
 * @requires vm.compiler2.enabled
 * @library /test/lib /
 * @run driver compiler.c2.aarch64.TestTruncatedLongBitwise
 */
package compiler.c2.aarch64;

import java.util.Random;
import compiler.lib.ir_framework.*;
import jdk.test.lib.Asserts;

public class TestTruncatedLongBitwise {
    private static final String FUSED = "\\b(?:and|or|xor)LConvL2I\\b";
    private static final String CONVERSION = "\\bconvL2I_reg\\b";
    private static final long CONSTANT = 0x00ff_0000_abcd_1234L;
    private static final long IMMEDIATE = 0x00ff_00ff_00ff_00ffL;
    private static final Random RANDOM = new Random(27);
    private static final long[] VALUES = new long[16];

    public static void main(String[] args) {
        TestFramework.run();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.AND_L, "1", IRNode.CONV_L2I, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        counts = {"\\bandLConvL2I\\b", "1"}, failOn = {CONVERSION})
    public static int and(long x, long y) { return (int)(x & y); }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.OR_L, "1", IRNode.CONV_L2I, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        counts = {"\\borLConvL2I\\b", "1"}, failOn = {CONVERSION})
    public static int or(long x, long y) { return (int)(x | y); }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.XOR_L, "1", IRNode.CONV_L2I, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        counts = {"\\bxorLConvL2I\\b", "1"}, failOn = {CONVERSION})
    public static int xor(long x, long y) { return (int)(x ^ y); }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        counts = {"\\bandLConvL2I\\b", "1"}, failOn = {CONVERSION})
    public static int mask(long x, int width) { return (int)(x & ((1L << width) - 1)); }

    // Exclude both materialized and logical-immediate constants from the new rules.

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING, failOn = {FUSED})
    public static int constantAnd(long x) { return (int)(x & CONSTANT); }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING, failOn = {FUSED})
    public static int constantOr(long x) { return (int)(x | CONSTANT); }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING, failOn = {FUSED})
    public static int constantXor(long x) { return (int)(x ^ CONSTANT); }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING, failOn = {FUSED})
    public static int immediateAnd(long x) { return (int)(x & IMMEDIATE); }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING, failOn = {FUSED})
    public static int immediateOr(long x) { return (int)(x | IMMEDIATE); }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING, failOn = {FUSED})
    public static int immediateXor(long x) { return (int)(x ^ IMMEDIATE); }

    // Exercise interactions with existing shifted logical rules without
    // prescribing the chosen instruction sequence.

    @Test(compLevel = CompLevel.C2)
    public static int shiftedAnd(long x, long y) { return (int)((x >>> 7) & y); }

    @Test(compLevel = CompLevel.C2)
    public static int shiftedOr(long x, long y) { return (int)((x >>> 7) | y); }

    @Test(compLevel = CompLevel.C2)
    public static int shiftedXor(long x, long y) { return (int)((x >>> 7) ^ y); }

    @Test(compLevel = CompLevel.C2)
    public static int leftShiftedAnd(long x, long y) { return (int)((x << 7) & y); }

    @Test(compLevel = CompLevel.C2)
    public static int leftShiftedOr(long x, long y) { return (int)((x << 7) | y); }

    @Test(compLevel = CompLevel.C2)
    public static int leftShiftedXor(long x, long y) { return (int)((x << 7) ^ y); }

    @Test(compLevel = CompLevel.C2)
    public static int rightShiftedAnd(long x, long y) { return (int)((x >> 7) & y); }

    @Test(compLevel = CompLevel.C2)
    public static int rightShiftedOr(long x, long y) { return (int)((x >> 7) | y); }

    @Test(compLevel = CompLevel.C2)
    public static int rightShiftedXor(long x, long y) { return (int)((x >> 7) ^ y); }

    @Test(compLevel = CompLevel.C2)
    public static int rotatedAnd(long x, long y) { return (int)(Long.rotateRight(x, 13) & y); }

    @Test(compLevel = CompLevel.C2)
    public static int rotatedOr(long x, long y) { return (int)(Long.rotateRight(x, 13) | y); }

    @Test(compLevel = CompLevel.C2)
    public static int rotatedXor(long x, long y) { return (int)(Long.rotateRight(x, 13) ^ y); }

    // Preserve a shared full-width logical result as well as its narrowed value.

    @Test(compLevel = CompLevel.C2)
    public static long sharedAnd(long x, long y) {
        long full = x & y;
        return full + (int)full;
    }

    @Test(compLevel = CompLevel.C2)
    public static long sharedOr(long x, long y) {
        long full = x | y;
        return full + (int)full;
    }

    @Test(compLevel = CompLevel.C2)
    public static long sharedXor(long x, long y) {
        long full = x ^ y;
        return full + (int)full;
    }

    // Widening must sign-extend a negative int even though a W-register write clears the high bits.

    @Test(compLevel = CompLevel.C2)
    public static long widenedAnd(long x, long y) { return (int)(x & y); }

    @Test(compLevel = CompLevel.C2)
    public static long widenedOr(long x, long y) { return (int)(x | y); }

    @Test(compLevel = CompLevel.C2)
    public static long widenedXor(long x, long y) { return (int)(x ^ y); }

    @Test(compLevel = CompLevel.C2)
    public static int loadedAnd(long[] values) { return (int)(values[0] & values[1]); }

    @Test(compLevel = CompLevel.C2)
    public static int loadedOr(long[] values) { return (int)(values[0] | values[1]); }

    @Test(compLevel = CompLevel.C2)
    public static int loadedXor(long[] values) { return (int)(values[0] ^ values[1]); }

    // Keep the narrowed result live across a call with many full-width arguments.
    // This exercises call/register pressure and stack arguments alongside loads.

    @Test(compLevel = CompLevel.C2)
    public static long pressureAnd(long[] values) {
        int narrowed = (int)(values[0] & values[1]);
        return consume(values[0], values[1], values[2], values[3],
                       values[4], values[5], values[6], values[7],
                       values[8], values[9], values[10], values[11],
                       values[12], values[13], values[14], values[15]) + narrowed;
    }

    @Test(compLevel = CompLevel.C2)
    public static long pressureOr(long[] values) {
        int narrowed = (int)(values[0] | values[1]);
        return consume(values[0], values[1], values[2], values[3],
                       values[4], values[5], values[6], values[7],
                       values[8], values[9], values[10], values[11],
                       values[12], values[13], values[14], values[15]) + narrowed;
    }

    @Test(compLevel = CompLevel.C2)
    public static long pressureXor(long[] values) {
        int narrowed = (int)(values[0] ^ values[1]);
        return consume(values[0], values[1], values[2], values[3],
                       values[4], values[5], values[6], values[7],
                       values[8], values[9], values[10], values[11],
                       values[12], values[13], values[14], values[15]) + narrowed;
    }

    @DontInline
    public static long consume(long a, long b, long c, long d, long e, long f, long g, long h,
                               long i, long j, long k, long l, long m, long n, long o, long p) {
        return a + b + c + d + e + f + g + h + i + j + k + l + m + n + o + p;
    }

    @Run(test = {"and", "or", "xor", "mask",
                 "constantAnd", "constantOr", "constantXor", "immediateAnd",
                 "immediateOr", "immediateXor", "shiftedAnd", "shiftedOr",
                 "shiftedXor", "leftShiftedAnd", "leftShiftedOr", "leftShiftedXor",
                 "rightShiftedAnd", "rightShiftedOr", "rightShiftedXor", "rotatedAnd",
                 "rotatedOr", "rotatedXor", "sharedAnd", "sharedOr",
                 "sharedXor", "widenedAnd", "widenedOr", "widenedXor",
                 "loadedAnd", "loadedOr", "loadedXor", "pressureAnd",
                 "pressureOr", "pressureXor"})
    public static void run(RunInfo info) {
        check(RANDOM.nextLong(), RANDOM.nextLong(), RANDOM.nextInt());
        if (!info.isWarmUp()) {
            for (String name : new String[] {"and", "or", "xor", "mask",
                                             "constantAnd", "constantOr", "constantXor", "immediateAnd",
                                             "immediateOr", "immediateXor", "shiftedAnd", "shiftedOr",
                                             "shiftedXor", "leftShiftedAnd", "leftShiftedOr", "leftShiftedXor",
                                             "rightShiftedAnd", "rightShiftedOr", "rightShiftedXor", "rotatedAnd",
                                             "rotatedOr", "rotatedXor", "sharedAnd", "sharedOr",
                                             "sharedXor", "widenedAnd", "widenedOr", "widenedXor",
                                             "loadedAnd", "loadedOr", "loadedXor", "pressureAnd",
                                             "pressureOr", "pressureXor"}) {
                // Honor supported framework modes such as ExcludeRandom.
                TestFramework.assertCompiledByC2(info.getTest(name));
            }
            long[] edges = {0, -1, Long.MIN_VALUE, Long.MAX_VALUE, 0xffff_ffffL,
                            0x8000_0000L, 0xffff_ffff_0000_0000L, 0x7fff_ffffL};
            for (long x : edges) for (long y : edges) check(x, y, 32);
            for (int bit = 0; bit < 64; bit++) {
                check(1L << bit, -1, bit);
                check(~(1L << bit), Long.MAX_VALUE, -bit);
            }
            for (int i = 0; i < 100_000; i++) {
                check(RANDOM.nextLong(), RANDOM.nextLong(), RANDOM.nextInt());
            }
        }
    }

    private static int expected(long x, long y, int operation) {
        int result = 0;
        for (int bit = 0; bit < 32; bit++) {
            boolean a = (x & (1L << bit)) != 0;
            boolean b = (y & (1L << bit)) != 0;
            boolean set = operation == 0 ? a && b : operation == 1 ? a || b : a != b;
            if (set) result |= 1 << bit;
        }
        return result;
    }

    private static void check(long x, long y, int width) {
        VALUES[0] = x;
        VALUES[1] = y;
        long sum = x + y;
        for (int i = 2; i < VALUES.length; i++) {
            VALUES[i] = Long.rotateLeft(x, i) + Long.rotateRight(y, i);
            sum += VALUES[i];
        }
        int andExpected = expected(x, y, 0);
        int orExpected = expected(x, y, 1);
        int xorExpected = expected(x, y, 2);
        Asserts.assertEQ(and(x, y), andExpected, "and");
        Asserts.assertEQ(constantAnd(x), expected(x, CONSTANT, 0), "constantAnd");
        Asserts.assertEQ(immediateAnd(x), expected(x, IMMEDIATE, 0), "immediateAnd");
        Asserts.assertEQ(shiftedAnd(x, y), expected(x >>> 7, y, 0), "shiftedAnd");
        Asserts.assertEQ(leftShiftedAnd(x, y), expected(x << 7, y, 0), "leftShiftedAnd");
        Asserts.assertEQ(rightShiftedAnd(x, y), expected(x >> 7, y, 0), "rightShiftedAnd");
        Asserts.assertEQ(rotatedAnd(x, y), expected((x >>> 13) | (x << 51), y, 0), "rotatedAnd");
        Asserts.assertEQ(sharedAnd(x, y), (x & y) + (long)andExpected, "sharedAnd");
        Asserts.assertEQ(widenedAnd(x, y), (long)andExpected, "widenedAnd");
        Asserts.assertEQ(loadedAnd(VALUES), andExpected, "loadedAnd");
        Asserts.assertEQ(pressureAnd(VALUES), sum + (long)andExpected, "pressureAnd");
        Asserts.assertEQ(or(x, y), orExpected, "or");
        Asserts.assertEQ(constantOr(x), expected(x, CONSTANT, 1), "constantOr");
        Asserts.assertEQ(immediateOr(x), expected(x, IMMEDIATE, 1), "immediateOr");
        Asserts.assertEQ(shiftedOr(x, y), expected(x >>> 7, y, 1), "shiftedOr");
        Asserts.assertEQ(leftShiftedOr(x, y), expected(x << 7, y, 1), "leftShiftedOr");
        Asserts.assertEQ(rightShiftedOr(x, y), expected(x >> 7, y, 1), "rightShiftedOr");
        Asserts.assertEQ(rotatedOr(x, y), expected((x >>> 13) | (x << 51), y, 1), "rotatedOr");
        Asserts.assertEQ(sharedOr(x, y), (x | y) + (long)orExpected, "sharedOr");
        Asserts.assertEQ(widenedOr(x, y), (long)orExpected, "widenedOr");
        Asserts.assertEQ(loadedOr(VALUES), orExpected, "loadedOr");
        Asserts.assertEQ(pressureOr(VALUES), sum + (long)orExpected, "pressureOr");
        Asserts.assertEQ(xor(x, y), xorExpected, "xor");
        Asserts.assertEQ(constantXor(x), expected(x, CONSTANT, 2), "constantXor");
        Asserts.assertEQ(immediateXor(x), expected(x, IMMEDIATE, 2), "immediateXor");
        Asserts.assertEQ(shiftedXor(x, y), expected(x >>> 7, y, 2), "shiftedXor");
        Asserts.assertEQ(leftShiftedXor(x, y), expected(x << 7, y, 2), "leftShiftedXor");
        Asserts.assertEQ(rightShiftedXor(x, y), expected(x >> 7, y, 2), "rightShiftedXor");
        Asserts.assertEQ(rotatedXor(x, y), expected((x >>> 13) | (x << 51), y, 2), "rotatedXor");
        Asserts.assertEQ(sharedXor(x, y), (x ^ y) + (long)xorExpected, "sharedXor");
        Asserts.assertEQ(widenedXor(x, y), (long)xorExpected, "widenedXor");
        Asserts.assertEQ(loadedXor(VALUES), xorExpected, "loadedXor");
        Asserts.assertEQ(pressureXor(VALUES), sum + (long)xorExpected, "pressureXor");
        Asserts.assertEQ(mask(x, width), expected(x, (1L << width) - 1, 0), "mask");
    }
}
