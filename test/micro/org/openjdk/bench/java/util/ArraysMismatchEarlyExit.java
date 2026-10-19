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
package org.openjdk.bench.java.util;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.DoubleBuffer;
import java.nio.FloatBuffer;
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
import org.openjdk.jmh.annotations.Warmup;

/** Equal arrays and early differences after the caller's first-element check. */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@State(Scope.Thread)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(3)
public class ArraysMismatchEarlyExit {
    @Param({"BYTE", "BOOLEAN", "CHAR", "SHORT", "INT", "LONG", "FLOAT", "DOUBLE"})
    public String kind;

    /** Number of elements, including for the non-byte array kinds. */
    @Param({"8", "64", "128", "4096", "65536"})
    public int size;

    /** -1 means equal; otherwise the index of the differing element. */
    @Param({"-1", "0", "1", "2", "3", "4", "5", "6", "7"})
    public int difference;

    @Param({"0", "1", "7"})
    public int offset;

    private byte[] ba, bb;
    private boolean[] za, zb;
    private char[] ca, cb;
    private short[] sa, sb;
    private int[] ia, ib;
    private long[] la, lb;
    private float[] fa, fb;
    private double[] da, db;
    private final int[] controls = new int[256];
    private int cursor;

    @Setup
    public void setup() {
        if (size < 1 || difference < -1 || difference >= size || offset < 0) {
            throw new IllegalArgumentException("Invalid array range or difference");
        }
        int capacity = size + offset + 8;
        int at = difference < 0 ? capacity - 1 : offset + difference;
        switch (kind) {
            case "BYTE" -> { ba = new byte[capacity]; bb = ba.clone(); bb[at] = 1; }
            case "BOOLEAN" -> { za = new boolean[capacity]; zb = za.clone(); zb[at] = true; }
            case "CHAR" -> { ca = new char[capacity]; cb = ca.clone(); cb[at] = 1; }
            case "SHORT" -> { sa = new short[capacity]; sb = sa.clone(); sb[at] = 1; }
            case "INT" -> { ia = new int[capacity]; ib = ia.clone(); ib[at] = 1; }
            case "LONG" -> { la = new long[capacity]; lb = la.clone(); lb[at] = 1; }
            case "FLOAT" -> { fa = new float[capacity]; fb = fa.clone(); fb[at] = 1; }
            case "DOUBLE" -> { da = new double[capacity]; db = da.clone(); db[at] = 1; }
            default -> throw new IllegalArgumentException(kind);
        }
        if (mismatch() != difference) {
            throw new AssertionError("Invalid fixture: " + kind);
        }
        for (int i = 0; i < controls.length; i++) {
            controls[i] = i * 0x12345 + 17;
        }
    }

    @Benchmark
    public int mismatch() {
        int end = offset + size;
        return switch (kind) {
            case "BYTE" -> Arrays.mismatch(ba, offset, end, bb, offset, end);
            case "BOOLEAN" -> Arrays.mismatch(za, offset, end, zb, offset, end);
            case "CHAR" -> Arrays.mismatch(ca, offset, end, cb, offset, end);
            case "SHORT" -> Arrays.mismatch(sa, offset, end, sb, offset, end);
            case "INT" -> Arrays.mismatch(ia, offset, end, ib, offset, end);
            case "LONG" -> Arrays.mismatch(la, offset, end, lb, offset, end);
            case "FLOAT" -> Arrays.mismatch(fa, offset, end, fb, offset, end);
            case "DOUBLE" -> Arrays.mismatch(da, offset, end, db, offset, end);
            default -> throw new IllegalArgumentException(kind);
        };
    }

    /** Scalar control without any mismatch, buffer, or foreign-memory operation. */
    @Benchmark
    public int control() {
        int x = controls[++cursor & 255];
        x ^= x >>> 13;
        return x * 0x5bd1e995;
    }

