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
 * @summary The ISO-8859-1 and US-ASCII decoders and encoders convert direct buffers and
 *          buffers without an accessible array in bulk, with the malformed and unmappable
 *          results, positions and incremental behavior of their element loops
 * @build CoderTranscript
 * @run main/othervm -Xint TestSingleByteCharsetCoders light
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 TestSingleByteCharsetCoders
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics TestSingleByteCharsetCoders
 * @run main/othervm -Xbatch -XX:-TieredCompilation TestSingleByteCharsetCoders
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:+IgnoreUnrecognizedVMOptions -XX:UseAVX=2 TestSingleByteCharsetCoders
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:+IgnoreUnrecognizedVMOptions -XX:UseAVX=0 TestSingleByteCharsetCoders
 */

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Random;

public class TestSingleByteCharsetCoders {
    private static final CoderTranscript.Kind[] BYTE_SOURCES = {
            CoderTranscript.Kind.HEAP, CoderTranscript.Kind.HEAP_ALIGNED, CoderTranscript.Kind.DIRECT,
            CoderTranscript.Kind.DIRECT_ODD, CoderTranscript.Kind.READ_ONLY };
    private static final CoderTranscript.Kind[] CHAR_DESTINATIONS = {
            CoderTranscript.Kind.HEAP_ALIGNED, CoderTranscript.Kind.DIRECT,
            CoderTranscript.Kind.DIRECT_ODD, CoderTranscript.Kind.SWAPPED };
    private static final CoderTranscript.Kind[] BYTE_DESTINATIONS = {
            CoderTranscript.Kind.HEAP, CoderTranscript.Kind.HEAP_ALIGNED, CoderTranscript.Kind.DIRECT,
            CoderTranscript.Kind.DIRECT_ODD };
    private static final CoderTranscript.Kind[] CHAR_SOURCES = {
            CoderTranscript.Kind.HEAP_ALIGNED, CoderTranscript.Kind.DIRECT, CoderTranscript.Kind.DIRECT_ODD,
            CoderTranscript.Kind.READ_ONLY, CoderTranscript.Kind.SWAPPED, CoderTranscript.Kind.STRING };

    private static int checks;

    /** The array loops, which this change does not touch, give the expected transcript. */
    private static void checkDecode(Charset charset, Random random, byte[] data) {
        String expected = CoderTranscript.decode(charset, data,
                CoderTranscript.Kind.HEAP, CoderTranscript.Kind.HEAP,
                CoderTranscript.SHORT_BYTES, CoderTranscript.SHORT_CHARS);
        int[] outputs = {data.length + 8, data.length / 2 + 2, 2 + random.nextInt(data.length + 8)};
        for (var src : BYTE_SOURCES) {
            for (var dst : CHAR_DESTINATIONS) {
                for (int out : outputs) {
                    int window = random.nextBoolean() ? data.length : 64 + random.nextInt(1 + data.length);
                    String actual = CoderTranscript.decode(charset, data, src, dst, Math.max(window, 1), Math.max(out, 2));
                    if (!expected.equals(actual)) {
                        throw new AssertionError(charset + " decode " + src + " -> " + dst + " window=" + window
                                + " out=" + out + " length=" + data.length + "\nexpected " + expected
                                + "\nactual   " + actual);
                    }
                    checks++;
                }
            }
        }
    }

    private static void checkEncode(Charset charset, Random random, char[] data) {
        String expected = CoderTranscript.encode(charset, data,
                CoderTranscript.Kind.HEAP, CoderTranscript.Kind.HEAP,
                CoderTranscript.SHORT_CHARS, CoderTranscript.SHORT_BYTES);
        int[] outputs = {data.length + 8, data.length / 2 + 2, 2 + random.nextInt(data.length + 8)};
        for (var src : CHAR_SOURCES) {
            for (var dst : BYTE_DESTINATIONS) {
                for (int out : outputs) {
                    int window = random.nextBoolean() ? data.length : 64 + random.nextInt(1 + data.length);
                    String actual = CoderTranscript.encode(charset, data, src, dst, Math.max(window, 1), Math.max(out, 2));
                    if (!expected.equals(actual)) {
                        throw new AssertionError(charset + " encode " + src + " -> " + dst + " window=" + window
                                + " out=" + out + " length=" + data.length + "\nexpected " + expected
                                + "\nactual   " + actual);
                    }
                    checks++;
                }
            }
        }
    }

