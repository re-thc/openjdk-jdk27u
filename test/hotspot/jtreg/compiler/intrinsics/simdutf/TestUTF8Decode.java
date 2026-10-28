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
 *
 */

/*
 * @test
 * @summary Private String UTF-8 decoding preserves Java replacement and caller input
 * @run main/othervm -Xint TestUTF8Decode
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 TestUTF8Decode
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics TestUTF8Decode
 * @run main/othervm -Xbatch -XX:-TieredCompilation TestUTF8Decode
 */

import java.nio.ByteBuffer;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;

public class TestUTF8Decode {
    private static String decode(byte[] bytes, int offset, int length) {
        return new String(bytes, offset, length, StandardCharsets.UTF_8);
    }

    private static void check(byte[] input, int repeats) throws Exception {
        byte[] bytes = new byte[input.length + 8];
        Arrays.fill(bytes, (byte) 0x80);
        System.arraycopy(input, 0, bytes, 3, input.length);
        byte[] original = bytes.clone();
        String expected = StandardCharsets.UTF_8.newDecoder()
                .onMalformedInput(CodingErrorAction.REPLACE)
                .decode(ByteBuffer.wrap(bytes, 3, input.length)).toString();
        for (int i = 0; i < repeats; i++) {
            if (!expected.equals(decode(bytes, 3, input.length))) {
                throw new AssertionError("decode length=" + input.length);
            }
        }
        if (!Arrays.equals(bytes, original)) throw new AssertionError("caller input changed");
    }

    public static void main(String[] args) throws Exception {
        for (int length : new int[]{0, 1, 31, 255, 256, 257, 8192, 1048576, 1048577}) {
            byte[] input = new byte[length];
            Arrays.fill(input, (byte)'a');
            if (length >= 3) {
                input[0] = (byte)0xe2;
                input[1] = (byte)0x82;
                input[2] = (byte)0xac;
            }
            check(input, length <= 8192 ? 1000 : 1);
        }
        for (String prefix : new String[]{"", "a".repeat(32), "é".repeat(32)}) {
            for (String text : new String[]{"é".repeat(1024), "€".repeat(1024), "\ud800\udc00".repeat(1024)}) {
                check((prefix + text).getBytes(StandardCharsets.UTF_8), 1000);
            }
        }
        byte[][] malformed = {
                {(byte)0x80}, {(byte)0xc0, (byte)0xaf}, {(byte)0xc2},
                {(byte)0xe0, (byte)0x80, (byte)0x80}, {(byte)0xe2, (byte)0x82},
                {(byte)0xed, (byte)0xa0, (byte)0x80}, {(byte)0xed, (byte)0xbf, (byte)0xbf},
                {(byte)0xf0, (byte)0x9f}, {(byte)0xf4, (byte)0x90, (byte)0x80, (byte)0x80},
                {(byte)0xf5, (byte)0x80, (byte)0x80, (byte)0x80}
        };
        byte[] valid = "€".repeat(1024).getBytes(StandardCharsets.UTF_8);
        for (byte[] bad : malformed) {
            for (int at : new int[]{0, valid.length / 2, valid.length}) {
                byte[] input = new byte[valid.length + bad.length];
                System.arraycopy(valid, 0, input, 0, at);
                System.arraycopy(bad, 0, input, at, bad.length);
                System.arraycopy(valid, at, input, at + bad.length, valid.length - at);
                check(input, 100);
            }
        }
    }
}
