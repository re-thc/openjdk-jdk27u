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
 * @summary Target CLDR compact pattern plans are reproducible and match ordinary parsing
 * @modules java.base/java.text:open jdk.compiler java.xml
 * @compile -sourcepath ${test.root}/../../make/jdk/src/classes
 *          ${test.root}/../../make/jdk/src/classes/build/tools/cldrconverter/CLDRConverter.java
 *          CompactPatternPlansGeneratorTest.java
 * @run main/othervm/timeout=120 -ea -esa build.tools.cldrconverter.CompactPatternPlansGeneratorTest
 */

package build.tools.cldrconverter;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.URLClassLoader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.text.CompactNumberFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import javax.tools.ToolProvider;

public class CompactPatternPlansGeneratorTest {
    private static final List<String> FIELDS = List.of("positivePrefixPatterns",
            "negativePrefixPatterns", "positiveSuffixPatterns", "negativeSuffixPatterns",
            "placeHolderPatterns");

    public static void main(String[] args) throws Exception {
        if (!PluralsParseHandler.class.desiredAssertionStatus()) {
            throw new AssertionError("Plural handler assertions must be enabled");
        }
        Path repository = Path.of(System.getProperty("test.root"), "..", "..").normalize();
        Path first = Files.createTempDirectory(Path.of("."), "compact-plans-first");
        Path second = Files.createTempDirectory(Path.of("."), "compact-plans-second");
        Path properties = Path.of(System.getProperty("test.classes"),
                "build/tools/cldrconverter/OtherCommonLocales.properties");
        Files.createDirectories(properties.getParent());
        Files.copy(repository.resolve("make/jdk/src/classes/build/tools/cldrconverter/OtherCommonLocales.properties"),
                properties, java.nio.file.StandardCopyOption.REPLACE_EXISTING);
        // Exercise production selection and inheritance using target data, not boot locales.
        CLDRConverter.main(new String[] {"-base", repository.resolve("make/data/cldr/common").toString(),
                "-baselocales", "en-US", "-basemodule", "-year", "2026", "-o", first.toString(),
                "-zntempfile", repository.resolve("src/java.base/share/classes/java/time/format/ZoneName.java.template").toString(),
                "-tzdatadir", repository.resolve("src/java.base/share/data/tzdata").toString()});
        Field inputsField = CLDRConverter.class.getDeclaredField("compactPatternPlans");
        inputsField.setAccessible(true);
        @SuppressWarnings("unchecked")
        var all = (List<CompactPatternPlansGenerator.Input>) inputsField.get(null);
        var selected = new ArrayList<>(all.stream().filter(i ->
                i.locale().equals("en") && i.width().equals("short.CompactNumberPatterns")
                || i.locale().equals("ru") && i.width().equals("long.CompactNumberPatterns")).toList());
        equal(2, selected.size(), "selected target inputs");
        Collections.reverse(selected);
        selected.add(selected.getFirst());
        CompactPatternPlansGenerator.generate(second, selected);
        Path relative = Path.of("java/text/BuiltInCompactPatternPlans.java");
        equal(-1L, Files.mismatch(first.resolve(relative), second.resolve(relative)),
                "generation order and duplicate independence");

        Path source = second.resolve("generated/BuiltInCompactPatternPlans.java");
        Files.createDirectories(source.getParent());
        Files.writeString(source, Files.readString(second.resolve(relative))
                .replace("package java.text;", "package generated;"));
        equal(0, ToolProvider.getSystemJavaCompiler().run(null, null, null,
                "-d", second.toString(), source.toString()), "generated compilation");
        try (var loader = new URLClassLoader(new java.net.URL[] {second.toUri().toURL()})) {
            Class<?> type = loader.loadClass("generated.BuiltInCompactPatternPlans");
            Method lookup = method(type, "lookup", String[].class);
            Method size = method(type, "size", int.class);
            Method element = method(type, "element", int.class, int.class);
            Method divisor = method(type, "divisor", int.class);
            Method count = method(type, "count", int.class);
            Method value = method(type, "value", int.class, int.class, int.class);
            int comparisons = 0;
            for (var input : selected.subList(0, 2)) {
                String[] patterns = input.patterns();
                int plan = (Integer) lookup.invoke(null, (Object) patterns.clone());
                if (plan < 0) throw new AssertionError("Missing " + input.locale() + " " + input.width());
                equal(patterns.length, size.invoke(null, plan), "plan length");
                var ordinary = new CompactNumberFormat("#,##0.###",
                        DecimalFormatSymbols.getInstance(Locale.US), patterns, "one:n=1");
                for (int index = 0; index < patterns.length; index++) {
                    int entry = (Integer) element.invoke(null, plan, index);
                    Number expectedDivisor = ((List<Number>) field(ordinary, "divisors")).get(index);
                    Number actualDivisor = (Number) divisor.invoke(null, entry);
                    equal(expectedDivisor, actualDivisor, "divisor value and type");
                    var keys = new ArrayList<>(patterns(ordinary, FIELDS.getFirst(), index).keySet());
                    equal(keys.size(), count.invoke(null, entry), "row count");
                    for (int row = 0; row < keys.size(); row++) {
                        String key = keys.get(row);
                        equal(key, value.invoke(null, entry, row, 0), "category order");
                        for (int column = 0; column < FIELDS.size(); column++) {
                            equal(patterns(ordinary, FIELDS.get(column), index).get(key),
                                    value.invoke(null, entry, row, column + 1), "unexpanded pattern");
                            comparisons++;
                        }
                    }
                }
                // Equal array hashes must still compare every string. Empty and NUL hash to zero.
                String[] collision = patterns.clone();
                equal("", collision[0], "leading empty pattern");
                collision[0] = "\0";
                equal(Arrays.hashCode(patterns), Arrays.hashCode(collision), "collision fixture");
                equal(-1, lookup.invoke(null, (Object) collision), "hash collision fallback");
                String[] unknown = patterns.clone();
                unknown[3] += "Q";
                equal(-1, lookup.invoke(null, (Object) unknown), "unknown pattern fallback");
            }
            System.out.println("Passed " + comparisons + " target table comparisons");
        }
    }

    private static Method method(Class<?> type, String name, Class<?>... parameters) throws Exception {
        Method result = type.getDeclaredMethod(name, parameters);
        result.setAccessible(true);
        return result;
    }

    private static Object field(Object object, String name) throws Exception {
        Field result = object.getClass().getDeclaredField(name);
        result.setAccessible(true);
        return result.get(object);
    }

    @SuppressWarnings("unchecked")
    private static Map<String, String> patterns(CompactNumberFormat format, String name, int index)
            throws Exception {
        return (Map<String, String>) field(((List<?>) field(format, name)).get(index), "patternsMap");
    }

    private static void equal(Object expected, Object actual, String where) {
        if (!Objects.equals(expected, actual)) {
            throw new AssertionError(where + ": expected=" + expected + " actual=" + actual);
        }
    }
}
