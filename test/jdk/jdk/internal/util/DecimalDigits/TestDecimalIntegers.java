/*
 * Copyright (c) 1994, 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @summary Compare decimal native integers with the retained Java algorithms and guard exact stores
 * @modules java.base/jdk.internal.util
 * @run main/othervm -XX:+UseFastIntegerIntrinsics -XX:+UseZmijIntegerIntrinsics TestDecimalIntegers
 * @run main/othervm -XX:+UseFastIntegerIntrinsics -XX:+UseZmijIntegerIntrinsics -Xint TestDecimalIntegers
 * @run main/othervm -XX:+UseFastIntegerIntrinsics -XX:+UseZmijIntegerIntrinsics -Xbatch -XX:TieredStopAtLevel=1 TestDecimalIntegers
 * @run main/othervm -XX:+UseFastIntegerIntrinsics -XX:+UseZmijIntegerIntrinsics -Xbatch -XX:-TieredCompilation TestDecimalIntegers
 * @run main/othervm -Xint -XX:+UseFastIntegerIntrinsics -XX:+UseZmijIntegerIntrinsics -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_parseDecimalInt,_parseDecimalLong,_parseUnsignedDecimalInt,_parseUnsignedDecimalLong,_formatDecimalIntLatin1,_formatDecimalIntUTF16,_formatDecimalLongLatin1,_formatDecimalLongUTF16 TestDecimalIntegers
 * @run main/othervm -XX:-UseFastIntegerIntrinsics -XX:-UseZmijIntegerIntrinsics TestDecimalIntegers
 * @run main/othervm -Xint TestDecimalIntegers
 * @run main/othervm -Xint -XX:-UseFastIntegerIntrinsics -XX:-UseZmijIntegerIntrinsics TestDecimalIntegers
 * @run main/othervm -Xint -XX:-UseFastIntegerIntrinsics -XX:+UseZmijIntegerIntrinsics TestDecimalIntegers
 * @run main/othervm -Xint -XX:+UseFastIntegerIntrinsics -XX:-UseZmijIntegerIntrinsics TestDecimalIntegers
 */

/*
 * @test id=restricted-simd
 * @summary Exercise decimal integers with restricted VM SIMD settings
 * @requires os.arch == "amd64"
 * @modules java.base/jdk.internal.util
 * @run main/othervm -Xint -XX:+UseFastIntegerIntrinsics -XX:+UseZmijIntegerIntrinsics -XX:UseSSE=2 TestDecimalIntegers
 */

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.ByteOrder;
import java.util.Arrays;
import java.util.Random;
import jdk.internal.util.DecimalDigits;

public class TestDecimalIntegers {
    private static final String[] NAMES = {"parseInt", "parseLong", "parseUnsignedInt", "parseUnsignedLong"};
    private static final Method[] JAVA = new Method[4];
    private static long assertions;

