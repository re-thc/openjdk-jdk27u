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

package org.openjdk.bench.jdk.incubator.vector;

import java.util.Random;
import java.util.concurrent.TimeUnit;
import jdk.incubator.vector.*;
import org.openjdk.jmh.annotations.*;

@State(Scope.Thread)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(value = 3, jvmArgsAppend = {"--add-modules=jdk.incubator.vector"})
public class CompareFirstTrue {
    private static final int VECTORS = 1024;

    @Param({"early", "late", "empty", "uniform"})
    public String distribution;

    private byte[] bytes64A, bytes64B, bytesA, bytesB;
    private int[] intsA, intsB;
    private long[] longsA, longsB;

    @Setup
    public void setup() {
        bytes64A = new byte[VECTORS * 8]; bytes64B = new byte[VECTORS * 8];
        bytesA = new byte[VECTORS * 16]; bytesB = new byte[VECTORS * 16];
        intsA = new int[VECTORS * 4]; intsB = new int[VECTORS * 4];
        longsA = new long[VECTORS * 2]; longsB = new long[VECTORS * 2];
        Random random = new Random(27);
        for (int i = 0; i < VECTORS; i++) {
            int b64 = firstLane(random, 8);
            if (b64 < 8) bytes64B[i * 8 + b64] = 1;
            int b = firstLane(random, 16), n = firstLane(random, 4), l = firstLane(random, 2);
            if (b < 16) bytesB[i * 16 + b] = 1;
            if (n < 4) intsB[i * 4 + n] = 1;
            if (l < 2) longsB[i * 2 + l] = 1;
        }
    }

    private int firstLane(Random random, int lanes) {
        return switch (distribution) {
            case "early" -> 0;
            case "late" -> lanes - 1;
            case "empty" -> lanes;
            case "uniform" -> random.nextInt(lanes + 1);
            default -> throw new IllegalArgumentException(distribution);
        };
    }

    @Benchmark
    @OperationsPerInvocation(VECTORS)
    public int compareByte64() {
        int sum = 0;
        for (int i = 0; i < bytes64A.length; i += 8) {
            sum += ByteVector.fromArray(ByteVector.SPECIES_64, bytes64A, i)
                    .compare(VectorOperators.NE, ByteVector.fromArray(ByteVector.SPECIES_64, bytes64B, i))
                    .firstTrue();
        }
        return sum;
    }

    @Benchmark
    @OperationsPerInvocation(VECTORS)
    public int compareByte128() {
        int sum = 0;
        for (int i = 0; i < bytesA.length; i += 16) {
            sum += ByteVector.fromArray(ByteVector.SPECIES_128, bytesA, i)
                    .compare(VectorOperators.NE, ByteVector.fromArray(ByteVector.SPECIES_128, bytesB, i))
                    .firstTrue();
        }
        return sum;
    }

    @Benchmark
    @OperationsPerInvocation(VECTORS)
    public int compareInt128() {
        int sum = 0;
        for (int i = 0; i < intsA.length; i += 4) {
            sum += IntVector.fromArray(IntVector.SPECIES_128, intsA, i)
                    .compare(VectorOperators.NE, IntVector.fromArray(IntVector.SPECIES_128, intsB, i))
                    .firstTrue();
        }
        return sum;
    }

    @Benchmark
    @OperationsPerInvocation(VECTORS)
    public int compareLong128() {
        int sum = 0;
        for (int i = 0; i < longsA.length; i += 2) {
            sum += LongVector.fromArray(LongVector.SPECIES_128, longsA, i)
                    .compare(VectorOperators.NE, LongVector.fromArray(LongVector.SPECIES_128, longsB, i))
                    .firstTrue();
        }
        return sum;
    }

}
