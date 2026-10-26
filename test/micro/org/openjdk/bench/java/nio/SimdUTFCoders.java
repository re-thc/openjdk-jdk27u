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
package org.openjdk.bench.java.nio;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

/**
 * UTF-8 and UTF-32LE Charset coders over array-backed and direct buffers, and the stream
 * classes built on them. The coder loops convert ranges of 64 elements or more in bulk.
 */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@State(Scope.Thread)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(3)
public class SimdUTFCoders {
    @Param({"32", "64", "256", "8192", "65536"})
    public int size;

    @Param({"ascii", "latin1", "bmp", "mixed"})
    public String content;

    private static final Charset UTF_32LE = Charset.forName("UTF-32LE");

    private byte[] utf8Bytes, utf32Bytes;
    private char[] chars;
    private ByteBuffer utf8Heap, utf8Direct, utf32Heap, utf32Direct;
    private ByteBuffer bytesHeap, bytesDirect;
    private CharBuffer charsHeap, charsDirect, textHeap, textDirect;
    private CharsetDecoder utf8Decoder, utf32Decoder;
    private CharsetEncoder utf8Encoder, utf32Encoder;
    private char[] readBuffer;

    @Setup
    public void setup() {
        StringBuilder text = new StringBuilder();
        for (int i = 0; text.length() < size; i++) {
            switch (content) {
                case "ascii" -> text.append((char) ('a' + i % 26));
                case "latin1" -> text.append(i % 8 == 0 ? (char) ('à' + i % 32) : (char) ('a' + i % 26));
                case "bmp" -> text.append((char) ('一' + i % 2000));
                default -> {
                    if (i % 16 == 0 && text.length() + 1 < size) {
                        text.appendCodePoint(0x1f600 + i % 64);
                    } else {
                        text.append(i % 4 == 0 ? (char) ('à' + i % 32) : (char) ('a' + i % 26));
                    }
                }
            }
        }
        text.setLength(size);
        if (Character.isHighSurrogate(text.charAt(size - 1))) {
            text.setCharAt(size - 1, 'z');
        }
        String s = text.toString();
        chars = s.toCharArray();
        utf8Bytes = s.getBytes(StandardCharsets.UTF_8);
        utf32Bytes = s.getBytes(UTF_32LE);
        utf8Heap = ByteBuffer.wrap(utf8Bytes);
        utf8Direct = ByteBuffer.allocateDirect(utf8Bytes.length).put(utf8Bytes).flip();
        utf32Heap = ByteBuffer.wrap(utf32Bytes);
        utf32Direct = ByteBuffer.allocateDirect(utf32Bytes.length).put(utf32Bytes).flip();
        bytesHeap = ByteBuffer.allocate(4 * size + 16);
        bytesDirect = ByteBuffer.allocateDirect(4 * size + 16);
        charsHeap = CharBuffer.allocate(size + 16);
        charsDirect = ByteBuffer.allocateDirect(2 * size + 32).order(ByteOrder.nativeOrder()).asCharBuffer();
        textHeap = CharBuffer.wrap(chars);
        textDirect = ByteBuffer.allocateDirect(2 * size).order(ByteOrder.nativeOrder()).asCharBuffer();
        textDirect.put(chars).flip();
        utf8Decoder = StandardCharsets.UTF_8.newDecoder();
        utf8Encoder = StandardCharsets.UTF_8.newEncoder();
        utf32Decoder = UTF_32LE.newDecoder();
        utf32Encoder = UTF_32LE.newEncoder();
        readBuffer = new char[size + 16];
    }

    private static int decode(CharsetDecoder decoder, ByteBuffer in, CharBuffer out) {
        in.rewind();
        out.clear();
        decoder.reset();
        decoder.decode(in, out, true);
        return out.position();
    }

    private static int encode(CharsetEncoder encoder, CharBuffer in, ByteBuffer out) {
        in.rewind();
        out.clear();
        encoder.reset();
        encoder.encode(in, out, true);
        return out.position();
    }

    @Benchmark public int utf8DecodeHeap() { return decode(utf8Decoder, utf8Heap, charsHeap); }
    @Benchmark public int utf8DecodeDirect() { return decode(utf8Decoder, utf8Direct, charsHeap); }
    @Benchmark public int utf8DecodeDirectToDirect() { return decode(utf8Decoder, utf8Direct, charsDirect); }
    @Benchmark public int utf8EncodeHeap() { return encode(utf8Encoder, textHeap, bytesHeap); }
    @Benchmark public int utf8EncodeDirect() { return encode(utf8Encoder, textHeap, bytesDirect); }
    @Benchmark public int utf8EncodeDirectToDirect() { return encode(utf8Encoder, textDirect, bytesDirect); }
    @Benchmark public int utf32DecodeHeap() { return decode(utf32Decoder, utf32Heap, charsHeap); }
    @Benchmark public int utf32DecodeDirect() { return decode(utf32Decoder, utf32Direct, charsHeap); }
    @Benchmark public int utf32EncodeHeap() { return encode(utf32Encoder, textHeap, bytesHeap); }
    @Benchmark public int utf32EncodeDirect() { return encode(utf32Encoder, textHeap, bytesDirect); }

    // Convenience and stream callers, which allocate their buffers as they would in an application.
    @Benchmark public CharBuffer charsetDecode() { return StandardCharsets.UTF_8.decode(utf8Heap.rewind()); }
    @Benchmark public ByteBuffer charsetEncode() { return StandardCharsets.UTF_8.encode(textHeap.rewind()); }

    @Benchmark
    public int readerRead() throws IOException {
        try (Reader reader = new InputStreamReader(new ByteArrayInputStream(utf8Bytes), StandardCharsets.UTF_8)) {
            int total = 0;
            for (int n; (n = reader.read(readBuffer)) > 0; ) total += n;
            return total;
        }
    }

    @Benchmark
    public int writerWrite() throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream(utf8Bytes.length + 16);
        try (OutputStreamWriter writer = new OutputStreamWriter(out, StandardCharsets.UTF_8)) {
            writer.write(chars, 0, chars.length);
        }
        return out.size();
    }
}
