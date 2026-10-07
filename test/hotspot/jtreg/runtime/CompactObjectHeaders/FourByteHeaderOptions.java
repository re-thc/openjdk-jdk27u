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
 * @summary Four-byte headers are the fork default with eight-byte and legacy opt-outs
 * @requires vm.bits == "64" & (os.arch == "amd64" | os.arch == "aarch64")
 * @requires vm.flavor != "zero" & vm.gc.Serial & vm.gc.G1 & vm.gc.Z
 * @library /test/lib
 * @run driver FourByteHeaderOptions
 */
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class FourByteHeaderOptions {
    static void check(boolean four, boolean compact, String... options) throws Exception {
        check(null, four, compact, options);
    }

    static void check(String environment, boolean four, boolean compact, String... options) throws Exception {
        var args = new java.util.ArrayList<String>();
        if (java.util.Arrays.stream(options).anyMatch(option -> option.startsWith("-XX:hashCode="))) {
            args.add("-XX:+UnlockExperimentalVMOptions");
        }
        if (environment == null) {
            args.addAll(java.util.List.of(options));
        }
        args.add("-XX:+PrintFlagsFinal");
        args.add("-version");
        var builder = ProcessTools.createLimitedTestJavaProcessBuilder(args);
        if (environment != null) {
            String inherited = builder.environment().getOrDefault(environment, "");
            builder.environment().put(environment, inherited + " " + String.join(" ", options));
        }
        var output = new OutputAnalyzer(builder.start());
        output.shouldHaveExitValue(0);
        output.shouldMatch("UseFourByteObjectHeaders\\s+= " + four);
        output.shouldMatch("UseCompactObjectHeaders\\s+= " + compact);
    }
    public static void main(String[] args) throws Exception {
        check(true, true);
        check(true, true, "-XX:hashCode=6");
        check(false, true, "-XX:-UseFourByteObjectHeaders");
        check(false, false, "-XX:-UseCompactObjectHeaders");
        check(false, false, "-XX:-UseFourByteObjectHeaders", "-XX:-UseCompactObjectHeaders");
        check(true, true, "-XX:+UseFourByteObjectHeaders");
        check(true, true, "-XX:+UseFourByteObjectHeaders", "-XX:-UseCompactObjectHeaders");
        check(false, true, "-XX:+UseFourByteObjectHeaders", "-XX:hashCode=3");
        check(false, true, "-XX:hashCode=3");
        for (String environment : java.util.List.of("JAVA_TOOL_OPTIONS", "_JAVA_OPTIONS", "JDK_JAVA_OPTIONS")) {
            check(environment, false, false, "-XX:-UseCompactObjectHeaders");
            check(environment, false, true, "-XX:-UseFourByteObjectHeaders");
            check(environment, true, true, "-XX:+UseFourByteObjectHeaders", "-XX:-UseCompactObjectHeaders");
        }
        for (String gc : java.util.List.of("Serial", "G1", "Z")) {
            check(true, true, "-XX:+Use" + gc + "GC");
            check(false, true, "-XX:-UseFourByteObjectHeaders", "-XX:+Use" + gc + "GC");
        }
    }
}
