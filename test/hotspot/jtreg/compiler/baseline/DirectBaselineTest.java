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
    static void gc() { System.gc(); }
    static Object acrossGC(Object o) { gc(); return o; }
    static Object acrossYield(Object o) { Thread.yield(); return o; }
    static int unsupportedLoop(int n) { int r = 0; for (int i = 0; i < n; i++) r += i; return r; }
    static long unsupportedLong(long x) { return x * 13; }
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
        for (int i = 0; i < 64; i++) {
            exercise(box, ref, i);
            check(unsupportedLoop(20) == 190);
            check(unsupportedLong(i) == i*13L);
            check(unsupportedMonitor(i) == i+1);
        }
        Thread.sleep(500); // let the early queue finish while below ordinary C1 admission
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
            check(unsupportedLoop(20) == 190);
            check(unsupportedLong(i) == i*13L);
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
                .shouldContain("direct install exceptionFromCall(");
            // Profiling may retire a direct method before C1 replaces it.
            // PolicyTest controls a direct-to-C2 linked-call handoff explicitly.
        }
    }
}
