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

package org.openjdk.bench.java.util.zip;

import java.util.Random;
import java.util.concurrent.TimeUnit;
import java.util.zip.*;
import org.openjdk.jmh.annotations.*;

@State(Scope.Thread)
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(3)
public class ZipBackend {
    @Param({"64", "256", "1024", "16384", "65536"})
    public int size;

    @Param({"text", "random"})
    public String data;

    private byte[] input, compressed, output;
    private int compressedLength;
    private Deflater deflater;
    private Inflater inflater;
    private Adler32 adler;
    private CRC32 crc;
    private CRC32C crcC;

    @Setup
    public void setup() {
        input = new byte[size];
        if (data.equals("random")) {
            new Random(12345).nextBytes(input);
        } else {
            byte[] pattern = "openjdk java.util.zip compression streaming checksum 0123456789\n".getBytes(java.nio.charset.StandardCharsets.UTF_8);
            for (int i = 0; i < size; i++) input[i] = pattern[i % pattern.length];
        }
        compressed = new byte[size + 1024];
        output = new byte[size + 1024];
        deflater = new Deflater(6);
        inflater = new Inflater();
        adler = new Adler32(); crc = new CRC32(); crcC = new CRC32C();
        deflater.setInput(input); deflater.finish();
        compressedLength = deflater.deflate(compressed);
        if (!deflater.finished()) throw new AssertionError("compression buffer");
    }

    @TearDown
    public void tearDown() { deflater.end(); inflater.end(); }

    @Benchmark
    public int deflate() {
        deflater.reset(); deflater.setInput(input); deflater.finish();
        int written = deflater.deflate(output);
        if (!deflater.finished()) throw new AssertionError("deflate incomplete");
        return written;
    }

    @Benchmark
    public int inflate() throws DataFormatException {
        inflater.reset(); inflater.setInput(compressed, 0, compressedLength);
        int written = inflater.inflate(output);
        if (written != size || !inflater.finished()) throw new AssertionError("inflate incomplete");
        return written;
    }

    @Benchmark
    public long adler32() { adler.reset(); adler.update(input); return adler.getValue(); }

    @Benchmark
    public long crc32() { crc.reset(); crc.update(input); return crc.getValue(); }

    @Benchmark
    public long crc32c() { crcC.reset(); crcC.update(input); return crcC.getValue(); }
}
