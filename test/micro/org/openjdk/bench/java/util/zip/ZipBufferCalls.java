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

package org.openjdk.bench.java.util.zip;

import java.nio.ByteBuffer;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import java.util.zip.DataFormatException;
import java.util.zip.Deflater;
import java.util.zip.Inflater;

import org.openjdk.jmh.annotations.*;

@State(Scope.Thread)
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
public class ZipBufferCalls {
    @Param({"64", "1024", "4096", "16384", "65536"})
    public int size;
    @Param({"heap", "direct"})
    public String input;
    @Param({"heap", "direct"})
    public String output;
    private byte[] compressed;
    private byte[] restored;
    private int compressedLength;
    private ByteBuffer inBuffer;
    private ByteBuffer outBuffer;
    private Inflater inflater;
    private boolean directInput;
    private boolean directOutput;
    @Setup
    public void setup() {
        byte[] original = new byte[size];
        new Random(12345).nextBytes(original);
        compressed = new byte[size + 1024];
        restored = new byte[size + 1024];
        try (Deflater d = new Deflater(6)) {
            d.setInput(original);
            d.finish();
            compressedLength = d.deflate(compressed);
            if (!d.finished()) {
                throw new AssertionError("setup compression");
            }
        }
        inBuffer = ByteBuffer.allocateDirect(compressedLength);
        inBuffer.put(compressed, 0, compressedLength).flip();
        outBuffer = ByteBuffer.allocateDirect(size + 1024);
        inflater = new Inflater();
        directInput = input.equals("direct");
        directOutput = output.equals("direct");
        if (inflate() != size) {
            throw new AssertionError("setup decompression");
        }
        byte[] checked = new byte[size];
        if (directOutput) {
            outBuffer.flip().get(checked);
        } else {
            System.arraycopy(restored, 0, checked, 0, size);
        }
        if (!java.util.Arrays.equals(original, checked)) {
            throw new AssertionError("data mismatch");
        }
    }
    @TearDown
    public void tearDown() {
        inflater.end();
    }
    @Benchmark
    public int inflate() {
        inflater.reset();
        if (directInput) {
            inBuffer.position(0);
            inflater.setInput(inBuffer);
        } else {
            inflater.setInput(compressed, 0, compressedLength);
        }
        try {
            int written;
            if (directOutput) {
                outBuffer.clear();
                written = inflater.inflate(outBuffer);
            } else {
                written = inflater.inflate(restored);
            }
            if (written != size || !inflater.finished()) {
                throw new AssertionError("incomplete");
            }
            return written;
        } catch (DataFormatException e) {
            throw new AssertionError(e);
        }
    }
}
