/*
 * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
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
 * @bug 8205592 8339252 8341260
 * @summary Verify {double, float, float16}Value methods work
 * @modules jdk.incubator.vector
 * @library /test/lib
 * @key randomness
 * @build jdk.test.lib.RandomFactory
 * @run main/othervm -XX:+UseFastFloatIntrinsics DoubleFloatValueTests
 * @run main/othervm -XX:-UseFastFloatIntrinsics DoubleFloatValueTests
 */

import jdk.test.lib.RandomFactory;

import java.math.BigDecimal;
import java.util.Random;
import jdk.incubator.vector.Float16;

public class DoubleFloatValueTests {
    private static final BigDecimal HALF = BigDecimal.valueOf(5, 1);
    private static final BigDecimal EPS = BigDecimal.valueOf(1, 10_000);

    private static BigDecimal nextHalfUp(double v) {
        BigDecimal bv = new BigDecimal(v);
        BigDecimal ulp = new BigDecimal(Math.ulp(v));
        return bv.add(ulp.multiply(HALF));
    }

    private static BigDecimal nextHalfDown(double v) {
        BigDecimal bv = new BigDecimal(v);
        BigDecimal ulp = new BigDecimal(v - Math.nextDown(v));
        return bv.subtract(ulp.multiply(HALF));
    }

    private static BigDecimal nextHalfUp(float v) {
        BigDecimal bv = new BigDecimal(v);
        BigDecimal ulp = new BigDecimal(Math.ulp(v));
        return bv.add(ulp.multiply(HALF));
    }

    private static BigDecimal nextHalfDown(float v) {
        BigDecimal bv = new BigDecimal(v);
        BigDecimal ulp = new BigDecimal(v - Math.nextDown(v));
        return bv.subtract(ulp.multiply(HALF));
    }

    private static BigDecimal nextHalfUp(Float16 v) {
        BigDecimal bv = new BigDecimal(v.doubleValue());
        BigDecimal ulp = new BigDecimal(Float16.ulp(v).doubleValue());
        return bv.add(ulp.multiply(HALF));
    }

    private static BigDecimal nextHalfDown(Float16 v) {
        BigDecimal bv = new BigDecimal(v.doubleValue());
        BigDecimal ulp = new BigDecimal(v.doubleValue() - Float16.nextDown(v).doubleValue());
        return bv.subtract(ulp.multiply(HALF));
    }

    private static String toDecHexString(double v) {
        return v + " (" + Double.toHexString(v) + ")";
    }

    private static String toDecHexString(float v) {
        return v + " (" + Float.toHexString(v) + ")";
    }

    private static String toDecHexString(Float16 v) {
        return v + " (" + Float16.toHexString(v) + ")";
    }

    private static void checkDouble(BigDecimal bd, double exp) {
        checkDoubleRepresentation(bd, exp);
        if (bd.scale() <= 0) {
            checkDoubleRepresentation(bd.setScale(1), exp);
        }
    }

    private static void checkDoubleRepresentation(BigDecimal bd, double exp) {
        for (boolean cached : new boolean[] {false, true}) {
            BigDecimal value = new BigDecimal(bd.unscaledValue(), bd.scale());
            if (cached) value.toString();
            double res = value.doubleValue();
            if (Double.doubleToRawLongBits(exp) != Double.doubleToRawLongBits(res)) {
                throw new RuntimeException("Bad conversion: got " + toDecHexString(res)
                        + ", expected " + toDecHexString(exp) + ", cached=" + cached);
            }
        }
    }

    private static void checkFloat(BigDecimal bd, float exp) {
        checkFloatRepresentation(bd, exp);
        if (bd.scale() <= 0) {
            checkFloatRepresentation(bd.setScale(1), exp);
        }
    }

    private static void checkFloatRepresentation(BigDecimal bd, float exp) {
        for (boolean cached : new boolean[] {false, true}) {
            BigDecimal value = new BigDecimal(bd.unscaledValue(), bd.scale());
            if (cached) value.toString();
            float res = value.floatValue();
            if (Float.floatToRawIntBits(exp) != Float.floatToRawIntBits(res)) {
                throw new RuntimeException("Bad conversion: got " + toDecHexString(res)
                        + ", expected " + toDecHexString(exp) + ", cached=" + cached);
            }
        }
    }

    private static BigDecimal epsilon(BigDecimal midpoint) {
        // Stay below one decimal ulp without expanding the cached text past
        // the native parser's 1024-character bound, even near binary underflow.
        return BigDecimal.valueOf(1, Math.max(1, midpoint.scale() + 1));
    }

