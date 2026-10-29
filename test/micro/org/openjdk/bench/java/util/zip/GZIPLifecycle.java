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

package org.openjdk.bench.java.util.zip;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import java.util.zip.Deflater;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;
import java.util.zip.Inflater;
import org.openjdk.jmh.annotations.*;

/** Complete in-memory reads, including allocation, initialization and close.
 * Only preparation of the compressed fixture is outside the timed operation.
 * The reused case amortizes one inflater's creation and close over 16 streams;
 * reset, setInput, output allocation and complete inflation are always timed.
 */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@State(Scope.Thread)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(1)
public class GZIPLifecycle {
    private static final int STREAMS = 16;

    @Param({"64", "65536", "1048576"})
    public int size;

    @Param({"repeated", "random"})
    public String content;

    private byte[] gzip;
    private byte[] raw;
    private byte[] wrapped;

    @Setup
    public void setup() throws Exception {
        byte[] data = new byte[size];
        Random random = new Random(928374);
        if (content.equals("random")) {
            random.nextBytes(data);
        } else {
            byte[] pattern = new byte[256];
            random.nextBytes(pattern);
            for (int i = 0; i < size; i++) data[i] = pattern[i % pattern.length];
        }
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        try (GZIPOutputStream stream = new GZIPOutputStream(out)) {
            stream.write(data);
        }
        gzip = out.toByteArray();
        raw = deflate(data, true);
        wrapped = deflate(data, false);
        // Fixture validation is outside timing; timed methods check total size.
        try (GZIPInputStream stream = new GZIPInputStream(new ByteArrayInputStream(gzip))) {
            if (!java.util.Arrays.equals(data, stream.readAllBytes())) throw new AssertionError();
        }
    }

    private static byte[] deflate(byte[] data, boolean nowrap) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        try (Deflater d = new Deflater(6, nowrap)) {
            d.setInput(data);
            d.finish();
            byte[] buffer = new byte[8192];
            while (!d.finished()) out.write(buffer, 0, d.deflate(buffer));
        }
        return out.toByteArray();
    }

    private long gzip(int inputBuffer) throws Exception {
        long result = 0;
        for (int i = 0; i < STREAMS; i++) {
            byte[] output = new byte[Math.min(size + 1, 8192)];
            try (GZIPInputStream in = new GZIPInputStream(new ByteArrayInputStream(gzip), inputBuffer)) {
                int total = 0;
                for (int n; (n = in.read(output)) != -1;) {
                    total += n;
                    if (n > 0) result += output[n - 1];
                }
                if (total != size) throw new AssertionError(total);
                result += total;
            }
        }
        return result;
    }

    private long inflate(Inflater in, byte[] compressed) throws Exception {
        byte[] output = new byte[Math.min(size + 1, 8192)];
        in.setInput(compressed);
        long result = 0;
        int total = 0;
        while (!in.finished()) {
            int n = in.inflate(output);
            total += n;
            if (n > 0) result += output[n - 1];
            else if (!in.finished()) throw new AssertionError("no progress");
        }
        if (total != size || in.getRemaining() != 0) throw new AssertionError(total);
        return result + total;
    }

    private long fresh(boolean nowrap) throws Exception {
        long result = 0;
        for (int i = 0; i < STREAMS; i++) {
            try (Inflater in = new Inflater(nowrap)) {
                result += inflate(in, nowrap ? raw : wrapped);
            }
        }
        return result;
    }

    private long reused(boolean nowrap) throws Exception {
        long result = 0;
        try (Inflater in = new Inflater(nowrap)) {
            for (int i = 0; i < STREAMS; i++) {
                if (i != 0) in.reset();
                result += inflate(in, nowrap ? raw : wrapped);
            }
        }
        return result;
    }

    @Benchmark @OperationsPerInvocation(STREAMS)
    public long gzipDefault() throws Exception { return gzip(512); }

    @Benchmark @OperationsPerInvocation(STREAMS)
    public long gzipBuffered() throws Exception { return gzip(8192); }

    @Benchmark @OperationsPerInvocation(STREAMS)
    public long rawFresh() throws Exception { return fresh(true); }

    @Benchmark @OperationsPerInvocation(STREAMS)
    public long rawReused() throws Exception { return reused(true); }

    @Benchmark @OperationsPerInvocation(STREAMS)
    public long wrappedFresh() throws Exception { return fresh(false); }

    @Benchmark @OperationsPerInvocation(STREAMS)
    public long wrappedReused() throws Exception { return reused(false); }
}
