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
 * @summary Direct code retires when profiling starts, retaining ordinary admission counters
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & (os.arch == "amd64" | os.arch == "x86_64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockExperimentalVMOptions -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:CICompilerCount=2 -XX:Tier3LoadFeedback=0 -XX:+UseDirectBaseline -XX:+TraceDirectBaseline -XX:CompileCommand=dontinline,DirectBaselineProfileTest::* DirectBaselineProfileTest
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockExperimentalVMOptions -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:CICompilerCount=2 -XX:Tier3LoadFeedback=0 -XX:+UseDirectBaseline -XX:-DirectBaselineDedicatedWorker -XX:+TraceDirectBaseline -XX:CompileCommand=dontinline,DirectBaselineProfileTest::* DirectBaselineProfileTest 512
 */
import java.lang.reflect.Method;
import jdk.test.whitebox.WhiteBox;

public class DirectBaselineProfileTest {
    static final WhiteBox WB = WhiteBox.getWhiteBox();
    static class Box { int value; int calls; }
    static int target(Box b, int x) {
        b.calls = b.calls + 1;
        if (x < 0) return b.value;
        b.value = x;
        return b.value + x;
    }
    static void check(boolean condition) { if (!condition) throw new AssertionError(); }
    public static void main(String[] args) throws Exception {
        int admission = args.length == 0 ? 256 : Integer.parseInt(args[0]);
        Method method = DirectBaselineProfileTest.class.getDeclaredMethod("target", Box.class, int.class);
        Box b = new Box();
        for (int i = 0; i < 64; i++) { check(target(b, i) == 2*i); Thread.sleep(1); }
        long installationLimit = System.nanoTime() + 20_000_000_000L;
        while (WB.getMethodCompilationLevel(method) != 1) {
            if (System.nanoTime() > installationLimit) throw new AssertionError("no early direct installation");
            Thread.sleep(10);
        }
        WB.lockCompilation();
        try {
            // Only this test disables load feedback. The shared candidate may
            // postpone ordinary C1, while stock MDO creation still runs first.
            for (int total = 65; total < admission; total++) {
                check(target(b, total) == 2*total);
                check(!WB.isMethodQueuedForCompilation(method));
                if (admission == 512 && (total == 256 || total == 384)) {
                    check(WB.getMethodData(method) == 0);
                    check(WB.getMethodCompilationLevel(method) == 1);
                }
            }
            check(target(b, admission) == 2*admission);
            check(WB.isMethodQueuedForCompilation(method));
            if (admission == 512) {
                check(WB.getMethodData(method) != 0);
                check(WB.getMethodCompilationLevel(method) == 0);
            }
            for (int total = admission + 1; total <= 8256; total++) check(target(b, total) == 2*total);
            check(WB.isMethodQueuedForCompilation(method));
            check(WB.getMethodData(method) != 0);
            check(WB.getMethodCompilationLevel(method) == 0);
            check(b.calls == 8256); // deoptimization did not replay a completed body
        } finally {
            WB.unlockCompilation();
        }
        long limit = System.nanoTime() + 10_000_000_000L;
        int level;
        while ((level = WB.getMethodCompilationLevel(method)) == 0) {
            if (System.nanoTime() > limit) throw new AssertionError("no ordinary C1 handoff");
            Thread.sleep(10);
        }
        check(level == 2 || level == 3);
        if (admission == 512) {
            long c2Limit = System.nanoTime() + 20_000_000_000L;
            int calls = 0;
            while (WB.getMethodCompilationLevel(method) != 4) {
                check(target(b, calls) == 2*calls);
                if ((++calls & 15) == 0) Thread.sleep(1);
                if (System.nanoTime() > c2Limit) throw new AssertionError("no natural C2 progression");
            }
            System.out.println("DIRECT_DELAYED_C2_OK calls=" + calls);
        }
        System.out.println("DIRECT_PROFILE_OK");
    }
}
