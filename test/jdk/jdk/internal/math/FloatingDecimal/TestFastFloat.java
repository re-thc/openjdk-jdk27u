/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @summary Compare fast_float, each execution tier and JNI with the Java parser
 * @modules java.base/jdk.internal.math:+open
 * @run main/othervm -XX:+UseFastFloatIntrinsics TestFastFloat
 * @run main/othervm -Xint -XX:+UseFastFloatIntrinsics TestFastFloat
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseFastFloatIntrinsics TestFastFloat
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:-CompactStrings TestFastFloat
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:+UseFastFloatIntrinsics TestFastFloat
 * @run main/othervm -XX:-CompactStrings -XX:+UseFastFloatIntrinsics TestFastFloat
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_parseFastFloat,_parseFastFloatDigits TestFastFloat
 * @run main/othervm -Xint -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_parseFastFloat,_parseFastFloatDigits TestFastFloat
 * @run main/othervm -XX:-UseFastFloatIntrinsics TestFastFloat
 */

/*
 * @test id=zero
 * @requires vm.flavor == "zero"
 * @summary Native decimal parsing uses JNI on the Zero interpreter
 * @modules java.base/jdk.internal.math:+open
 * @run main/othervm -Xint TestFastFloat
 * @run main/othervm -Xint -XX:-CompactStrings TestFastFloat
 * @run main/othervm -Xint -XX:-UseFastFloatIntrinsics TestFastFloat
 */

/*
 * @test id=zgc
 * @requires vm.gc.Z & vm.compiler1.enabled & vm.compiler2.enabled
 * @summary Exercise native String parsing with ZGC across execution tiers
 * @modules java.base/jdk.internal.math:+open
 * @run main/othervm -Xmx64m -Xint -XX:+UseZGC TestFastFloat
 * @run main/othervm -Xmx64m -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseZGC TestFastFloat
 * @run main/othervm -Xmx64m -Xbatch -XX:-TieredCompilation -XX:+UseZGC TestFastFloat
 * @run main/othervm -Xmx64m -Xint -XX:+UseZGC -XX:-CompactStrings TestFastFloat
 */

/*
 * @test id=shenandoah
 * @requires vm.gc.Shenandoah & vm.compiler1.enabled & vm.compiler2.enabled
 * @summary Exercise String load barriers in frameless interpreter entries and compiled calls
 * @modules java.base/jdk.internal.math:+open
 * @run main/othervm -Xmx64m -Xint -XX:+UseShenandoahGC TestFastFloat
 * @run main/othervm -Xmx64m -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseShenandoahGC TestFastFloat
 * @run main/othervm -Xmx64m -Xbatch -XX:-TieredCompilation -XX:+UseShenandoahGC TestFastFloat
 * @run main/othervm -Xmx64m -Xint -XX:+UseShenandoahGC -XX:-CompactStrings TestFastFloat
 */

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;
import java.util.Random;
import java.util.Scanner;
import jdk.internal.math.FloatingDecimal;

public class TestFastFloat {
    private static final Method JAVA_PARSER;
    private static final Constructor<?> DIGIT_BUFFER;
    private static final Method DIGIT_PARSER;

