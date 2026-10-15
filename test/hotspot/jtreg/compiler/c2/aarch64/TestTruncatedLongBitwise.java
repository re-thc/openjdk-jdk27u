/*
 * Copyright (c) 2026, re-thc. All rights reserved.
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
    private static final Random RANDOM = new Random(27);

    public static void main(String[] args) {
        TestFramework.run();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.AND_L, "1", IRNode.CONV_L2I, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        counts = {FUSED, "1"}, failOn = {CONVERSION})
    public static int and(long x, long y) { return (int)(x & y); }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.OR_L, "1", IRNode.CONV_L2I, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        counts = {FUSED, "1"}, failOn = {CONVERSION})
    public static int or(long x, long y) { return (int)(x | y); }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.XOR_L, "1", IRNode.CONV_L2I, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        counts = {FUSED, "1"}, failOn = {CONVERSION})
    public static int xor(long x, long y) { return (int)(x ^ y); }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        counts = {FUSED, "1"}, failOn = {CONVERSION})
    public static int mask(long x, int width) { return (int)(x & ((1L << width) - 1)); }

    // Constants retain their existing lowering and materialization choices.
    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING, failOn = {FUSED})
    public static int constant(long x) { return (int)(x & 0x00ff_0000_abcd_1234L); }

    // Exercise interactions with shifted operands and a second full-width user.
    @Test(compLevel = CompLevel.C2)
    public static int shifted(long x, long y) { return (int)((x >>> 7) & y); }

    @Test(compLevel = CompLevel.C2)
    public static long shared(long x, long y) {
        long full = x & y;
        return full + (int)full;
    }

    @Run(test = {"and", "or", "xor", "mask", "constant", "shifted", "shared"})
    public static void run(RunInfo info) {
        check(RANDOM.nextLong(), RANDOM.nextLong(), RANDOM.nextInt());
        if (!info.isWarmUp()) {
            for (String name : new String[] {"and", "or", "xor", "mask", "constant", "shifted", "shared"}) {
                Asserts.assertTrue(info.isTestC2Compiled(name), name + " must be C2 compiled");
            }
            long[] edges = {0, -1, Long.MIN_VALUE, Long.MAX_VALUE, 0xffff_ffffL};
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
        Asserts.assertEQ(and(x, y), expected(x, y, 0), "and");
        Asserts.assertEQ(or(x, y), expected(x, y, 1), "or");
        Asserts.assertEQ(xor(x, y), expected(x, y, 2), "xor");
        Asserts.assertEQ(mask(x, width), expected(x, (1L << width) - 1, 0), "mask");
        Asserts.assertEQ(constant(x), expected(x, 0x00ff_0000_abcd_1234L, 0), "constant");
        Asserts.assertEQ(shifted(x, y), expected(x >>> 7, y, 0), "shifted");
        Asserts.assertEQ(shared(x, y), (x & y) + (long)expected(x, y, 0), "shared");
    }
}
