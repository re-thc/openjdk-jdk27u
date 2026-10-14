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
 * @summary Verify conditioned and unconditioned Kerberos CRC32 updates
 * @modules java.security.jgss/sun.security.krb5.internal.crypto
 * @run main/othervm -Xint RawCRC32
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch RawCRC32
 * @run main/othervm -XX:-TieredCompilation -Xbatch RawCRC32
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:-UseCRC32Intrinsics RawCRC32
 */
import java.nio.charset.StandardCharsets;
import java.util.Random;
import sun.security.krb5.internal.crypto.crc32;

public class RawCRC32 {
    private static int reference(int seed, byte[] data, int length) {
        for (int i = 0; i < length; i++) {
            seed ^= data[i] & 0xff;
            for (int bit = 0; bit < 8; bit++) {
                seed = (seed >>> 1) ^ ((seed & 1) == 0 ? 0 : 0xedb88320);
            }
        }
        return seed;
    }

    public static void main(String[] args) {
        Random random = new Random(0x12345678);
        for (int length : new int[] {0, 1, 16, 32, 63, 64, 65, 1024, 4096, 65536}) {
            byte[] data = new byte[length + 7];
            random.nextBytes(data);
            for (int i = 0; i < 20; i++) {
                int seed = random.nextInt();
                int expected = reference(seed, data, length);
                int actual = crc32.byte2crc32sum(seed, data, length);
                if (actual != expected) {
                    throw new AssertionError("CRC32 length=" + length + ", seed=" + seed);
                }
            }
        }
        byte[] vector = "123456789".getBytes(StandardCharsets.US_ASCII);
        if (crc32.byte2crc32(vector) != 0xcbf43926) {
            throw new AssertionError("Conditioned CRC32");
        }
        if (crc32.byte2crc32sum(0x12345678, null, 0) != 0x12345678
                || crc32.byte2crc32sum(0x12345678, null, -1) != 0x12345678) {
            throw new AssertionError("Empty CRC32");
        }
        try {
            crc32.byte2crc32sum(0, new byte[64], 65);
            throw new AssertionError("Missing bounds check");
        } catch (ArrayIndexOutOfBoundsException expected) {
        }
        byte[] data = new byte[256];
        random.nextBytes(data);
        int expected = reference(0, data, data.length);
        for (int i = 0; i < 20_000; i++) {
            if (crc32.byte2crc32sum(data) != expected) {
                throw new AssertionError("Compiled CRC32");
            }
        }
    }
}