    static {
        try {
            for (int i = 0; i < 4; ++i) {
                JAVA[i] = JavaParser.class
                        .getDeclaredMethod(NAMES[i] + "Java", String.class, int.class);
                JAVA[i].setAccessible(true);
            }
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private record Result(long value, String exception, String message) { }

    private static Result parse(String s, int radix, int mode, boolean java) {
        try {
            long value;
            if (java) {
                value = ((Number) JAVA[mode].invoke(null, s, radix)).longValue();
            } else {
                value = switch (mode) {
                    case 0 -> Integer.parseInt(s, radix);
                    case 1 -> Long.parseLong(s, radix);
                    case 2 -> Integer.parseUnsignedInt(s, radix);
                    case 3 -> Long.parseUnsignedLong(s, radix);
                    default -> throw new AssertionError();
                };
            }
            return new Result(value, null, null);
        } catch (InvocationTargetException e) {
            Throwable t = e.getCause();
            return new Result(0, t.getClass().getName(), t.getMessage());
        } catch (RuntimeException e) {
            return new Result(0, e.getClass().getName(), e.getMessage());
        } catch (ReflectiveOperationException e) {
            throw new AssertionError(e);
        }
    }

    private static void text(String s, int radix) {
        for (int mode = 0; mode < 4; ++mode) {
            Result expected = parse(s, radix, mode, true);
            Result actual = parse(s, radix, mode, false);
            if (!actual.equals(expected)) {
                throw new AssertionError(NAMES[mode] + " radix=" + radix + " input=" + s
                        + " expected=" + expected + " actual=" + actual);
            }
            ++assertions;
        }
    }

    private static void format(long value, boolean wide) throws ReflectiveOperationException {
        int size = wide ? DecimalDigits.stringSize(value) : DecimalDigits.stringSize((int) value);
        for (int coder = 0; coder < 2; ++coder) {
            for (int offset : new int[] {0, 1, 7}) {
                for (int suffix : new int[] {0, 5}) {
                    int index = size + offset;
                    byte[] expected = new byte[(index + suffix) << coder];
                    Arrays.fill(expected, (byte) 0xa5);
                    byte[] actual = expected.clone();
                    String text = java.math.BigInteger.valueOf(wide ? value : (int) value).toString();
                    int start = index - text.length();
                    for (int n = 0; n < text.length(); ++n) {
                        int byteIndex = (start + n) << coder;
                        if (coder == 0) {
                            expected[byteIndex] = (byte) text.charAt(n);
                        } else {
                            int low = ByteOrder.nativeOrder() == ByteOrder.LITTLE_ENDIAN ? 0 : 1;
                            expected[byteIndex + low] = (byte) text.charAt(n);
                            expected[byteIndex + 1 - low] = 0;
                        }
                    }
                    int got;
                    if (wide) {
                        got = coder == 0 ? DecimalDigits.uncheckedGetCharsLatin1(value, index, actual)
                                         : DecimalDigits.uncheckedGetCharsUTF16(value, index, actual);
                    } else {
                        got = coder == 0 ? DecimalDigits.uncheckedGetCharsLatin1((int) value, index, actual)
                                         : DecimalDigits.uncheckedGetCharsUTF16((int) value, index, actual);
                    }
                    if (got != start || !Arrays.equals(expected, actual)) {
                        throw new AssertionError("store " + value + " wide=" + wide + " coder=" + coder
                                + " offset=" + offset + " suffix=" + suffix);
                    }
                    ++assertions;
                    if (coder == 0 && offset == 0 && suffix == 0) {
                        String oracle = new String(expected, StandardCharsets.ISO_8859_1);
                        String canonical = wide ? Long.toString(value) : Integer.toString((int) value);
                        String append = wide ? new StringBuilder("x").append(value).append('y').toString()
                                             : new StringBuilder("x").append((int) value).append('y').toString();
                        String concat = wide ? "x" + value + "y" : "x" + (int) value + "y";
                        String utf16 = wide ? new StringBuilder("\u20ac").append(value).append('y').toString()
                                            : new StringBuilder("\u20ac").append((int) value).append('y').toString();
                        if (!canonical.equals(oracle) || !append.equals("x" + oracle + "y")
                                || !concat.equals(append) || !utf16.equals("\u20ac" + oracle + "y")) {
                            throw new AssertionError("consumer " + value + " wide=" + wide);
                        }
                        assertions += 4;
                    }
                }
            }
        }
    }

    public static void main(String[] args) throws Exception {
        for (String s : new String[] {null, "", "+", "-", "++1", "+-1", "--1", "-+1", "-0", "+0",
                " 1", "1 ", "1\n", "1f", "1.0", "0x10", "\u0661\u0662", "\uff11\uff12", "\uffff", "\u00001",
                "2147483647", "2147483648", "-2147483648", "-2147483649", "4294967295", "4294967296",
                "9223372036854775807", "9223372036854775808", "-9223372036854775808", "-9223372036854775809",
                "18446744073709551615", "18446744073709551616", "0".repeat(1023) + "1", "0".repeat(1024) + "1"}) {
            for (int radix : new int[] {1, 2, 8, 10, 16, 36, 37}) text(s, radix);
        }
        for (long value : new long[] {0, 1, -1, 9, -9, 10, -10, 99, -99, 100, -100,
                Integer.MIN_VALUE, Integer.MAX_VALUE, Long.MIN_VALUE, Long.MAX_VALUE}) {
            format(value, true);
            format(value, false);
        }
        Random random = new Random(0xDEC1A1L);
        for (int n = 0; n < 4096; ++n) {
            long value = random.nextLong();
            for (int radix : new int[] {2, 8, 10, 16, 36}) {
                text(Long.toString(value, radix), radix);
                text(Long.toUnsignedString(value, radix), radix);
                text(Integer.toString((int) value, radix), radix);
                text(Integer.toUnsignedString((int) value, radix), radix);
            }
            format(value, true);
            format(value, false);
        }
        System.out.println(assertions + " integer parsing/formatting assertions passed");
    }
    // Retained Java parsing algorithms provide the grammar and error oracle.
    private static final class JavaParser {
        private static NumberFormatException forInputString(String s, int radix) {
            return new NumberFormatException("For input string: \"" + s + "\"" +
                    (radix == 10 ? "" : " under radix " + radix));
        }

        private static int parseIntJava(String s, int radix)
                    throws NumberFormatException {
            if (s == null) {
                throw new NumberFormatException("Cannot parse null string");
            }

            if (radix < Character.MIN_RADIX) {
                throw new NumberFormatException(String.format(
                    "radix %s less than Character.MIN_RADIX", radix));
            }

            if (radix > Character.MAX_RADIX) {
                throw new NumberFormatException(String.format(
                    "radix %s greater than Character.MAX_RADIX", radix));
            }

            int len = s.length();
            if (len == 0) {
                throw forInputString("", radix);
            }
            int digit = ~0xFF;
            int i = 0;
            char firstChar = s.charAt(i++);
            if (firstChar != '-' && firstChar != '+') {
                digit = Character.digit(firstChar, radix);
            }
            if (digit >= 0 || digit == ~0xFF && len > 1) {
                int limit = firstChar != '-' ? Integer.MIN_VALUE + 1 : Integer.MIN_VALUE;
                int multmin = limit / radix;
                int result = -(digit & 0xFF);
                boolean inRange = true;
                /* Accumulating negatively avoids surprises near MAX_VALUE */
                while (i < len && (digit = Character.digit(s.charAt(i++), radix)) >= 0
                        && (inRange = result > multmin
                            || result == multmin && digit <= radix * multmin - limit)) {
                    result = radix * result - digit;
                }
                if (inRange && i == len && digit >= 0) {
                    return firstChar != '-' ? -result : result;
                }
            }
            throw forInputString(s, radix);
        }

        private static int parseUnsignedIntJava(String s, int radix)
                    throws NumberFormatException {
            if (s == null)  {
                throw new NumberFormatException("Cannot parse null string");
            }

            if (radix < Character.MIN_RADIX) {
                throw new NumberFormatException(String.format(
                    "radix %s less than Character.MIN_RADIX", radix));
            }

            if (radix > Character.MAX_RADIX) {
                throw new NumberFormatException(String.format(
                    "radix %s greater than Character.MAX_RADIX", radix));
            }

            int len = s.length();
            if (len == 0) {
                throw forInputString(s, radix);
            }
            int i = 0;
            char firstChar = s.charAt(i++);
            if (firstChar == '-') {
                throw new NumberFormatException(String.format(
                    "Illegal leading minus sign on unsigned string %s.", s));
            }
            int digit = ~0xFF;
            if (firstChar != '+') {
                digit = Character.digit(firstChar, radix);
            }
            if (digit >= 0 || digit == ~0xFF && len > 1) {
                int multmax = Integer.divideUnsigned(-1, radix);  // -1 is max unsigned int
                int result = digit & 0xFF;
                boolean inRange = true;
                while (i < len && (digit = Character.digit(s.charAt(i++), radix)) >= 0
                        && (inRange = Integer.compareUnsigned(result, multmax) < 0
                            || result == multmax && digit < -radix * multmax)) {
                    result = radix * result + digit;
                }
                if (inRange && i == len && digit >= 0) {
                    return result;
                }
            }
            if (digit < 0) {
                throw forInputString(s, radix);
            }
            throw new NumberFormatException(String.format(
                "String value %s exceeds range of unsigned int.", s));
        }

        private static long parseLongJava(String s, int radix)
                    throws NumberFormatException {
            if (s == null) {
                throw new NumberFormatException("Cannot parse null string");
            }

            if (radix < Character.MIN_RADIX) {
                throw new NumberFormatException(String.format(
                    "radix %s less than Character.MIN_RADIX", radix));
            }

            if (radix > Character.MAX_RADIX) {
                throw new NumberFormatException(String.format(
                    "radix %s greater than Character.MAX_RADIX", radix));
            }

            int len = s.length();
            if (len == 0) {
                throw forInputString("", radix);
            }
            int digit = ~0xFF;
            int i = 0;
            char firstChar = s.charAt(i++);
            if (firstChar != '-' && firstChar != '+') {
                digit = Character.digit(firstChar, radix);
            }
            if (digit >= 0 || digit == ~0xFF && len > 1) {
                long limit = firstChar != '-' ? Long.MIN_VALUE + 1 : Long.MIN_VALUE;
                long multmin = limit / radix;
                long result = -(digit & 0xFF);
                boolean inRange = true;
                /* Accumulating negatively avoids surprises near MAX_VALUE */
                while (i < len && (digit = Character.digit(s.charAt(i++), radix)) >= 0
                        && (inRange = result > multmin
                            || result == multmin && digit <= (int) (radix * multmin - limit))) {
                    result = radix * result - digit;
                }
                if (inRange && i == len && digit >= 0) {
                    return firstChar != '-' ? -result : result;
                }
            }
            throw forInputString(s, radix);
        }

        private static long parseUnsignedLongJava(String s, int radix)
                    throws NumberFormatException {
            if (s == null)  {
                throw new NumberFormatException("Cannot parse null string");
            }

            if (radix < Character.MIN_RADIX) {
                throw new NumberFormatException(String.format(
                    "radix %s less than Character.MIN_RADIX", radix));
            }

            if (radix > Character.MAX_RADIX) {
                throw new NumberFormatException(String.format(
                    "radix %s greater than Character.MAX_RADIX", radix));
            }

            int len = s.length();
            if (len == 0) {
                throw forInputString(s, radix);
            }
            int i = 0;
            char firstChar = s.charAt(i++);
            if (firstChar == '-') {
                throw new NumberFormatException(String.format(
                    "Illegal leading minus sign on unsigned string %s.", s));
            }
            int digit = ~0xFF;
            if (firstChar != '+') {
                digit = Character.digit(firstChar, radix);
            }
            if (digit >= 0 || digit == ~0xFF && len > 1) {
                long multmax = Long.divideUnsigned(-1L, radix);  // -1L is max unsigned long
                long result = digit & 0xFF;
                boolean inRange = true;
                while (i < len && (digit = Character.digit(s.charAt(i++), radix)) >= 0
                        && (inRange = Long.compareUnsigned(result, multmax) < 0
                            || result == multmax && digit < (int) (-radix * multmax))) {
                    result = radix * result + digit;
                }
                if (inRange && i == len && digit >= 0) {
                    return result;
                }
            }
            if (digit < 0) {
                throw forInputString(s, radix);
            }
            throw new NumberFormatException(String.format(
                "String value %s exceeds range of unsigned long.", s));
        }
    }

}
