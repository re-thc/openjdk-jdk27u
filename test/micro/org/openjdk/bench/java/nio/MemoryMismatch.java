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
import java.nio.DoubleBuffer;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;
import java.nio.LongBuffer;
import java.nio.ShortBuffer;
import java.nio.channels.FileChannel;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
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

import jdk.internal.misc.Unsafe;

/**
 * Mismatch-based comparisons of heap, native, mapped and mixed storage through
 * MemorySegment, ByteBuffer and typed buffer views.
 */
@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 5, time = 1)
@State(Scope.Thread)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Fork(value = 3, jvmArgsAppend = "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED")
public class MemoryMismatch {
    private static final Unsafe UNSAFE = Unsafe.getUnsafe();

    @Param({"8", "64", "127", "128", "4096", "65536", "65537", "1048576"})
    public int size;

    /**
     * HEAP, NATIVE (arena segments and their buffer views), MAPPED (arena-mapped file),
     * the two mixed orders, and DIRECT / DIRECT_MAPPED (ordinary NIO buffers, viewed
     * as segments with MemorySegment.ofBuffer).
     */
    @Param({"HEAP", "NATIVE", "MAPPED", "HEAP_NATIVE", "NATIVE_HEAP", "DIRECT", "DIRECT_MAPPED"})
    public String storage;

    @Param({"1"})
    public int alignment;

    /** Named position of the only difference, or an exact decimal byte position. */
    @Param({"MATCH", "FIRST", "FIRST_WORD", "MIDDLE", "LAST"})
    public String difference;

    private Arena arena;
    private Path file;
    // Ordinary DIRECT_MAPPED mappings, which only a cleaner or a collection unmaps.
    private final List<ByteBuffer> mappings = new ArrayList<>();
    private MemorySegment source;
    private MemorySegment destination;
    private ByteBuffer src;
    private ByteBuffer dst;
    private CharBuffer srcChars;
    private CharBuffer dstChars;
    private IntBuffer srcInts;
    private IntBuffer dstInts;
    private IntBuffer swappedInts;
    private LongBuffer srcLongs;
    private LongBuffer dstLongs;
    private ShortBuffer srcShorts;
    private ShortBuffer dstShorts;
    private FloatBuffer srcFloats;
    private FloatBuffer dstFloats;
    private DoubleBuffer srcDoubles;
    private DoubleBuffer dstDoubles;
    private byte[] srcArray;
    private byte[] dstArray;

    private long fileOffset(FileChannel channel, int capacity) throws Exception {
        long offset = channel.size();
        channel.position(offset + capacity - 1).write(ByteBuffer.wrap(new byte[1]));
        return offset;
    }

    // Returns a buffer and, in region[0], a segment over the same bytes. Heap and
    // ordinary NIO buffers are sliced directly, so they have no segment session.
    private ByteBuffer allocate(boolean heap, int offset, MemorySegment[] region) throws Exception {
        int capacity = size + 16;
        if (heap) {
            byte[] array = new byte[capacity];
            region[0] = MemorySegment.ofArray(array).asSlice(offset, size);
            return ByteBuffer.wrap(array).slice(offset, size);
        }
        if (storage.equals("DIRECT") || storage.equals("DIRECT_MAPPED")) {
            ByteBuffer plain;
            if (storage.equals("DIRECT")) {
                plain = ByteBuffer.allocateDirect(capacity);
            } else {
                try (FileChannel channel = FileChannel.open(file, StandardOpenOption.READ, StandardOpenOption.WRITE)) {
                    plain = channel.map(FileChannel.MapMode.READ_WRITE, fileOffset(channel, capacity), capacity);
                }
                mappings.add(plain);
            }
            ByteBuffer slice = plain.slice(offset, size);
            region[0] = MemorySegment.ofBuffer(slice);
            return slice;
        }
        MemorySegment segment;
        if (storage.equals("MAPPED")) {
            try (FileChannel channel = FileChannel.open(file, StandardOpenOption.READ, StandardOpenOption.WRITE)) {
                segment = channel.map(FileChannel.MapMode.READ_WRITE, fileOffset(channel, capacity), capacity, arena);
            }
        } else {
            segment = arena.allocate(capacity, 8);
        }
        region[0] = segment.asSlice(offset, size);
        return region[0].asByteBuffer();
    }

