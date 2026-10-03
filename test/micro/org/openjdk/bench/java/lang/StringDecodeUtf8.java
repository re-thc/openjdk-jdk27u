/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */
package org.openjdk.bench.java.lang;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

/** Public construction from UTF8. Size is the exact input byte count. */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Fork(3)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 5, time = 1)
@State(Scope.Thread)
public class StringDecodeUtf8 {
    @Param({"16", "64", "255", "256", "1024", "4096", "4097", "16384"})
    public int size;
    @Param({"ascii", "latin1", "bmp", "supplementary", "mixed", "malformed"})
    public String pattern;
    @Param({"false"})
    public boolean initializeLarger;
    private byte[][] inputs;
    private int sequence;

    @Setup(Level.Trial)
    public void setup() {
        inputs = new byte[16][];
        byte[] unit = switch (pattern) {
            case "ascii" -> new byte[] {'a'};
            case "latin1" -> new byte[] {(byte) 0xc3, (byte) 0xa9};
            case "bmp" -> new byte[] {(byte) 0xe4, (byte) 0xb8, (byte) 0xad};
            case "supplementary" -> new byte[] {(byte) 0xf0, (byte) 0x9f, (byte) 0x98, (byte) 0x80};
            case "mixed" -> new byte[] {(byte) 0xe4, (byte) 0xb8, (byte) 0xad, 'a', 0};
            case "malformed" -> new byte[] {(byte) 0xe4, (byte) 0xb8, (byte) 0xad, (byte) 0xed, (byte) 0xa0, (byte) 0x80};
            default -> throw new IllegalArgumentException(pattern);
        };
        for (int slot = 0; slot < inputs.length; slot++) {
            byte[] input = new byte[size];
            int i = 0;
            while (i + unit.length <= size) {
                System.arraycopy(unit, 0, input, i, unit.length);
                i += unit.length;
            }
            Arrays.fill(input, i, size, (byte) ('a' + slot));
            inputs[slot] = input;
        }
        if (initializeLarger) {
            byte[] large = new byte[1536];
            for (int i = 0; i < large.length; i += 3) {
                large[i] = (byte) 0xe4; large[i + 1] = (byte) 0xb8; large[i + 2] = (byte) 0xad;
            }
            if (new String(large, StandardCharsets.UTF_8).length() != 512) {
                throw new AssertionError("UTF8 initialization conversion");
            }
        }
    }
    @Benchmark
    public String decode() {
        return new String(inputs[sequence++ & 15], StandardCharsets.UTF_8);
    }
}
