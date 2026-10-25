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
 * @summary Check rounding of compact products and scaled dividends across 64-bit overflow
 * @run main CompactProductRounding
 */

import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.Random;
import java.util.function.Supplier;

public class CompactProductRounding {
    private static final BigInteger INFLATION = BigInteger.TEN.pow(40);
    private static final int[] PRECISIONS = {1, 9, 16, 18, 34};
    private static final int[] SCALES = {-19, -2, 0, 3, 19};
    private static int checks;

    public static void main(String[] args) {
        long[] boundaries = {
            0, 1, 2, 5, 9, 10, 11, 999_999_999L, 1_000_000_000L,
            1_000_000_001L, 3_037_000_499L, 3_037_000_500L,
            3_037_000_501L, 0xffff_ffffL, 0x1_0000_0000L,
            0x1_0000_0001L, 1L << 62, Long.MAX_VALUE - 1, Long.MAX_VALUE
        };
        int index = 0;
        for (long x : boundaries) {
            for (long y : boundaries) {
                signedPairs(x, y, index++);
            }
        }
        for (long power = 10; power <= 1_000_000_000_000_000_000L; power *= 10) {
            for (int delta = -1; delta <= 1; delta++) {
                signedPairs(power + delta, power - delta, index++);
                signedPairs(power + delta, 3_037_000_500L, index++);
            }
            if (power == 1_000_000_000_000_000_000L) {
                break;
            }
        }
        Random random = new Random(0x128decafL);
        for (int i = 0; i < 128; i++) {
            signedPairs(random.nextLong() & Long.MAX_VALUE,
                        random.nextLong() & Long.MAX_VALUE, index++);
        }
        // Overflowing products immediately below, at, and above half, with
        // both even and odd retained coefficients at precisions 9, 16 and 18.
        for (long tail : new long[] {5, 15, 500, 1_500, 5_000_000_000L, 15_000_000_000L}) {
            for (int delta = -1; delta <= 1; delta++) {
                signedPairs(1_000_000_000_000_000_000L + tail + delta, 10, index++);
            }
        }
        signedPairs(950_000_000_000_000_000L, 10, index++);
        signedPairs(999_999_999_999_999_999L, 10, index++);
        signedPairs(1_999_999_999_999_999_999L, 5, index++);
        // Scaled dividends overflow before division; the quotient ties have
        // odd and even retained coefficients, respectively.
        signedPairs(Long.MAX_VALUE, 20, 0);
        signedPairs(Long.MAX_VALUE - 2, 100, 0);
        // Long.MIN_VALUE is represented by an inflated value, never a compact operand.
        pair(BigDecimal.valueOf(Long.MIN_VALUE), BigDecimal.TEN);
        pair(BigDecimal.TEN, BigDecimal.valueOf(Long.MIN_VALUE));
        for (long divisor : new long[] {1, 5, 10}) {
            pair(BigDecimal.valueOf(Long.MAX_VALUE), BigDecimal.valueOf(divisor));
            pair(BigDecimal.valueOf(-Long.MAX_VALUE), BigDecimal.valueOf(divisor));
        }
        pair(new BigDecimal("123456789012345678901234567890123456789"),
             new BigDecimal("987654321098765432109876543210987654321"));
        System.out.println("Checks: " + checks);
    }

    private static void signedPairs(long x, long y, int index) {
        int xs = SCALES[index % SCALES.length];
        int ys = SCALES[index / SCALES.length % SCALES.length];
        for (int sx : new int[] {-1, 1}) {
            for (int sy : new int[] {-1, 1}) {
                pair(BigDecimal.valueOf(sx * x, xs), BigDecimal.valueOf(sy * y, ys));
            }
        }
    }

    private static void pair(BigDecimal x, BigDecimal y) {
        BigDecimal exactProduct = new BigDecimal(x.unscaledValue().multiply(y.unscaledValue()),
                                                x.scale() + y.scale());
        // Equal inflation preserves values and preferred quotient scale, and forces
        // division through the independent BigInteger operand paths.
        BigDecimal inflatedX = inflate(x);
        BigDecimal inflatedY = inflate(y);
        for (int precision : PRECISIONS) {
            for (RoundingMode mode : RoundingMode.values()) {
                MathContext mc = new MathContext(precision, mode);
                check("multiply " + x + " * " + y + " " + mc,
                      () -> x.multiply(y, mc), () -> exactProduct.round(mc));
                if (y.signum() != 0) {
                    check("divide " + x + " / " + y + " " + mc,
                          () -> x.divide(y, mc), () -> inflatedX.divide(inflatedY, mc));
                    int scale = precision - 1 + x.scale() - y.scale();
                    check("divide " + x + " / " + y + " scale " + scale + " " + mode,
                          () -> x.divide(y, scale, mode),
                          () -> inflatedX.divide(inflatedY, scale, mode));
                }
            }
        }
        // Exact compact quotient, unsigned 64-bit quotient, and 128-bit division
        // overflow are covered by x=Long.MAX_VALUE, y=10/5/1, respectively.
        if (y.signum() != 0) {
            for (RoundingMode mode : RoundingMode.values()) {
                check("divide at scale 1 " + x + " / " + y + " " + mode,
                      () -> x.divide(y, 1, mode), () -> inflatedX.divide(inflatedY, 1, mode));
            }
        }
    }

    private static BigDecimal inflate(BigDecimal value) {
        return new BigDecimal(value.unscaledValue().multiply(INFLATION), value.scale() + 40);
    }

    private static void check(String description, Supplier<BigDecimal> operation,
                              Supplier<BigDecimal> reference) {
        BigDecimal expected;
        try {
            expected = reference.get();
        } catch (ArithmeticException expectedException) {
            try {
                BigDecimal actual = operation.get();
                throw new RuntimeException(description + ": expected " + expectedException + ", got " + actual);
            } catch (ArithmeticException actualException) {
                if (!expectedException.getMessage().equals(actualException.getMessage())) {
                    throw new RuntimeException(description + ": expected " + expectedException + ", got " + actualException);
                }
            }
            checks++;
            return;
        }
        BigDecimal actual = operation.get();
        if (!expected.equals(actual) || expected.precision() != actual.precision()) {
            throw new RuntimeException(description + ": expected " + expected + " (scale " + expected.scale()
                                       + "), got " + actual + " (scale " + actual.scale() + ")");
        }
        checks++;
    }
}
