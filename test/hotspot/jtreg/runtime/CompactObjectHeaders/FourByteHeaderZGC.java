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
 * @summary Verify hash growth for small and medium objects during ZGC relocation
 * @requires vm.gc.Z & vm.bits == "64" & (os.arch == "amd64" | os.arch == "aarch64")
 * @run main/othervm -XX:+UseFourByteObjectHeaders
 *      -XX:+UseZGC -XX:+UnlockDiagnosticVMOptions -XX:+ZVerifyForwarding
 *      -Xms64m -Xmx64m FourByteHeaderZGC
 * @run main/othervm -XX:+UseFourByteObjectHeaders
 *      -XX:+UseZGC -XX:+UnlockDiagnosticVMOptions -XX:+ZVerifyForwarding
 *      -XX:+ZStressRelocateInPlace -Xms64m -Xmx64m FourByteHeaderZGC
 */

public class FourByteHeaderZGC {
    static class IntHolder {
        int value;
        IntHolder(int value) { this.value = value; }
    }
    static volatile Object sink;
    public static void main(String[] args) throws Exception {
        Object[] objects = new Object[6000];
        int[] hashes = new int[objects.length];
        Thread collector = new Thread(() -> {
            for (int i = 0; i < 20; i++) {
                for (int j = 0; j < 300; j++) sink = new byte[16384];
                System.gc();
            }
        });
        collector.start();
        for (int i = 0; i < objects.length; i++) {
            // Medium arrays exercise page alignment greater than HeapWordSize.
            objects[i] = i % 1000 == 0 ? new long[50000] : new IntHolder(i);
            if (i % 1000 == 0) sink = new long[50000];
            hashes[i] = System.identityHashCode(objects[i]);
        }
        collector.join();
        for (int i = 0; i < objects.length; i++) {
            if (hashes[i] != System.identityHashCode(objects[i])) {
                throw new AssertionError("Hash changed for object " + i);
            }
            if (objects[i] instanceof IntHolder holder && holder.value != i) {
                throw new AssertionError("Payload changed for object " + i);
            }
        }
    }
}
