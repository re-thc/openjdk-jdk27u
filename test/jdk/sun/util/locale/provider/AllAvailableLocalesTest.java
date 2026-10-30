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
 * @summary Global locale enumeration preserves the per-service union, lookup
 *          normalization, SPI discovery, concurrent first use and array ownership
 * @library /test/lib
 * @modules java.base/sun.util.locale.provider:+open
 * @run driver AllAvailableLocalesTest
 */

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Path;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.spi.NumberFormatProvider;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.spi.LocaleNameProvider;
import java.util.spi.LocaleServiceProvider;

import jdk.test.lib.process.ProcessTools;
import sun.util.locale.provider.LocaleServiceProviderPool;

public class AllAvailableLocalesTest {
    private static final Locale NUMBER_LOCALE = Locale.of("qaa", "ZZ");
    private static final Locale NAME_LOCALE = Locale.of("qab", "ZZ");
    private static int constructors;
    private static int callbacks;

    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            check(args[0]);
            return;
        }
        Path services = Path.of("spi", "META-INF", "services");
        Files.createDirectories(services);
        Files.writeString(services.resolve(NumberFormatProvider.class.getName()),
                Numbers.class.getName() + "\n");
        Files.writeString(services.resolve(LocaleNameProvider.class.getName()),
                Names.class.getName() + "\n");
        String classPath = System.getProperty("test.class.path")
                + System.getProperty("path.separator") + Path.of("spi").toAbsolutePath();
        for (boolean baseOnly : List.of(false, true)) {
            for (String preference : List.of("", "CLDR", "SPI", "SPI,CLDR",
                    "CLDR,SPI", "HOST,CLDR", "CLDR,HOST,SPI", "FALLBACK")) {
                for (String mode : List.of("array", "stream", "prewarm", "concurrent")) {
                    List<String> options = new ArrayList<>();
                    if (baseOnly) {
                        options.add("--limit-modules=java.base");
                    }
                    options.addAll(List.of(
                            "--add-opens=java.base/sun.util.locale.provider=ALL-UNNAMED",
                            "-Djava.locale.providers=" + preference,
                            "-cp", classPath, AllAvailableLocalesTest.class.getName(), mode));
                    System.out.println("baseOnly=" + baseOnly + " providers="
                            + preference + " mode=" + mode);
                    ProcessTools.executeTestJava(options.toArray(String[]::new))
                            .shouldHaveExitValue(0);
                }
            }
        }
    }

    private static void check(String mode) throws Exception {
        if (mode.equals("prewarm")) {
            serviceUnion();
        }
        Set<Locale> actual;
        if (mode.equals("concurrent")) {
            CountDownLatch start = new CountDownLatch(1);
            try (var executor = Executors.newFixedThreadPool(8)) {
                List<Future<Set<Locale>>> results = new ArrayList<>();
                for (int i = 0; i < 8; i++) {
                    boolean stream = (i & 1) != 0;
                    results.add(executor.submit(() -> {
                        start.await();
                        return enumerate(stream);
                    }));
                }
                start.countDown();
                actual = results.getFirst().get();
                for (var result : results) {
                    equal(actual, result.get());
                }
            }
        } else {
            actual = enumerate(mode.equals("stream"));
        }
        equal(serviceUnion(), actual);
        if (!actual.containsAll(List.of(Locale.ROOT, Locale.US))) {
            throw new RuntimeException("Missing ROOT or US");
        }
        // A stream retains its backing array even if a public array is changed.
        var stream = Locale.availableLocales();
        Locale[] copy = Locale.getAvailableLocales();
        Arrays.fill(copy, null);
        equal(actual, new HashSet<>(stream.toList()));
        equal(actual, enumerate(false));
        equal(actual, enumerate(true));
        if (System.getProperty("java.locale.providers").contains("SPI")) {
            if (constructors != 1 || callbacks != 1) {
                throw new RuntimeException("Repeated SPI discovery: constructors="
                        + constructors + " callbacks=" + callbacks);
            }
            for (Locale locale : List.of(NUMBER_LOCALE, NAME_LOCALE,
                    Locale.of("ja", "JP", "JP"), Locale.of("th", "TH", "TH"),
                    Locale.of("no", "NO", "NY"), Locale.of("he", "IL"),
                    Locale.forLanguageTag("qac-Latn-ZZ"))) {
                if (!actual.contains(locale)) {
                    throw new RuntimeException("Missing SPI lookup locale: " + locale);
                }
            }
            if (!NumberFormat.getIntegerInstance(NUMBER_LOCALE).format(42).equals("42")) {
                throw new RuntimeException("SPI number provider unavailable after enumeration");
            }
            if (!Locale.US.getDisplayLanguage(NAME_LOCALE).equals("language")) {
                throw new RuntimeException("SPI name provider unavailable after enumeration");
            }
        } else if (constructors != 0 || callbacks != 0) {
            throw new RuntimeException("SPI discovered while disabled");
        }
    }

    private static Set<Locale> enumerate(boolean stream) {
        List<Locale> values = stream ? Locale.availableLocales().toList()
                : Arrays.asList(Locale.getAvailableLocales());
        Set<Locale> result = new HashSet<>(values);
        if (result.contains(null) || result.size() != values.size()) {
            throw new RuntimeException("Null or duplicate locales");
        }
        return result;
    }

    // The original service-major aggregation is the independent oracle. Use
    // the private set because the public per-service API also adds JRE locales.
    private static Set<Locale> serviceUnion() throws Exception {
        Field classes = LocaleServiceProviderPool.class.getDeclaredField("spiClasses");
        classes.setAccessible(true);
        Method available = LocaleServiceProviderPool.class
                .getDeclaredMethod("getAvailableLocaleSet");
        available.setAccessible(true);
        Set<Locale> result = new HashSet<>();
        for (Class<?> service : (Class<?>[]) classes.get(null)) {
            var pool = LocaleServiceProviderPool.getPool(service.asSubclass(LocaleServiceProvider.class));
            @SuppressWarnings("unchecked")
            Set<Locale> locales = (Set<Locale>) available.invoke(pool);
            result.addAll(locales);
        }
        return result;
    }

    private static void equal(Set<Locale> expected, Set<Locale> actual) {
        if (!expected.equals(actual)) {
            Set<Locale> missing = new HashSet<>(expected);
            missing.removeAll(actual);
            Set<Locale> extra = new HashSet<>(actual);
            extra.removeAll(expected);
            throw new RuntimeException("Missing=" + missing + " extra=" + extra);
        }
    }

    public static class Numbers extends NumberFormatProvider {
        public Numbers() {
            constructors++;
            // Reentrant per-service enumeration must use the in-progress pool
            // rather than discover and construct this provider a second time.
            NumberFormat.getAvailableLocales();
        }

        @Override
        public Locale[] getAvailableLocales() {
            callbacks++;
            return new Locale[] { NUMBER_LOCALE, Locale.of("ja", "JP", "JP"),
                    Locale.of("th", "TH", "TH"), Locale.of("no", "NO", "NY") };
        }

        @Override
        public NumberFormat getNumberInstance(Locale locale) { return new DecimalFormat("0"); }
        @Override
        public NumberFormat getIntegerInstance(Locale locale) { return new DecimalFormat("0"); }
        @Override
        public NumberFormat getCurrencyInstance(Locale locale) { return new DecimalFormat("0"); }
        @Override
        public NumberFormat getPercentInstance(Locale locale) { return new DecimalFormat("0"); }
    }

    public static class Names extends LocaleNameProvider {
        @Override
        public Locale[] getAvailableLocales() {
            return new Locale[] { NAME_LOCALE, Locale.of("iw", "IL"),
                    Locale.forLanguageTag("he-IL-u-ca-hebrew"),
                    Locale.forLanguageTag("qac-Latn-ZZ-u-nu-thai-x-private") };
        }

        @Override
        public String getDisplayLanguage(String languageCode, Locale locale) { return "language"; }
        @Override
        public String getDisplayCountry(String countryCode, Locale locale) { return "country"; }
        @Override
        public String getDisplayVariant(String variant, Locale locale) { return "variant"; }
    }
}
