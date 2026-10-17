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
public class VerifiedFileChannelWrite {

    @Param("1000000")
    public int fileSize;

    File f;
    private FileChannel fc;
    private ByteBuffer bb;
    long operations;
    long bytes;
    long rewinds;
    private int count;

    @Setup(Level.Trial)
    public void beforeRun() throws IOException {
        if (fileSize <= 0) throw new IllegalArgumentException("fileSize must be positive");
        f = File.createTempFile("FileChannelWriteBench", ".bin");
        bb = ByteBuffer.allocate(1);
        bb.put((byte) 47);
        bb.flip();
    }

    @TearDown(Level.Trial)
    public void afterRun() throws IOException {
        java.nio.file.Files.delete(f.toPath());
    }

    @Setup(Level.Iteration)
    public void beforeIteration() throws IOException {
        fc = FileChannel.open(f.toPath(), StandardOpenOption.WRITE, StandardOpenOption.TRUNCATE_EXISTING);
        count = 0;
        operations = bytes = rewinds = 0;
        bb.clear();
    }

    @TearDown(Level.Iteration)
    public void afterIteration() throws IOException {
        try {
            if (operations <= 0 || bytes != operations || fc.size() > fileSize) {
                throw new AssertionError("Invalid write work or unbounded file");
            }
            System.out.println("\nQUAL_IO_WRITE operations=" + operations + " bytes=" + bytes + " rewinds=" + rewinds);
        } finally {
            fc.close();
        }
    }

    @Benchmark
    public int test() throws IOException {
        // Never inherit an empty limit from a prior partial/zero write.
        bb.clear();
        int transferred = fc.write(bb);
        if (transferred != 1) throw new AssertionError("Write did not transfer one byte: " + transferred);
        operations++;
        bytes += transferred;
        count++;
        if (count >= fileSize) {
            fc.position(0);
            count = 0;
            rewinds++;
        }
        return transferred;
    }
}
