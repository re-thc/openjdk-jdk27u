/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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

package org.openjdk.bench.jdk.incubator.vector;

import java.util.Arrays;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import jdk.incubator.vector.ByteVector;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.BenchmarkParams;

@BenchmarkMode(Mode.Throughput)
@OutputTimeUnit(TimeUnit.SECONDS)
@Warmup(iterations = 8, time = 500, timeUnit = TimeUnit.MILLISECONDS)
@Measurement(iterations = 5, time = 1)
@Fork(value = 1, jvmArgs = {"--add-modules=jdk.incubator.vector",
                           "-Djdk.incubator.vector.VECTOR_ACCESS_OOB_CHECK=2"})
public class VectorBounds {
    @State(Scope.Thread)
    public static class Data {
        @Param({"4096"})
        public int size;
        public byte[] source;
        public byte[] target;
        public long[] widths;
        public int limit;
        public int seed;
        public int result;
        public int outputStart;

        @Setup
        public void setup() {
            source = new byte[size];
            new Random(0x6a4d26L).nextBytes(source);
            widths = new long[size / 8];
            for (int i = 0; i < widths.length; i++) {
                widths[i] = i % 17;
            }
            target = new byte[widths.length * 16 + 32];
            limit = size + 64;
            seed = 17;
        }

        @TearDown
        public void check(BenchmarkParams params) {
            boolean zeroEntry = params.getBenchmark().endsWith(".guarded");
            byte[] expected = new byte[target.length];
            // Each invocation alternates the destination between offsets 0 and 8.
            // Reproduce the final two calls, including untouched boundary bytes.
            for (int offset : new int[] {outputStart ^ 8, outputStart}) {
                int cursor = zeroEntry ? 0 : seed;
                for (int i = 0; i < widths.length; i++) {
                    int width = (int) widths[i] & 0x1ffff;
                    if (width != 0 && width > limit - cursor) {
                        throw new AssertionError("Invalid benchmark input");
                    }
                    if (cursor + width <= source.length - 32 && width <= 16) {
                        System.arraycopy(source, cursor, expected, offset + i * 16, 16);
                    }
                    cursor += width;
                }
                if (cursor != result) {
                    throw new AssertionError("Incorrect cursor");
                }
            }
            if (!Arrays.equals(expected, target)) {
                throw new AssertionError("Incorrect output");
            }
        }
    }

    @Benchmark
    public int direct(Data data) {
        data.outputStart ^= 8;
        return data.result = copyDirect(data.source, data.target, data.limit,
                                       data.seed, data.widths, data.outputStart);
    }

    @Benchmark
    public int different(Data data) {
        data.outputStart ^= 8;
        return data.result = copyDifferent(data.source, data.target, data.limit,
                                          data.seed, data.widths, data.outputStart);
    }

    @Benchmark
    public int guarded(Data data) {
        data.outputStart ^= 8;
        return data.result = copyGuarded(data.source, data.target, data.limit,
                                        data.widths, data.outputStart);
    }

    @Benchmark
    public int seeded(Data data) {
        data.outputStart ^= 8;
        return data.result = copySeeded(data.source, data.target, data.limit,
                                       data.seed, data.widths, data.outputStart);
    }

    // The runtime entry cursor excludes a zero-based induction proof.
    @CompilerControl(CompilerControl.Mode.DONT_INLINE)
    public static int copyDirect(byte[] source, byte[] target, int limit,
                                 int cursor, long[] widths, int outputStart) {
        int ceiling = source.length - 32;
        for (int i = 0; i < widths.length; i++) {
            int width = (int) widths[i] & 0x1ffff;
            if (width != 0 && width > limit - cursor) {
                throw new IllegalArgumentException();
            }
            if (cursor + width <= ceiling && width <= 16) {
                int bound = source.length - 15;
                if (bound < 0 || Integer.compareUnsigned(cursor, bound) >= 0) {
                    throw new AssertionError();
                }
                ByteVector.fromArray(ByteVector.SPECIES_128, source, cursor)
                          .intoArray(target, outputStart + i * 16);
            }
            cursor += width;
        }
        return cursor;
    }

    // This weaker explicit bound cannot replace the vector intrinsic check.
    @CompilerControl(CompilerControl.Mode.DONT_INLINE)
    public static int copyDifferent(byte[] source, byte[] target, int limit,
                                    int cursor, long[] widths, int outputStart) {
        int ceiling = source.length - 32;
        for (int i = 0; i < widths.length; i++) {
            int width = (int) widths[i] & 0x1ffff;
            if (width != 0 && width > limit - cursor) {
                throw new IllegalArgumentException();
            }
            if (cursor + width <= ceiling && width <= 16) {
                int bound = source.length - 14;
                if (bound < 0 || Integer.compareUnsigned(cursor, bound) >= 0) {
                    throw new AssertionError();
                }
                ByteVector.fromArray(ByteVector.SPECIES_128, source, cursor)
                          .intoArray(target, outputStart + i * 16);
            }
            cursor += width;
        }
        return cursor;
    }

    // Checked nonnegative increments and a signed end guard imply the vector bound.
    @CompilerControl(CompilerControl.Mode.DONT_INLINE)
    public static int copyGuarded(byte[] source, byte[] target, int limit,
                                  long[] widths, int outputStart) {
        int cursor = 0;
        int ceiling = source.length - 32;
        for (int i = 0; i < widths.length; i++) {
            int width = (int) widths[i] & 0x1ffff;
            if (width != 0 && width > limit - cursor) {
                throw new IllegalArgumentException();
            }
            if (cursor + width <= ceiling && width <= 16) {
                ByteVector.fromArray(ByteVector.SPECIES_128, source, cursor)
                          .intoArray(target, outputStart + i * 16);
            }
            cursor += width;
        }
        return cursor;
    }

    // The entry cursor has no established sign or upper bound at compilation.
    @CompilerControl(CompilerControl.Mode.DONT_INLINE)
    public static int copySeeded(byte[] source, byte[] target, int limit,
                                 int cursor, long[] widths, int outputStart) {
        int ceiling = source.length - 32;
        for (int i = 0; i < widths.length; i++) {
            int width = (int) widths[i] & 0x1ffff;
            if (width != 0 && width > limit - cursor) {
                throw new IllegalArgumentException();
            }
            if (cursor + width <= ceiling && width <= 16) {
                ByteVector.fromArray(ByteVector.SPECIES_128, source, cursor)
                          .intoArray(target, outputStart + i * 16);
            }
            cursor += width;
        }
        return cursor;
    }
}