    static {
        try {
            JAVA_PARSER = FloatingDecimal.class.getDeclaredMethod("readJavaFormatString", String.class, int.class);
            JAVA_PARSER.setAccessible(true);
            Class<?> buffer = Class.forName("jdk.internal.math.FloatingDecimal$ASCIIToBinaryBuffer");
            DIGIT_BUFFER = buffer.getDeclaredConstructor(boolean.class, int.class, byte[].class, int.class);
            DIGIT_BUFFER.setAccessible(true);
            DIGIT_PARSER = buffer.getDeclaredMethod("doubleValue");
            DIGIT_PARSER.setAccessible(true);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private static double reference(String s, int ix) throws Throwable {
        try {
            return (double) JAVA_PARSER.invoke(null, s, ix);
        } catch (InvocationTargetException e) {
            throw e.getCause();
        }
    }

    private static double referenceDigits(int exponent, byte[] digits, int length) throws Throwable {
        try {
            return (double) DIGIT_PARSER.invoke(DIGIT_BUFFER.newInstance(false, exponent, digits, length));
        } catch (InvocationTargetException e) {
            throw e.getCause();
        }
    }

    private static long bits(double v, int ix) {
        return ix == 1 ? Float.floatToIntBits((float) v) : Double.doubleToLongBits(v);
    }

    private static void check(String s) throws Throwable {
        for (int ix = 1; ix <= 2; ix++) {
            double expected;
            try {
                expected = reference(s, ix);
            } catch (NumberFormatException | NullPointerException e) {
                try {
                    if (ix == 1) {
                        Float.parseFloat(s);
                    } else {
                        Double.parseDouble(s);
                    }
                    throw new AssertionError("Accepted invalid input: " + s);
                } catch (NumberFormatException | NullPointerException actual) {
                    if (actual.getClass() != e.getClass() || !java.util.Objects.equals(actual.getMessage(), e.getMessage())) {
                        throw new AssertionError("Exception differs for: " + s, actual);
                    }
                }
                continue;
            }
            double actual = ix == 1 ? Float.parseFloat(s) : Double.parseDouble(s);
            if (bits(actual, ix) != bits(expected, ix)) {
                throw new AssertionError("ix=" + ix + " input=" + s + " expected=" + expected + " actual=" + actual);
            }
        }
    }

    public static void main(String[] args) throws Throwable {
        String[] edges = {
            null, "", " ", "+", "-", ".", "+.", "1e", "1e+", "1e-", "1..0", "1 2",
            "1 f", "1ff", "1df", "1x", "0x1p0", "-0X1.Fp-149f", "0x1p-1074",
            "0x1", "NaN", "-NaN", "+NaN", "nan", "NaNf", "Infinity", "-Infinity",
            "+Infinity", "inf", "infinity", "1e99999999999999999999", "-1e-99999999999999999",
            "0e9999999999999999999", "-0", "-0.0", ".0", "00.", "01", "+.5", "5.e3",
            "1d", "1F", "  +123.456e-7D ", "\u0000-0.0\u001f", "\u00a01", "1\u0080", "\u0661",
            "1.000000059604644775390625", "1.0000000596046447753906250000000000000001",
            "0.0999999977648258209228515625000001", "16777217", "9007199254740993",
            "2.4703282292062327e-324", "2.4703282292062328e-324", "4.9406564584124654e-324",
            "1.7976931348623157e308", "1.7976931348623159e308", "3.4028235677973366e38",
            "7.006492321624085e-46", "7.006492321624086e-46",
            "1." + "0".repeat(1022), "1." + "0".repeat(1023), "1." + "0".repeat(10000),
            "0." + "0".repeat(1100) + "1e1101", "1" + "0".repeat(1100) + "e-1100"
        };
        for (String s : edges) {
            check(s);
        }
        Random random = new Random(0xFA57F10AL);
        for (int i = 0; i < 20_000; i++) {
            check(Double.toString(Double.longBitsToDouble(random.nextLong())));
            check(Float.toString(Float.intBitsToFloat(random.nextInt())));
            String s = (random.nextBoolean() ? "-" : "+") + random.nextInt(100000)
                    + "." + Long.toUnsignedString(random.nextLong()) + "e" + (random.nextInt(800) - 400);
            check(s);
            if (i % 100 == 0) {
                check(s + "f");
                check("\t" + s + "\r");
                check(s + "z");
                check(Double.toHexString(Double.longBitsToDouble(random.nextLong())));
            }
        }
        // Long mantissas force fast_float's digit-comparison path, including ties.
        for (int i = 0; i < 200; i++) {
            BigDecimal exact = new BigDecimal(Double.longBitsToDouble(1 + random.nextLong(0x7fefffffffffffffL)));
            check(exact.toString());
            check(exact.add(BigDecimal.ONE.scaleByPowerOfTen(-1100)).toString());
        }
        // Full BigDecimal conversions are exact, even when float would double-round.
        for (int i = 0; i < 2_000; i++) {
            String s = Long.toUnsignedString(random.nextLong()) + "."
                    + Long.toUnsignedString(random.nextLong()) + "e" + (random.nextInt(700) - 350);
            BigDecimal bd = new BigDecimal(s);
            for (boolean cached : new boolean[] {false, true}) {
                if (cached) {
                    bd.toString();
                }
                if (bits(bd.doubleValue(), 2) != bits(reference(s, 2), 2)
                        || bits(bd.floatValue(), 1) != bits(reference(s, 1), 1)) {
                    throw new AssertionError("BigDecimal conversion: " + s + " cached=" + cached);
                }
            }
        }
        // DecimalFormat passes a digit buffer plus decimal point position.
        for (int i = 0; i < 2_000; i++) {
            String digits = "1" + Long.toUnsignedString(random.nextLong());
            byte[] buffer = (digits + "unused").getBytes(StandardCharsets.ISO_8859_1);
            int decExp = random.nextInt(800) - 400;
            String s = digits + "e" + ((long) decExp - digits.length());
            if (bits(FloatingDecimal.parseDoubleSignlessDigits(decExp, buffer, digits.length()), 2)
                    != bits(reference(s, 2), 2)) {
                throw new AssertionError("DigitList: " + s);
            }
        }
        for (String digitText : new String[] {
                "0", "000123", "0".repeat(200), "9".repeat(768), "9".repeat(769),
                "1000000059604644775390625", "10000000596046447753906250000000000001",
                new BigDecimal(0.1d).unscaledValue().toString()
        }) {
            byte[] buffer = digitText.getBytes(StandardCharsets.ISO_8859_1);
            for (int e : new int[] {-400, 0, 1, 400}) {
                double expected = referenceDigits(e, buffer, buffer.length);
                if (bits(FloatingDecimal.parseDoubleSignlessDigits(e, buffer, buffer.length), 2) != bits(expected, 2)) {
                    throw new AssertionError("DigitList rounding: " + digitText + " exponent=" + e);
                }
            }
        }
        for (int e : new int[] {Integer.MIN_VALUE, Integer.MAX_VALUE}) {
            byte[] digits = "12345678901234567890".getBytes(StandardCharsets.ISO_8859_1);
            double expected = reference("12345678901234567890e" + ((long) e - digits.length), 2);
            if (bits(FloatingDecimal.parseDoubleSignlessDigits(e, digits, digits.length), 2) != bits(expected, 2)) {
                throw new AssertionError("DigitList extreme exponent " + e);
            }
        }
        DecimalFormat df = new DecimalFormat("0.############################", DecimalFormatSymbols.getInstance(Locale.ROOT));
        double value = 1.2345678901234567;
        if (bits(df.parse("1.2345678901234567").doubleValue(), 2) != bits(value, 2)) {
            throw new AssertionError("DecimalFormat");
        }
        try (Scanner scanner = new Scanner("1.2345678901234567 1.2345678").useLocale(Locale.ROOT)) {
            if (bits(scanner.nextDouble(), 2) != bits(value, 2)
                    || bits(scanner.nextFloat(), 1) != bits(1.2345678f, 1)) {
                throw new AssertionError("Scanner");
            }
        }
        System.out.println("fast_float differential checks passed");
    }
}
