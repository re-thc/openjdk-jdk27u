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
 */

/*
 * @test
 * @summary C1L avoids cold nontrivial inline trees while retaining normal inline paths
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & vm.compMode == "Xmixed"
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver compiler.tiered.TestC1LColdInlinee
 */
package compiler.tiered;

import java.io.File;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class TestC1LColdInlinee {
    public static void main(String[] args) throws Exception {
        run(true, 3, false, false);
        run(false, 3, false, false);
        run(true, 2, false, false);
        run(true, 3, true, false);
        run(true, 3, false, true);
    }

    private static void run(boolean c1l, int level, boolean terminal, boolean xcomp) throws Exception {
        List<String> flags = new ArrayList<>(List.of(
            "-Xbootclasspath/a:." + File.pathSeparator + System.getProperty("test.classes"),
            "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI", "-Xbatch",
            "-XX:CompileThresholdScaling=100", "-XX:C1MaxTrivialSize=6",
            "-XX:C1MaxInlineSize=35", "-XX:+PrintInlining",
            "-XX:" + (c1l ? "+" : "-") + "UseC1L",
            "-XX:CompileCommand=compileonly," + Work.class.getName() + "::*Caller",
            "-XX:CompileCommand=compileonly," + Work.class.getName() + "::compiledCallee",
            "-XX:CompileCommand=inline," + Work.class.getName() + "::directedCallee"));
        if (terminal) flags.add("-XX:TieredStopAtLevel=3");
        if (xcomp) flags.add("-Xcomp");
        flags.add(Work.class.getName());
        flags.add(Integer.toString(level));
        OutputAnalyzer out = ProcessTools.executeTestJava(flags.toArray(String[]::new));
        out.shouldHaveExitValue(0).shouldContain("COLD_WORK_OK");
        if (c1l && level == 3 && !terminal && !xcomp) {
            out.shouldMatch(".*::coldCallee .*cold callee in C1L.*");
        } else {
            out.shouldNotContain("cold callee in C1L");
            out.shouldMatch("(?m)^.*::coldCallee \\(\\d+ bytes\\)\\s+inline(?:\\s+\\(.*\\))?\\s*$");
        }
        for (String name : List.of("onceCallee", "warmCallee", "trivialCallee", "compiledCallee", "plainCallee")) {
            out.shouldMatch("(?m)^.*::" + name + " \\(\\d+ bytes\\)\\s+inline(?:\\s+\\(.*\\))?\\s*$");
            out.shouldNotMatch(".*::" + name + " .*cold callee in C1L.*");
        }
        out.shouldMatch(".*::directedCallee .*force inline by CompileCommand.*");
    }

    public static class Work {
        private static final WhiteBox WB = WhiteBox.getWhiteBox();

        static int plainCallee(int x, int d) { return (x * 17 + 23) / d; }
        static int coldCallee(int x, int d) { return (x * 3 + 7) / d; }
        static int onceCallee(int x, int d) { return (x * 13 + 19) / d; }
        static int warmCallee(int x, int d) { return (x * 5 + 11) / d; }
        static int compiledCallee(int x, int d) { return (x * 7 + 13) / d; }
        static int directedCallee(int x, int d) { return (x * 11 + 17) / d; }
        static int trivialCallee(int x, int d) { return x + d; }

        // A full-profile root without a loop or monitor must retain ordinary inlining.
        static int plainCaller(int x, int d) { return plainCallee(x, d) + 1; }
        static synchronized int coldCaller(int x, int d) { return coldCallee(x, d) + 1; }
        static synchronized int onceCaller(int x, int d) { return onceCallee(x, d) + 1; }
        static synchronized int warmCaller(int x, int d) { return warmCallee(x, d) + 1; }
        static synchronized int compiledCaller(int x, int d) { return compiledCallee(x, d) + 1; }
        static synchronized int directedCaller(int x, int d) { return directedCallee(x, d) + 1; }
        static synchronized int trivialCaller(int x, int d) { return trivialCallee(x, d) + 1; }

        private static void compile(String name, int level) throws Exception {
            Method method = Work.class.getDeclaredMethod(name, int.class, int.class);
            if (!WB.enqueueMethodForCompilation(method, level)
                    || WB.getMethodCompilationLevel(method) != level) {
                throw new AssertionError("requested tier missing: " + name);
            }
        }

        public static void main(String[] args) throws Exception {
            int level = Integer.parseInt(args[0]);
            onceCallee(1, 2);
            for (int i = 0; i < 32; i++) warmCallee(i, 2);
            compile("compiledCallee", 1);
            for (String name : List.of("coldCaller", "plainCaller", "onceCaller", "warmCaller", "compiledCaller",
                                       "directedCaller", "trivialCaller")) compile(name, level);
            for (int i = -10; i < 10; i++) {
                if (coldCaller(i, 2) != (i * 3 + 7) / 2 + 1
                        || plainCaller(i, 2) != (i * 17 + 23) / 2 + 1
                        || onceCaller(i, 2) != (i * 13 + 19) / 2 + 1
                        || warmCaller(i, 2) != (i * 5 + 11) / 2 + 1
                        || compiledCaller(i, 2) != (i * 7 + 13) / 2 + 1
                        || directedCaller(i, 2) != (i * 11 + 17) / 2 + 1
                        || trivialCaller(i, 2) != i + 3) throw new AssertionError("wrong result");
            }
            try {
                coldCaller(7, 0);
                throw new AssertionError("missing arithmetic exception");
            } catch (ArithmeticException expected) {
                List<String> frames = new ArrayList<>();
                for (StackTraceElement frame : expected.getStackTrace()) frames.add(frame.getMethodName());
                if (!frames.contains("coldCallee") || !frames.contains("coldCaller"))
                    throw new AssertionError("missing call frames: " + frames);
            }
            System.out.println("COLD_WORK_OK");
        }
    }
}
