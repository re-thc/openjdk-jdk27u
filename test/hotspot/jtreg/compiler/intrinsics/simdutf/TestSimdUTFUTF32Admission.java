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
 * @summary UTF-32 admission agrees with valid native conversion before callers allocate storage
 * @modules java.base/jdk.internal.util
 *          jdk.management
 * @run main/othervm TestSimdUTFUTF32Admission
 * @run main/othervm -Xint TestSimdUTFUTF32Admission
 * @run main/othervm -XX:SIMDUTFMinLength=1 TestSimdUTFUTF32Admission
 * @run main/othervm -XX:SIMDUTFMinLength=128 TestSimdUTFUTF32Admission
 * @run main/othervm -XX:SIMDUTFMinLength=256 TestSimdUTFUTF32Admission
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics TestSimdUTFUTF32Admission
 */

import com.sun.management.HotSpotDiagnosticMXBean;
import java.lang.management.ManagementFactory;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.TreeSet;
import jdk.internal.util.SimdUTF;

public class TestSimdUTFUTF32Admission {
    private static int accepted;
    private static int rejected;
    private static int bufferCases;

    public static void main(String[] args) {
        checkShortInput();
        int minimum = Integer.parseInt(ManagementFactory.getPlatformMXBean(HotSpotDiagnosticMXBean.class)
                .getVMOption("SIMDUTFMinLength").getValue());
        int minimum32 = aligned(minimum, 4);
        int operation32 = aligned(Math.max(minimum, 64), 4);
        var boundaries = new TreeSet<Integer>();
        boundaries.add(minimum32);
        boundaries.add(operation32);
        var lengths = new TreeSet<Integer>();
        for (int length : new int[]{0, 4, 28, 32, 36, 60, 64, 68, 124, 128, 132}) {
            lengths.add(length);
        }
        for (int boundary : boundaries) {
            lengths.add(boundary - 4);
            lengths.add(boundary);
            lengths.add(boundary + 4);
            lengths.add(2 * boundary);
            lengths.add(2 * boundary + 4);
        }
        for (int length : lengths) {
            for (boolean big : new boolean[]{false, true}) {
                byte[] input = wire(4, length / 4, big, false, false);
                checkAdmission(input, 0, length, 4, big);
                Charset charset = Charset.forName(big ? "UTF-32BE" : "UTF-32LE");
                String text = "\u6f22".repeat(length / 4);
                checkString(input, charset, text);
                if (!Arrays.equals(text.getBytes(charset), input)) {
                    throw new AssertionError("String encode at " + length);
                }
                checkBuffers(input, charset, text, 4, 0, 1, text.length());
            }
        }
        if (SimdUTF.isEnabled() && (accepted == 0 || rejected == 0)) {
            throw new AssertionError("Missing positive or negative native admission: " + minimum);
        }
        for (boolean big : new boolean[]{false, true}) {
            for (int boundary : boundaries) {
                for (int delta : new int[]{-4, 0, 4}) {
                    int points = (boundary + delta) / 4;
                    byte[] input = wire(4, points, big, true, false);
                    checkAdmission(input, 4, boundary + delta, 4, big);
                    Charset charset = Charset.forName("UTF-32");
                    String text = "\u6f22".repeat(points);
                    checkString(input, charset, text);
                    checkBuffers(input, charset, text, 4, 4, 1, text.length());
                }
            }
            int minimum16 = aligned(minimum, 2);
            for (int delta : new int[]{-2, 0, 2}) {
                int chars = (minimum16 + delta) / 2;
                byte[] input = wire(2, chars, big, true, false);
                checkAdmission(input, 2, minimum16 + delta, 2, big);
                Charset charset = Charset.forName("UTF-16");
                String text = "\u6f22".repeat(chars);
                checkString(input, charset, text);
                checkBuffers(input, charset, text, 2, 2, 1, chars);
            }
            // The source is eligible, while destination capacity can place the
            // staged prefix below, at or above the operation's admission floor.
            for (boolean supplementary : new boolean[]{false, true}) {
                int points = operation32 / 2;
                String text = (supplementary ? "\ud83d\ude03" : "\u6f22").repeat(points);
                byte[] input = wire(4, points, big, true, supplementary);
                int capacity = operation32 / 4;
                for (int limit : new int[]{0, capacity - 1, capacity, capacity + 1}) {
                    checkBuffers(input, Charset.forName("UTF-32"), text,
                            4, 4, supplementary ? 2 : 1, limit);
                }
            }
            byte[] input = wire(2, minimum16, big, true, false);
            String text = "\u6f22".repeat(minimum16);
            for (int limit : new int[]{0, minimum16 / 2 - 1, minimum16 / 2, minimum16 / 2 + 1}) {
                checkBuffers(input, Charset.forName("UTF-16"), text, 2, 2, 1, limit);
            }
        }
        System.out.println("minimum=" + minimum + " accepted=" + accepted
                + " rejected=" + rejected + " bufferCases=" + bufferCases);
    }

