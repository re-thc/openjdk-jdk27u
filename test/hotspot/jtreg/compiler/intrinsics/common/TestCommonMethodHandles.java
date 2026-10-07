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
 * @summary Guarded linkTo targets preserve caller arguments, locals and exception handlers
 * @requires vm.compiler1.enabled
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonMethodHandles 1
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonMethodHandles 3
 */

package compiler.intrinsics.common;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.reflect.Method;
import jdk.test.whitebox.WhiteBox;

public class TestCommonMethodHandles {
    private static final MethodHandle ADD;
    private static final MethodHandle DIVIDE;
    static {
        try {
            ADD = MethodHandles.lookup().findStatic(Math.class, "addExact",
                    MethodType.methodType(int.class, int.class, int.class));
            DIVIDE = MethodHandles.lookup().findStatic(Long.class, "divideUnsigned",
                    MethodType.methodType(long.class, long.class, long.class));
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    public static long invoke(int left, int right, long dividend, long divisor, long live) throws Throwable {
        long saved = live ^ 0x123456789abcdefL;
        try {
            int sum = (int) ADD.invokeExact(left, right);
            long quotient = (long) DIVIDE.invokeExact(dividend, divisor);
            return saved ^ quotient ^ sum;
        } catch (ArithmeticException e) {
            // A shortened linkTo adapter frame must never replace these locals.
            return saved ^ left ^ right ^ dividend ^ divisor;
        }
    }

    private static void check(int left, int right, long dividend, long divisor, long live) throws Throwable {
        long sum = (long) left + right;
        long saved = live ^ 0x123456789abcdefL;
        long expected = sum < Integer.MIN_VALUE || sum > Integer.MAX_VALUE || divisor == 0
                ? saved ^ left ^ right ^ dividend ^ divisor
                : saved ^ Long.divideUnsigned(dividend, divisor) ^ (int) sum;
        if (invoke(left, right, dividend, divisor, live) != expected) throw new AssertionError("lost caller state");
    }

    public static void main(String[] args) throws Throwable {
        WhiteBox wb = WhiteBox.getWhiteBox();
        Method caller = TestCommonMethodHandles.class.getDeclaredMethod("invoke",
                int.class, int.class, long.class, long.class, long.class);
        wb.testSetDontInlineMethod(caller, true);
        for (int i = 0; i < 20_000; i++) check(i, 7, -1, 11, i);
        int level = Integer.parseInt(args[0]);
        if (!wb.enqueueMethodForCompilation(caller, level) || wb.getMethodCompilationLevel(caller) != level) {
            throw new AssertionError("caller must be compiled by C1");
        }
        for (int i = 0; i < 1_000; i++) {
            check(Integer.MAX_VALUE, 1, -1, 11, i);
            check(Integer.MIN_VALUE, -1, -1, 11, i);
            check(42, 7, Long.MIN_VALUE, 0, i);
            check(i, 7, -1, 11, i);
        }
    }
}
