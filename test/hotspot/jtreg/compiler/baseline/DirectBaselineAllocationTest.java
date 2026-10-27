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
 * @summary Direct allocation preserves oop results, constructor aliases, GC roots and exceptional continuations
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & (os.arch == "amd64" | os.arch == "x86_64")
 * @modules java.management jdk.management
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver DirectBaselineAllocationTest
 */
import java.lang.management.ManagementFactory;
import java.lang.reflect.Executable;
import java.lang.reflect.Method;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class DirectBaselineAllocationTest {
    static class Side { int before, calls; Object token, received; }
    static class Product {
        final Object token;
        final int value;
        Product(Side side, Object token, int value, int mode) {
            this.token = token; this.value = value;
            side.calls++; side.received = this;
            if (mode != 0) System.gc();
            if (mode == 2) throw new IllegalArgumentException("expected");
        }
    }
    static int initialized;
    static class Cold { static int value = ++initialized; }
    static int neverCalls, failures;
    static class Never { static int value = ++initialized; Never() { neverCalls++; } }
    static class Unloaded { static int value = ++initialized; }
    static class InitFailure { static int value = failInit(); }
    static int failInit() { failures++;throw new IllegalStateException("expected init failure"); }
    static boolean resolveFailure(Object value) { return value instanceof InitFailure; }
    static Object failingPath(int use) { if(use==0)return null;return new InitFailure(); }
    static Object coldArray(int use,int n) { if(use==0)return null;return new Unloaded[n]; }
    static Product make(Side side, Object token, int value, int mode) {
        side.before++;
        return new Product(side, token, value, mode);
    }
    static int[] ints(int n) { return new int[n]; }
    static boolean[] booleans(int n) { return new boolean[n]; }
    static byte[] bytes(int n) { return new byte[n]; }
    static char[] chars(int n) { return new char[n]; }
    static short[] shorts(int n) { return new short[n]; }
    static long[] longs(int n) { return new long[n]; }
    static float[] floats(int n) { return new float[n]; }
    static double[] doubles(int n) { return new double[n]; }
    static Cold[] references(int n) { return new Cold[n]; }
    static Object[][] matrix(int n) { return new Object[n][]; }
    static Object retain(Object token, Object array) { if (token == null) throw new AssertionError(); return array; }
    static Object[] nested(Side side, int n) { return (Object[])retain(side.token, new Object[n]); }
    static Object coldPath(int use) { if (use == 0) return null; return new Never(); }
    static boolean resolveNever(Object x) { return x instanceof Never; }
    static void check(boolean b) { if (!b) throw new AssertionError(); }
    static void await(WhiteBox wb, Executable m, int level) throws Exception {
        long end = System.nanoTime()+20_000_000_000L;
        while (wb.getMethodCompilationLevel(m) != level) {
            if (System.nanoTime() > end) throw new AssertionError("missing level "+level+": "+m);
            Thread.sleep(5);
        }
    }
    static void child() throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        Side side = new Side(); Object token = new Object(); side.token = token;
        var ctor = Product.class.getDeclaredConstructor(Side.class, Object.class, int.class, int.class);
        check(wb.enqueueMethodForCompilation(ctor, 3)); await(wb, ctor, 3);
        String[] names = {"ints", "booleans", "bytes", "chars", "shorts", "longs", "floats", "doubles", "references", "matrix"};
        for (int i=0; i<64; i++) {
            Product p = make(side, token, i, 0);
            check(p.token == token && p.value == i && side.received == p);
            check(ints(3).length == 3 && booleans(3).length == 3 && bytes(3).length == 3);
            check(chars(3).length == 3 && shorts(3).length == 3 && longs(3).length == 3);
            check(floats(3).length == 3 && doubles(3).length == 3);
            check(references(3).length == 3 && matrix(3).length == 3 && nested(side,3).length == 3);
            Thread.sleep(1);
        }
        Method make = DirectBaselineAllocationTest.class.getDeclaredMethod("make", Side.class, Object.class, int.class, int.class);
        await(wb, make, 1);
        for (String name : names) await(wb, DirectBaselineAllocationTest.class.getDeclaredMethod(name,int.class),1);
        Method nested = DirectBaselineAllocationTest.class.getDeclaredMethod("nested", Side.class,int.class);
        await(wb,nested,1);
        check(initialized == 0); // anewarray must not initialize its component.
        Product p = make(side,token,77,1);
        check(p.token == token && p.value == 77 && side.received == p);
        int before = side.before, calls = side.calls;
        try { make(side,token,78,2); throw new AssertionError(); }
        catch (IllegalArgumentException expected) {
            check(side.before == before+1 && side.calls == calls+1);
            check(expected.getStackTrace()[1].getMethodName().equals("make"));
            check(((Product)side.received).token == token && ((Product)side.received).value == 78);
        }
        // Ordinary code replacement must retain the same linked constructor behavior.
        check(wb.enqueueMethodForCompilation(ctor,4)); await(wb,ctor,4);
        check(make(side,token,79,1).value == 79 && wb.getMethodCompilationLevel(make) == 1);
        try { ints(-1); throw new AssertionError(); }
        catch (NegativeArraySizeException expected) { check(expected.getStackTrace()[0].getMethodName().equals("ints")); }
        try { references(-1); throw new AssertionError(); }
        catch (NegativeArraySizeException expected) { check(expected.getStackTrace()[0].getMethodName().equals("references")); }
        try { ints(Integer.MAX_VALUE); throw new AssertionError(); }
        catch (OutOfMemoryError expected) { check(expected.getStackTrace()[0].getMethodName().equals("ints")); }
        // Resolve without initializing, then ensure cold instance allocation falls back.
        check(!resolveNever(token) && initialized == 0);
        Method cold = DirectBaselineAllocationTest.class.getDeclaredMethod("coldPath",int.class);
        check(!resolveFailure(token));
        for(int i=0;i<64;i++) {
            check(coldPath(0)==null && coldArray(0,3)==null && failingPath(0)==null);
            Thread.sleep(1);
        }
        await(wb,cold,1);
        await(wb,DirectBaselineAllocationTest.class.getDeclaredMethod("coldArray",int.class,int.class),1);
        await(wb,DirectBaselineAllocationTest.class.getDeclaredMethod("failingPath",int.class),1);
        check(initialized==0 && failures==0);
        check(coldPath(1) instanceof Never && initialized==1 && neverCalls==1);
        Object coldResult=coldArray(1,3);
        check(java.lang.reflect.Array.getLength(coldResult)==3 && initialized==1);
        try { coldArray(1,-1);throw new AssertionError(); } catch(NegativeArraySizeException expected) {}
        try { failingPath(1);throw new AssertionError(); } catch(ExceptionInInitializerError expected) {}
        try { failingPath(1);throw new AssertionError(); } catch(NoClassDefFoundError expected) {}
        check(failures==1);
        // Runtime1 explicitly deoptimizes array-allocation returns under this debug flag.
        if (jdk.test.lib.Platform.isDebugBuild()) {
            com.sun.management.ThreadMXBean bean = (com.sun.management.ThreadMXBean)ManagementFactory.getThreadMXBean();
            bean.setThreadAllocatedMemoryEnabled(true);
            long tid = Thread.currentThread().threadId();
            for (int i=0;i<20;i++) bean.getThreadAllocatedBytes(tid);
            wb.setBooleanVMFlag("TraceDeoptimization",true);
            wb.setBooleanVMFlag("DeoptimizeALot",true);
            try {
                long beforeAllocation=bean.getThreadAllocatedBytes(tid);
                Object instance=coldPath(1);
                long bytes=bean.getThreadAllocatedBytes(tid)-beforeAllocation;
                check(instance instanceof Never && initialized==1 && neverCalls==2);
                check(bytes==wb.getObjectSize(instance));
            } finally { wb.setBooleanVMFlag("DeoptimizeALot",false); }
            System.out.println("DIRECT_INSTANCE_RETURN_DEOPT_OK");
            long allocatedBefore = bean.getThreadAllocatedBytes(tid);
            Object[] array;
            wb.setBooleanVMFlag("DeoptimizeALot",true);
            try { array = nested(side,262144); }
            finally {
                wb.setBooleanVMFlag("DeoptimizeALot",false);
                wb.setBooleanVMFlag("TraceDeoptimization",false);
            }
            long allocated = bean.getThreadAllocatedBytes(tid)-allocatedBefore;
            check(array.length == 262144 && side.token == token);
            // Reexecuting the allocation would consume two arrays of this size.
            check(allocated < wb.getObjectSize(array)*3/2);
            System.out.println("DIRECT_ALLOCATION_RETURN_DEOPT_OK");
        }
        System.out.println("DIRECT_ALLOCATION_OK");
    }
    public static void main(String[] args) throws Exception {
        if(args.length != 0) { child(); return; }
        for(String gc : new String[]{"-XX:+UseSerialGC", "-XX:+UseG1GC"}) {
            OutputAnalyzer out = ProcessTools.executeTestJava("-Xbootclasspath/a:.",
                "-XX:+UnlockExperimentalVMOptions", "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI",
                "-XX:+UseDirectBaseline", "-XX:-DirectBaselineDedicatedWorker", "-XX:+TraceDirectBaseline",
                "-XX:HeapBaseMinAddress=32g", "-Xmx64m", gc,
                "-XX:CompileCommand=dontinline,DirectBaselineAllocationTest*::*",
                DirectBaselineAllocationTest.class.getName(), "child");
            out.shouldHaveExitValue(0).shouldContain("DIRECT_ALLOCATION_OK")
                .shouldContain("direct install make(").shouldContain("direct install nested(")
                .shouldContain("direct install coldPath(").shouldContain("direct install coldArray(")
                .shouldContain("direct install failingPath(");
            if (jdk.test.lib.Platform.isDebugBuild()) {
                out.shouldContain("DIRECT_ALLOCATION_RETURN_DEOPT_OK").shouldContain("DIRECT_INSTANCE_RETURN_DEOPT_OK")
                    .shouldContain("SAVED OOP RESULT");
            }
        }
    }
}
