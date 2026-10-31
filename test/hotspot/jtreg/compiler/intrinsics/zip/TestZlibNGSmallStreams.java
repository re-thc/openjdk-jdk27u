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
 * @summary Tiny incremental ZIP/GZIP streams preserve data across call paths and zero-capacity calls
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @library /test/lib
 * @run driver TestZlibNGSmallStreams
 */

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.HexFormat;
import java.util.Random;
import java.util.zip.Deflater;
import java.util.zip.DeflaterOutputStream;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;
import java.util.zip.InflaterInputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

import jdk.test.lib.process.ProcessTools;

public class TestZlibNGSmallStreams {
    private static void verify(byte[] data, InputStream stream) throws Exception {
        try (stream) {
            if (!Arrays.equals(data, stream.readAllBytes())) {
                throw new AssertionError("round trip");
            }
        }
    }

    private static void checkParameterOnlyCall(boolean direct) {
        byte[] input = new byte[65536];
        new Random(12345).nextBytes(input);
        try (Deflater d = new Deflater(6)) {
            d.setLevel(1);
            d.setStrategy(Deflater.FILTERED);
            ByteBuffer output = direct ? ByteBuffer.allocateDirect(4096) : ByteBuffer.allocate(4096);
            if (d.deflate(output) != 0 || d.getBytesRead() != 0 || d.getBytesWritten() != 0) {
                throw new AssertionError("parameter-only progress");
            }

            d.setInput(input);
            d.finish();
            // Allow for expansion of incompressible input.
            byte[] first = new byte[input.length * 2];
            int length = d.deflate(first);
            if (!d.finished()) {
                throw new AssertionError("initial compression incomplete");
            }

            // A fresh stream and a reset stream with the same input/settings
            // must fit in the same output buffer. No-data parameter calls must
            // not change the stream before the first input arrives.
            d.reset();
            d.setInput(input);
            d.finish();
            byte[] second = new byte[length];
            int repeated = d.deflate(second);
            if (!d.finished() || repeated != length ||
                !Arrays.equals(first, 0, length, second, 0, repeated)) {
                throw new AssertionError("parameter-only call changed stream output");
            }
        }
    }

    private static byte[] equivalentLevelStream(boolean requests, boolean direct) throws Exception {
        byte[] input = new byte[8192];
        new Random(735).nextBytes(input);
        byte[] reference = null;
        try (Deflater d = new Deflater(requests ? Deflater.DEFAULT_COMPRESSION : 6)) {
            for (int reuse = 0; reuse < 2; reuse++) {
                if (reuse != 0) d.reset();
                d.setStrategy(Deflater.HUFFMAN_ONLY);
                if (requests) {
                    // Preserve pending strategy and level changes when an
                    // equivalent DEFAULT/6 request follows them.
                    d.setLevel(1);
                    d.setLevel(Deflater.DEFAULT_COMPRESSION);
                    d.setLevel(6);
                    d.setLevel(Deflater.DEFAULT_COMPRESSION);
                }
                ByteBuffer empty = direct ? ByteBuffer.allocateDirect(0) : ByteBuffer.allocate(0);
                if (d.deflate(empty) != 0 || d.getBytesRead() != 0 || d.getBytesWritten() != 0) {
                    throw new AssertionError("equivalent-level empty call");
                }
                d.setInput(input);
                d.finish();
                ByteBuffer output = direct ? ByteBuffer.allocateDirect(37) : ByteBuffer.allocate(37);
                ByteArrayOutputStream encoded = new ByteArrayOutputStream();
                for (int attempts = 0; !d.finished(); attempts++) {
                    if (attempts == 1000) throw new AssertionError("equivalent-level stalled");
                    output.clear();
                    d.deflate(output);
                    output.flip();
                    while (output.hasRemaining()) encoded.write(output.get());
                }
                byte[] bytes = encoded.toByteArray();
                if (d.getBytesRead() != input.length || d.getBytesWritten() != bytes.length) {
                    throw new AssertionError("equivalent-level counters");
                }
                verify(input, new InflaterInputStream(new ByteArrayInputStream(bytes)));
                if (reference != null && !Arrays.equals(reference, bytes)) {
                    throw new AssertionError("equivalent-level reset changed stream");
                }
                reference = bytes;
            }
        }
        return reference;
    }

