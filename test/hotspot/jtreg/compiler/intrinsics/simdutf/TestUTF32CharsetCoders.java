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
 * @summary The UTF-32 Charset decoders and encoders convert data of either byte order in
 *          bulk with the byte order, BOM handling, positions and incremental behavior of
 *          their element loops
 * @build CoderTranscript
 * @run main/othervm -Xint TestUTF32CharsetCoders light
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 TestUTF32CharsetCoders
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics TestUTF32CharsetCoders
 * @run main/othervm -Xbatch -XX:-TieredCompilation TestUTF32CharsetCoders
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:+IgnoreUnrecognizedVMOptions -XX:UseAVX=2 TestUTF32CharsetCoders
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:+IgnoreUnrecognizedVMOptions -XX:UseAVX=0 TestUTF32CharsetCoders
 */

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;
import java.util.Random;

public class TestUTF32CharsetCoders {
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
        int units = data.length / 4;
        int[] outputs = {2 * units + 8, units / 2 + 2, 2 + random.nextInt(2 * units + 8)};
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
                CoderTranscript.SHORT_CHARS, 4 * CoderTranscript.SHORT_BYTES);
        int[] outputs = {4 * data.length + 12, 4 * data.length / 2 + 8, 8 + random.nextInt(4 * data.length + 12)};
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

    /** Code points in the given order; invalid ones are included when asked for. */
    private static byte[] codePoints(Random random, int count, boolean little, boolean bom, boolean invalid) {
        ByteBuffer b = ByteBuffer.allocate(4 * (count + 1)).order(little ? ByteOrder.LITTLE_ENDIAN : ByteOrder.BIG_ENDIAN);
        if (bom) {
            b.putInt(0xfeff);
        }
        int[] bad = {0xd800, 0xdfff, 0x110000, 0x7fffffff, 0x80000000, 0xffffffff, 0xdc00};
        for (int i = 0; i < count; i++) {
            int kind = random.nextInt(10);
            int cp;
            if (kind < 4) {
                cp = random.nextInt(0x80);
            } else if (kind < 8) {
                do {
                    cp = 0x80 + random.nextInt(0xff80);
                } while (cp >= 0xd800 && cp <= 0xdfff);
            } else {
                cp = 0x10000 + random.nextInt(0x100000);
            }
            b.putInt(cp);
        }
        if (invalid && count > 0) {
            for (int n = 1 + random.nextInt(2); n > 0; n--) {
                int at = (bom ? 1 : 0) + random.nextInt(count);
                b.putInt(4 * at, bad[random.nextInt(bad.length)]);
            }
        }
        byte[] bytes = new byte[b.position() == 0 ? 0 : 4 * (count + (bom ? 1 : 0))];
        b.rewind().get(bytes);
        return bytes;
    }

    public static void main(String[] args) {
        boolean light = args.length > 0;
        Random random = new Random(0x32);
        int[] counts = {0, 1, 31, 32, 33, 64, 100, 255, 1000, 2049};
        // Both byte orders take the bulk step, the detecting charset after its mark
        String[] names = {"UTF-32LE", "X-UTF-32LE-BOM", "UTF-32", "UTF-32BE", "X-UTF-32BE-BOM"};
        for (String name : names) {
            Charset charset = Charset.forName(name);
            boolean little = name.contains("LE");
            for (int pass = 0; pass < 1; pass++) {
                for (int count : counts) {
                    for (boolean invalid : new boolean[]{false, true}) {
                        byte[] data = codePoints(random, count, little, false, invalid);
                        checkDecode(charset, random, data);
                        // The detecting charset reads a byte order mark at the start
                        byte[] marked = codePoints(random, count, little, true, invalid);
                        checkDecode(charset, random, marked);
                        if (name.equals("UTF-32")) {
                            // A little-endian mark switches the detecting charset to little-endian
                            checkDecode(charset, random, codePoints(random, count, true, true, invalid));
                        }
                        if (data.length > 0) {
                            checkDecode(charset, random, java.util.Arrays.copyOf(data, data.length - 1 - random.nextInt(3)));
                        }
                    }
                    char[] chars = CoderTranscript.randomChars(random, count, false);
                    checkEncode(charset, random, chars);
                    if (count > 0) {
                        checkEncode(charset, random, CoderTranscript.randomChars(random, count, true));
                        checkEncode(charset, random, java.util.Arrays.copyOf(chars, count - 1));
                    }
                }
            }
        }
        // Single-class text, and a range longer than one bulk call, in both orders
        Charset le = Charset.forName("UTF-32LE");
        Charset be = Charset.forName("UTF-32BE");
        for (Charset order : new Charset[]{le, be}) {
            for (String unit : new String[]{"a", "€", "😀"}) {
                String text = unit.repeat(3000);
                byte[] bytes = text.getBytes(order);
                checkDecode(order, random, bytes);
                checkEncode(order, random, text.toCharArray());
            }
            // A pair or a supplementary code point at, and either side of, the blocks of 512 and
            // 1024 units in which the big-endian step swaps and converts
            int[] edges = light ? new int[]{31, 511, 1023}
                                : new int[]{29, 30, 31, 32, 33, 62, 63, 64, 65, 126, 127, 128, 129, 254, 255, 256, 257,
                                            510, 511, 512, 513, 1022, 1023, 1024, 1025, 1534, 1535};
            for (int at : edges) {
                char[] chars = "a".repeat(1600).toCharArray();
                chars[at] = '\ud83d';
                chars[at + 1] = '\ude00';
                checkEncode(order, random, chars);
                checkDecode(order, random, new String(chars).getBytes(order));
            }
            String big = "a€😀".repeat((1 << 20) / 3 + 5);
            byte[] bytes = big.getBytes(order);
            String expected = big.length() + ":" + big + "|";
            for (var dst : CHAR_DESTINATIONS) {
                if (!expected.equals(CoderTranscript.decode(order, bytes, CoderTranscript.Kind.DIRECT, dst, bytes.length, big.length() + 4))) {
                    throw new AssertionError("large decode " + order + " " + dst);
                }
            }
            StringBuilder hex = new StringBuilder();
            for (byte b : bytes) {
                hex.append(Character.forDigit((b >> 4) & 15, 16)).append(Character.forDigit(b & 15, 16));
            }
            for (var dst : BYTE_DESTINATIONS) {
                if (!(hex + "|").equals(CoderTranscript.encode(order, big.toCharArray(), CoderTranscript.Kind.DIRECT, dst,
                        big.length(), bytes.length + 8))) {
                    throw new AssertionError("large encode " + order + " " + dst);
                }
            }
        }
        System.out.println("passed " + checks + " transcript comparisons");
    }
}
