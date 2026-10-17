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
 * @summary Check zlib-ng Adler32 boundaries and small inputs with GC, offsets and nonzero seeds
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @requires vm.compiler2.enabled
 * @run main/othervm -Xmx64m -Xint TestZlibNGAdler32
 * @run main/othervm -Xmx64m -Xbatch -XX:TieredStopAtLevel=1 TestZlibNGAdler32
 * @run main/othervm -Xmx64m -Xbatch -XX:TieredStopAtLevel=1 -XX:+UnlockDiagnosticVMOptions -XX:-UseAdler32Intrinsics -Xcheck:jni TestZlibNGAdler32
 * @run main/othervm -Xmx64m -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=1000 TestZlibNGAdler32
 * @run main/othervm -Xmx64m -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=1000 -XX:+UnlockDiagnosticVMOptions -XX:-UseAdler32Intrinsics TestZlibNGAdler32
 */

import java.nio.ByteBuffer;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.zip.Adler32;

public class TestZlibNGAdler32 {
    private static final int[] OFFSETS = {0, 1, 7, 31};
    private static final int[] LENGTHS = {0, 1, 63, 64, 65, 1023, 1024, 1025,
                                          4095, 4096, 4097, 65535, 65536, 65537};

    private static long reference(long adler, byte[] input, int offset, int length) {
        int s1 = (int) adler & 0xffff;
        int s2 = (int) (adler >>> 16) & 0xffff;
        for (int i = offset; i < offset + length; i++) {
            s1 = (s1 + (input[i] & 0xff)) % 65521;
            s2 = (s2 + s1) % 65521;
        }
        return ((long) s2 << 16) | s1;
    }

    private static void check(Adler32 adler, byte[] input, ByteBuffer direct,
                              int offset, int length, int passes, long expected) {
        adler.reset();
        adler.update(17);
        adler.update(255);
        for (int pass = 0; pass < passes; pass++) {
            if (direct == null) {
                adler.update(input, offset, length);
            } else {
                direct.clear().position(offset).limit(offset + length);
                adler.update(direct);
                if (direct.position() != offset + length || direct.limit() != offset + length) {
                    throw new AssertionError("Direct buffer position/limit");
                }
            }
        }
        if (adler.getValue() != expected) {
            throw new AssertionError("Adler32: offset=" + offset + " length=" + length +
                                     " passes=" + passes + " expected=" + expected +
                                     " actual=" + adler.getValue());
        }
    }

    public static void main(String[] args) throws Exception {
        byte[] input = new byte[65537 + 31];
        for (int i = 0; i < input.length; i++) {
            input[i] = (byte) (i * 31 + 7);
        }
        ByteBuffer direct = ByteBuffer.allocateDirect(input.length);
        direct.put(input);
        ByteBuffer readOnly = direct.asReadOnlyBuffer();
        long[][][] expected = new long[2][OFFSETS.length][LENGTHS.length];
        for (int o = 0; o < OFFSETS.length; o++) {
            for (int l = 0; l < LENGTHS.length; l++) {
                long value = (291L << 16) | 273;
                for (int pass = 0; pass < 2; pass++) {
                    value = reference(value, input, OFFSETS[o], LENGTHS[l]);
                    expected[pass][o][l] = value;
                }
            }
        }
        AtomicBoolean done = new AtomicBoolean();
        Thread gc = new Thread(() -> {
            while (!done.get()) {
                System.gc();
                try {
                    Thread.sleep(2);
                } catch (InterruptedException e) {
                    throw new AssertionError(e);
                }
            }
        });
        Adler32 heapChecksum = new Adler32();
        Adler32 directChecksum = new Adler32();
        gc.start();
        try {
            for (int i = 0; i < 12000; i++) {
                int o = i % OFFSETS.length;
                int l = (i / OFFSETS.length) % LENGTHS.length;
                int pass = (i / (OFFSETS.length * LENGTHS.length)) & 1;
                check(heapChecksum, input, null, OFFSETS[o], LENGTHS[l], pass + 1,
                      expected[pass][o][l]);
                check(directChecksum, input, direct, OFFSETS[o], LENGTHS[l], pass + 1,
                      expected[pass][o][l]);
                check(directChecksum, input, readOnly, OFFSETS[o], LENGTHS[l], pass + 1,
                      expected[pass][o][l]);
            }
        } finally {
            done.set(true);
            gc.join();
        }
    }
}
