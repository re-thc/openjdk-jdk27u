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
 * @summary The UTF-8 Charset decoder and encoder convert in bulk with the results,
 *          positions and incremental behavior of their element loops
 * @build CoderTranscript
 * @run main/othervm -Xint TestUTF8CharsetCoders light
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 TestUTF8CharsetCoders
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics TestUTF8CharsetCoders
 * @run main/othervm -Xbatch -XX:-TieredCompilation TestUTF8CharsetCoders
 * @run main/othervm -Xbatch -XX:-CompactStrings TestUTF8CharsetCoders
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:+IgnoreUnrecognizedVMOptions -XX:UseAVX=2 TestUTF8CharsetCoders
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:+IgnoreUnrecognizedVMOptions -XX:UseAVX=0 TestUTF8CharsetCoders
 */

import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Random;

public class TestUTF8CharsetCoders {
    private static final CoderTranscript.Kind[] SOURCES = {
            CoderTranscript.Kind.HEAP, CoderTranscript.Kind.HEAP_ALIGNED, CoderTranscript.Kind.DIRECT,
            CoderTranscript.Kind.DIRECT_ODD, CoderTranscript.Kind.READ_ONLY };
    private static final CoderTranscript.Kind[] CHAR_DESTINATIONS = {
            CoderTranscript.Kind.HEAP, CoderTranscript.Kind.HEAP_ALIGNED, CoderTranscript.Kind.DIRECT,
            CoderTranscript.Kind.DIRECT_ODD, CoderTranscript.Kind.SWAPPED };
    private static final CoderTranscript.Kind[] BYTE_DESTINATIONS = {
            CoderTranscript.Kind.HEAP, CoderTranscript.Kind.HEAP_ALIGNED, CoderTranscript.Kind.DIRECT,
            CoderTranscript.Kind.DIRECT_ODD };
    private static final CoderTranscript.Kind[] CHAR_SOURCES = {
            CoderTranscript.Kind.HEAP, CoderTranscript.Kind.HEAP_ALIGNED, CoderTranscript.Kind.DIRECT,
            CoderTranscript.Kind.DIRECT_ODD,
            CoderTranscript.Kind.READ_ONLY, CoderTranscript.Kind.SWAPPED, CoderTranscript.Kind.STRING };

    private static int checks;

    private static void checkDecode(Random random, byte[] data) {
        String expected = CoderTranscript.decode(StandardCharsets.UTF_8, data,
                CoderTranscript.Kind.HEAP, CoderTranscript.Kind.HEAP,
                CoderTranscript.SHORT_BYTES, CoderTranscript.SHORT_CHARS);
        int[] outputs = {data.length + 8, data.length / 2 + 2, 70, 2 + random.nextInt(data.length + 8)};
        for (var src : SOURCES) {
            for (var dst : CHAR_DESTINATIONS) {
                for (int out : outputs) {
                    int window = random.nextBoolean() ? data.length : 32 + random.nextInt(1 + data.length);
                    String actual = CoderTranscript.decode(StandardCharsets.UTF_8, data, src, dst,
                            Math.max(window, 1), Math.max(out, 2));
                    if (!expected.equals(actual)) {
                        throw new AssertionError("decode " + src + " -> " + dst + " window=" + window
                                + " out=" + out + " length=" + data.length + "\nexpected " + expected
                                + "\nactual   " + actual);
                    }
                    checks++;
                }
            }
        }
    }

    private static void checkEncode(Random random, char[] data) {
        String expected = CoderTranscript.encode(StandardCharsets.UTF_8, data,
                CoderTranscript.Kind.HEAP, CoderTranscript.Kind.HEAP,
                CoderTranscript.SHORT_CHARS, 4 * CoderTranscript.SHORT_BYTES);
        int[] outputs = {3 * data.length + 8, data.length + 5, 70, 4 + random.nextInt(3 * data.length + 8)};
        for (var src : CHAR_SOURCES) {
            for (var dst : BYTE_DESTINATIONS) {
                for (int out : outputs) {
                    int window = random.nextBoolean() ? data.length : 32 + random.nextInt(1 + data.length);
                    String actual = CoderTranscript.encode(StandardCharsets.UTF_8, data, src, dst,
                            Math.max(window, 1), Math.max(out, 4));
                    if (!expected.equals(actual)) {
                        throw new AssertionError("encode " + src + " -> " + dst + " window=" + window
                                + " out=" + out + " length=" + data.length + "\nexpected " + expected
                                + "\nactual   " + actual);
                    }
                    checks++;
                }
            }
        }
    }

    /** Chars that a compact string holds: ASCII and Latin-1, in mixed runs. */
    private static char[] latin1Chars(Random random, int length) {
        char[] chars = new char[length];
        for (int i = 0; i < length; ) {
            int run = 1 + random.nextInt(40);
            boolean high = random.nextBoolean();
            for (int j = 0; j < run && i < length; j++, i++) {
                chars[i] = high ? (char) (0x80 + random.nextInt(0x80)) : (char) (' ' + random.nextInt(95));
            }
        }
        return chars;
    }

