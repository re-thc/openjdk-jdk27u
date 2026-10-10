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

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

/** Long needles and an actual odd-byte occurrence forcing UTF-16 alignment. */
@State(Scope.Thread)
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 3, time = 500, timeUnit = TimeUnit.MILLISECONDS)
@Measurement(iterations = 5, time = 500, timeUnit = TimeUnit.MILLISECONDS)
@Fork(2)
public class StringZillaLongNeedle {
    @Param({"512", "4096"})
    public int length;
    @Param({"64", "256"})
    public int needleLength;
    @Param({"NEAR_END", "NEAR_START", "CROSSED", "MISS", "END"})
    public String shape;

    private String value;
    private String needle;

    @Setup
    public void setup() {
        char[] target = new char[needleLength];
        Arrays.fill(target, (char)0x0401);
        if (shape.equals("CROSSED")) Arrays.fill(target, (char)0x0104);
        else target[shape.equals("NEAR_START") ? 1 : needleLength - 2] = 0x0402;
        needle = new String(target);
        char[] chars = new char[length + needleLength + 1];
        Arrays.fill(chars, 0, length, (char)0x0401);
        // Put a byte-perfect occurrence at an ODD byte address. The surrounding
        // zero bytes prevent this suffix from being a code-unit match.
        ByteBuffer shifted = ByteBuffer.allocate((needleLength + 1) * 2).order(ByteOrder.nativeOrder());
        for (int i = 0; i < target.length; i++) shifted.putChar(1 + i * 2, target[i]);
        for (int i = 0; i <= target.length; i++) chars[length + i] = shifted.getChar(i * 2);
        if (shape.equals("MISS")) Arrays.fill(chars, (char)0x0403);
        if (shape.equals("END")) System.arraycopy(target, 0, chars, length, target.length);
        value = new String(chars);
        int expected = shape.equals("END") ? length : -1;
        if (scalar(value, needle, false) != expected || scalar(value, needle, true) != expected)
            throw new AssertionError("Invalid long-needle fixture");
        if (value.indexOf(needle) != expected || value.lastIndexOf(needle) != expected)
            throw new AssertionError("Long-needle search result");
    }

    private static int scalar(String s, String t, boolean reverse) {
        int limit = s.length() - t.length();
        for (int i = reverse ? limit : 0; i >= 0 && i <= limit; i += reverse ? -1 : 1) {
            int j = 0;
            while (j < t.length() && s.charAt(i + j) == t.charAt(j)) j++;
            if (j == t.length()) return i;
        }
        return -1;
    }

    @Benchmark public int indexOf() { return value.indexOf(needle); }
    @Benchmark public int lastIndexOf() { return value.lastIndexOf(needle); }
}
