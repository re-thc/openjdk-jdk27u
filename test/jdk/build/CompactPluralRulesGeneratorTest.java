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
 * @summary Plural source generation is reproducible and preserves interpreter semantics
 * @modules java.base/java.text:open jdk.compiler java.xml
 * @compile ${test.root}/../../make/jdk/src/classes/build/tools/cldrconverter/CopyrightHeaders.java
 *          ${test.root}/../../make/jdk/src/classes/build/tools/cldrconverter/CompactPluralRulesGenerator.java
 * @run main build.tools.cldrconverter.CompactPluralRulesGeneratorTest
 */

package build.tools.cldrconverter;

import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Path;
import java.net.URLClassLoader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.tools.ToolProvider;

public class CompactPluralRulesGeneratorTest {
    public static void main(String[] args) throws Exception {
        var conditions = new ArrayList<String>();
        for (String op : List.of("n", "i", "f", "t", "v", "w", "e")) {
            for (String divisor : List.of("", " % 0", " / 0", " % 3", " / 4", " / 2% 3/ 4", " / 2 % 3 / 4")) {
                for (String relation : List.of(" = ", " != ")) {
                    conditions.add(op + divisor + relation + "0,1..3,5");
                }
            }
        }
        conditions.addAll(List.of("n=1andv=0orn=2", "n = " + "9".repeat(310),
                "n / " + "9".repeat(310) + " != 1", "\tn = 1", "n = 1\tand v = 0",
                "n = 1\nand v = 0", "n = 1\rand v = 0", "n = 1\fand v = 0",
                "\"\\n = 1", "and", "or", ""));
        // Read the target repository, never the test/boot JDK's CLDR bundles.
        Path plurals = Path.of(System.getProperty("test.root"), "..", "..",
                "make/data/cldr/common/supplemental/plurals.xml");
        var factory = DocumentBuilderFactory.newInstance();
        factory.setFeature("http://apache.org/xml/features/nonvalidating/load-external-dtd", false);
        var document = factory.newDocumentBuilder().parse(plurals.toFile());
        var nodes = document.getElementsByTagName("pluralRule");
        var target = new java.util.TreeSet<String>();
        for (int i = 0; i < nodes.getLength(); i++) {
            var node = nodes.item(i);
            if (!node.getAttributes().getNamedItem("count").getNodeValue().equals("other")) {
                target.add(("one:" + node.getTextContent().replaceFirst("@.*", ""))
                        .trim().replaceFirst("[^:]+:", ""));
            }
        }
        conditions.addAll(target);
        var rules = new ArrayList<String>();
        conditions.forEach(c -> rules.add("one:" + c));
        Path first = Files.createTempDirectory(Path.of("."), "plural-first");
        Path second = Files.createTempDirectory(Path.of("."), "plural-second");
        CompactPluralRulesGenerator.generate(first, rules);
        Collections.reverse(rules);
        rules.add(rules.getFirst());
        CompactPluralRulesGenerator.generate(second, rules);
        Path relative = Path.of("java/text/CompactPluralRules.java");
        if (Files.mismatch(first.resolve(relative), second.resolve(relative)) != -1) {
            throw new AssertionError("Generation depends on input order or duplicates");
        }
        // Compile in a test package so no bootstrap module patch is needed.
        String source = Files.readString(first.resolve(relative))
                .replace("package java.text;", "package generated;");
        Path file = first.resolve("generated/CompactPluralRules.java");
        Files.createDirectories(file.getParent());
        Files.writeString(file, source);
        var compiler = ToolProvider.getSystemJavaCompiler();
        if (compiler.run(null, null, null, "-d", first.toString(), file.toString()) != 0) {
            throw new AssertionError("Generated source does not compile");
        }
        Method relation = Class.forName("java.text.CompactNumberFormat")
                .getDeclaredMethod("relationCheck", String.class, double.class);
        relation.setAccessible(true);
        try (var loader = new URLClassLoader(new java.net.URL[] {first.toUri().toURL()})) {
            Method match = loader.loadClass("generated.CompactPluralRules")
                    .getDeclaredMethod("match", String.class, double.class);
            match.setAccessible(true);
            var numbers = new ArrayList<Double>(List.of(Double.NaN, -0.0, 0.0,
                    Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY, Double.MAX_VALUE,
                    Double.MIN_VALUE, -Double.MIN_VALUE, -7.0, -1.0, 0.5, 1.0, 2.0, 3.0, 4.0));
            var random = new Random(7124);
            for (int i = 0; i < 100; i++) {
                numbers.add(Double.longBitsToDouble(random.nextLong()));
            }
            int checks = 0;
            for (String condition : conditions) {
                // Generation mirrors trim() on the whole category:condition rule.
                condition = ("one:" + condition).trim().replaceFirst("[^:]+:", "");
                for (double input : numbers) {
                    boolean expected = false;
                    for (String and : condition.split("or")) {
                        boolean all = true;
                        for (String r : and.split("and")) {
                            if (!(Boolean) relation.invoke(null, r, input)) {
                                all = false;
                                break;
                            }
                        }
                        if (all) {
                            expected = true;
                            break;
                        }
                    }
                    Object actual = match.invoke(null, condition, input);
                    if (!Boolean.valueOf(expected).equals(actual)) {
                        throw new AssertionError(condition + ": " + Double.toHexString(input)
                                + " expected=" + expected + " actual=" + actual);
                    }
                    checks++;
                }
            }
            if (match.invoke(null, "n = 123456789", 1.0) != null) {
                throw new AssertionError("Unknown text must use runtime fallback");
            }
            System.out.println("Passed " + checks + " generated predicate comparisons; "
                    + target.size() + " target CLDR conditions");
        }
    }
}
