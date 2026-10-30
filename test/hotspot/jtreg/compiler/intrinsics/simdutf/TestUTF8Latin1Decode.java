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
 * @summary String decoding converts UTF-8 text that is Latin-1 in bulk and continues with
 *          the Java loops and UTF-16 for anything else, as it did before
 * @modules java.base/jdk.internal.access
 * @build CoderTranscript
 * @run main/othervm -Xint TestUTF8Latin1Decode light
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 TestUTF8Latin1Decode
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics TestUTF8Latin1Decode
 * @run main/othervm -Xbatch -XX:-TieredCompilation TestUTF8Latin1Decode
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:+IgnoreUnrecognizedVMOptions -XX:UseAVX=2 TestUTF8Latin1Decode
 */

import java.nio.charset.MalformedInputException;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Random;
import jdk.internal.access.JavaLangAccess;
import jdk.internal.access.SharedSecrets;

public class TestUTF8Latin1Decode {
    private static final JavaLangAccess JLA = SharedSecrets.getJavaLangAccess();
    private static int checks;

    /** The text and the first malformed result as the element loops of the UTF-8 decoder produce them. */
    private static String reference(byte[] data) {
        return CoderTranscript.decode(StandardCharsets.UTF_8, data, CoderTranscript.Kind.HEAP,
                CoderTranscript.Kind.HEAP, CoderTranscript.SHORT_BYTES, CoderTranscript.SHORT_CHARS);
    }

    private static void check(byte[] data, int offset, int length) throws Exception {
        // Place the range in a larger array, so that the offsets in the decoder matter
        byte[] array = new byte[data.length + offset + 5];
        Arrays.fill(array, (byte) 0xff);
        System.arraycopy(data, 0, array, offset, length);
        byte[] original = array.clone();
        String expected = reference(Arrays.copyOfRange(array, offset, offset + length));
        int colon = expected.indexOf(':');
        int textLength = Integer.parseInt(expected.substring(0, colon));
        int bar = expected.lastIndexOf('|');
        String text = expected.substring(colon + 1, bar);
        String events = expected.substring(bar + 1);

        String lenient = new String(array, offset, length, StandardCharsets.UTF_8);
        if (!lenient.equals(text) || lenient.length() != textLength) {
            throw new AssertionError("new String length=" + length + " offset=" + offset + "\n"
                    + "expected " + text + "\nactual   " + lenient);
        }
        if (!Arrays.equals(array, original)) throw new AssertionError("caller array changed");

        // The strict decoder owns its input, which it may keep, and throws exactly when
        // the element loops of the decoder find malformed input
        byte[] owned = Arrays.copyOfRange(array, offset, offset + length);
        try {
            String strict = JLA.uncheckedNewStringOrThrow(owned, StandardCharsets.UTF_8);
            if (!events.isEmpty() || !strict.equals(text)) {
                throw new AssertionError("strict length=" + length + " events=" + events);
            }
        } catch (MalformedInputException e) {
            if (events.isEmpty()) {
                throw new AssertionError("strict length=" + length + " threw " + e);
            }
        }
        checks++;
    }

