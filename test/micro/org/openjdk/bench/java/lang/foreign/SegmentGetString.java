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
import java.nio.charset.StandardCharsets;
import java.util.Random;
import java.util.concurrent.TimeUnit;

import jdk.internal.foreign.AbstractMemorySegmentImpl;
import jdk.internal.foreign.StringSupport;
import org.openjdk.jmh.annotations.*;

import static java.lang.foreign.ValueLayout.JAVA_BYTE;

/** Complete public NUL-terminated API and its isolated scan cost. */
@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 5, time = 1)
@State(Scope.Thread)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Fork(value = 3, jvmArgs = {"--add-exports=java.base/jdk.internal.foreign=ALL-UNNAMED"})
public class SegmentGetString {
    @Param({"64", "4096", "65536", "262144"})
    public int size;

    @Param({"HEAP", "CONFINED", "SHARED"})
    public String storage;

    @Param({"0", "1"})
    public int alignment;

    @Param({"FIRST", "SECOND", "PREFIX_END", "AFTER_PREFIX", "MIDDLE", "LAST"})
    public String terminator;

    private Arena arena;
    private MemorySegment source;

    @Setup
    public void setup() {
        byte[] bytes = new byte[size + alignment];
        Random random = new Random(42);
        for (int i = 0; i < bytes.length; i++) {
            bytes[i] = (byte) random.nextInt(1, 128);
        }
        int zero = switch (terminator) {
            case "FIRST" -> 0;
            case "SECOND" -> 1;
            case "PREFIX_END" -> Math.min(127, size - 1);
            case "AFTER_PREFIX" -> Math.min(128, size - 1);
            case "MIDDLE" -> size / 2;
            case "LAST" -> size - 1;
            default -> throw new IllegalArgumentException(terminator);
        };
        bytes[alignment + zero] = 0;
        MemorySegment original;
        switch (storage) {
            case "HEAP" -> original = MemorySegment.ofArray(bytes);
            case "CONFINED", "SHARED" -> {
                arena = storage.equals("SHARED") ? Arena.ofShared() : Arena.ofConfined();
                original = arena.allocateFrom(JAVA_BYTE, bytes);
            }
            default -> throw new IllegalArgumentException(storage);
        }
        source = original.asSlice(alignment, size);
        String expected = new String(bytes, alignment, zero, StandardCharsets.UTF_8);
        if (!expected.equals(getString())) {
            throw new AssertionError("NUL-terminated public API disagrees with input");
        }
    }

    @TearDown
    public void tearDown() {
        if (arena != null) {
            arena.close();
        }
    }

    @Benchmark
    public String getString() {
        return source.getString(0, StandardCharsets.UTF_8);
    }

    @Benchmark
    public int scan() {
        return StringSupport.strlenByte((AbstractMemorySegmentImpl) source, 0, source.byteSize());
    }
}
