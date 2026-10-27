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
 * @summary Exercise direct baseline frames, references, calls, guards and tier handoff
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & (os.arch == "amd64" | os.arch == "x86_64")
 * @library /test/lib
 * @run driver DirectBaselineTest
 */
import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.lang.constant.MethodTypeDesc;
import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import static java.lang.constant.ConstantDescs.*;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class DirectBaselineTest {
    static class Box { int value; volatile int flag; Object ref; volatile Object published; }
    static volatile Object sink;
    static int leaf(int x) { return (x * 17) ^ (x >>> 3); }
    static int branch(int x) { if (x < 0) return -x; return x + 11; }
    static int fields(Box b, Object o, int x) { b.ref = o; b.published = o; b.flag = x; b.value = x + 1; return b.value + b.flag; }
    static Object reference(Box b) { return b.ref; }
    static int arrays(int[] a, int i, int x) { a[i] = x; return a.length + a[i]; }
    static Object objects(Object[] a, int i) { return a[i]; }
    static int narrow(byte[] a, char[] b, short[] c, int i) { return a[i] + b[i] + c[i]; }
    static int call(int x) { return leaf(x) + branch(x); }
    static int exceptionAfterStore(Box b, int[] a) { b.value = b.value + 1; return a[0]; }
    static int mayThrow(int x) { if (x < 0) throw new IllegalStateException("expected"); return x; }
    static int exceptionFromCall(Box b, int x) { b.value = b.value + 1; return mayThrow(x); }
    static class ColdTarget { static final int value = initialize(); static int initialize() { return 73; } static int read() { return value; } }
    static int coldCall(int x) { if (x == 0) return 0; return ColdTarget.read(); }
    static class Statics {
        static boolean bool;
        static byte small;
        static char character;
        static short signed;
        static int number;
        static Object ref;
        static Box published;
        static volatile int ready;
    }
    static int staticNarrow() { return (Statics.bool ? 1 : 0) + Statics.small + Statics.character + Statics.signed + Statics.number; }
    static Object staticReference() { return Statics.ref; }
    static Object staticAcrossGC(int collect) { Object value = Statics.ref; if (collect != 0) clearStaticAndGC(); return value; }
    static void clearStaticAndGC() { Statics.ref = null; System.gc(); }
    static int staticAcquire() { return Statics.ready == 0 ? 0 : Statics.published.value; }
    static int coldStaticInitializations;
    static class ColdStatic { static int value = initialize(); static int initialize() { coldStaticInitializations++; return 91; } }
    static int coldStatic(int use) { return use == 0 ? 0 : ColdStatic.value; }
    static int throwingStaticInitializations;
    static class ThrowingStatic {
        static int value = initialize();
        static int initialize() { throwingStaticInitializations++; throw new IllegalStateException("expected static initialization failure"); }
    }
    static int coldThrowingStatic(int use) { return use == 0 ? 0 : ThrowingStatic.value; }
    static int childInitializations;
    static class StaticParent { static int inherited = 73; }
    static class StaticChild extends StaticParent { static int marker = initialize(); static int initialize() { childInitializations++; return 1; } }
    static int inheritedStatic() { return StaticChild.inherited; }
    static void gc() { System.gc(); }
    static Object acrossGC(Object o) { gc(); return o; }
    static Object acrossYield(Object o) { Thread.yield(); return o; }
    static int loop(int n) { int r = 0; for (int i = 0; i < n; i++) r += i; return r; }
    static double unsupportedDouble(double x) { return x * 13; }
    static Object allocation() { return new Object(); }
    static int handler(int divisor) { try { return 9 / divisor; } catch (ArithmeticException expected) { return -1; } }
    static synchronized int unsupportedMonitor(int x) { return x + 1; }
    static int manyArgs(int a, int b, int c, int d, int e, int f, int g, int h) { return a+b+c+d+e+f+g+h; }
    static int stackCall(int x) { return manyArgs(x, 2, 3, 4, 5, 6, 7, 8); }
    static void check(boolean ok) { if (!ok) throw new AssertionError(); }
    static void exercise(Box box, Object ref, int i) {
        int[] a = {0, 0, 0}; Object[] o = {ref};
        check(branch(-7) == 7 && branch(9) == 20);
        check(fields(box, ref, i) == 2*i+1);
        check(reference(box) == ref && box.published == ref);
        check(arrays(a, 1, i) == i+3 && a[1] == i);
        check(objects(o, 0) == ref);
        check(narrow(new byte[]{-1}, new char[]{65535}, new short[]{-32768}, 0) == 32766);
        check(call(i) == leaf(i) + branch(i));
        check(stackCall(i) == i+35);
        check(exceptionAfterStore(box, a) == 0);
        check(exceptionFromCall(box, i) == i);
        check(coldCall(0) == 0);
    }
    static void narrowReturns() throws Throwable {
        ClassDesc owner = ClassDesc.of("NarrowBaselineGenerated");
        ClassDesc[] returns = {CD_boolean, CD_byte, CD_char, CD_short};
        byte[] bytes = ClassFile.of().build(owner, builder -> {
            builder.withFlags(ClassFile.ACC_PUBLIC);
            for (int i = 0; i < returns.length; i++) {
                String raw = "raw"+i;
                MethodTypeDesc type = MethodTypeDesc.of(returns[i], CD_int);
                builder.withMethodBody(raw, type, ClassFile.ACC_PUBLIC | ClassFile.ACC_STATIC,
                    code -> code.iload(0).ireturn());
                builder.withMethodBody("call"+i, MethodTypeDesc.of(CD_int, CD_int), ClassFile.ACC_PUBLIC | ClassFile.ACC_STATIC,
                    code -> code.iload(0).invokestatic(owner, raw, type).ireturn());
            }
        });
        Class<?> generated = MethodHandles.lookup().defineClass(bytes);
        MethodHandle[] calls = new MethodHandle[4];
        for (int i = 0; i < 4; i++) calls[i] = MethodHandles.lookup().findStatic(generated, "call"+i,
            java.lang.invoke.MethodType.methodType(int.class, int.class));
        for (int r = 0; r < 2; r++) {
            for (int x = -32; x < 32; x++) {
                int value = x*1001;
                check((int)calls[0].invokeExact(value) == (value & 1));
                check((int)calls[1].invokeExact(value) == (byte)value);
                check((int)calls[2].invokeExact(value) == (char)value);
                check((int)calls[3].invokeExact(value) == (short)value);
            }
            Thread.sleep(200);
        }
    }
    static void workload() throws Throwable {
        narrowReturns();
        Box box = new Box(); Object ref = new Object();
        Statics.bool = true; Statics.small = -7; Statics.character = 65535; Statics.signed = -32768; Statics.number = 41;
        Statics.ref = ref;
        StaticParent.inherited = 73;
        for (int i = 0; i < 64; i++) {
            check(staticNarrow() == 32802 && staticReference() == ref && staticAcquire() == 0);
            check(staticAcrossGC(0) == ref && coldStatic(0) == 0 && coldThrowingStatic(0) == 0 && inheritedStatic() == 73);
        }
        Thread.sleep(500);
        check(coldStaticInitializations == 0 && throwingStaticInitializations == 0 && childInitializations == 0);
        Statics.number = 42; Statics.ref = new byte[4096]; StaticParent.inherited = 89;
        System.gc();
        check(staticNarrow() == 32803 && staticReference() == Statics.ref && inheritedStatic() == 89);
        Statics.ref = new byte[8192]; // fresh reference must survive the GC in the compiled activation
        Object staticExpected = Statics.ref;
        check(staticAcrossGC(1) == staticExpected && staticReference() == null);
        try { coldThrowingStatic(1); throw new AssertionError("missing static initialization failure"); }
        catch (ExceptionInInitializerError expected) { check(expected.getCause() instanceof IllegalStateException); }
        try { coldThrowingStatic(1); throw new AssertionError("missing erroneous-class failure"); }
        catch (NoClassDefFoundError expected) {}
        check(throwingStaticInitializations == 1);
        Thread publisher = new Thread(() -> { Box value = new Box(); value.value = 127; Statics.published = value; Statics.ready = 1; });
        publisher.start();
        long publicationLimit = System.nanoTime() + 10_000_000_000L;
        while (staticAcquire() == 0) {
            if (System.nanoTime() > publicationLimit) throw new AssertionError("static volatile publication");
        }
        publisher.join();
        check(staticAcquire() == 127 && coldStatic(1) == 91 && coldStaticInitializations == 1 && childInitializations == 0);
        for (int i = 0; i < 64; i++) {
            exercise(box, ref, i);
            check(loop(20) == 190);
            check(unsupportedDouble(i) == i*13L);
            check(allocation() != null && handler(i + 1) == 9 / (i + 1));
            check(unsupportedMonitor(i) == i+1);
        }
        Thread.sleep(500); // let the early queue finish while below ordinary C1 admission
        for (int i = 0; i < 128; i++) check(allocation() != null); // cross the next early notification
        check(handler(0) == -1);
        for (int i = 0; i < 32; i++) exercise(box, ref, i);
        int before = box.value;
        try { exceptionAfterStore(box, null); throw new AssertionError(); }
        catch (NullPointerException expected) { check(box.value == before+1); }
        before = box.value;
        try { exceptionFromCall(box, -1); throw new AssertionError(); }
        catch (IllegalStateException expected) {
            check(box.value == before+1);
            check(expected.getStackTrace()[1].getMethodName().equals("exceptionFromCall"));
        }
        check(coldCall(1) == 73);
        try { arrays(new int[1], -1, 123); throw new AssertionError(); }
        catch (ArrayIndexOutOfBoundsException expected) {}
        try { objects(null, 0); throw new AssertionError(); }
        catch (NullPointerException expected) {}
        for (int i = 0; i < 40; i++) check(acrossGC(ref) == ref);
        Thread.sleep(200);
        for (int i = 0; i < 8; i++) {
            Object fresh = new byte[2048];
            check(acrossGC(fresh) == fresh);
        }
        for (int i = 0; i < 64; i++) check(acrossYield(ref) == ref);
        Thread.sleep(200);
        Thread virtual = Thread.ofVirtual().start(() -> { for (int i=0; i<32; i++) check(acrossYield(ref) == ref); });
        virtual.join();
        for (int i = 0; i < 50_000; i++) {
            exercise(box, ref, i);
            check(loop(20) == 190);
            check(unsupportedDouble(i) == i*13L);
            check(unsupportedMonitor(i) == i+1);
        }
        Thread thread = Thread.ofVirtual().start(() -> { for (int i=0; i<1000; i++) check(call(i) == leaf(i)+branch(i)); });
        thread.join();
        sink = box;
        System.out.println("DIRECT_CORRECTNESS_OK");
    }
    public static void main(String[] args) throws Throwable {
        if (args.length != 0) { workload(); return; }
        for (String gc : new String[]{"-XX:+UseSerialGC", "-XX:+UseG1GC"}) {
            OutputAnalyzer output = ProcessTools.executeTestJava("-XX:+UnlockExperimentalVMOptions",
                "-XX:+UnlockDiagnosticVMOptions", "-XX:+UseDirectBaseline", "-XX:+TraceDirectBaseline",
                gc, "-Xmx64m", "-XX:CompileCommand=dontinline,DirectBaselineTest::*",
                DirectBaselineTest.class.getName(), "child");
            output.shouldHaveExitValue(0).shouldContain("DIRECT_CORRECTNESS_OK")
                .shouldContain("direct install arrays([III)I")
                .shouldContain("direct install fields(")
                .shouldContain("direct install call(I)I")
                .shouldContain("direct install acrossGC(")
                .shouldContain("direct install exceptionFromCall(")
                .shouldContain("direct install staticNarrow()I")
                .shouldContain("direct install staticReference()Ljava/lang/Object;")
                .shouldContain("direct install staticAcrossGC(I)Ljava/lang/Object;")
                .shouldContain("direct install staticAcquire()I")
                .shouldContain("direct install inheritedStatic()I")
                .shouldNotContain("direct install coldStatic(I)I")
                .shouldNotContain("direct install coldThrowingStatic(I)I");
            output.shouldContain("direct preflight DirectBaselineTest unsupportedDouble(D)D")
                .shouldContain("direct install handler(I)I")
                .shouldContain("direct install allocation()Ljava/lang/Object;");
            // PolicyTest controls a direct-to-C2 linked-call handoff explicitly.
        }
    }
}
