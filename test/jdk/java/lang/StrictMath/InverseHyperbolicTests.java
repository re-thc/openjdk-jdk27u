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
 * @summary Check inverse hyperbolic boundaries and FDLIBM results with and without the sqrt intrinsic
 * @build FdlibmTranslit
 * @run main InverseHyperbolicTests
 * @run main/othervm -Xint InverseHyperbolicTests
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_dsqrt_strict InverseHyperbolicTests
 */

import java.util.Random;

public class InverseHyperbolicTests {
    public static void main(String... args) {
        // Check the public special-value contracts independently of the reference.
        for (double x : new double[] {0.0, -0.0, Double.POSITIVE_INFINITY,
                                     Double.NEGATIVE_INFINITY}) {
            same("StrictMath.asinh", x, x, StrictMath.asinh(x));
            same("Math.asinh", x, x, Math.asinh(x));
        }
        same("StrictMath.acosh", 1.0, 0.0, StrictMath.acosh(1.0));
        same("Math.acosh", 1.0, 0.0, Math.acosh(1.0));
        same("StrictMath.acosh", Double.POSITIVE_INFINITY,
             Double.POSITIVE_INFINITY, StrictMath.acosh(Double.POSITIVE_INFINITY));
        same("Math.acosh", Double.POSITIVE_INFINITY,
             Double.POSITIVE_INFINITY, Math.acosh(Double.POSITIVE_INFINITY));
        for (double x : new double[] {Double.NEGATIVE_INFINITY, -Double.MAX_VALUE,
                                     -1.0, -0.0, 0.0, Math.nextDown(1.0)}) {
            same("StrictMath.acosh", x, Double.NaN, StrictMath.acosh(x));
            same("Math.acosh", x, Double.NaN, Math.acosh(x));
        }

        // Quiet and signaling NaNs, with both signs and different payloads.
        for (long bits : new long[] {0x7ff0_0000_0000_0001L, 0x7ff8_0000_0000_0000L,
                                    0x7fff_ffff_ffff_ffffL, 0xfff0_0000_0000_0001L,
                                    0xfff8_0000_feed_beefL, 0xffff_ffff_ffff_ffffL}) {
            double x = Double.longBitsToDouble(bits);
            same("StrictMath.asinh", x, Double.NaN, StrictMath.asinh(x));
            same("Math.asinh", x, Double.NaN, Math.asinh(x));
            same("StrictMath.acosh", x, Double.NaN, StrictMath.acosh(x));
            same("Math.acosh", x, Double.NaN, Math.acosh(x));
        }

        // The guards compare high words. Include the end of the low-word band
        // at 2 and 2^28, as well as the mathematical thresholds themselves.
        for (double x : new double[] {0.0, Double.MIN_VALUE, Double.MIN_NORMAL,
                                     0x1.0p-28, 1.0, 2.0, 0x1.00000ffffffffp1,
                                     0x1.00001p1, 0x1.0p28, 0x1.00000ffffffffp28,
                                     0x1.00001p28, Double.MAX_VALUE}) {
            neighbors(x);
        }
        for (int exponent = -1074; exponent <= 1023; exponent++) {
            double x = Math.scalb(1.0, exponent);
            checkBothSigns(Math.nextDown(x));
            checkBothSigns(x);
            checkBothSigns(Math.nextUp(x));
        }

        Random random = new Random(0x6173696e6861636fL);
        for (int i = 0; i < 20_000; i++) {
            check(Double.longBitsToDouble(random.nextLong()));
            checkBothSigns(random.nextDouble() * 2.0);
            checkBothSigns(2.0 + random.nextDouble() * (0x1.0p28 - 2.0));
            check(1.0 + random.nextDouble());
        }
    }

    private static void neighbors(double center) {
        double below = center;
        double above = center;
        checkBothSigns(center);
        for (int i = 0; i < 64; i++) {
            below = Math.nextDown(below);
            above = Math.nextUp(above);
            checkBothSigns(below);
            checkBothSigns(above);
        }
    }

    private static void checkBothSigns(double x) {
        check(x);
        check(-x);
    }

    private static void check(double x) {
        // The unchanged transliteration uses its own bit-by-bit sqrt.
        same("StrictMath.asinh", x, FdlibmTranslit.asinh(x), StrictMath.asinh(x));
        same("StrictMath.acosh", x, FdlibmTranslit.acosh(x), StrictMath.acosh(x));
    }

    private static void same(String operation, double x, double expected, double actual) {
        // NaN payloads are unspecified; preserve all other bits, including zero signs.
        if (Double.doubleToLongBits(expected) != Double.doubleToLongBits(actual)) {
            throw new RuntimeException(operation + "(" + Double.toHexString(x) + ")"
                    + ": expected " + Double.toHexString(expected)
                    + ", got " + Double.toHexString(actual));
        }
    }
}
