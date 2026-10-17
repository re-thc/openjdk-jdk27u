/*
 * Copyright (c) 2014, Oracle and/or its affiliates. All rights reserved.
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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
package org.openjdk.bench.memory;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.file.StandardOpenOption;
import java.util.concurrent.TimeUnit;

import org.openjdk.jmh.annotations.*;

/**
 * Tests the overheads of I/O API.
 * This test is known to depend heavily on disk subsystem performance.
 */
@BenchmarkMode(Mode.Throughput)
@OutputTimeUnit(TimeUnit.MILLISECONDS)
@Fork(2)
@Warmup(iterations = 4, time = 2, timeUnit = TimeUnit.SECONDS)
@Measurement(iterations = 4, time = 2, timeUnit = TimeUnit.SECONDS)
@State(Scope.Thread)
// Qualification adapter: every measured operation must transfer one byte.
public class VerifiedFileChannelRead {

    @Param("1000000")
    public int fileSize;

    File f;
    private FileChannel fc;
    private int expectedIndex;
    private ByteBuffer bb;
    long operations;
    long bytes;
    long rewinds;

    @Setup(Level.Trial)
    public void beforeRun() throws IOException {
        if (fileSize <= 0) throw new IllegalArgumentException("fileSize must be positive");
        f = File.createTempFile("FileChannelReadBench", ".bin");
        try (FileOutputStream fos = new FileOutputStream(f)) {
            for (int i = 0; i < fileSize; i++) {
                fos.write((byte) i);
            }
        }
        bb = ByteBuffer.allocate(1);
    }

    @TearDown(Level.Trial)
    public void afterRun() throws IOException {
        java.nio.file.Files.delete(f.toPath());
    }

    @Setup(Level.Iteration)
    public void beforeIteration() throws IOException {
        fc = FileChannel.open(f.toPath(), StandardOpenOption.READ);
        operations = bytes = rewinds = 0;
        expectedIndex = 0;
        bb.clear();
    }

    @TearDown(Level.Iteration)
    public void afterIteration() throws IOException {
        try {
            if (operations <= 0 || bytes != operations) throw new AssertionError("No positive read work");
            System.out.println("\nQUAL_IO_READ operations=" + operations + " bytes=" + bytes + " rewinds=" + rewinds);
        } finally {
            fc.close();
        }
    }

    @Benchmark
    public int test() throws IOException {
        // clear restores both position and limit, including after an EOF read.
        bb.clear();
        int transferred = fc.read(bb);
        if (transferred == -1) {
            if (expectedIndex != fileSize) throw new AssertionError("Unexpected EOF");
            fc.position(0);
            expectedIndex = 0;
            rewinds++;
            bb.clear();
            transferred = fc.read(bb);
        }
        if (transferred != 1) throw new AssertionError("Read did not transfer one byte: " + transferred);
        bb.flip();
        int actual = bb.get() & 255;
        if (actual != (expectedIndex & 255)) throw new AssertionError("Read content/position mismatch");
        expectedIndex++;
        operations++;
        bytes += transferred;
        return actual;
    }
}
