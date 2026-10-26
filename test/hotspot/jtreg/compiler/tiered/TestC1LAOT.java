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
 * @summary C1L remains active while recording training and is excluded while replaying it
 * @requires vm.cds.supports.aot.class.linking
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & vm.compMode == "Xmixed"
 * @requires vm.flagless
 * @library /test/lib /test/setup_aot
 * @build compiler.tiered.TestC1LAOT jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller -jar c1l-whitebox.jar jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller -jar c1l-aot.jar
 *      compiler.tiered.C1LAOTApp
 * @run driver/timeout=240 compiler.tiered.TestC1LAOT
 */
package compiler.tiered;

import java.lang.reflect.Method;
import jdk.test.lib.cds.CDSAppTester;
import jdk.test.lib.helpers.ClassFileInstaller;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.whitebox.WhiteBox;

public class TestC1LAOT {
    public static void main(String[] args) throws Exception {
        new Tester().run("AOT", "--two-step-training");
    }

    private static class Tester extends CDSAppTester {
        Tester() {
            super("c1l-training-replay");
            useWhiteBox(ClassFileInstaller.getJarPath("c1l-whitebox.jar"));
        }

        @Override
        public String classpath(RunMode mode) {
            return ClassFileInstaller.getJarPath("c1l-aot.jar");
        }

        @Override
        public String[] vmArgs(RunMode mode) {
            return new String[] {
                "-Xmx128m", "-XX:ActiveProcessorCount=4", "-Xbatch", "-XX:+UseC1L",
                "-XX:+UnlockDiagnosticVMOptions",
                "-XX:CompileThresholdScaling=100", "-XX:C1MaxTrivialSize=6",
                "-XX:C1MaxInlineSize=35", "-XX:+PrintInlining",
                "-XX:CompileCommand=compileonly," + C1LAOTApp.class.getName() + "::caller"
            };
        }

        @Override
        public String[] appCommandLine(RunMode mode) {
            return new String[] { C1LAOTApp.class.getName(), mode.name() };
        }

        @Override
        public void checkExecution(OutputAnalyzer out, RunMode mode) {
            if (!mode.isApplicationExecuted()) return;
            out.shouldContain("C1L_AOT_OK " + mode.name());
            if (mode == RunMode.TRAINING) {
                out.shouldMatch(".*::coldCallee .*cold callee in C1L.*");
            } else {
                out.shouldNotContain("cold callee in C1L");
                out.shouldMatch(".*::coldCallee .*inline.*");
            }
        }
    }

}

class C1LAOTApp {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();

    static int coldCallee(int x, int d) { return (x * 3 + 7) / d; }
    static synchronized int caller(int x, int d) { return coldCallee(x, d) + 1; }

    public static void main(String[] args) throws Exception {
        boolean training = args[0].equals("TRAINING");
        if (!WB.getBooleanVMFlag("UseC1L")
                || WB.getBooleanVMFlag("AOTRecordTraining") != training
                || WB.getBooleanVMFlag("AOTReplayTraining") == training) {
            throw new AssertionError("unexpected C1L/training/replay mode");
        }
        Method method = C1LAOTApp.class.getDeclaredMethod("caller", int.class, int.class);
        Method calleeMethod = C1LAOTApp.class.getDeclaredMethod("coldCallee", int.class, int.class);
        // Do not let replayed execution counts make the callee appear warm:
        // the difference under test must come from the C1L replay exclusion.
        WB.clearMethodState(calleeMethod);
        if (WB.getMethodCompilationLevel(calleeMethod) != 0) {
            throw new AssertionError("callee must not have compiled code");
        }
        // Replay may already have compiled this method from training data.
        // Request a fresh full-profile compilation to observe its inline policy.
        WB.deoptimizeMethod(method);
        WB.clearMethodState(method);
        if (!WB.enqueueMethodForCompilation(method, 3)
                || WB.getMethodCompilationLevel(method) != 3) {
            throw new AssertionError("missing full-profile compilation");
        }
        for (int i = -10; i < 10; i++) {
            if (caller(i, 2) != (i * 3 + 7) / 2 + 1) {
                throw new AssertionError("wrong result");
            }
        }
        try {
            caller(7, 0);
            throw new AssertionError("missing arithmetic exception");
        } catch (ArithmeticException expected) {
            boolean callee = false, caller = false;
            for (StackTraceElement frame : expected.getStackTrace()) {
                callee |= frame.getMethodName().equals("coldCallee");
                caller |= frame.getMethodName().equals("caller");
            }
            if (!callee || !caller) throw new AssertionError("missing call frames");
        }
        System.out.println("C1L_AOT_OK " + args[0]);
    }
}
