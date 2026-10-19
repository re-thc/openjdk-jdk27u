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
 *
 */

/*
 * @test
 * @summary Regex leaf entries use relocated array elements with all object header layouts
 * @library /test/lib
 * @run driver/timeout=600 RustRegexArrayLayout
 */

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jdk.test.lib.Platform;
import jdk.test.lib.process.ProcessTools;

public class RustRegexArrayLayout {
    public static void main(String[] args) throws Exception {
        if (!Platform.isX64() && !Platform.isAArch64()) return;
        for (String gc : new String[]{"Serial", "G1", "Z"}) {
            for (String[] layout : new String[][]{
                    {}, {"-XX:-UseFourByteObjectHeaders"}, {"-XX:-UseCompactObjectHeaders"}}) {
                for (String[] tier : new String[][]{
                        {"-Xint"}, {"-XX:TieredStopAtLevel=1"},
                        {"-XX:-TieredCompilation"}, {"-XX:-UseRustRegexIntrinsics"}}) {
                    List<String> command = new ArrayList<>(List.of("-Xbatch",
                            "-XX:CompileThreshold=1000", "-XX:+Use" + gc + "GC",
                            "--add-opens=java.base/java.lang=ALL-UNNAMED",
                            "--add-opens=java.base/java.util.regex=ALL-UNNAMED"));
                    command.addAll(List.of(layout));
                    command.addAll(List.of(tier));
                    command.add(Search.class.getName());
                    ProcessTools.executeProcess(ProcessTools.createLimitedTestJavaProcessBuilder(
                            command.toArray(String[]::new))).shouldHaveExitValue(0)
                            .shouldContain("Relocated regex arrays OK");
                }
            }
        }
    }

    public static class Search {
        public static void main(String[] args) throws Exception {
            String input = "x ".repeat(2048) + "error123";
            Pattern p = Pattern.compile("error([0-9]+)");
            Matcher m = p.matcher(input);
            Field value = String.class.getDeclaredField("value");
            Field groups = Matcher.class.getDeclaredField("groups");
            value.setAccessible(true);
            groups.setAccessible(true);
            Object bytes = value.get(input);
            Object captures = groups.get(m);
            int bytesHash = System.identityHashCode(bytes);
            int capturesHash = System.identityHashCode(captures);
            for (int cycle = 0; cycle < 3; cycle++) {
                for (int i = 0; i < 12000; i++) {
                    if (!m.reset().find() || m.start() != 4096 || m.end() != 4104
                            || m.start(1) != 4101 || m.end(1) != 4104 || !m.group(1).equals("123"))
                        throw new AssertionError("relocated capture state");
                }
                System.gc();
                if (bytesHash != System.identityHashCode(bytes)
                        || capturesHash != System.identityHashCode(captures))
                    throw new AssertionError("array identity hash changed");
            }
            if (!m.reset().find() || m.end(1) != 4104)
                throw new AssertionError("capture state after collection");
            System.out.println("Relocated regex arrays OK");
        }
    }
}
