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

/**
 * @test
 * @summary Verify CRC32 kernel selection, offsets, seeds and buffers
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @run main/othervm -Xint compiler.intrinsics.zip.TestZlibNGCRC32
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 compiler.intrinsics.zip.TestZlibNGCRC32
 * @run main/othervm -Xbatch -XX:-TieredCompilation compiler.intrinsics.zip.TestZlibNGCRC32
 * @run main/othervm -Xcheck:jni -XX:+UnlockDiagnosticVMOptions -XX:-UseCRC32Intrinsics compiler.intrinsics.zip.TestZlibNGCRC32 32
 */

/**
 * @test id=avx2
 * @summary Verify zlib-ng CRC32 calls without the AVX-512 kernel
 * @requires os.simpleArch == "x64"
 * @run main/othervm -Xint -XX:UseAVX=2 compiler.intrinsics.zip.TestZlibNGCRC32
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:UseAVX=2 compiler.intrinsics.zip.TestZlibNGCRC32
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:UseAVX=2 compiler.intrinsics.zip.TestZlibNGCRC32
 */

package compiler.intrinsics.zip;

import java.nio.ByteBuffer;
import java.util.Random;
import java.util.zip.CRC32;

public class TestZlibNGCRC32 {
    private static int update(int crc, int value) {
        crc ^= value & 0xff;
        for (int bit = 0; bit < 8; bit++) {
            crc = (crc >>> 1) ^ ((crc & 1) == 0 ? 0 : 0xedb88320);
        }
        return crc;
    }

    private static long reference(byte[] data, int off, int len) {
        int crc = update(update(-1, 0x13), 0xfa);
        for (int i = off; i < off + len; i++) {
            crc = update(crc, data[i]);
        }
        return (~crc) & 0xffffffffL;
    }

    private static void seed(CRC32 crc) {
        crc.reset();
        crc.update(0x13);
        crc.update(0xfa);
    }

    private static void check(CRC32 crc, long expected) {
        if (crc.getValue() != expected) {
            throw new AssertionError(crc.getValue() + " != " + expected);
        }
    }

    public static void main(String[] args) {
        // The compiled-path runs need repetition to exercise intrinsic lowering.
        // The checked-JNI control disables intrinsics and only needs correctness
        // coverage. Its critical-array checks copy the entire backing array,
        // even for short updates, so repeating every case 5000 times is costly.
        int repetitions = args.length == 0 ? 5000 : Integer.parseInt(args[0]);
        if (repetitions <= 0) {
            throw new IllegalArgumentException("Repetitions must be positive");
        }
        byte[] data = new byte[1048576 + 31];
        new Random(17).nextBytes(data);
        ByteBuffer direct = ByteBuffer.allocateDirect(data.length);
        direct.put(data).flip();
        CRC32 crc = new CRC32();
        for (int off : new int[]{0, 1, 7, 31}) {
            for (int len : new int[]{0, 1, 2, 15, 16, 31, 32, 63, 64, 65,
                                    255, 256, 1023, 1024, 65536, 1048576}) {
                long expected = reference(data, off, len);
                for (int repeat = 0; repeat < repetitions; repeat++) {
                    seed(crc);
                    crc.update(data, off, len);
                    check(crc, expected);
                    seed(crc);
                    direct.limit(off + len).position(off);
                    crc.update(direct);
                    check(crc, expected);
                    if (direct.position() != direct.limit()) {
                        throw new AssertionError("Buffer position was not advanced");
                    }
                    seed(crc);
                    int split = len / 2;
                    crc.update(data, off, split);
                    crc.update(data, off + split, len - split);
                    check(crc, expected);
                }
            }
        }
    }
}
