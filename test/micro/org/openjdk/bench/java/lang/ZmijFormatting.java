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
package org.openjdk.bench.java.lang;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Locale;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import jdk.internal.math.DoubleToDecimal;
import jdk.internal.math.FloatToDecimal;
import jdk.incubator.vector.Float16;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;

@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@State(Scope.Thread)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 3, time = 1)
@Fork(3)
public class ZmijFormatting {
    private static final int N = 1024;
    private double[] doubles, decimals, integers;
    private double[] zeros, nans;
    private float[] floats;
    private Float16[] halves;
    private final byte[] out = new byte[DoubleToDecimal.MAX_CHARS];
    private final byte[] wide = new byte[2 * DoubleToDecimal.MAX_CHARS];
    private final DecimalFormat decimalFormat = new DecimalFormat("0.#################");

    @Setup
    public void setup() {
        Random r = new Random(0xF70A111L);
        doubles = new double[N];
        zeros = new double[N];
        nans = new double[N];
        decimals = new double[N];
        integers = new double[N];
        floats = new float[N];
        halves = new Float16[N];
        for (int i = 0; i < N; ++i) {
            zeros[i] = (i & 1) == 0 ? 0.0 : -0.0;
            nans[i] = Double.longBitsToDouble(0x7ff8000000000000L | i | ((long) (i & 1) << 63));
            do { doubles[i] = Double.longBitsToDouble(r.nextLong()); } while (!Double.isFinite(doubles[i]));
            do { floats[i] = Float.intBitsToFloat(r.nextInt()); } while (!Float.isFinite(floats[i]));
            decimals[i] = (r.nextDouble() - 0.5) * 180;
            integers[i] = r.nextInt(1000);
            do { halves[i] = Float16.shortBitsToFloat16((short) r.nextInt()); }
            while (!Float16.isFinite(halves[i]));
        }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void doubleRandom(Blackhole bh) {
        for (double v : doubles) { bh.consume(Double.toString(v)); }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void floatRandom(Blackhole bh) {
        for (float v : floats) { bh.consume(Float.toString(v)); }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void float16Random(Blackhole bh) {
        for (Float16 v : halves) { bh.consume(Float16.toString(v)); }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void doubleDecimal(Blackhole bh) {
        for (double v : decimals) { bh.consume(Double.toString(v)); }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void doubleShortInteger(Blackhole bh) {
        for (double v : integers) { bh.consume(Double.toString(v)); }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void floatShortInteger(Blackhole bh) {
        for (double v : integers) { bh.consume(Float.toString((float) v)); }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void doubleAppend(Blackhole bh) {
        for (double v : doubles) { bh.consume(new StringBuilder().append(v).toString()); }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void doubleAppendUtf16(Blackhole bh) {
        for (double v : doubles) { bh.consume(new StringBuilder("\u0100").append(v).toString()); }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void floatAppend(Blackhole bh) {
        for (float v : floats) { bh.consume(new StringBuilder().append(v).toString()); }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void doubleConcat(Blackhole bh) {
        for (double v : doubles) { bh.consume("value=" + v); }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void floatConcat(Blackhole bh) {
        for (float v : floats) { bh.consume("value=" + v); }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void doublePutLatin1(Blackhole bh) {
        for (double v : doubles) { bh.consume(DoubleToDecimal.LATIN1.putDecimal(out, 0, v)); }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void doublePutUtf16(Blackhole bh) {
        for (double v : doubles) { bh.consume(DoubleToDecimal.UTF16.putDecimal(wide, 0, v)); }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void floatPutLatin1(Blackhole bh) {
        for (float v : floats) { bh.consume(FloatToDecimal.LATIN1.putDecimal(out, 0, v)); }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void bigDecimalValueOf(Blackhole bh) {
        for (double v : doubles) { bh.consume(BigDecimal.valueOf(v)); }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void bigDecimalShortInteger(Blackhole bh) {
        for (double v : integers) { bh.consume(BigDecimal.valueOf(v)); }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void decimalFormatDecimal(Blackhole bh) {
        for (double v : decimals) { bh.consume(decimalFormat.format(v)); }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void formatterGeneral(Blackhole bh) {
        for (double v : decimals) { bh.consume(String.format(Locale.ROOT, "%.9g", v)); }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void doubleZero(Blackhole bh) {
        for (double v : zeros) { bh.consume(Double.toString(v)); }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void doubleNaN(Blackhole bh) {
        for (double v : nans) { bh.consume(Double.toString(v)); }
    }
}