    private static void emit() throws Exception {
        checkParameterOnlyCall(false);
        checkParameterOnlyCall(true);
        for (boolean direct : new boolean[]{false, true}) {
            if (!Arrays.equals(equivalentLevelStream(false, direct),
                               equivalentLevelStream(true, direct))) {
                throw new AssertionError("equivalent-level requests changed stream");
            }
        }
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] data = new byte[1024];
        for (int i = 0; i < data.length; i++) {
            data[i] = (byte) ("tiny zip entry 0123456789".charAt(i % 23));
        }
        for (int level : new int[]{1, 6, 9}) {
            for (int length : new int[]{0, 1, 64, 1024}) {
                byte[] input = Arrays.copyOf(data, length);
                for (int chunk : new int[]{1, 63, 1024}) {
                    ByteArrayOutputStream bytes = new ByteArrayOutputStream();
                    try (Deflater d = new Deflater(level);
                         DeflaterOutputStream stream = new DeflaterOutputStream(bytes, d)) {
                        for (int offset = 0; offset < length; offset += chunk) {
                            stream.write(input, offset, Math.min(chunk, length - offset));
                        }
                    }
                    digest.update(bytes.toByteArray());
                    verify(input, new InflaterInputStream(new ByteArrayInputStream(bytes.toByteArray())));

                    bytes.reset();
                    try (ZipOutputStream zip = new ZipOutputStream(bytes)) {
                        zip.setLevel(level);
                        ZipEntry entry = new ZipEntry("tiny");
                        entry.setTime(0);
                        zip.putNextEntry(entry);
                        for (int offset = 0; offset < length; offset += chunk) {
                            zip.write(input, offset, Math.min(chunk, length - offset));
                        }
                        zip.closeEntry();
                    }
                    digest.update(bytes.toByteArray());
                    try (ZipInputStream zip = new ZipInputStream(new ByteArrayInputStream(bytes.toByteArray()))) {
                        if (zip.getNextEntry() == null || !Arrays.equals(input, zip.readAllBytes())) {
                            throw new AssertionError("ZIP round trip");
                        }
                    }

                    bytes.reset();
                    try (GZIPOutputStream gzip = new GZIPOutputStream(bytes)) {
                        for (int offset = 0; offset < length; offset += chunk) {
                            gzip.write(input, offset, Math.min(chunk, length - offset));
                        }
                    }
                    digest.update(bytes.toByteArray());
                    verify(input, new GZIPInputStream(new ByteArrayInputStream(bytes.toByteArray())));
                }

                for (boolean direct : new boolean[]{false, true}) {
                    try (Deflater d = new Deflater(level)) {
                        for (int reuse = 0; reuse < 3; reuse++) {
                            d.reset();
                            // Zero-capacity calls must leave input and output
                            // counters unchanged before the tiny stream starts.
                            d.setInput(new byte[8192]);
                            ByteBuffer empty = direct ? ByteBuffer.allocateDirect(0) : ByteBuffer.allocate(0);
                            if (d.deflate(empty) != 0 || d.getBytesRead() != 0 ||
                                d.getBytesWritten() != 0 || d.finished()) {
                                throw new AssertionError("zero-capacity progress");
                            }
                            d.setLevel(level == 6 ? 1 : 6);
                            d.setStrategy(Deflater.FILTERED);
                            if (d.deflate(empty) != 0 || d.getBytesRead() != 0) {
                                throw new AssertionError("zero-capacity parameters");
                            }
                            d.setInput(input);
                            byte[] output = new byte[4096];
                            int written = d.deflate(output);
                            d.finish();
                            while (!d.finished()) {
                                int count = d.deflate(output, written, output.length - written);
                                if (count == 0 && !d.finished()) {
                                    throw new AssertionError("finish stalled");
                                }
                                written += count;
                            }
                            if (d.getBytesRead() != length || d.getBytesWritten() != written) {
                                throw new AssertionError("counters");
                            }
                            byte[] encoded = Arrays.copyOf(output, written);
                            digest.update(encoded);
                            verify(input, new InflaterInputStream(new ByteArrayInputStream(encoded)));
                        }
                    }
                }
            }
        }
        System.out.println("SHA-256: " + HexFormat.of().formatHex(digest.digest()));
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            emit();
            return;
        }
        String[] tiers = {"-Xint", "-XX:TieredStopAtLevel=1", "-XX:-TieredCompilation"};
        for (String tier : tiers) {
            String expected = null;
            for (String intrinsic : new String[]{"-XX:-UseZipIntrinsics", "-XX:+UseZipIntrinsics"}) {
                // VM startup diagnostics can also appear on stdout.
                String output = ProcessTools.executeTestJava(tier, intrinsic, "-Xbatch",
                    "-cp", System.getProperty("test.class.path"),
                    TestZlibNGSmallStreams.class.getName(), "emit")
                    .shouldHaveExitValue(0)
                    .stdoutShouldMatch("(?m)^SHA-256: [0-9a-f]{64}$")
                    .firstMatch("^SHA-256: ([0-9a-f]{64})$", 1);
                if (expected == null) {
                    expected = output;
                } else if (!expected.equals(output)) {
                    throw new AssertionError("tiny output changed: " + tier);
                }
            }
        }
    }
}