    /** Bytes that are ASCII except for the given number of bytes with the high bit set. */
    private static byte[] bytes(Random random, int length, int high) {
        byte[] data = new byte[length];
        for (int i = 0; i < length; i++) {
            data[i] = (byte) (' ' + random.nextInt(95));
        }
        for (int n = 0; n < high && length > 0; n++) {
            int at = random.nextInt(4) == 0 ? length - 1 - random.nextInt(Math.min(length, 20)) : random.nextInt(length);
            data[at] = (byte) (0x80 + random.nextInt(0x80));
        }
        return data;
    }

    /**
     * Chars that are ASCII, or in Latin-1 for the given range, except for the given number
     * of chars above it, which are BMP characters, valid pairs and unpaired surrogates.
     */
    private static char[] chars(Random random, int length, int top, int beyond) {
        char[] data = new char[length];
        for (int i = 0; i < length; i++) {
            data[i] = (char) (top == 0x80 || random.nextInt(4) != 0 ? ' ' + random.nextInt(95) : 0x80 + random.nextInt(top - 0x80));
        }
        for (int n = 0; n < beyond && length > 0; n++) {
            int at = random.nextInt(4) == 0 ? length - 1 - random.nextInt(Math.min(length, 20)) : random.nextInt(length);
            switch (random.nextInt(4)) {
                case 0 -> data[at] = (char) (top + random.nextInt(0x700));
                case 1 -> data[at] = (char) (0xd800 + random.nextInt(0x400));
                case 2 -> data[at] = (char) (0xdc00 + random.nextInt(0x400));
                default -> {
                    if (at + 1 < length) {
                        data[at] = (char) (0xd800 + random.nextInt(0x400));
                        data[at + 1] = (char) (0xdc00 + random.nextInt(0x400));
                    }
                }
            }
        }
        return data;
    }

    public static void main(String[] args) {
        boolean light = args.length > 0;
        Random random = new Random(0x8859);
        int[] counts = light ? new int[]{0, 31, 32, 100, 300} : new int[]{0, 1, 15, 16, 17, 31, 32, 33, 64, 100, 255, 256, 257, 1000, 2049};
        Charset latin1 = StandardCharsets.ISO_8859_1;
        Charset ascii = StandardCharsets.US_ASCII;
        for (int count : counts) {
            // Decoding: Latin-1 takes every byte; ASCII stops at one with the high bit set
            for (int high : new int[]{0, 1, 3, count}) {
                byte[] data = bytes(random, count, high);
                checkDecode(latin1, random, data);
                checkDecode(ascii, random, data);
                if (count > 0) {
                    checkDecode(ascii, random, Arrays.copyOf(data, count - 1));
                }
            }
            // Encoding: each charset stops at the first char it cannot map, which for
            // text that is mostly in range is far into the input
            for (int beyond : new int[]{0, 1, 3, count}) {
                checkEncode(latin1, random, chars(random, count, 0x100, beyond));
                checkEncode(ascii, random, chars(random, count, 0x80, beyond));
                checkEncode(ascii, random, chars(random, count, 0x100, beyond));
            }
        }
        // Single-class text, and a range longer than one bulk call
        for (String unit : new String[]{"a", "é", "€", "😀"}) {
            String text = unit.repeat(3000);
            for (Charset charset : new Charset[]{latin1, ascii}) {
                checkEncode(charset, random, text.toCharArray());
            }
        }
        for (byte unit : new byte[]{'a', (byte) 0xe9}) {
            byte[] data = new byte[3000];
            Arrays.fill(data, unit);
            checkDecode(latin1, random, data);
            checkDecode(ascii, random, data);
        }
        if (!light) {
            byte[] big = new byte[(1 << 20) + 37];
            Arrays.fill(big, (byte) 'x');
            String expected = new String(big, ascii);
            String decoded = expected.length() + ":" + expected + "|";
            for (var dst : CHAR_DESTINATIONS) {
                for (Charset charset : new Charset[]{latin1, ascii}) {
                    if (!decoded.equals(CoderTranscript.decode(charset, big, CoderTranscript.Kind.DIRECT, dst,
                            big.length, big.length + 4))) {
                        throw new AssertionError("large decode " + charset + " " + dst);
                    }
                }
            }
            StringBuilder hex = new StringBuilder();
            for (int i = 0; i < big.length; i++) {
                hex.append("78");
            }
            for (var dst : BYTE_DESTINATIONS) {
                for (Charset charset : new Charset[]{latin1, ascii}) {
                    if (!(hex + "|").equals(CoderTranscript.encode(charset, expected.toCharArray(), CoderTranscript.Kind.DIRECT,
                            dst, big.length, big.length + 8))) {
                        throw new AssertionError("large encode " + charset + " " + dst);
                    }
                }
            }
        }
        System.out.println("passed " + checks + " transcript comparisons");
    }
}
