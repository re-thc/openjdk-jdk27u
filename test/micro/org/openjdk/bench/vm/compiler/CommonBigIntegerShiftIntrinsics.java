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

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.math.BigInteger;
import java.util.Random;
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

@State(Scope.Thread)
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(value = 3, jvmArgsAppend = "--add-opens=java.base/java.math=ALL-UNNAMED")
public class CommonBigIntegerShiftIntrinsics {
    @Param({"16", "256"})
    public int length;
    private int[] words;
    private static final MethodHandle LEFT;
    private static final MethodHandle RIGHT;

    static {
        try {
            MethodHandles.Lookup lookup = MethodHandles.privateLookupIn(BigInteger.class, MethodHandles.lookup());
            MethodType type = MethodType.methodType(void.class, int[].class, int.class, int.class);
            LEFT = lookup.findStatic(BigInteger.class, "primitiveLeftShift", type);
            RIGHT = lookup.findStatic(BigInteger.class, "primitiveRightShift", type);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    @Setup
    public void setup() {
        words = new Random(42).ints(length).toArray();
    }

    @Benchmark
    public int[] inPlaceLeftShift() throws Throwable {
        LEFT.invokeExact(words, length, 7);
        return words;
    }

    @Benchmark
    public int[] inPlaceRightShift() throws Throwable {
        RIGHT.invokeExact(words, length, 7);
        return words;
    }
}
