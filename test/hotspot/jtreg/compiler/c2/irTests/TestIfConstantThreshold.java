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

package compiler.c2.irTests;

import compiler.lib.ir_framework.*;
import jdk.test.lib.Asserts;

/*
 * @test
 * @summary Equivalent finite integer thresholds should share a comparison
 * @requires vm.compiler2.enabled
 * @library /test/lib /
 * @run driver compiler.c2.irTests.TestIfConstantThreshold
 */
public class TestIfConstantThreshold {
    private static int sink;
    private static final int[] INTS = {
        Integer.MIN_VALUE, Integer.MIN_VALUE + 1, Integer.MIN_VALUE + 2,
        -66, -65, -64, -2, -1, 0, 1, 2, 62, 63, 64, 65, 66,
        Integer.MAX_VALUE - 1, Integer.MAX_VALUE, 0x12345678, 0x87654321
    };
    private static final long[] LONGS = {
        Long.MIN_VALUE, Long.MIN_VALUE + 1, Long.MIN_VALUE + 2,
        Integer.MIN_VALUE, -66, -65, -64, -2, -1, 0, 1, 2, 62, 63, 64, 65, 66,
        Integer.MAX_VALUE, Long.MAX_VALUE - 1, Long.MAX_VALUE,
        0x123456789abcdefL, 0xfedcba9876543210L
    };
    private static final long VALUE = 0xfedcba9876543210L;
    private static final long[] VALUES = {VALUE, 0, 1, -1, Long.MIN_VALUE, Long.MAX_VALUE};

    public static void main(String[] args) {
        TestFramework.run();
    }

    @ForceInline
    private static long mask64(int bits) {
        return bits >= 64 ? -1L : (1L << bits) - 1;
    }

    @Test
    @IR(counts = {IRNode.CMP_I, "1", IRNode.IF, "1"})
    public static long testMask(int bits, long value) {
        if (bits > 63) return Long.MIN_VALUE;
        return value & mask64(bits);
    }

    @Test
    @IR(counts = {IRNode.CMP_I, "1", IRNode.IF, "1"})
    public static long testSwapped(int bits, long value) {
        if (63 < bits) return Long.MIN_VALUE;
        return value & mask64(bits);
    }

    @Test
    @IR(counts = {IRNode.CMP_L, "1", IRNode.IF, "1"})
    public static long testLongMask(long bits, long value) {
        if (bits > 63L) return Long.MIN_VALUE;
        return value & (bits >= 64L ? -1L : (1L << bits) - 1);
    }

    // The inner failure remains cold and is compiled as an uncommon trap before
    // elimination. Check that the threshold equivalence also removes that guard.
    @Test
    @IR(counts = {IRNode.CMP_I, "1", IRNode.IF, "<= 1"})
    public static long testTrap(int bits, long value) {
        if (bits > 63) return Long.MIN_VALUE;
        if (bits >= 64) throw new AssertionError("unreachable");
        return value;
    }

    // <= is already canonical. Reaching mask64 follows the first IfFalse;
    // the equivalent <64 test is then false as well.
    @Test
    @IR(counts = {IRNode.CMP_I, "1", IRNode.IF, "<= 1"})
    public static long testIfFalse(int bits, long value) {
        if (bits <= 63) return Long.MIN_VALUE;
        return value & mask64(bits);
    }

    // Negative signed longs pass the first guard but can take the unsigned
    // branch. Both comparison domains must survive.
    @Test
    @IR(counts = {IRNode.CMP_L, "1", IRNode.CMP_UL, ">= 1"})
    public static long testLongDifferentDomain(long bits, long value) {
        if (bits > 63L) return Long.MIN_VALUE;
        if (Long.compareUnsigned(bits, 64L) >= 0) return value + 7;
        return value - 11;
    }

    // Neither projection of this diamond dominates the second test. Keep both
    // comparisons; fold_compares' no-Phi shape cannot apply either.
    @Test
    @IR(counts = {IRNode.CMP_I, "2"})
    public static long testMerged(int bits, long value) {
        long result;
        if (bits > 63) {
            sink = 1;
            result = value + 17;
        } else {
            sink = 2;
            result = value - 19;
        }
        if (bits >= 64) return result * 3;
        return result * 5;
    }

    @Test
    @IR(counts = {IRNode.CMP_I, "1", IRNode.IF, "1"})
    public static long testReverse(int bits, long value) {
        if (bits >= 64) return Long.MIN_VALUE;
        return value & (bits > 63 ? -1L : (1L << bits) - 1);
    }

