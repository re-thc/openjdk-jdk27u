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
 * @summary Hash expansion at the humongous threshold respects object alignment
 * @requires vm.gc.G1 & vm.bits == "64" & (os.arch == "amd64" | os.arch == "aarch64")
 * @requires vm.opt.UseFourByteObjectHeaders == null | vm.opt.UseFourByteObjectHeaders == true
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -XX:+UseG1GC -XX:+UseFourByteObjectHeaders -XX:+VerifyDuringGC
 *      -Xms64m -Xmx64m -XX:G1HeapRegionSize=1m TestFourByteHeaderHashExpansion
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -XX:+UseG1GC -XX:+UseFourByteObjectHeaders -XX:+VerifyDuringGC
 *      -XX:ObjectAlignmentInBytes=16 -Xms64m -Xmx64m -XX:G1HeapRegionSize=1m
 *      TestFourByteHeaderHashExpansion
 */

import jdk.test.lib.Asserts;
import jdk.test.whitebox.WhiteBox;

public class TestFourByteHeaderHashExpansion {
    public static void main(String[] args) {
        WhiteBox wb = WhiteBox.getWhiteBox();
        byte[][] arrays = new byte[8][];
        int[] hashes = new int[arrays.length];
        long[] sizes = new long[arrays.length];
        for (int i = 0; i < arrays.length; i++) {
            arrays[i] = new byte[512 * 1024 - 8];
            arrays[i][0] = (byte) i;
            arrays[i][arrays[i].length - 1] = (byte) ~i;
            sizes[i] = wb.getObjectSize(arrays[i]);
            hashes[i] = System.identityHashCode(arrays[i]);
        }
        wb.youngGC();
        for (int i = 0; i < arrays.length; i++) {
            Asserts.assertEQ(System.identityHashCode(arrays[i]), hashes[i]);
            Asserts.assertEQ(arrays[i][0], (byte) i);
            Asserts.assertEQ(arrays[i][arrays[i].length - 1], (byte) ~i);
            Asserts.assertGT(wb.getObjectSize(arrays[i]), sizes[i], "array must have expanded");
        }
        System.gc();
        for (int i = 0; i < arrays.length; i++) {
            Asserts.assertEQ(System.identityHashCode(arrays[i]), hashes[i]);
        }
    }
}
