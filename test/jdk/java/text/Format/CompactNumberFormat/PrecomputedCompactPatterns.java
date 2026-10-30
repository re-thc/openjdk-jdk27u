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
 * @summary Built-in compact pattern plans preserve construction, ownership and fallback semantics
 * @modules java.base/java.text:open
 *          java.base/jdk.internal.access
 *          java.base/sun.util.locale.provider
 *          jdk.localedata
 * @run main/othervm -Djava.locale.providers=CLDR PrecomputedCompactPatterns concurrent
 * @run main/othervm -Djava.locale.providers=CLDR PrecomputedCompactPatterns
 */

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.CompactNumberFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.text.ParsePosition;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;

import jdk.internal.access.SharedSecrets;
import sun.util.locale.provider.LocaleProviderAdapter;

public class PrecomputedCompactPatterns {
    private static final List<String> TABLES = List.of("positivePrefixPatterns",
            "negativePrefixPatterns", "positiveSuffixPatterns", "negativeSuffixPatterns",
            "placeHolderPatterns");
    private static final List<Number> NUMBERS = List.of(-0.0, 0, 1, 2, -1000, 999.49,
            999.5, 1000, 1999.5, 12345, 999499, 999500, 1_000_000,
            new BigDecimal("999999.995"), Long.MIN_VALUE, Long.MAX_VALUE,
            Double.NaN, Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY);
    private static int comparisons;

    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            concurrentFirstUse();
            return;
        }
        var adapter = LocaleProviderAdapter.forType(LocaleProviderAdapter.Type.CLDR);
        var english = adapter.getLocaleResources(Locale.US).getCNPatterns(NumberFormat.Style.SHORT);
        var russian = adapter.getLocaleResources(Locale.forLanguageTag("ru"))
                .getCNPatterns(NumberFormat.Style.LONG);
        var selected = List.of(Arrays.asList(english), Arrays.asList(russian));
        Method lookup = Class.forName("java.text.BuiltInCompactPatternPlans")
                .getDeclaredMethod("lookup", String[].class);
        lookup.setAccessible(true);
        var checked = new HashSet<List<String>>();
        int hits = 0, misses = 0;
        for (Locale locale : adapter.getAvailableLocales()) {
            var resource = adapter.getLocaleResources(locale);
            for (var style : NumberFormat.Style.values()) {
                String[] patterns = resource.getCNPatterns(style);
                boolean hit = (Integer) lookup.invoke(null, (Object) patterns) >= 0;
                equal(selected.contains(Arrays.asList(patterns)), hit, "exact selected lookup " + locale + style);
                if (hit) hits++; else misses++;
                if (checked.add(List.copyOf(Arrays.asList(patterns)))) {
                    var fast = (CompactNumberFormat) NumberFormat.getCompactNumberInstance(locale, style);
                    var ordinary = new CompactNumberFormat(resource.getNumberPatterns()[0],
                            DecimalFormatSymbols.getInstance(locale), patterns, resource.getRules()[0]);
                    sameState(ordinary, fast);
                    compare(ordinary, fast, List.of(-12345, 0, 2000, 1_000_000));
                }
            }
        }
        if (hits == 0 || misses == 0) throw new AssertionError("Need selected and fallback resources");
        for (Locale locale : List.of(Locale.US, Locale.forLanguageTag("ru"), Locale.JAPAN)) {
            var style = locale.getLanguage().equals("ru") ? NumberFormat.Style.LONG : NumberFormat.Style.SHORT;
            var resource = adapter.getLocaleResources(locale);
            for (int digits : List.of(0, 2)) {
                for (var rounding : List.of(RoundingMode.HALF_EVEN, RoundingMode.UP, RoundingMode.UNNECESSARY)) {
                    var fast = (CompactNumberFormat) NumberFormat.getCompactNumberInstance(locale, style);
                    var ordinary = new CompactNumberFormat(resource.getNumberPatterns()[0],
                            DecimalFormatSymbols.getInstance(locale), resource.getCNPatterns(style), resource.getRules()[0]);
                    fast.setMaximumFractionDigits(digits);
                    ordinary.setMaximumFractionDigits(digits);
                    fast.setRoundingMode(rounding);
                    ordinary.setRoundingMode(rounding);
                    fast.setParseBigDecimal(digits != 0);
                    ordinary.setParseBigDecimal(digits != 0);
                    compare(ordinary, fast, NUMBERS);
                    compare(ordinary.clone(), fast.clone(), NUMBERS);
                    // readObject uses the ordinary parser. Compare its inherited failures too:
                    // transient digitList is not restored, so parse/clone can throw after reading.
                    CompactNumberFormat a = roundTrip(ordinary), b = roundTrip(fast);
                    sameState(a, b);
                    compare(a, b, List.of(0, 2000, Double.NaN));
                    equal(outcome(a::clone), outcome(b::clone), "deserialized clone outcome");
                }
            }
            var first = (CompactNumberFormat) NumberFormat.getCompactNumberInstance(locale, style);
            var second = (CompactNumberFormat) NumberFormat.getCompactNumberInstance(locale, style);
            owned(first, second);
        }
        customAndMutable(english);
        System.out.println("Passed " + comparisons + " compact pattern comparisons; "
                + checked.size() + " distinct arrays, hits=" + hits + " misses=" + misses);
    }

    private static void customAndMutable(String[] builtIn) throws Exception {
        for (String pattern : List.of("0'K'", "'pre-'0' post'", "0K;-0'neg'", "0'K''x'",
                "{one:0A other:0B}", "0'", "0#", "0.0", "0%")) {
            for (String rules : List.of("one:n=1", "one:a=1")) {
                String[] patterns = {"", "", "", pattern};
                equal(construction(false, patterns, rules), construction(true, patterns, rules),
                        "custom or invalid construction");
            }
        }
        equal(construction(false, null, null), construction(true, null, null), "null validation order");
        equal(construction(false, new String[] {null}, "one:a=1"),
                construction(true, new String[] {null}, "one:a=1"), "pattern before rule validation");
        String[] large = new String[33];
        Arrays.fill(large, "");
        equal(construction(false, large, ""), construction(true, large, ""), "uncatalogued length");
        for (char minus : new char[] {'-', '~', '\u2212'}) {
            var symbols = DecimalFormatSymbols.getInstance(Locale.US);
            symbols.setMinusSign(minus);
            compare(new CompactNumberFormat("0", symbols, builtIn.clone(), "one:n=1"),
                    create(symbols, builtIn.clone(), "one:n=1", true), NUMBERS);
        }
        // Real clone callbacks mutate the supplied array before compact parsing.
        for (String replacement : List.of("0Q", "0'")) {
            var ordinaryPatterns = builtIn.clone();
            var trustedPatterns = builtIn.clone();
            var ordinarySymbols = new MutableSymbols(ordinaryPatterns, replacement);
            var trustedSymbols = new MutableSymbols(trustedPatterns, replacement);
            equal(outcome(() -> create(ordinarySymbols, ordinaryPatterns, "one:n=1", false).format(2000)),
                    outcome(() -> create(trustedSymbols, trustedPatterns, "one:n=1", true).format(2000)),
                    "mutable callback outcome");
            equal(ordinarySymbols.calls, trustedSymbols.calls, "callback order");
            if (ordinarySymbols.calls.isEmpty()) throw new AssertionError("Callback fixture was not invoked");
        }
        for (boolean trusted : List.of(false, true)) {
            String[] mutable = builtIn.clone();
            var first = create(DecimalFormatSymbols.getInstance(Locale.US), mutable, "one:n=1", trusted);
            String before = first.format(2000);
            mutable[3] = "0Q";
            var second = create(DecimalFormatSymbols.getInstance(Locale.US), mutable, "one:n=1", trusted);
            equal(before, first.format(2000), "existing instance after array mutation");
            equal("2Q", second.format(2000), "next instance after array mutation");
            equal(before, create(DecimalFormatSymbols.getInstance(Locale.US), builtIn.clone(),
                    "one:n=1", trusted).format(2000), "no runtime admission or poisoning");
        }
    }

    private static Object construction(boolean trusted, String[] patterns, String rules) {
        return outcome(() -> {
            var format = create(DecimalFormatSymbols.getInstance(Locale.US), patterns, rules, trusted);
            return format.format(-2000) + ":" + parsed(format, format.format(2000));
        });
    }

    private static CompactNumberFormat create(DecimalFormatSymbols symbols, String[] patterns,
                                              String rules, boolean trusted) {
        return trusted ? SharedSecrets.getJavaTextAccess().createCompactNumberFormat("0", symbols, patterns, rules)
                : new CompactNumberFormat("0", symbols, patterns, rules);
    }

    private static class MutableSymbols extends DecimalFormatSymbols {
        final String[] patterns;
        final String replacement;
        final List<String> calls = new ArrayList<>();
        MutableSymbols(String[] patterns, String replacement) {
            super(Locale.US);
            this.patterns = patterns;
            this.replacement = replacement;
        }
        @Override public Object clone() {
            calls.add("clone");
            patterns[3] = replacement;
            return super.clone();
        }
    }

    private static void concurrentFirstUse() throws Exception {
        var adapter = LocaleProviderAdapter.forType(LocaleProviderAdapter.Type.CLDR);
        var locales = List.of(Locale.US, Locale.forLanguageTag("ru"), Locale.JAPAN);
        var expected = new ArrayList<String>();
        for (Locale locale : locales) {
            var resource = adapter.getLocaleResources(locale);
            var style = locale.getLanguage().equals("ru") ? NumberFormat.Style.LONG : NumberFormat.Style.SHORT;
            expected.add(new CompactNumberFormat(resource.getNumberPatterns()[0],
                    DecimalFormatSymbols.getInstance(locale), resource.getCNPatterns(style),
                    resource.getRules()[0]).format(-12345));
        }
        // Public construction above initializes CompactNumberFormat, not the catalogue.
        var start = new CountDownLatch(1);
        try (var executor = Executors.newFixedThreadPool(8)) {
            var tasks = new ArrayList<java.util.concurrent.Future<?>>();
            for (int thread = 0; thread < 8; thread++) {
                tasks.add(executor.submit(() -> {
                    start.await();
                    for (int n = 0; n < 24; n++) {
                        int index = n % locales.size();
                        var locale = locales.get(index);
                        var style = index == 1 ? NumberFormat.Style.LONG : NumberFormat.Style.SHORT;
                        equal(expected.get(index), NumberFormat.getCompactNumberInstance(locale, style)
                                .format(-12345), "concurrent factory");
                    }
                    return null;
                }));
            }
            start.countDown();
            for (var task : tasks) task.get();
        }
        System.out.println("Concurrent compact catalogue first use passed");
    }

    private static void owned(CompactNumberFormat first, CompactNumberFormat second) throws Exception {
        for (String name : TABLES) {
            List<?> a = (List<?>) field(first, name), b = (List<?>) field(second, name);
            if (a == b) throw new AssertionError("Shared " + name);
            for (int i = 0; i < a.size(); i++) {
                if (a.get(i) == b.get(i) || field(a.get(i), "patternsMap") == field(b.get(i), "patternsMap")) {
                    throw new AssertionError("Shared inner pattern or map");
                }
                if (field(a.get(i), "this$0") != first) {
                    throw new AssertionError("Inner wrapper captures another formatter");
                }
            }
        }
        for (String name : List.of("divisors", "rulesMap")) {
            if (field(first, name) == field(second, name)) throw new AssertionError("Shared " + name);
        }
    }

    private static void sameState(CompactNumberFormat ordinary, CompactNumberFormat fast) throws Exception {
        equal(field(ordinary, "divisors"), field(fast, "divisors"), "divisor types and values");
        equal(new ArrayList<>(((Map<?, ?>) field(ordinary, "rulesMap")).entrySet()),
                new ArrayList<>(((Map<?, ?>) field(fast, "rulesMap")).entrySet()), "plural rule order");
        for (String name : TABLES) {
            List<?> a = (List<?>) field(ordinary, name), b = (List<?>) field(fast, name);
            equal(a.size(), b.size(), "table size");
            for (int i = 0; i < a.size(); i++) {
                equal(new ArrayList<>(((Map<?, ?>) field(a.get(i), "patternsMap")).entrySet()),
                        new ArrayList<>(((Map<?, ?>) field(b.get(i), "patternsMap")).entrySet()),
                        name + " row order");
            }
        }
    }

    private static Object field(Object object, String name) throws Exception {
        Field result = object.getClass().getDeclaredField(name);
        result.setAccessible(true);
        return result.get(object);
    }

    private static void compare(CompactNumberFormat ordinary, CompactNumberFormat fast, List<Number> numbers) {
        for (Number number : numbers) {
            Object a = outcome(() -> ordinary.format(number)), b = outcome(() -> fast.format(number));
            equal(a, b, "format " + number);
            if (a instanceof String text) equal(parsed(ordinary, text), parsed(fast, text), "parse " + text);
        }
    }

    private static Object parsed(CompactNumberFormat format, String text) {
        return outcome(() -> {
            var position = new ParsePosition(0);
            Number number = format.parse(text, position);
            return Arrays.asList(number == null ? null : number.getClass(), number,
                    position.getIndex(), position.getErrorIndex());
        });
    }

    private static CompactNumberFormat roundTrip(CompactNumberFormat format) throws Exception {
        var bytes = new ByteArrayOutputStream();
        try (var output = new ObjectOutputStream(bytes)) { output.writeObject(format); }
        try (var input = new ObjectInputStream(new ByteArrayInputStream(bytes.toByteArray()))) {
            return (CompactNumberFormat) input.readObject();
        }
    }

    @FunctionalInterface private interface Action { Object run() throws Exception; }
    private record Failure(Class<?> type, String message) { }
    private static Object outcome(Action action) {
        try { return action.run(); }
        catch (Exception e) { return new Failure(e.getClass(), e.getMessage()); }
    }

    private static synchronized void equal(Object expected, Object actual, String where) {
        comparisons++;
        if (!Objects.equals(expected, actual)) {
            throw new AssertionError(where + ": expected=" + expected + " actual=" + actual);
        }
    }
}
