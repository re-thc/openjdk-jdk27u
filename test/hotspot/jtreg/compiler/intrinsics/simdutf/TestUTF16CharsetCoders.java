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
 * @summary The UTF-16 Charset decoders and encoders convert well-formed text in bulk with
 *          the byte order, BOM handling, positions, malformed results and incremental
 *          behavior of their element loops
 * @build CoderTranscript
 * @run main/othervm -Xint TestUTF16CharsetCoders light
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 TestUTF16CharsetCoders
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics TestUTF16CharsetCoders
 * @run main/othervm -Xbatch -XX:-TieredCompilation TestUTF16CharsetCoders
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:+IgnoreUnrecognizedVMOptions -XX:UseAVX=2 TestUTF16CharsetCoders
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:+IgnoreUnrecognizedVMOptions -XX:UseAVX=0 TestUTF16CharsetCoders
 */

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.Random;

public class TestUTF16CharsetCoders {
    private static final CoderTranscript.Kind[] SOURCES = {
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

    private static void checkDecode(Charset charset, Random random, byte[] data) {
        String expected = CoderTranscript.decode(charset, data,
                CoderTranscript.Kind.HEAP, CoderTranscript.Kind.HEAP,
                CoderTranscript.SHORT_BYTES, CoderTranscript.SHORT_CHARS);
        int units = data.length / 2;
        int[] outputs = {units + 8, units / 2 + 2, 2 + random.nextInt(units + 8)};
        for (var src : SOURCES) {
            for (var dst : CHAR_DESTINATIONS) {
                for (int out : outputs) {
                    int window = random.nextBoolean() ? data.length : 128 + random.nextInt(1 + data.length);
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
                CoderTranscript.SHORT_CHARS, 2 * CoderTranscript.SHORT_BYTES);
        int[] outputs = {2 * data.length + 12, data.length + 8, 8 + random.nextInt(2 * data.length + 12)};
        for (var src : CHAR_SOURCES) {
            for (var dst : BYTE_DESTINATIONS) {
                for (int out : outputs) {
                    int window = random.nextBoolean() ? data.length : 64 + random.nextInt(1 + data.length);
                    String actual = CoderTranscript.encode(charset, data, src, dst, Math.max(window, 1), Math.max(out, 8));
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

    /** The chars as bytes in the given order, with a mark before them when asked for. */
    private static byte[] units(char[] chars, boolean little, boolean mark) {
        ByteBuffer b = ByteBuffer.allocate(2 * (chars.length + 1)).order(little ? ByteOrder.LITTLE_ENDIAN : ByteOrder.BIG_ENDIAN);
        if (mark) {
            b.putChar('\ufeff');
        }
        for (char c : chars) {
            b.putChar(c);
        }
        return Arrays.copyOf(b.array(), b.position());
    }

    public static void main(String[] args) {
        Random random = new Random(0x16);
        int[] counts = {0, 1, 31, 32, 33, 64, 100, 255, 1000, 2049};
        // Every flavor: the detecting charset reads a mark and otherwise decodes big-endian
        String[] names = {"UTF-16", "UTF-16BE", "UTF-16LE", "X-UTF-16LE-BOM"};
        for (String name : names) {
            Charset charset = Charset.forName(name);
            boolean little = name.contains("LE");
            for (int count : counts) {
                for (boolean invalid : new boolean[]{false, true}) {
                    char[] chars = CoderTranscript.randomChars(random, count, invalid);
                    byte[] plain = units(chars, little, false);
                    checkDecode(charset, random, plain);
                    // A mark at the start, in the order of the charset and in the other one
                    checkDecode(charset, random, units(chars, little, true));
                    checkDecode(charset, random, units(chars, !little, true));
                    if (plain.length > 0) {
                        // An odd length ends in half a unit
                        checkDecode(charset, random, Arrays.copyOf(plain, plain.length - 1));
                    }
                    checkEncode(charset, random, chars);
                    if (count > 0) {
                        checkEncode(charset, random, Arrays.copyOf(chars, count - 1));
                    }
                }
            }
        }
        // The loops are shared with the reference above, so valid text is also checked against
        // what it must be: the decoded text is the original, and the bytes are built by hand.
        for (String name : names) {
            Charset charset = Charset.forName(name);
            boolean little = name.contains("LE");
            boolean mark = name.equals("UTF-16") || name.equals("X-UTF-16LE-BOM");
            for (int count : counts) {
                char[] chars = CoderTranscript.randomChars(random, count, false);
                if (count > 0 && (chars[0] == '\ufeff' || chars[0] == '\ufffe')) {
                    continue;
                }
                byte[] plain = units(chars, little, false);
                String text = chars.length + ":" + new String(chars) + "|";
                StringBuilder hex = new StringBuilder();
                for (byte b : units(chars, little, mark && chars.length > 0)) {
                    hex.append(Character.forDigit((b >> 4) & 15, 16)).append(Character.forDigit(b & 15, 16));
                }
                for (int window : new int[]{Math.max(1, plain.length), 7, 64, 129}) {
                    String decoded = CoderTranscript.decode(charset, plain, CoderTranscript.Kind.HEAP,
                            CoderTranscript.Kind.HEAP, window, chars.length + 8);
                    if (!text.equals(decoded)) {
                        throw new AssertionError(name + " decode window=" + window + " count=" + count
                                + "\nexpected " + text + "\nactual   " + decoded);
                    }
                    String encoded = CoderTranscript.encode(charset, chars, CoderTranscript.Kind.HEAP,
                            CoderTranscript.Kind.HEAP, Math.max(1, window / 2), 2 * chars.length + 16);
                    if (!(hex + "|").equals(encoded)) {
                        throw new AssertionError(name + " encode window=" + window + " count=" + count
                                + "\nexpected " + hex + "|\nactual   " + encoded);
                    }
                    checks += 2;
                }
            }
        }
        // Single-class text, and a range longer than one bulk call
        Charset be = Charset.forName("UTF-16BE");
        Charset le = Charset.forName("UTF-16LE");
        for (String unit : new String[]{"a", "\u20ac", "\ud83d\ude00"}) {
            String text = unit.repeat(3000);
            for (Charset cs : new Charset[]{be, le}) {
                checkDecode(cs, random, text.getBytes(cs));
                checkEncode(cs, random, text.toCharArray());
            }
        }
        String big = "a\u20ac\ud83d\ude00".repeat((1 << 20) / 3 + 5);
        for (Charset cs : new Charset[]{be, le}) {
            byte[] bytes = big.getBytes(cs);
            String expected = big.length() + ":" + big + "|";
            for (var dst : CHAR_DESTINATIONS) {
                if (!expected.equals(CoderTranscript.decode(cs, bytes, CoderTranscript.Kind.DIRECT, dst, bytes.length, big.length() + 4))) {
                    throw new AssertionError("large decode " + cs + " " + dst);
                }
            }
            StringBuilder hex = new StringBuilder();
            for (byte b : bytes) {
                hex.append(Character.forDigit((b >> 4) & 15, 16)).append(Character.forDigit(b & 15, 16));
            }
            for (var dst : BYTE_DESTINATIONS) {
                if (!(hex + "|").equals(CoderTranscript.encode(cs, big.toCharArray(), CoderTranscript.Kind.DIRECT, dst,
                        big.length(), bytes.length + 8))) {
                    throw new AssertionError("large encode " + cs + " " + dst);
                }
            }
        }
        System.out.println("passed " + checks + " transcript comparisons");
    }
}