    /** Array equality distinguishes signed zero; buffer equality does not. */
    @BenchmarkMode(Mode.AverageTime)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @State(Scope.Thread)
    @Warmup(iterations = 5, time = 1)
    @Measurement(iterations = 5, time = 1)
    @Fork(3)
    public static class FloatingPoint {
        @Param({"FLOAT", "DOUBLE"})
        public String kind;

        @Param({"8", "64", "4096"})
        public int size;

        @Param({"ARRAY", "HEAP", "DIRECT"})
        public String storage;

        @Param({"NAN_MATCH", "SIGNED_ZERO"})
        public String pattern;

        @Param({"0", "7"})
        public int position;

        private float[] fa, fb;
        private double[] da, db;
        private FloatBuffer fab, fbb;
        private DoubleBuffer dab, dbb;

        @Setup
        public void setup() {
            if (position < 0 || position >= size) {
                throw new IllegalArgumentException("Position outside range");
            }
            boolean nan = switch (pattern) {
                case "NAN_MATCH" -> true;
                case "SIGNED_ZERO" -> false;
                default -> throw new IllegalArgumentException(pattern);
            };
            boolean array = storage.equals("ARRAY");
            boolean direct = storage.equals("DIRECT");
            if (!array && !direct && !storage.equals("HEAP")) {
                throw new IllegalArgumentException(storage);
            }
            switch (kind) {
                case "FLOAT" -> {
                    fa = new float[size];
                    fb = new float[size];
                    fa[position] = nan ? Float.intBitsToFloat(0x7fc00001) : 0.0f;
                    fb[position] = nan ? Float.intBitsToFloat(0xff800002) : -0.0f;
                    if (nan && Float.floatToRawIntBits(fa[position]) == Float.floatToRawIntBits(fb[position])) {
                        throw new AssertionError("NaN payloads must differ");
                    }
                    if (!array) {
                        fab = direct ? ByteBuffer.allocateDirect(size * Float.BYTES)
                                .order(ByteOrder.nativeOrder()).asFloatBuffer() : FloatBuffer.allocate(size);
                        fbb = direct ? ByteBuffer.allocateDirect(size * Float.BYTES)
                                .order(ByteOrder.nativeOrder()).asFloatBuffer() : FloatBuffer.allocate(size);
                        fab.put(fa).clear();
                        fbb.put(fb).clear();
                    }
                }
                case "DOUBLE" -> {
                    da = new double[size];
                    db = new double[size];
                    da[position] = nan ? Double.longBitsToDouble(0x7ff8000000000001L) : 0.0;
                    db[position] = nan ? Double.longBitsToDouble(0xfff0000000000002L) : -0.0;
                    if (nan && Double.doubleToRawLongBits(da[position]) == Double.doubleToRawLongBits(db[position])) {
                        throw new AssertionError("NaN payloads must differ");
                    }
                    if (!array) {
                        dab = direct ? ByteBuffer.allocateDirect(size * Double.BYTES)
                                .order(ByteOrder.nativeOrder()).asDoubleBuffer() : DoubleBuffer.allocate(size);
                        dbb = direct ? ByteBuffer.allocateDirect(size * Double.BYTES)
                                .order(ByteOrder.nativeOrder()).asDoubleBuffer() : DoubleBuffer.allocate(size);
                        dab.put(da).clear();
                        dbb.put(db).clear();
                    }
                }
                default -> throw new IllegalArgumentException(kind);
            }
            int expected = array && !nan ? position : -1;
            if (mismatch() != expected) {
                throw new AssertionError("Invalid floating-point fixture");
            }
        }

        @Benchmark
        public int mismatch() {
            if (storage.equals("ARRAY")) {
                return kind.equals("FLOAT") ? Arrays.mismatch(fa, fb) : Arrays.mismatch(da, db);
            }
            return kind.equals("FLOAT") ? fab.mismatch(fbb) : dab.mismatch(dbb);
        }
    }
}
