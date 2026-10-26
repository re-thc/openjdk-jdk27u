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
 * @summary C2 may bypass both installed and pending direct baseline work
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & (os.arch == "amd64" | os.arch == "x86_64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockExperimentalVMOptions -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:HeapBaseMinAddress=32g -XX:+UseDirectBaseline -XX:+TraceDirectBaseline -XX:CompileCommand=dontinline,DirectBaselinePolicyTest::* DirectBaselinePolicyTest
 */
import java.lang.reflect.Method;
import jdk.test.whitebox.WhiteBox;

public class DirectBaselinePolicyTest {
    static final WhiteBox WB = WhiteBox.getWhiteBox();
    static class Box { int value; }
    static int installed(Box b, int x) { b.value = x; return b.value + x; }
    static byte[] identity(byte[] a) { return a; }
    static int optimized(int from, byte[] a, int length) {
        if (from >= 0 && length > from) return a[from] + a[length-1];
        return 0;
    }
    static int abi(byte[] a) { a = identity(a); return optimized(0, a, a.length); }
    static long unsupported(long x) { return x * 17; }
    static int pending(Box b, int x) { b.value = x; return b.value + x; }
    static void check(boolean condition) { if (!condition) throw new AssertionError(); }
    static void await(Method method, int level) throws Exception {
        long limit = System.nanoTime() + 20_000_000_000L;
        while (WB.getMethodCompilationLevel(method) != level) {
            if (System.nanoTime() > limit) throw new AssertionError("missing level " + level + ": " + method);
            Thread.sleep(10);
        }
    }
    public static void main(String[] args) throws Exception {
        Method installed = DirectBaselinePolicyTest.class.getDeclaredMethod("installed", Box.class, int.class);
        Method pending = DirectBaselinePolicyTest.class.getDeclaredMethod("pending", Box.class, int.class);
        Method optimized = DirectBaselinePolicyTest.class.getDeclaredMethod("optimized", int.class, byte[].class, int.class);
        Method abi = DirectBaselinePolicyTest.class.getDeclaredMethod("abi", byte[].class);
        check(WB.enqueueMethodForCompilation(optimized, 4));
        await(optimized, 4);
        byte[] array = {7, 11, 13};
        for (int i=0; i<64; i++) { check(abi(array)==20); Thread.sleep(1); }
        await(abi, 1);
        for (int i=0; i<64; i++) check(abi(array)==20);
        Method unsupported = DirectBaselinePolicyTest.class.getDeclaredMethod("unsupported", long.class);
        Box box = new Box();
        for (int i=0; i<64; i++) { check(installed(box,i)==2*i); Thread.sleep(1); }
        await(installed, 1); // below ordinary C1 admission, so this must be the direct nmethod
        check(WB.enqueueMethodForCompilation(installed, 4));
        await(installed, 4);
        WB.lockCompilation();
        try {
            for (int i=0; i<64; i++) check(pending(box,i)==2*i);
            // A baseline task must not own the ordinary queue bit.
            check(!WB.isMethodQueuedForCompilation(pending));
            check(WB.enqueueMethodForCompilation(pending, 4));
        } finally {
            WB.unlockCompilation();
        }
        await(pending, 4);
        for (int i=0; i<64; i++) check(unsupported(i)==i*17L);
        check(WB.isMethodCompilable(unsupported, 3));
        check(WB.enqueueMethodForCompilation(unsupported, 3));
        await(unsupported, 3);
        for (int i=0; i<1000; i++) check(pending(box,i)==2*i && installed(box,i)==2*i);
        check(WB.getMethodCompilationLevel(installed)==4 && WB.getMethodCompilationLevel(pending)==4);
        System.out.println("DIRECT_BYPASS_OK");
    }
}
