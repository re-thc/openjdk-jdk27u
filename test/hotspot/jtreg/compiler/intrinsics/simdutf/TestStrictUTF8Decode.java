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
 * @summary Ownership-transferred UTF-8 decoding retains strict errors in every tier
 * @modules java.base/jdk.internal.access
 * @run main/othervm -Xint TestStrictUTF8Decode
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 TestStrictUTF8Decode
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics TestStrictUTF8Decode
 * @run main/othervm -Xbatch -XX:-TieredCompilation TestStrictUTF8Decode
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:-CompactStrings TestStrictUTF8Decode
 */

import java.nio.charset.MalformedInputException;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.internal.access.SharedSecrets;

public class TestStrictUTF8Decode {
    private static String decode(byte[] input) throws Exception {
        // The access contract transfers ownership, including on successful ASCII input.
        return SharedSecrets.getJavaLangAccess().uncheckedNewStringOrThrow(
                input.clone(), StandardCharsets.UTF_8);
    }

    public static void main(String[] args) throws Exception {
        for (int length : new int[]{0, 1, 31, 255, 256, 257, 8192, 1048576, 1048577}) {
            byte[] input = new byte[length];
            Arrays.fill(input, (byte)'a');
            if (length >= 3) {
                input[0] = (byte)0xe2; input[1] = (byte)0x82; input[2] = (byte)0xac;
            }
            String expected = new String(input, StandardCharsets.UTF_8);
            for (int i = 0; i < (length <= 8192 ? 1000 : 1); i++) {
                if (!decode(input).equals(expected)) throw new AssertionError("length=" + length);
            }
        }
        for (String prefix : new String[]{"", "a".repeat(32), "é".repeat(32)}) {
            for (String text : new String[]{"é".repeat(1024), "€".repeat(1024), "\ud800\udc00".repeat(1024)}) {
                String expected = prefix + text;
                byte[] input = expected.getBytes(StandardCharsets.UTF_8);
                for (int i = 0; i < 1000; i++) {
                    if (!decode(input).equals(expected)) throw new AssertionError("valid Unicode");
                }
            }
        }
        // These complete malformed sequences have the same offset/length in
        // String's original strict decoder, including the UTF-8 surrogate case.
        byte[][] bad = {{(byte)0x80}, {(byte)0xed, (byte)0xa0, (byte)0x80},
                {(byte)0xf4, (byte)0x90, (byte)0x80, (byte)0x80}};
        byte[] valid = "€".repeat(1024).getBytes(StandardCharsets.UTF_8);
        for (byte[] sequence : bad) for (int at : new int[]{0, 1536, 3072}) {
            byte[] input = new byte[valid.length + sequence.length];
            System.arraycopy(valid, 0, input, 0, at);
            System.arraycopy(sequence, 0, input, at, sequence.length);
            System.arraycopy(valid, at, input, at + sequence.length, valid.length - at);
            for (int i = 0; i < 100; i++) {
                try {
                    decode(input);
                    throw new AssertionError("accepted malformed input");
                } catch (MalformedInputException ex) {
                    String message = "malformed input offset : " + at + ", length : " + sequence.length;
                    if (ex.getInputLength() != sequence.length || ex.getCause() == null ||
                            !message.equals(ex.getCause().getMessage())) throw new AssertionError(message, ex);
                }
            }
        }
        byte[][] truncated = {{(byte)0xc2}, {(byte)0xe2, (byte)0x82},
                {(byte)0xf0, (byte)0x9f}, {(byte)0xe0, (byte)0x80}};
        int[] offsets = {3073, 3073, 3072, 3072};
        int[] lengths = {1, 1, 1, 2};
        for (int c = 0; c < truncated.length; c++) {
            byte[] input = Arrays.copyOf(valid, valid.length + truncated[c].length);
            System.arraycopy(truncated[c], 0, input, valid.length, truncated[c].length);
            for (int i = 0; i < 100; i++) {
                try {
                    decode(input);
                    throw new AssertionError("accepted truncated input");
                } catch (MalformedInputException ex) {
                    String message = "malformed input offset : " + offsets[c] + ", length : " + lengths[c];
                    if (ex.getInputLength() != lengths[c] || ex.getCause() == null ||
                            !message.equals(ex.getCause().getMessage())) throw new AssertionError(message, ex);
                }
            }
        }
    }
}