    // Full capacity and valid BMP data isolate admission from later rejection routes.
    private static void checkAdmission(byte[] input, int offset, int length, int width, boolean big) {
        char[] output = new char[length / width];
        Arrays.fill(output, '\u5555');
        int count = width == 4
                ? SimdUTF.decodeUTF32Bytes(input, offset, length, output, 0, output.length, big)
                : SimdUTF.decodeUTF16Bytes(input, offset, length, output, 0, output.length, big);
        boolean eligible = width == 4 ? SimdUTF.isEligibleUTF32Decoding(length) : SimdUTF.isEligible(length);
        if (eligible != (count == output.length)) {
            throw new AssertionError("Admission disagrees with conversion at " + offset + "/" + length);
        }
        if (width == 4) {
            if (count < 0) rejected++; else accepted++;
        }
        char expected = count < 0 ? '\u5555' : '\u6f22';
        for (char c : output) {
            if (c != expected) throw new AssertionError("Unexpected conversion output");
        }
    }

    private static int aligned(int value, int alignment) {
        return Math.toIntExact(((long)value + alignment - 1) & -alignment);
    }

    private static byte[] wire(int width, int points, boolean big, boolean bom, boolean supplementary) {
        int prefix = bom ? width : 0;
        byte[] input = new byte[prefix + width * points];
        if (bom) put(input, 0, 0xfeff, width, big);
        for (int i = 0; i < points; i++) {
            put(input, prefix + width * i, supplementary ? 0x1f603 : 0x6f22, width, big);
        }
        return input;
    }

    private static void put(byte[] bytes, int offset, int cp, int width, boolean big) {
        for (int i = 0; i < width; i++) {
            bytes[offset + (big ? width - 1 - i : i)] = (byte)(cp >>> (8 * i));
        }
    }

    private static void checkString(byte[] input, Charset charset, String text) {
        if (!new String(input, charset).equals(text)) {
            throw new AssertionError("String decode for " + charset + " at " + input.length);
        }
    }

    private static void checkShortInput() {
        for (boolean big : new boolean[]{false, true}) {
            Charset charset = Charset.forName(big ? "UTF-32BE" : "UTF-32LE");
            byte[] bytes = wire(4, 1, big, false, false);
            for (int length = 0; length < 4; length++) {
                ByteBuffer direct = ByteBuffer.allocateDirect(4);
                direct.put(bytes).flip();
                for (ByteBuffer input : new ByteBuffer[]{ByteBuffer.wrap(bytes), direct,
                        ByteBuffer.wrap(bytes).asReadOnlyBuffer()}) {
                    char[] storage = new char[8];
                    Arrays.fill(storage, '\u5555');
                    CharBuffer output = CharBuffer.wrap(storage);
                    output.position(3).limit(5);
                    input.limit(length);
                    var decoder = charset.newDecoder();
                    var result = decoder.decode(input, output, false);
                    if (!result.isUnderflow() || input.position() != 0 || output.position() != 3) {
                        throw new AssertionError("Partial UTF32 input at " + length);
                    }
                    input.limit(4);
                    result = decoder.decode(input, output, true);
                    if (!result.isUnderflow() || input.position() != 4 || output.position() != 4) {
                        throw new AssertionError("Resumed UTF32 input at " + length);
                    }
                    for (int i = 0; i < storage.length; i++) {
                        if (storage[i] != (i == 3 ? '\u6f22' : '\u5555')) {
                            throw new AssertionError("Partial UTF32 output/canary at " + i);
                        }
                    }
                    ByteBuffer truncated = input.duplicate();
                    truncated.position(0).limit(length);
                    result = charset.newDecoder().decode(truncated, CharBuffer.allocate(2), true);
                    if (length == 0 ? !result.isUnderflow()
                            : !result.isMalformed() || result.length() != length) {
                        throw new AssertionError("Truncated UTF32 result at " + length);
                    }
                    if (truncated.position() != 0) throw new AssertionError("Truncated UTF32 position");
                    bufferCases++;
                }
            }
        }
    }

    private static void checkBuffers(byte[] input, Charset charset, String text,
                                     int width, int prefix, int charsPerPoint, int capacity) {
        ByteBuffer direct = ByteBuffer.allocateDirect(input.length);
        direct.put(input).flip();
        for (ByteBuffer buffer : new ByteBuffer[]{direct, ByteBuffer.wrap(input).asReadOnlyBuffer()}) {
            char[] storage = new char[capacity + 6];
            Arrays.fill(storage, '\u5555');
            CharBuffer output = CharBuffer.wrap(storage);
            output.position(3).limit(3 + capacity);
            int written = Math.min(text.length(), capacity / charsPerPoint * charsPerPoint);
            var result = charset.newDecoder().decode(buffer, output, true);
            if (written < text.length() ? !result.isOverflow() : !result.isUnderflow()) {
                throw new AssertionError("Decode result " + result + " for " + charset);
            }
            if (buffer.position() != prefix + written / charsPerPoint * width
                    || buffer.limit() != input.length || output.position() != 3 + written
                    || output.limit() != 3 + capacity) {
                throw new AssertionError("Decode positions for " + charset + " capacity " + capacity);
            }
            for (int i = 0; i < storage.length; i++) {
                char expected = i >= 3 && i < 3 + written ? text.charAt(i - 3) : '\u5555';
                if (storage[i] != expected) throw new AssertionError("Output/canary at " + i);
            }
            bufferCases++;
        }
    }
}
