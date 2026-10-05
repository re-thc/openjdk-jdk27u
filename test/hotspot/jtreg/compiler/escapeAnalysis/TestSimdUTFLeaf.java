/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @summary C2 simdutf leaf calls must keep locally allocated array arguments materialized
 * @requires vm.compiler2.enabled
 * @library /test/lib
 * @modules java.base/jdk.internal.util
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:SIMDUTFMinLength=1
 *      -XX:CompileCommand=compileonly,compiler.escapeAnalysis.TestSimdUTFLeaf::test*
 *      compiler.escapeAnalysis.TestSimdUTFLeaf
 */

package compiler.escapeAnalysis;

import java.lang.reflect.Method;
import jdk.internal.util.SimdUTF;
import jdk.test.whitebox.WhiteBox;

public class TestSimdUTFLeaf {
    // All arrays fit under EliminateAllocationArraySizeLimit. Both the writes
    // before the leaf and the reads after it must survive escape analysis.
    private static boolean testEncodeLatin1(int value) {
        byte[] src = new byte[16];
        byte[] dst = new byte[32];
        src[0] = (byte) value;
        int n = SimdUTF.encodeLatin1(src, 0, src.length, dst, 0, dst.length);
        return n == 17 && dst[0] == (byte) 0xc3 && dst[1] == (byte) (value - 64)
                && dst[16] == 0 && dst[17] == 0;
    }

    private static boolean testEncodeUTF16(int value) {
        char[] src = new char[16];
        byte[] dst = new byte[48];
        src[0] = (char) value;
        int n = SimdUTF.encodeUTF16(src, 0, src.length, dst, 0, dst.length);
        return n == 17 && dst[0] == (byte) 0xc3 && dst[1] == (byte) (value - 64)
                && dst[16] == 0 && dst[17] == 0;
    }

    private static boolean testDecodeUTF8(int value) {
        byte[] src = new byte[16];
        char[] dst = new char[16];
        src[0] = (byte) 0xc3;
        src[1] = (byte) (value - 64);
        int n = SimdUTF.decodeUTF8(src, 0, src.length, dst, 0, dst.length);
        return n == 15 && dst[0] == (char) value && dst[14] == 0 && dst[15] == 0;
    }

    private static boolean testDecodeInPlace(int value) {
        byte[] src = new byte[16];
        src[0] = (byte) 0xc3;
        src[1] = (byte) (value - 64);
        int n = SimdUTF.decodeLatin1(src, 0, src.length, src, 0, src.length);
        return n == 15 && src[0] == (byte) value && src[14] == 0 && src[15] == 0;
    }

    private static boolean testCount(int value) {
        char[] src = new char[16];
        src[0] = (char) value;
        src[1] = '\ud83d';
        src[2] = '\ude03';
        return SimdUTF.countCodePoints(src, 0, src.length) == 15 && src[0] == (char) value;
    }

    private static boolean testRejectedRange(int value) {
        byte[] src = new byte[16];
        byte[] dst = new byte[32];
        src[0] = (byte) value;
        dst[0] = 42;
        return SimdUTF.encodeLatin1(src, 1, src.length, dst, 0, dst.length) == -1
                && dst[0] == 42 && src[0] == (byte) value;
    }

    private static void check(int value) {
        if (!testEncodeLatin1(value) || !testEncodeUTF16(value) || !testDecodeUTF8(value)
                || !testDecodeInPlace(value) || !testCount(value) || !testRejectedRange(value)) {
            throw new AssertionError("simdutf leaf lost array initialization or contents: " + value);
        }
    }

    public static void main(String[] args) throws Exception {
        if (!SimdUTF.isEligible(16)) {
            System.out.println("simdutf backend unavailable; skipping");
            return;
        }
        for (int i = 0; i < 5000; i++) {
            check(0xe9 + (i & 1));
        }
        WhiteBox wb = WhiteBox.getWhiteBox();
        for (Method method : TestSimdUTFLeaf.class.getDeclaredMethods()) {
            if (method.getName().startsWith("test")) {
                if (!wb.enqueueMethodForCompilation(method, 4)
                        || !wb.isMethodCompiled(method) || wb.getMethodCompilationLevel(method) != 4) {
                    throw new AssertionError("C2 did not compile " + method);
                }
            }
        }
        for (int i = 0; i < 5000; i++) {
            check(0xe9 + (i & 1));
        }
    }
}
