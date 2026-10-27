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

/*
 * @test
 * @summary String UTF-8 conversion and Base64 give the expected results for ranges longer than
 *          the intrinsics take at once, and for malformed text in the middle or at the end
 * @run main/othervm TestLargeInputs
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 TestLargeInputs
 * @run main/othervm -Xbatch -XX:-TieredCompilation TestLargeInputs
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics TestLargeInputs
 * @run main/othervm -Xint TestLargeInputs light
 * @run main/othervm --add-opens java.base/java.util=ALL-UNNAMED TestLargeInputs blocks
 */

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Base64;
import java.util.Random;

public class TestLargeInputs {
    private static boolean light;
    private static int checks;

    /** UTF-8 of well-formed text, written by hand, with '?' for an unpaired surrogate. */
    private static byte[] referenceEncode(String s) {
        ByteArrayOutputStream out = new ByteArrayOutputStream(s.length() * 3);
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c < 0x80) {
                out.write(c);
            } else if (c < 0x800) {
                out.write(0xc0 | (c >> 6));
                out.write(0x80 | (c & 0x3f));
            } else if (Character.isHighSurrogate(c) && i + 1 < s.length() && Character.isLowSurrogate(s.charAt(i + 1))) {
                int cp = Character.toCodePoint(c, s.charAt(++i));
                out.write(0xf0 | (cp >> 18));
                out.write(0x80 | ((cp >> 12) & 0x3f));
                out.write(0x80 | ((cp >> 6) & 0x3f));
                out.write(0x80 | (cp & 0x3f));
            } else if (Character.isSurrogate(c)) {
                out.write('?');
            } else {
                out.write(0xe0 | (c >> 12));
                out.write(0x80 | ((c >> 6) & 0x3f));
                out.write(0x80 | (c & 0x3f));
            }
        }
        return out.toByteArray();
    }

    private static String text(Random random, int chars, int kind) {
        StringBuilder sb = new StringBuilder(chars + 2);
        while (sb.length() < chars) {
            switch (kind) {
                case 0 -> sb.append((char) ('一' + random.nextInt(2000)));         // BMP, three bytes
                case 1 -> sb.append(random.nextInt(8) == 0 ? (char) (0xa0 + random.nextInt(0x60))
                                                           : (char) ('a' + random.nextInt(26)));   // Latin-1
                case 2 -> {                                                              // mixed, with pairs
                    int k = random.nextInt(16);
                    if (k == 0) sb.appendCodePoint(0x1f600 + random.nextInt(64));
                    else if (k < 5) sb.append((char) (0x100 + random.nextInt(0x700)));
                    else sb.append((char) ('a' + random.nextInt(26)));
                }
                default -> sb.append((char) ('a' + random.nextInt(26)));
            }
        }
        sb.setLength(chars);
        if (Character.isHighSurrogate(sb.charAt(chars - 1))) sb.setCharAt(chars - 1, 'z');
        return sb.toString();
    }

    private static void same(String what, byte[] expected, byte[] actual) {
        if (!Arrays.equals(expected, actual)) {
            int at = Arrays.mismatch(expected, actual);
            throw new AssertionError(what + ": lengths " + expected.length + " and " + actual.length
                    + ", first difference at " + at);
        }
        checks++;
    }

    private static void same(String what, String expected, String actual) {
        if (!expected.equals(actual)) {
            int at = Arrays.mismatch(expected.toCharArray(), actual.toCharArray());
            throw new AssertionError(what + ": lengths " + expected.length() + " and " + actual.length()
                    + ", first difference at " + at);
        }
        checks++;
    }

    private static void decode(Random random, int chars, int kind) {
        String text = text(random, chars, kind);
        byte[] bytes = referenceEncode(text);
        String name = "decode kind=" + kind + " chars=" + chars;
        same(name, text, new String(bytes, StandardCharsets.UTF_8));
        // A malformed byte at the start, in the middle, near the end and at the end, which
        // is replaced by one char; and a sequence that the end of the input cuts
        for (int c : new int[]{0, chars / 2, chars - 40, chars}) {
            if (c > 0 && c < chars && Character.isLowSurrogate(text.charAt(c))) {
                c--;                                        // between characters, not inside a pair
            }
            int at = referenceEncode(text.substring(0, c)).length;
            byte[] bad = new byte[bytes.length + 1];
            System.arraycopy(bytes, 0, bad, 0, at);
            bad[at] = (byte) 0xff;
            System.arraycopy(bytes, at, bad, at + 1, bytes.length - at);
            same(name + " bad at char " + c, text.substring(0, c) + "\ufffd" + text.substring(c),
                    new String(bad, StandardCharsets.UTF_8));
        }
        // Isolated malformed bytes, a short and a long stretch apart, and a dense stretch
        // that the loops handle between long ones
        for (int gap : new int[]{97, 997, 20011}) {
            StringBuilder expected = new StringBuilder(text.length() + chars / gap + 2);
            ByteArrayOutputStream bad = new ByteArrayOutputStream(bytes.length + chars / gap + 2);
            int from = 0;
            for (int c = gap; c < chars; c += gap) {
                if (Character.isLowSurrogate(text.charAt(c))) c--;
                byte[] piece = referenceEncode(text.substring(from, c));
                bad.write(piece, 0, piece.length);
                bad.write(0xff);
                expected.append(text, from, c).append('\ufffd');
                from = c;
            }
            byte[] tail = referenceEncode(text.substring(from));
            bad.write(tail, 0, tail.length);
            expected.append(text, from, chars);
            same(name + " bad every " + gap, expected.toString(), new String(bad.toByteArray(), StandardCharsets.UTF_8));
        }
        byte[] cut = Arrays.copyOf(bytes, bytes.length + 1);
        cut[bytes.length] = (byte) 0xe4;                    // the start of a three-byte sequence
        same(name + " cut", text + "�", new String(cut, StandardCharsets.UTF_8));
    }

    private static void encode(Random random, int chars, int kind) {
        String text = text(random, chars, kind);
        String name = "encode kind=" + kind + " chars=" + chars;
        same(name, referenceEncode(text), text.getBytes(StandardCharsets.UTF_8));
        // An unpaired surrogate, of either kind, at the start, in the middle and at the end
        for (int at : new int[]{0, chars / 2, chars - 1}) {
            for (char lone : new char[]{'\ud800', '\udc00'}) {
                StringBuilder sb = new StringBuilder(text);
                sb.setCharAt(at, lone);
                String s = sb.toString();
                same(name + " lone " + Integer.toHexString(lone) + " at " + at, referenceEncode(s),
                        s.getBytes(StandardCharsets.UTF_8));
            }
        }
    }

    private static void encodeSparse(Random random, int chars, int kind) {
        String text = text(random, chars, kind);
        for (int gap : new int[]{97, 997, 20011}) {
            StringBuilder sb = new StringBuilder(text);
            for (int c = gap; c < chars; c += gap) {
                // Replace a whole character, or the halves of a pair, so that the pairs around stay whole
                if (Character.isLowSurrogate(sb.charAt(c))) c--;
                if (Character.isHighSurrogate(sb.charAt(c))) sb.setCharAt(c + 1, 'z');
                sb.setCharAt(c, (c & 1) == 0 ? '\ud800' : '\udc00');
            }
            String s = sb.toString();
            same("encode kind=" + kind + " chars=" + chars + " lone every " + gap, referenceEncode(s),
                    s.getBytes(StandardCharsets.UTF_8));
        }
    }

    private static byte[] referenceBase64(byte[] data, boolean url, boolean padding, int line) {
        String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789" + (url ? "-_" : "+/");
        ByteArrayOutputStream out = new ByteArrayOutputStream(data.length * 4 / 3 + 16);
        int column = 0;
        for (int i = 0; i < data.length; i += 3) {
            int n = Math.min(3, data.length - i);
            int bits = (data[i] & 0xff) << 16 | (n > 1 ? (data[i + 1] & 0xff) << 8 : 0) | (n > 2 ? data[i + 2] & 0xff : 0);
            if (line > 0 && column == line) {
                out.write('\r');
                out.write('\n');
                column = 0;
            }
            out.write(alphabet.charAt((bits >> 18) & 63));
            out.write(alphabet.charAt((bits >> 12) & 63));
            if (n > 1) out.write(alphabet.charAt((bits >> 6) & 63)); else if (padding) out.write('=');
            if (n > 2) out.write(alphabet.charAt(bits & 63)); else if (padding) out.write('=');
            column += 4;
        }
        return out.toByteArray();
    }

    private static void base64(Random random, int length) {
        byte[] data = new byte[length];
        random.nextBytes(data);
        String name = "base64 length=" + length;
        byte[] basic = referenceBase64(data, false, true, 0);
        same(name + " encode", basic, Base64.getEncoder().encode(data));
        same(name + " encode url", referenceBase64(data, true, true, 0), Base64.getUrlEncoder().encode(data));
        same(name + " encode unpadded", referenceBase64(data, false, false, 0),
                Base64.getEncoder().withoutPadding().encode(data));
        same(name + " decode", data, Base64.getDecoder().decode(basic));
        same(name + " decode url", data, Base64.getUrlDecoder().decode(referenceBase64(data, true, true, 0)));
        byte[] mime = referenceBase64(data, false, true, 76);
        same(name + " mime encode", mime, Base64.getMimeEncoder().encode(data));
        same(name + " mime decode", data, Base64.getMimeDecoder().decode(mime));
        // The decoder still rejects an illegal byte far into a long input
        byte[] bad = basic.clone();
        bad[bad.length / 2] = '*';
        try {
            Base64.getDecoder().decode(bad);
            throw new AssertionError(name + " accepted an illegal byte");
        } catch (IllegalArgumentException expected) {
            checks++;
        }
    }

    /** The end of a block of Base64 input must not overflow for the last blocks of the largest arrays. */
    private static void blockEnds() throws Exception {
        var method = Base64.class.getDeclaredMethod("blockEnd", int.class, int.class);
        method.setAccessible(true);
        int block = 3 << 18;
        int max = Integer.MAX_VALUE - 2;                     // the largest length that a byte array can have
        for (int sl : new int[]{0, 5, block, block + 1, 2 * block, Integer.MAX_VALUE - 7, max}) {
            long[] starts = {0, 1, block - 1, block, block + 1, 2L * block, sl - 2L * block - 1, sl - 2L * block,
                             sl - block - 1, sl - block, sl - block + 1, sl - 4, sl - 1, sl,
                             // the block starts of an array of 2^31 - 4 bytes that is decoded from its start
                             2146959360L, 2146959360L - block};
            for (long from : starts) {
                if (from < 0 || from > sl) continue;
                int sp = (int) from;
                int got = (int) method.invoke(null, sp, sl);
                int want = (int) Math.min((long) sl, (long) sp + block);
                if (got != want) {
                    throw new AssertionError("blockEnd(" + sp + ", " + sl + ") = " + got + ", expected " + want);
                }
                checks++;
            }
        }
    }

    public static void main(String[] args) throws Exception {
        if (args.length > 0 && args[0].equals("blocks")) {
            blockEnds();
            System.out.println("passed " + checks + " comparisons");
            return;
        }
        light = args.length > 0;
        Random random = new Random(0x4c1);
        // More than one call of the intrinsics takes, and a few lengths around its limits
        int[] sizes = light ? new int[]{1 << 20, (1 << 20) + 37}
                            : new int[]{1 << 18, (1 << 20) - 5, 1 << 20, (1 << 20) + 5, 2_500_003};
        for (int chars : sizes) {
            for (int kind = 0; kind < 3; kind++) {
                decode(random, chars, kind);
                encode(random, chars, kind);
                encodeSparse(random, chars, kind);
            }
        }
        for (int length : light ? new int[]{3 * (1 << 18) + 1, 2_000_003}
                                : new int[]{(3 << 18) - 1, 3 << 18, (3 << 18) + 1, 3_500_000, 3_500_002}) {
            base64(random, length);
        }
        System.out.println("passed " + checks + " comparisons");
    }
}
