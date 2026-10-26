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
 * @summary Charset coders keep the semantics of their element loops for buffers whose memory
 *          the bulk conversion must not touch: overlapping views, read-only destinations and
 *          mapped files that are truncated
 * @run main/othervm -Xint TestCharsetCoderStorage
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 TestCharsetCoderStorage
 * @run main/othervm -Xbatch -XX:-TieredCompilation TestCharsetCoderStorage
 */

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.CharBuffer;
import java.nio.MappedByteBuffer;
import java.nio.ReadOnlyBufferException;
import java.nio.channels.FileChannel;
import java.nio.charset.Charset;
import java.nio.charset.CoderMalfunctionError;
import java.nio.charset.CoderResult;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.Arrays;

public class TestCharsetCoderStorage {
    private static final int SIZE = 4096;

    /** Reference for decoding ASCII with a char view that overlays the input. */
    private static byte[] simulateDecode(byte[] memory, int[] positions) {
        byte[] m = memory.clone();
        int in = 0, out = 0;
        boolean little = ByteOrder.nativeOrder() == ByteOrder.LITTLE_ENDIAN;
        while (in < m.length && out < m.length / 2) {
            int b = m[in++];
            if (b < 0) throw new AssertionError("reference covers ASCII only");
            m[2 * out] = (byte) (little ? b : 0);
            m[2 * out + 1] = (byte) (little ? 0 : b);
            out++;
        }
        positions[0] = in;
        positions[1] = out;
        return m;
    }

    private static void overlappingDecode(Charset charset) {
        ByteBuffer memory = ByteBuffer.allocateDirect(SIZE);
        byte[] initial = new byte[SIZE];
        for (int i = 0; i < SIZE; i++) initial[i] = (byte) ('a' + i % 26);
        memory.put(initial).clear();
        ByteBuffer in = memory.duplicate();
        CharBuffer out = memory.duplicate().order(ByteOrder.nativeOrder()).asCharBuffer();
        CoderResult result = charset.newDecoder().decode(in, out, true);
        int[] expectedPositions = new int[2];
        byte[] expected = simulateDecode(initial, expectedPositions);
        byte[] actual = new byte[SIZE];
        memory.get(0, actual);
        if (!result.isOverflow() && !result.isUnderflow()) throw new AssertionError(result);
        if (in.position() != expectedPositions[0] || out.position() != expectedPositions[1]
                || !Arrays.equals(expected, actual)) {
            throw new AssertionError("overlapping decode differs: in " + in.position() + "/"
                    + expectedPositions[0] + " out " + out.position() + "/" + expectedPositions[1]);
        }
    }

    /**
     * Encodes chars into a destination that starts a few bytes into the memory the chars are
     * read from, so that the first writes land on chars that have not been read yet.
     */
    private static void overlappingEncode(Charset charset) {
        final int shift = 8;
        ByteBuffer memory = ByteBuffer.allocateDirect(SIZE);
        CharBuffer in = memory.duplicate().order(ByteOrder.nativeOrder()).asCharBuffer();
        for (int i = 0; i < SIZE / 2; i++) in.put(i, (char) ('a' + i % 26));
        byte[] initial = new byte[SIZE];
        memory.get(0, initial);
        ByteBuffer out = memory.duplicate().position(shift).slice();
        charset.newEncoder().encode(in, out, true);
        // Reference: each char is read from the memory as the earlier writes left it
        byte[] m = initial.clone();
        boolean little = ByteOrder.nativeOrder() == ByteOrder.LITTLE_ENDIAN;
        int read = 0, written = 0;
        while (read < SIZE / 2) {
            int c = little ? (m[2 * read] & 0xff) | (m[2 * read + 1] & 0xff) << 8
                           : (m[2 * read] & 0xff) << 8 | (m[2 * read + 1] & 0xff);
            if (Character.isSurrogate((char) c)) throw new AssertionError("reference covers no surrogates");
            int n = c < 0x80 ? 1 : c < 0x800 ? 2 : 3;
            if (written + n > SIZE - shift) break;
            read++;
            int at = shift + written;
            if (n == 1) {
                m[at] = (byte) c;
            } else if (n == 2) {
                m[at] = (byte) (0xc0 | c >> 6);
                m[at + 1] = (byte) (0x80 | c & 0x3f);
            } else {
                m[at] = (byte) (0xe0 | c >> 12);
                m[at + 1] = (byte) (0x80 | c >> 6 & 0x3f);
                m[at + 2] = (byte) (0x80 | c & 0x3f);
            }
            written += n;
        }
        byte[] actual = new byte[SIZE];
        memory.get(0, actual);
        if (in.position() != read || out.position() != written || !Arrays.equals(m, actual)) {
            throw new AssertionError("overlapping encode differs: in " + in.position() + "/" + read
                    + " out " + out.position() + "/" + written);
        }
    }

