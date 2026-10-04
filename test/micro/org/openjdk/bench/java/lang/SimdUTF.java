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

import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.StandardCharsets;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.Charset;
import java.io.OutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

/** Run the same binary with +/-UseSIMDUTFIntrinsics in -Xint, C1 and C2 forks. */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@State(Scope.Thread)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(3)
public class SimdUTF {
    @Param({"32", "256", "4096", "65536"})
    public int size;
    private String ascii, latin1, bmp, supplementary;
    private byte[] asciiBytes, utf8Bytes, supplementaryBytes, binary, base64, encoded, decoded;
    private char[] chars, targetChars;
    private ByteBuffer charsetBytes, charsetInput;
    private CharBuffer charsetChars, charsetOutput;
    private CharsetEncoder charsetEncoder;
    private CharsetDecoder charsetDecoder;
    private CharsetEncoder unicodeValidator;
    private CharsetEncoder asciiValidator;
    private CharsetEncoder utf16Encoder;
    private CharsetDecoder utf16Decoder;
    private ByteBuffer utf16Bytes, utf16Input;
    private CharBuffer utf16Output;
    private CharsetEncoder utf32Encoder;
    private CharsetDecoder utf32Decoder;
    private ByteBuffer utf32Bytes, utf32Input;
    private CharBuffer utf32Output;
    private OutputStream base64Stream;
    private Base64.Encoder base64Encoder;
    private Base64.Decoder base64Decoder;

    @Setup
    public void setup() {
        ascii = "a".repeat(size);
        latin1 = "é".repeat(size);
        bmp = "漢".repeat(size);
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
        chars = bmp.toCharArray();
        targetChars = new char[utf8Bytes.length];
        charsetBytes = ByteBuffer.allocate(size * 3);
        charsetInput = ByteBuffer.wrap(utf8Bytes);
        charsetChars = CharBuffer.wrap(chars);
        charsetOutput = CharBuffer.wrap(targetChars);
        charsetEncoder = StandardCharsets.UTF_8.newEncoder();
        charsetDecoder = StandardCharsets.UTF_8.newDecoder();
        unicodeValidator = StandardCharsets.UTF_8.newEncoder();
        asciiValidator = StandardCharsets.US_ASCII.newEncoder();
        utf16Encoder = StandardCharsets.UTF_16LE.newEncoder();
        utf16Decoder = StandardCharsets.UTF_16LE.newDecoder();
        utf16Bytes = ByteBuffer.allocate(size * 2);
        utf16Input = ByteBuffer.wrap(bmp.getBytes(StandardCharsets.UTF_16LE));
        utf16Output = CharBuffer.allocate(size);
        Charset utf32 = Charset.forName("UTF-32LE");
        utf32Encoder = utf32.newEncoder();
        utf32Decoder = utf32.newDecoder();
        utf32Bytes = ByteBuffer.allocate(size * 4);
        utf32Input = ByteBuffer.wrap(bmp.getBytes(utf32));
        utf32Output = CharBuffer.allocate(size * 2);
        base64Stream = base64Encoder.wrap(OutputStream.nullOutputStream());
    }

    @Benchmark public String asciiDecode() { return new String(asciiBytes, StandardCharsets.UTF_8); }
    @Benchmark public byte[] asciiEncode() { return ascii.getBytes(StandardCharsets.UTF_8); }
    @Benchmark public String utf8Decode() { return new String(utf8Bytes, StandardCharsets.UTF_8); }
    @Benchmark public byte[] utf16Encode() { return bmp.getBytes(StandardCharsets.UTF_8); }
    @Benchmark public byte[] latin1Encode() { return latin1.getBytes(StandardCharsets.UTF_8); }
    @Benchmark public String supplementaryDecode() { return new String(supplementaryBytes, StandardCharsets.UTF_8); }
    @Benchmark public byte[] supplementaryEncode() { return supplementary.getBytes(StandardCharsets.UTF_8); }
    @Benchmark public int base64Encode() { return base64Encoder.encode(binary, encoded); }
    @Benchmark public int base64Decode() { return base64Decoder.decode(base64, decoded); }
    @Benchmark public void base64StreamEncode() throws IOException { base64Stream.write(binary); }

    @Benchmark public boolean unicodeValidation() { return unicodeValidator.canEncode(bmp); }
    @Benchmark public boolean asciiValidation() { return asciiValidator.canEncode(ascii); }
    @Benchmark public int encodedLength() { return bmp.encodedLength(StandardCharsets.UTF_8); }

    @Benchmark public int utf16CharsetEncode() {
        utf16Encoder.reset(); charsetChars.clear(); utf16Bytes.clear();
        utf16Encoder.encode(charsetChars, utf16Bytes, true);
        return utf16Bytes.position();
    }
    @Benchmark public int utf16CharsetDecode() {
        utf16Decoder.reset(); utf16Input.clear(); utf16Output.clear();
        utf16Decoder.decode(utf16Input, utf16Output, true);
        return utf16Output.position();
    }

    @Benchmark public int utf32CharsetEncode() {
        utf32Encoder.reset(); charsetChars.clear(); utf32Bytes.clear();
        utf32Encoder.encode(charsetChars, utf32Bytes, true);
        return utf32Bytes.position();
    }
    @Benchmark public int utf32CharsetDecode() {
        utf32Decoder.reset(); utf32Input.clear(); utf32Output.clear();
        utf32Decoder.decode(utf32Input, utf32Output, true);
        return utf32Output.position();
    }

    @Benchmark public int charsetEncode() {
        charsetEncoder.reset(); charsetChars.clear(); charsetBytes.clear();
        charsetEncoder.encode(charsetChars, charsetBytes, true);
        return charsetBytes.position();
    }
    @Benchmark public int charsetDecode() {
        charsetDecoder.reset(); charsetInput.clear(); charsetOutput.clear();
        charsetDecoder.decode(charsetInput, charsetOutput, true);
        return charsetOutput.position();
    }
}
