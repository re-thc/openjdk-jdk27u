/*
 * Copyright (c) 2020, 2025, Oracle and/or its affiliates. All rights reserved.
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
 * @summary Test the native process builder API.
 * @library /test/lib
 * @requires !jdk.static
 * @run main/native TestNativeProcessBuilder
 */


import jdk.test.lib.Utils;
import jdk.test.lib.process.ProcessTools;
import jdk.test.lib.process.OutputAnalyzer;

public class TestNativeProcessBuilder {
    public static void main(String args[]) throws Exception {
        if (System.getProperty("test.stream.encoding") != null) {
            checkStreamOptionOverrides();
        }
        ProcessBuilder pb = ProcessTools.createNativeTestProcessBuilder("jvm-test-launcher");
        ProcessTools.configureNativeTestStreams(pb);
        pb.environment().put("CLASSPATH", Utils.TEST_CLASS_PATH);
        new OutputAnalyzer(pb.start())
            .shouldHaveExitValue(0)
            .stdoutShouldContain("Hello Test");
    }

    private static void checkStreamOptionOverrides() {
        ProcessBuilder pb = new ProcessBuilder();
        pb.environment().remove("_JAVA_OPTIONS");
        pb.environment().put("JAVA_TOOL_OPTIONS", "-Dsun.stdout.encoding.extra=true");
        ProcessTools.configureNativeTestStreams(pb);
        String options = pb.environment().get("JAVA_TOOL_OPTIONS");
        if (!options.contains("-Dstdout.encoding=")) {
            throw new AssertionError("Unrelated property suppressed stdout default: " + options);
        }

        pb.environment().put("JAVA_TOOL_OPTIONS", "-Ddummy=x" + (char) 0x1c + "-Dsun.stdout.encoding=US-ASCII");
        ProcessTools.configureNativeTestStreams(pb);
        options = pb.environment().get("JAVA_TOOL_OPTIONS");
        if (!options.contains("-Dstdout.encoding=")) {
            throw new AssertionError("Property value suppressed stdout default: " + options);
        }

        pb.environment().put("JAVA_TOOL_OPTIONS", "'-Dsun.stdout.encoding=US-ASCII'");
        ProcessTools.configureNativeTestStreams(pb);
        options = pb.environment().get("JAVA_TOOL_OPTIONS");
        if (options.contains("-Dstdout.encoding=") || !options.contains("-Dstderr.encoding=")) {
            throw new AssertionError("Legacy override was shadowed: " + options);
        }

        pb.environment().remove("JAVA_TOOL_OPTIONS");
        pb.environment().put("_JAVA_OPTIONS", "-Dsun.stderr.encoding=US-ASCII");
        ProcessTools.configureNativeTestStreams(pb);
        options = pb.environment().get("JAVA_TOOL_OPTIONS");
        if (options.contains("-Dstderr.encoding=") || !options.contains("-Dstdout.encoding=") ||
                !"-Dsun.stderr.encoding=US-ASCII".equals(pb.environment().get("_JAVA_OPTIONS"))) {
            throw new AssertionError("_JAVA_OPTIONS override was shadowed: " + options);
        }
    }

    public static class Test {
        public static void test() {
            System.out.println("Hello Test");
        }
    }
}
