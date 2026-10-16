/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @summary Scanner uses fallback decimal patterns with non-DecimalFormat providers
 * @library provider
 * @build provider/module-info provider/scannerprovider.State
 *        provider/scannerprovider.NumberProvider provider/scannerprovider.SymbolsProvider
 * @compile --module-path ${test.classes}/modules --add-modules provider NonDecimalFormatLocale.java
 * @run main/othervm --add-modules provider -Djava.locale.providers=SPI,CLDR NonDecimalFormatLocale us
 * @run main/othervm --add-modules provider -Djava.locale.providers=CLDR,SPI NonDecimalFormatLocale custom
 */

import java.text.DecimalFormat;
import java.text.FieldPosition;
import java.text.NumberFormat;
import java.text.ParsePosition;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Scanner;
import java.util.regex.Pattern;
import scannerprovider.State;

public class NonDecimalFormatLocale {
    public static void main(String[] args) {
        Locale primary = args[0].equals("us") ? Locale.US : State.CUSTOM;
        Locale other = args[0].equals("us") ? Locale.GERMANY : State.OTHER_CUSTOM;
        Locale original = Locale.getDefault(Locale.Category.FORMAT);
        try {
            Locale.setDefault(Locale.Category.FORMAT, primary);
            snapshot(primary, other);
            reentrant(primary, other);
        } finally {
            Locale.setDefault(Locale.Category.FORMAT, original);
        }
    }

    private static void prepare(Locale locale) {
        State.prepare(false);
        State.symbols.setMinusSign('~');
        State.numberFormatOverride = new UnusableNumberFormat();
        NumberFormat format = NumberFormat.getNumberInstance(locale);
        require(format == State.numberFormatOverride && !(format instanceof DecimalFormat),
                "The selected provider must return the non-DecimalFormat instance");
        State.clearTrace();
    }

    private static void snapshot(Locale primary, Locale other) {
        prepare(primary);
        try (Scanner scanner = new Scanner("1_234:5 -6_789 2,500.25")) {
            requests(primary);
            String captured = scanner.toString();
            require(captured.contains("[positive prefix=]"), "Fallback positive prefix");
            require(captured.contains("[negative prefix=" + Pattern.quote("~") + "]"),
                    "Fallback must use the supplied decimal symbols");
            require(captured.contains("[positive suffix=][negative suffix=]"),
                    "Fallback suffixes must not come from the unused DecimalFormat fixture");

            State.symbols.setGroupingSeparator(',');
            State.symbols.setDecimalSeparator('.');
            State.symbols.setMinusSign('-');
            State.symbols.setNaN("changed.nan");
            State.symbols.setInfinity("changed.inf");
            require(scanner.toString().equals(captured), "Eager fallback symbol snapshot");
            require(scanner.nextDouble() == 1234.5, "Captured grouping and decimal symbols");
            require(scanner.nextInt() == -6789, "Captured integer grouping symbol");
            requests();

            scanner.useLocale(other);
            requests(other);
            require(scanner.nextDouble() == 2500.25, "Changed locale symbol snapshot");
            requests();
            scanner.reset();
            requests(primary);
        }
    }

    private static void reentrant(Locale primary, Locale other) {
        prepare(primary);
        try (Scanner scanner = new Scanner("word")) {
            requests(primary);
            State.numberCallback = locale -> scanner.useLocale(primary);
            scanner.useLocale(other);
            require(State.requests.equals(List.of(
                    "number=" + other.toLanguageTag(),
                    "number=" + primary.toLanguageTag(),
                    "symbols=" + primary.toLanguageTag(),
                    "symbols=" + other.toLanguageTag())),
                    "Reentrant fallback locale arguments: " + State.requests);
            require(scanner.locale().equals(primary), "Reentrant scanner locale");
            State.clearTrace();
            require(scanner.next().equals("word"), "Text token after eager fallback");
            scanner.toString();
            requests();
        }
    }

    private static void requests(Locale... locales) {
        List<String> expected = new ArrayList<>();
        for (Locale locale : locales) {
            expected.add("number=" + locale.toLanguageTag());
            expected.add("symbols=" + locale.toLanguageTag());
        }
        require(State.requests.equals(expected),
                "Expected eager provider requests " + expected + ", got " + State.requests);
        State.clearTrace();
    }

    private static void require(boolean condition, String message) {
        if (!condition) {
            throw new AssertionError(message);
        }
    }

    // Scanner must obtain fallback DecimalFormat affixes, not delegate to this object.
    private static class UnusableNumberFormat extends NumberFormat {
        @Override
        public StringBuffer format(double number, StringBuffer result, FieldPosition position) {
            throw new AssertionError("Unexpected provider formatting");
        }

        @Override
        public StringBuffer format(long number, StringBuffer result, FieldPosition position) {
            throw new AssertionError("Unexpected provider formatting");
        }

        @Override
        public Number parse(String text, ParsePosition position) {
            throw new AssertionError("Unexpected provider parsing");
        }
    }
}
