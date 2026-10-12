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

import java.nio.ByteBuffer;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import java.util.zip.Adler32;
import java.util.zip.CRC32;
import java.util.zip.CRC32C;
import org.openjdk.jmh.annotations.*;

@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(3)
public class ChecksumPaths {
    @State(Scope.Thread)
    public static class ScalarState {
        final Adler32 adler = new Adler32();
        final CRC32 crc = new CRC32();
        final CRC32C crcC = new CRC32C();
        int value = 0x93;
    }

    @State(Scope.Thread)
    public static class BulkState extends ScalarState {
        @Param({"0", "1", "64", "256", "1024", "4096", "65536", "1048576"})
        public int size;
        byte[] data;
        ByteBuffer direct;

        @Setup
        public void setup() {
            data = new byte[size + 7];
            new Random(17).nextBytes(data);
            direct = ByteBuffer.allocateDirect(data.length);
            direct.put(data).flip();
        }
    }

    @Benchmark
    public long adlerByte(ScalarState s) {
        s.adler.reset();
        s.adler.update(s.value);
        return s.adler.getValue();
    }

    @Benchmark
    public long adlerHeap(BulkState s) {
        s.adler.reset();
        s.adler.update(s.data, 7, s.size);
        return s.adler.getValue();
    }

    @Benchmark
    public long adlerDirect(BulkState s) {
        s.adler.reset();
        s.direct.position(7);
        s.adler.update(s.direct);
        return s.adler.getValue();
    }

    @Benchmark
    public long crc32Byte(ScalarState s) {
        s.crc.reset();
        s.crc.update(s.value);
        return s.crc.getValue();
    }

    @Benchmark
    public long crc32Heap(BulkState s) {
        s.crc.reset();
        s.crc.update(s.data, 7, s.size);
        return s.crc.getValue();
    }

    @Benchmark
    public long crc32Direct(BulkState s) {
        s.crc.reset();
        s.direct.position(7);
        s.crc.update(s.direct);
        return s.crc.getValue();
    }

    @Benchmark
    public long crc32cByte(ScalarState s) {
        s.crcC.reset();
        s.crcC.update(s.value);
        return s.crcC.getValue();
    }

    @Benchmark
    public long crc32cHeap(BulkState s) {
        s.crcC.reset();
        s.crcC.update(s.data, 7, s.size);
        return s.crcC.getValue();
    }

    @Benchmark
    public long crc32cDirect(BulkState s) {
        s.crcC.reset();
        s.direct.position(7);
        s.crcC.update(s.direct);
        return s.crcC.getValue();
    }

}
