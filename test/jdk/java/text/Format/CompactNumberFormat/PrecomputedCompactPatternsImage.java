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
 * @summary Compact syntax plans initialize only on the trusted path and work in restricted images
 * @requires (vm.compMode != "Xcomp" & os.maxMemory >= 2g)
 * @library /test/lib
 * @modules jdk.jlink java.base/sun.util.locale.provider
 * @run driver/timeout=180 PrecomputedCompactPatternsImage
 */

import java.io.PrintWriter;
import java.nio.file.Path;
import java.text.CompactNumberFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Objects;
import java.util.spi.ToolProvider;

import jdk.test.lib.JDKToolFinder;
import jdk.test.lib.process.ProcessTools;
import sun.util.locale.provider.LocaleProviderAdapter;

public class PrecomputedCompactPatternsImage {
    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            if (args[0].equals("public")) {
                checkPublicConstructors();
            } else {
                checkImage(args[0].equals("filtered"));
            }
            return;
        }
        ProcessTools.executeProcess(ProcessTools.createTestJavaProcessBuilder(
                "-Xlog:class+init=info", "--add-exports",
                "java.base/sun.util.locale.provider=ALL-UNNAMED", "-Djava.locale.providers=CLDR",
                "-cp", System.getProperty("test.class.path"),
                PrecomputedCompactPatternsImage.class.getName(), "public"))
                .shouldHaveExitValue(0).shouldContain("Public compact constructors passed")
                .shouldNotContain("BuiltInCompactPatternPlans");
        var jlink = ToolProvider.findFirst("jlink").orElseThrow();
        for (boolean filtered : List.of(false, true)) {
            Path image = Path.of(filtered ? "compact-plans-filtered" : "compact-plans-base").toAbsolutePath();
            var command = new ArrayList<>(List.of("--module-path",
                    Path.of(System.getProperty("test.jdk"), "jmods").toString(),
                    "--add-modules", filtered ? "java.base,jdk.localedata" : "java.base"));
            if (filtered) command.addAll(List.of("--include-locales=en,ru"));
            command.addAll(List.of("--output", image.toString()));
            if (jlink.run(new PrintWriter(System.out, true), new PrintWriter(System.err, true),
                    command.toArray(String[]::new)) != 0) {
                throw new AssertionError("jlink failed: " + command);
            }
            String java = image.resolve("bin").resolve(
                    Path.of(JDKToolFinder.getJDKTool("java")).getFileName()).toString();
            ProcessTools.executeProcess(new ProcessBuilder(java,
                    "--add-exports", "java.base/sun.util.locale.provider=ALL-UNNAMED",
                    "--add-opens", "java.base/java.text=ALL-UNNAMED",
                    "-Djava.locale.providers=CLDR", "-cp", System.getProperty("test.class.path"),
                    PrecomputedCompactPatternsImage.class.getName(), filtered ? "filtered" : "base"))
                    .shouldHaveExitValue(0).shouldContain("Compact pattern image passed");
        }
    }

    private static void checkPublicConstructors() {
        var resource = LocaleProviderAdapter.forType(LocaleProviderAdapter.Type.CLDR)
                .getLocaleResources(Locale.US);
        for (String[] patterns : List.of(resource.getCNPatterns(NumberFormat.Style.SHORT),
                new String[] {"", "", "", "0Q"})) {
            var format = new CompactNumberFormat("0", DecimalFormatSymbols.getInstance(Locale.US),
                    patterns, "one:n=1");
            if (format.format(2000).isEmpty()) throw new AssertionError("Empty public format");
        }
        System.out.println("Public compact constructors passed");
    }

    private static void checkImage(boolean filtered) throws Exception {
        if (ModuleLayer.boot().findModule("jdk.localedata").isPresent() != filtered) {
            throw new AssertionError("Unexpected locale module");
        }
        // Exercise the SharedSecrets initialization gate before reflection or public construction.
        if (NumberFormat.getCompactNumberInstance(Locale.US, NumberFormat.Style.SHORT)
                .format(2000).isEmpty()) {
            throw new AssertionError("Empty first provider format");
        }
        var lookup = Class.forName("java.text.BuiltInCompactPatternPlans")
                .getDeclaredMethod("lookup", String[].class);
        lookup.setAccessible(true);
        var adapter = LocaleProviderAdapter.forType(LocaleProviderAdapter.Type.CLDR);
        for (Locale locale : filtered ? List.of(Locale.US, Locale.forLanguageTag("ru")) : List.of(Locale.US)) {
            var resource = adapter.getLocaleResources(locale);
            for (var style : NumberFormat.Style.values()) {
                String[] patterns = resource.getCNPatterns(style);
                if ((locale.equals(Locale.US) && style == NumberFormat.Style.SHORT
                        || locale.getLanguage().equals("ru") && style == NumberFormat.Style.LONG)
                        && (Integer) lookup.invoke(null, (Object) patterns) < 0) {
                    throw new AssertionError("Missing selected plan: " + locale + style);
                }
                var ordinary = new CompactNumberFormat(resource.getNumberPatterns()[0],
                        DecimalFormatSymbols.getInstance(locale), patterns, resource.getRules()[0]);
                var fast = NumberFormat.getCompactNumberInstance(locale, style);
                for (long number : new long[] {-12345, 1000, 2000, 1_000_000}) {
                    String text = fast.format(number);
                    if (!ordinary.format(number).equals(text)
                            || !Objects.equals(ordinary.parse(text), fast.parse(text))) {
                        throw new AssertionError(locale + " " + style + " " + number + ": " + text);
                    }
                }
            }
        }
        if (filtered && java.util.Arrays.stream(NumberFormat.getAvailableLocales())
                .anyMatch(locale -> locale.getLanguage().equals("ja"))) {
            throw new AssertionError("Locale filter was not applied");
        }
        checkPublicConstructors();
        System.out.println("Compact pattern image passed " + (filtered ? "filtered" : "base"));
    }
}
