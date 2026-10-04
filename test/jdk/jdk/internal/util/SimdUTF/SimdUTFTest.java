/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
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
 * @summary Bulk simdutf conversion, range, capacity and fallback contracts in every execution tier
 * @modules java.base/jdk.internal.util:+open
 * @run main/othervm -Xint -XX:+UseSIMDUTFIntrinsics -XX:SIMDUTFMinLength=64 SimdUTFTest
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseSIMDUTFIntrinsics -XX:SIMDUTFMinLength=64 SimdUTFTest
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:+UseSIMDUTFIntrinsics -XX:SIMDUTFMinLength=64 SimdUTFTest
 * @run main/othervm -Xint -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_simdutf_process -XX:+UseSIMDUTFIntrinsics -XX:SIMDUTFMinLength=64 SimdUTFTest
 * @run main/othervm -Xbatch -XX:+UseSIMDUTFIntrinsics -XX:SIMDUTFMinLength=64 -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_simdutf_process SimdUTFTest
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics SimdUTFTest
 */

import jdk.internal.util.SimdUTF;
import java.io.ByteArrayOutputStream;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Base64;
import java.util.Random;

public class SimdUTFTest {
    private static final Random RANDOM = new Random(9271);
    private static final int[] LENGTHS = {0, 1, 2, 3, 15, 16, 31, 32, 63, 64, 65, 127, 128,
                                          255, 256, 257, 511, 512, 513, 1023, 1024, 4097};
    private static boolean accelerationAvailable;
    private static final byte SENTINEL = 0x55;

    public static void main(String[] args) throws Exception {
        var threshold = SimdUTF.class.getDeclaredField("minLength");
        threshold.setAccessible(true);
        accelerationAvailable = threshold.getInt(null) > 0;
        for (int iteration = 0; iteration < 20; iteration++) {
            for (int length : LENGTHS) {
                for (String alphabet : new String[]{"aAZ09\0", "a\u00e9\u00ff", "\u6f22\u6587a", "a\ud83d\ude03"}) {
                    StringBuilder text = new StringBuilder();
                    for (int i = 0; i < length; i++) {
                        int codePoints = alphabet.codePointCount(0, alphabet.length());
                        int index = alphabet.offsetByCodePoints(0, RANDOM.nextInt(codePoints));
                        text.appendCodePoint(alphabet.codePointAt(index));
                    }
                    checkUTF(text.toString());
                }
                byte[] input = new byte[length];
                RANDOM.nextBytes(input);
                checkBase64(input);
            }
        }
        narrowing();
        unicode();
        utf32();
        base64Streams();
        malformed();
        nativeRanges();
        System.out.println("simdutf contracts passed");
    }

