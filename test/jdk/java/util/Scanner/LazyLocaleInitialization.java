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
 * @summary Scanner defers CLDR numeric initialization for text and boolean scans
 * @library /test/lib
 * @run driver LazyLocaleInitialization
 */

import java.util.List;
import java.util.Scanner;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class LazyLocaleInitialization {
    private static final List<String> NUMERIC_CLASSES = List.of(
            "java/text/NumberFormat", "java/text/DecimalFormat",
            "java/text/DecimalFormatSymbols");
    private static final List<String> CLDR_CLASSES = List.of(
            "sun/util/cldr/CLDRLocaleProviderAdapter",
            "sun/util/locale/provider/LocaleResources");

    public static void main(String[] args) throws Exception {
        check("text", "CLDR", false);
        check("boolean", "CLDR", false);
        check("integer", "CLDR", true);
        check("debug", "CLDR", true);
        // HOST must stay eager even when it falls back to CLDR on this OS.
        check("text", "HOST,CLDR", true);
    }

    private static void check(String mode, String providers, boolean initialized)
            throws Exception {
        // Disable CDS so archived state cannot hide class initialization events.
        OutputAnalyzer output = ProcessTools.executeTestJava(
                "-Xshare:off", "-Xlog:class+init=info:stdout",
                "-Djava.locale.providers=" + providers,
                "-Duser.language=en", "-Duser.country=US",
                Probe.class.getName(), mode);
        output.shouldHaveExitValue(0).stdoutShouldContain("Completed " + mode);
        for (String name : NUMERIC_CLASSES) {
            checkClass(output, name, initialized);
        }
        if (providers.equals("CLDR")) {
            for (String name : CLDR_CLASSES) {
                checkClass(output, name, initialized);
            }
        }
    }

    private static void checkClass(OutputAnalyzer output, String name, boolean initialized) {
        String event = "Initializing '" + name + "'";
        if (initialized) {
            output.stdoutShouldContain(event);
        } else {
            output.stdoutShouldNotContain(event);
        }
    }

    public static class Probe {
        public static void main(String[] args) {
            switch (args[0]) {
                case "text" -> {
                    try (Scanner scanner = new Scanner("alpha\nbeta\n")) {
                        require(scanner.nextLine().equals("alpha"));
                        require(scanner.nextLine().equals("beta"));
                    }
                    try (Scanner scanner = new Scanner("alpha beta")) {
                        require(scanner.next().equals("alpha"));
                        require(scanner.next().equals("beta"));
                    }
                    try (Scanner scanner = new Scanner("alpha beta")) {
                        require(scanner.tokens().toList().equals(List.of("alpha", "beta")));
                    }
                }
                case "boolean" -> {
                    try (Scanner scanner = new Scanner("TrUe false")) {
                        require(scanner.hasNextBoolean());
                        require(scanner.nextBoolean());
                        require(scanner.hasNextBoolean());
                        require(!scanner.nextBoolean());
                    }
                }
                case "integer" -> {
                    try (Scanner scanner = new Scanner("1,234")) {
                        require(scanner.nextInt() == 1234);
                    }
                }
                case "debug" -> {
                    try (Scanner scanner = new Scanner("alpha")) {
                        require(scanner.toString().contains("[group separator="));
                    }
                }
                default -> throw new AssertionError("Unexpected mode: " + args[0]);
            }
            System.out.println("Completed " + args[0]);
        }

        private static void require(boolean condition) {
            if (!condition) {
                throw new AssertionError("Unexpected scanner result");
            }
        }
    }
}