    private static void readOnlyDestination(Charset charset) {
        String text = "abc\u00e9\u20ac".repeat(300);
        // The array behind a read-only buffer must stay untouched, whether or not
        // an element loop is needed to finish the range
        char[] chars = new char[text.length() + 8];
        CharBuffer readOnlyChars = CharBuffer.wrap(chars).asReadOnlyBuffer();
        try {
            charset.newDecoder().decode(ByteBuffer.wrap(text.getBytes(charset)), readOnlyChars, true);
            throw new AssertionError("decode into a read-only buffer must fail");
        } catch (CoderMalfunctionError expected) {
            if (!(expected.getCause() instanceof ReadOnlyBufferException)) throw expected;
        }
        if (!Arrays.equals(chars, new char[chars.length])) {
            throw new AssertionError("decode wrote into a read-only buffer");
        }
        byte[] bytes = new byte[8 * text.length()];
        ByteBuffer readOnlyBytes = ByteBuffer.wrap(bytes).asReadOnlyBuffer();
        try {
            charset.newEncoder().encode(CharBuffer.wrap(text), readOnlyBytes, true);
            throw new AssertionError("encode into a read-only buffer must fail");
        } catch (CoderMalfunctionError expected) {
            if (!(expected.getCause() instanceof ReadOnlyBufferException)) throw expected;
        }
        if (!Arrays.equals(bytes, new byte[bytes.length])) {
            throw new AssertionError("encode wrote into a read-only buffer");
        }
    }

    /**
     * A fault in a mapped file that was truncated is an InternalError for the accesses of the
     * element loops. It must not become a crash inside a bulk conversion.
     */
    private static void truncatedMapping(Charset charset, boolean decode) throws IOException {
        Path file = Files.createTempFile("charset-coders", ".txt");
        try (FileChannel channel = FileChannel.open(file, StandardOpenOption.READ, StandardOpenOption.WRITE)) {
            String text = "café € ".repeat(20000);
            byte[] bytes = text.getBytes(charset);
            channel.write(ByteBuffer.wrap(bytes));
            MappedByteBuffer mapped = channel.map(FileChannel.MapMode.READ_WRITE, 0, bytes.length);
            // Touch the start so only the pages beyond the truncation point fault
            mapped.get(0);
            channel.truncate(0);
            try {
                if (decode) {
                    charset.newDecoder().decode(mapped, CharBuffer.allocate(text.length() + 8), true);
                } else {
                    // A mapped buffer as the destination; the chars come from the heap
                    charset.newEncoder().encode(CharBuffer.wrap(text), mapped, true);
                }
                throw new AssertionError("the truncated mapping must fault");
            } catch (InternalError expected) { }
        } finally {
            Files.deleteIfExists(file);
        }
    }

    public static void main(String[] args) throws Exception {
        Charset utf32le = Charset.forName("UTF-32LE");
        for (Charset charset : new Charset[]{StandardCharsets.UTF_8, utf32le}) {
            readOnlyDestination(charset);
        }
        overlappingDecode(StandardCharsets.UTF_8);
        overlappingEncode(StandardCharsets.UTF_8);
        if (!System.getProperty("os.name").startsWith("Windows")) {
            // Windows does not truncate a file that is mapped
            for (Charset charset : new Charset[]{StandardCharsets.UTF_8, utf32le}) {
                truncatedMapping(charset, true);
                truncatedMapping(charset, false);
            }
        }
        System.out.println("passed");
    }
}
