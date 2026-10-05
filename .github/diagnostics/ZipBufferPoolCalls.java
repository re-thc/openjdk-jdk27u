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
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 */
package org.openjdk.bench.java.util.zip;
import java.lang.reflect.Field;
import java.nio.Buffer;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

@State(Scope.Thread)
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
public class ZipBufferPoolCalls {
    @Param({"1024", "16384", "65536"})
    public int size;
    @Param({"1", "16"})
    public int contexts;
    private ZipBufferCalls[] pool;
    private int cursor;
    @Setup
    public void setup() throws Exception {
        pool = new ZipBufferCalls[contexts];
        Field in = ZipBufferCalls.class.getDeclaredField("inBuffer");
        Field out = ZipBufferCalls.class.getDeclaredField("outBuffer");
        Field address = Buffer.class.getDeclaredField("address");
        in.setAccessible(true);
        out.setAccessible(true);
        address.setAccessible(true);
        for (int n = 0; n < contexts; n++) {
            ZipBufferCalls call = new ZipBufferCalls();
            call.size = size;
            call.input = "direct";
            call.output = "direct";
            call.setup();
            pool[n] = call;
            long a = address.getLong(in.get(call));
            long b = address.getLong(out.get(call));
            System.out.println("ALIGN context=" + n + " size=" + size +
                " input%4096=" + (a & 4095) + " output%4096=" + (b & 4095) +
                " delta%4096=" + ((b - a) & 4095));
        }
    }
    @TearDown
    public void tearDown() { for (ZipBufferCalls call : pool) call.tearDown(); }
    @Benchmark
    public int inflate() {
        cursor = (cursor + 1) & (contexts - 1);
        return pool[cursor].inflate();
    }
}
