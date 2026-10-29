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
 */

/*
 * @test
 * @summary Check optional GZIP header CRC, framing errors and subclass checksum observations
 * @run main HeaderCRC
 */

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.zip.CRC32;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;
import java.util.zip.ZipException;

public class HeaderCRC {
    private static final byte[] DATA = {1, 2, 3, 4, 5};
    private static int checks;

    private static void check(boolean condition) {
        if (!condition) {
            throw new AssertionError("check " + checks);
        }
        checks++;
    }

    private static byte[] header(int flags) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        out.writeBytes(new byte[]{31, (byte)139, 8, (byte)flags, 1, 2, 3, 4, 5, 6});
        if ((flags & 4) != 0) {
            out.write(131);
            out.write(0);
            out.writeBytes(new byte[131]); // spans the header's scratch buffer
        }
        if ((flags & 8) != 0) out.writeBytes(new byte[]{'n', 'a', 'm', 'e', 0});
        if ((flags & 16) != 0) out.writeBytes(new byte[]{'n', 'o', 't', 'e', 0});
        if ((flags & 2) != 0) {
            CRC32 crc = new CRC32();
            crc.update(out.toByteArray());
            out.write((int)crc.getValue());
            out.write((int)(crc.getValue() >>> 8));
        }
        return out.toByteArray();
    }

    private static byte[] join(byte[] a, byte[] b) {
        byte[] result = Arrays.copyOf(a, a.length + b.length);
        System.arraycopy(b, 0, result, a.length, b.length);
        return result;
    }

    private static class Input extends ByteArrayInputStream {
        final int chunk;
        Input(byte[] data, int chunk) {
            super(data);
            this.chunk = chunk;
        }
        public synchronized int read(byte[] b, int off, int len) {
            return super.read(b, off, Math.min(chunk, len));
        }
        int position() { return pos; }
    }

    private static class Observed extends GZIPInputStream {
        Observed(InputStream input, int size) throws IOException { super(input, size); }
        long checksum() { return crc.getValue(); }
    }

    private static void failure(byte[] data, Class<? extends IOException> type,
                                String message, int consumed) throws IOException {
        for (boolean subclass : new boolean[]{false, true}) {
            Input input = new Input(data, 3);
            try (GZIPInputStream ignored = subclass
                    ? new Observed(input, 17) : new GZIPInputStream(input, 17)) {
                throw new AssertionError("invalid header accepted");
            } catch (IOException e) {
                check(e.getClass() == type);
                check(message == null || message.equals(e.getMessage()));
                check(input.position() == consumed);
            }
        }
    }

    // A subclass can inspect the protected checksum from underlying read
    // callbacks. Every header byte must still be accounted for in that case,
    // including when FHCRC is absent. Keep the first trailer out of fill().
    private static void observedHeader(byte[] first, byte[] nextHeader, byte[] tail)
            throws IOException {
        long[] prefix = new long[nextHeader.length + 1];
        CRC32 expected = new CRC32();
        for (int i = 0; i < nextHeader.length; i++) {
            expected.update(nextHeader[i]);
            prefix[i + 1] = expected.getValue();
        }
        class HeaderInput extends Input {
            Observed owner;
            int observations;
            HeaderInput() { super(join(first, join(nextHeader, tail)), 7); }
            private void observe() {
                if (pos >= first.length && pos < first.length + nextHeader.length) {
                    check(owner.checksum() == prefix[pos - first.length]);
                    observations++;
                }
            }
            public synchronized int read() {
                observe();
                return super.read();
            }
            public synchronized int read(byte[] b, int off, int len) {
                observe();
                if (pos < first.length - 8) len = Math.min(len, first.length - 8 - pos);
                return super.read(b, off, len);
            }
            Observed open() throws IOException {
                owner = new Observed(this, 17);
                return owner;
            }
        }
        HeaderInput input = new HeaderInput();
        try (Observed in = input.open()) {
            check(Arrays.equals(join(DATA, DATA), in.readAllBytes()));
            check(input.observations > 0);
        }
    }

    private static void unexpectedByte(int offset, int value) throws IOException {
        for (boolean subclass : new boolean[]{false, true}) {
            Input input = new Input(header(30), 3) {
                public synchronized int read() {
                    if (pos == offset) {
                        pos++;
                        return value;
                    }
                    return super.read();
                }
            };
            try (GZIPInputStream ignored = subclass
                    ? new Observed(input, 17) : new GZIPInputStream(input, 17)) {
                throw new AssertionError("unexpected byte accepted");
            } catch (IOException e) {
                check(e.getClass() == IOException.class);
                check(e.getMessage().equals(input.getClass().getName()
                        + ".read() returned value out of range -1..255: " + value));
                check(input.position() == offset + 1);
            }
        }
    }

    private static void readFailure(int offset) throws IOException {
        for (boolean subclass : new boolean[]{false, true}) {
            IOException failure = new IOException("header read failed");
            Input input = new Input(header(30), 1);
            InputStream throwing = new InputStream() {
                public int read() throws IOException {
                    if (input.position() == offset) throw failure;
                    return input.read();
                }
            };
            try (GZIPInputStream ignored = subclass
                    ? new Observed(throwing, 17) : new GZIPInputStream(throwing, 17)) {
                throw new AssertionError("read failure ignored");
            } catch (IOException e) {
                check(e == failure);
                check(input.position() == offset);
            }
        }
    }

    public static void main(String[] args) throws Exception {
        ByteArrayOutputStream encoded = new ByteArrayOutputStream();
        try (GZIPOutputStream out = new GZIPOutputStream(encoded)) { out.write(DATA); }
        byte[] ordinary = encoded.toByteArray();
        byte[] tail = Arrays.copyOfRange(ordinary, 10, ordinary.length);

        // Include all optional-field combinations, FTEXT and ignored reserved bits.
        for (int flags = 0; flags < 256; flags++) {
            byte[] header = header(flags);
            byte[] member = join(header, tail);
            for (int chunk : new int[]{1, 7, 512}) {
                for (boolean subclass : new boolean[]{false, true}) {
                    Input input = new Input(member, chunk);
                    try (GZIPInputStream in = subclass
                            ? new Observed(input, 17) : new GZIPInputStream(input, 17)) {
                        check(input.position() == header.length);
                        check(Arrays.equals(DATA, in.readAllBytes()));
                    }
                }
                try (GZIPInputStream in = new GZIPInputStream(
                        new Input(join(ordinary, member), chunk), 17)) {
                    check(Arrays.equals(join(DATA, DATA), in.readAllBytes()));
                }
            }
            for (int end = 0; end < header.length; end++) {
                failure(Arrays.copyOf(header, end), EOFException.class, null, end);
            }
            if ((flags & 2) != 0) {
                byte[] corrupt = header.clone();
                corrupt[corrupt.length - 1] ^= 1;
                failure(corrupt, ZipException.class, "Corrupt GZIP header", corrupt.length);
            }
            Input truncated = new Input(join(ordinary,
                    Arrays.copyOf(header, header.length - 1)), 3);
            try (GZIPInputStream in = new GZIPInputStream(truncated, 17)) {
                check(Arrays.equals(DATA, in.readAllBytes()));
                check(truncated.position() == ordinary.length + header.length - 1);
            }
            observedHeader(ordinary, header, tail);
        }
        for (int offset : new int[]{0, 1, 2, 3, 10, 11, 143, 147, 148, 152, 153, 154}) {
            unexpectedByte(offset, -2);
            unexpectedByte(offset, 256);
        }
        for (int offset = 0; offset < header(30).length; offset++) readFailure(offset);
        byte[] bad = header(0);
        bad[0] ^= 1;
        failure(bad, ZipException.class, "Not in GZIP format", 2);
        bad = header(0);
        bad[2] = 9;
        failure(bad, ZipException.class, "Unsupported compression method", 3);
        System.out.println("PASS HeaderCRC: " + checks + " checks");
    }
}
