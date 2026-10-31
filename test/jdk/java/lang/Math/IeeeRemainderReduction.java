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
 */

/*
 * @test
 * @summary Exact IEEEremainder reduction, overflow, ties, and signed zeros
 * @run main/othervm IeeeRemainderReduction
 * @run main/othervm -Xint IeeeRemainderReduction
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 IeeeRemainderReduction
 * @run main/othervm -Xbatch -XX:-TieredCompilation IeeeRemainderReduction
 */

import java.math.BigInteger;
import java.util.Random;

public class IeeeRemainderReduction {
    private static final long SIGN = Long.MIN_VALUE;
    private static final long FRACTION = 0x000f_ffff_ffff_ffffL;

    public static void main(String[] args) {
        // Both sides of the p+p overflow guard and the tiny-divisor branch,
        // plus low-word boundaries used by the original equality test.
        double[] boundaries = {
            0.0, -0.0, Double.MIN_VALUE, 2 * Double.MIN_VALUE,
            3 * Double.MIN_VALUE, 4 * Double.MIN_VALUE,
            Math.nextDown(Double.MIN_NORMAL), Double.MIN_NORMAL,
            Math.nextUp(Double.MIN_NORMAL), Math.nextDown(0x1.0p-1021),
            0x1.0p-1021, Math.nextUp(0x1.0p-1021),
            0x1.fffff_ffff_ffffp-1, 1.0, Math.nextUp(1.0),
            0x1.00000_ffff_ffffp0, 0x1.00001p0,
            2.0, 3.0, 4.0, 5.0, 7.0,
            0x1.fffff_ffff_ffffp1022, 0x1.0p1023,
            Math.nextUp(0x1.0p1023), Double.MAX_VALUE,
            Double.POSITIVE_INFINITY, Double.NaN,
            Double.longBitsToDouble(0x7ff0_0000_0000_0001L),
            Double.longBitsToDouble(0xfff8_0000_ffff_ffffL),
        };
        for (double x : boundaries) {
            for (double p : boundaries) {
                checkSigns(x, p);
            }
        }

        // Check both sides of the optional reduction, including equality
        // at |x| = |2p|, subnormal doubling, and overflow of p+p.
        for (double p : boundaries) {
            if (p > 0.0 && Double.isFinite(p)) {
                double twiceP = p + p;
                checkSigns(Math.nextDown(twiceP), p);
                checkSigns(twiceP, p);
                checkSigns(Math.nextUp(twiceP), p);
            }
        }

        // Even and odd half-quotients and their immediate neighbors. Exact
        // multiples check zero signs after both reduction and correction.
        for (double p : new double[] {2 * Double.MIN_VALUE, 0x1.0p-1022,
                                      0x1.0p-1021, 0x1.0p-1000,
                                      0.5, 2.0, 0x1.0p500, 0x1.0p1018}) {
            for (int n = 0; n < 32; n++) {
                double tie = (n + 0.5) * p;
                checkSigns(Math.nextDown(tie), p);
                checkSigns(tie, p);
                checkSigns(Math.nextUp(tie), p);
                checkSigns(n * p, p);
            }
        }

        // Wide exponent gaps, arbitrary significands, and dense subnormal
        // divisors exercise reduction without depending on the fdlibm port.
        Random random = new Random(0x1eee_754L);
        for (int i = 0; i < 10_000; i++) {
            double x = Double.longBitsToDouble(random.nextLong());
            double p = Double.longBitsToDouble(random.nextLong());
            check(x, p);
            check(x, Double.longBitsToDouble(1 + (random.nextLong() & FRACTION)));
        }
    }

    private static void checkSigns(double x, double p) {
        check(x, p);
        check(-x, p);
        check(x, -p);
        check(-x, -p);
    }

    private static void check(double x, double p) {
        double expected = expected(x, p);
        checkResult("Math", x, p, expected, Math.IEEEremainder(x, p));
        checkResult("StrictMath", x, p, expected, StrictMath.IEEEremainder(x, p));
    }

    private static void checkResult(String name, double x, double p,
                                    double expected, double actual) {
        if (Double.isNaN(expected) ? !Double.isNaN(actual)
                : Double.doubleToRawLongBits(expected) != Double.doubleToRawLongBits(actual)) {
            throw new AssertionError(name + ".IEEEremainder(" + Double.toHexString(x)
                    + ", " + Double.toHexString(p) + "): expected "
                    + Double.toHexString(expected) + ", got " + Double.toHexString(actual));
        }
    }

    private static double expected(double x, double p) {
        if (Double.isNaN(x) || Double.isNaN(p) || Double.isInfinite(x) || p == 0.0) {
            return Double.NaN;
        }
        if (Double.isInfinite(p)) {
            return x;
        }

        // Express both magnitudes as exact integer multiples of 2^-1074.
        // Round the integer quotient to nearest, breaking ties to even.
        BigInteger divisor = units(p);
        BigInteger[] qr = units(x).divideAndRemainder(divisor);
        BigInteger remainder = qr[1];
        int half = remainder.shiftLeft(1).compareTo(divisor);
        if (half > 0 || (half == 0 && qr[0].testBit(0))) {
            remainder = remainder.subtract(divisor);
        }
        long sign = Double.doubleToRawLongBits(x) & SIGN;
        if (remainder.signum() < 0) {
            sign ^= SIGN;
            remainder = remainder.negate();
        }

        // Encode the exact result directly, including subnormals and zeros.
        // A floating division or multiply here could hide a reduction error.
        int shift = Math.max(0, remainder.bitLength() - 53);
        BigInteger significand = remainder.shiftRight(shift);
        if (!significand.shiftLeft(shift).equals(remainder)) {
            throw new AssertionError("Remainder is not exactly representable");
        }
        long bits = significand.longValueExact();
        if (remainder.bitLength() > 52) {
            bits = ((long) (shift + 1) << 52) | (bits & FRACTION);
        }
        return Double.longBitsToDouble(sign | bits);
    }

    private static BigInteger units(double value) {
        long bits = Double.doubleToRawLongBits(value);
        int exponent = (int) ((bits >>> 52) & 0x7ff);
        long significand = bits & FRACTION;
        if (exponent != 0) {
            significand |= 1L << 52;
        }
        return BigInteger.valueOf(significand).shiftLeft(Math.max(0, exponent - 1));
    }
}