    // A diamond with a Phi between the dominating and dominated comparisons.
    @Test
    @IR(counts = {IRNode.CMP_I, "1"})
    public static long testInterveningDiamond(int bits, long value) {
        if (bits > 63) return Long.MIN_VALUE;
        long result;
        if (value < 0) {
            sink = 1;
            result = value + 17;
        } else {
            sink = 2;
            result = value - 19;
        }
        return result & mask64(bits);
    }

    // 64 is reachable here. The CmpI is shared, but both Bool/If tests must
    // remain because <= 64 and < 64 have different results at that value.
    @Test
    @IR(counts = {IRNode.CMP_I, "1", IRNode.IF, "2"})
    public static long testDifferentThreshold(int bits, long value) {
        if (bits > 64) return Long.MIN_VALUE;
        return value & mask64(bits);
    }

    // A negative signed value passes the first guard and fails the unsigned
    // guard. The comparison domains must match before proving equivalence.
    @Test
    @IR(counts = {IRNode.CMP_I, "1", IRNode.CMP_U, "1"})
    public static long testDifferentDomain(int bits, long value) {
        if (bits > 63) return Long.MIN_VALUE;
        if (Integer.compareUnsigned(bits, 64) >= 0) return value + 7;
        return value - 11;
    }

    @Test
    @IR(counts = {IRNode.CMP_I, "2"})
    public static long testDifferentValue(int bits, int other, long value) {
        if (bits > 63) return Long.MIN_VALUE;
        return value & mask64(other);
    }

    @Test
    @IR(counts = {IRNode.CMP_I, "1"})
    public static long testIntNegative(int x, long value) {
        if (x > -2) return Long.MIN_VALUE;
        if (x >= -1) return value + 7;
        return value - 11;
    }

    @Test
    @IR(counts = {IRNode.CMP_I, "1"})
    public static long testIntZero(int x, long value) {
        if (x > 0) return Long.MIN_VALUE;
        if (x >= 1) return value + 7;
        return value - 11;
    }

    @Test
    @IR(counts = {IRNode.CMP_I, "1"})
    public static long testIntMin(int x, long value) {
        if (x > Integer.MIN_VALUE) return Long.MIN_VALUE;
        if (x >= Integer.MIN_VALUE + 1) return value + 7;
        return value - 11;
    }

    @Test
    @IR(counts = {IRNode.CMP_I, "1"})
    public static long testIntMax(int x, long value) {
        if (x > Integer.MAX_VALUE - 1) return Long.MIN_VALUE;
        if (x >= Integer.MAX_VALUE) return value + 7;
        return value - 11;
    }

    @Test
    @IR(counts = {IRNode.CMP_L, "1"})
    public static long testLongNegative(long x, long value) {
        if (x > -2L) return Long.MIN_VALUE;
        if (x >= -1L) return value + 7;
        return value - 11;
    }

    @Test
    @IR(counts = {IRNode.CMP_L, "1"})
    public static long testLongZero(long x, long value) {
        if (x > 0L) return Long.MIN_VALUE;
        if (x >= 1L) return value + 7;
        return value - 11;
    }

    @Test
    @IR(counts = {IRNode.CMP_L, "1"})
    public static long testLongMin(long x, long value) {
        if (x > Long.MIN_VALUE) return Long.MIN_VALUE;
        if (x >= Long.MIN_VALUE + 1) return value + 7;
        return value - 11;
    }

    @Test
    @IR(counts = {IRNode.CMP_L, "1"})
    public static long testLongMax(long x, long value) {
        if (x > Long.MAX_VALUE - 1) return Long.MIN_VALUE;
        if (x >= Long.MAX_VALUE) return value + 7;
        return value - 11;
    }

    @Test
    @IR(counts = {IRNode.CMP_U, "1"})
    public static long testUnsignedIntMask(int x, long value) {
        if (Integer.compareUnsigned(x, 63) > 0) return Long.MIN_VALUE;
        if (Integer.compareUnsigned(x, 64) >= 0) return value + 7;
        return value - 11;
    }

    @Test
    @IR(counts = {IRNode.CMP_U, "1"})
    public static long testUnsignedIntSign(int x, long value) {
        if (Integer.compareUnsigned(x, Integer.MAX_VALUE) > 0) return Long.MIN_VALUE;
        if (Integer.compareUnsigned(x, Integer.MIN_VALUE) >= 0) return value + 7;
        return value - 11;
    }

