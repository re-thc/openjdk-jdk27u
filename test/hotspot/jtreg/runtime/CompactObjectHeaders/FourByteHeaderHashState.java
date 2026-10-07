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
 * @summary C2 records hash presence for an expanded but unhashed object
 * @requires vm.bits == "64" & (os.arch == "amd64" | os.arch == "aarch64")
 * @requires vm.compiler2.enabled & vm.gc.Serial & vm.gc.G1 & vm.gc.Z
 * @library /test/lib
 * @modules java.base/jdk.internal.misc
 * @run main/othervm -XX:+UnlockExperimentalVMOptions -XX:+UseFourByteObjectHeaders
 *      -XX:+UseSerialGC -XX:hashCode=6 -XX:-TieredCompilation -Xbatch -XX:CompileThreshold=1000
 *      -XX:CompileCommand=dontinline,FourByteHeaderHashState::hash FourByteHeaderHashState
 * @run main/othervm -XX:+UnlockExperimentalVMOptions -XX:+UseFourByteObjectHeaders
 *      -XX:+UseG1GC -XX:hashCode=6 -XX:-TieredCompilation -Xbatch -XX:CompileThreshold=1000
 *      -XX:CompileCommand=dontinline,FourByteHeaderHashState::hash FourByteHeaderHashState
 * @run main/othervm -XX:+UnlockExperimentalVMOptions -XX:+UseFourByteObjectHeaders
 *      -XX:+UseZGC -XX:hashCode=6 -XX:-TieredCompilation -Xbatch -XX:CompileThreshold=1000
 *      -XX:CompileCommand=dontinline,FourByteHeaderHashState::hash FourByteHeaderHashState
 */

import jdk.internal.misc.Unsafe;
import jdk.test.lib.Asserts;

public class FourByteHeaderHashState {
    static final Unsafe UNSAFE = Unsafe.getUnsafe();
    // These are the two hash-control bits in the experimental 32-bit mark.
    static final int HASH_PRESENT = 1 << 11;
    static final int HASH_EXPANDED = 2 << 11;
    static volatile int sink;
    static final class PaddedObject {
        long value;
        PaddedObject(long value) { this.value = value; }
    }
    static int hash(Object object) { return System.identityHashCode(object); }
    public static void main(String[] args) {
        var warm = new PaddedObject(123);
        for (int i = 0; i < 30000; i++) sink = hash(warm);
        var target = new PaddedObject(456);
        // The aligned long leaves a four-byte gap after the mark, so an
        // expanded hash fits without changing the allocation size. Install
        // the valid unhashed-expanded state used by scratch CDS mirrors.
        int mark = UNSAFE.getInt(target, 0);
        UNSAFE.putInt(target, 0, (mark & ~(HASH_PRESENT | HASH_EXPANDED)) | HASH_EXPANDED);
        int expected = hash(target);
        Asserts.assertNE(UNSAFE.getInt(target, 0) & HASH_PRESENT, 0, "C2 must record hash presence");
        for (int round = 0; round < 3; round++) System.gc();
        Asserts.assertEQ(hash(target), expected);
        Asserts.assertEQ(target.value, 456L);
    }
}
