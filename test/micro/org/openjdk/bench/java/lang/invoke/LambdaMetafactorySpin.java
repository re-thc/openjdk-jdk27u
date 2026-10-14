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
package org.openjdk.bench.java.lang.invoke;

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
import org.openjdk.jmh.infra.Blackhole;

import java.lang.invoke.LambdaMetafactory;
import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.util.concurrent.TimeUnit;
import java.util.function.Function;
import java.util.function.Supplier;

/**
 * Measures linking a lambda: every call of {@code LambdaMetafactory.metafactory}
 * spins and defines a class for the lambda, as the invokedynamic instruction
 * of a lambda expression does when it is first executed. An invocation makes
 * 200 calls, and the classes stay loaded.
 */
@BenchmarkMode(Mode.SingleShotTime)
@OutputTimeUnit(TimeUnit.MICROSECONDS)
@Warmup(iterations = 20)
@Measurement(iterations = 30)
@Fork(value = 3)
@State(Scope.Thread)
public class LambdaMetafactorySpin {

    private static final int SPINS = 200;

    private static final MethodType VOID = MethodType.methodType(void.class);
    private static final MethodType OBJECT_TO_OBJECT = MethodType.methodType(Object.class, Object.class);

    private MethodHandles.Lookup lookup;
    private MethodHandle work;
    private MethodHandle describe;
    private MethodHandle length;

    static void work() {
    }

    static String describe(String prefix) {
        return prefix;
    }

    static int length(String s) {
        return s.length();
    }

    @Setup
    public void setup() throws ReflectiveOperationException {
        lookup = MethodHandles.lookup();
        work = lookup.findStatic(LambdaMetafactorySpin.class, "work", VOID);
        describe = lookup.findStatic(LambdaMetafactorySpin.class, "describe",
                MethodType.methodType(String.class, String.class));
        length = lookup.findStatic(LambdaMetafactorySpin.class, "length",
                MethodType.methodType(int.class, String.class));
    }

    /** {@code Runnable r = () -> work();} */
    @Benchmark
    @OperationsPerInvocation(SPINS)
    public void runnable(Blackhole bh) throws Throwable {
        MethodType factoryType = MethodType.methodType(Runnable.class);
        for (int i = 0; i < SPINS; i++) {
            bh.consume(LambdaMetafactory.metafactory(lookup, "run", factoryType, VOID, work, VOID));
        }
    }

    /** {@code Supplier<String> s = () -> describe(prefix);} */
    @Benchmark
    @OperationsPerInvocation(SPINS)
    public void capturingSupplier(Blackhole bh) throws Throwable {
        MethodType factoryType = MethodType.methodType(Supplier.class, String.class);
        MethodType samType = MethodType.methodType(Object.class);
        MethodType instantiatedType = MethodType.methodType(String.class);
        for (int i = 0; i < SPINS; i++) {
            bh.consume(LambdaMetafactory.metafactory(lookup, "get", factoryType, samType, describe,
                    instantiatedType));
        }
    }

    /** {@code Function<String, Integer> f = s -> length(s);} with boxing of the result */
    @Benchmark
    @OperationsPerInvocation(SPINS)
    public void function(Blackhole bh) throws Throwable {
        MethodType factoryType = MethodType.methodType(Function.class);
        MethodType instantiatedType = MethodType.methodType(Integer.class, String.class);
        for (int i = 0; i < SPINS; i++) {
            bh.consume(LambdaMetafactory.metafactory(lookup, "apply", factoryType, OBJECT_TO_OBJECT, length,
                    instantiatedType));
        }
    }
}
