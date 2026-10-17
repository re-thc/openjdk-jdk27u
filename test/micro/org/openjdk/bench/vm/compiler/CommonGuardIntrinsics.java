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

import java.util.concurrent.TimeUnit;
import jdk.internal.util.ArraysSupport;
import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.BenchmarkMode;
import org.openjdk.jmh.annotations.CompilerControl;
import org.openjdk.jmh.annotations.Fork;
import org.openjdk.jmh.annotations.Level;
import org.openjdk.jmh.annotations.Measurement;
import org.openjdk.jmh.annotations.Mode;
import org.openjdk.jmh.annotations.OutputTimeUnit;
import org.openjdk.jmh.annotations.Param;
import org.openjdk.jmh.annotations.Scope;
import org.openjdk.jmh.annotations.Setup;
import org.openjdk.jmh.annotations.State;
import org.openjdk.jmh.annotations.Warmup;

@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(value = 3, jvmArgsAppend = "--add-exports=java.base/jdk.internal.util=ALL-UNNAMED")
@State(Scope.Thread)
public class CommonGuardIntrinsics {
    @Param({"false", "true"})
    public boolean failedGuard;

    @Param({"1024", "4096"})
    public int size;

    private int[] input;
    private int seed = 42;
    private static volatile int sink;

    @CompilerControl(CompilerControl.Mode.DONT_INLINE)
    public static int mixed(int first, int second, int[] input) {
        return Math.addExact(first, 1) ^ ArraysSupport.hashCode(input, 0, input.length, 1)
                ^ Math.addExact(second, 2);
    }

    @Setup(Level.Trial)
    public void setup() {
        input = new int[size];
        for (int i = 0; i < size; i++) {
            input[i] = i * 31;
        }
        for (int i = 0; i < 20_000; i++) {
            sink ^= mixed(i & 1023, seed, input);
        }
        if (failedGuard) {
            try {
                mixed(Integer.MAX_VALUE, seed, input);
                throw new AssertionError("guard must fail");
            } catch (ArithmeticException expected) {
            }
            for (int i = 0; i < 20_000; i++) {
                sink ^= mixed(i & 1023, seed, input);
            }
        }
    }

    @Benchmark
    public int mixedOperations() {
        return mixed(seed, seed + 1, input);
    }
}