    private static void checkDoubleMidpoint(BigDecimal midpoint, double below, double above) {
        for (BigDecimal delta : new BigDecimal[] {EPS, epsilon(midpoint)}) {
            checkDouble(midpoint.subtract(delta), below);
            checkDouble(midpoint.add(delta), above);
        }
    }

    private static void checkFloatMidpoint(BigDecimal midpoint, float below, float above) {
        for (BigDecimal delta : new BigDecimal[] {EPS, epsilon(midpoint)}) {
            checkFloat(midpoint.subtract(delta), below);
            checkFloat(midpoint.add(delta), above);
        }
    }

    private static void checkFloat16(BigDecimal bv, Float16 exp) {
        Float16 res =  Float16.valueOf(bv); // bv.float16Value();
        if (exp.floatValue() != res.floatValue()) {
            String message = "Bad conversion: got " + toDecHexString(res) +
                    ", expected " + toDecHexString(exp);
            throw new RuntimeException(message);
        }
    }

    private static boolean isOdd(int n) {
        return (n & 0x1) != 0;
    }

    private static void testDoubleValueNearMinValue() {
        for (int n = 0; n < 100; ++n) {
            BigDecimal b = nextHalfUp(n * Double.MIN_VALUE);
            checkDouble(b, ((n + 1) / 2 * 2) * Double.MIN_VALUE);
            checkDoubleMidpoint(b, n * Double.MIN_VALUE, (n + 1) * Double.MIN_VALUE);
            checkDouble(b.negate(), -(((n + 1) / 2 * 2) * Double.MIN_VALUE));
            checkDoubleMidpoint(b.negate(), -((n + 1) * Double.MIN_VALUE), -(n * Double.MIN_VALUE));
        }
    }

    private static void testFloatValueNearMinValue() {
        for (int n = 0; n < 100; ++n) {
            BigDecimal b = nextHalfUp(n * Float.MIN_VALUE);
            checkFloat(b, ((n + 1) / 2 * 2) * Float.MIN_VALUE);
            checkFloatMidpoint(b, n * Float.MIN_VALUE, (n + 1) * Float.MIN_VALUE);
            checkFloat(b.negate(), -(((n + 1) / 2 * 2) * Float.MIN_VALUE));
            checkFloatMidpoint(b.negate(), -((n + 1) * Float.MIN_VALUE), -(n * Float.MIN_VALUE));
        }
    }

    private static void testFloat16ValueNearMinValue() {
        for (int n = 0; n < 100; ++n) {
            BigDecimal b = nextHalfUp(Float16.multiply(Float16.valueOf(n), Float16.MIN_VALUE));
            checkFloat16(b, Float16.multiply(Float16.valueOf((n + 1) / 2 * 2), Float16.MIN_VALUE));
            checkFloat16(b.subtract(EPS), Float16.multiply(Float16.valueOf(n), Float16.MIN_VALUE));
            checkFloat16(b.add(EPS), Float16.multiply(Float16.valueOf(n + 1), Float16.MIN_VALUE));
        }
    }

    private static void testDoubleValueNearMinNormal() {
        double v = Double.MIN_NORMAL;
        for (int n = 0; n < 100; ++n) {
            BigDecimal bv = nextHalfDown(v);
            checkDouble(bv, isOdd(n) ? Math.nextDown(v) : v);
            checkDoubleMidpoint(bv, Math.nextDown(v), v);
            v = Math.nextDown(v);
        }
        v = Double.MIN_NORMAL;
        for (int n = 0; n < 100; ++n) {
            BigDecimal bv = nextHalfUp(v);
            checkDouble(bv, isOdd(n) ? Math.nextUp(v) : v);
            checkDoubleMidpoint(bv, v, Math.nextUp(v));
            v = Math.nextUp(v);
        }
    }

    private static void testFloatValueNearMinNormal() {
        float v = Float.MIN_NORMAL;
        for (int n = 0; n < 100; ++n) {
            BigDecimal bv = nextHalfDown(v);
            checkFloat(bv, isOdd(n) ? Math.nextDown(v) : v);
            checkFloatMidpoint(bv, Math.nextDown(v), v);
            v = Math.nextDown(v);
        }
        v = Float.MIN_NORMAL;
        for (int n = 0; n < 100; ++n) {
            BigDecimal bv = nextHalfUp(v);
            checkFloat(bv, isOdd(n) ? Math.nextUp(v) : v);
            checkFloatMidpoint(bv, v, Math.nextUp(v));
            v = Math.nextUp(v);
        }
    }

