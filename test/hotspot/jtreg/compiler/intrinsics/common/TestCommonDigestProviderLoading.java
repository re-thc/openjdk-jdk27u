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
 * @summary C1 multi-block digest dispatch accepts providers loaded after compilation
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox compiler.intrinsics.common.TestCommonDigestStreaming
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonDigestProviderLoading
 */

package compiler.intrinsics.common;

import java.lang.reflect.Method;
import java.security.MessageDigest;
import jdk.test.whitebox.WhiteBox;
import jdk.test.whitebox.code.NMethod;
import jtreg.SkippedException;

public class TestCommonDigestProviderLoading {
    public static void main(String[] args) throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        // Two implementations prevent a unique-implementor CHA dependency.
        MessageDigest.getInstance("SHA-256");
        MessageDigest.getInstance("MD5");
        Class<?> base = Class.forName("sun.security.provider.DigestBase");
        Method kernel = base.getDeclaredMethod("implCompressMultiBlock0", byte[].class, int.class, int.class);
        if (!wb.isIntrinsicAvailable(kernel, 1)) {
            throw new SkippedException("Multi-block digest kernels unavailable");
        }
        Method update = base.getDeclaredMethod("engineUpdate", byte[].class, int.class, int.class);
        wb.testSetDontInlineMethod(update, true);
        wb.deoptimizeMethod(update);
        wb.clearMethodState(update);
        if (!wb.enqueueMethodForCompilation(update, 1) || wb.getMethodCompilationLevel(update) != 1) {
            throw new AssertionError("C1 digest update compilation failed");
        }
        int compilation = NMethod.get(update, false).compile_id;

        // Exercise the existing known answers as the other providers are first loaded.
        TestCommonDigestStreaming.main(new String[0]);
        NMethod after = NMethod.get(update, false);
        if (after == null || after.compile_id != compilation) {
            throw new AssertionError("Loading a supported digest provider deoptimized the bulk call");
        }
    }
}
