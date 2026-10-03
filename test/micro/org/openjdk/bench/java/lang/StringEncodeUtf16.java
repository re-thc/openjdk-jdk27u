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
import java.util.Arrays;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

/** Public UTF-16-backed String encoding, including fallback and malformed input. */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Fork(3)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 5, time = 1)
@State(Scope.Thread)
public class StringEncodeUtf16 {
    @Param({"8", "15", "16", "17", "64", "1024", "2048", "2049", "8192"})
    public int size;
    @Param({"ascii", "latin1", "bmp2", "bmp3", "supplementary", "first", "last",
            "mixed", "malformedFirst", "malformedMiddle", "malformedLast"})
    public String pattern;
    /** Initialize through larger public work before measuring small conversions. */
    @Param({"false"})
    public boolean initializeLarger;
    private String[] inputs;
    private int sequence;

    @Setup(Level.Trial)
    public void setup() {
        inputs = new String[16];
        for (int slot = 0; slot < inputs.length; slot++) {
            char[] chars = new char[size];
            Arrays.fill(chars, switch (pattern) {
                case "ascii", "first", "last" -> (char) ('a' + slot);
                case "latin1" -> '\u00e9';
                case "bmp2" -> '\u0100';
                default -> '\u20ac';
            });
            if (pattern.equals("supplementary")) {
                for (int i = 0; i + 1 < size; i += 2) {
                    chars[i] = '\ud83d'; chars[i + 1] = '\ude00';
                }
            } else if (pattern.equals("mixed")) {
                for (int i = 0; i < size; i += 8) chars[i] = (char) ('a' + slot);
            } else if (pattern.equals("first")) chars[0] = '\u0100';
            else if (pattern.equals("last")) chars[size - 1] = '\u0100';
            else if (pattern.equals("malformedFirst")) chars[0] = '\ud800';
            else if (pattern.equals("malformedMiddle")) chars[size / 2] = '\ud800';
            else if (pattern.equals("malformedLast")) chars[size - 1] = '\udc00';
            inputs[slot] = new String(chars);
        }
        if (initializeLarger) {
            char[] larger = new char[512];
            Arrays.fill(larger, '\u4e2d');
            if (new String(larger).getBytes(StandardCharsets.UTF_8).length != 1536) {
                throw new AssertionError("UTF-8 initialization conversion");
            }
        }
    }

    @Benchmark
    public byte[] encode() {
        return inputs[sequence++ & 15].getBytes(StandardCharsets.UTF_8);
    }
}
