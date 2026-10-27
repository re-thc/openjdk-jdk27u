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
 * @summary Prepared prefixes keep poll hooks opt-in and respect forced polls and late breakpoints
 * @requires (os.arch == "amd64" | os.arch == "x86_64") & vm.compiler1.enabled & vm.jvmti
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/native InterpreterFramePilotGuardTest
 */

import java.lang.reflect.Method;
import java.nio.file.Path;
import java.util.ArrayList;
import jdk.test.lib.Utils;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class InterpreterFramePilotGuardTest {
    static WhiteBox wb;
    static int lateTarget(int x, int y) { int sum = x + y; return sum + x; }
    static native void installBreakpoint();
    static native void clearBreakpoint();
    static native int breakpointEvents();

    static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }

    static long[] query(Method method, int action) {
        return wb.interpreterFramePilot(method, action);
    }

    static void child(String mode, int action, String library) throws Exception {
        wb = WhiteBox.getWhiteBox();
        Method method = InterpreterFramePilotGuardTest.class.getDeclaredMethod("lateTarget", int.class, int.class);
        check(lateTarget(17, 20) == 54, "ordinary oracle");
        long[] prepared = query(method, action);
        check(prepared[0] == 1 && prepared[8] != 0 && prepared[10] == 1, "prefix prepared and enabled");
        if (action != 5) check(prepared[4] > 2 && prepared[5] > 2, "breakpoint lies inside native prefix");
        long entry = prepared[8];
        long before = query(method, 3)[9];
        check(!wb.isMethodCompiled(method), "prefix is not an nmethod");
        check(wb.getBooleanVMFlag("InterpreterFramePilotTestPoll") == mode.equals("poll"),
                "only forced-poll children opt in at generation time");

        if (mode.equals("plain")) {
            check(query(method, 6)[0] == 0 && query(method, 7)[0] == 0,
                    "normal pilot rejects forced-poll requests");
            for (int i = 1; i <= 2; i++) {
                check(lateTarget(17, 20) == 54 && query(method, 3)[9] == before + i,
                        "normal prefix executes without test hooks");
            }
            check(query(method, 3)[8] == entry, "normal entry stays immutable");
            System.out.println("PILOT_PLAIN_ENTRY_OK action=" + action);
            return;
        }

        if (mode.equals("poll")) {
            check(lateTarget(17, 20) == 54 && query(method, 3)[9] == before + 1, "native prefix control");
            before++;
            check(query(method, 6)[0] == 1, "arm one forced poll");
            check(query(method, 7)[0] == 1 && query(method, 6)[0] == 0, "one pending request before entry");
            check(lateTarget(17, 20) == 54, "polled ordinary fallback result");
            check(query(method, 7)[0] == 4, "armed guard and ordinary polling runtime completed at bci zero");
            check(query(method, 3)[9] == before, "forced poll bypasses native body");
            check(lateTarget(17, 20) == 54 && query(method, 3)[9] == before + 1, "native prefix resumes afterward");
            check(query(method, 3)[8] == entry, "poll keeps immutable prefix");
            System.out.println("PILOT_FORCED_POLL_OK action=" + action);
            return;
        }

        // Breakpoint/local-access capabilities must be reserved during OnLoad.
        // They already force conservative fallback; the actual breakpoint is
        // installed only now, after a native body has been prepared.
        check(lateTarget(17, 20) == 54 && query(method, 3)[9] == before,
                "startup capabilities already require ordinary fallback");
        System.load(library);
        installBreakpoint();
        for (int i = 0; i < 3; i++) {
            // The event at bci 2 changes local x from 17 to 100, after its
            // original value is loaded for x+y. The return becomes 37+100.
            check(lateTarget(17, 20) == 137, "debugger local mutation is observed");
            check(breakpointEvents() == i + 1, "one real breakpoint event per invocation");
        }
        check(query(method, 3)[9] == before, "debugger executes ordinary bytecodes");
        check(query(method, 3)[8] == entry, "breakpoint keeps prepared prefix present");
        clearBreakpoint();
        check(lateTarget(17, 20) == 54 && breakpointEvents() == 3, "clear restores ordinary semantics");
        check(!wb.isMethodCompiled(method), "debugger did not use ordinary compiled code");
        System.out.println("PILOT_LATE_BREAKPOINT_OK action=" + action);
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            child(args[0], Integer.parseInt(args[1]), args[2]);
            return;
        }
        String library = Path.of(Utils.TEST_NATIVE_PATH, System.mapLibraryName("InterpreterFramePilotGuards"))
                .toAbsolutePath().toString();
        for (int action : new int[]{0, 4, 5}) {
            for (String mode : new String[]{"plain", "poll", "breakpoint"}) {
                ArrayList<String> command = new ArrayList<>();
                command.addAll(java.util.List.of("-Xint", "-Xmx64m", "-Xbootclasspath/a:.",
                        "-XX:+UnlockExperimentalVMOptions", "-XX:+UnlockDiagnosticVMOptions",
                        "-XX:+WhiteBoxAPI", "-XX:+UseInterpreterFramePilot", "-XX:GuaranteedSafepointInterval=0"));
                if (mode.equals("breakpoint")) command.add("-agentpath:" + library);
                if (mode.equals("poll")) command.add("-XX:+InterpreterFramePilotTestPoll");
                command.addAll(java.util.List.of(InterpreterFramePilotGuardTest.class.getName(), mode,
                        Integer.toString(action), library));
                String marker = switch (mode) {
                    case "plain" -> "PILOT_PLAIN_ENTRY_OK";
                    case "poll" -> "PILOT_FORCED_POLL_OK";
                    default -> "PILOT_LATE_BREAKPOINT_OK";
                };
                ProcessTools.executeTestJava(command).shouldHaveExitValue(0).shouldContain(marker);
            }
        }
    }
}
