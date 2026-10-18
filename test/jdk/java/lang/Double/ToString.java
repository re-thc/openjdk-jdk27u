/*
 * Copyright (c) 2009, 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @bug 4428022
 * @summary Tests for canonical floating-point decimal selection
 * @author Andrew Haley <aph@redhat.com>
 * @run main/othervm ToString
 * @run main/othervm -Xint ToString
 * @run main/othervm -XX:-UseZmijIntrinsics ToString
 */

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;

public class ToString {

    public static void main(String args[]) {
        checkTinySelection();
        checkEqual("fixed notation", "0.001", Double.toString(0.001));
        checkEqual("fixed notation", "0.002", Double.toString(0.002));
    }

    private static void checkTinySelection() {
        // Independent exact-arithmetic oracle for Java's p=1 rule: select the
        // closest among both one- and two-digit decimals, ties to even. For
        // these subnormals the nearest two-digit decimal is valid precisely
        // when it is inside the binary rounding interval (including midpoint
        // endpoints only for an even binary significand).
        MathContext twoDigits = new MathContext(2, RoundingMode.HALF_EVEN);
        for (int bits = 1; bits < 256; ++bits) {
            for (boolean isFloat : new boolean[] {false, true}) {
                double v = isFloat ? Float.intBitsToFloat(bits) : Double.longBitsToDouble(bits);
                BigDecimal exact = new BigDecimal(v);
                BigDecimal selected = exact.round(twoDigits);
                BigDecimal ulp = new BigDecimal(isFloat ? (double) Float.MIN_VALUE : Double.MIN_VALUE);
                int midpoint = selected.subtract(exact).abs().multiply(BigDecimal.TWO).compareTo(ulp);
                if (midpoint < 0 || (midpoint == 0 && (bits & 1) == 0)) {
                    String expected = selected.toString();
                    checkEqual("tiny exact selection", expected,
                            isFloat ? Float.toString((float) v) : Double.toString(v));
                    checkEqual("negative tiny exact selection", "-" + expected,
                            isFloat ? Float.toString((float) -v) : Double.toString(-v));
                    if (!isFloat && (!selected.equals(BigDecimal.valueOf(v))
                            || !selected.negate().equals(BigDecimal.valueOf(-v)))) {
                        throw new AssertionError("BigDecimal.valueOf must use the canonical decimal: " + expected);
                    }
                }
            }
        }
        checkEqual("minimum double", "4.9E-324", Double.toString(Double.MIN_VALUE));
        checkEqual("minimum float", "1.4E-45", Float.toString(Float.MIN_VALUE));
    }

    private static void checkEqual(String label, String expected, String actual) {
        if (!expected.equals(actual)) {
            throw new AssertionError(label + ": expected " + expected + ", got " + actual);
        }
    }
}
