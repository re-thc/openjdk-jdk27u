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
 * @summary Generated plural rules work in java.base-only and locale-filtered images
 * @requires (vm.compMode != "Xcomp" & os.maxMemory >= 2g)
 * @library /test/lib
 * @modules jdk.jlink
 * @build PrecomputedPluralRulesImage
 * @run driver/timeout=180 PrecomputedPluralRulesImage
 */

import java.io.PrintWriter;
import java.nio.file.Path;
import java.text.CompactNumberFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.spi.ToolProvider;

import jdk.test.lib.JDKToolFinder;
import jdk.test.lib.process.ProcessTools;

public class PrecomputedPluralRulesImage {
    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            check(args);
            return;
        }
        var jlink = ToolProvider.findFirst("jlink").orElseThrow();
        for (boolean filtered : List.of(false, true)) {
            Path image = Path.of(filtered ? "plural-filtered-image" : "plural-base-image").toAbsolutePath();
            String[] options = filtered
                    ? new String[] {"--add-modules", "java.base,jdk.localedata", "--include-locales=en,ru,ar"}
                    : new String[] {"--add-modules", "java.base"};
            var command = new java.util.ArrayList<>(Arrays.asList(options));
            command.addAll(List.of("--output", image.toString()));
            if (jlink.run(new PrintWriter(System.out, true), new PrintWriter(System.err, true),
                    command.toArray(String[]::new)) != 0) {
                throw new AssertionError("jlink failed: " + command);
            }
            String java = image.resolve("bin").resolve(
                    Path.of(JDKToolFinder.getJDKTool("java")).getFileName()).toString();
            ProcessTools.executeProcess(new ProcessBuilder(java, "-Djava.locale.providers=CLDR",
                    "-cp", System.getProperty("test.class.path"),
                    PrecomputedPluralRulesImage.class.getName(), filtered ? "filtered" : "base"))
                    .shouldHaveExitValue(0).shouldContain("Plural image passed");
        }
    }

    private static void check(String[] args) throws Exception {
        boolean filtered = args[0].equals("filtered");
        if (ModuleLayer.boot().findModule("jdk.localedata").isPresent() != filtered) {
            throw new AssertionError("Unexpected locale module");
        }
        List<Locale> locales = filtered
                ? List.of(Locale.US, Locale.forLanguageTag("ru"), Locale.forLanguageTag("ar"))
                : List.of(Locale.US);
        for (Locale locale : locales) {
            for (NumberFormat.Style style : NumberFormat.Style.values()) {
                var format = NumberFormat.getCompactNumberInstance(locale, style);
                String result = format.format(2000);
                if (format.parse(result).longValue() != 2000) {
                    throw new AssertionError(locale + ": " + result);
                }
            }
        }
        if (filtered && Arrays.stream(NumberFormat.getAvailableLocales())
                .anyMatch(l -> l.getLanguage().equals("ja"))) {
            throw new AssertionError("Locale filter did not apply");
        }
        // A base-only image must also handle built-in-exact and unknown custom text.
        for (String rule : List.of("one:n = 1", "one:n / 2 = 1")) {
            var custom = new CompactNumberFormat("0", DecimalFormatSymbols.getInstance(Locale.US),
                    new String[] {"{one:0A other:0B}"}, rule);
            String expected = rule.contains("/") ? "2A" : "2B";
            if (!expected.equals(custom.format(2))) {
                throw new AssertionError(rule + ": " + custom.format(2));
            }
        }
        System.out.println("Plural image passed " + args[0]);
    }
}
