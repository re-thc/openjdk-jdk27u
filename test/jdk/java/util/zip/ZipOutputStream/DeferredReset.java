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
 * @summary Reset ZIP compression state only when another deflated entry needs it
 * @run main/othervm --add-opens=java.base/java.util.zip=ALL-UNNAMED -XX:-UseZipIntrinsics DeferredReset
 * @run main/othervm --add-opens=java.base/java.util.zip=ALL-UNNAMED -XX:+UseZipIntrinsics DeferredReset
 */

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.lang.reflect.Field;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Random;
import java.util.zip.CRC32;
import java.util.zip.Deflater;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

public class DeferredReset {
    private static final Field INPUT_ARRAY;
    private static final Field INPUT_BUFFER;
    static {
        try {
            INPUT_ARRAY = Deflater.class.getDeclaredField("inputArray");
            INPUT_BUFFER = Deflater.class.getDeclaredField("input");
            INPUT_ARRAY.setAccessible(true);
            INPUT_BUFFER.setAccessible(true);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private static class CountingDeflater extends Deflater {
        int resets;
        int ends;
        CountingDeflater() { super(DEFAULT_COMPRESSION, true); }
        @Override public void reset() { resets++; super.reset(); }
        @Override public void end() { ends++; super.end(); }
    }

    private static class TrackedZip extends ZipOutputStream {
        final CountingDeflater counter;
        TrackedZip(ByteArrayOutputStream out) {
            super(out);
            def.end();
            def = counter = new CountingDeflater();
        }
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    private static void released(CountingDeflater def) throws Exception {
        check(INPUT_ARRAY.get(def) == null, "completed entry retains its input array");
        ByteBuffer input = (ByteBuffer) INPUT_BUFFER.get(def);
        check(input != null && !input.hasRemaining(), "completed entry retains its input buffer");
    }

    private static byte[] data(int size) {
        byte[] bytes = new byte[size];
        for (int i = 0; i < size; i++) bytes[i] = (byte) (i % 23);
        return bytes;
    }

    private static ZipEntry entry(String name, int method, byte[] bytes) {
        ZipEntry e = new ZipEntry(name);
        e.setTime(0);
        e.setMethod(method);
        if (method == ZipEntry.STORED) {
            CRC32 crc = new CRC32();
            crc.update(bytes);
            e.setSize(bytes.length);
            e.setCrc(crc.getValue());
        }
        return e;
    }

    private static void verify(byte[] archive, byte[][] expected) throws Exception {
        try (ZipInputStream in = new ZipInputStream(new ByteArrayInputStream(archive))) {
            for (int i = 0; i < expected.length; i++) {
                ZipEntry e = in.getNextEntry();
                check(e != null && e.getName().equals("e" + i), "entry order");
                check(Arrays.equals(expected[i], in.readAllBytes()), "entry data " + i);
                in.closeEntry();
            }
            check(in.getNextEntry() == null, "unexpected entry");
        }
    }

    public static void main(String[] args) throws Exception {
        for (int level : new int[] {0, 1, 6, 9}) {
            for (int size : new int[] {0, 64, 4096}) {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                TrackedZip zip = new TrackedZip(out);
                try (zip) {
                    byte[] bytes = data(size);
                    zip.setLevel(level);
                    zip.putNextEntry(entry("e0", ZipEntry.DEFLATED, bytes));
                    zip.write(bytes);
                    zip.closeEntry();
                    released(zip.counter);
                    check(zip.counter.resets == 0, "reset after terminal entry");
                    zip.finish();
                    zip.finish();
                    check(zip.counter.resets == 0, "reset during finish");
                }
                check(zip.counter.ends == 1, "compressor end count");
                verify(out.toByteArray(), new byte[][] {data(size)});
            }
        }

        byte[][] bytes = {data(13), data(64), data(21), data(0), data(4096), data(0)};
        int[] methods = {ZipEntry.STORED, ZipEntry.DEFLATED, ZipEntry.STORED,
                         ZipEntry.DEFLATED, ZipEntry.DEFLATED, ZipEntry.STORED};
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        TrackedZip zip = new TrackedZip(out);
        try (zip) {
            for (int i = 0; i < bytes.length; i++) {
                zip.setLevel(i % 2 == 0 ? 9 : 1);
                zip.putNextEntry(entry("e" + i, methods[i], bytes[i]));
                zip.write(bytes[i]);
                // Entry4 is implicitly closed by putNextEntry for entry5.
                if (i != 4) zip.closeEntry();
                if (i == 1) {
                    released(zip.counter);
                    try {
                        zip.putNextEntry(entry("e1", ZipEntry.DEFLATED, data(1)));
                        throw new AssertionError("duplicate entry accepted");
                    } catch (ZipException expected) {
                        check(zip.counter.resets == 0, "reset for rejected entry");
                    }
                }
                if (i <= 2) check(zip.counter.resets == 0, "reset across STORED entries");
            }
            released(zip.counter);
            check(zip.counter.resets == 2, "reset count between three deflated entries");
            zip.finish();
        }
        check(zip.counter.resets == 2 && zip.counter.ends == 1, "terminal cleanup");
        verify(out.toByteArray(), bytes);

        ByteArrayOutputStream bulkOut = new ByteArrayOutputStream();
        TrackedZip bulkZip = new TrackedZip(bulkOut);
        byte[] bulk = data(65536);
        new Random(317).nextBytes(bulk);
        try (TrackedZip stream = bulkZip) {
            stream.putNextEntry(entry("e0", ZipEntry.DEFLATED, bulk));
            stream.write(bulk, 0, 64);
            stream.write(bulk, 64, bulk.length - 64);
            stream.closeEntry();
            released(stream.counter);
            check(stream.counter.resets == 0, "bulk terminal reset");
        }
        verify(bulkOut.toByteArray(), new byte[][] {bulk});
    }
}
