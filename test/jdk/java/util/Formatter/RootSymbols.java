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
 * @summary Check that numbers are formatted with the symbols of the root,
 *          English and US locales, which are the same in the CLDR data and
 *          not looked up, with those of a provider that comes before CLDR,
 *          and with those of the other locales.
 * @library /test/lib
 * @build jdk.test.lib.compiler.CompilerUtils
 * @run main RootSymbols
 */

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.text.DecimalFormatSymbols;
import java.util.Formatter;
import java.util.List;
import java.util.Locale;

import jdk.test.lib.compiler.CompilerUtils;
import jdk.test.lib.process.ProcessTools;

public class RootSymbols {

    private static final List<Locale> LOCALES = List.of(Locale.ROOT, Locale.ENGLISH, Locale.US);

    // Locales with symbols of their own, which must still be looked up
    private static final List<Locale> OTHERS = List.of(Locale.GERMANY, Locale.FRANCE, Locale.of("ar", "EG"));

    private static final String PROVIDER = """
            package p;
            import java.text.DecimalFormatSymbols;
            import java.text.spi.DecimalFormatSymbolsProvider;
            import java.util.Locale;
            public class Provider extends DecimalFormatSymbolsProvider {
                public Locale[] getAvailableLocales() {
                    return new Locale[] {Locale.ROOT, Locale.ENGLISH, Locale.US};
                }
                public DecimalFormatSymbols getInstance(Locale locale) {
                    DecimalFormatSymbols symbols = new DecimalFormatSymbols(locale);
                    symbols.setZeroDigit('\\u0660');
                    symbols.setDecimalSeparator('#');
                    symbols.setGroupingSeparator('_');
                    symbols.setMinusSign('M');
                    return symbols;
                }
            }
            """;

    public static void main(String[] args) throws Exception {
        // The symbols of the CLDR data, which are those that are assumed
        for (Locale locale : LOCALES) {
            DecimalFormatSymbols symbols = DecimalFormatSymbols.getInstance(locale);
            if (symbols.getZeroDigit() != '0' || symbols.getDecimalSeparator() != '.'
                    || symbols.getGroupingSeparator() != ',' || symbols.getMinusSign() != '-') {
                throw new RuntimeException("Symbols of " + locale + " are not the root ones");
            }
        }
        check(LOCALES);
        check(OTHERS);

        // The symbols of a provider
        Path source = Path.of("src", "p");
        Files.createDirectories(source);
        Files.writeString(source.resolve("Provider.java"), PROVIDER);
        Path classes = Path.of("classes");
        if (!CompilerUtils.compile(Path.of("src"), classes)) {
            throw new RuntimeException("Compilation failed");
        }
        Path services = classes.resolve("META-INF").resolve("services");
        Files.createDirectories(services);
        Files.writeString(services.resolve("java.text.spi.DecimalFormatSymbolsProvider"), "p.Provider\n");
        ProcessTools.executeTestJava("-Djava.locale.providers=SPI,CLDR",
                        "-cp", System.getProperty("test.classes") + File.pathSeparator + classes.toAbsolutePath(),
                        "RootSymbols$Child")
                .outputTo(System.out)
                .errorTo(System.err)
                .shouldHaveExitValue(0);
    }

    static class Child {
        public static void main(String[] args) {
            if (DecimalFormatSymbols.getInstance(Locale.US).getZeroDigit() != '٠') {
                throw new RuntimeException("The provider is not used");
            }
            check(LOCALES);
            check(OTHERS);
        }
    }

    // Numbers are formatted as the symbols of the locale say
    private static void check(List<Locale> locales) {
        for (Locale locale : locales) {
            DecimalFormatSymbols symbols = DecimalFormatSymbols.getInstance(locale);
            char zero = symbols.getZeroDigit();
            String grouped = digits("1", zero) + symbols.getGroupingSeparator() + digits("234", zero)
                    + symbols.getGroupingSeparator() + digits("567", zero);
            String decimal = symbols.getDecimalSeparator() + digits("89", zero);

            // The sign of a number is not localized, but the one of a negative year is
            expect(locale, "%d", -1234567, "-" + digits("1234567", zero));
            expect(locale, "%,d", -1234567, "-" + grouped);
            expect(locale, "%,.2f", -1234567.891, "-" + grouped + decimal);
            expect(locale, "%010.2f", 1234.5, digits("0001234", zero) + symbols.getDecimalSeparator() + digits("50", zero));
            expect(locale, "%s %d", "year", 2026, "year " + digits("2026", zero));
            expect(locale, "%tY-%<tm-%<td", new java.util.GregorianCalendar(2026, 0, 2),
                    digits("2026", zero) + "-" + digits("01", zero) + "-" + digits("02", zero));
            expect(locale, "%tF", java.time.LocalDate.of(-1, 1, 2),
                    symbols.getMinusSign() + digits("0001", zero) + "-" + digits("01", zero) + "-" + digits("02", zero));
        }
    }

    private static String digits(String ascii, char zero) {
        StringBuilder sb = new StringBuilder();
        for (char c : ascii.toCharArray()) {
            sb.append((char) (c - '0' + zero));
        }
        return sb.toString();
    }

    private static void expect(Locale locale, String format, Object arg, String expected) {
        expect(locale, format, arg, null, expected);
    }

    private static void expect(Locale locale, String format, Object arg1, Object arg2, String expected) {
        String actual = arg2 == null ? String.format(locale, format, arg1)
                : new Formatter(locale).format(format, arg1, arg2).toString();
        if (!expected.equals(actual)) {
            throw new RuntimeException(locale + " " + format + ": expected " + expected + " but got " + actual);
        }
    }
}
