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
 * @summary Exercise experimental native GZIP payload CRC and Java ownership
 * @modules java.base/java.util.zip:open
 * @run main/othervm -Djdk.util.gzip.useNativeCRC=true NativeCRC
 * @run main/othervm -Djdk.util.gzip.useNativeCRC=false NativeCRC
 * @run main/othervm NativeCRC
 */

import java.io.*;
import java.lang.reflect.*;
import java.nio.ByteBuffer;
import java.util.*;
import java.util.zip.*;

public class NativeCRC {
    static final Method ENABLE;
    static final Field ACTIVE;
    static int checks;
    static {
        try {
            ENABLE = Inflater.class.getDeclaredMethod("enableRawCRC32");
            ACTIVE = GZIPInputStream.class.getDeclaredField("inflaterCRC");
            ENABLE.setAccessible(true);
            ACTIVE.setAccessible(true);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    static void check(boolean value) {
        if (!value) throw new AssertionError("check " + checks);
        checks++;
    }

    static boolean enable(Inflater inf) throws Exception {
        return (boolean) ENABLE.invoke(inf);
    }

    static byte[] deflate(byte[] data, boolean raw, byte[] dict) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        try (Deflater d = new Deflater(6, raw)) {
            if (dict != null) d.setDictionary(dict);
            d.setInput(data);
            d.finish();
            byte[] b = new byte[8192];
            while (!d.finished()) out.write(b, 0, d.deflate(b));
        }
        return out.toByteArray();
    }

    static void le32(ByteArrayOutputStream out, long value) {
        for (int i = 0; i < 4; i++) out.write((int)(value >>> (8 * i)) & 255);
    }

    static byte[] member(byte[] data, boolean extras) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        out.writeBytes(new byte[]{31, (byte)139, 8, (byte)(extras ? 30 : 0),
                0, 0, 0, 0, 0, (byte)255});
        if (extras) {
            out.writeBytes(new byte[]{3, 0, 91, 0, 93}); // FEXTRA
            out.writeBytes(new byte[]{'x', 0, 'y', 0}); // FNAME and FCOMMENT
            CRC32 h = new CRC32();
            h.update(out.toByteArray());
            out.write((int)h.getValue() & 255);
            out.write((int)(h.getValue() >>> 8) & 255);
        }
        out.writeBytes(deflate(data, true, null));
        CRC32 crc = new CRC32();
        crc.update(data);
        le32(out, crc.getValue());
        le32(out, data.length);
        return out.toByteArray();
    }

