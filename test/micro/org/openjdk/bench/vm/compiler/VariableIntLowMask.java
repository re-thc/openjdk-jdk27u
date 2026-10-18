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

package org.openjdk.bench.vm.compiler;

import java.util.Random;
import java.util.concurrent.TimeUnit;

import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.BenchmarkMode;
import org.openjdk.jmh.annotations.Fork;
import org.openjdk.jmh.annotations.Measurement;
import org.openjdk.jmh.annotations.Mode;
import org.openjdk.jmh.annotations.OperationsPerInvocation;
import org.openjdk.jmh.annotations.OutputTimeUnit;
import org.openjdk.jmh.annotations.Scope;
import org.openjdk.jmh.annotations.Setup;
import org.openjdk.jmh.annotations.State;
import org.openjdk.jmh.annotations.Warmup;

@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@State(Scope.Thread)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 5, time = 1)
// Isolate scalar matching. This is a diagnostic micro, not codec VM settings.
@Fork(value = 3, jvmArgsAppend = {"-XX:-UseSuperWord"})
public class VariableIntLowMask {
    private static final int SIZE = 256;
    private static final int FEEDBACK_MULTIPLIER = 0x9e37_79b9;
    private int[] values;
    private byte[] counts;
    private byte[] nonzeroCounts;
    private int seed;

    // Validate setup without invoking the JMH harness or any timed windows.
    public static void main(String[] args) {
        VariableIntLowMask benchmark = new VariableIntLowMask();
        benchmark.setup();
        benchmark.independent();
        benchmark.dependentNonzero();
        benchmark.countFeedbackNonzero();
        System.out.println("VariableIntLowMask setup checks and untimed calls passed");
    }

    @Setup
    public void setup() {
        Random random = new Random(8389111);
        values = new int[SIZE];
        counts = new byte[SIZE];
        nonzeroCounts = new byte[SIZE];
        for (int i = 0; i < SIZE; i++) {
            values[i] = random.nextInt();
            counts[i] = (byte) i;
            nonzeroCounts[i] = (byte) (i % 31 + 1);
        }
        seed = random.nextInt();
        verifyCountFeedback();
    }

    @Benchmark
    @OperationsPerInvocation(SIZE)
    public int independent() {
        int base = seed;
        int a = 0, b = 0, c = 0, d = 0;
        for (int i = 0; i < SIZE; i += 4) {
            a ^= (values[i] + base) & ((1 << (counts[i] & 255)) - 1);
            b ^= (values[i + 1] + base) & ((1 << (counts[i + 1] & 255)) - 1);
            c ^= (values[i + 2] + base) & ((1 << (counts[i + 2] & 255)) - 1);
            d ^= (values[i + 3] + base) & ((1 << (counts[i + 3] & 255)) - 1);
        }
        // Change the next invocation's inputs so the batch cannot be hoisted.
        seed = Integer.rotateLeft(base + a + b + c + d, 1);
        return seed;
    }

    @Benchmark
    @OperationsPerInvocation(SIZE)
    public int dependentNonzero() {
        // Only the value is loop-carried. Independent counts can let the old
        // shift/subtract mask generation execute ahead of that dependency.
        int value = seed;
        for (int i = 0; i < SIZE; i++) {
            // A zero mask would kill the architectural dependency. Keep the
            // full wrapping domain in independent(), and use widths 1..31 here.
            value = (value & ((1 << (nonzeroCounts[i] & 255)) - 1)) + values[i];
        }
        seed = value;
        return value;
    }

    @Benchmark
    @OperationsPerInvocation(SIZE)
    public int countFeedbackNonzero() {
        int value = seed;
        for (int i = 0; i < SIZE; i++) {
            // Raw counts remain byte-sized, but their low five bits are odd,
            // hence never zero. Each count depends on the preceding extraction.
            int bits = (value >>> 24) | 1;
            int extracted = value & ((1 << bits) - 1);
            value = Integer.rotateLeft(extracted * FEEDBACK_MULTIPLIER, 11) + values[i];
        }
        seed = value;
        return value;
    }

    private void verifyCountFeedback() {
        int initial = seed;
        // Check successive invocation states as well as the initial batch.
        for (int batch = 0; batch < 4; batch++) {
            int value = seed;
            int seenWidths = 0;
            int extractedOr = 0;
            int extractedAnd = -1;
            int widthFeedbackChanges = 0;
            for (int i = 0; i < SIZE; i++) {
                int bits = ((value >>> 24) | 1) & 31;
                if (bits == 0) {
                    throw new AssertionError("Zero feedback width");
                }
                seenWidths |= 1 << bits;
                // Independent mask formulation: no int shift/subtract expression.
                long low = 0xffff_ffffL >>> (32 - bits);
                int extracted = (int) (Integer.toUnsignedLong(value) & low);
                extractedOr |= extracted;
                extractedAnd &= extracted;
                int next = Integer.rotateLeft(extracted * FEEDBACK_MULTIPLIER, 11) + values[i];
                int perturbed = Integer.rotateLeft((extracted ^ 1) * FEEDBACK_MULTIPLIER, 11) + values[i];
                if ((((next >>> 24) | 1) & 31) != (((perturbed >>> 24) | 1) & 31)) {
                    widthFeedbackChanges++;
                }
                value = next;
            }
            if (Integer.bitCount(seenWidths) < 8 || extractedOr == extractedAnd || widthFeedbackChanges == 0) {
                throw new AssertionError("Degenerate count-feedback recurrence");
            }
            if (countFeedbackNonzero() != value) {
                throw new AssertionError("Count-feedback reference mismatch");
            }
        }
        // Setup validation must not change any benchmark's initial state.
        seed = initial;
    }
}
