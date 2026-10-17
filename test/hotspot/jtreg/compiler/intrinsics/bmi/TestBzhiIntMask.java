/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @bug 8389111
 * @summary Test int low-mask BZHI matching with Java wrapping shift counts.
 * @requires vm.compiler2.enabled & vm.simpleArch == "x64" & vm.cpu.features ~= ".*bmi2.*"
 * @library /test/lib /
 * @run driver compiler.intrinsics.bmi.TestBzhiIntMask
 */

package compiler.intrinsics.bmi;

import java.util.Random;

import compiler.lib.ir_framework.CompilePhase;
import compiler.lib.ir_framework.DontCompile;
import compiler.lib.ir_framework.IR;
import compiler.lib.ir_framework.Run;
import compiler.lib.ir_framework.RunInfo;
import compiler.lib.ir_framework.Scenario;
import compiler.lib.ir_framework.Test;
import compiler.lib.ir_framework.TestFramework;

public class TestBzhiIntMask {
    private static final String BZHI = "\\bbzhiI_rReg_rReg\\b";
    private static final long UINT_MASK = 0xffff_ffffL;
    private static final int SENTINEL = 0x1357_9bdf;

    private static final int[] COUNTS = {
        Integer.MIN_VALUE, Integer.MIN_VALUE + 1,
        -257, -256, -255, -129, -128, -127, -65, -64, -63,
        -33, -32, -31, -2, -1, 0, 1, 2, 15, 16, 17, 30, 31, 32, 33,
        47, 63, 64, 65, 127, 128, 129, 254, 255, 256, 257,
        Integer.MAX_VALUE - 1, Integer.MAX_VALUE
    };

    private static final int[] VALUES = {
        0, 1, -1, 2, -2, Integer.MIN_VALUE, Integer.MAX_VALUE,
        0x5555_5555, 0xaaaa_aaaa, 0x8000_0001, 0x7fff_fffe, 0xdead_beef
    };

    public static void main(String[] args) {
        // The jtreg CPU requirement prevents forcing BMI2 on unsupported CPUs.
        new TestFramework().addScenarios(
                new Scenario(0, "-XX:+UseBMI2Instructions"),
                new Scenario(1, "-XX:-UseBMI2Instructions")).start();
    }

    // Keep the original Java expression: normalization belongs to the matcher.
    @Test
    @IR(counts = {BZHI, "1"}, phase = CompilePhase.MATCHING,
        applyIf = {"UseBMI2Instructions", "true"}, applyIfCPUFeature = {"bmi2", "true"})
    @IR(counts = {BZHI, "0"}, phase = CompilePhase.MATCHING,
        applyIf = {"UseBMI2Instructions", "false"})
    static int mask(int value, int count) {
        return value & ((1 << count) - 1);
    }

    @Test
    @IR(counts = {BZHI, "1"}, phase = CompilePhase.MATCHING,
        applyIf = {"UseBMI2Instructions", "true"}, applyIfCPUFeature = {"bmi2", "true"})
    @IR(counts = {BZHI, "0"}, phase = CompilePhase.MATCHING,
        applyIf = {"UseBMI2Instructions", "false"})
    static int swapped(int value, int count) {
        return ((1 << count) - 1) & value;
    }

    @Test
    @IR(counts = {BZHI, "1"}, phase = CompilePhase.MATCHING,
        applyIf = {"UseBMI2Instructions", "true"}, applyIfCPUFeature = {"bmi2", "true"})
    @IR(counts = {BZHI, "0"}, phase = CompilePhase.MATCHING,
        applyIf = {"UseBMI2Instructions", "false"})
    static int sameSSA(int count) {
        return count & ((1 << count) - 1);
    }

    @Test
    @IR(counts = {BZHI, "0"}, phase = CompilePhase.MATCHING,
        applyIf = {"UseBMI2Instructions", "false"})
    static long sourceLive(int value, int count) {
        int result = value & ((1 << count) - 1);
        return ((long) result << 32) | Integer.toUnsignedLong(value);
    }

    @Test
    @IR(counts = {BZHI, "0"}, phase = CompilePhase.MATCHING,
        applyIf = {"UseBMI2Instructions", "false"})
    static long countLive(int value, int count) {
        int result = value & ((1 << count) - 1);
        return ((long) result << 32) | Integer.toUnsignedLong(count);
    }

    // The mask is needed independently, not just by the two AND expressions.
    // Do not require duplicate BZHI instructions when sharing changes covering.
    @Test
    @IR(counts = {BZHI, "0"}, phase = CompilePhase.MATCHING,
        applyIf = {"UseBMI2Instructions", "false"})
    static long sharedMask(int value, int other, int count, int[] output) {
        int low = (1 << count) - 1;
        output[0] = low;
        return ((long) (value & low) << 32) | Integer.toUnsignedLong(other & low);
    }