    /**
     * Buffers made by wrapping a string read the string's storage from an offset: wrapping a
     * range, a slice, a duplicate and a subsequence of one, for compact strings and others.
     */
    private static void checkStringBuffers(Random random, String s) {
        int length = s.length();
        for (int round = 0; round < 6; round++) {
            int from = random.nextInt(length / 2 + 1);
            int to = length - random.nextInt(length / 4 + 1);
            CharBuffer wrapped = CharBuffer.wrap(s, from, to);              // position from, limit to
            CharBuffer slice = CharBuffer.wrap(s, from, to).slice();        // offset from
            CharBuffer inner = slice.subSequence(random.nextInt(4), slice.remaining() - random.nextInt(4));
            CharBuffer copy = wrapped.duplicate();
            int skip = random.nextInt(8);
            copy.position(Math.min(copy.limit(), copy.position() + skip));
            CharBuffer[] buffers = {wrapped, slice, inner, copy};
            for (CharBuffer in : buffers) {
                String want = in.toString();
                byte[] expected = want.getBytes(StandardCharsets.UTF_8);
                for (ByteBuffer out : new ByteBuffer[]{ByteBuffer.allocate(3 * length + 16),
                                                       ByteBuffer.allocateDirect(3 * length + 16)}) {
                    CharBuffer source = in.duplicate();
                    var result = StandardCharsets.UTF_8.newEncoder()
                            .onMalformedInput(CodingErrorAction.REPLACE)
                            .onUnmappableCharacter(CodingErrorAction.REPLACE)
                            .encode(source, out, true);
                    if (!result.isUnderflow() || source.hasRemaining()) {
                        throw new AssertionError("string buffer " + result + " remaining " + source.remaining());
                    }
                    out.flip();
                    byte[] actual = new byte[out.remaining()];
                    out.get(actual);
                    if (!Arrays.equals(expected, actual)) {
                        throw new AssertionError("string buffer from=" + from + " to=" + to + " length=" + length
                                + " first difference at " + Arrays.mismatch(expected, actual));
                    }
                    checks++;
                }
            }
        }
    }

    private static byte[] corrupt(Random random, byte[] valid) {
        byte[] data = valid.clone();
        int[][] shapes = {{0xc0, 0x80}, {0xed, 0xa0, 0x80}, {0xe0, 0x80, 0x80}, {0xf4, 0x90, 0x80, 0x80},
                          {0xf5}, {0x80}, {0xe2, 0x82}, {0xf0, 0x9f, 0x98}, {0xc2}, {0xe2, 0x41}};
        for (int n = 1 + random.nextInt(3); n > 0; n--) {
            int[] shape = shapes[random.nextInt(shapes.length)];
            int at = random.nextInt(data.length);
            switch (random.nextInt(3)) {
                case 0 -> { // overwrite
                    for (int i = 0; i < shape.length && at + i < data.length; i++) data[at + i] = (byte) shape[i];
                }
                case 1 -> { // truncate, possibly inside a sequence
                    data = Arrays.copyOf(data, Math.max(1, at));
                }
                default -> data[at] = (byte) random.nextInt(256);
            }
            if (data.length == 0) break;
        }
        return data;
    }

    public static void main(String[] args) {
        Random random = new Random(0x5eed);
        int[] lengths = {0, 1, 31, 32, 33, 63, 64, 65, 100, 255, 256, 257, 1000, 4097};
        for (int pass = 0; pass < (args.length > 0 ? 1 : 2); pass++) {
            for (int length : lengths) {
                char[] chars = CoderTranscript.randomChars(random, length, false);
                byte[] valid = new String(chars).getBytes(StandardCharsets.UTF_8);
                checkDecode(random, valid);
                if (valid.length > 0) {
                    checkDecode(random, corrupt(random, valid));
                    checkDecode(random, Arrays.copyOf(valid, valid.length - 1)); // may end inside a sequence
                }
                checkEncode(random, chars);
                char[] compact = latin1Chars(random, length);
                checkEncode(random, compact);
                if (length >= 64) {
                    checkStringBuffers(random, new String(compact));
                    checkStringBuffers(random, new String(chars));
                }
                if (length > 0) {
                    checkEncode(random, CoderTranscript.randomChars(random, length, true));
                    checkEncode(random, Arrays.copyOf(chars, length - 1)); // may end after a high surrogate
                }
            }
        }
        // Text of a single class, where the bulk step covers the whole range
        for (String unit : new String[]{"a", "é", "€", "😀", "あ"}) {
            String text = unit.repeat(5000);
            checkDecode(random, text.getBytes(StandardCharsets.UTF_8));
            checkEncode(random, text.toCharArray());
        }
        // A range longer than one bulk call: 1 MiB plus a partial sequence at the bound
        for (String unit : new String[]{"a€", "😀", "é"}) {
            String text = unit.repeat((1 << 20) / unit.length() / 2 * 2 + 17);
            byte[] bytes = text.getBytes(StandardCharsets.UTF_8);
            String expected = CoderTranscript.decode(StandardCharsets.UTF_8, bytes,
                    CoderTranscript.Kind.HEAP, CoderTranscript.Kind.HEAP, bytes.length, text.length() + 4);
            if (!expected.equals(text.length() + ":" + text + "|")) throw new AssertionError("large decode");
            for (var dst : CHAR_DESTINATIONS) {
                if (!expected.equals(CoderTranscript.decode(StandardCharsets.UTF_8, bytes,
                        CoderTranscript.Kind.DIRECT, dst, bytes.length, text.length() + 4))) {
                    throw new AssertionError("large decode " + dst);
                }
            }
            String encoded = CoderTranscript.encode(StandardCharsets.UTF_8, text.toCharArray(),
                    CoderTranscript.Kind.HEAP, CoderTranscript.Kind.HEAP, text.length(), 3 * text.length() + 4);
            if (!encoded.equals(CoderTranscript.encode(StandardCharsets.UTF_8, text.toCharArray(),
                    CoderTranscript.Kind.DIRECT, CoderTranscript.Kind.DIRECT, text.length(), bytes.length + 4))) {
                throw new AssertionError("large encode");
            }
        }
        System.out.println("passed " + checks + " transcript comparisons");
    }
}