    private static void testFloat16ValueNearMinNormal() {
        Float16 v = Float16.MIN_NORMAL;
        for (int n = 0; n < 100; ++n) {
            BigDecimal bv = nextHalfDown(v);
            checkFloat16(bv, isOdd(n) ? Float16.nextDown(v) : v);
            checkFloat16(bv.subtract(EPS), Float16.nextDown(v));
            checkFloat16(bv.add(EPS), v);
            v = Float16.nextDown(v);
        }
        v = Float16.MIN_NORMAL;
        for (int n = 0; n < 100; ++n) {
            BigDecimal bv = nextHalfUp(v);
            checkFloat16(bv, isOdd(n) ? Float16.nextUp(v) : v);
            checkFloat16(bv.subtract(EPS), v);
            checkFloat16(bv.add(EPS), Float16.nextUp(v));
            v = Float16.nextUp(v);
        }
    }

    private static void testDoubleValueNearMaxValue() {
        double v = Double.MAX_VALUE;
        for (int n = 0; n < 100; ++n) {
            BigDecimal bv = nextHalfDown(v);
            checkDouble(bv, isOdd(n) ? v : Math.nextDown(v));
            checkDoubleMidpoint(bv, Math.nextDown(v), v);
            v = Math.nextDown(v);
        }
        BigDecimal bv = nextHalfUp(Double.MAX_VALUE);
        checkDouble(bv, Double.POSITIVE_INFINITY);
        checkDoubleMidpoint(bv, Double.MAX_VALUE, Double.POSITIVE_INFINITY);
    }

    private static void testFloatValueNearMaxValue() {
        float v = Float.MAX_VALUE;
        for (int n = 0; n < 100; ++n) {
            BigDecimal bv = nextHalfDown(v);
            checkFloat(bv, isOdd(n) ? v : Math.nextDown(v));
            checkFloatMidpoint(bv, Math.nextDown(v), v);
            v = Math.nextDown(v);
        }
        BigDecimal bv = nextHalfUp(Float.MAX_VALUE);
        checkFloat(bv, Float.POSITIVE_INFINITY);
        checkFloatMidpoint(bv, Float.MAX_VALUE, Float.POSITIVE_INFINITY);
    }

    private static void testFloat16ValueNearMaxValue() {
        Float16 v = Float16.MAX_VALUE;
        for (int n = 0; n < 100; ++n) {
            BigDecimal bv = nextHalfDown(v);
            checkFloat16(bv, isOdd(n) ? v : Float16.nextDown(v));
            checkFloat16(bv.subtract(EPS), Float16.nextDown(v));
            checkFloat16(bv.add(EPS), v);
            v = Float16.nextDown(v);
        }
        BigDecimal bv = nextHalfUp(Float16.MAX_VALUE);
        checkFloat16(bv, Float16.POSITIVE_INFINITY);
        checkFloat16(bv.subtract(EPS), Float16.MAX_VALUE);
        checkFloat16(bv.add(EPS), Float16.POSITIVE_INFINITY);
    }

    private static void testDoubleValueRandom() {
        Random r = RandomFactory.getRandom();
        for (int i = 0; i < 10_000; ++i) {
            double v = r.nextDouble(-Double.MAX_VALUE, Double.MAX_VALUE);
            checkDouble(new BigDecimal(v), v);
        }
        for (int i = 0; i < 10_000; ++i) {
            double v = r.nextDouble(-1e9, 1e9);
            checkDouble(new BigDecimal(v), v);
        }
        for (int i = 0; i < 10_000; ++i) {
            double v = r.nextDouble(-1e6, 1e6);
            checkDouble(new BigDecimal(v), v);
        }
        for (int i = 0; i < 10_000; ++i) {
            double v = r.nextDouble(-1e-6, 1e-6);
            checkDouble(new BigDecimal(v), v);
        }
        for (int i = 0; i < 10_000; ++i) {
            double v = r.nextDouble(-1e-9, 1e-9);
            checkDouble(new BigDecimal(v), v);
        }
    }

    private static void testFloatValueRandom() {
        Random r = RandomFactory.getRandom();
        for (int i = 0; i < 10_000; ++i) {
            float v = r.nextFloat(-Float.MAX_VALUE, Float.MAX_VALUE);
            checkFloat(new BigDecimal(v), v);
        }
        for (int i = 0; i < 10_000; ++i) {
            float v = r.nextFloat(-1e9f, 1e9f);
            checkFloat(new BigDecimal(v), v);
        }
        for (int i = 0; i < 10_000; ++i) {
            float v = r.nextFloat(-1e6f, 1e6f);
            checkFloat(new BigDecimal(v), v);
        }
        for (int i = 0; i < 10_000; ++i) {
            float v = r.nextFloat(-1e-6f, 1e-6f);
            checkFloat(new BigDecimal(v), v);
        }
        for (int i = 0; i < 10_000; ++i) {
            float v = r.nextFloat(-1e-9f, 1e-9f);
            checkFloat(new BigDecimal(v), v);
        }
    }

