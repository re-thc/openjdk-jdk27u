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
 *
 */

/*
 * @test
 * @summary Regex leaf entries support small code caches and compiler verification
 * @library /test/lib
 * @modules jdk.management
 * @run driver RustRegexStartup
 */

import com.sun.management.HotSpotDiagnosticMXBean;
import java.lang.management.ManagementFactory;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import jdk.test.lib.process.ProcessTools;

public class RustRegexStartup {
    public static void main(String[] args) throws Exception {
        for (String cache : new String[]{"64m", "256m"}) {
            for (String[] flags : new String[][]{
                    {},
                    {"-XX:-UseRustRegex"},
                    {"-XX:+UseRustRegex"},
                    {"-XX:-UseRustRegexIntrinsics"}}) {
                List<String> command = new ArrayList<>(List.of(
                        "-Xint", "-XX:ReservedCodeCacheSize=" + cache,
                        "--add-opens=java.base/java.util.regex=ALL-UNNAMED"));
                command.addAll(List.of(flags));
                command.add(Search.class.getName());
                ProcessTools.executeTestJava(command.toArray(String[]::new))
                        .shouldHaveExitValue(0)
                        .shouldContain("Rust regex startup/search OK");
            }
        }
        // Debug C1 verifies every leaf target against Runtime1's name table.
        // Compile enough native searches to exercise that verification and C2.
        for (String tier : new String[]{"-XX:TieredStopAtLevel=1", "-XX:-TieredCompilation"}) {
            ProcessTools.executeTestJava(tier, "-Xbatch", "-XX:CompileThreshold=1000",
                    "--add-opens=java.base/java.util.regex=ALL-UNNAMED",
                    Search.class.getName(), "12000")
                    .shouldHaveExitValue(0)
                    .shouldContain("Rust regex startup/search OK");
        }
    }

    public static class Search {
        public static void main(String[] args) throws Exception {
            Pattern p = Pattern.compile("error([0-9]+)");
            String input = "x ".repeat(2048);
            int count = args.length == 0 ? 32 : Integer.parseInt(args[0]);
            for (int i = 0; i < count; i++) {
                var matcher = p.matcher(input);
                if (matcher.find() || !matcher.hitEnd() || matcher.requireEnd())
                    throw new AssertionError("unsuccessful search state");
            }
            var field = Pattern.class.getDeclaredField("rustRegex");
            field.setAccessible(true);
            boolean compiled = field.get(p) != null;
            boolean enabled = Boolean.parseBoolean(ManagementFactory
                    .getPlatformMXBean(HotSpotDiagnosticMXBean.class)
                    .getVMOption("UseRustRegex").getValue());
            if (compiled != enabled)
                throw new AssertionError("native filter does not match effective UseRustRegex flag");
            if (Boolean.getBoolean("test.rust.regex.expected") && !compiled)
                throw new AssertionError("native filter was not compiled");
            var hit = p.matcher("error123" + input);
            if (!hit.find() || hit.start() != 0 || hit.end() != 8 || !hit.group(1).equals("123"))
                throw new AssertionError("successful search state");
            System.out.println("Rust regex startup/search OK; native filter=" + compiled);
        }
    }
}
