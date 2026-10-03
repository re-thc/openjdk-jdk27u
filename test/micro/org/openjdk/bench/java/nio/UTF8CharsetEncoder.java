/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
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
package org.openjdk.bench.java.nio;

import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.TimeUnit;

import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.BenchmarkMode;
import org.openjdk.jmh.annotations.Fork;
import org.openjdk.jmh.annotations.Measurement;
import org.openjdk.jmh.annotations.Mode;
import org.openjdk.jmh.annotations.OutputTimeUnit;
import org.openjdk.jmh.annotations.Param;
import org.openjdk.jmh.annotations.Scope;
import org.openjdk.jmh.annotations.Setup;
import org.openjdk.jmh.annotations.State;
import org.openjdk.jmh.annotations.Warmup;
import org.openjdk.jmh.infra.Blackhole;

/**
 * Public UTF-8 CharsetEncoder APIs with reusable, mutable array-backed input.
 * Sizes count UTF-16 code units, not code points or output bytes. Each operation
 * encodes one complete input; allocation/growth belongs to allocating(), while
 * preallocated() includes reset, encode and flush but reuses both buffers.
 */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(3)
@State(Scope.Thread)
public class UTF8CharsetEncoder {
    @Param({"ASCII", "MIXED_LATIN", "CJK", "SUPPLEMENTARY"})
    public String content;

    @Param({"32", "2048", "16384"})
    public int size;

    private CharsetEncoder encoder;
    private CharBuffer input;
    private ByteBuffer output;

    @Setup
    public void setup() throws CharacterCodingException {
        if (size < 2 || (content.equals("SUPPLEMENTARY") && (size & 1) != 0)) {
            throw new IllegalArgumentException("Use size >= 2, even for supplementary input");
        }
        char[] chars = new char[size];
        // A short ASCII prefix exercises the existing prefix loop before the
        // non-ASCII body. Small inputs still contain non-ASCII characters.
        int prefix = Math.min(16, size / 2) & ~1;
        for (int i = 0; i < size; i++) {
            if (content.equals("ASCII") || i < prefix) {
                chars[i] = (char) ('a' + i % 26);
            } else {
                switch (content) {
                    case "MIXED_LATIN" -> chars[i] = (i & 1) == 0
                            ? (char) (0x00c0 + i % 64) : (char) ('a' + i % 26);
                    case "CJK" -> chars[i] = (char) (0x4e00 + i % 128);
                    case "SUPPLEMENTARY" -> {
                        chars[i] = '\ud83d';
                        chars[++i] = (char) (0xde00 + (i / 2) % 64);
                    }
                    default -> throw new IllegalArgumentException(content);
                }
            }
        }
        input = CharBuffer.wrap(chars);
        output = ByteBuffer.allocate(Math.multiplyExact(size, 3));
        encoder = StandardCharsets.UTF_8.newEncoder();

        // String.getBytes uses a separate API; never call it in the timed path.
        byte[] expected = new String(chars).getBytes(StandardCharsets.UTF_8);
        ByteBuffer allocated = encoder.encode(input);
        if (input.position() != size || allocated.position() != 0
                || !allocated.equals(ByteBuffer.wrap(expected))) {
            throw new IllegalStateException("Allocating encode mismatch");
        }
        encoder.reset();
        input.position(0);
        CoderResult result = encoder.encode(input, output, true);
        CoderResult flushed = encoder.flush(output);
        if (result != CoderResult.UNDERFLOW || flushed != CoderResult.UNDERFLOW
                || input.position() != size || output.position() != expected.length
                || !output.flip().equals(ByteBuffer.wrap(expected))) {
            throw new IllegalStateException("Preallocated encode mismatch");
        }
    }

    @Benchmark
    public ByteBuffer allocating() throws CharacterCodingException {
        input.position(0);
        // This public convenience API resets the encoder and grows its output.
        return encoder.encode(input);
    }

    @Benchmark
    public ByteBuffer preallocated(Blackhole bh) {
        encoder.reset();
        input.position(0);
        output.clear();
        bh.consume(encoder.encode(input, output, true));
        bh.consume(encoder.flush(output));
        bh.consume(input.position());
        bh.consume(output.position());
        return output;
    }
}
