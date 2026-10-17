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

import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.CharBuffer;
import java.nio.IntBuffer;
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
import org.openjdk.jmh.annotations.Warmup;

/** Hashes the remaining elements of a buffer. */
@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 5, time = 1)
@State(Scope.Thread)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Fork(3)
public class BufferHashCode {
    @Param({"8", "64", "1024", "65536"})
    public int size;

    /**
     * BYTE_HEAP, BYTE_DIRECT, CHAR_HEAP, INT_HEAP, or INT_VIEW (an int view of a
     * direct byte buffer in the opposite byte order).
     */
    @Param({"BYTE_HEAP", "BYTE_DIRECT", "CHAR_HEAP", "INT_HEAP", "INT_VIEW"})
    public String kind;

    private Buffer buffer;

    @Setup
    public void setup() {
        ByteOrder swapped = ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN ? ByteOrder.LITTLE_ENDIAN
                                                                            : ByteOrder.BIG_ENDIAN;
        buffer = switch (kind) {
            case "BYTE_HEAP" -> fill(ByteBuffer.allocate(size));
            case "BYTE_DIRECT" -> fill(ByteBuffer.allocateDirect(size));
            case "CHAR_HEAP" -> CharBuffer.allocate(size)
                                    .put(fill(ByteBuffer.allocate(2 * size)).asCharBuffer()).flip();
            case "INT_HEAP" -> IntBuffer.allocate(size)
                                   .put(fill(ByteBuffer.allocate(4 * size)).asIntBuffer()).flip();
            case "INT_VIEW" -> fill(ByteBuffer.allocateDirect(4 * size)).order(swapped).asIntBuffer();
            default -> throw new IllegalArgumentException(kind);
        };
    }

    private static ByteBuffer fill(ByteBuffer bb) {
        for (int i = 0; i < bb.capacity(); i++) {
            bb.put(i, (byte) (i * 31 + 7));
        }
        return bb;
    }

    @Benchmark
    public int hash() {
        return buffer.hashCode();
    }
}
