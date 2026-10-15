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
 * @test id=portable
 * @summary Bounded simdutf leaves across UTF and Base64 boundaries on large arrays
 * @modules java.base/jdk.internal.util
 * @run main/othervm -Xint SimdUTFLargeTest
 * @run main/othervm -Xint -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_simdutf_process SimdUTFLargeTest
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics SimdUTFLargeTest
 */

/*
 * @test id=compiled
 * @summary Large simdutf inputs in C1 and C2
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @modules java.base/jdk.internal.util
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:CompileThresholdScaling=0.1 SimdUTFLargeTest
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 SimdUTFLargeTest
 */

import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Base64;
import jdk.internal.util.SimdUTF;

public class SimdUTFLargeTest {
    private static final int LIMIT = 1024 * 1024;

    public static void main(String[] args) {
        for (int bytes : new int[]{LIMIT - 1, LIMIT, LIMIT + 1, 4 * LIMIT + 1}) {
            String text = "漢".repeat(bytes / 3) + "x".repeat(bytes % 3);
            byte[] utf8 = text.getBytes(StandardCharsets.UTF_8);
            check(utf8.length == bytes, "UTF8 input length");
            char[] output = new char[text.length() + 8];
            Arrays.fill(output, '\u5555');
            int n = SimdUTF.decodeUTF8(utf8, 0, bytes, output, 3, text.length());
            if (SimdUTF.isEligible(bytes)) {
                check(n == text.length() && text.equals(new String(output, 3, n)), "large tight UTF8");
                check(output[2] == '\u5555' && output[3 + n] == '\u5555', "UTF8 guards");
            }
            CharBuffer tight = CharBuffer.allocate(text.length());
            ByteBuffer input = ByteBuffer.wrap(utf8);
            var result = StandardCharsets.UTF_8.newDecoder().decode(input, tight, true);
            check(result.isUnderflow() && !input.hasRemaining(), "large charset positions");
            check(text.contentEquals(tight.flip()), "large charset contents");
            check(new String(utf8, StandardCharsets.UTF_8).equals(text), "large String decode");
        }
        surrogateBoundary();
        latin1();
        base64();
        malformed();
        trailingMalformed();
    }

    private static void surrogateBoundary() {
        char[] chars = new char[2 * LIMIT + 7];
        Arrays.fill(chars, 'a');
        chars[LIMIT - 1] = '\ud83d';
        chars[LIMIT] = '\ude03';
        if (SimdUTF.isEligible(chars.length)) {
            for (int i = 0; i < 200; i++) {
                check(SimdUTF.countCodePoints(chars, 0, chars.length) == chars.length - 1, "large count warmup");
            }
        }
        String text = new String(chars);
        byte[] expected = new byte[chars.length + 2];
        Arrays.fill(expected, (byte)'a');
        expected[LIMIT - 1] = (byte)0xf0;
        expected[LIMIT] = (byte)0x9f;
        expected[LIMIT + 1] = (byte)0x98;
        expected[LIMIT + 2] = (byte)0x83;
        check(Arrays.equals(expected, text.getBytes(StandardCharsets.UTF_8)), "split surrogate UTF8 encode");
        byte[] output = new byte[expected.length + 8];
        int n = SimdUTF.encodeUTF16(chars, 0, chars.length, output, 3, expected.length);
        if (SimdUTF.isEligible(chars.length)) {
            check(n == expected.length && Arrays.equals(expected, Arrays.copyOfRange(output, 3, 3 + n)),
                    "large native UTF8 encode");
            check(SimdUTF.countCodePoints(chars, 0, chars.length) == chars.length - 1, "split surrogate count");
            check(SimdUTF.validateUTF16(chars, 0, chars.length, 0) == 1, "split surrogate validation");
        }
        for (boolean big : new boolean[]{false, true}) {
            byte[] bytes = new byte[(chars.length - 1) * 4];
            n = SimdUTF.encodeUTF32Bytes(chars, 0, chars.length, bytes, 0, bytes.length, big);
            if (SimdUTF.isEligible(chars.length)) {
                check(n == bytes.length, "large tight UTF32 length");
                ByteBuffer buffer = ByteBuffer.wrap(bytes).order(big ? java.nio.ByteOrder.BIG_ENDIAN
                                                                   : java.nio.ByteOrder.LITTLE_ENDIAN);
                for (int i = 0; i < chars.length - 1; i++) {
                    check(buffer.getInt() == (i == LIMIT - 1 ? 0x1f603 : 'a'), "large UTF32 contents");
                }
                char[] decoded = new char[chars.length];
                n = SimdUTF.decodeUTF32Bytes(bytes, 0, bytes.length, decoded, 0, decoded.length, big);
                check(n == chars.length && Arrays.equals(chars, decoded), "large UTF32 decode");
            }
            byte[] utf16 = text.getBytes(big ? StandardCharsets.UTF_16BE : StandardCharsets.UTF_16LE);
            char[] decoded = new char[chars.length];
            n = SimdUTF.decodeUTF16Bytes(utf16, 0, utf16.length, decoded, 0, decoded.length, big);
            if (SimdUTF.isEligible(utf16.length)) {
                check(n == chars.length && Arrays.equals(chars, decoded), "split surrogate UTF16 decode");
            }
        }
        chars[LIMIT] = 'a';
        if (SimdUTF.isEligible(chars.length)) {
            check(SimdUTF.validateUTF16(chars, 0, chars.length, 0) == 0, "isolated boundary surrogate");
        }
    }

