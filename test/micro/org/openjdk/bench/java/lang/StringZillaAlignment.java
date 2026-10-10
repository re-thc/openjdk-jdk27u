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

import java.util.Random;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

/** Character-search control that averages over separately allocated haystacks. */
@State(Scope.Thread)
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 3, time = 500, timeUnit = TimeUnit.MILLISECONDS)
@Measurement(iterations = 5, time = 1)
@Fork(3)
public class StringZillaAlignment {
    @Param({"256"})
    public int length;

    private String[] values;
    private int cursor;
    private int ch;

    @Setup
    public void setup() {
        Random random = new Random(12345);
        values = new String[32];
        ch = 0x41f;
        for (int n = 0; n < values.length; n++) {
            char[] chars = new char[length];
            for (int i = 0; i < length; i++) {
                chars[i] = (char)(0x400 + random.nextInt(16));
            }
            values[n] = new String(chars);
            if (values[n].indexOf(ch) != -1) {
                throw new AssertionError("Expected an absent BMP character");
            }
        }
    }

    @Benchmark
    public int indexOfChar() {
        String value = values[cursor];
        cursor = (cursor + 1) & (values.length - 1);
        return value.indexOf(ch);
    }
}
