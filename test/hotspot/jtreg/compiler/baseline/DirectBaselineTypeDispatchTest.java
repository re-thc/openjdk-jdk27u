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
 * @summary Direct casts and polymorphic virtual/interface calls preserve runtime, GC and exception contracts
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & (os.arch == "amd64" | os.arch == "x86_64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver DirectBaselineTypeDispatchTest
 */
import java.lang.reflect.Method;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class DirectBaselineTypeDispatchTest {
    static int interfaceInitializations;
    static int calls;
    static int initializeInterface() { interfaceInitializations++; return 7; }
    interface Tag {
        int TOKEN = initializeInterface();
        int apply(int x);
    }
    abstract static class Base { abstract int apply(int x); }
    static class First extends Base implements Tag {
        public int apply(int x) { calls++; return x + 11; }
    }
    static class Second extends Base implements Tag {
        public int apply(int x) { calls++; return x - 7; }
    }
    public static class Plain { public Plain() {} }
    static class Side {
        int before;
        void collect(int flag) { if (flag != 0) System.gc(); }
    }
    static class DuplicateLoader extends ClassLoader {
        Class<?> copy(byte[] bytes) { return defineClass(null, bytes, 0, bytes.length); }
    }
    static Plain cast(Side side, Object value) { side.before++; return (Plain)value; }
    static Tag asTag(Object value) { return (Tag)value; }
    static String[] strings(Object value) { return (String[])value; }
    static int[] ints(Object value) { return (int[])value; }
    static boolean isTag(Object value) { return value instanceof Tag; }
    static int virtualCall(Base receiver, int x) { return receiver.apply(x) + 1; }
    static int interfaceCall(Side side, Tag receiver, int x) { side.before++; return receiver.apply(x) + 2; }
    static Object keep(Side side, Object value, int collect) {
        Plain saved = (Plain)value; side.collect(collect); return saved;
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
        First first = new First(); Second second = new Second(); Plain value = new Plain(); Side side = new Side();
        String[] strings = {"x"}; int[] ints = {3};
        Method firstApply = First.class.getDeclaredMethod("apply", int.class);
        Method secondApply = Second.class.getDeclaredMethod("apply", int.class);
        check(wb.enqueueMethodForCompilation(firstApply, 3)); await(wb, firstApply, 3);
        check(wb.enqueueMethodForCompilation(secondApply, 4)); await(wb, secondApply, 4);
        for (int i = 0; i < 64; i++) {
            check(cast(side, value) == value && asTag(first) == first);
            check(strings(strings) == strings && ints(ints) == ints);
            check(isTag(first) && !isTag(value));
            check(virtualCall(first, i) == i + 12 && virtualCall(second, i) == i - 6);
            check(interfaceCall(side, first, i) == i + 13 && interfaceCall(side, second, i) == i - 5);
            check(keep(side, value, 0) == value);
            Thread.sleep(1);
        }
        Method[] roots = {
            DirectBaselineTypeDispatchTest.class.getDeclaredMethod("cast", Side.class, Object.class),
            DirectBaselineTypeDispatchTest.class.getDeclaredMethod("asTag", Object.class),
            DirectBaselineTypeDispatchTest.class.getDeclaredMethod("strings", Object.class),
            DirectBaselineTypeDispatchTest.class.getDeclaredMethod("ints", Object.class),
            DirectBaselineTypeDispatchTest.class.getDeclaredMethod("isTag", Object.class),
            DirectBaselineTypeDispatchTest.class.getDeclaredMethod("virtualCall", Base.class, int.class),
            DirectBaselineTypeDispatchTest.class.getDeclaredMethod("interfaceCall", Side.class, Tag.class, int.class),
            DirectBaselineTypeDispatchTest.class.getDeclaredMethod("keep", Side.class, Object.class, int.class)
        };
        for (Method root : roots) await(wb, root, 1);
        check(interfaceInitializations == 0); // invoking an abstract interface does not initialize it
        check(cast(side, null) == null && asTag(null) == null && strings(null) == null && ints(null) == null && !isTag(null));
        int before = side.before;
        for (int i = 0; i < 2; i++) {
            try { cast(side, first); throw new AssertionError("missing cast failure"); }
            catch (ClassCastException expected) {
                check(side.before == ++before);
                check(expected.getStackTrace()[0].getMethodName().equals("cast"));
            }
        }
        try { strings(new Object[1]); throw new AssertionError(); } catch (ClassCastException expected) {}
        try { ints(new long[1]); throw new AssertionError(); } catch (ClassCastException expected) {}
        byte[] bytes;
        try (var in = DirectBaselineTypeDispatchTest.class.getResourceAsStream("DirectBaselineTypeDispatchTest$Plain.class")) {
            bytes = in.readAllBytes();
        }
        Object foreign = new DuplicateLoader().copy(bytes).getConstructor().newInstance();
        try { cast(side, foreign); throw new AssertionError("loader identity ignored"); }
        catch (ClassCastException expected) { check(side.before == ++before); }
        int count = calls;
        try { interfaceCall(side, null, 4); throw new AssertionError("missing null receiver"); }
        catch (NullPointerException expected) { check(side.before == ++before && calls == count); }
        check(keep(side, value, 1) == value);
        check(wb.enqueueMethodForCompilation(firstApply, 4)); await(wb, firstApply, 4);
        check(interfaceCall(side, first, 4) == 17 && virtualCall(first, 4) == 16);
        check(interfaceInitializations == 0);
        System.out.println("DIRECT_TYPE_DISPATCH_OK");
    }
    public static void main(String[] args) throws Exception {
        if (args.length != 0) { child(); return; }
        for (String gc : new String[]{"-XX:+UseSerialGC", "-XX:+UseG1GC"}) {
            for (String supers : new String[]{"-XX:+UseSecondarySupersTable", "-XX:-UseSecondarySupersTable"}) {
                OutputAnalyzer out = ProcessTools.executeTestJava("-Xbootclasspath/a:.",
                    "-XX:+UnlockExperimentalVMOptions", "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI",
                    "-XX:+UseDirectBaseline", "-XX:-DirectBaselineDedicatedWorker", "-XX:+TraceDirectBaseline",
                    "-Xmx64m", gc, supers,
                    "-XX:CompileCommand=dontinline,DirectBaselineTypeDispatchTest::*",
                    "-XX:CompileCommand=dontinline,DirectBaselineTypeDispatchTest$First::*",
                    "-XX:CompileCommand=dontinline,DirectBaselineTypeDispatchTest$Second::*",
                    DirectBaselineTypeDispatchTest.class.getName(), "child");
                out.shouldHaveExitValue(0).shouldContain("DIRECT_TYPE_DISPATCH_OK")
                    .shouldContain("direct install cast(").shouldContain("direct install asTag(")
                    .shouldContain("direct install strings(").shouldContain("direct install ints(")
                    .shouldContain("direct install isTag(").shouldContain("direct install virtualCall(")
                    .shouldContain("direct install interfaceCall(").shouldContain("direct install keep(");
            }
        }
    }
}