    @Test
    @IR(counts = {BZHI, "0"}, phase = CompilePhase.MATCHING,
        applyIf = {"UseBMI2Instructions", "false"})
    static long pressure(int value, int count, int a, int b, int c, int d,
                         int e, int f, int g, int h) {
        int result = value & ((1 << count) - 1);
        long hash = ((long) result << 32) | Integer.toUnsignedLong(value);
        hash = 31 * hash + count;
        hash = 31 * hash + a;
        hash = 31 * hash + b;
        hash = 31 * hash + c;
        hash = 31 * hash + d;
        hash = 31 * hash + e;
        hash = 31 * hash + f;
        hash = 31 * hash + g;
        return 31 * hash + h;
    }

    // The wrapped int mask has at most 31 low bits, so sign extension must
    // still leave the high 32 bits zero for every count, including -1 and 31.
    @Test
    @IR(counts = {BZHI, "1"}, phase = CompilePhase.MATCHING,
        applyIf = {"UseBMI2Instructions", "true"}, applyIfCPUFeature = {"bmi2", "true"})
    @IR(counts = {BZHI, "0"}, phase = CompilePhase.MATCHING,
        applyIf = {"UseBMI2Instructions", "false"})
    static long intMaskToLong(int value, int count) {
        return (long) (value & ((1 << count) - 1));
    }

    // A long shift uses six count bits. This is not the int matcher pattern.
    @Test
    @IR(counts = {BZHI, "0"}, phase = CompilePhase.MATCHING)
    static long longMask(long value, int count) {
        return value & ((1L << count) - 1L);
    }

    // The mask is formed in int before widening, unlike longMask. This case
    // is semantic-only with BMI2 on: ideal optimizations may change its width.
    @Test
    @IR(counts = {BZHI, "0"}, phase = CompilePhase.MATCHING,
        applyIf = {"UseBMI2Instructions", "false"})
    static long longInputIntMask(long value, int count) {
        return value & ((1 << count) - 1);
    }

    @Test
    @IR(counts = {BZHI, "0"}, phase = CompilePhase.MATCHING)
    static int differentBase(int value, int count) {
        return value & ((3 << count) - 1);
    }

    @Test
    @IR(counts = {BZHI, "0"}, phase = CompilePhase.MATCHING)
    static int plusOne(int value, int count) {
        return value & ((1 << count) + 1);
    }

    // A bounded shift in the other AND operand says nothing about count.
    // The sibling AddI is not a mask: its second input is value, not -1.
    @Test
    @IR(counts = {BZHI, "0"}, phase = CompilePhase.MATCHING,
        applyIf = {"UseBMI2Instructions", "false"})
    static int siblingShift(int value, int count, int other) {
        int source = (1 << (other >>> 27)) + value;
        return source & ((1 << count) - 1);
    }

    // The codec's saturating wrapper differs from the raw wrapping expression:
    // count=32 must preserve value, even though the raw int mask would be zero.
    @Test
    @IR(counts = {BZHI, "0"}, phase = CompilePhase.MATCHING,
        applyIf = {"UseBMI2Instructions", "false"})
    static int saturatedMask(int value, int count) {
        return value & (count >= 32 ? -1 : (1 << count) - 1);
    }

    @Run(test = {"mask", "swapped", "sameSSA", "sourceLive", "countLive", "sharedMask",
                 "pressure", "intMaskToLong", "longMask", "longInputIntMask",
                 "differentBase", "plusOne", "siblingShift", "saturatedMask"})
    static void run(RunInfo info) {
        // These alias cases expose clobbering a live src while computing
        // count&31: e.g. value=count=63 must return 63, not 31.
        checkAll(63, 63, 1);
        checkAll(-1, -1, -1);
        checkAll(255, 255, 2);
        checkAll(-1, 32, -1);
        checkAll(-1, 33, -1);
        checkAll(Integer.MIN_VALUE, Integer.MIN_VALUE, 0);
        checkAll(Integer.MAX_VALUE, Integer.MAX_VALUE, -1);
        checkAll(0xdead_beef, 0, 0x7654_3210);
        if (info.isWarmUp()) {
            return;
        }
        for (int count : COUNTS) {
            for (int value : VALUES) {
                checkAll(value, count, value ^ 0x6d2b_79f5);
            }
        }
        // Reproduce the workload's full byte-sized count domain, not a
        // source-level [0,31] restriction that could hide normalization bugs.
        for (int count = 0; count <= 256; count++) {
            checkAll(0xffff_ffff, count, 0x8000_0001);
            checkAll(count, count, count ^ 0x7654_3210);
        }
        // Keep the sibling shift small while count crosses hardware widths.
        for (int count : new int[] {-1, 31, 32, 33, 63, 64, 255, 256}) {
            checkAll(0xdead_beef, count, 1);
            checkAll(0x1234_5678, count, 2 << 27);
        }
        Random random = new Random(0x425a_4849_4cL);
        for (int i = 0; i < 256; i++) {
            checkAll(random.nextInt(), random.nextInt(), random.nextInt());
        }
    }

