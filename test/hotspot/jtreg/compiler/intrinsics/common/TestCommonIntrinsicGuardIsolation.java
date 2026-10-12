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
 * @test id=level1
 * @summary A failed C1 intrinsic guard leaves other call sites accelerated
 * @requires vm.compiler1.enabled
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @modules java.base/jdk.internal.util
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox jdk.test.whitebox.code.NMethod
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics -XX:CompileCommand=inline,jdk.internal.util.ArraysSupport::hashCode compiler.intrinsics.common.TestCommonIntrinsicGuardIsolation 1
 */

/*
 * @test id=level3
 * @summary C1 profiling retains acceleration at unrelated guarded call sites
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @modules java.base/jdk.internal.util
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox jdk.test.whitebox.code.NMethod
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics -XX:CompileCommand=inline,jdk.internal.util.ArraysSupport::hashCode compiler.intrinsics.common.TestCommonIntrinsicGuardIsolation 3
 */

package compiler.intrinsics.common;

import java.lang.reflect.Method;
import jdk.internal.util.ArraysSupport;
import jdk.test.whitebox.WhiteBox;
import jdk.test.whitebox.code.NMethod;

public class TestCommonIntrinsicGuardIsolation {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();
    private static final int[] INPUT = new int[4096];
    private static volatile int sink;

    public static int mixed(int first, int second, int[] input) {
        return Math.addExact(first, 1) ^ ArraysSupport.hashCode(input, 0, INPUT.length, 1)
                ^ Math.addExact(second, 2);
    }

    private static void reject(int operation) {
        try {
            // Keep the hash length independent of the reference so the null
            // reaches the guarded hash invocation.
            switch (operation) {
                case 0 -> mixed(Integer.MAX_VALUE, 7, INPUT);
                case 1 -> mixed(42, Integer.MAX_VALUE, INPUT);
                case 2 -> mixed(42, 7, null);
                default -> throw new AssertionError(operation);
            }
            throw new AssertionError("guard must fail");
        } catch (ArithmeticException expected) {
            if (operation == 2) {
                throw expected;
            }
        } catch (NullPointerException expected) {
            if (operation != 2) {
                throw expected;
            }
        }
    }

    private static int compile(Method method, int level) {
        if (!WB.enqueueMethodForCompilation(method, level)
                || WB.getMethodCompilationLevel(method) != level) {
            throw new AssertionError("C1 compilation failed: " + method);
        }
        return NMethod.get(method, false).compile_id;
    }

    private static void checkCompilation(Method method, int id) {
        NMethod code = NMethod.get(method, false);
        if (code == null || code.compile_id != id) {
            throw new AssertionError("guard failure caused recompilation");
        }
    }

    public static void main(String[] args) throws Exception {
        int level = Integer.parseInt(args[0]);
        for (int i = 0; i < INPUT.length; i++) {
            INPUT[i] = i * 31;
        }
        Method method = TestCommonIntrinsicGuardIsolation.class.getDeclaredMethod(
                "mixed", int.class, int.class, int[].class);
        WB.testSetDontInlineMethod(method, true);
        for (int i = 0; i < 20_000; i++) {
            sink ^= mixed(i & 1023, 7, INPUT);
        }
        WB.deoptimizeMethod(method);
        WB.clearMethodState(method);
        compile(method, level);
        for (int site = 0; site < 3; site++) {
            reject(site);
            if (WB.isMethodCompiled(method)) {
                throw new AssertionError("unrelated call site lost its intrinsic: " + site);
            }
            int id = compile(method, level);
            for (int i = 0; i < 1000; i++) {
                for (int failed = 0; failed <= site; failed++) {
                    reject(failed);
                }
                sink ^= mixed(i & 1023, 7, INPUT);
            }
            checkCompilation(method, id);
        }
    }
}
