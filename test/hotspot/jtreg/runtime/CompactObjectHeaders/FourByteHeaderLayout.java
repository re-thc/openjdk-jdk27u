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
 * @summary Four-byte fields, arrays, clones, hashes and locks survive collection
 * @requires vm.bits == "64" & (os.arch == "amd64" | os.arch == "aarch64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI FourByteHeaderLayout
 */

import java.util.IdentityHashMap;
import jdk.test.whitebox.WhiteBox;
import jdk.test.lib.Asserts;

public class FourByteHeaderLayout {
    static final WhiteBox WB = WhiteBox.getWhiteBox();
    static volatile Object sink;

    static class IntObject implements Cloneable {
        int value;

        IntObject(int value) {
            this.value = value;
        }

        @Override
        public IntObject clone() {
            try {
                return (IntObject) super.clone();
            } catch (CloneNotSupportedException e) {
                throw new AssertionError(e);
            }
        }
    }

    static class RefObject implements Cloneable {
        Object value;

        RefObject(Object value) {
            this.value = value;
        }

        @Override
        public RefObject clone() {
            try {
                return (RefObject) super.clone();
            } catch (CloneNotSupportedException e) {
                throw new AssertionError(e);
            }
        }
    }

    public static void main(String[] args) throws Exception {
        boolean four = Boolean.TRUE.equals(WB.getBooleanVMFlag("UseFourByteObjectHeaders"));
        long alignment = WB.getIntVMFlag("ObjectAlignmentInBytes");
        long expectedSize = ((four ? 8L : 16L) + alignment - 1) & -alignment;
        Asserts.assertEQ(WB.getObjectSize(new IntObject(7)), expectedSize);
        Asserts.assertEQ(WB.getObjectSize(new int[0]), expectedSize);
        var objects = new Object[12000];
        var hashes = new int[objects.length];
        var map = new IdentityHashMap<Object, Integer>();
        for (int i = 0; i < objects.length; i++) {
            objects[i] = switch (i % 4) {
                case 0 -> new IntObject(i);
                case 1 -> new RefObject(new IntObject(i));
                case 2 -> new int[i % 127];
                default -> new Object[] {new IntObject(i), new byte[31]};
            };
            hashes[i] = System.identityHashCode(objects[i]);
            map.put(objects[i], i);
        }
        for (int round = 0; round < 8; round++) {
            for (int i = 0; i < objects.length; i++) {
                Object object = objects[i];
                synchronized (object) {
                    Asserts.assertEQ(System.identityHashCode(object), hashes[i]);
                    Asserts.assertEQ(map.get(object).intValue(), i);
                }
                if (object instanceof IntObject v) {
                    Asserts.assertEQ(v.clone().value, i);
                }
                if (object instanceof RefObject v) {
                    Asserts.assertTrue(v.clone().value == v.value);
                }
                if (object instanceof int[] v) {
                    Asserts.assertEQ(v.clone().length, v.length);
                }
                if (object instanceof Object[] v) {
                    Asserts.assertTrue(v.clone()[0] == v[0]);
                }
            }
            for (int i = 0; i < 12000; i++) {
                sink = new byte[1024];
            }
            System.gc();
        }
        for (int i = 0; i < objects.length; i++) {
            Asserts.assertEQ(System.identityHashCode(objects[i]), hashes[i]);
        }
    }
}
