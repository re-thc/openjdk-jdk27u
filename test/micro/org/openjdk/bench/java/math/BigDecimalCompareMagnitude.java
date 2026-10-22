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

package org.openjdk.bench.java.math;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@State(Scope.Thread)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(3)
public class BigDecimalCompareMagnitude {
    private static final int SIZE = 256;

    @Param({"inflatedShort", "inflatedLong", "mixed", "wideScale",
            "large", "largeScale", "compact", "equalScale", "exponent",
            "mostlyRejected", "balanced"})
    public String distribution;

    private BigDecimal[] left;
    private BigDecimal[] right;

    @Setup
    public void setup() {
        Random random = new Random(0xdec128L);
        left = new BigDecimal[SIZE];
        right = new BigDecimal[SIZE];
        for (int i = 0; i < SIZE; i++) {
            String kind = distribution;
            if (kind.equals("mostlyRejected") || kind.equals("balanced")) {
                boolean eligible = i % (kind.equals("balanced") ? 2 : 10) == 0;
                kind = eligible ? "inflatedShort" :
                        switch (i % 5) {
                            case 0 -> "large";
                            case 1 -> "compact";
                            case 2 -> "equalScale";
                            case 3 -> "exponent";
                            default -> "largeScale";
                        };
            }
            int digits = 22;
            int difference = 1 + i % 6;
            switch (kind) {
                case "inflatedLong" -> { digits = 20; difference = 8 + i % 11; }
                case "mixed" -> { digits = 12; difference = 8 + i % 15; }
                case "wideScale" -> { difference = 19 + i % 20; digits = 39 - difference; }
                case "large" -> digits = 80;
                case "largeScale" -> { digits = 20; difference = 40 + i % 30; }
                case "compact" -> { digits = 8; difference = 1 + i % 5; }
                case "equalScale" -> difference = 0;
                case "exponent", "inflatedShort" -> { }
                default -> throw new IllegalArgumentException(kind);
            }
            BigInteger x = BigInteger.TEN.pow(digits - 1)
                    .add(new BigInteger(Math.max(1, (digits - 1) * 3), random));
            BigInteger y = x.multiply(BigInteger.TEN.pow(difference))
                    .add(BigInteger.valueOf(i % 3 - 1));
            int scale = i % 37 - 18;
            int otherScale = scale + difference + (kind.equals("exponent") ? 3 : 0);
            BigDecimal a = new BigDecimal(x, scale);
            BigDecimal b = new BigDecimal(y, otherScale);
            if ((i & 2) != 0) { a = a.negate(); b = b.negate(); }
            if ((i & 1) != 0) { BigDecimal temp = a; a = b; b = temp; }
            // Measure repeated comparisons; first-precision costs are separate.
            a.precision();
            b.precision();
            left[i] = a;
            right[i] = b;
        }
    }

    @Benchmark
    @OperationsPerInvocation(SIZE)
    public int compareTo() {
        int result = 0;
        for (int i = 0; i < SIZE; i++)
            result += left[i].compareTo(right[i]);
        return result;
    }

    @Benchmark
    @OperationsPerInvocation(SIZE)
    public int min() {
        int result = 0;
        for (int i = 0; i < SIZE; i++)
            result += left[i].min(right[i]).scale();
        return result;
    }

    @Benchmark
    @OperationsPerInvocation(SIZE)
    public int max() {
        int result = 0;
        for (int i = 0; i < SIZE; i++)
            result += left[i].max(right[i]).scale();
        return result;
    }
}
