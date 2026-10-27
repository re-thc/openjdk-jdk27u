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
 * @summary Direct constructor entry/chaining preserve roots, final fields, exceptions and ordinary replacement
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & (os.arch == "amd64" | os.arch == "x86_64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver DirectBaselineConstructorTest
 */
import java.lang.reflect.Executable;
import java.lang.reflect.Method;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class DirectBaselineConstructorTest {
    static class Side { int calls; Object receiver; }
    static class Base {
        final Object token;
        final int base;
        Base(Side side, Object token, int value, int mode) {
            this.token = token; this.base = value;
            side.receiver = this; touch(side, token, mode);
        }
    }
    static class Child extends Base {
        final Object second;
        final int tail;
        Child(Side side, Object token, int value, int mode) {
            super(side, token, value, mode);
            second = token; tail = value + 1;
        }
    }
    static class Chained extends Base {
        final int last;
        Chained(Side side, Object token, int value) { this(side, token, value, 0); }
        Chained(Side side, Object token, int value, int mode) {
            super(side, token, value, mode); last = value ^ 31;
        }
    }
    static void touch(Side side, Object token, int mode) {
        side.calls++;
        if (mode != 0) System.gc();
        if (mode == 2) throw new IllegalStateException("expected constructor failure");
        if (token == null) throw new AssertionError();
    }
    static void check(boolean condition) { if (!condition) throw new AssertionError(); }
    static void await(WhiteBox wb, Executable method, int level) throws Exception {
        long deadline = System.nanoTime() + 20_000_000_000L;
        while (wb.getMethodCompilationLevel(method) != level) {
            if (System.nanoTime() > deadline) throw new AssertionError("missing level " + level + ": " + method);
            Thread.sleep(5);
        }
    }
    static void child() throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        Method touch = DirectBaselineConstructorTest.class.getDeclaredMethod("touch", Side.class, Object.class, int.class);
        check(wb.enqueueMethodForCompilation(touch, 4)); await(wb, touch, 4);
        Side side = new Side(); Object token = new Object();
        var base = Base.class.getDeclaredConstructor(Side.class, Object.class, int.class, int.class);
        var child = Child.class.getDeclaredConstructor(Side.class, Object.class, int.class, int.class);
        var chain = Chained.class.getDeclaredConstructor(Side.class, Object.class, int.class);
        var chainTarget = Chained.class.getDeclaredConstructor(Side.class, Object.class, int.class, int.class);
        for (int i = 0; i < 64; i++) {
            Child c = new Child(side, token, i, 0);
            check(c.token == token && c.second == token && c.base == i && c.tail == i+1 && side.receiver == c);
            Chained d = new Chained(side, token, i);
            check(d.token == token && d.base == i && d.last == (i^31) && side.receiver == d);
            Thread.sleep(1);
        }
        for (Executable root : new Executable[]{base, child, chain, chainTarget}) await(wb, root, 1);
        Child c = new Child(side, token, -7, 1);
        check(c.token == token && c.second == token && c.base == -7 && c.tail == -6 && side.receiver == c);
        int calls = side.calls;
        try { new Child(side, token, 23, 2); throw new AssertionError("constructor did not throw"); }
        catch (IllegalStateException expected) {
            check(side.calls == calls+1);
            check(expected.getStackTrace()[1].getMethodName().equals("<init>"));
            check(expected.getStackTrace()[1].getClassName().equals(Base.class.getName()));
            check(expected.getStackTrace()[2].getClassName().equals(Child.class.getName()));
            check(((Base)side.receiver).token == token && ((Base)side.receiver).base == 23);
        }
        check(wb.enqueueMethodForCompilation(child, 4)); await(wb, child, 4);
        c = new Child(side, token, 49, 1);
        check(c.token == token && c.second == token && c.base == 49 && c.tail == 50);
        check(wb.getMethodCompilationLevel(base) == 1);
        System.out.println("DIRECT_CONSTRUCTOR_OK");
    }
    public static void main(String[] args) throws Exception {
        if (args.length != 0) { child(); return; }
        for (String gc : new String[]{"-XX:+UseSerialGC", "-XX:+UseG1GC"}) {
            OutputAnalyzer out = ProcessTools.executeTestJava("-Xbootclasspath/a:.",
                "-XX:+UnlockExperimentalVMOptions", "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI",
                "-XX:+UseDirectBaseline", "-XX:-DirectBaselineDedicatedWorker", "-XX:+TraceDirectBaseline",
                "-XX:HeapBaseMinAddress=32g", "-Xmx64m", gc,
                "-XX:CompileCommand=dontinline,DirectBaselineConstructorTest*::*",
                DirectBaselineConstructorTest.class.getName(), "child");
            out.shouldHaveExitValue(0).shouldContain("DIRECT_CONSTRUCTOR_OK")
                .shouldContain("direct compile DirectBaselineConstructorTest$Base <init>")
                .shouldContain("direct compile DirectBaselineConstructorTest$Child <init>")
                .shouldContain("direct compile DirectBaselineConstructorTest$Chained <init>")
                .shouldNotContain("direct compile java/lang/Object <init>");
        }
    }
}
