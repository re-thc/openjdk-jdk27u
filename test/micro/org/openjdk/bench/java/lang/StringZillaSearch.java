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

@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@State(Scope.Thread)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(3)
public class StringZillaSearch {
    @Param({"32", "256", "4096"})
    public int length;
    @Param({"LATIN1", "UTF16", "MIXED"})
    public String coder;
    @Param({"MISS", "START", "END", "REPEATED"})
    public String position;

    @Param({"4"})
    public int needleLength;

    private String value;
    private String needle;
    private String equalityValue;
    private StringBuilder builder;
    private StringBuffer buffer;
    private int ch;

    @Setup
    public void setup() {
        Random random = new Random(12345);
        char[] chars = new char[length];
        int base = coder.equals("LATIN1") ? 'a' : 0x400;
        for (int i = 0; i < length; i++) chars[i] = (char)(base + random.nextInt(16));
        boolean mixed = coder.equals("MIXED");
        ch = mixed ? 'Z' : base + 31;
        char[] target = new char[needleLength];
        for (int i = 0; i < target.length; i++) target[i] = (char)(ch - i % 4);
        needle = new String(target);
        if (position.equals("CROSSED") && coder.equals("UTF16")) {
            // Every byte match is odd-aligned; no Java code-unit match exists.
            java.util.Arrays.fill(chars, (char)0x0401);
            ch = 0x0104;
            java.util.Arrays.fill(target, (char)ch);
            needle = new String(target);
        } else if (position.equals("REPEATED")) {
            java.util.Arrays.fill(chars, (char)base);
            java.util.Arrays.fill(target, (char)base);
            target[target.length - 1] = (char)ch;
            needle = new String(target);
        } else if (!position.equals("MISS") && needle.length() <= length) {
            int offset = position.equals("START") ? 0 : length - needle.length();
            needle.getChars(0, needle.length(), chars, offset);
        }
        value = new String(chars);
        char[] equalityChars = chars.clone();
        if (!position.equals("EQUAL")) {
            equalityChars[position.equals("START") ? 0 : length - 1]++;
        }
        equalityValue = new String(equalityChars);
        builder = new StringBuilder(value);
        buffer = new StringBuffer(value);
    }

    @Benchmark public boolean equals() { return value.equals(equalityValue); }
    @Benchmark public int indexOf() { return value.indexOf(needle); }
    @Benchmark public int lastIndexOf() { return value.lastIndexOf(needle); }
    @Benchmark public int indexOfChar() { return value.indexOf(ch); }
    @Benchmark public int lastIndexOfChar() { return value.lastIndexOf(ch); }
    @Benchmark public int builderIndexOf() { return builder.indexOf(needle); }
    @Benchmark public int bufferIndexOf() { return buffer.indexOf(needle); }
    @Benchmark public boolean contains() { return value.contains(needle); }
    @Benchmark public String replace() { return value.replace(needle, "replacement"); }
}
