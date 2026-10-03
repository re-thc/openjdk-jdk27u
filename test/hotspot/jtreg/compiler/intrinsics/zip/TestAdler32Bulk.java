/*
 * Copyright (c) 2026, re-thc. All rights reserved.
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
 */

/*
 * @test
 * @summary Check compiled bulk Adler32 calls with constant lengths and mixed updates
 * @run main/othervm -Xbatch -XX:-TieredCompilation compiler.intrinsics.zip.TestAdler32Bulk
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 compiler.intrinsics.zip.TestAdler32Bulk
 * @run main/othervm -Xint compiler.intrinsics.zip.TestAdler32Bulk
 */

package compiler.intrinsics.zip;

import java.nio.ByteBuffer;
import java.util.Random;
import java.util.zip.Adler32;

public class TestAdler32Bulk {
    private static final class Reference {
        private long a = 1, b;

        void update(byte[] bytes, int off, int len) {
            for (int end = off + len; off < end;) {
                int limit = Math.min(end, off + 4096);
                while (off < limit) {
                    a += bytes[off++] & 0xff;
                    b += a;
                }
                a %= 65521;
                b %= 65521;
            }
        }

        long value() { return (b << 16) | a; }
    }

    private static void array512(Adler32 adler, byte[] bytes, int off) {
        adler.update(bytes, off, 512);
    }

    private static void array4096(Adler32 adler, byte[] bytes, int off) {
        adler.update(bytes, off, 4096);
    }

    private static void direct512(Adler32 adler, ByteBuffer bytes, int off) {
        bytes.limit(off + 512).position(off);
        adler.update(bytes);
    }

    private static void direct4096(Adler32 adler, ByteBuffer bytes, int off) {
        bytes.limit(off + 4096).position(off);
        adler.update(bytes);
    }

    public static void main(String[] args) {
        byte[] bytes = new byte[4096 + 63];
        Random random = new Random(0x6a173);
        for (int pattern = 0; pattern < 3; pattern++) {
            random.nextBytes(bytes);
            if (pattern != 0) {
                java.util.Arrays.fill(bytes, pattern == 1 ? (byte) 0 : (byte) 255);
            }
            ByteBuffer direct = ByteBuffer.allocateDirect(bytes.length);
            direct.put(bytes);
            Adler32 adler = new Adler32();
            Reference reference = new Reference();
            for (int i = 0; i < 3000; i++) {
                int off = i & 63;
                array512(adler, bytes, off);
                reference.update(bytes, off, 512);
                check(adler, reference);
                array4096(adler, bytes, off);
                reference.update(bytes, off, 4096);
                check(adler, reference);
                direct512(adler, direct, off);
                reference.update(bytes, off, 512);
                check(adler, reference);
                direct4096(adler, direct, off);
                reference.update(bytes, off, 4096);
                check(adler, reference);
                int small = i % 65;
                adler.update(bytes, off, small);
                reference.update(bytes, off, small);
                check(adler, reference);
                if (direct.position() != off + 4096) {
                    throw new AssertionError("Direct buffer position");
                }
            }
        }
    }

    private static void check(Adler32 adler, Reference reference) {
        if (adler.getValue() != reference.value()) {
            throw new AssertionError(adler.getValue() + " != " + reference.value());
        }
    }
}
