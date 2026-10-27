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
 * @summary Reject structurally unsupported bodies before CI operand setup while retaining ordinary compilation
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & (os.arch == "amd64" | os.arch == "x86_64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver DirectBaselinePreparationTest
 */
import java.lang.reflect.Method;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class DirectBaselinePreparationTest {
    static class Box { int value = 17; Object reference = new Object(); }
    static final class Targets {
        static int leaf(int x) { return x + 5; }
        static int fieldThenDivision(Box box, int x) { return box.value + x / 3; }
        static int callThenDivision(int x) { return leaf(x) + x / 3; }
        static Object supported(Box box) { return box.reference; }
    }
    static void check(boolean condition) { if (!condition) throw new AssertionError(); }
    static void await(WhiteBox wb, Method method, int level) throws Exception {
        long deadline = System.nanoTime() + 20_000_000_000L;
        while (wb.getMethodCompilationLevel(method) != level) {
            if (System.nanoTime() > deadline) throw new AssertionError("missing level " + level + ": " + method);
            Thread.sleep(5);
        }
    }
    static void child() throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        Box box = new Box();
        for (int i = 0; i < 64; i++) {
            check(Targets.fieldThenDivision(box, i) == 17 + i / 3);
            check(Targets.callThenDivision(i) == i + 5 + i / 3);
            Thread.sleep(1);
        }
        // This later direct task establishes that the earlier FIFO requests
        // have drained, without relying on an idle timeout or ordinary queue bit.
        for (int i = 0; i < 64; i++) {
            check(Targets.supported(box) == box.reference);
            Thread.sleep(1);
        }
        await(wb, Targets.class.getDeclaredMethod("supported", Box.class), 1);
        Method field = Targets.class.getDeclaredMethod("fieldThenDivision", Box.class, int.class);
        Method call = Targets.class.getDeclaredMethod("callThenDivision", int.class);
        for (Method method : new Method[]{field, call}) {
            check(wb.getMethodCompilationLevel(method) == 0);
            check(wb.isMethodCompilable(method, 3));
            check(wb.enqueueMethodForCompilation(method, 3));
            await(wb, method, 3);
        }
        check(Targets.fieldThenDivision(box, -7) == 15 && Targets.callThenDivision(-7) == -4);
        try { Targets.fieldThenDivision(null, 0); throw new AssertionError(); }
        catch (NullPointerException expected) {}
        System.out.println("DIRECT_PREPARATION_OK");
    }
    public static void main(String[] args) throws Exception {
        if (args.length != 0) { child(); return; }
        OutputAnalyzer out = ProcessTools.executeTestJava("-Xbootclasspath/a:.",
            "-XX:+UnlockExperimentalVMOptions", "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI",
            "-XX:+UseDirectBaseline", "-XX:-DirectBaselineDedicatedWorker", "-XX:+TraceDirectBaseline",
            "-XX:CompileCommand=compileonly,DirectBaselinePreparationTest$Targets::*",
            "-XX:CompileCommand=dontinline,DirectBaselinePreparationTest$Targets::*",
            DirectBaselinePreparationTest.class.getName(), "child");
        out.shouldHaveExitValue(0).shouldContain("DIRECT_PREPARATION_OK")
            .shouldContain("direct prepare DirectBaselinePreparationTest$Targets fieldThenDivision(LDirectBaselinePreparationTest$Box;I)I outcome=unsupported bytecode")
            .shouldContain("direct prepare DirectBaselinePreparationTest$Targets callThenDivision(I)I outcome=unsupported bytecode")
            .shouldContain("direct install supported(")
            .shouldNotContain("direct compile DirectBaselinePreparationTest$Targets fieldThenDivision")
            .shouldNotContain("direct compile DirectBaselinePreparationTest$Targets callThenDivision");
    }
}
