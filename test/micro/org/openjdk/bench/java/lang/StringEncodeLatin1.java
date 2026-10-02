/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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

import java.nio.charset.StandardCharsets;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

/** Public UTF-8 encoding of compact Latin-1 strings at different high-bit densities. */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Fork(3)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 5, time = 1)
@State(Scope.Thread)
public class StringEncodeLatin1 {
    @Param({"8", "64", "1024", "4096", "4097", "16384"})
    public int size;

    @Param({"ascii", "first", "dense", "every8", "last"})
    public String density;

    private String[] inputs;
    private int sequence;

    @Setup(Level.Trial)
    public void setup() {
        inputs = new String[16];
        for (int slot = 0; slot < inputs.length; slot++) {
            inputs[slot] = makeInput(size, density, slot);
        }
    }

    public static String makeInput(int size, String density, int slot) {
        char[] chars = new char[size];
        for (int i = 0; i < size; i++) {
            boolean high = switch (density) {
                case "ascii" -> false;
                case "first" -> i == 0;
                case "dense" -> true;
                case "every8" -> (i & 7) == 0;
                case "last" -> i == size - 1;
                default -> throw new IllegalArgumentException("Unknown density: " + density);
            };
            chars[i] = high ? (char) (0x80 + ((i + slot) & 0x7f))
                            : (char) ('a' + (i + slot) % 26);
        }
        return new String(chars);
    }

    @Benchmark
    public byte[] encode() {
        return inputs[sequence++ & 15].getBytes(StandardCharsets.UTF_8);
    }
}