    static byte[] concat(byte[]... parts) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        for (byte[] p : parts) out.writeBytes(p);
        return out.toByteArray();
    }

    static class Chunks extends ByteArrayInputStream {
        final int limit;
        Chunks(byte[] b, int limit) { super(b); this.limit = limit; }
        public synchronized int read(byte[] b, int off, int len) {
            return super.read(b, off, Math.min(len, limit));
        }
    }

    // Protected CRC state and overridden CRC updates must remain observable.
    static class Observed extends GZIPInputStream {
        int updates;
        Observed(InputStream in, int size) throws IOException {
            super(in, size);
            crc = new CRC32() {
                public void update(byte[] b, int off, int len) {
                    updates++;
                    super.update(b, off, len);
                }
            };
        }
        long value() { return crc.getValue(); }
    }

    static byte[] read(GZIPInputStream in, int size) throws Exception {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buf = new byte[size + 10];
        check(in.read(buf, 3, 0) == 0);
        int n;
        while ((n = in.read(buf, 3, size)) != -1) {
            check(n > 0);
            out.write(buf, 3, n);
        }
        check(in.read(buf, 3, size) == -1);
        return out.toByteArray();
    }

    static void valid(byte[] gz, byte[] data, boolean supported) throws Exception {
        for (int ib : new int[]{1, 17, 512, 8192}) {
            for (int ob : new int[]{1, 31, 8192, 65536}) {
                try (GZIPInputStream in = new GZIPInputStream(new Chunks(gz, 7), ib)) {
                    check(ACTIVE.getBoolean(in) == (supported &&
                            Boolean.getBoolean("jdk.util.gzip.useNativeCRC")));
                    check(Arrays.equals(data, read(in, ob)));
                }
            }
        }
        try (Observed in = new Observed(new ByteArrayInputStream(gz), 17)) {
            check(!ACTIVE.getBoolean(in));
            check(Arrays.equals(data, read(in, 31)));
            if (data.length != 0) check(in.updates > 0);
        }
    }

    static void invalid(byte[] gz, Class<? extends IOException> kind) throws Exception {
        for (int size : new int[]{1, 17, 8192}) {
            try (GZIPInputStream in = new GZIPInputStream(new Chunks(gz, 7), size)) {
                byte[] out = new byte[31];
                while (in.read(out) != -1) {}
                throw new AssertionError("invalid input accepted");
            } catch (IOException e) {
                check(kind.isInstance(e));
            }
        }
    }

    static void raw(boolean supported, byte[] data) throws Exception {
        byte[] encoded = deflate(data, true, null);
        CRC32 want = new CRC32(); want.update(data);
        // All four JNI buffer combinations, plus native reset and zero progress.
        for (boolean directIn : new boolean[]{false, true}) {
            for (boolean directOut : new boolean[]{false, true}) {
                try (Inflater inf = new Inflater(true)) {
                    check(enable(inf) == supported);
                    for (int pass = 0; pass < 2; pass++) {
                        if (pass != 0) inf.reset();
                        if (supported) check(inf.getAdler() == 0);
                        byte[] got = new byte[data.length];
                        if (directIn) {
                            ByteBuffer input = ByteBuffer.allocateDirect(encoded.length + 1);
                            input.put(encoded).put((byte)0).flip();
                            inf.setInput(input);
                        } else inf.setInput(Arrays.copyOf(encoded, encoded.length + 1));
                        check(inf.inflate(new byte[0]) == 0);
                        ByteBuffer output = directOut ? ByteBuffer.allocateDirect(257) : null;
                        int pos = 0;
                        while (!inf.finished()) {
                            int n;
                            if (directOut) {
                                output.clear();
                                n = inf.inflate(output);
                                output.flip(); output.get(got, pos, n);
                            } else {
                                byte[] b = new byte[257]; n = inf.inflate(b);
                                System.arraycopy(b, 0, got, pos, n);
                            }
                            pos += n;
                            check(n > 0 || inf.finished());
                            if (supported && !inf.finished()) check(inf.getAdler() == 0);
                        }
                        check(Arrays.equals(data, got));
                        check(inf.getBytesRead() == encoded.length);
                        check(inf.getRemaining() == 1);
                        if (supported) check(Integer.toUnsignedLong(inf.getAdler()) == want.getValue());
                        check(!enable(inf)); // activation cannot restart a live/completed CRC
                    }
                }
            }
        }
        byte[] dict = Arrays.copyOf(data, Math.min(data.length, 8192));
        encoded = deflate(data, true, dict);
        try (Inflater inf = new Inflater(true)) {
            inf.setDictionary(dict);
            check(enable(inf) == supported);
            inf.setInput(Arrays.copyOf(encoded, encoded.length + 1));
            byte[] out = new byte[data.length + 1];
            check(inf.inflate(out) == data.length && inf.finished());
            check(Arrays.equals(data, Arrays.copyOf(out, data.length)));
            if (supported) check(Integer.toUnsignedLong(inf.getAdler()) == want.getValue());
        }
        try (Inflater inf = new Inflater()) { check(!enable(inf)); }
        Inflater closed = new Inflater(true); closed.end();
        try {
            enable(closed); throw new AssertionError();
        } catch (InvocationTargetException e) { check(e.getCause() instanceof IllegalStateException); }
    }

    // A trailer read can invoke arbitrary user code. Cache the native checksum
    // before that callback; preserve Java's CRC-before-size validation order.
    static void closingTrailer(byte[] data, boolean corrupt) throws Exception {
        byte[] gz = member(data, false);
        if (corrupt) gz[gz.length - 8] ^= 1;
        GZIPInputStream[] owner = new GZIPInputStream[1];
        boolean[] closed = new boolean[1];
        ByteArrayInputStream input = new ByteArrayInputStream(gz) {
            public synchronized int read(byte[] b, int off, int len) {
                // Keep the trailer out of the inflater's input buffer.
                return super.read(b, off, Math.min(len, gz.length - 8 - pos));
            }
            public synchronized int read() {
                if (pos == gz.length - 8) {
                    try { owner[0].close(); }
                    catch (IOException e) { throw new UncheckedIOException(e); }
                    closed[0] = true;
                }
                return super.read();
            }
        };
        try (GZIPInputStream in = new GZIPInputStream(input, 8192)) {
            owner[0] = in;
            byte[] b = new byte[data.length + 1];
            check(in.read(b) == data.length);
            try {
                in.read(b); throw new AssertionError();
            } catch (ZipException e) {
                check(corrupt && e.getMessage().equals("Corrupt GZIP trailer"));
            } catch (IllegalStateException e) {
                check(!corrupt && e.getMessage().equals("Inflater has been closed"));
            }
            check(closed[0]);
        }
    }

    public static void main(String[] args) throws Exception {
        boolean supported;
        try (Inflater inf = new Inflater(true)) { supported = enable(inf); }
        // Match LIB_SELECT_ZLIB_BACKEND in make/autoconf/lib-bundled.m4.
        // Do not let a broken native enable silently turn this into fallback-only coverage.
        String os = System.getProperty("os.name");
        String arch = System.getProperty("os.arch");
        boolean expected = (os.equals("Linux") || os.equals("Mac OS X") || os.startsWith("Windows"))
                && (arch.equals("amd64") || arch.equals("x86_64") || arch.equals("aarch64"));
        // A local forced-stock libzip control can explicitly override the expected backend.
        if (args.length != 0) expected = Boolean.parseBoolean(args[0]);
        check(supported == expected);
        byte[] data = new byte[65483];
        new Random(928374).nextBytes(data);
        raw(supported, data);
        for (byte[] p : new byte[][]{new byte[0], Arrays.copyOf(data, 64), data}) {
            valid(member(p, false), p, supported);
            valid(member(p, true), p, supported);
        }
        byte[] shortData = Arrays.copyOf(data, 31);
        closingTrailer(shortData, false);
        closingTrailer(shortData, true);
        valid(concat(member(new byte[0], true), member(shortData, false),
                member(data, true), member(new byte[0], false)), concat(shortData, data), supported);
        byte[] gz = member(shortData, true);
        for (int i = 0; i < gz.length; i++) invalid(Arrays.copyOf(gz, i), EOFException.class);
        byte[] bad = gz.clone(); bad[bad.length - 8] ^= 1; invalid(bad, ZipException.class);
        bad = gz.clone(); bad[bad.length - 4] ^= 1; invalid(bad, ZipException.class);
        bad = gz.clone(); bad[19] ^= 1; invalid(bad, ZipException.class); // header CRC
        invalid(concat(new byte[]{31, (byte)139, 8, 0, 0, 0, 0, 0, 0, 0, 7},
                new byte[8]), ZipException.class); // invalid deflate block type
        valid(concat(member(shortData, false), new byte[]{1, 2, 3}), shortData, supported);
        valid(concat(member(shortData, false), Arrays.copyOf(member(data, true), 16)),
                shortData, supported); // malformed next header remains ignored
        try (GZIPInputStream in = new GZIPInputStream(new ByteArrayInputStream(member(data, true)), 17)) {
            check(in.skip(91) == 91);
            check(in.read() == Byte.toUnsignedInt(data[91]));
            check(Arrays.equals(in.readNBytes(8193), Arrays.copyOfRange(data, 92, 8285)));
            ByteArrayOutputStream tail = new ByteArrayOutputStream();
            check(in.transferTo(tail) == data.length - 8285);
            check(Arrays.equals(tail.toByteArray(), Arrays.copyOfRange(data, 8285, data.length)));
            check(in.available() == 0);
        }
        try (Observed in = new Observed(new ByteArrayInputStream(member(data, false)), 8192)) {
            byte[] b = new byte[31]; check(in.read(b) == b.length);
            CRC32 crc = new CRC32(); crc.update(b); check(in.value() == crc.getValue());
            in.close();
            try { in.read(b); throw new AssertionError(); }
            catch (IOException e) { check(e.getMessage().equals("Stream closed")); }
        }
        System.out.println("PASS NativeCRC: " + checks + " checks, supported=" + supported);
    }
}
