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
 * @summary Scanner captures stateful numeric locale providers eagerly
 * @library provider
 * @build provider/module-info provider/scannerprovider.State
 *        provider/scannerprovider.NumberProvider provider/scannerprovider.SymbolsProvider
 * @compile --module-path ${test.classes}/modules --add-modules provider EagerLocaleProviders.java
 * @run main/othervm --add-modules provider -Djava.locale.providers=SPI,CLDR EagerLocaleProviders us
 * @run main/othervm --add-modules provider -Djava.locale.providers=CLDR,SPI EagerLocaleProviders custom
 * @run main/othervm --add-modules provider -Djava.locale.providers=SPI,CLDR EagerLocaleProviders us symbolsOnly
 * @run main/othervm --add-modules provider -Djava.locale.providers=CLDR,SPI EagerLocaleProviders custom symbolsOnly
 */

import java.util.List;
import java.util.Locale;
import java.util.Scanner;
import scannerprovider.State;

public class EagerLocaleProviders {
    private static Locale primary;
    private static Locale other;
    private static boolean symbolsOnly;

    public static void main(String[] args) {
        primary = args[0].equals("us") ? Locale.US : State.CUSTOM;
        other = args[0].equals("us") ? Locale.GERMANY : State.OTHER_CUSTOM;
        symbolsOnly = args.length > 1;
        Locale original = Locale.getDefault(Locale.Category.FORMAT);
        try {
            Locale.setDefault(Locale.Category.FORMAT, primary);
            lifecycle();
            snapshot();
            failures();
            if (!symbolsOnly) {
                reentrantCallback();
            }
        } finally {
            Locale.setDefault(Locale.Category.FORMAT, original);
        }
    }

    private static void lifecycle() {
        State.prepare(symbolsOnly);
        try (Scanner scanner = new Scanner("word")) {
            initialized();
            require(scanner.locale().equals(primary), "Constructor locale");
            scanner.useLocale(primary);
            scanner.reset();
            require(scanner.next().equals("word"), "Text token");
            events();

            scanner.useLocale(other);
            initialized();
            require(scanner.locale().equals(other), "Changed locale");
            Locale.setDefault(Locale.Category.FORMAT, other);
            scanner.reset();
            events();
            Locale.setDefault(Locale.Category.FORMAT, primary);
            scanner.reset();
            initialized();
            require(scanner.locale().equals(primary), "Reset locale");
            try {
                scanner.useLocale(null);
                throw new AssertionError("Expected null locale rejection");
            } catch (NullPointerException expected) {
                require(scanner.locale().equals(primary), "Null changed locale");
                events();
            }
        }
    }

    private static void snapshot() {
        State.prepare(symbolsOnly);
        try (Scanner scanner = new Scanner("1_234:5 6_789")) {
            initialized();
            String captured = scanner.toString();
            State.numberFormat.setPositivePrefix("changed");
            State.numberFormat.setNegativePrefix("changed");
            State.numberFormat.setPositiveSuffix("changed");
            State.numberFormat.setNegativeSuffix("changed");
            State.symbols.setGroupingSeparator(',');
            State.symbols.setDecimalSeparator('.');
            State.symbols.setNaN("changed");
            State.symbols.setInfinity("changed");
            require(scanner.toString().equals(captured), "Provider state was not captured");
            require(scanner.nextDouble() == 1234.5, "Captured decimal symbols");
            require(scanner.nextInt() == 6789, "Captured grouping symbol");
            events();
        }
    }

    private static void failures() {
        if (!symbolsOnly) {
            factoryFailure("number", 1, "number");
        }
        factoryFailure("symbols", 1,
                symbolsOnly ? new String[] {"symbols"} : new String[] {"number", "symbols"});
        if (symbolsOnly) {
            // Built-in NumberFormat requests symbols before Scanner's separate request.
            factoryFailure("symbols", 2, "symbols", "symbols");
        }

        State.prepare(symbolsOnly);
        try (Scanner scanner = new Scanner("word")) {
            initialized();
            State.symbols.setGroupingSeparator('|');
            State.failAt = "decimal";
            State.failureCountdown = 1;
            expectFailure(() -> scanner.useLocale(other));
            events(symbolsOnly
                    ? new String[] {"symbols", "symbols", "grouping", "decimal"}
                    : new String[] {"number", "symbols", "grouping", "decimal"});
            require(scanner.locale().equals(other), "Getter failure locale");
            String text = scanner.toString();
            require(text.contains("[group separator=\\x{7c}]"), "Missing partial grouping update");
            require(text.contains("[decimal separator=\\x{3a}]"), "Lost previous decimal symbol");
            scanner.useLocale(other);
            events();
        }
    }

    private static void factoryFailure(String failAt, int countdown, String... expected) {
        State.prepare(symbolsOnly);
        State.failAt = failAt;
        State.failureCountdown = countdown;
        expectFailure(() -> new Scanner("word"));
        events(expected);

        State.prepare(symbolsOnly);
        try (Scanner scanner = new Scanner("1_234 5_678")) {
            initialized();
            require(scanner.nextInt() == 1234, "Initial numeric pattern");
            String captured = scanner.toString();
            State.failAt = failAt;
            State.failureCountdown = countdown;
            expectFailure(() -> scanner.useLocale(other));
            events(expected);
            require(scanner.locale().equals(other), "Factory failure locale");
            require(scanner.toString().equals(captured), "Factory failure changed symbols");
            scanner.useLocale(other);
            require(scanner.nextInt() == 5678, "Factory failure discarded previous numeric state");
            events();
        }
    }

    private static void reentrantCallback() {
        State.prepare(false);
        try (Scanner scanner = new Scanner("word")) {
            initialized();
            State.clearTrace();
            State.numberCallback = locale -> scanner.useLocale(primary);
            scanner.useLocale(other);
            require(State.requests.equals(List.of(
                    "number=" + other.toLanguageTag(),
                    "number=" + primary.toLanguageTag(),
                    "symbols=" + primary.toLanguageTag(),
                    "symbols=" + other.toLanguageTag())), "Reentrant locale arguments: " + State.requests);
            require(scanner.locale().equals(primary), "Reentrant locale change");
            State.clearTrace();
            scanner.toString();
            events();
        }
    }

    private static void initialized() {
        events(symbolsOnly
                ? new String[] {"symbols", "symbols", "grouping", "decimal", "nan", "infinity"}
                : new String[] {"number", "symbols", "grouping", "decimal", "nan", "infinity",
                                "positivePrefix", "negativePrefix", "positiveSuffix", "negativeSuffix"});
    }

    private static void events(String... expected) {
        require(State.events.equals(List.of(expected)),
                "Expected events " + List.of(expected) + ", got " + State.events);
        State.events.clear();
    }

    private static void expectFailure(Runnable action) {
        try {
            action.run();
            throw new AssertionError("Expected immediate provider failure");
        } catch (RuntimeException exception) {
            if (exception != State.FAILURE) {
                throw exception;
            }
        }
    }

    private static void require(boolean condition, String message) {
        if (!condition) {
            throw new AssertionError(message);
        }
    }
}