    private static void checkAll(int value, int count, int other) {
        int expected = lowMaskReference(value, count);
        check("mask", mask(value, count), expected, value, count);
        check("swapped", swapped(value, count), expected, value, count);
        check("sameSSA", sameSSA(count), lowMaskReference(count, count), count, count);
        check("sourceLive", sourceLive(value, count),
              ((long) expected << 32) | (value & UINT_MASK), value, count);
        check("countLive", countLive(value, count),
              ((long) expected << 32) | (count & UINT_MASK), value, count);

        int[] output = {SENTINEL, SENTINEL};
        check("sharedMask", sharedMask(value, other, count, output),
              ((long) expected << 32) | (lowMaskReference(other, count) & UINT_MASK), value, count);
        check("shared mask value", output[0], lowMaskReference(-1, count), value, count);
        check("shared mask guard", output[1], SENTINEL, value, count);

        int[] operands = {value + 1, value - 1, count + 17, count - 17,
                          value ^ 0x5555_5555, other, other + count, other - value};
        check("pressure", pressure(value, count, operands[0], operands[1], operands[2], operands[3],
                                   operands[4], operands[5], operands[6], operands[7]),
              pressureReference(value, count, operands), value, count);

        long widened = intMaskToLong(value, count);
        check("intMaskToLong", widened, expected, value, count);
        check("intMaskToLong high32", widened >>> 32, 0, value, count);
        long wideValue = ((long) value << 32) | (other & UINT_MASK);
        check("longMask", longMask(wideValue, count), longMaskReference(wideValue, count), value, count);
        long intMaskedWide = longInputIntMask(wideValue, count);
        check("longInputIntMask", intMaskedWide, lowMaskReference(other, count), value, count);
        check("longInputIntMask high32", intMaskedWide >>> 32, 0, value, count);
        check("differentBase", differentBase(value, count), adjustedMaskReference(value, count, 3, -1),
              value, count);
        check("plusOne", plusOne(value, count), adjustedMaskReference(value, count, 1, 1), value, count);
        check("siblingShift", siblingShift(value, count, other), siblingReference(value, count, other),
              value, count);
        check("saturatedMask", saturatedMask(value, count), saturatedReference(value, count), value, count);
    }

    // The oracle uses unsigned long shifts, never the target int expression.
    @DontCompile
    private static int lowMaskReference(int value, int count) {
        int bits = count & 31;
        long low = UINT_MASK >>> (32 - bits);
        return (int) ((value & UINT_MASK) & low);
    }

    @DontCompile
    private static long longMaskReference(long value, int count) {
        int bits = count & 63;
        long low = bits == 0 ? 0 : -1L >>> (64 - bits);
        return value & low;
    }

    @DontCompile
    private static int adjustedMaskReference(int value, int count, long base, long adjustment) {
        int bits = count & 31;
        long shifted = (base << bits) & UINT_MASK;
        long low = (shifted + adjustment) & UINT_MASK;
        return (int) ((value & UINT_MASK) & low);
    }

    @DontCompile
    private static int siblingReference(int value, int count, int other) {
        int siblingBits = (int) ((other & UINT_MASK) >>> 27);
        int source = (int) ((1L << siblingBits) + (value & UINT_MASK));
        return lowMaskReference(source, count);
    }

    @DontCompile
    private static int saturatedReference(int value, int count) {
        return count >= 32 ? value : lowMaskReference(value, count);
    }

    @DontCompile
    private static long pressureReference(int value, int count, int[] operands) {
        long hash = ((long) lowMaskReference(value, count) << 32) | (value & UINT_MASK);
        hash = 31 * hash + count;
        for (int operand : operands) {
            hash = 31 * hash + operand;
        }
        return hash;
    }

    private static void check(String name, long actual, long expected, int value, int count) {
        if (actual != expected) {
            throw new AssertionError(name + ": value=" + value + ", count=" + count
                                     + ", actual=" + actual + ", expected=" + expected);
        }
    }
}
