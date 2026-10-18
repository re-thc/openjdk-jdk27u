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
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
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
public class StringZillaTailSearch {
    @Param({"575"})
    public int length;
    @Param({"511"})
    public int needleLength;
    @Param({"LATIN_PREFIX_MISS"})
    public String shape;

    private String value;
    private String needle;

    @Setup
    public void setup() {
        if (needleLength <= 0 || length < needleLength) {
            throw new IllegalArgumentException("Invalid haystack or needle length");
        }
        char repeated;
        int mismatch = -1;
        int period = 0;
        char marker = 0;
        switch (shape) {
            case "LATIN_PREFIX_MISS":
                if (needleLength < 257) throw new IllegalArgumentException("Needle is too short");
                repeated = 'a';
                mismatch = needleLength - 257;
                break;
            case "UTF16_PREFIX_MISS":
                if (needleLength != 256) throw new IllegalArgumentException("Expected 256 code units");
                repeated = '\u0404';
                mismatch = 127;
                break;
            case "UTF16_UNIFORM_END":
                repeated = '\u0101';
                break;
            case "LATIN_PERIOD2_MISS":
            case "LATIN_PERIOD3_MISS":
                repeated = 'a';
                period = shape.equals("LATIN_PERIOD2_MISS") ? 2 : 3;
                marker = 'c';
                break;
            case "UTF16_PERIOD2_MISS":
            case "UTF16_PERIOD3_MISS":
                repeated = '\u0401';
                period = shape.equals("UTF16_PERIOD2_MISS") ? 2 : 3;
                marker = '\u0501';
                break;
            default:
                throw new IllegalArgumentException("Unknown shape: " + shape);
        }
        char[] haystack = new char[length];
        char[] target = new char[needleLength];
        Arrays.fill(haystack, repeated);
        Arrays.fill(target, repeated);
        if (period != 0) {
            mismatch = needleLength - (period == 2 ? 3 : 4);
            int unit = repeated > 0xff ? 2 : 1;
            if ((long)needleLength * unit <= 256 || mismatch <= needleLength / 2) {
                throw new IllegalArgumentException("Periodic needle is too short");
            }
            for (int i = 0; i < haystack.length; i++) {
                haystack[i] = i % period == period - 1 ? (char)(repeated + 1) : repeated;
            }
            for (int i = 0; i < target.length; i++) {
                target[i] = i % period == period - 1 ? (char)(repeated + 1) : repeated;
            }
            target[mismatch] = marker;
        } else if (mismatch >= 0) {
            target[mismatch]++;
        }
        value = new String(haystack);
        needle = new String(target);
        int first = mismatch >= 0 ? -1 : 0;
        int last = mismatch >= 0 ? -1 : length - needleLength;
        if (scalar(haystack, target, false) != first || scalar(haystack, target, true) != last) {
            throw new AssertionError("Invalid fixture");
        }
        if (value.indexOf(needle) != first || value.lastIndexOf(needle) != last) {
            throw new AssertionError("Public search disagrees with scalar fixture");
        }
    }

    private static int scalar(char[] haystack, char[] target, boolean reverse) {
        int limit = haystack.length - target.length;
        for (int i = reverse ? limit : 0; i >= 0 && i <= limit; i += reverse ? -1 : 1) {
            int j = 0;
            while (j < target.length && haystack[i + j] == target[j]) j++;
            if (j == target.length) return i;
        }
        return -1;
    }

    @Benchmark
    public int lastIndexOf() {
        return value.lastIndexOf(needle);
    }
}
