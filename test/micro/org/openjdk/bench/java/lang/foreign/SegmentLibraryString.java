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
import java.lang.foreign.FunctionDescriptor;
import java.lang.foreign.Linker;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.SymbolLookup;
import java.lang.invoke.MethodHandle;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.util.Random;
import java.util.concurrent.TimeUnit;

import jdk.internal.foreign.AbstractMemorySegmentImpl;
import jdk.internal.foreign.StringSupport;
import org.openjdk.jmh.annotations.*;

import static java.lang.foreign.ValueLayout.*;

/**
 * Optional bounded NUL-scan experiment using maintained StringZilla v5.2.0.
 * Pass -Dstringzilla.library=/path/to/libstringzilla.so to the forked JVM.
 * Both full-string methods use the existing public API for copying and decoding.
 * The native-only, owned fixtures let the returned pointer be converted to an
 * offset after the downcall. A heap adapter must perform that conversion inside
 * the native call. Mapped faults and concurrent shared close require JDK-specific
 * integration and are deliberately not represented by this throughput probe.
 */
@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 5, time = 1)
@State(Scope.Thread)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Fork(value = 3, jvmArgs = {"--enable-native-access=ALL-UNNAMED",
        "--add-exports=java.base/jdk.internal.foreign=ALL-UNNAMED"})
public class SegmentLibraryString {
    private static final long MAX_LIBRARY_BYTES = 1 << 20;

    @Param({"8", "64", "4096", "65536"})
    public int size;

    @Param({"CONFINED", "SHARED"})
    public String storage;

    @Param({"0", "1"})
    public int alignment;

    @Param({"FIRST", "SECOND", "LAST"})
    public String terminator;

    private Arena arena;
    private MemorySegment source;

    private static class Library {
        static final MemorySegment ZERO = Arena.global().allocateFrom(JAVA_BYTE, (byte) 0);
        static final MethodHandle FIND_BYTE;
        static {
            Linker linker = Linker.nativeLinker();
            SymbolLookup symbols = SymbolLookup.libraryLookup(
                    Path.of(System.getProperty("stringzilla.library")), Arena.global());
            FIND_BYTE = linker.downcallHandle(symbols.find("sz_find_byte").orElseThrow(),
                    FunctionDescriptor.of(ADDRESS, ADDRESS,
                            linker.canonicalLayouts().get("size_t"), ADDRESS));
        }
    }

    private static class Libc {
        static final MethodHandle MEMCHR;
        static {
            Linker linker = Linker.nativeLinker();
            MEMCHR = linker.downcallHandle(linker.defaultLookup().find("memchr").orElseThrow(),
                    FunctionDescriptor.of(ADDRESS, ADDRESS, JAVA_INT,
                            linker.canonicalLayouts().get("size_t")));
        }
    }

    @Setup
    public void setup() throws Throwable {
        byte[] bytes = new byte[size + alignment];
        Random random = new Random(42);
        for (int i = 0; i < bytes.length; i++) {
            bytes[i] = (byte) random.nextInt(1, 128);
        }
        int zero = switch (terminator) {
            case "FIRST" -> 0;
            case "SECOND" -> 1;
            case "LAST" -> size - 1;
            default -> throw new IllegalArgumentException(terminator);
        };
        bytes[alignment + zero] = 0;
        arena = storage.equals("SHARED") ? Arena.ofShared() : Arena.ofConfined();
        source = arena.allocateFrom(JAVA_BYTE, bytes).asSlice(alignment, size);
        if (libraryScan() != jdkScan() || libcScan() != jdkScan()
                || !libraryGetString().equals(getString()) || !libcGetString().equals(getString())) {
            throw new AssertionError("Library scan disagrees with public API");
        }
    }

    @TearDown
    public void tearDown() {
        arena.close();
    }

    @Benchmark
    public int jdkScan() {
        return StringSupport.strlenByte((AbstractMemorySegmentImpl) source, 0, source.byteSize());
    }

    @Benchmark
    public int libraryScan() throws Throwable {
        if (source.byteSize() > MAX_LIBRARY_BYTES) {
            return jdkScan();
        }
        MemorySegment result = (MemorySegment) Library.FIND_BYTE.invokeExact(
                source, source.byteSize(), Library.ZERO);
        return offsetOf(result);
    }

    @Benchmark
    public int libcScan() throws Throwable {
        if (source.byteSize() > MAX_LIBRARY_BYTES) {
            return jdkScan();
        }
        MemorySegment result = (MemorySegment) Libc.MEMCHR.invokeExact(source, 0, source.byteSize());
        return offsetOf(result);
    }

    private int offsetOf(MemorySegment result) {
        if (result.address() == 0) {
            // Preserve the public API's exact exception when no terminator exists.
            return jdkScan();
        }
        return Math.toIntExact(result.address() - source.address());
    }

    @Benchmark
    public String getString() {
        return source.getString(0, StandardCharsets.UTF_8);
    }

    @Benchmark
    public String libraryGetString() throws Throwable {
        return source.getString(0, StandardCharsets.UTF_8, libraryScan());
    }

    @Benchmark
    public String libcGetString() throws Throwable {
        return source.getString(0, StandardCharsets.UTF_8, libcScan());
    }
}