    @Test
    @IR(counts = {IRNode.CMP_U, "1"})
    public static long testUnsignedIntMax(int x, long value) {
        if (Integer.compareUnsigned(x, -2) > 0) return Long.MIN_VALUE;
        if (Integer.compareUnsigned(x, -1) >= 0) return value + 7;
        return value - 11;
    }

    @Test
    @IR(counts = {IRNode.CMP_UL, "1"})
    public static long testUnsignedLongMask(long x, long value) {
        if (Long.compareUnsigned(x, 63L) > 0) return Long.MIN_VALUE;
        if (Long.compareUnsigned(x, 64L) >= 0) return value + 7;
        return value - 11;
    }

    @Test
    @IR(counts = {IRNode.CMP_UL, "1"})
    public static long testUnsignedLongSign(long x, long value) {
        if (Long.compareUnsigned(x, Long.MAX_VALUE) > 0) return Long.MIN_VALUE;
        if (Long.compareUnsigned(x, Long.MIN_VALUE) >= 0) return value + 7;
        return value - 11;
    }

    @Test
    @IR(counts = {IRNode.CMP_UL, "1"})
    public static long testUnsignedLongMax(long x, long value) {
        if (Long.compareUnsigned(x, -2L) > 0) return Long.MIN_VALUE;
        if (Long.compareUnsigned(x, -1L) >= 0) return value + 7;
        return value - 11;
    }

    @Test
    @IR(counts = {IRNode.CMP_U, "1"})
    public static long testUnsignedIntSwapped(int x, long value) {
        if (Integer.compareUnsigned(63, x) < 0) return Long.MIN_VALUE;
        if (Integer.compareUnsigned(64, x) <= 0) return value + 7;
        return value - 11;
    }

    @Test
    @IR(counts = {IRNode.CMP_UL, "1"})
    public static long testUnsignedLongSwapped(long x, long value) {
        if (Long.compareUnsigned(63L, x) < 0) return Long.MIN_VALUE;
        if (Long.compareUnsigned(64L, x) <= 0) return value + 7;
        return value - 11;
    }

    @Test
    public static int testIntEndpoints(int x) {
        int result = 0;
        if (x <= Integer.MAX_VALUE) result |= 1;
        if (x > Integer.MAX_VALUE) result |= 2;
        if (Integer.compareUnsigned(x, -1) <= 0) result |= 4;
        if (Integer.compareUnsigned(x, -1) > 0) result |= 8;
        if (x >= Integer.MIN_VALUE) result |= 16;
        if (x < Integer.MIN_VALUE) result |= 32;
        return result;
    }

    @Test
    public static int testLongEndpoints(long x) {
        int result = 0;
        if (x <= Long.MAX_VALUE) result |= 1;
        if (x > Long.MAX_VALUE) result |= 2;
        if (Long.compareUnsigned(x, -1L) <= 0) result |= 4;
        if (Long.compareUnsigned(x, -1L) > 0) result |= 8;
        if (x >= Long.MIN_VALUE) result |= 16;
        if (x < Long.MIN_VALUE) result |= 32;
        return result;
    }

