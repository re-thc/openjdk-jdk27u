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
import java.util.Base64;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

/** String UTF8 conversion, character search and Base64 block benchmarks. */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@State(Scope.Thread)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(3)
public class SimdUTF {
    @Param({"32", "64", "128", "256", "4096", "65536"})
    public int size;
    private String ascii, latin1, bmp, supplementary, latin1Near, utf16Near;
    private byte[] asciiBytes, utf8Bytes, supplementaryBytes, binary, base64, encoded, decoded;
    private Base64.Encoder base64Encoder;
    private Base64.Decoder base64Decoder;

    @Setup
    public void setup() {
        ascii = "a".repeat(size);
        latin1 = "é".repeat(size);
        bmp = "漢".repeat(size);
        int near = Math.min(15, size - 1);
        latin1Near = "é".repeat(near) + "z" + "é".repeat(size - near - 1);
        utf16Near = "漢".repeat(near) + "z" + "漢".repeat(size - near - 1);
        supplementary = "😃".repeat(size / 2);
        asciiBytes = ascii.getBytes(StandardCharsets.UTF_8);
        utf8Bytes = bmp.getBytes(StandardCharsets.UTF_8);
        supplementaryBytes = supplementary.getBytes(StandardCharsets.UTF_8);
        binary = new byte[size];
        new Random(9271).nextBytes(binary);
        base64Encoder = Base64.getEncoder();
        base64Decoder = Base64.getDecoder();
        base64 = base64Encoder.encode(binary);
        encoded = new byte[base64.length];
        decoded = new byte[binary.length];
    }

    // ASCII-only conversion is a stock-path control for the UTF8 operations.
    @Benchmark public String asciiDecode() { return new String(asciiBytes, StandardCharsets.UTF_8); }
    @Benchmark public byte[] asciiEncode() { return ascii.getBytes(StandardCharsets.UTF_8); }
    @Benchmark public String utf8Decode() { return new String(utf8Bytes, StandardCharsets.UTF_8); }
    @Benchmark public byte[] utf16Encode() { return bmp.getBytes(StandardCharsets.UTF_8); }
    @Benchmark public byte[] latin1Encode() { return latin1.getBytes(StandardCharsets.UTF_8); }
    @Benchmark public String supplementaryDecode() { return new String(supplementaryBytes, StandardCharsets.UTF_8); }
    @Benchmark public byte[] supplementaryEncode() { return supplementary.getBytes(StandardCharsets.UTF_8); }
    @Benchmark public int latin1IndexOf() { return latin1.indexOf('z'); }
    @Benchmark public int latin1IndexOfFirst() { return latin1.indexOf('é'); }
    @Benchmark public int latin1IndexOfNear() { return latin1Near.indexOf('z'); }
    @Benchmark public int utf16IndexOf() { return bmp.indexOf('z'); }
    @Benchmark public int utf16IndexOfFirst() { return bmp.indexOf('漢'); }
    @Benchmark public int utf16IndexOfNear() { return utf16Near.indexOf('z'); }
    @Benchmark public int base64Encode() { return base64Encoder.encode(binary, encoded); }
    @Benchmark public int base64Decode() { return base64Decoder.decode(base64, decoded); }
}
