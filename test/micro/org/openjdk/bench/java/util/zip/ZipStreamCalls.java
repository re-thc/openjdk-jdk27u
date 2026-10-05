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

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import java.util.zip.GZIPOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import org.openjdk.jmh.annotations.*;

@State(Scope.Thread)
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(3)
public class ZipStreamCalls {
    @Param({"64", "1024", "65536"})
    public int size;
    @Param({"64", "4096"})
    public int chunk;
    private byte[] input;
    private ZipEntry entry;

    @Setup
    public void setup() {
        input = new byte[size];
        new Random(12345).nextBytes(input);
        entry = new ZipEntry("entry");
        entry.setTime(0);
    }

    @Benchmark
    public int zip() throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream(size + 1024);
        try (ZipOutputStream stream = new ZipOutputStream(output)) {
            stream.setLevel(6);
            stream.putNextEntry(entry);
            for (int offset = 0; offset < size; offset += chunk)
                stream.write(input, offset, Math.min(chunk, size - offset));
            stream.closeEntry();
        }
        return output.size();
    }

    @Benchmark
    public int gzip() throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream(size + 1024);
        try (GZIPOutputStream stream = new GZIPOutputStream(output)) {
            for (int offset = 0; offset < size; offset += chunk)
                stream.write(input, offset, Math.min(chunk, size - offset));
        }
        return output.size();
    }
}
