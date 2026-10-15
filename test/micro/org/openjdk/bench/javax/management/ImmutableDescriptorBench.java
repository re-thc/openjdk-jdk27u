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
package org.openjdk.bench.javax.management;

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

import javax.management.ImmutableDescriptor;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.TimeUnit;

/**
 * Measures descriptor construction across field counts and input orders.
 */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(value = 3)
@State(Scope.Thread)
public class ImmutableDescriptorBench {

    @Param({"4", "16", "64", "1024"})
    public int size;

    @Param({"sorted", "reverse", "random"})
    public String order;

    private String[] names;
    private Object[] values;
    private Map<String, Object> map;

    @Setup
    public void setup() {
        List<String> list = new ArrayList<>(size);
        for (int i = 0; i < size; i++) {
            list.add("field" + String.format("%05d", i));
        }
        switch (order) {
            case "sorted" -> { }
            case "reverse" -> Collections.reverse(list);
            case "random" -> Collections.shuffle(list, new Random(42));
            default -> throw new IllegalArgumentException(order);
        }
        names = list.toArray(new String[0]);
        values = new Object[size];
        // Match the array order for both constructor benchmarks.
        map = new LinkedHashMap<>();
        for (int i = 0; i < size; i++) {
            values[i] = "value" + i;
            map.put(names[i], values[i]);
        }
    }

    @Benchmark
    public ImmutableDescriptor fromArrays() {
        return new ImmutableDescriptor(names, values);
    }

    @Benchmark
    public ImmutableDescriptor fromMap() {
        return new ImmutableDescriptor(map);
    }
}
