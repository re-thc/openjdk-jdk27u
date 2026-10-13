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

package org.openjdk.bench.java.nio;

import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.ValueLayout;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.CharBuffer;
import java.nio.IntBuffer;
import java.nio.channels.FileChannel;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.Arrays;
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

/** Public operations over storage that meets at ScopedMemoryAccess. */
@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 5, time = 1)
@State(Scope.Thread)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Fork(3)
public class MemoryBufferOperations {
    @Param({"0", "8", "64", "4096", "65536", "1048576"})
    public int size;

    @Param({"HEAP", "NATIVE", "SHARED", "DIRECT", "MAPPED", "HEAP_NATIVE", "NATIVE_HEAP"})
    public String storage;

    @Param({"0", "1", "7"})
    public int alignment;

    @Param({"MATCH", "FIRST", "MIDDLE", "LAST"})
    public String difference;

    private Arena arena;
    private Path file;
    private MemorySegment source;
    private MemorySegment destination;
    private ByteBuffer src;
    private ByteBuffer dst;
    private IntBuffer srcInts;
    private IntBuffer dstInts;
    private IntBuffer swappedInts;
    private byte[] array;

    private MemorySegment allocate(boolean heap) throws Exception {
        int capacity = size + 16;
        if (heap) {
            return MemorySegment.ofArray(new byte[capacity]);
        }
        return switch (storage) {
            case "DIRECT" -> MemorySegment.ofBuffer(ByteBuffer.allocateDirect(capacity));
            case "MAPPED" -> {
                if (file == null) {
                    file = Files.createTempFile("buffer-benchmark", ".dat");
                }
                try (FileChannel channel = FileChannel.open(file,
                        StandardOpenOption.READ, StandardOpenOption.WRITE)) {
                    long offset = channel.size();
                    channel.position(offset + capacity - 1).write(ByteBuffer.wrap(new byte[1]));
                    yield channel.map(FileChannel.MapMode.READ_WRITE, offset, capacity, arena);
                }
            }
            default -> arena.allocate(capacity, 8);
        };
    }

    @Setup
    public void setup() throws Exception {
        arena = storage.equals("SHARED") ? Arena.ofShared() : Arena.ofConfined();
        source = allocate(storage.equals("HEAP") || storage.equals("HEAP_NATIVE"))
                .asSlice(alignment, size);
        destination = allocate(storage.equals("HEAP") || storage.equals("NATIVE_HEAP"))
                .asSlice((alignment + 3) & 7, size);
        source.fill((byte) 42);
        destination.copyFrom(source);
        int index = size == 0 ? -1 : switch (difference) {
            case "MATCH" -> -1;
            case "FIRST" -> 0;
            case "MIDDLE" -> size / 2;
            case "LAST" -> size - 1;
            default -> throw new IllegalArgumentException(difference);
        };
        if (index >= 0) {
            destination.set(ValueLayout.JAVA_BYTE, index, (byte) 43);
        }
        src = source.asByteBuffer().order(ByteOrder.nativeOrder());
        dst = destination.asByteBuffer().order(ByteOrder.nativeOrder());
        srcInts = src.asIntBuffer();
        dstInts = dst.asIntBuffer();
        ByteOrder opposite = ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN
                ? ByteOrder.LITTLE_ENDIAN : ByteOrder.BIG_ENDIAN;
        swappedInts = dst.duplicate().order(opposite).asIntBuffer();
        array = new byte[size];
        Arrays.fill(array, (byte) 42);
        if (segmentMismatch() != index || bufferMismatch() != index) {
            throw new AssertionError("Mismatch fixture disagrees with public API");
        }
    }

    @TearDown
    public void tearDown() throws Exception {
        arena.close();
        if (file != null) {
            Files.delete(file);
        }
    }

    @Benchmark
    public long segmentMismatch() {
        return source.mismatch(destination);
    }

    @Benchmark
    public int bufferMismatch() {
        return src.mismatch(dst);
    }

    @Benchmark
    public boolean bufferEquals() {
        return src.equals(dst);
    }

    @Benchmark
    public int bufferCompare() {
        return src.compareTo(dst);
    }

    @Benchmark
    public int intMismatch() {
        return srcInts.mismatch(dstInts);
    }

    @Benchmark
    public int intMismatchOppositeOrder() {
        return srcInts.mismatch(swappedInts);
    }

    @Benchmark
    public MemorySegment segmentCopy() {
        return destination.copyFrom(source);
    }

    @Benchmark
    public MemorySegment segmentFill() {
        return destination.fill((byte) 42);
    }

    @Benchmark
    public ByteBuffer bufferCopy() {
        return dst.put(0, src, 0, size);
    }

    @Benchmark
    public ByteBuffer bulkGet() {
        return src.get(0, array);
    }

    @Benchmark
    public ByteBuffer bulkPut() {
        return dst.put(0, array);
    }

    @Benchmark
    public IntBuffer swappedCopy() {
        return swappedInts.put(0, srcInts, 0, srcInts.capacity());
    }

    @Benchmark
    public ByteBuffer compact() {
        dst.position(size / 2).limit(size);
        return dst.compact();
    }

    @Benchmark
    public int bufferHash() {
        return src.hashCode();
    }

    @Benchmark
    public CharBuffer decodeUtf8() {
        src.position(0);
        return StandardCharsets.UTF_8.decode(src);
    }
}
