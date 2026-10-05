/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @summary Tiny incremental ZIP/GZIP streams retain stock output, including zero-capacity calls
 * @requires (os.family == "linux") & (os.arch == "amd64" | os.arch == "aarch64")
 * @library /test/lib
 * @run driver TestZlibNGSmallStreams
 */

import java.io.*;
import java.nio.ByteBuffer;
import java.security.MessageDigest;
import java.util.*;
import java.util.zip.*;
import jdk.test.lib.process.ProcessTools;

public class TestZlibNGSmallStreams {
    private static void verify(byte[] data, InputStream stream) throws Exception {
        try (stream) {
            if (!Arrays.equals(data, stream.readAllBytes())) throw new AssertionError("round trip");
        }
    }

    private static void emit() throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] data = new byte[1024];
        for (int i = 0; i < data.length; i++) data[i] = (byte) ("tiny zip entry 0123456789".charAt(i % 23));
        for (int level : new int[]{1, 6, 9}) {
            for (int length : new int[]{0, 1, 64, 1024}) {
                byte[] input = Arrays.copyOf(data, length);
                for (int chunk : new int[]{1, 63, 1024}) {
                    ByteArrayOutputStream bytes = new ByteArrayOutputStream();
                    try (Deflater d = new Deflater(level);
                         DeflaterOutputStream stream = new DeflaterOutputStream(bytes, d)) {
                        for (int offset = 0; offset < length; offset += chunk)
                            stream.write(input, offset, Math.min(chunk, length - offset));
                    }
                    digest.update(bytes.toByteArray());
                    verify(input, new InflaterInputStream(new ByteArrayInputStream(bytes.toByteArray())));

                    bytes.reset();
                    try (ZipOutputStream zip = new ZipOutputStream(bytes)) {
                        zip.setLevel(level);
                        ZipEntry entry = new ZipEntry("tiny");
                        entry.setTime(0);
                        zip.putNextEntry(entry);
                        for (int offset = 0; offset < length; offset += chunk)
                            zip.write(input, offset, Math.min(chunk, length - offset));
                        zip.closeEntry();
                    }
                    digest.update(bytes.toByteArray());
                    try (ZipInputStream zip = new ZipInputStream(new ByteArrayInputStream(bytes.toByteArray()))) {
                        if (zip.getNextEntry() == null || !Arrays.equals(input, zip.readAllBytes()))
                            throw new AssertionError("ZIP round trip");
                    }

                    bytes.reset();
                    try (GZIPOutputStream gzip = new GZIPOutputStream(bytes)) {
                        for (int offset = 0; offset < length; offset += chunk)
                            gzip.write(input, offset, Math.min(chunk, length - offset));
                    }
                    digest.update(bytes.toByteArray());
                    verify(input, new GZIPInputStream(new ByteArrayInputStream(bytes.toByteArray())));
                }

                for (boolean direct : new boolean[]{false, true}) {
                    try (Deflater d = new Deflater(level)) {
                        for (int reuse = 0; reuse < 3; reuse++) {
                            d.reset();
                            // A large input on a call that cannot progress must not
                            // select zlib-ng for the later tiny streaming operation.
                            d.setInput(new byte[8192]);
                            ByteBuffer empty = direct ? ByteBuffer.allocateDirect(0) : ByteBuffer.allocate(0);
                            if (d.deflate(empty) != 0 || d.getBytesRead() != 0 ||
                                d.getBytesWritten() != 0 || d.finished())
                                throw new AssertionError("zero-capacity progress");
                            d.setLevel(level == 6 ? 1 : 6);
                            d.setStrategy(Deflater.FILTERED);
                            if (d.deflate(empty) != 0 || d.getBytesRead() != 0)
                                throw new AssertionError("zero-capacity parameters");
                            d.setInput(input);
                            byte[] output = new byte[4096];
                            int written = d.deflate(output);
                            d.finish();
                            while (!d.finished()) {
                                int count = d.deflate(output, written, output.length - written);
                                if (count == 0 && !d.finished()) throw new AssertionError("finish stalled");
                                written += count;
                            }
                            if (d.getBytesRead() != length || d.getBytesWritten() != written)
                                throw new AssertionError("counters");
                            byte[] encoded = Arrays.copyOf(output, written);
                            digest.update(encoded);
                            verify(input, new InflaterInputStream(new ByteArrayInputStream(encoded)));
                        }
                    }
                }
            }
        }
        System.out.println(HexFormat.of().formatHex(digest.digest()));
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 0) { emit(); return; }
        String[] tiers = {"-Xint", "-XX:TieredStopAtLevel=1", "-XX:-TieredCompilation"};
        for (String tier : tiers) {
            String expected = null;
            for (String backend : new String[]{"-XX:-UseZlibNG", "-XX:+UseZlibNG"}) {
                String output = ProcessTools.executeTestJava(tier, backend, "-Xbatch",
                    "-cp", System.getProperty("test.class.path"),
                    TestZlibNGSmallStreams.class.getName(), "emit")
                    .shouldHaveExitValue(0).getStdout().strip();
                if (expected == null) expected = output;
                else if (!expected.equals(output)) throw new AssertionError("tiny output changed: " + tier);
            }
        }
    }
}
