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
 * @summary C1 bounded intrinsic fallback preserves loop-internal argument Phis
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox jdk.test.whitebox.code.NMethod
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @compile --patch-module java.base=${test.src} -d patch java/math/BigIntegerLoopTemplate.java java/math/BigIntegerLoopFactory.java
 * @compile --patch-module java.base=${test.classes}/patch TestCommonBigIntegerFallbackLoop.java
 * @run main/othervm --patch-module java.base=${test.classes}/patch -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics TestCommonBigIntegerFallbackLoop 1
 * @run main/othervm --patch-module java.base=${test.classes}/patch -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics TestCommonBigIntegerFallbackLoop 3
 */

import java.lang.invoke.MethodType;
import java.math.BigIntegerLoopFactory;
import java.util.Arrays;
import jdk.test.whitebox.WhiteBox;
import jdk.test.whitebox.code.NMethod;

public class TestCommonBigIntegerFallbackLoop {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();

    private static int[] data(int length) {
        int[] data = new int[length];
        for (int i = 0; i < length; i++) data[i] = i * 0x9e3779b9 + 42;
        return data;
    }

    private static long reference(int mode, int[] out, int[] in) {
        long result = 0;
        for (int i = 0; i < 15; i++) {
            long carry = 0;
            int offset = out.length - 2;
            for (int j = (mode == 0 ? 8 : 0) - 1; j >= 0; j--) {
                long product = (in[j] & 0xffffffffL) * 17 + (out[offset] & 0xffffffffL) + carry;
                out[offset--] = (int) product;
                carry = product >>> 32;
            }
            result += (int) carry;
        }
        return result;
    }

    public static void main(String[] args) throws Throwable {
        int level = Integer.parseInt(args[0]);
        var lookup = BigIntegerLoopFactory.create();
        var type = MethodType.methodType(long.class, int.class, int[].class, int[].class);
        var handle = lookup.findStatic(lookup.lookupClass(), "loop", type);
        var method = lookup.lookupClass().getDeclaredMethod("loop", int.class, int[].class, int[].class);
        WB.testSetDontInlineMethod(method, true);
        for (int i = 0; i < 40; i++) {
            long unused = (long) handle.invokeExact(0, data(20), data(16));
        }
        WB.deoptimizeMethod(method);
        WB.clearMethodState(method);
        if (!WB.enqueueMethodForCompilation(method, level) || WB.getMethodCompilationLevel(method) != level) {
            throw new AssertionError("C1 compilation failed for loop-internal intrinsic argument Phi");
        }
        int id = NMethod.get(method, false).compile_id;
        int traps = WB.getMethodTrapCount(method, "intrinsic");
        for (int mode : new int[] {0, 1, 0}) {
            int[] input = data(16), output = data(20), expected = output.clone();
            long ref = reference(mode, expected, input);
            long actual = (long) handle.invokeExact(mode, output, input);
            if (actual != ref || !Arrays.equals(output, expected)) throw new AssertionError("incorrect result");
            var code = NMethod.get(method, false);
            if (code == null || code.compile_id != id || WB.getMethodTrapCount(method, "intrinsic") != traps) {
                throw new AssertionError("normal bounded fallback invalidated the caller");
            }
        }
        System.out.println("Loop Phi and same-site fallback passed");
    }
}
