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
package org.openjdk.bench.java.lang;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Base64;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

/**
 * String UTF-8 conversion and Base64 of ranges longer than the intrinsics take at once,
 * and of text with one malformed element. The bulk conversions cover the valid prefix of
 * such text and the loops handle the rest.
 */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.MICROSECONDS)
@State(Scope.Thread)
@Warmup(iterations = 3, time = 2)
@Measurement(iterations = 5, time = 2)
@Fork(2)
public class SimdUTFLarge {
    // 100000 chars fit one call of the intrinsics; 3000000 need several
    @Param({"100000", "3000000"})
    public int chars;

    private String text, textLoneEnd, textLoneMiddle;
    private byte[] utf8, utf8BadEnd, utf8BadMiddle, binary, base64;

    @Setup
    public void setup() {
        Random random = new Random(42);
        StringBuilder sb = new StringBuilder(chars);
        for (int i = 0; i < chars; i++) sb.append((char) ('一' + random.nextInt(2000)));
        text = sb.toString();
        utf8 = text.getBytes(StandardCharsets.UTF_8);
        utf8BadEnd = Arrays.copyOf(utf8, utf8.length + 1);
        utf8BadEnd[utf8.length] = (byte) 0xff;
        utf8BadMiddle = Arrays.copyOf(utf8, utf8.length + 1);
        // A malformed byte between two characters in the middle
        int middle = chars / 2 * 3;
        System.arraycopy(utf8, middle, utf8BadMiddle, middle + 1, utf8.length - middle);
        utf8BadMiddle[middle] = (byte) 0xff;
        textLoneEnd = text + '\ud800';
        textLoneMiddle = text.substring(0, chars / 2) + '\ud800' + text.substring(chars / 2);
        binary = new byte[chars * 3 / 2];
        random.nextBytes(binary);
        base64 = Base64.getEncoder().encode(binary);
    }

    @Benchmark public String decode() { return new String(utf8, StandardCharsets.UTF_8); }
    @Benchmark public String decodeBadAtEnd() { return new String(utf8BadEnd, StandardCharsets.UTF_8); }
    @Benchmark public String decodeBadInMiddle() { return new String(utf8BadMiddle, StandardCharsets.UTF_8); }
    @Benchmark public byte[] encode() { return text.getBytes(StandardCharsets.UTF_8); }
    @Benchmark public byte[] encodeLoneAtEnd() { return textLoneEnd.getBytes(StandardCharsets.UTF_8); }
    @Benchmark public byte[] encodeLoneInMiddle() { return textLoneMiddle.getBytes(StandardCharsets.UTF_8); }
    @Benchmark public byte[] base64Encode() { return Base64.getEncoder().encode(binary); }
    @Benchmark public byte[] base64Decode() { return Base64.getDecoder().decode(base64); }
}