    private static void testFloat16ValueRandom() {
        Random r = RandomFactory.getRandom();
        for (int i = 0; i < 10_000; ++i) {
            Float16 v = Float16.valueOf(r.nextFloat(-Float16.MAX_VALUE.floatValue(), Float16.MAX_VALUE.floatValue()));
            checkFloat16(new BigDecimal(v.floatValue()), v);
        }
        for (int i = 0; i < 10_000; ++i) {
            Float16 v = Float16.valueOf(r.nextFloat(-1e4f, 1e4f));
            checkFloat16(new BigDecimal(v.floatValue()), v);
        }
        for (int i = 0; i < 10_000; ++i) {
            Float16 v = Float16.valueOf(r.nextFloat(-1e3f, 1e3f));
            checkFloat16(new BigDecimal(v.floatValue()), v);
        }
        for (int i = 0; i < 10_000; ++i) {
            Float16 v = Float16.valueOf(r.nextFloat(-1e-3f, 1e-3f));
            checkFloat16(new BigDecimal(v.floatValue()), v);
        }
        for (int i = 0; i < 10_000; ++i) {
            Float16 v = Float16.valueOf(r.nextFloat(-1e-4f, 1e-4f));
            checkFloat16(new BigDecimal(v.floatValue()), v);
        }
    }

    private static void testDoubleValueExtremes() {
        checkDouble(BigDecimal.valueOf(1, 1000), 0.0);
        checkDouble(BigDecimal.valueOf(-1, 1000), -0.0);
        checkDouble(BigDecimal.valueOf(1, -1000), Double.POSITIVE_INFINITY);
        checkDouble(BigDecimal.valueOf(-1, -1000), Double.NEGATIVE_INFINITY);
    }

    private static void testFloatValueExtremes() {
        checkFloat(BigDecimal.valueOf(1, 1000), 0.0f);
        checkFloat(BigDecimal.valueOf(-1, 1000), -0.0f);
        checkFloat(BigDecimal.valueOf(1, -1000), Float.POSITIVE_INFINITY);
        checkFloat(BigDecimal.valueOf(-1, -1000), Float.NEGATIVE_INFINITY);
    }

    private static void testFloat16ValueExtremes() {
        checkFloat16(BigDecimal.valueOf(1, 1000), Float16.valueOf(0.0f));
        checkFloat16(BigDecimal.valueOf(-1, 1000), Float16.valueOf(-0.0f));
        checkFloat16(BigDecimal.valueOf(1, -1000), Float16.POSITIVE_INFINITY);
        checkFloat16(BigDecimal.valueOf(-1, -1000), Float16.NEGATIVE_INFINITY);
    }

    private static void testCompactConversions() {
        for (long unscaled : new long[] {0, 1, -1, 16_777_217, -16_777_217,
                9_007_199_254_740_993L, -9_007_199_254_740_993L,
                Long.MIN_VALUE, Long.MIN_VALUE + 1, Long.MAX_VALUE}) {
            for (int scale : new int[] {Integer.MIN_VALUE, -400, -22, -1, 0, 1, 2,
                    22, 23, 46, 325, Integer.MAX_VALUE}) {
                String text = BigDecimal.valueOf(unscaled, scale).toString();
                double expectedDouble = Double.parseDouble(text);
                float expectedFloat = Float.parseFloat(text);
                for (boolean cached : new boolean[] {false, true}) {
                    BigDecimal value = BigDecimal.valueOf(unscaled, scale);
                    if (cached) value.toString();
                    double actualDouble = value.doubleValue();
                    float actualFloat = value.floatValue();
                    if (Double.doubleToRawLongBits(actualDouble) != Double.doubleToRawLongBits(expectedDouble)
                            || Float.floatToRawIntBits(actualFloat) != Float.floatToRawIntBits(expectedFloat)) {
                        throw new RuntimeException("Bad compact conversion: unscaled=" + unscaled
                                + ", scale=" + scale + ", cached=" + cached);
                    }
                }
            }
        }
    }

    public static void main(String[] args) {
        testCompactConversions();
        testDoubleValueNearMinValue();
        testDoubleValueNearMinNormal();
        testDoubleValueNearMaxValue();
        testDoubleValueRandom();
        testDoubleValueExtremes();

        testFloatValueNearMinValue();
        testFloatValueNearMinNormal();
        testFloatValueNearMaxValue();
        testFloatValueRandom();
        testFloatValueExtremes();

        testFloat16ValueNearMinValue();
        testFloat16ValueNearMinNormal();
        testFloat16ValueNearMaxValue();
        testFloat16ValueRandom();
        testFloat16ValueExtremes();
    }

}
