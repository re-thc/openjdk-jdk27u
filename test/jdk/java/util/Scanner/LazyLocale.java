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
 * @summary Scanner captures locale settings before initializing numeric patterns
 * @modules jdk.localedata
 * @run main/othervm LazyLocale
 */

import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.util.Locale;
import java.util.Scanner;
import java.util.regex.Pattern;

public class LazyLocale {
    public static void main(String[] args) {
        Locale saved = Locale.getDefault(Locale.Category.FORMAT);
        try {
            captureDefault();
            switchLocale();
            resetLocale();
            cachedValues();
            stringRepresentation();
            radixAndExceptions();
            digitsAndSpecialValues();
        } finally {
            Locale.setDefault(Locale.Category.FORMAT, saved);
        }
    }

    private static void captureDefault() {
        Locale.setDefault(Locale.Category.FORMAT, Locale.US);
        try (Scanner scanner = new Scanner("alpha\n1,234.5")) {
            equal(scanner.nextLine(), "alpha");
            Locale.setDefault(Locale.Category.FORMAT, Locale.GERMANY);
            equal(scanner.locale(), Locale.US);
            equal(scanner.nextDouble(), 1234.5);
        }
        try (Scanner scanner = new Scanner("1.234,5")) {
            Locale.setDefault(Locale.Category.FORMAT, Locale.US);
            equal(scanner.locale(), Locale.GERMANY);
            equal(scanner.nextDouble(), 1234.5);
        }
    }

    private static void switchLocale() {
        try (Scanner scanner = new Scanner("1.234 2,5 3.5 4,5")) {
            scanner.useLocale(Locale.GERMANY).useLocale(Locale.US)
                   .useLocale(Locale.GERMANY);
            equal(scanner.nextInt(), 1234);
            equal(scanner.nextDouble(), 2.5);
            scanner.useLocale(Locale.US);
            equal(scanner.nextDouble(), 3.5);
            scanner.useLocale(Locale.GERMANY);
            equal(scanner.nextDouble(), 4.5);
        }
        try (Scanner scanner = new Scanner("1.5 1.234").useLocale(Locale.US)) {
            equal(scanner.nextBigDecimal(), new BigDecimal("1.5"));
            scanner.useLocale(Locale.GERMANY);
            // Even a previously built decimal pattern must use the current
            // locale's symbols when normalizing the matched token.
            equal(scanner.nextBigDecimal(), new BigDecimal("1234"));
        }
        try (Scanner scanner = new Scanner("1,5").useLocale(Locale.GERMANY)) {
            equal(scanner.nextFloat(), 1.5f);
        }
        try (Scanner scanner = new Scanner("1.234").useLocale(Locale.GERMANY)) {
            equal(scanner.nextBigInteger(), BigInteger.valueOf(1234));
        }
    }

    private static void resetLocale() {
        Locale.setDefault(Locale.Category.FORMAT, Locale.US);
        try (Scanner scanner = new Scanner("1.234,5 2.5")) {
            scanner.useDelimiter(",").useRadix(16);
            Locale.setDefault(Locale.Category.FORMAT, Locale.GERMANY);
            equal(scanner.reset(), scanner);
            equal(scanner.locale(), Locale.GERMANY);
            equal(scanner.radix(), 10);
            equal(scanner.delimiter().pattern(), "\\p{javaWhitespace}+");
            equal(scanner.nextDouble(), 1234.5);
            Locale.setDefault(Locale.Category.FORMAT, Locale.US);
            scanner.reset();
            equal(scanner.nextDouble(), 2.5);
        }
    }

    private static void cachedValues() {
        try (Scanner scanner = new Scanner("1,234 2,5").useLocale(Locale.US)) {
            check(scanner.hasNextInt(), "integer lookahead");
            equal(scanner.useLocale(Locale.of("en", "US")), scanner);
            equal(scanner.nextInt(), 1234);
            scanner.useLocale(Locale.GERMANY);
            check(scanner.hasNextDouble(), "double lookahead");
            scanner.useLocale(Locale.US);
            // A locale change does not discard an already cached value.
            equal(scanner.nextDouble(), 2.5);
        }
    }