    // Independent scalar oracle, including Java's '?' surrogate replacement.
    private static byte[] utf8(String text) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            int cp = c;
            if (Character.isHighSurrogate(c) && i + 1 < text.length()
                    && Character.isLowSurrogate(text.charAt(i + 1))) {
                cp = Character.toCodePoint(c, text.charAt(++i));
            } else if (Character.isSurrogate(c)) {
                cp = '?';
            }
            if (cp < 0x80) {
                out.write(cp);
            } else if (cp < 0x800) {
                out.write(0xc0 | cp >> 6); out.write(0x80 | cp & 63);
            } else if (cp < 0x10000) {
                out.write(0xe0 | cp >> 12); out.write(0x80 | cp >> 6 & 63); out.write(0x80 | cp & 63);
            } else {
                out.write(0xf0 | cp >> 18); out.write(0x80 | cp >> 12 & 63);
                out.write(0x80 | cp >> 6 & 63); out.write(0x80 | cp & 63);
            }
        }
        return out.toByteArray();
    }

    private static void checkUTF(String text) throws Exception {
        byte[] expected = utf8(text);
        equal(expected, text.getBytes(StandardCharsets.UTF_8));
        check(text.equals(new String(expected, StandardCharsets.UTF_8)), "String decode");
        byte[] padded = new byte[expected.length + 17];
        System.arraycopy(expected, 0, padded, 7, expected.length);
        check(text.equals(new String(padded, 7, expected.length, StandardCharsets.UTF_8)), "String offset");
        char[] chars = new char[text.length() + 13];
        text.getChars(0, text.length(), chars, 5);
        ByteBuffer bytes = ByteBuffer.allocate(expected.length + 21);
        bytes.position(9);
        CharBuffer source = CharBuffer.wrap(chars, 5, text.length());
        var encoder = StandardCharsets.UTF_8.newEncoder();
        var result = encoder.encode(source, bytes, true);
        check(result.isUnderflow() && source.position() == 5 + text.length(), "encoder positions");
        equal(expected, Arrays.copyOfRange(bytes.array(), 9, bytes.position()));
        CharBuffer target = CharBuffer.allocate(expected.length + 11);
        target.position(3);
        var decoder = StandardCharsets.UTF_8.newDecoder();
        ByteBuffer input = ByteBuffer.wrap(padded, 7, expected.length);
        result = decoder.decode(input, target, true);
        check(result.isUnderflow() && input.position() == 7 + expected.length, "decoder positions");
        check(text.equals(new String(target.array(), 3, target.position() - 3)), "decoder contents");
        // Direct and read-only buffers retain their Java path and exact semantics.
        ByteBuffer direct = ByteBuffer.allocateDirect(expected.length);
        direct.put(expected).flip();
        check(text.equals(StandardCharsets.UTF_8.decode(direct.asReadOnlyBuffer()).toString()), "direct decode");
        byte[] output = new byte[expected.length + 16];
        Arrays.fill(output, SENTINEL);
        int written = SimdUTF.encodeUTF16(chars, 5, text.length(), output, 7, expected.length);
        if (accelerationAvailable && text.length() >= 64) check(written >= 0, "encoding acceleration not taken");
        if (written >= 0) {
            check(written == expected.length, "native encode length");
            equal(expected, Arrays.copyOfRange(output, 7, 7 + written));
            guards(output, 7, written);
        }
        char[] decoded = new char[expected.length + 17];
        Arrays.fill(decoded, '\u5555');
        written = SimdUTF.decodeUTF8(padded, 7, expected.length, decoded, 5, expected.length);
        if (accelerationAvailable && expected.length >= 64) check(written >= 0, "decoding acceleration not taken");
        if (written >= 0) {
            check(text.equals(new String(decoded, 5, written)), "native decode contents");
            for (int i = 0; i < decoded.length; i++) {
                if (i < 5 || i >= 5 + written) check(decoded[i] == '\u5555', "char canary");
            }
        }
    }

    private static void checkBase64(byte[] input) {
        for (boolean url : new boolean[]{false, true}) {
            var encoder = url ? Base64.getUrlEncoder() : Base64.getEncoder();
            var decoder = url ? Base64.getUrlDecoder() : Base64.getDecoder();
            byte[] encoded = encoder.encode(input);
            equal(input, decoder.decode(encoded));
            equal(input, decoder.decode(encoder.withoutPadding().encode(input)));
            byte[] target = new byte[input.length + 19];
            Arrays.fill(target, SENTINEL);
            int length = encoded.length & ~3;
            if (length >= 4 && encoded[length - 1] == '=') length -= 4;
            int written = SimdUTF.decodeBase64(encoded, 0, length, target, 7, url);
            if (written >= 0) {
                equal(Arrays.copyOf(input, written), Arrays.copyOfRange(target, 7, 7 + written));
                guards(target, 7, written);
            }
            byte[] inplace = encoded.clone();
            int n = decoder.decode(inplace, inplace);
            equal(input, Arrays.copyOf(inplace, n));
        }
        equal(input, Base64.getMimeDecoder().decode(Base64.getMimeEncoder().encode(input)));
    }

    private static void narrowing() {
        for (int index : new int[]{0, 63, 64, 255, 256, 511, 512, 513, 1023}) {
            char[] chars = new char[1024];
            Arrays.fill(chars, '\u00ff');
            chars[index] = '\u0100';
            String text = new String(chars);
            byte[] expected = new byte[chars.length];
            Arrays.fill(expected, (byte)0xff);
            expected[index] = '?';
            equal(expected, text.getBytes(StandardCharsets.ISO_8859_1));
            byte[] output = new byte[chars.length];
            Arrays.fill(output, SENTINEL);
            int n = SimdUTF.encodeLatin1FromUTF16(chars, 0, chars.length, output, 0);
            if (n >= 0) {
                check(n == index, "narrowing prefix");
                for (int i = 0; i < n; i++) check(output[i] == (byte)0xff, "narrowing prefix bytes");
                guards(output, 0, n);
            }
        }
        equal("a?".repeat(32768).getBytes(StandardCharsets.ISO_8859_1),
                "a漢".repeat(32768).getBytes(StandardCharsets.ISO_8859_1));
        String text = "é".repeat(4097);
        for (char c : text.toCharArray()) check(c == '\u00e9', "inflate character");
        byte[] latin1 = text.getBytes(StandardCharsets.ISO_8859_1);
        char[] output = new char[latin1.length + 17];
        Arrays.fill(output, '\u5555');
        int n = SimdUTF.inflateLatin1(latin1, 0, latin1.length, output, 7);
        if (n >= 0) {
            check(text.equals(new String(output, 7, n)), "native inflate");
            for (int i = 0; i < output.length; i++) {
                if (i < 7 || i >= 7 + n) check(output[i] == '\u5555', "inflate canary");
            }
        }
    }

    private static byte[] utf32Bytes(String text, boolean big, boolean bom) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        if (bom) {
            for (int shift : big ? new int[]{24, 16, 8, 0} : new int[]{0, 8, 16, 24}) {
                out.write(0xfeff >> shift);
            }
        }
        text.codePoints().forEach(cp -> {
            for (int shift : big ? new int[]{24, 16, 8, 0} : new int[]{0, 8, 16, 24}) {
                out.write(cp >> shift);
            }
        });
        return out.toByteArray();
    }

    private static void utf32() throws Exception {
        for (String name : new String[]{"UTF-32", "UTF-32BE", "UTF-32LE",
                "X-UTF-32BE-BOM", "X-UTF-32LE-BOM"}) {
            var cs = java.nio.charset.Charset.forName(name);
            boolean big = !name.contains("LE");
            for (String text : new String[]{"a".repeat(1024), "漢".repeat(1024),
                    "a😃".repeat(513)}) {
                byte[] expected = utf32Bytes(text, big, name.endsWith("BOM"));
                equal(expected, text.getBytes(cs));
                check(cs.newEncoder().canEncode(text), "UTF32 validation");
                check(text.equals(new String(expected, cs)), "UTF32 decode");
                // Reserve worst-case space so the bulk decoder is exercised.
                for (int offset : new int[]{0, 1, 4, 7}) {
                    byte[] padded = new byte[expected.length + offset];
                    System.arraycopy(expected, 0, padded, offset, expected.length);
                    ByteBuffer src = ByteBuffer.wrap(padded, offset, expected.length);
                    CharBuffer dst = CharBuffer.allocate(expected.length / 2);
                    var result = cs.newDecoder().decode(src, dst, true);
                    check(result.isUnderflow() && src.position() == padded.length, "UTF32 positions");
                    dst.flip();
                    check(text.contentEquals(dst), "UTF32 offset decode");
                }
                CharBuffer src = CharBuffer.wrap(text.toCharArray());
                ByteBuffer dst = ByteBuffer.allocate(text.length() * 4 + 4);
                var result = cs.newEncoder().encode(src, dst, true);
                check(result.isUnderflow() && !src.hasRemaining(), "UTF32 encode positions");
                equal(expected, Arrays.copyOf(dst.array(), dst.position()));
            }
            byte[] dialect = utf32Bytes("a".repeat(513) + "\ud800", big, false);
            check(new String(dialect, cs).equals("a".repeat(513) + "\ud800"), "UTF32 surrogate dialect");
            byte[] invalid = utf32Bytes("a".repeat(513) + "x", big, false);
            int at = invalid.length - 4;
            byte[] bad = big ? new byte[]{0, 0x11, 0, 0} : new byte[]{0, 0, 0x11, 0};
            System.arraycopy(bad, 0, invalid, at, 4);
            ByteBuffer src = ByteBuffer.wrap(invalid);
            CharBuffer dst = CharBuffer.allocate(invalid.length / 2);
            var result = cs.newDecoder().decode(src, dst, true);
            check(result.isMalformed() && src.position() == at && dst.position() == 513,
                    "UTF32 malformed positions");
        }
    }

    private static void base64Streams() throws Exception {
        byte[] input = new byte[32771];
        RANDOM.nextBytes(input);
        for (var encoder : new Base64.Encoder[]{Base64.getEncoder(), Base64.getUrlEncoder(),
                Base64.getMimeEncoder(), Base64.getEncoder().withoutPadding()}) {
            for (int chunk : new int[]{1, 2, 3, 57, 1024, 10000}) {
                var output = new ByteArrayOutputStream();
                try (var stream = encoder.wrap(output)) {
                    for (int off = 0; off < input.length; off += chunk) {
                        stream.write(input, off, Math.min(chunk, input.length - off));
                    }
                }
                equal(encoder.encode(input), output.toByteArray());
            }
        }
    }

    private static void unicode() throws Exception {
        for (String text : new String[]{"a".repeat(1024), "é".repeat(1024), "漢".repeat(1024),
                "😃".repeat(512), "a".repeat(513) + "\ud800", "\udc00" + "a".repeat(513)}) {
            boolean valid = !text.contains("\ud800") && !text.contains("\udc00");
            for (var cs : new java.nio.charset.Charset[]{StandardCharsets.UTF_8,
                    StandardCharsets.UTF_16, StandardCharsets.UTF_16BE, StandardCharsets.UTF_16LE}) {
                check(cs.newEncoder().canEncode(text) == valid, "String Unicode validation");
                check(cs.newEncoder().canEncode(CharBuffer.wrap(text.toCharArray())) == valid, "array validation");
                check(cs.newEncoder().canEncode(new StringBuilder(text)) == valid, "CharSequence fallback");
                if (!valid) continue;
                byte[] expected;
                if (cs == StandardCharsets.UTF_8) {
                    expected = utf8(text);
                } else {
                    ByteArrayOutputStream out = new ByteArrayOutputStream();
                    boolean big = cs != StandardCharsets.UTF_16LE;
                    if (cs == StandardCharsets.UTF_16) { out.write(0xfe); out.write(0xff); }
                    for (char c : text.toCharArray()) {
                        out.write(big ? c >> 8 : c & 255);
                        out.write(big ? c & 255 : c >> 8);
                    }
                    expected = out.toByteArray();
                }
                equal(expected, text.getBytes(cs));
                check(text.equals(new String(expected, cs)), "UTF16 byte order/BOM decode");
                for (int offset : new int[]{0, 1, 6, 7}) {
                    byte[] padded = new byte[expected.length + offset];
                    System.arraycopy(expected, 0, padded, offset, expected.length);
                    check(text.equals(cs.newDecoder().decode(ByteBuffer.wrap(padded, offset, expected.length)).toString()),
                            "UTF16 offset decode");
                }
            }
            boolean ascii = text.chars().allMatch(c -> c < 128);
            boolean latin1 = text.chars().allMatch(c -> c < 256);
            check(StandardCharsets.US_ASCII.newEncoder().canEncode(text) == ascii, "ASCII validation");
            check(StandardCharsets.ISO_8859_1.newEncoder().canEncode(text) == latin1, "Latin1 validation");
            check(text.encodedLength(StandardCharsets.UTF_8) == utf8(text).length, "encodedLength");
        }
    }

    private static void malformed() throws Exception {
        String prefix = "a".repeat(513);
        String suffix = "b".repeat(513);
        for (String invalid : new String[]{"\ud800", "\udc00", "\ud800x", "\udc00\ud800"}) {
            String text = prefix + invalid + suffix;
            equal(utf8(text), text.getBytes(StandardCharsets.UTF_8));
            byte[] output = new byte[text.length() * 3];
            Arrays.fill(output, SENTINEL);
            check(SimdUTF.encodeUTF16(text.toCharArray(), 0, text.length(), output, 0, output.length) < 0,
                    "malformed UTF16 fallback");
            guards(output, 0, 0);
        }
        for (byte[] invalid : new byte[][]{{(byte)0xc0,(byte)0x80}, {(byte)0xe0,(byte)0x80,(byte)0x80},
                {(byte)0xed,(byte)0xa0,(byte)0x80}, {(byte)0xf4,(byte)0x90,(byte)0x80,(byte)0x80}, {(byte)0xe2}}) {
            byte[] input = new byte[513 + invalid.length];
            Arrays.fill(input, 0, 513, (byte)'a');
            System.arraycopy(invalid, 0, input, 513, invalid.length);
            char[] output = new char[input.length];
            check(SimdUTF.decodeUTF8(input, 0, input.length, output, 0, output.length) < 0, "invalid UTF8 fallback");
            var decoder = StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT);
            ByteBuffer source = ByteBuffer.wrap(input);
            CharBuffer target = CharBuffer.allocate(input.length);
            var result = decoder.decode(source, target, true);
            check(result.isMalformed() && source.position() == 513 && target.position() == 513,
                    "malformed result positions");
        }
        byte[] ascii = new byte[1024];
        Arrays.fill(ascii, (byte)'a');
        for (int bad : new int[]{0, 63, 64, 255, 256, 513, 1023}) {
            ascii[bad] = (byte)0xff;
            int n = SimdUTF.countAscii(ascii, 0, ascii.length);
            check(n < 0 || n == bad, "ASCII prefix");
            ascii[bad] = 'a';
        }
        ByteBuffer source = ByteBuffer.wrap(ascii);
        CharBuffer target = CharBuffer.allocate(17);
        check(StandardCharsets.UTF_8.newDecoder().decode(source, target, true).isOverflow(), "short output");
        check(source.position() == 17 && target.position() == 17, "overflow positions");
        for (String invalid : new String[]{" ", "!", "=", "\t", "\n", "\u00ff"}) {
            String encoded = "YWFh".repeat(200) + invalid + "YWFh".repeat(200);
            try {
                Base64.getDecoder().decode(encoded);
                throw new AssertionError("strict Base64 accepted invalid input");
            } catch (IllegalArgumentException expected) { }
        }
    }

    private static void nativeRanges() throws Exception {
        Method process = SimdUTF.class.getDeclaredMethod("process0", Object.class, int.class,
                int.class, Object.class, int.class, int.class, int.class);
        process.setAccessible(true);
        byte[] src = new byte[1024];
        byte[] dst = new byte[4096];
        Object[][] invalid = {
            {null, 0, 1024, dst, 0, dst.length, 2},
            {new int[1024], 0, 1024, dst, 0, dst.length, 2},
            {src, -1, 1024, dst, 0, dst.length, 2},
            {src, 1, 1024, dst, 0, dst.length, 2},
            {src, 0, Integer.MAX_VALUE, dst, 0, dst.length, 2},
            {src, 0, 1024, dst, -1, dst.length, 2},
            {src, 0, 1024, dst, 0, Integer.MAX_VALUE, 2},
            {src, 0, 1024, new Object[4096], 0, 4096, 2},
            {src, 0, 1024, src, 0, src.length, 2},
            {src, 0, 1024, dst, 0, dst.length, 99}
        };
        for (Object[] arguments : invalid) {
            check((int)process.invoke(null, arguments) == -1, "unsafe raw entry accepted arguments");
        }
    }

    private static void guards(byte[] buffer, int offset, int written) {
        for (int i = 0; i < buffer.length; i++) {
            if (i < offset || i >= offset + written) check(buffer[i] == SENTINEL, "byte canary");
        }
    }
    private static void equal(byte[] expected, byte[] actual) {
        check(Arrays.equals(expected, actual), "byte array mismatch");
    }
    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
