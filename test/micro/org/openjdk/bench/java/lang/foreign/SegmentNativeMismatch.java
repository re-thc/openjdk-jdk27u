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

package org.openjdk.bench.java.lang.foreign;

import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.ValueLayout;
import java.util.Random;
import java.util.concurrent.TimeUnit;

import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.BenchmarkMode;
import org.openjdk.jmh.annotations.Fork;
import org.openjdk.jmh.annotations.Measurement;
import org.openjdk.jmh.annotations.Mode;
import org.openjdk.jmh.annotations.OutputTimeUnit;
import org.openjdk.jmh.annotations.Param;
import org.openjdk.jmh.annotations.Scope;
import org.openjdk.jmh.annotations.Setup;
import org.openjdk.jmh.annotations.State;
import org.openjdk.jmh.annotations.TearDown;
import org.openjdk.jmh.annotations.Warmup;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 5, time = 1)
@State(Scope.Thread)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Fork(3)
public class SegmentNativeMismatch {
    @Param({"8", "64", "4096", "65536"})
    public int size;

    @Param({"HEAP", "CONFINED", "SHARED", "HEAP_NATIVE", "NATIVE_HEAP"})
    public String storage;

    @Param({"0", "1"})
    public int alignment;

    @Param({"MATCH", "FIRST", "SECOND", "LAST"})
    public String difference;

    private Arena arena;
    private MemorySegment source;
    private MemorySegment destination;

    @Setup
    public void setup() {
        byte[] bytes = new byte[size + alignment];
        new Random(42).nextBytes(bytes);
        MemorySegment heapSource = MemorySegment.ofArray(bytes);
        MemorySegment heapDestination = MemorySegment.ofArray(bytes.clone());
        if (!storage.equals("HEAP")) {
            arena = storage.equals("SHARED") ? Arena.ofShared() : Arena.ofConfined();
        }
        source = switch (storage) {
            case "HEAP", "HEAP_NATIVE" -> heapSource;
            default -> arena.allocateFrom(heapSource);
        };
        destination = switch (storage) {
            case "HEAP", "NATIVE_HEAP" -> heapDestination;
            default -> arena.allocateFrom(heapDestination);
        };
        source = source.asSlice(alignment, size);
        destination = destination.asSlice(alignment, size);
        int index = switch (difference) {
            case "MATCH" -> -1;
            case "FIRST" -> 0;
            case "SECOND" -> 1;
            case "LAST" -> size - 1;
            default -> throw new IllegalArgumentException(difference);
        };
        if (index >= 0) {
            byte value = destination.get(ValueLayout.JAVA_BYTE, index);
            destination.set(ValueLayout.JAVA_BYTE, index, (byte) (value ^ 1));
        }
    }

    @TearDown
    public void tearDown() {
        if (arena != null) {
            arena.close();
        }
    }

    @Benchmark
    public long mismatch() {
        return source.mismatch(destination);
    }
}