    private static byte[] latin1Text(Random random, int chars, int asciiPrefix, boolean accents) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < chars; i++) {
            if (i < asciiPrefix || !accents || random.nextInt(8) != 0) {
                sb.append((char) ('a' + random.nextInt(26)));
            } else {
                sb.append((char) (0xa0 + random.nextInt(0x60))); // U+00A0..U+00FF
            }
        }
        return sb.toString().getBytes(StandardCharsets.UTF_8);
    }

    private static void insert(byte[][] out, byte[] data, int at, int... bytes) {
        byte[] result = new byte[data.length + bytes.length];
        System.arraycopy(data, 0, result, 0, at);
        for (int i = 0; i < bytes.length; i++) result[at + i] = (byte) bytes[i];
        System.arraycopy(data, at, result, at + bytes.length, data.length - at);
        out[0] = result;
    }

    public static void main(String[] args) throws Exception {
        boolean light = args.length > 0;
        Random random = new Random(0x1a71);
        int[] charCounts = {0, 1, 30, 31, 32, 33, 60, 63, 64, 65, 66, 100, 255, 1000, 4097, 70000};
        int[] prefixes = {0, 1, 7, 33, 64, 70};
        int[][] interlopers = {
                {0xc4, 0x80},                 // U+0100, the first character outside Latin-1
                {0xe2, 0x82, 0xac},           // euro sign
                {0xf0, 0x9f, 0x98, 0x80},     // supplementary
                {0xc0, 0x80},                 // overlong NUL
                {0x80},                       // stray continuation
                {0xc3},                       // truncated Latin-1 sequence
                {0xc3, 0x41},                 // Latin-1 lead and a byte that is not a continuation
                {0xe0, 0x80, 0x80},           // overlong
                {0xed, 0xa0, 0x80},           // surrogate
                {0xf4, 0x90, 0x80, 0x80},     // above U+10FFFF
                {0xf8}                        // never a lead byte
        };
        for (int chars : charCounts) {
            if (light && chars > 4097) continue;
            for (int prefix : prefixes) {
                byte[] plain = latin1Text(random, chars, prefix, true);
                for (int offset : new int[]{0, 3}) {
                    check(plain, offset, plain.length);
                }
                if (plain.length == 0) continue;
                for (int[] bad : interlopers) {
                    for (int at : new int[]{0, plain.length / 3, plain.length / 2, plain.length - 1, plain.length}) {
                        // Between characters, and a repeat where the bytes of a character would be split
                        int cut = Math.max(0, Math.min(at, plain.length));
                        byte[][] holder = new byte[1][];
                        insert(holder, plain, cut, bad);
                        check(holder[0], 1, holder[0].length - 1);
                        check(holder[0], 0, holder[0].length);
                    }
                }
                // Latin-1 text that ends inside a sequence
                check(plain, 0, plain.length - 1);
                // The same text with no accents, which the ASCII prefix covers completely
                check(latin1Text(random, chars, 0, false), 0, chars);
            }
        }
        // More than the bulk conversion does in one call, which is converted in several
        if (!light) {
            byte[] big = latin1Text(random, 1_600_000, 3, true);
            check(big, 0, big.length);
            byte[] bigEnd = latin1Text(random, 1_600_000, 3, true);
            byte[] withEuro = Arrays.copyOf(bigEnd, bigEnd.length + 3);
            withEuro[bigEnd.length] = (byte) 0xe2;
            withEuro[bigEnd.length + 1] = (byte) 0x82;
            withEuro[bigEnd.length + 2] = (byte) 0xac;
            check(withEuro, 0, withEuro.length);
        }
        // The decoder chooses its path from the first non-ASCII byte and the range length
        for (String text : new String[]{"é".repeat(500), "Â".repeat(500), "Ā".repeat(500),
                                        "a".repeat(100) + "ÿ" + "€".repeat(100), "😀".repeat(100)}) {
            check(text.getBytes(StandardCharsets.UTF_8), 0, text.getBytes(StandardCharsets.UTF_8).length);
        }

        // Concurrent modification of the caller's array may change the text but never the
        // consistency of the String that is built
        byte[] shared = latin1Text(random, 4000, 3, true);
        Thread modifier = new Thread(() -> {
            Random r = new Random(7);
            while (!Thread.interrupted()) {
                int i = r.nextInt(shared.length);
                shared[i] = (byte) (r.nextBoolean() ? 0x41 + r.nextInt(26) : r.nextInt(256));
            }
        });
        modifier.start();
        try {
            for (int i = 0; i < (light ? 100 : 3000); i++) {
                String s = new String(shared, StandardCharsets.UTF_8);
                if (s.length() > shared.length) throw new AssertionError("racy decode");
                s.getBytes(StandardCharsets.UTF_8); // the encoder accepts what the decoder built
                s.hashCode();
            }
        } finally {
            modifier.interrupt();
            modifier.join();
        }
        System.out.println("passed " + checks + " comparisons");
    }
}
