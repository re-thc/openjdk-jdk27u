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
 * @summary Compare generated CLDR plural predicates with the retained interpreter
 * @modules java.base/java.text:open
 *          java.base/sun.util.locale.provider
 *          jdk.localedata
 *          java.xml
 * @run main/othervm -Djava.locale.providers=CLDR PrecomputedPluralRules
 */

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.nio.file.Path;
import java.text.CompactNumberFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.text.ParsePosition;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.Random;
import java.util.TreeSet;
import javax.xml.parsers.DocumentBuilderFactory;

import sun.util.locale.provider.LocaleProviderAdapter;

public class PrecomputedPluralRules {
    private static final Method GENERATED;
    private static final Method MATCH;
    private static final Method RELATION;
    private static final Method CATEGORY;
    private static final Field RULES;
    private static long comparisons;
    private static final String[] PATTERNS = {
        "{zero:0Z one:0O two:0T few:0F many:0M other:0X}", "00X", "000X",
        "{zero:0Z one:0O two:0T few:0F many:0M other:0X}", "00X", "000X"
    };

    static {
        try {
            GENERATED = Class.forName("java.text.CompactPluralRules")
                    .getDeclaredMethod("match", String.class, double.class);
            MATCH = CompactNumberFormat.class.getDeclaredMethod(
                    "matchPluralRule", String.class, double.class);
            RELATION = CompactNumberFormat.class.getDeclaredMethod(
                    "relationCheck", String.class, double.class);
            CATEGORY = CompactNumberFormat.class.getDeclaredMethod("getPluralCategory", double.class);
            RULES = CompactNumberFormat.class.getDeclaredField("rulesMap");
            for (var m : List.of(GENERATED, MATCH, RELATION, CATEGORY)) {
                m.setAccessible(true);
            }
            RULES.setAccessible(true);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    public static void main(String[] args) throws Exception {
        var conditions = new TreeSet<String>();
        var ruleSets = new HashSet<String>();
        var adapter = LocaleProviderAdapter.forType(LocaleProviderAdapter.Type.CLDR);
        Locale[] locales = adapter.getAvailableLocales();
        for (Locale locale : locales) {
            String rules = adapter.getLocaleResources(locale).getRules()[0];
            for (String rule : rules.split(";")) {
                String condition = rule.trim().replaceFirst("[^:]+:", "");
                conditions.add(condition);
            }
            for (var style : NumberFormat.Style.values()) {
                var format = (CompactNumberFormat) NumberFormat.getCompactNumberInstance(locale, style);
                compareFormats(format, basicNumbers());
                if (ruleSets.add(style + rules)) {
                    compareCategories(format);
                    for (RoundingMode mode : RoundingMode.values()) {
                        format.setRoundingMode(mode);
                        format.setMaximumFractionDigits(2);
                        compareFormats(format, boundaryNumbers());
                    }
                    format.setRoundingMode(RoundingMode.HALF_EVEN);
                    format.setParseBigDecimal(true);
                    format.setParseIntegerOnly(true);
                    format.setStrict(true);
                    compareFormats(format, boundaryNumbers());
                    compareFormats(format.clone(), boundaryNumbers());
                    compareSerialized(format, boundaryNumbers());
                }
            }
        }
        // Also test target rules for languages not exposed by available locales.
        var factory = DocumentBuilderFactory.newInstance();
        factory.setFeature("http://apache.org/xml/features/nonvalidating/load-external-dtd", false);
        Path plurals = Path.of(System.getProperty("test.root"), "..", "..",
                "make/data/cldr/common/supplemental/plurals.xml");
        var document = factory.newDocumentBuilder().parse(plurals.toFile());
        var nodes = document.getElementsByTagName("pluralRule");
        for (int i = 0; i < nodes.getLength(); i++) {
            var node = nodes.item(i);
            if (!node.getAttributes().getNamedItem("count").getNodeValue().equals("other")) {
                conditions.add(("one:" + node.getTextContent().replaceFirst("@.*", ""))
                        .trim().replaceFirst("[^:]+:", ""));
            }
        }
        List<Double> numbers = predicateNumbers();
        for (String condition : conditions) {
            for (double input : numbers) {
                Object generated = GENERATED.invoke(null, condition, input);
                if (generated == null) {
                    throw new AssertionError("Built-in condition missed: " + condition);
                }
                equal(interpreted(condition, input), generated, condition + ": " + Double.toHexString(input));
                equal(generated, MATCH.invoke(null, condition, input), "dispatch");
            }
        }
        customRules(numbers);
        System.out.printf("Passed %,d comparisons; %d locales, %d rule/style sets, %d conditions%n",
                comparisons, locales.length, ruleSets.size(), conditions.size());
    }

    // Calls the unchanged runtime relation interpreter as an independent oracle.
    private static boolean interpreted(String condition, double input) throws Exception {
        for (String and : condition.split("or")) {
            boolean result = true;
            for (String relation : and.split("and")) {
                if (!(Boolean) RELATION.invoke(null, relation, input)) {
                    result = false;
                    break;
                }
            }
            if (result) {
                return true;
            }
        }
        return false;
    }

    @SuppressWarnings("unchecked")
    private static Map<String, String> rules(CompactNumberFormat format) throws Exception {
        return (Map<String, String>) RULES.get(format);
    }

    private static void compareCategories(CompactNumberFormat format) throws Exception {
        Map<String, String> rules = rules(format);
        for (double input : predicateNumbers()) {
            String expected = "other";
            if (rules != null) {
                // Preserve the actual entrySet order, including overlapping rules.
                for (var entry : rules.entrySet()) {
                    if (interpreted(entry.getValue(), input)) {
                        expected = entry.getKey();
                        break;
                    }
                }
            }
            equal(expected, CATEGORY.invoke(format, input), "category " + input + ": " + rules);
        }
    }

    private static void compareFormats(CompactNumberFormat fast, List<Number> numbers) throws Exception {
        compareFormats(fast, independent(fast), numbers);
    }

    private static Object field(CompactNumberFormat format, String name) throws Exception {
        Field field = CompactNumberFormat.class.getDeclaredField(name);
        field.setAccessible(true);
        return field.get(format);
    }

    private static CompactNumberFormat independent(CompactNumberFormat original) throws Exception {
        // clone() shares inner Patterns objects that refer to their original outer
        // formatter. Build a separate instance so its Patterns use the fallback map.
        var result = new CompactNumberFormat((String) field(original, "decimalPattern"),
                (DecimalFormatSymbols) field(original, "symbols"),
                (String[]) field(original, "compactPatterns"),
                (String) field(original, "pluralRules"));
        result.setMaximumIntegerDigits(original.getMaximumIntegerDigits());
        result.setMinimumIntegerDigits(original.getMinimumIntegerDigits());
        result.setMaximumFractionDigits(original.getMaximumFractionDigits());
        result.setMinimumFractionDigits(original.getMinimumFractionDigits());
        result.setRoundingMode(original.getRoundingMode());
        result.setGroupingSize(original.getGroupingSize());
        result.setGroupingUsed(original.isGroupingUsed());
        result.setParseIntegerOnly(original.isParseIntegerOnly());
        result.setStrict(original.isStrict());
        result.setParseBigDecimal(original.isParseBigDecimal());
        return result;
    }

    private static void compareSerialized(CompactNumberFormat format, List<Number> numbers) throws Exception {
        compareFormats(roundTrip(format), roundTrip(format), numbers);
    }

    private static void compareFormats(CompactNumberFormat fast, CompactNumberFormat fallback,
                                       List<Number> numbers) throws Exception {
        Map<String, String> original = rules(fast);
        if (original != null) {
            var slow = new LinkedHashMap<String, String>();
            for (var entry : original.entrySet()) {
                // Trailing whitespace changes exact lookup, preserving parser semantics.
                String condition = entry.getValue() + " ";
                equal(null, GENERATED.invoke(null, condition, 1.0), "force fallback");
                slow.put(entry.getKey(), condition);
            }
            RULES.set(fallback, slow);
        }
        for (Number number : numbers) {
            Object expected = formatted(fallback, number);
            Object actual = formatted(fast, number);
            equal(expected, actual, "format " + number + ": " + original);
            if (actual instanceof String text) {
                equal(parsed(fallback, text), parsed(fast, text), "parse " + text);
            }
        }
    }

    private static Object formatted(CompactNumberFormat format, Number number) {
        try {
            return format.format(number);
        } catch (RuntimeException e) {
            return new Failure(e.getClass());
        }
    }

    private record Failure(Class<?> type) {}

    private static Object parsed(CompactNumberFormat format, String text) {
        var position = new ParsePosition(0);
        try {
            Number number = format.parse(text, position);
            return Arrays.asList(number, position.getIndex(), position.getErrorIndex());
        } catch (RuntimeException e) {
            return new Failure(e.getClass());
        }
    }

    private static CompactNumberFormat roundTrip(CompactNumberFormat format) throws Exception {
        var bytes = new ByteArrayOutputStream();
        try (var out = new ObjectOutputStream(bytes)) {
            out.writeObject(format);
        }
        try (var in = new ObjectInputStream(new ByteArrayInputStream(bytes.toByteArray()))) {
            return (CompactNumberFormat) in.readObject();
        }
    }

    private static void customRules(List<Double> numbers) throws Exception {
        List<String> custom = List.of(
                "n / 2 = 1", "n % 2% 3 = 1", "i / 2% 3/ 4 = 1",
                "f % 0 != 0", "t / 0 = 0", "v = 0", "w != 0", "e / 2 = 0",
                "n % 0 != 0", "n / 0 = 0", "n = " + "9".repeat(310),
                "n  =  1", "n = 2,4..6 or i != 0 and f / 0 != 0");
        for (String condition : custom) {
            equal(null, GENERATED.invoke(null, condition, 1.0), "custom miss " + condition);
            for (double input : numbers) {
                equal(interpreted(condition, input), MATCH.invoke(null, condition, input),
                        "fallback " + condition + ": " + input);
            }
            var format = custom("one:" + condition);
            compareCategories(format);
            compareFormats(format, boundaryNumbers());
            compareSerialized(format, boundaryNumbers());
        }
        // Exact built-in text in a public constructor may use the generated path.
        var overlap = custom("many:n = 1;zero:n = 1;few:n = 1;two:n = 1;one:n = 1");
        compareCategories(overlap);
        compareFormats(overlap, boundaryNumbers());
        compareSerialized(overlap, boundaryNumbers());
        for (String invalid : List.of("one:a = 1", "on:n = 1", "one:n = 1...2",
                "one:n = 1.2", "one:n = 1..2,", "one:n = 1;one:n = 2", "foo:n = 1",
                "one:n = 1 andor v = 0", "x".repeat(2049))) {
            try {
                custom(invalid);
                throw new AssertionError("Accepted invalid rule: " + invalid);
            } catch (IllegalArgumentException expected) {
                comparisons++;
            }
        }
        for (String rules : List.of("", "other:")) {
            compareFormats(custom(rules), boundaryNumbers());
        }
        try {
            custom(null);
            throw new AssertionError("Accepted null rules");
        } catch (NullPointerException expected) {
            comparisons++;
        }
    }

    private static CompactNumberFormat custom(String rules) {
        return new CompactNumberFormat("#,##0.###", DecimalFormatSymbols.getInstance(Locale.US),
                PATTERNS, rules);
    }

    private static List<Number> basicNumbers() {
        return List.of(-0.0, 0, 1, 2, 11, 999, 1000, 2000, 11000, 999999, 1000000,
                -1234567, Long.MIN_VALUE, Long.MAX_VALUE, Double.NaN,
                Double.NEGATIVE_INFINITY, Double.POSITIVE_INFINITY);
    }

    private static List<Number> boundaryNumbers() {
        var result = new ArrayList<Number>(basicNumbers());
        for (double value : new double[] {0.5, 1.005, 999.5, 999.995, 1000.5, 1999.5,
                999499, 999500, 999999.5, 1000000.5}) {
            result.add(Math.nextDown(value));
            result.add(value);
            result.add(Math.nextUp(value));
            result.add(-value);
        }
        result.add(new BigDecimal("999999.995"));
        result.add(new BigDecimal("1000.005"));
        result.add(new BigInteger("1234567890123456789012345678901234567890"));
        return result;
    }

    private static List<Double> predicateNumbers() {
        var result = new ArrayList<Double>();
        result.addAll(List.of(-0.0, 0.0, Double.NaN, Double.POSITIVE_INFINITY,
                Double.NEGATIVE_INFINITY, Double.MIN_VALUE, -Double.MIN_VALUE,
                Double.MAX_VALUE, -Double.MAX_VALUE));
        for (int i = -5; i <= 210; i++) {
            result.add((double) i);
            result.add(i + 0.5);
        }
        for (double boundary : new double[] {0, 1, 2, 5, 10, 11, 20, 100, 1000,
                100000, 1000000, 1000001, 1L << 53}) {
            for (double value : new double[] {Math.nextDown(boundary), boundary, Math.nextUp(boundary)}) {
                result.add(value);
                result.add(-value);
            }
        }
        var random = new Random(0xC1D2);
        for (int i = 0; i < 100; i++) {
            result.add(Double.longBitsToDouble(random.nextLong()));
        }
        return result;
    }

    private static void equal(Object expected, Object actual, String context) {
        comparisons++;
        if (!Objects.equals(expected, actual)) {
            throw new AssertionError(context + ": expected=" + expected + ", actual=" + actual);
        }
    }
}