    @Run(test = {
        "testMask", "testSwapped", "testTrap", "testReverse",
        "testInterveningDiamond", "testIfFalse",
        "testMerged", "testDifferentThreshold", "testDifferentValue", "testDifferentDomain",
        "testIntEndpoints", "testIntNegative", "testIntZero",
        "testIntMin", "testIntMax", "testUnsignedIntMask",
        "testUnsignedIntSign", "testUnsignedIntMax", "testUnsignedIntSwapped"
    })
    public static void runInt() {
        for (int x : INTS) {
            // Java's masked shift distance is intentional, including x < 0.
            for (long value : VALUES) {
                long masked = x > 63 ? Long.MIN_VALUE : value & ((1L << x) - 1);
                Asserts.assertEQ(testMask(x, value), masked);
                Asserts.assertEQ(testSwapped(x, value), masked);
                Asserts.assertEQ(testReverse(x, value), masked);
                Asserts.assertEQ(testIfFalse(x, value), x <= 63 ? Long.MIN_VALUE : value);
                long expected = x > 63 ? Long.MIN_VALUE :
                        (value < 0 ? value + 17 : value - 19) & ((1L << x) - 1);
                Asserts.assertEQ(testInterveningDiamond(x, value), expected);
            }
            Asserts.assertEQ(testTrap(x, VALUE), x > 63 ? Long.MIN_VALUE : VALUE);
            Asserts.assertEQ(testMerged(x, VALUE), x > 63 ? (VALUE + 17) * 3 : (VALUE - 19) * 5);
            long different = x > 64 ? Long.MIN_VALUE : x == 64 ? VALUE : VALUE & ((1L << x) - 1);
            Asserts.assertEQ(testDifferentThreshold(x, VALUE), different);
            Asserts.assertEQ(testDifferentDomain(x, VALUE),
                             x > 63 ? Long.MIN_VALUE : x < 0 ? VALUE + 7 : VALUE - 11);
            for (int other : INTS) {
                long expected = x > 63 ? Long.MIN_VALUE : other >= 64 ? VALUE : VALUE & ((1L << other) - 1);
                Asserts.assertEQ(testDifferentValue(x, other, VALUE), expected);
            }
            Asserts.assertEQ(testIntEndpoints(x), 21);
            Asserts.assertEQ(testUnsignedIntSwapped(x, VALUE),
                             Integer.toUnsignedLong(x) > 63 ? Long.MIN_VALUE : VALUE - 11);
            Asserts.assertEQ(testIntNegative(x, VALUE), (long)x > -2L ? Long.MIN_VALUE : VALUE - 11);
            Asserts.assertEQ(testIntZero(x, VALUE), (long)x > 0L ? Long.MIN_VALUE : VALUE - 11);
            Asserts.assertEQ(testIntMin(x, VALUE), (long)x > -2147483648L ? Long.MIN_VALUE : VALUE - 11);
            Asserts.assertEQ(testIntMax(x, VALUE), (long)x > 2147483646L ? Long.MIN_VALUE : VALUE - 11);
            Asserts.assertEQ(testUnsignedIntMask(x, VALUE), Integer.toUnsignedLong(x) > 63L ? Long.MIN_VALUE : VALUE - 11);
            Asserts.assertEQ(testUnsignedIntSign(x, VALUE), Integer.toUnsignedLong(x) > 2147483647L ? Long.MIN_VALUE : VALUE - 11);
            Asserts.assertEQ(testUnsignedIntMax(x, VALUE), Integer.toUnsignedLong(x) > 4294967294L ? Long.MIN_VALUE : VALUE - 11);
        }
    }

    @Run(test = {
        "testLongMask", "testLongEndpoints", "testLongNegative", "testLongDifferentDomain",
        "testLongZero", "testLongMin", "testLongMax",
        "testUnsignedLongMask", "testUnsignedLongSign", "testUnsignedLongMax", "testUnsignedLongSwapped"
    })
    public static void runLong() {
        for (long x : LONGS) {
            for (long value : VALUES) {
                long masked = x > 63 ? Long.MIN_VALUE : value & ((1L << x) - 1);
                Asserts.assertEQ(testLongMask(x, value), masked);
            }
            Asserts.assertEQ(testLongEndpoints(x), 21);
            Asserts.assertEQ(testLongDifferentDomain(x, VALUE),
                             x > 63 ? Long.MIN_VALUE : x < 0 ? VALUE + 7 : VALUE - 11);
            Asserts.assertEQ(testUnsignedLongSwapped(x, VALUE),
                             x < 0 || x > 63 ? Long.MIN_VALUE : VALUE - 11);
            Asserts.assertEQ(testLongNegative(x, VALUE), (x > -2L) ? Long.MIN_VALUE : VALUE - 11);
            Asserts.assertEQ(testLongZero(x, VALUE), (x > 0L) ? Long.MIN_VALUE : VALUE - 11);
            Asserts.assertEQ(testLongMin(x, VALUE), (x > -9223372036854775808L) ? Long.MIN_VALUE : VALUE - 11);
            Asserts.assertEQ(testLongMax(x, VALUE), (x > 9223372036854775806L) ? Long.MIN_VALUE : VALUE - 11);
            Asserts.assertEQ(testUnsignedLongMask(x, VALUE), (x < 0 || x > 63) ? Long.MIN_VALUE : VALUE - 11);
            Asserts.assertEQ(testUnsignedLongSign(x, VALUE), (x < 0) ? Long.MIN_VALUE : VALUE - 11);
            Asserts.assertEQ(testUnsignedLongMax(x, VALUE), (x == -1) ? Long.MIN_VALUE : VALUE - 11);
        }
    }
}