    private static void stringRepresentation() {
        try (Scanner scanner = new Scanner("alpha beta").useLocale(Locale.GERMANY)) {
            checkSymbols(scanner, Locale.GERMANY);
            equal(scanner.next(), "alpha");
            scanner.useLocale(Locale.US);
            checkSymbols(scanner, Locale.US);
            equal(scanner.next(), "beta");
            scanner.close();
            scanner.useLocale(Locale.GERMANY);
            checkSymbols(scanner, Locale.GERMANY);
            equal(scanner.reset(), scanner);
            equal(scanner.locale(), Locale.getDefault(Locale.Category.FORMAT));
        }
    }

    private static void checkSymbols(Scanner scanner, Locale locale) {
        String actual = scanner.toString();
        DecimalFormat format = (DecimalFormat) NumberFormat.getNumberInstance(locale);
        DecimalFormatSymbols symbols = DecimalFormatSymbols.getInstance(locale);
        String[][] fields = {
            {"group separator", "\\x{" + Integer.toHexString(symbols.getGroupingSeparator()) + "}"},
            {"decimal separator", "\\x{" + Integer.toHexString(symbols.getDecimalSeparator()) + "}"},
            {"positive prefix", quote(format.getPositivePrefix())},
            {"negative prefix", quote(format.getNegativePrefix())},
            {"positive suffix", quote(format.getPositiveSuffix())},
            {"negative suffix", quote(format.getNegativeSuffix())},
            {"NaN string", Pattern.quote(symbols.getNaN())},
            {"infinity string", Pattern.quote(symbols.getInfinity())}
        };
        for (String[] field : fields) {
            String expected = "[" + field[0] + "=" + field[1] + "]";
            check(actual.contains(expected), expected + " missing from " + actual);
        }
    }

    private static String quote(String value) {
        return value.isEmpty() ? value : Pattern.quote(value);
    }

    private static void radixAndExceptions() {
        try (Scanner scanner = new Scanner("ff 10 101 z").useLocale(Locale.US).useRadix(16)) {
            expect(NullPointerException.class, () -> scanner.useLocale(null));
            equal(scanner.locale(), Locale.US);
            equal(scanner.nextInt(), 255);
            equal(scanner.nextInt(2), 2);
            equal(scanner.useRadix(2).nextInt(), 5);
            equal(scanner.useRadix(36).nextInt(), 35);
            expect(IllegalArgumentException.class, () -> scanner.useRadix(1));
            equal(scanner.radix(), 36);
            expect(IllegalArgumentException.class, () -> scanner.nextInt(37));
            scanner.close();
            expect(IllegalArgumentException.class, () -> scanner.hasNextInt(1));
            expect(IllegalArgumentException.class, () -> scanner.nextInt(37));
            expect(IllegalStateException.class, () -> scanner.hasNextInt(10));
            expect(IllegalStateException.class, scanner::nextDouble);
            expect(NullPointerException.class, () -> scanner.useLocale(null));
        }
    }

    private static void digitsAndSpecialValues() {
        try (Scanner scanner = new Scanner("\u0661\u0662\u0663 \u0661\u0662\u0663.\u0665")
                .useLocale(Locale.US)) {
            equal(scanner.nextInt(), 123);
            equal(scanner.nextDouble(), 123.5);
        }
        Locale arabicDigits = Locale.forLanguageTag("en-US-u-nu-arab");
        try (Scanner scanner = new Scanner("\u0661\u066c\u0662\u0663\u0664\u066b\u0665")
                .useLocale(arabicDigits)) {
            equal(scanner.locale(), arabicDigits);
            equal(scanner.nextDouble(), 1234.5);
        }
        try (Scanner scanner = new Scanner("NaN Infinity -Infinity +NaN").useLocale(Locale.US)) {
            check(scanner.hasNextDouble(), "NaN lookahead");
            check(Double.isNaN(scanner.nextDouble()), "NaN");
            equal(scanner.nextFloat(), Float.POSITIVE_INFINITY);
            equal(scanner.nextDouble(), Double.NEGATIVE_INFINITY);
            check(Double.isNaN(scanner.nextDouble()), "+NaN");
        }
    }

    private static void equal(Object actual, Object expected) {
        if (!actual.equals(expected)) {
            throw new AssertionError("Expected " + expected + ", got " + actual);
        }
    }

    private static void check(boolean condition, String message) {
        if (!condition) {
            throw new AssertionError(message);
        }
    }

    private static void expect(Class<? extends Throwable> type, Runnable action) {
        try {
            action.run();
        } catch (Throwable thrown) {
            if (type.isInstance(thrown)) {
                return;
            }
            throw new AssertionError("Expected " + type.getName(), thrown);
        }
        throw new AssertionError("Expected " + type.getName());
    }
}
