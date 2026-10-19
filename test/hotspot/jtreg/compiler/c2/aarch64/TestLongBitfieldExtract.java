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
 * @summary Extract masked long fields after truncating to int on AArch64.
 * @requires vm.compiler2.enabled
 * @library /test/lib /
 * @run driver compiler.c2.aarch64.TestLongBitfieldExtract
 */
package compiler.c2.aarch64;

import java.util.Random;

import compiler.lib.ir_framework.*;
import jdk.test.lib.Asserts;

public class TestLongBitfieldExtract {
    private static final String EXTRACT = "\\bubfxLConvL2I\\b";
    private static final String SEPARATE_SHIFT_OR_MASK = "\\b(?:urShiftL_reg_imm|andI_reg_imm)\\b";
    private static final Random RANDOM = new Random(27);

    public static void main(String[] args) {
        TestFramework.run();
    }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.AND_I, "1", IRNode.CONV_L2I, "1", IRNode.URSHIFT_L, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        counts = {EXTRACT, "1"}, failOn = {SEPARATE_SHIFT_OR_MASK})
    public static int extract32(long x) { return (int)(x >>> 32) & 255; }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.AND_I, "1", IRNode.CONV_L2I, "1", IRNode.URSHIFT_L, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        counts = {EXTRACT, "1"}, failOn = {SEPARATE_SHIFT_OR_MASK})
    public static int extract40(long x) { return (int)(x >>> 40) & 255; }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.AND_I, "1", IRNode.CONV_L2I, "1", IRNode.URSHIFT_L, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        counts = {EXTRACT, "1"}, failOn = {SEPARATE_SHIFT_OR_MASK})
    public static int extractNegative(long x) { return (int)(x >>> -24) & 255; }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.AND_I, "1", IRNode.CONV_L2I, "1", IRNode.URSHIFT_L, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        counts = {EXTRACT, "1"}, failOn = {SEPARATE_SHIFT_OR_MASK})
    public static int extractWide(long x) { return (int)(x >>> 33) & 0x3fffffff; }

    // These shapes survive idealization but use an unsupported operand.
    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.AND_I, "1", IRNode.CONV_L2I, "1", IRNode.URSHIFT_L, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        failOn = {EXTRACT})
    public static int extract31(long x) { return (int)(x >>> 31) & 0x7fffffff; }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.AND_I, "1", IRNode.CONV_L2I, "1", IRNode.URSHIFT_L, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        failOn = {EXTRACT})
    public static int extractNoncontiguous(long x) { return (int)(x >>> 40) & 0x55; }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        counts = {IRNode.AND_I, "1", IRNode.CONV_L2I, "1", IRNode.URSHIFT_L, "1"})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        failOn = {EXTRACT})
    public static int extractVariable(long x, int shift) { return (int)(x >>> shift) & 255; }

    // These masks or zero-effective shifts disappear before matching.
    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        failOn = {IRNode.AND_I})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        failOn = {EXTRACT})
    public static int extractZeroMask(long x) { return (int)(x >>> 40) & 0; }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        failOn = {IRNode.AND_I})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        failOn = {EXTRACT})
    public static int extractAllBits(long x) { return (int)(x >>> 13) & -1; }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        failOn = {IRNode.URSHIFT_L})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        failOn = {EXTRACT})
    public static int extract64(long x) { return (int)(x >>> 64) & 255; }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        failOn = {IRNode.AND_I})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        failOn = {EXTRACT})
    public static int extract48(long x) { return (int)(x >>> 48) & 65535; }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        failOn = {IRNode.AND_I})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        failOn = {EXTRACT})
    public static int extract63(long x) { return (int)(x >>> 63) & 255; }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        failOn = {IRNode.AND_I})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        failOn = {EXTRACT})
    public static int extractBoundary(long x) { return (int)(x >>> 34) & 0x3fffffff; }

    @Test(compLevel = CompLevel.C2)
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.BEFORE_MATCHING,
        failOn = {IRNode.AND_I})
    @IR(applyIfPlatform = {"aarch64", "true"}, phase = CompilePhase.MATCHING,
        failOn = {EXTRACT})
    public static int extractCrossBoundary(long x) { return (int)(x >>> 60) & 255; }

    @Run(test = {"extract32", "extract40", "extractNegative", "extractWide",
                 "extract31", "extractNoncontiguous", "extractVariable",
                 "extractZeroMask", "extractAllBits", "extract64",
                 "extract48", "extract63", "extractBoundary", "extractCrossBoundary"})
    public static void run(RunInfo info) {
        check(RANDOM.nextLong(), RANDOM.nextInt());
        if (!info.isWarmUp()) {
            // Honor supported framework modes such as ExcludeRandom.
            TestFramework.assertCompiledByC2(info.getTest("extract32"));
            TestFramework.assertCompiledByC2(info.getTest("extract40"));
            TestFramework.assertCompiledByC2(info.getTest("extractNegative"));
            TestFramework.assertCompiledByC2(info.getTest("extractWide"));
            for (long x : new long[] {0, -1, Long.MIN_VALUE, Long.MAX_VALUE}) {
                check(x, 0);
            }
            for (int bit = 0; bit < 64; bit++) {
                check(1L << bit, bit);
                check(~(1L << bit), -bit);
            }
            for (int i = 0; i < 100_000; i++) {
                check(RANDOM.nextLong(), RANDOM.nextInt());
            }
        }
    }

    private static int expected(long x, int shift, int mask) {
        int result = 0;
        shift &= 63;
        for (int bit = 0; bit < 32; bit++) {
            if (shift + bit < 64 && (mask & (1 << bit)) != 0
                    && (x & (1L << (shift + bit))) != 0) {
                result |= 1 << bit;
            }
        }
        return result;
    }

    private static void check(long x, int shift) {
        int[] actual = {extract32(x), extract40(x), extractNegative(x), extractWide(x),
                        extract31(x), extractNoncontiguous(x), extractVariable(x, shift),
                        extractZeroMask(x), extractAllBits(x), extract64(x),
                        extract48(x), extract63(x), extractBoundary(x), extractCrossBoundary(x)};
        int[] shifts = {32, 40, -24, 33, 31, 40, shift, 40, 13, 64, 48, 63, 34, 60};
        int[] masks = {255, 255, 255, 0x3fffffff, 0x7fffffff, 0x55, 255, 0, -1, 255, 65535, 255, 0x3fffffff, 255};
        for (int i = 0; i < actual.length; i++) {
            int expected = expected(x, shifts[i], masks[i]);
            Asserts.assertEQ(actual[i], expected, "case " + i + ", value " + x + ", shift " + shifts[i]);
        }
    }
}
