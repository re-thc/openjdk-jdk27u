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
 * @summary Fold logical long shifts of at least 32 into their int conversion on AArch64.
 * @requires vm.compiler2.enabled
 * @library /test/lib /
 * @run driver compiler.c2.aarch64.TestTruncatedLongShift
 */
package compiler.c2.aarch64;

import java.util.Random;
import compiler.lib.ir_framework.*;
import jdk.test.lib.Asserts;

public class TestTruncatedLongShift {
    private static final String FUSED = "\\burShiftLConvL2I\\b";
    private static final String SEPARATE = "\\b(?:urShiftL_reg_imm|convL2I_reg)\\b";
    private static final Random RANDOM = new Random(27);

    public static void main(String[] args) {
        TestFramework.run();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.CONV_L2I, "1", IRNode.URSHIFT_L, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        counts = {FUSED, "1"}, failOn = {SEPARATE})
    public static int shift32(long x) { return (int)(x >>> 32); }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        counts = {FUSED, "1"}, failOn = {SEPARATE})
    public static int shift48(long x) { return (int)(x >>> 48); }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        counts = {FUSED, "1"}, failOn = {SEPARATE})
    public static int shift63(long x) { return (int)(x >>> 63); }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        counts = {FUSED, "1"}, failOn = {SEPARATE})
    public static int shiftNegative(long x) { return (int)(x >>> -16); }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        counts = {FUSED, "1"}, failOn = {SEPARATE})
    public static int shiftWrapped(long x) { return (int)(x >>> 96); }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        counts = {FUSED, "1"}, failOn = {SEPARATE})
    public static int shiftNegative32(long x) { return (int)(x >>> -32); }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        counts = {FUSED, "1"}, failOn = {SEPARATE})
    public static int shiftWrapped63(long x) { return (int)(x >>> 127); }

    // The redundant mask disappears before matching; no AndI remains to fold.
    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.CONV_L2I, "1", IRNode.URSHIFT_L, "1"}, failOn = {IRNode.AND_I})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        counts = {FUSED, "1"}, failOn = {SEPARATE})
    public static int shiftRedundantMask(long x) { return (int)(x >>> 48) & 65535; }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING, failOn = {FUSED})
    public static int shift31(long x) { return (int)(x >>> 31); }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING, failOn = {FUSED})
    public static int shiftWrapped31(long x) { return (int)(x >>> 95); }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING, failOn = {FUSED})
    public static int shiftVariable(long x, int shift) { return (int)(x >>> shift); }

    // These consumers must preserve the distinction between the full long value,
    // the truncated int, and its signed or unsigned extension back to long.
    @Test(compLevel = CompLevel.C2)
    public static long shiftShared(long x) {
        long shifted = x >>> 32;
        return shifted + (int)shifted;
    }

    @Test(compLevel = CompLevel.C2)
    public static long shiftSharedInput(long x) { return x ^ (int)(x >>> 32); }

    @Test(compLevel = CompLevel.C2)
    public static long shiftWiden(long x) { return (long)(int)(x >>> 32); }

    @Test(compLevel = CompLevel.C2)
    public static long shiftWidenUnsigned(long x) { return Integer.toUnsignedLong((int)(x >>> 32)); }

    @Run(test = {"shift32", "shift48", "shift63", "shiftNegative", "shiftWrapped",
                 "shiftNegative32", "shiftWrapped63", "shiftRedundantMask", "shift31",
                 "shiftWrapped31", "shiftVariable", "shiftShared", "shiftSharedInput",
                 "shiftWiden", "shiftWidenUnsigned"})
    public static void run(RunInfo info) {
        check(RANDOM.nextLong(), RANDOM.nextInt());
        if (!info.isWarmUp()) {
            for (String name : new String[] {"shift32", "shift48", "shift63", "shiftNegative",
                                            "shiftWrapped", "shiftNegative32", "shiftWrapped63",
                                            "shiftRedundantMask", "shift31", "shiftWrapped31", "shiftVariable",
                                            "shiftShared", "shiftSharedInput", "shiftWiden", "shiftWidenUnsigned"}) {
                TestFramework.assertCompiledByC2(info.getTest(name));
            }
            for (long x : new long[] {0, -1, Long.MIN_VALUE, Long.MAX_VALUE,
                                      0x7FFFFFFF_00000000L, 0xFFFFFFFF_00000000L}) {
                for (int shift : new int[] {Integer.MIN_VALUE, -65, -33, -32, -16, -1,
                                           0, 31, 32, 63, 64, 95, 96, 127, Integer.MAX_VALUE}) {
                    check(x, shift);
                }
            }
            for (int bit = 0; bit < 64; bit++) {
                check(1L << bit, bit);
                check(~(1L << bit), -bit);
            }
            for (int i = 0; i < 100_000; i++) check(RANDOM.nextLong(), RANDOM.nextInt());
        }
    }

    private static int expected(long x, int shift) {
        int result = 0;
        shift &= 63;
        for (int bit = 0; bit < 32 && shift + bit < 64; bit++) {
            if ((x & (1L << (shift + bit))) != 0) result |= 1 << bit;
        }
        return result;
    }

    private static void check(long x, int shift) {
        int[] actual = {shift32(x), shift48(x), shift63(x), shiftNegative(x), shiftWrapped(x),
                        shiftNegative32(x), shiftWrapped63(x), shiftRedundantMask(x), shift31(x),
                        shiftWrapped31(x), shiftVariable(x, shift)};
        int[] shifts = {32, 48, 63, -16, 96, -32, 127, 48, 31, 95, shift};
        for (int i = 0; i < actual.length; i++) {
            Asserts.assertEQ(actual[i], expected(x, shifts[i]), "case " + i + ", value " + x);
        }
        int truncated = expected(x, 32);
        long unsigned = Integer.toUnsignedLong(truncated);
        Asserts.assertEQ(shiftShared(x), unsigned + truncated, "shared shifted value " + x);
        Asserts.assertEQ(shiftSharedInput(x), x ^ truncated, "shared input " + x);
        Asserts.assertEQ(shiftWiden(x), (long)truncated, "signed extension " + x);
        Asserts.assertEQ(shiftWidenUnsigned(x), unsigned, "unsigned extension " + x);
    }
}
