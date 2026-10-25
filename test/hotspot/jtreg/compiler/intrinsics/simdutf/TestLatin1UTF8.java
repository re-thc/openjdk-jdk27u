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
 * @summary String Latin1 UTF-8 encoding preserves the original Java conversion across intrinsic boundaries
 * @run main/othervm -Xint TestLatin1UTF8
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 TestLatin1UTF8
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics TestLatin1UTF8
 * @run main/othervm -Xbatch -XX:-TieredCompilation TestLatin1UTF8
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:-CompactStrings TestLatin1UTF8
 */

import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;

public class TestLatin1UTF8 {
    private static byte[] encode(String value) {
        return value.getBytes(StandardCharsets.UTF_8);
    }

    public static void main(String[] args) throws Exception {
        for (int length : new int[]{0, 1, 31, 255, 256, 257, 8192, 1048576, 1048577}) {
            for (int prefix : new int[]{0, Math.min(length, 32), length}) {
                char[] chars = new char[length];
                for (int i = 0; i < length; i++) chars[i] = i < prefix ? 'a' : (char)(128 + (i & 127));
                String value = new String(chars);
                ByteBuffer encoded = StandardCharsets.UTF_8.newEncoder().encode(CharBuffer.wrap(chars));
                byte[] expected = new byte[encoded.remaining()];
                encoded.get(expected);
                int repeats = length <= 8192 ? 2000 : 2;
                for (int i = 0; i < repeats; i++) {
                    if (!Arrays.equals(expected, encode(value))) {
                        throw new AssertionError("length=" + length + " prefix=" + prefix);
                    }
                }
            }
        }
    }
}