    @Setup
    public void setup() throws Exception {
        arena = Arena.ofConfined();
        if (storage.contains("MAPPED")) {
            file = Files.createTempFile("memory-mismatch", ".dat");
        }
        boolean heapSource = storage.equals("HEAP") || storage.equals("HEAP_NATIVE");
        boolean heapDestination = storage.equals("HEAP") || storage.equals("NATIVE_HEAP");
        MemorySegment[] region = new MemorySegment[1];
        src = allocate(heapSource, alignment, region).order(ByteOrder.nativeOrder());
        source = region[0];
        dst = allocate(heapDestination, (alignment + 3) & 7, region).order(ByteOrder.nativeOrder());
        destination = region[0];
        source.fill((byte) 42);
        destination.copyFrom(source);
        int index = switch (difference) {
            case "MATCH" -> -1;
            case "FIRST" -> 0;
            case "FIRST_WORD" -> Math.min(7, size - 1);
            case "MIDDLE" -> size / 2;
            case "LAST" -> size - 1;
            default -> {
                int at = Integer.parseInt(difference);
                if (at < 0 || at >= size) throw new IllegalArgumentException(difference);
                yield at;
            }
        };
        srcArray = new byte[size];
        Arrays.fill(srcArray, (byte) 42);
        dstArray = srcArray.clone();
        if (index >= 0) {
            destination.set(ValueLayout.JAVA_BYTE, index, (byte) 43);
            dstArray[index] = 43;
        }
        srcChars = src.asCharBuffer();
        dstChars = dst.asCharBuffer();
        srcInts = src.asIntBuffer();
        dstInts = dst.asIntBuffer();
        ByteOrder opposite = ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN
                ? ByteOrder.LITTLE_ENDIAN : ByteOrder.BIG_ENDIAN;
        swappedInts = dst.duplicate().order(opposite).asIntBuffer();
        srcLongs = src.asLongBuffer();
        dstLongs = dst.asLongBuffer();
        srcShorts = src.asShortBuffer();
        dstShorts = dst.asShortBuffer();
        srcFloats = src.asFloatBuffer();
        dstFloats = dst.asFloatBuffer();
        srcDoubles = src.asDoubleBuffer();
        dstDoubles = dst.asDoubleBuffer();
        if (segmentMismatch() != index || bufferMismatch() != index || arrayMismatch() != index ||
                charMismatch() != typed(index, Character.BYTES) || intMismatch() != typed(index, Integer.BYTES) ||
                longMismatch() != typed(index, Long.BYTES) ||
                shortMismatch() != typed(index, Short.BYTES) ||
                floatMismatch() != typed(index, Float.BYTES) ||
                doubleMismatch() != typed(index, Double.BYTES) ||
                intMismatchOppositeOrder() != typed(index, Integer.BYTES) || bufferEquals() != (index < 0)) {
            throw new AssertionError("Mismatch fixture disagrees with public API");
        }
    }

    private int typed(int index, int bytes) {
        return index < 0 || index >= size / bytes * bytes ? -1 : index / bytes;
    }

    @TearDown
    public void tearDown() throws Exception {
        // Drop every view of the storage, then release the mappings before the
        // file is deleted, which Windows refuses while a mapping exists. Closing
        // the arena unmaps MAPPED segments; ordinary mappings are unmapped here.
        source = destination = null;
        src = dst = null;
        srcChars = dstChars = null;
        srcInts = dstInts = swappedInts = null;
        srcLongs = dstLongs = null;
        srcShorts = dstShorts = null;
        srcFloats = dstFloats = null;
        srcDoubles = dstDoubles = null;
        arena.close();
        for (ByteBuffer mapping : mappings) {
            UNSAFE.invokeCleaner(mapping);
        }
        mappings.clear();
        if (file != null) {
            Files.delete(file);
            file = null;
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
    public int charMismatch() {
        return srcChars.mismatch(dstChars);
    }

    @Benchmark
    public int intMismatch() {
        return srcInts.mismatch(dstInts);
    }

    @Benchmark
    public int longMismatch() {
        return srcLongs.mismatch(dstLongs);
    }

    @Benchmark
    public int shortMismatch() {
        return srcShorts.mismatch(dstShorts);
    }

    @Benchmark
    public int floatMismatch() {
        return srcFloats.mismatch(dstFloats);
    }

    @Benchmark
    public int doubleMismatch() {
        return srcDoubles.mismatch(dstDoubles);
    }

    /** Control kept local: the public mismatch method changes its inlining policy. */
    @Benchmark
    public int intMismatchOppositeOrder() {
        int aPosition = srcInts.position(), bPosition = swappedInts.position();
        int length = Math.min(srcInts.remaining(), swappedInts.remaining());
        for (int i = 0; i < length; i++) {
            if (srcInts.get(aPosition + i) != swappedInts.get(bPosition + i)) {
                return i;
            }
        }
        return srcInts.remaining() == swappedInts.remaining() ? -1 : length;
    }

    /** Heap array mismatch, independent of storage; AArch64 also gains a stub here. */
    @Benchmark
    public int arrayMismatch() {
        return Arrays.mismatch(srcArray, dstArray);
    }
}
