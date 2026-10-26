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
 * @summary Check inflated division below, at, and above rounding ties in every rounding mode
 * @run main InflatedDivisionRoundingTest
 * @run main/othervm -Xint InflatedDivisionRoundingTest
 */

import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.MathContext;
import java.math.RoundingMode;

public class InflatedDivisionRoundingTest {
    public static void main(String[] args) {
        for (int limbs : new int[] { 2, 8, 32, 80 }) {
            BigInteger divisor = BigInteger.ONE.shiftLeft(32 * limbs)
                    .subtract(BigInteger.TWO);
            BigInteger half = divisor.shiftRight(1);
            BigInteger[] remainders = { BigInteger.ZERO, half.subtract(BigInteger.ONE),
                    half, half.add(BigInteger.ONE), divisor.subtract(BigInteger.ONE) };
            // Even and odd retained digits, including quotient sizes large
            // enough to cross the Burnikel-Ziegler dividend/divisor offset.
            for (int precision : new int[] { 1, 34, 400 }) {
                for (int last : new int[] { 2, 3 }) {
                    BigInteger quotient = precision == 1 ? BigInteger.valueOf(last)
                            : BigInteger.TEN.pow(precision - 1).add(BigInteger.valueOf(last));
                    for (BigInteger remainder : remainders) {
                        BigInteger dividend = divisor.multiply(quotient).add(remainder);
                        for (int nsign : new int[] { -1, 1 }) {
                            for (int dsign : new int[] { -1, 1 }) {
                                for (int scale : new int[] { -7, 0, 9 }) {
                                    BigDecimal n = new BigDecimal(nsign < 0
                                            ? dividend.negate() : dividend, scale + 3);
                                    BigDecimal d = new BigDecimal(dsign < 0
                                            ? divisor.negate() : divisor, 3);
                                    for (RoundingMode mode : RoundingMode.values()) {
                                        check(n, d, quotient, remainder, half,
                                                nsign * dsign, scale, precision, mode);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    private static void check(BigDecimal n, BigDecimal d, BigInteger q,
                              BigInteger remainder, BigInteger half, int sign,
                              int scale, int precision, RoundingMode mode) {
        boolean inexact = remainder.signum() != 0;
        boolean mustThrow = inexact && mode == RoundingMode.UNNECESSARY;
        int cmp = remainder.compareTo(half);
        boolean increment = inexact && switch (mode) {
            case UP -> true;
            case DOWN, UNNECESSARY -> false;
            case CEILING -> sign > 0;
            case FLOOR -> sign < 0;
            case HALF_UP -> cmp >= 0;
            case HALF_DOWN -> cmp > 0;
            case HALF_EVEN -> cmp > 0 || (cmp == 0 && q.testBit(0));
        };
        BigInteger rounded = increment ? q.add(BigInteger.ONE) : q;
        BigDecimal expected = new BigDecimal(sign < 0 ? rounded.negate() : rounded, scale);
        for (boolean context : new boolean[] { false, true }) {
            BigDecimal actual;
            try {
                actual = context ? n.divide(d, new MathContext(precision, mode))
                        : n.divide(d, scale, mode);
            } catch (ArithmeticException e) {
                if (mustThrow) {
                    continue;
                }
                throw new AssertionError("Unexpected exception: mode=" + mode
                        + ", precision=" + precision + ", scale=" + scale, e);
            }
            if (mustThrow || !actual.equals(expected)) {
                throw new AssertionError("mode=" + mode + ", context=" + context
                        + ", expected=" + expected + ", actual=" + actual);
            }
        }
    }
}
