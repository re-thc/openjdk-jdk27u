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
 *
 */

/*
 * @test
 * @summary UTF-32 admission agrees with valid native conversion before callers allocate storage
 * @modules java.base/jdk.internal.util
 * @run main/othervm TestSimdUTFUTF32Admission
 * @run main/othervm -Xint TestSimdUTFUTF32Admission
 * @run main/othervm -XX:SIMDUTFMinLength=1 TestSimdUTFUTF32Admission
 * @run main/othervm -XX:SIMDUTFMinLength=128 TestSimdUTFUTF32Admission
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics TestSimdUTFUTF32Admission
 */

import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.util.Arrays;
import jdk.internal.util.SimdUTF;

public class TestSimdUTFUTF32Admission {
    public static void main(String[] args) {
        for (int length : new int[]{4, 28, 32, 36, 60, 64, 68, 124, 128, 132}) {
            for (boolean big : new boolean[]{false, true}) {
                byte[] input = new byte[length];
                for (int i = 0; i < length; i += 4) {
                    input[i + (big ? 2 : 1)] = 0x6f;
                    input[i + (big ? 3 : 0)] = 0x22;
                }
                char[] output = new char[length / 4];
                Arrays.fill(output, '\u5555');
                int count = SimdUTF.decodeUTF32Bytes(input, 0, length,
                        output, 0, output.length, big);
                if (SimdUTF.isEligibleUTF32Decoding(length) != (count == output.length)) {
                    throw new AssertionError("UTF32 admission disagrees with conversion at " + length);
                }
                char expected = count < 0 ? '\u5555' : '\u6f22';
                for (char c : output) {
                    if (c != expected) throw new AssertionError("Unexpected conversion output");
                }
                Charset charset = Charset.forName(big ? "UTF-32BE" : "UTF-32LE");
                String text = "\u6f22".repeat(output.length);
                if (!new String(input, charset).equals(text)
                        || !Arrays.equals(text.getBytes(charset), input)) {
                    throw new AssertionError("String conversion at " + length);
                }
                ByteBuffer direct = ByteBuffer.allocateDirect(length);
                direct.put(input).flip();
                for (ByteBuffer buffer : new ByteBuffer[]{direct, ByteBuffer.wrap(input).asReadOnlyBuffer()}) {
                    CharBuffer chars = CharBuffer.allocate(output.length);
                    var result = charset.newDecoder().decode(buffer, chars, true);
                    if (!result.isUnderflow() || buffer.hasRemaining() || !text.contentEquals(chars.flip())) {
                        throw new AssertionError("Buffer conversion at " + length);
                    }
                }
            }
        }
        Charset utf16 = Charset.forName("UTF-16");
        for (int chars : new int[]{15, 127}) {
            byte[] bom = new byte[2 + 2 * chars];
            bom[0] = (byte)0xfe; bom[1] = (byte)0xff;
            for (int i = 2; i < bom.length; i += 2) {
                bom[i] = 0x6f; bom[i + 1] = 0x22;
            }
            if (!new String(bom, utf16).equals("\u6f22".repeat(chars))) {
                throw new AssertionError("BOM payload at " + chars);
            }
        }
    }
}
