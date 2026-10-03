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
import java.nio.file.Path;

import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.Fork;
import org.openjdk.jmh.annotations.Setup;

import static java.lang.foreign.ValueLayout.*;

/**
 * Optional exploratory benchmark: pass -Dstringzilla.library=/path/to/libstringzilla.so
 * to the forked JVM. Tested with the maintained StringZilla v5.2.0 C ABI.
 * No replacement mismatch primitive exists in that ABI: unequal inputs require
 * a second scan. This compares the public API with that complete hybrid cost.
 * The allocated fixtures do not exercise mapped faults or concurrent arena close;
 * FFM downcalls are not a drop-in replacement for scoped JDK bulk operations.
 */
@Fork(value = 3, jvmArgs = "--enable-native-access=ALL-UNNAMED")
public class SegmentLibraryMismatch extends SegmentNativeMismatch {
    private static final long MAX_LIBRARY_BYTES = 1 << 20;

    private static class Library {
        static final MethodHandle EQUAL_NATIVE;
        static final MethodHandle EQUAL_HEAP;
        static {
            Linker linker = Linker.nativeLinker();
            SymbolLookup symbols = SymbolLookup.libraryLookup(
                    Path.of(System.getProperty("stringzilla.library")), Arena.global());
            MemorySegment symbol = symbols.find("sz_equal").orElseThrow();
            FunctionDescriptor descriptor = FunctionDescriptor.of(JAVA_INT,
                    ADDRESS, ADDRESS, linker.canonicalLayouts().get("size_t"));
            EQUAL_NATIVE = linker.downcallHandle(symbol, descriptor);
            EQUAL_HEAP = linker.downcallHandle(symbol, descriptor,
                    Linker.Option.critical(true));
        }
    }

    @Setup
    @Override
    public void setup() {
        super.setup();
        try {
            if (equalityFilter() != mismatch()) {
                throw new AssertionError("Library mismatch filter disagrees with public API");
            }
        } catch (Throwable error) {
            throw new AssertionError("Library fixture verification failed", error);
        }
    }

    @Benchmark
    public long equalityFilter() throws Throwable {
        long length = Math.min(source.byteSize(), destination.byteSize());
        if (length == 0 || length > MAX_LIBRARY_BYTES) {
            return source.mismatch(destination);
        }
        boolean nativeOnly = source.isNative() && destination.isNative();
        if (!nativeOnly && length > 64) {
            // Ordinary FFM cannot expose heap pointers. Retain upstream for bulk
            // heap inputs rather than extending a critical call to a bulk scan.
            return source.mismatch(destination);
        }
        int equal = nativeOnly
                ? (int) Library.EQUAL_NATIVE.invokeExact(source, destination, length)
                : (int) Library.EQUAL_HEAP.invokeExact(source, destination, length);
        if (equal != 0) {
            return source.byteSize() == destination.byteSize() ? -1 : length;
        }
        return source.mismatch(destination);
    }
}
