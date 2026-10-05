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

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;
import java.util.zip.Deflater;
import jdk.internal.misc.Unsafe;
import org.openjdk.jmh.annotations.*;

@State(Scope.Thread)
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
public class ZipBackendPool {
    @Param({"64", "1024", "65536"})
    public int size;
    @Param({"1", "16"})
    public int streams;
    private byte[] input, output;
    private Deflater[] deflaters;
    private int next;
    @Setup
    public void setup() throws Exception {
        if (Long.BYTES != 8) throw new AssertionError("64-bit diagnostic");
        Field refField = Deflater.class.getDeclaredField("zsRef");
        refField.setAccessible(true);
        Class<?> refType = Class.forName("java.util.zip.Deflater$DeflaterZStreamRef");
        Field addressField = refType.getDeclaredField("address");
        addressField.setAccessible(true);
        Unsafe unsafe = Unsafe.getUnsafe();
        input = new byte[size]; output = new byte[size + 1024];
        byte[] pattern = "openjdk java.util.zip compression streaming checksum 0123456789\n"
            .getBytes(java.nio.charset.StandardCharsets.UTF_8);
        for (int i = 0; i < size; i++) input[i] = pattern[i % pattern.length];
        deflaters = new Deflater[streams];
        int[] streamAlignments = new int[4], stateAlignments = new int[4];
        for (int i = 0; i < streams; i++) {
            Deflater d = new Deflater(6);
            deflaters[i] = d;
            d.setInput(input); d.finish(); d.deflate(output);
            if (!d.finished()) throw new AssertionError("setup incomplete");
            long address = addressField.getLong(refField.get(d));
            // Linux x86_64/AArch64 z_stream ABI: internal_state* is at byte 56.
            long state = unsafe.getLong(address + 56);
            streamAlignments[(int)(address & 63) / 16]++;
            stateAlignments[(int)(state & 63) / 16]++;
        }
        System.out.println("ALIGNMENT bytes=" + size + " streams=" + streams
            + " stream[0,16,32,48]=" + Arrays.toString(streamAlignments)
            + " state[0,16,32,48]=" + Arrays.toString(stateAlignments));
    }
    @TearDown
    public void tearDown() { for (Deflater d : deflaters) d.end(); }
    @Benchmark
    public int deflate() {
        Deflater d = deflaters[next];
        next = (next + 1) & (streams - 1);
        d.reset(); d.setInput(input); d.finish();
        int written = d.deflate(output);
        if (!d.finished()) throw new AssertionError("compression incomplete");
        return written;
    }
}
