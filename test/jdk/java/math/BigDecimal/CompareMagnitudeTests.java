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
 * @summary Compare scaled magnitudes at decimal and unsigned limb boundaries
 * @run main CompareMagnitudeTests
 * @run main/othervm -Xint CompareMagnitudeTests
 */

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class CompareMagnitudeTests {
    private static final int[] SCALES = {
        Integer.MIN_VALUE, Integer.MIN_VALUE + 40, -100, -1, 0, 1, 100,
        Integer.MAX_VALUE - 40, Integer.MAX_VALUE
    };
    private static long checks;

    // Compare decimal strings with virtual trailing zeros, without scaling
    // either coefficient or using BigDecimal comparison/arithmetic.
    private static int reference(BigDecimal a, BigDecimal b) {
        int sign = a.signum();
        if (sign != b.signum())
            return Integer.compare(sign, b.signum());
        if (sign == 0)
            return 0;
        String x = a.unscaledValue().abs().toString();
        String y = b.unscaledValue().abs().toString();
        int cmp = Long.compare((long)x.length() - a.scale(),
                               (long)y.length() - b.scale());
        if (cmp == 0) {
            for (int i = 0; i < Math.max(x.length(), y.length()); i++) {
                char xc = i < x.length() ? x.charAt(i) : '0';
                char yc = i < y.length() ? y.charAt(i) : '0';
                cmp = Character.compare(xc, yc);
                if (cmp != 0)
                    break;
            }
        }
        return sign * Integer.signum(cmp);
    }

    private static void check(BigDecimal a, BigDecimal b) {
        int expected = reference(a, b);
        if (Integer.signum(a.compareTo(b)) != expected ||
            Integer.signum(b.compareTo(a)) != -expected ||
            a.min(b) != (expected <= 0 ? a : b) ||
            a.max(b) != (expected >= 0 ? a : b) ||
            b.min(a) != (expected >= 0 ? b : a) ||
            b.max(a) != (expected <= 0 ? b : a)) {
            throw new AssertionError(a + " vs " + b + ": expected " + expected);
        }
        checks++;
    }

    private static void signs(BigDecimal a, BigDecimal b) {
        check(a, b);
        check(a.negate(), b.negate());
        check(a.negate(), b);
        check(a, b.negate());
    }

    public static void main(String[] args) {
        List<BigInteger> values = new ArrayList<>();
        for (int n = 0; n <= 40; n++) {
            BigInteger p = BigInteger.TEN.pow(n);
            for (int delta = -1; delta <= 1; delta++)
                values.add(p.add(BigInteger.valueOf(delta)));
        }
        for (int n : new int[] {31, 32, 33, 62, 63, 64, 65, 95, 96, 97,
                                126, 127, 128, 129, 160, 256, 512}) {
            BigInteger p = BigInteger.ONE.shiftLeft(n);
            for (int delta = -1; delta <= 1; delta++)
                values.add(p.add(BigInteger.valueOf(delta)));
        }
        for (BigInteger x : values) {
            for (int n = 0; n <= 40; n++) {
                BigInteger scaled = x.multiply(BigInteger.TEN.pow(n));
                for (int scale : SCALES) {
                    long targetScale = (long)scale + n;
                    if (targetScale > Integer.MAX_VALUE)
                        continue;
                    BigDecimal a = new BigDecimal(x, scale);
                    for (int delta = -1; delta <= 1; delta++) {
                        signs(a, new BigDecimal(scaled.add(BigInteger.valueOf(delta)),
                                                (int)targetScale));
                    }
                }
            }
        }

        BigInteger limit = BigInteger.ONE.shiftLeft(128).subtract(BigInteger.ONE);
        for (int n = 1; n <= 38; n++) {
            BigInteger x = limit.divide(BigInteger.TEN.pow(n));
            for (int delta = -1; delta <= 1; delta++) {
                for (int scale : SCALES) {
                    if ((long)scale + n <= Integer.MAX_VALUE)
                        signs(new BigDecimal(x.add(BigInteger.valueOf(delta)), scale),
                              new BigDecimal(limit, scale + n));
                }
            }
        }
        // Equal adjusted exponents with products above the 128-bit limit.
        signs(new BigDecimal(BigInteger.valueOf(35), -37), new BigDecimal(limit));
        signs(new BigDecimal(BigInteger.valueOf(4), -38), new BigDecimal(limit));

        Random random = new Random(0x128decafL);
        for (int i = 0; i < 40_000; i++) {
            BigInteger x = new BigInteger(1 + random.nextInt(256), random);
            BigInteger y = new BigInteger(1 + random.nextInt(256), random);
            int scale = random.nextInt();
            long otherScale = (long)scale + y.toString().length() - x.toString().length();
            otherScale += i % 3 - 1;
            if (otherScale >= Integer.MIN_VALUE && otherScale <= Integer.MAX_VALUE)
                signs(new BigDecimal(x, scale), new BigDecimal(y, (int)otherScale));
        }
        for (int scale : SCALES) {
            for (int otherScale : SCALES) {
                for (long x : new long[] {0, 1, -1, Long.MIN_VALUE, Long.MAX_VALUE}) {
                    check(BigDecimal.valueOf(x, scale),
                          new BigDecimal(BigInteger.valueOf(x), otherScale));
                }
            }
        }
        for (int op = 0; op < 3; op++) {
            try {
                BigDecimal a = new BigDecimal(limit, Integer.MIN_VALUE);
                switch (op) {
                    case 0 -> a.compareTo(null);
                    case 1 -> a.min(null);
                    case 2 -> a.max(null);
                }
                throw new AssertionError("Expected NullPointerException");
            } catch (NullPointerException expected) {
            }
        }
        System.out.println("Checked " + checks + " pairs in both directions, compareTo/min/max");
    }
}
