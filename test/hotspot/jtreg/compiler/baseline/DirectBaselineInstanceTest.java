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
 * @summary Direct instance entry and bound calls preserve receiver, adapter, GC and exception contracts
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & (os.arch == "amd64" | os.arch == "x86_64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver DirectBaselineInstanceTest
 */
import java.lang.reflect.Method;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class DirectBaselineInstanceTest {
    static class Side { int before; int inside; }
    static class Base {
        int value;
        Object ref;
        Base(int value) { this.value = value; }
        int plain(int x) { return value + x * 3; }
        int entry(Object token, int a, int b, int c, int d, int e, int f, int g,
                  byte small, char wide, short signed) {
            return value + a+b+c+d+e+f+g + small+wide+signed + (token == ref ? 100 : 0);
        }
        final int noReceiver(int x) { return x + 7; }
        private int privateLeaf(int x) { return value + x; }
        int privateCall(int x) { return privateLeaf(x) + value; }
        int pick(int x) { return value + x; }
        final int mayThrow(Side side, int x) {
            side.inside++;
            if (x < 0) throw new IllegalStateException("expected instance exception");
            return value + x;
        }
        int throwingCall(Side side, int x) { side.before++; return mayThrow(side, x); }
        final void clearAndGC(int collect) { if (collect != 0) { ref = null; System.gc(); } }
        Object keepAfterGC(int collect) {
            Object saved = ref; clearAndGC(collect);
            return value == 9 ? saved : null; // use both receiver and saved oop after collection
        }
        final Object collectMany(Object first, int a, int b, int c, int d, int e, int f,
                                 Object last, int collect) {
            if (collect != 0) System.gc();
            return a+b+c+d+e+f == 21 ? last : first;
        }
        Object manyReferences(Object first, Object last, int collect) {
            return collectMany(first, 1, 2, 3, 4, 5, 6, last, collect);
        }
        int coldCall(int use) { return use == 0 ? 0 : Cold.read(); }
        int withHandler(int x) {
            try { return mayThrow(new Side(), x); }
            catch (IllegalStateException expected) { return -1; }
        }
    }
    static class Child extends Base {
        Child(int value) { super(value); }
        @Override int pick(int x) { return value + x + 100; }
        int superCall(int x) { return super.pick(x) + 1; }
    }
    static class Other extends Base {
        Other(int value) { super(value); }
        @Override int plain(int x) { return value - x; }
    }
    static final class Inherited extends Base { Inherited(int value) { super(value); } }
    interface Face { int apply(int x); }
    static final class FaceImpl implements Face { public int apply(int x) { return x+19; } }
    static int initializations;
    static class Cold {
        static int value = initialize();
        static int initialize() { initializations++; return 73; }
        static int read() { return value; }
    }
    static int interpretedCaller(Base receiver, int x) { return receiver.plain(x); }
    static int compiledCaller(Base receiver, int x) { return receiver.plain(x); }
    static int boundCall(Side side, Base receiver, int x) { side.before++; return receiver.noReceiver(x); }
    static int unboundCall(Base receiver, int x) { return receiver.plain(x)+1; }
    static int interfaceCall(Face receiver, int x) { return receiver.apply(x); }
    static int inheritedFinal(Inherited receiver, int x) { return receiver.noReceiver(x); }
    static int inheritedNonfinal(Inherited receiver, int x) { return receiver.plain(x); }
    static Class<?> nativeCall(Object receiver) { return receiver.getClass(); }
    static WhiteBox WB;

    static Method method(Class<?> holder, String name, Class<?>... arguments) throws Exception {
        return holder.getDeclaredMethod(name, arguments);
    }
    static void check(boolean condition) { if (!condition) throw new AssertionError(); }
    static void await(Method method, int level) throws Exception {
        long limit = System.nanoTime() + 20_000_000_000L;
        while (WB.getMethodCompilationLevel(method) != level) {
            if (System.nanoTime() > limit) throw new AssertionError("missing level " + level + ": " + method);
            Thread.sleep(5);
        }
    }
    static void child() throws Exception {
        WB = WhiteBox.getWhiteBox();
        // Two loaded implementations prevent CHA from replacing the virtual
        // caller with a statically selected target; this exercises its IC.
        Other other = new Other(21);
        Method plain = method(Base.class, "plain", int.class);
        Method caller = method(DirectBaselineInstanceTest.class, "compiledCaller", Base.class, int.class);
        Method leaf = method(Base.class, "noReceiver", int.class);
        Method privateLeaf = method(Base.class, "privateLeaf", int.class);
        check(WB.enqueueMethodForCompilation(caller, 1)); await(caller, 1);
        check(WB.enqueueMethodForCompilation(leaf, 4)); await(leaf, 4);
        check(WB.enqueueMethodForCompilation(privateLeaf, 3)); await(privateLeaf, 3);
        Base base = new Base(9); Child sub = new Child(11); Side side = new Side(); Face face = new FaceImpl();
        Inherited inherited = new Inherited(13);
        Object token = new Object(); base.ref = token;
        for (int i = 0; i < 64; i++) {
            check(interpretedCaller(base, i) == 9 + i*3);
            check(compiledCaller(base, i) == 9 + i*3);
            check(base.entry(token, -4, 2, 3, 4, 5, 6, 7, (byte)-7, (char)65535, (short)-32768) == 32892);
            check(base.privateCall(i) == 18 + i && sub.superCall(i) == 12 + i);
            check(boundCall(side, base, i) == i+7 && base.throwingCall(side, i) == i+9);
            check(base.keepAfterGC(0) == token && base.manyReferences(base, token, 0) == token);
            check(nativeCall(base) == Base.class && base.coldCall(0) == 0);
            check(base.withHandler(i) == i+9);
            check(unboundCall(base, i) == 10+i*3 && interfaceCall(face, i) == i+19);
            check(inheritedFinal(inherited, i) == i+7 && inheritedNonfinal(inherited, i) == 13+i*3);
            Thread.sleep(1);
        }
        Method[] roots = {
            plain,
            method(Base.class, "entry", Object.class, int.class, int.class, int.class, int.class,
                   int.class, int.class, int.class, byte.class, char.class, short.class),
            method(Base.class, "privateCall", int.class), method(Child.class, "superCall", int.class),
            method(DirectBaselineInstanceTest.class, "boundCall", Side.class, Base.class, int.class),
            method(Base.class, "throwingCall", Side.class, int.class), method(Base.class, "keepAfterGC", int.class),
            method(Base.class, "manyReferences", Object.class, Object.class, int.class),
            method(DirectBaselineInstanceTest.class, "inheritedFinal", Inherited.class, int.class),
            method(DirectBaselineInstanceTest.class, "nativeCall", Object.class)
        };
        for (Method root : roots) await(root, 1);
        check(initializations == 0);
        // Ordinary C1 must remain able to compile unsupported handler methods.
        Method handler = method(Base.class, "withHandler", int.class);
        check(WB.getMethodCompilationLevel(handler) == 0 && WB.isMethodCompilable(handler, 3));
        check(WB.enqueueMethodForCompilation(handler, 3)); await(handler, 3);
        check(base.withHandler(-1) == -1);
        for (Method dynamic : new Method[]{
                method(DirectBaselineInstanceTest.class, "unboundCall", Base.class, int.class),
                method(DirectBaselineInstanceTest.class, "interfaceCall", Face.class, int.class),
                method(DirectBaselineInstanceTest.class, "inheritedNonfinal", Inherited.class, int.class)}) {
            await(dynamic, 1);
            check(WB.enqueueMethodForCompilation(dynamic, 3)); await(dynamic, 3);
        }
        check(unboundCall(other, 4) == 18 && interfaceCall(face, 3) == 22);
        check(base.coldCall(1) == 73 && initializations == 1);

        // Null must throw even for a final C2 callee that never reads this.
        int before = side.before;
        try { boundCall(side, null, 4); throw new AssertionError("missing receiver null check"); }
        catch (NullPointerException expected) { check(side.before == before+1); }
        int inside = side.inside; before = side.before;
        try { base.throwingCall(side, -1); throw new AssertionError("missing callee exception"); }
        catch (IllegalStateException expected) {
            check(side.before == before+1 && side.inside == inside+1);
            check(expected.getStackTrace()[1].getMethodName().equals("throwingCall"));
        }
        Method thrower = method(Base.class, "mayThrow", Side.class, int.class);
        for (int level : new int[]{3, 4}) {
            check(WB.enqueueMethodForCompilation(thrower, level)); await(thrower, level);
            before = side.before; inside = side.inside;
            try { base.throwingCall(side, -1); throw new AssertionError("missing compiled callee exception"); }
            catch (IllegalStateException expected) {
                check(side.before == before+1 && side.inside == inside+1);
                check(expected.getStackTrace()[1].getMethodName().equals("throwingCall"));
            }
        }
        try { nativeCall(null); throw new AssertionError("missing native receiver null check"); }
        catch (NullPointerException expected) {}
        for (int i = 0; i < 4; i++) {
            Object fresh = new byte[8192]; base.ref = fresh;
            check(base.keepAfterGC(1) == fresh && base.ref == null && base.value == 9);
            Object last = new byte[8192];
            check(base.manyReferences(fresh, last, 1) == last);
        }
        // Exercise a compiled virtual caller's unverified-entry/IC miss path.
        check(compiledCaller(base, 17) == 60);
        Object[] linkedCaller = WB.getNMethod(caller, false);
        check(compiledCaller(other, 4) == 17);
        check(compiledCaller(base, 19) == 66);
        check(linkedCaller[3].equals(WB.getNMethod(caller, false)[3]));
        int[] virtualResult = {0};
        Thread virtual = Thread.ofVirtual().start(() -> virtualResult[0] = base.privateCall(2));
        virtual.join();
        check(virtualResult[0] == 20);
        // Replacing a direct receiver entry must also repair linked callers.
        check(WB.enqueueMethodForCompilation(plain, 4)); await(plain, 4);
        check(compiledCaller(base, 23) == 78 && interpretedCaller(base, 23) == 78);
        check(WB.getMethodCompilationLevel(caller) == 1);
        System.out.println("DIRECT_INSTANCE_OK");
    }
    public static void main(String[] args) throws Exception {
        if (args.length != 0) { child(); return; }
        for (String gc : new String[]{"-XX:+UseSerialGC", "-XX:+UseG1GC"}) {
            OutputAnalyzer out = ProcessTools.executeTestJava("-Xbootclasspath/a:.",
                "-XX:+UnlockExperimentalVMOptions", "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI",
                "-XX:+UseDirectBaseline", "-XX:-DirectBaselineDedicatedWorker", "-XX:+TraceDirectBaseline",
                "-XX:HeapBaseMinAddress=32g", "-Xmx64m", gc,
                "-XX:CompileCommand=dontinline,DirectBaselineInstanceTest*::*",
                "-XX:CompileCommand=exclude,DirectBaselineInstanceTest::interpretedCaller",
                "-XX:CompileCommand=exclude,DirectBaselineInstanceTest$Base::collectMany",
                DirectBaselineInstanceTest.class.getName(), "child");
            out.shouldHaveExitValue(0).shouldContain("DIRECT_INSTANCE_OK")
                .shouldContain("direct install plain(I)I")
                .shouldContain("direct install entry(")
                .shouldContain("direct install privateCall(I)I")
                .shouldContain("direct install superCall(I)I")
                .shouldContain("direct install boundCall(")
                .shouldContain("direct install throwingCall(")
                .shouldContain("direct install keepAfterGC(")
                .shouldContain("direct install manyReferences(")
                .shouldContain("direct install nativeCall(")
                .shouldContain("direct install inheritedFinal(")
                .shouldNotContain("direct install withHandler(I)I")
                .shouldContain("direct install unboundCall(")
                .shouldContain("direct install interfaceCall(")
                .shouldContain("direct install inheritedNonfinal(")
                .shouldNotContain("direct install coldCall(I)I")
                .shouldNotContain("direct compile DirectBaselineInstanceTest$Base <init>");
        }
    }
}
