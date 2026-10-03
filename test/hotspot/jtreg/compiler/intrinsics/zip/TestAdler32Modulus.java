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
 * @summary Check Adler32 reduction at scalar, vector and modulus boundaries
 * @run main/othervm -Xbatch -XX:-TieredCompilation compiler.intrinsics.zip.TestAdler32Modulus
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 compiler.intrinsics.zip.TestAdler32Modulus
 * @run main/othervm -Xint compiler.intrinsics.zip.TestAdler32Modulus
 */

package compiler.intrinsics.zip;

import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Random;
import java.util.zip.Adler32;

public class TestAdler32Modulus {
    private static final int BASE = 65521;
    private static final int[] LENGTHS = {
        0, 1, 2, 7, 15, 16, 17, 31, 32, 33, 63, 64, 65,
        127, 128, 129, 255, 256, 257, 1023, 1024, 1025,
        4095, 4096, 4097, 5551, 5552, 5553,
        11103, 11104, 11105, 65535, 65536, 65537
    };
    private static final int[] OFFSETS = { 0, 1, 7, 15, 31 };
    private static final int[] PREFIXES = { 0, 1, 257, 1024 };

    public static void main(String[] args) {
        byte[] bytes = new byte[65537 + 31];
        ByteBuffer direct = ByteBuffer.allocateDirect(bytes.length);
        Adler32 arrayAdler = new Adler32();
        Adler32 directAdler = new Adler32();

        new Random(0).nextBytes(bytes);
        direct.put(bytes);
        for (int i = 0; i < 20000; i++) {
            arrayAdler.update(bytes, 1, 64);
            direct.position(1).limit(65);
            directAdler.update(direct);
        }

        for (int pattern = 0; pattern < 4; pattern++) {
            switch (pattern) {
                case 0 -> Arrays.fill(bytes, (byte) 0);
                case 1 -> Arrays.fill(bytes, (byte) 0xff);
                case 2 -> {
                    for (int i = 0; i < bytes.length; i++) {
                        bytes[i] = (byte) i;
                    }
                }
                case 3 -> new Random(0).nextBytes(bytes);
            }
            direct.clear().put(bytes);
            for (int offset : OFFSETS) {
                for (int length : LENGTHS) {
                    for (int prefix : PREFIXES) {
                        arrayAdler.reset();
                        directAdler.reset();
                        // Seed through the single-byte API, independently of
                        // the bulk-update intrinsic under test.
                        for (int i = 0; i < prefix; i++) {
                            arrayAdler.update(0xff);
                            directAdler.update(0xff);
                        }
                        long expected = reference(bytes, offset, length, prefix);
                        arrayAdler.update(bytes, offset, length);
                        check(arrayAdler, expected, offset, length, prefix);
                        direct.limit(direct.capacity()).position(offset).limit(offset + length);
                        directAdler.update(direct);
                        check(directAdler, expected, offset, length, prefix);
                        if (direct.position() != offset + length || direct.limit() != offset + length) {
                            throw new AssertionError("Incorrect buffer position or limit");
                        }
                    }
                }
            }
        }
    }

    private static long reference(byte[] bytes, int offset, int length, int prefix) {
        int s1 = 1;
        int s2 = 0;
        for (int i = 0; i < prefix; i++) {
            s1 = (s1 + 255) % BASE;
            s2 = (s2 + s1) % BASE;
        }
        for (int i = offset; i < offset + length; i++) {
            s1 = (s1 + Byte.toUnsignedInt(bytes[i])) % BASE;
            s2 = (s2 + s1) % BASE;
        }
        return ((long) s2 << 16) | s1;
    }

    private static void check(Adler32 adler, long expected, int offset, int length, int prefix) {
        if (adler.getValue() != expected) {
            throw new AssertionError("offset=" + offset + ", length=" + length
                    + ", prefix=" + prefix + ", actual=" + adler.getValue()
                    + ", expected=" + expected);
        }
    }
}