    private static void latin1() {
        byte[] input = "é".repeat(LIMIT + 7).getBytes(StandardCharsets.UTF_8);
        byte[] inplace = input.clone();
        check(SimdUTF.decodeLatin1(inplace, 0, inplace.length, inplace, 0, inplace.length / 2) < 0,
                "insufficient in-place capacity");
        check(Arrays.equals(input, inplace), "capacity failure changed in-place input");
        int n = SimdUTF.decodeLatin1(inplace, 0, inplace.length, inplace, 0, inplace.length);
        if (n >= 0) {
            check(n == LIMIT + 7, "large in-place Latin1 length");
            for (int i = 0; i < n; i++) check(inplace[i] == (byte)0xe9, "in-place Latin1 contents");
        } else {
            check(Arrays.equals(input, inplace), "declined in-place conversion changed input");
        }
        check(new String(input, StandardCharsets.UTF_8).equals("é".repeat(LIMIT + 7)),
                "large Latin1 String fallback");
        Arrays.fill(input, (byte)'a');
        input[LIMIT + 17] = (byte)0xe6;
        input[LIMIT + 18] = (byte)0xbc;
        input[LIMIT + 19] = (byte)0xa2;
        inplace = input.clone();
        check(SimdUTF.decodeLatin1(inplace, 0, inplace.length, inplace, 0, inplace.length) < 0,
                "unrepresentable late Latin1 input");
        check(Arrays.equals(input, inplace), "failed in-place conversion changed input");
    }

    private static void base64() {
        for (int length : new int[]{LIMIT - 1, LIMIT, LIMIT + 1, 4 * LIMIT}) {
            byte[] binary = new byte[length];
            Arrays.fill(binary, (byte)0xe9);
            byte[] encoded = Base64.getEncoder().encode(binary);
            check(Arrays.equals(binary, Base64.getDecoder().decode(encoded)), "large Base64 round trip");
            byte[] output = new byte[encoded.length];
            int full = length / 3 * 3;
            int n = SimdUTF.encodeBase64(binary, 0, full, output, 0, false);
            if (n >= 0) check(Arrays.equals(Arrays.copyOf(encoded, n), Arrays.copyOf(output, n)), "Base64 encode chunks");
            output = new byte[length];
            full = encoded.length / 4 * 4;
            if (encoded[full - 1] == '=') full -= 4;
            n = SimdUTF.decodeBase64(encoded, 0, full, output, 0, false);
            if (n >= 0) check(Arrays.equals(Arrays.copyOf(binary, n), Arrays.copyOf(output, n)), "Base64 decode chunks");
        }
    }

    private static void malformed() {
        byte[] bytes = new byte[LIMIT + 1];
        Arrays.fill(bytes, (byte)0x80);
        var decoder = StandardCharsets.UTF_8.newDecoder()
                .onMalformedInput(CodingErrorAction.REPLACE);
        CharBuffer output = CharBuffer.allocate(bytes.length);
        var result = decoder.decode(ByteBuffer.wrap(bytes), output, true);
        check(result.isUnderflow() && !output.hasRemaining(), "large malformed decode positions");
        for (char c : output.array()) check(c == '\ufffd', "large malformed replacement");
        char[] chars = new char[LIMIT + 1];
        Arrays.fill(chars, '\udc00');
        var encoder = StandardCharsets.UTF_8.newEncoder()
                .onMalformedInput(CodingErrorAction.REPLACE);
        ByteBuffer encoded = ByteBuffer.allocate(chars.length);
        result = encoder.encode(CharBuffer.wrap(chars), encoded, true);
        check(result.isUnderflow() && !encoded.hasRemaining(), "large malformed encode positions");
        for (byte b : encoded.array()) check(b == '?', "large malformed encode replacement");
    }

    private static void trailingMalformed() {
        for (int length : new int[]{LIMIT - 1, LIMIT + 1, 2 * LIMIT + 1}) {
            String text = "漢".repeat(length / 3) + "a".repeat(length % 3);
            byte[] prefix = text.getBytes(StandardCharsets.UTF_8);
            byte[] bytes = Arrays.copyOf(prefix, prefix.length + 1);
            for (byte last : new byte[]{(byte)0x80, (byte)0xe2}) {
                bytes[prefix.length] = last;
                int n = SimdUTF.decodeUTF8(bytes, 0, bytes.length,
                        new char[text.length() + 1], 0, text.length() + 1);
                if (SimdUTF.isEligible(bytes.length)) {
                    check(n < 0 && -(n + 1) == prefix.length, "large UTF8 failure offset");
                }
                for (var action : new CodingErrorAction[]{CodingErrorAction.REPORT,
                        CodingErrorAction.REPLACE, CodingErrorAction.IGNORE}) {
                    for (boolean end : new boolean[]{false, true}) {
                        for (int capacity : new int[]{text.length() - 1, text.length() + 1}) {
                            char[][] output = new char[2][capacity + 8];
                            int position = -1;
                            int written = -1;
                            String result = null;
                            for (int mode = 0; mode < 2; mode++) {
                                Arrays.fill(output[mode], '\u5555');
                                ByteBuffer input = ByteBuffer.wrap(bytes);
                                if (mode == 0) input = input.asReadOnlyBuffer();
                                CharBuffer target = CharBuffer.wrap(output[mode], 3, capacity);
                                var decoder = StandardCharsets.UTF_8.newDecoder().onMalformedInput(action);
                                var status = decoder.decode(input, target, end);
                                if (mode == 0) {
                                    position = input.position();
                                    written = target.position();
                                    result = status.toString();
                                } else {
                                    check(position == input.position() && written == target.position()
                                            && result.equals(status.toString()), "large UTF8 error positions");
                                    check(Arrays.equals(output[0], output[1]), "large UTF8 error output and guards");
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
