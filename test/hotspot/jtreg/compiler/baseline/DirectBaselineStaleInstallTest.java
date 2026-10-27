/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

/* @test
 * @summary Rejecting stale direct work must not consume ordinary C2 decompile history
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & vm.flagless & (os.arch == "amd64" | os.arch == "x86_64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver DirectBaselineStaleInstallTest
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import jdk.test.lib.JDKToolFinder;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class DirectBaselineStaleInstallTest {
    static class Child {
        static final WhiteBox WB = WhiteBox.getWhiteBox();
        static int target(int x) { return x + 1; }
        static void hold(String marker) throws Exception {
            System.out.println(marker);
            if (System.in.read() < 0) throw new AssertionError("controller closed input");
        }
        static void run() throws Exception {
            // The interpreter probe was generated at startup. Stop new requests
            // while bootstrap work drains, then admit only this fresh target.
            WB.setBooleanVMFlag("UseDirectBaseline", false);
            if (WB.getBooleanVMFlag("UseDirectBaseline")) throw new AssertionError("disable failed");
            Method target = Child.class.getDeclaredMethod("target", int.class);
            hold("QUIET");
            WB.lockCompilation();
            WB.setBooleanVMFlag("UseDirectBaseline", true);
            int threshold = Math.toIntExact(WB.getIntxVMFlag("DirectBaselineThreshold"));
            for (int i = 0; i < threshold; i++) if (target(i) != i + 1) throw new AssertionError();
            hold("PENDING");
            WB.markMethodProfiled(target);
            int before = WB.getMethodDecompileCount(target);
            System.out.println("HISTORY_BEFORE=" + before);
            WB.unlockCompilation();
            hold("UNLOCKED");
            int after = WB.getMethodDecompileCount(target);
            System.out.println("HISTORY_AFTER=" + after);
            if (after != before) throw new AssertionError("stale direct rejection changed C2 history: " + before + " -> " + after);
            if (!WB.isMethodCompilable(target, 3)) throw new AssertionError("C1 fallback was disabled");
        }
    }
    static String queue(long pid) throws Exception {
        return ProcessTools.executeProcess(JDKToolFinder.getJDKTool("jcmd"), Long.toString(pid), "Compiler.queue")
                .shouldHaveExitValue(0).getOutput().replace("\r\n", "\n");
    }
    static void awaitStage(long pid, String stage) throws Exception {
        long limit = System.nanoTime() + 10_000_000_000L;
        String owner = Child.class.getName();
        for (;;) {
            String text = queue(pid);
            String current = text.substring(text.indexOf("Current compiles:"), text.indexOf("C1 compile queue:"));
            boolean selected = current.contains(owner + "::target");
            boolean ready = stage.equals("PENDING") ? selected : !text.contains(owner);
            if (stage.equals("QUIET")) ready &= text.contains("C1 compile queue:\nEmpty") && text.contains("C2 compile queue:\nEmpty");
            if (ready) return;
            if (System.nanoTime() > limit) throw new AssertionError("compiler did not reach " + stage + "\n" + text);
            Thread.sleep(10);
        }
    }
    public static void main(String[] args) throws Exception {
        if (args.length != 0) { Child.run(); return; }
        Process child = ProcessTools.createTestJavaProcessBuilder("-Xshare:off", "-Xbootclasspath/a:.",
                "-XX:+UnlockExperimentalVMOptions", "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI",
                "-XX:CICompilerCount=2", "-XX:+UseSerialGC", "-XX:+UseDirectBaseline", "-XX:+TraceDirectBaseline",
                "-XX:CompileCommand=compileonly," + Child.class.getName() + "::target",
                DirectBaselineStaleInstallTest.class.getName(), "child").redirectErrorStream(true).start();
        StringBuilder output = new StringBuilder();
        try (BufferedReader in = new BufferedReader(new InputStreamReader(child.getInputStream()));
             PrintWriter command = new PrintWriter(child.getOutputStream(), true)) {
            for (String line; (line = in.readLine()) != null;) {
                output.append(line).append('\n');
                if (line.equals("QUIET") || line.equals("PENDING") || line.equals("UNLOCKED")) {
                    awaitStage(child.pid(), line);
                    command.println();
                }
            }
            if (child.waitFor() != 0) throw new AssertionError(output.toString());
            if (!output.toString().contains("outcome=stale direct baseline install")) throw new AssertionError(output.toString());
        } finally {
            if (child.isAlive()) child.destroyForcibly().waitFor();
            System.out.print(output);
        }
    }
}
