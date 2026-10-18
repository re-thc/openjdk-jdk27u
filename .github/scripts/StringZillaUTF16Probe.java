/*
 * Copyright (c) 2026, re-thc. All rights reserved.
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
 */

package org.openjdk.bench.java.lang;

import java.util.Arrays;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@State(Scope.Thread)
@Warmup(iterations = 3, time = 500, timeUnit = TimeUnit.MILLISECONDS)
@Measurement(iterations = 5, time = 500, timeUnit = TimeUnit.MILLISECONDS)
@Fork(2)
public class StringZillaUTF16Probe {
    @Param({"64"})
    public int length;
    @Param({"64"})
    public int needleLength;
    @Param({"PENULTIMATE_MISS", "NEAR_END_MISS"})
    public String shape;

    private String value;
    private String needle;

    @Setup
    public void setup() {
        if (needleLength < 4 || length < needleLength) {
            throw new IllegalArgumentException("Invalid search dimensions");
        }
        int mismatch = switch (shape) {
            case "PENULTIMATE_MISS" -> needleLength - 2;
            case "NEAR_END_MISS" -> needleLength - 4;
            default -> throw new IllegalArgumentException("Unknown shape: " + shape);
        };
        char[] haystack = new char[length];
        char[] target = new char[needleLength];
        Arrays.fill(haystack, '\u0401');
        Arrays.fill(target, '\u0401');
        target[mismatch] = '\u0402';
        value = new String(haystack);
        needle = new String(target);
        if (haystack[length - 1] != target[needleLength - 1]
                || scalar(haystack, target, false) != -1 || scalar(haystack, target, true) != -1
                || value.indexOf(needle) != -1 || value.lastIndexOf(needle) != -1) {
            throw new AssertionError("Invalid last-character-preserving UTF-16 miss");
        }
    }

    private static int scalar(char[] haystack, char[] target, boolean reverse) {
        int limit = haystack.length - target.length;
        for (int start = reverse ? limit : 0; start >= 0 && start <= limit; start += reverse ? -1 : 1) {
            int index = 0;
            while (index < target.length && haystack[start + index] == target[index]) {
                index++;
            }
            if (index == target.length) {
                return start;
            }
        }
        return -1;
    }

    @Benchmark
    public int lastIndexOf() {
        return value.lastIndexOf(needle);
    }
}
