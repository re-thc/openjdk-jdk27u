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
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import jdk.internal.math.FloatingDecimal;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;

/** Run with UseFastFloatIntrinsics enabled/disabled in -Xint, C1 and C2. */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@State(Scope.Thread)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 3, time = 1)
@Fork(3)
public class FastFloatParsing {
    private static final int N = 1024;
    private String[] shortInput, decimal, doubleRoundTrip, floatRoundTrip, longInput, hex, bigDecimalInput;
    private BigDecimal[] bigDecimal;
    private byte[][] digits, shortDigits, longDigits;

    @Setup
    public void setup() {
        Random r = new Random(0xFA57F10AL);
        shortInput = new String[N];
        decimal = new String[N];
        doubleRoundTrip = new String[N];
        floatRoundTrip = new String[N];
        longInput = new String[N];
        hex = new String[N];
        bigDecimalInput = new String[N];
        bigDecimal = new BigDecimal[N];
        digits = new byte[N][];
        shortDigits = new byte[N][];
        longDigits = new byte[N][];
        for (int i = 0; i < N; i++) {
            shortInput[i] = Integer.toString(r.nextInt(1000));
            decimal[i] = String.format(Locale.ROOT, "%.14f", (r.nextDouble() - 0.5) * 180);
            double d;
            do {
                d = Double.longBitsToDouble(r.nextLong());
            } while (!Double.isFinite(d));
            doubleRoundTrip[i] = Double.toString(d);
            float f;
            do {
                f = Float.intBitsToFloat(r.nextInt());
            } while (!Float.isFinite(f));
            floatRoundTrip[i] = Float.toString(f);
            hex[i] = Double.toHexString(d);
            longInput[i] = "0." + Long.toUnsignedString(r.nextLong())
                    + Long.toUnsignedString(r.nextLong()) + Long.toUnsignedString(r.nextLong())
                    + Long.toUnsignedString(r.nextLong()) + "e" + (r.nextInt(600) - 300);
            bigDecimalInput[i] = Long.toUnsignedString(r.nextLong()) + "."
                    + Long.toUnsignedString(r.nextLong()) + "e" + (r.nextInt(60) - 30);
            bigDecimal[i] = new BigDecimal(bigDecimalInput[i]);
            bigDecimal[i].toString(); // Explicitly distinguish cached and cold conversion.
            digits[i] = ("1" + Long.toUnsignedString(r.nextLong())).getBytes(StandardCharsets.ISO_8859_1);
            shortDigits[i] = Integer.toString(1000 + r.nextInt(9000)).getBytes(StandardCharsets.ISO_8859_1);
            longDigits[i] = ("1" + Long.toUnsignedString(r.nextLong()) + Long.toUnsignedString(r.nextLong())
                    + Long.toUnsignedString(r.nextLong())).getBytes(StandardCharsets.ISO_8859_1);
        }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void parseDoubleShortInput(Blackhole bh) {
        for (String input : shortInput) {
            bh.consume(Double.parseDouble(input));
        }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void parseDoubleDecimal(Blackhole bh) {
        for (String input : decimal) {
            bh.consume(Double.parseDouble(input));
        }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void parseDoubleDoubleRoundTrip(Blackhole bh) {
        for (String input : doubleRoundTrip) {
            bh.consume(Double.parseDouble(input));
        }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void parseDoubleLongInput(Blackhole bh) {
        for (String input : longInput) {
            bh.consume(Double.parseDouble(input));
        }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void parseDoubleHex(Blackhole bh) {
        for (String input : hex) {
            bh.consume(Double.parseDouble(input));
        }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void parseFloatShortInput(Blackhole bh) {
        for (String input : shortInput) {
            bh.consume(Float.parseFloat(input));
        }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void parseFloatDecimal(Blackhole bh) {
        for (String input : decimal) {
            bh.consume(Float.parseFloat(input));
        }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void parseFloatFloatRoundTrip(Blackhole bh) {
        for (String input : floatRoundTrip) {
            bh.consume(Float.parseFloat(input));
        }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void parseFloatLongInput(Blackhole bh) {
        for (String input : longInput) {
            bh.consume(Float.parseFloat(input));
        }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void parseFloatHex(Blackhole bh) {
        for (String input : hex) {
            bh.consume(Float.parseFloat(input));
        }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void decimalFormatDigits(Blackhole bh) {
        for (byte[] input : digits) {
            bh.consume(FloatingDecimal.parseDoubleSignlessDigits(0, input, input.length));
        }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void decimalFormatDigitsShort(Blackhole bh) {
        for (byte[] input : shortDigits) {
            bh.consume(FloatingDecimal.parseDoubleSignlessDigits(0, input, input.length));
        }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void decimalFormatDigitsLong(Blackhole bh) {
        for (byte[] input : longDigits) {
            bh.consume(FloatingDecimal.parseDoubleSignlessDigits(0, input, input.length));
        }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void bigDecimalDoubleCached(Blackhole bh) {
        for (BigDecimal input : bigDecimal) {
            bh.consume(input.doubleValue());
        }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void bigDecimalDoubleCold(Blackhole bh) {
        for (String input : bigDecimalInput) {
            bh.consume(new BigDecimal(input).doubleValue());
        }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void bigDecimalFloatCached(Blackhole bh) {
        for (BigDecimal input : bigDecimal) {
            bh.consume(input.floatValue());
        }
    }

    @Benchmark
    @OperationsPerInvocation(N)
    public void bigDecimalFloatCold(Blackhole bh) {
        for (String input : bigDecimalInput) {
            bh.consume(new BigDecimal(input).floatValue());
        }
    }
}
