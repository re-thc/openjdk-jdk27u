/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */
/*
 * @test
 * @bug 8391643
 * @summary Check C2 interface/array merge semantics after scoped interface-set scratch allocation
 * @requires vm.compiler2.enabled
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *                   -XX:-TieredCompilation -XX:-BackgroundCompilation -Xbatch
 *                   -XX:CompileThreshold=1000000000
 *                   -XX:CompileCommand=compileonly,compiler.types.TestInterfaceSetScratch::merge
 *                   -XX:CompileCommand=compileonly,compiler.types.TestInterfaceSetScratch::arrays
 *                   compiler.types.TestInterfaceSetScratch
 */
package compiler.types;

import java.lang.reflect.Method;
import jdk.test.lib.Utils;
import jdk.test.whitebox.WhiteBox;

public class TestInterfaceSetScratch {
    interface I0 { int value(); }
    interface I1 { }
    interface I2 { }
    interface I3 { }
    interface I4 { }
    interface I5 { }
    static final class A implements I0, I1, I2, I3 {
        public int value() { return 1; }
    }
    static final class B implements I0, I2, I4, I5 {
        public int value() { return 2; }
    }

    public static int merge(A a, B b, boolean chooseA) {
        I0 value = chooseA ? a : b;
        if (value == null) return -1;
        int result = value.value();
        if (value instanceof I1) result += 1;
        if (value instanceof I2) result += 2;
        if (value instanceof I3) result += 3;
        if (value instanceof I4) result += 4;
        if (value instanceof I5) result += 5;
        return result;
    }

    public static int arrays(A[] a, B[] b, boolean chooseA) {
        I0[] values = chooseA ? a : b;
        return values[0].value();
    }

    private static void check(A a, B b, A[] as, B[] bs) {
        if (merge(a, b, true) != 7 || merge(a, b, false) != 13
                || merge(null, b, true) != -1 || merge(a, null, false) != -1
                || arrays(as, bs, true) != 1 || arrays(as, bs, false) != 2) {
            throw new AssertionError("Interface/array merge result");
        }
    }

    public static void main(String[] args) throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        A a = new A();
        B b = new B();
        A[] as = {a};
        B[] bs = {b};
        for (int i = 0; i < 10000; i++) check(a, b, as, bs);
        Method merge = TestInterfaceSetScratch.class.getDeclaredMethod("merge", A.class, B.class, boolean.class);
        Method arrays = TestInterfaceSetScratch.class.getDeclaredMethod("arrays", A[].class, B[].class, boolean.class);
        for (Method method : new Method[] {merge, arrays}) {
            if (!wb.enqueueMethodForCompilation(method, 4)
                    || !Utils.waitForCondition(() -> wb.isMethodCompiled(method, false), 10000)
                    || wb.getMethodCompilationLevel(method, false) != 4) {
                throw new AssertionError("Regular C2 compilation required: " + method);
            }
        }
        for (int i = 0; i < 10000; i++) check(a, b, as, bs);
        for (Method method : new Method[] {merge, arrays}) {
            if (!wb.isMethodCompiled(method, false) || wb.getMethodCompilationLevel(method, false) != 4) {
                throw new AssertionError("Lost regular C2 compilation: " + method);
            }
        }
    }
}
