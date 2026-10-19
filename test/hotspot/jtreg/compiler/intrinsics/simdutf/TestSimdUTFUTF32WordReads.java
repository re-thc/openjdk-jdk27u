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
 *
 */

/*
 * @test
 * @summary UTF-32 word reads are enabled only by the AMD64 C2 policy
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @library /test/lib
 * @modules java.base/jdk.internal.util
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:CompileCommand=compileonly,TestSimdUTFUTF32WordReads::probe TestSimdUTFUTF32WordReads
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:-UseSIMDUTFIntrinsics -XX:CompileCommand=compileonly,TestSimdUTFUTF32WordReads::probe TestSimdUTFUTF32WordReads disabled
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:DisableIntrinsic=_simdutf_useUTF32WordReads -XX:CompileCommand=compileonly,TestSimdUTFUTF32WordReads::probe TestSimdUTFUTF32WordReads disabled
 */

import java.lang.reflect.Method;
import jdk.internal.util.SimdUTF;
import jdk.test.lib.Platform;
import jdk.test.whitebox.WhiteBox;

public class TestSimdUTFUTF32WordReads {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();

    private static boolean probe() {
        return SimdUTF.useUTF32WordReads();
    }

    private static void check(boolean expected, String tier) {
        boolean actual = probe();
        if (actual != expected) {
            throw new AssertionError(tier + ": expected " + expected + ", got " + actual);
        }
    }

    public static void main(String[] args) throws Exception {
        Method method = TestSimdUTFUTF32WordReads.class.getDeclaredMethod("probe");
        boolean c2 = args.length == 0 && Platform.isX64()
                && WB.getBooleanVMFlag("UseSIMDUTFIntrinsics");
        WB.deoptimizeMethod(method);
        check(false, "interpreter");
        for (int level : new int[]{1, 4}) {
            WB.deoptimizeMethod(method);
            if (!WB.enqueueMethodForCompilation(method, level)
                    || WB.getMethodCompilationLevel(method) != level) {
                throw new AssertionError("Failed to compile probe at level " + level);
            }
            check(level == 4 && c2, "compilation level " + level);
        }
        WB.deoptimizeMethod(method);
        check(false, "deoptimized interpreter");
    }
}
