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
package org.openjdk.bench.vm.runtime;

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

import java.util.concurrent.TimeUnit;

/**
 * Measures the time of invokes and field accesses in the bytecode interpreter,
 * which is the only code that runs in the first moments of every program.
 * The benchmarks run in forks with -Xint, so that nothing is compiled.
 *
 * <ul>
 * <li>{@code objectMethodsViaInterface}: calls of the methods of
 * {@code java.lang.Object} on a receiver of an interface type, which javac
 * compiles to {@code invokeinterface}. The entry of such a call site in the
 * constant pool cache has to be resolved just once, but used to be resolved
 * again by every execution.</li>
 * <li>{@code interfaceMethod}: a call of a method that the interface
 * declares, as a control. It is looked up in the itable of the receiver.</li>
 * <li>{@code invokeStatic}, {@code invokeVirtual}, {@code getField},
 * {@code putField}: the cost of the scaling of a cache index to the address of
 * its entry, which every invoke and field access pays.</li>
 * </ul>
 *
 * The time per call includes the loop around it, with a few bytecodes for
 * the increment, the comparison with the limit, and for choosing a receiver.
 */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(value = 3, jvmArgsAppend = "-Xint")
@State(Scope.Thread)
public class InterpreterInvoke {

    private static final int LOOP = 1000;

    interface Shape {
        int area();
    }

    static final class Square implements Shape {
        final int side;

        Square(int side) {
            this.side = side;
        }

        @Override
        public int area() {
            return side * side;
        }

        @Override
        public int hashCode() {
            return side;
        }

        @Override
        public boolean equals(Object o) {
            return o == this;
        }

        @Override
        public String toString() {
            return "Square";
        }
    }

    static final class Rectangle implements Shape {
        final int width;
        final int height;

        Rectangle(int width, int height) {
            this.width = width;
            this.height = height;
        }

        @Override
        public int area() {
            return width * height;
        }

        @Override
        public int hashCode() {
            return width ^ height;
        }

        @Override
        public boolean equals(Object o) {
            return o == this;
        }

        @Override
        public String toString() {
            return "Rectangle";
        }
    }

    static final class Counter {
        int count;

        int next(int delta) {
            return count + delta;
        }
    }

    private Shape[] shapes;
    private Counter counter;

    @Setup
    public void setup() {
        shapes = new Shape[] {new Square(3), new Rectangle(2, 5), new Square(7), new Rectangle(4, 6)};
        counter = new Counter();
    }

    static int plus(int x, int y) {
        return x ^ y;
    }

    @Benchmark
    @OperationsPerInvocation(3 * LOOP)
    public int objectMethodsViaInterface() {
        Shape[] shapes = this.shapes;
        int h = 0;
        for (int i = 0; i < LOOP; i++) {
            Shape s = shapes[i & 3];
            h += s.hashCode();
            h += s.equals(shapes[0]) ? 1 : 0;
            h += s.toString() != null ? 1 : 0;
        }
        return h;
    }

    @Benchmark
    @OperationsPerInvocation(LOOP)
    public int interfaceMethod() {
        Shape[] shapes = this.shapes;
        int h = 0;
        for (int i = 0; i < LOOP; i++) {
            h += shapes[i & 3].area();
        }
        return h;
    }

    @Benchmark
    @OperationsPerInvocation(LOOP)
    public int invokeStatic() {
        int s = 0;
        for (int i = 0; i < LOOP; i++) {
            s += plus(i, s);
        }
        return s;
    }

    @Benchmark
    @OperationsPerInvocation(LOOP)
    public int invokeVirtual() {
        Counter c = counter;
        int s = 0;
        for (int i = 0; i < LOOP; i++) {
            s += c.next(i);
        }
        return s;
    }

    @Benchmark
    @OperationsPerInvocation(LOOP)
    public int getField() {
        Counter c = counter;
        int s = 0;
        for (int i = 0; i < LOOP; i++) {
            s += c.count;
        }
        return s;
    }

    @Benchmark
    @OperationsPerInvocation(LOOP)
    public int putField() {
        Counter c = counter;
        for (int i = 0; i < LOOP; i++) {
            c.count = i;
        }
        return c.count;
    }
}
