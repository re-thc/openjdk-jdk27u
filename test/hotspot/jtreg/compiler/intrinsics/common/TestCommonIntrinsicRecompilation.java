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
 * @summary A failed common intrinsic does not repeatedly invalidate its C1 caller
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @modules java.base/jdk.internal.util
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics -XX:CompileCommand=inline,jdk.internal.util.ArraysSupport::hashCode compiler.intrinsics.common.TestCommonIntrinsicRecompilation 1
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics -XX:CompileCommand=inline,jdk.internal.util.ArraysSupport::hashCode compiler.intrinsics.common.TestCommonIntrinsicRecompilation 3
 */

package compiler.intrinsics.common;

import java.lang.reflect.Method;
import jdk.internal.util.ArraysSupport;
import jdk.test.whitebox.WhiteBox;

public class TestCommonIntrinsicRecompilation {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();
    private static final int[] INPUT = new int[64];

    public static int hash(int[] input) { return ArraysSupport.hashCode(input, 0, 64, 1); }
    public static int add(int input) { return Math.addExact(input, 1); }
    public static long divide(long input) { return Long.divideUnsigned(123, input); }

    private static void call(String name, boolean rejected) {
        switch (name) {
            case "hash" -> hash(rejected ? null : INPUT);
            case "add" -> add(rejected ? Integer.MAX_VALUE : 42);
            case "divide" -> divide(rejected ? 0 : 7);
            default -> throw new AssertionError(name);
        }
    }

    private static void reject(String name) {
        try {
            call(name, true);
            throw new AssertionError("guard must fail");
        } catch (NullPointerException e) {
            if (!name.equals("hash")) throw e;
        } catch (ArithmeticException e) {
            if (name.equals("hash")) throw e;
        }
    }

    private static void compile(Method method, int level) {
        if (!WB.enqueueMethodForCompilation(method, level) || WB.getMethodCompilationLevel(method) != level) {
            throw new AssertionError("C1 compilation failed: " + method);
        }
    }

    public static void main(String[] args) throws Exception {
        int level = Integer.parseInt(args[0]);
        for (String name : new String[] {"hash", "add", "divide"}) {
            Class<?> type = name.equals("hash") ? int[].class : name.equals("add") ? int.class : long.class;
            Method method = TestCommonIntrinsicRecompilation.class.getDeclaredMethod(name, type);
            WB.testSetDontInlineMethod(method, true);
            for (int i = 0; i < 20_000; i++) call(name, false);
            WB.deoptimizeMethod(method);
            WB.clearMethodState(method);
            compile(method, level);
            int before = WB.getMethodTrapCount(method, "none");
            reject(name);
            int after = WB.getMethodTrapCount(method, "none");
            if (after != before + 1 || WB.isMethodCompiled(method)) {
                throw new AssertionError("expected one guarded deoptimization: " + name +
                        ", traps " + before + " -> " + after + ", compiled=" + WB.isMethodCompiled(method));
            }
            compile(method, level);
            for (int i = 0; i < 1_000; i++) {
                reject(name);
                call(name, false);
            }
            if (!WB.isMethodCompiled(method) || WB.getMethodTrapCount(method, "none") != after) {
                throw new AssertionError("guard failure caused recompile churn: " + name);
            }
        }
    }
}
