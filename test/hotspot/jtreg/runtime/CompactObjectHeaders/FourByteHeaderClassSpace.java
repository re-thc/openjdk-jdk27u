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
 * @summary Exhausting the 19-bit class space fails with a controlled OutOfMemoryError
 * @requires vm.bits == "64" & (os.arch == "amd64" | os.arch == "aarch64")
 * @key stress
 * @library /test/lib
 * @modules java.base/jdk.internal.misc
 * @run driver/timeout=600 FourByteHeaderClassSpace
 */

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import jdk.internal.misc.Unsafe;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class FourByteHeaderClassSpace extends ClassLoader {
    static final int CLASSES_PER_LOADER = 4096;
    static FourByteHeaderClassSpace[] loaders;
    static Object boundaryObject;
    static Class<?> boundaryClass;
    static int boundaryHash;
    static byte[] reserve = new byte[65536];
    static byte[] template() throws Exception {
        var bytes = new ByteArrayOutputStream();
        var out = new DataOutputStream(bytes);
        out.writeInt(0xcafebabe);
        out.writeShort(0); out.writeShort(61); out.writeShort(5);
        out.writeByte(1); out.writeUTF("C00000000");
        out.writeByte(7); out.writeShort(1);
        out.writeByte(1); out.writeUTF("java/lang/Object");
        out.writeByte(7); out.writeShort(3);
        out.writeShort(0x21); out.writeShort(2); out.writeShort(4);
        out.writeShort(0); out.writeShort(0); out.writeShort(0); out.writeShort(0);
        return bytes.toByteArray();
    }
    static void load() throws Exception {
        // Keep each loader's metadata lists bounded so debug verification
        // remains affordable while exhausting the global compressed class space.
        loaders = new FourByteHeaderClassSpace[600000 / CLASSES_PER_LOADER + 1];
        FourByteHeaderClassSpace loader = null;
        byte[] bytes = template();
        // Initialize printing before exhausting metadata; string concatenation
        // would otherwise link a new invokedynamic call site inside the handler.
        System.out.print("Attempting ");
        System.out.println(600000);
        int count = 0;
        try {
            for (; count < 600000; count++) {
                if (count % CLASSES_PER_LOADER == 0) {
                    loader = new FourByteHeaderClassSpace();
                    loaders[count / CLASSES_PER_LOADER] = loader;
                }
                int value = count;
                for (int digit = 21; digit >= 14; digit--) {
                    bytes[digit] = (byte) ('0' + value % 10);
                    value /= 10;
                }
                Class<?> defined = loader.defineClass(null, bytes, 0, bytes.length);
                if (count == 500000) {
                    // Exercise an actual oop with a high class identifier,
                    // including hash preservation and decoding after movement.
                    boundaryClass = defined;
                    boundaryObject = Unsafe.getUnsafe().allocateInstance(defined);
                    boundaryHash = System.identityHashCode(boundaryObject);
                    System.gc();
                    checkBoundaryObject();
                }
            }
            throw new AssertionError("19-bit class space unexpectedly accommodated 600000 classes");
        } catch (OutOfMemoryError error) {
            reserve = null;
            if (!"Compressed class space".equals(error.getMessage())) throw error;
            System.out.print("Controlled compressed class space exhaustion after ");
            System.out.print(count);
            System.out.println(" classes");
            if (count < 100000) throw new AssertionError("Unexpectedly small class capacity: " + count);
        }
        System.gc();
        checkBoundaryObject();
    }
    static void checkBoundaryObject() {
        if (boundaryObject == null || boundaryObject.getClass() != boundaryClass ||
                System.identityHashCode(boundaryObject) != boundaryHash) {
            throw new AssertionError("Class or hash changed near the class-space boundary");
        }
    }
    public static void main(String[] args) throws Exception {
        if (args.length != 0) { load(); return; }
        new OutputAnalyzer(ProcessTools.createLimitedTestJavaProcessBuilder(
                "-XX:+UseFourByteObjectHeaders",
                "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED",
                // Avoid repeated C2 dependency scans of half a million new
                // subclasses. This test exercises class-space encoding and exhaustion.
                "-Xint",
                "-XX:+UseSerialGC", "-XX:-ClassUnloading", "-Xshare:off", "-Xmx1g",
                "-XX:CompressedClassSpaceSize=1g", FourByteHeaderClassSpace.class.getName(), "load").start())
                .shouldHaveExitValue(0).shouldContain("Controlled compressed class space exhaustion").outputTo(System.out);
    }
}
