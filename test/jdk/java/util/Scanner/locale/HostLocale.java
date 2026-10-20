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
 * @summary Scanner eagerly captures symbols from the native HOST locale provider
 * @requires (os.family == "mac" | os.family == "windows")
 * @modules java.base/java.util:open
 *          java.base/sun.util.locale.provider
 * @run main/othervm -Djava.locale.providers=HOST,CLDR HostLocale
 */

import java.lang.reflect.Field;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.text.spi.DecimalFormatSymbolsProvider;
import java.text.spi.NumberFormatProvider;
import java.util.Locale;
import java.util.Scanner;
import java.util.regex.Pattern;

import sun.util.locale.provider.LocaleProviderAdapter;

public class HostLocale {
    public static void main(String[] args) throws Exception {
        Locale locale = Locale.getDefault(Locale.Category.FORMAT);
        requireHost(NumberFormatProvider.class, locale);
        requireHost(DecimalFormatSymbolsProvider.class, locale);
        DecimalFormat format = (DecimalFormat) NumberFormat.getNumberInstance(locale);
        DecimalFormatSymbols symbols = DecimalFormatSymbols.getInstance(locale);
        String input = "word\n" + format.format(1234.5) + " " + format.format(-6789);
        try (Scanner scanner = new Scanner(input)) {
            captured(scanner, format, symbols);
            if (!scanner.nextLine().equals("word")) {
                throw new AssertionError("Unexpected text line");
            }
            // Both explicit locale changes and reset must capture HOST data
            // before toString or numeric parsing can initialize it on demand.
            scanner.useLocale(Locale.ROOT).useLocale(locale);
            captured(scanner, format, symbols);
            scanner.useLocale(Locale.ROOT).reset();
            captured(scanner, format, symbols);
            if (scanner.nextDouble() != 1234.5 || scanner.nextInt() != -6789) {
                throw new AssertionError("Native numeric symbols were not used");
            }
        }
        System.out.println("HOST Scanner passed for " + locale.toLanguageTag());
    }

    private static void requireHost(Class<? extends java.util.spi.LocaleServiceProvider> service,
                                    Locale locale) {
        var type = LocaleProviderAdapter.getAdapter(service, locale).getAdapterType();
        if (type != LocaleProviderAdapter.Type.HOST) {
            throw new AssertionError("Expected native HOST for " + service.getName()
                    + " and " + locale + ", got " + type);
        }
    }

    private static void captured(Scanner scanner, DecimalFormat format,
                                 DecimalFormatSymbols symbols) throws Exception {
        check(scanner, "groupSeparator", "\\x{" + Integer.toHexString(symbols.getGroupingSeparator()) + "}");
        check(scanner, "decimalSeparator", "\\x{" + Integer.toHexString(symbols.getDecimalSeparator()) + "}");
        check(scanner, "nanString", Pattern.quote(symbols.getNaN()));
        check(scanner, "infinityString", Pattern.quote(symbols.getInfinity()));
        check(scanner, "positivePrefix", quote(format.getPositivePrefix()));
        check(scanner, "negativePrefix", quote(format.getNegativePrefix()));
        check(scanner, "positiveSuffix", quote(format.getPositiveSuffix()));
        check(scanner, "negativeSuffix", quote(format.getNegativeSuffix()));
    }

    private static String quote(String value) {
        return value.isEmpty() ? value : Pattern.quote(value);
    }

    private static void check(Scanner scanner, String name, String expected) throws Exception {
        Field field = Scanner.class.getDeclaredField(name);
        field.setAccessible(true);
        Object actual = field.get(scanner);
        if (!expected.equals(actual)) {
            throw new AssertionError(name + ": expected " + expected + ", got " + actual);
        }
    }
}
