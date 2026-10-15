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
import java.nio.charset.CodingErrorAction;
import java.nio.charset.CoderResult;
import java.io.OutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.Arrays;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

/** Bulk Unicode, String search and Base64 benchmarks for interpreter, C1 and C2 execution. */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@State(Scope.Thread)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(3)
public class SimdUTF {
    @Param({"32", "64", "128", "256", "4096", "65536"})
    public int size;
    private String ascii, latin1, bmp, supplementary;
    private String latin1Near, utf16Near;
    private byte[] asciiBytes, latin1Bytes, utf8Bytes, supplementaryBytes, binary, base64, encoded, decoded;
    private char[] chars, targetChars;
    private char[] supplementaryChars;
    private StringBuilder supplementaryBuilder;
    private StringBuffer supplementaryBuffer;
    private ByteBuffer charsetBytes, charsetInput, charsetTightInput;
    private CharBuffer charsetChars, charsetOutput;
    private CharBuffer charsetTightOutput, supplementaryInput;
    private CharBuffer charsetSmallOutput, charsetEmptyOutput;
    private ByteBuffer utf32SupplementaryBytes;
    private ByteBuffer asciiCharsetInput;
    private CharBuffer asciiCharsetOutput;
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
    private CharBuffer asciiInput, latin1Input, utf32TightOutput;
    private ByteBuffer singleByteOutput;
    private CharsetEncoder asciiEncoder, latin1Encoder, latin1Validator;
    private CharsetDecoder malformedDecoder;
    private CharsetEncoder malformedEncoder;
    private ByteBuffer malformedInput, malformedBytes;
    private CharBuffer malformedChars, malformedOutput;

    @Setup
    public void setup() {
        ascii = "a".repeat(size);
        latin1 = "é".repeat(size);
        bmp = "漢".repeat(size);
        int near = Math.min(15, size - 1);
        latin1Near = "é".repeat(near) + "z" + "é".repeat(size - near - 1);
        utf16Near = "漢".repeat(near) + "z" + "漢".repeat(size - near - 1);
        supplementary = "😃".repeat(size / 2);
        supplementaryChars = supplementary.toCharArray();
        supplementaryBuilder = new StringBuilder(supplementary);
        supplementaryBuffer = new StringBuffer(supplementary);
        asciiBytes = ascii.getBytes(StandardCharsets.UTF_8);
        latin1Bytes = latin1.getBytes(StandardCharsets.UTF_8);
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
        String tightText = "漢".repeat(size / 3) + "a".repeat(size % 3);
        charsetTightInput = ByteBuffer.wrap(tightText.getBytes(StandardCharsets.UTF_8));
        charsetTightOutput = CharBuffer.allocate(tightText.length());
        charsetSmallOutput = CharBuffer.allocate(1);
        charsetEmptyOutput = CharBuffer.allocate(0);
        supplementaryInput = CharBuffer.wrap(supplementaryChars);
        utf32SupplementaryBytes = ByteBuffer.allocate(supplementaryChars.length * 2);
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
        asciiInput = CharBuffer.wrap(ascii.toCharArray());
        asciiCharsetInput = ByteBuffer.wrap(asciiBytes);
        asciiCharsetOutput = CharBuffer.allocate(size);
        latin1Input = CharBuffer.wrap(latin1.toCharArray());
        singleByteOutput = ByteBuffer.allocate(size);
        asciiEncoder = StandardCharsets.US_ASCII.newEncoder();
        latin1Encoder = StandardCharsets.ISO_8859_1.newEncoder();
        latin1Validator = StandardCharsets.ISO_8859_1.newEncoder();
        utf32TightOutput = CharBuffer.allocate(size);
        byte[] invalidBytes = new byte[size];
        Arrays.fill(invalidBytes, (byte)0x80);
        char[] invalidChars = new char[size];
        Arrays.fill(invalidChars, '\udc00');
        malformedInput = ByteBuffer.wrap(invalidBytes);
        malformedChars = CharBuffer.wrap(invalidChars);
        malformedOutput = CharBuffer.allocate(size);
        malformedBytes = ByteBuffer.allocate(size);
        malformedDecoder = StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPLACE);
        malformedEncoder = StandardCharsets.UTF_8.newEncoder().onMalformedInput(CodingErrorAction.REPLACE);
    }

    @Benchmark public String asciiDecode() { return new String(asciiBytes, StandardCharsets.UTF_8); }
    @Benchmark public byte[] asciiEncode() { return ascii.getBytes(StandardCharsets.UTF_8); }
    @Benchmark public String utf8Decode() { return new String(utf8Bytes, StandardCharsets.UTF_8); }
    @Benchmark public byte[] utf16Encode() { return bmp.getBytes(StandardCharsets.UTF_8); }
    @Benchmark public byte[] latin1Encode() { return latin1.getBytes(StandardCharsets.UTF_8); }
    @Benchmark public String latin1Decode() { return new String(latin1Bytes, StandardCharsets.UTF_8); }
    @Benchmark public int latin1EncodedLength() { return latin1.encodedLength(StandardCharsets.UTF_8); }
    @Benchmark public char[] utf16ToChars() { return bmp.toCharArray(); }
    @Benchmark public char[] latin1ToChars() { return latin1.toCharArray(); }
    @Benchmark public String charArrayString() { return new String(chars); }
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
    @Benchmark public void base64StreamEncode() throws IOException { base64Stream.write(binary); }

    @Benchmark public boolean unicodeValidation() { return unicodeValidator.canEncode(bmp); }
    @Benchmark public boolean asciiValidation() { return asciiValidator.canEncode(ascii); }
    @Benchmark public boolean asciiCharValidation() { return asciiValidator.canEncode(asciiInput); }
    @Benchmark public boolean latin1Validation() { return latin1Validator.canEncode(latin1Input); }
    @Benchmark public int encodedLength() { return bmp.encodedLength(StandardCharsets.UTF_8); }
    @Benchmark public int codePointCount() {
        return supplementary.codePointCount(0, supplementary.length());
    }
    @Benchmark public int charArrayCodePointCount() {
        return Character.codePointCount(supplementaryChars, 0, supplementaryChars.length);
    }
    @Benchmark public int builderCodePointCount() {
        return Character.codePointCount(supplementaryBuilder, 0, supplementaryBuilder.length());
    }
    @Benchmark public int bufferCodePointCount() {
        return Character.codePointCount(supplementaryBuffer, 0, supplementaryBuffer.length());
    }

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

    @Benchmark public int utf32TightCharsetDecode() {
        utf32Decoder.reset(); utf32Input.clear(); utf32TightOutput.clear();
        utf32Decoder.decode(utf32Input, utf32TightOutput, true);
        return utf32TightOutput.position();
    }

    @Benchmark public int charsetAsciiEncode() {
        asciiEncoder.reset(); asciiInput.clear(); singleByteOutput.clear();
        asciiEncoder.encode(asciiInput, singleByteOutput, true);
        return singleByteOutput.position();
    }

    @Benchmark public int asciiCharsetEncode() {
        charsetEncoder.reset(); asciiInput.clear(); singleByteOutput.clear();
        charsetEncoder.encode(asciiInput, singleByteOutput, true);
        return singleByteOutput.position();
    }

    @Benchmark public int asciiCharsetDecode() {
        charsetDecoder.reset(); asciiCharsetInput.clear(); asciiCharsetOutput.clear();
        charsetDecoder.decode(asciiCharsetInput, asciiCharsetOutput, true);
        return asciiCharsetOutput.position();
    }

    @Benchmark public int latin1CharsetEncode() {
        latin1Encoder.reset(); latin1Input.clear(); singleByteOutput.clear();
        latin1Encoder.encode(latin1Input, singleByteOutput, true);
        return singleByteOutput.position();
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

    @Benchmark public int charsetDecodeTight() {
        // This workload's size is the input byte count, including boundary cases.
        charsetDecoder.reset(); charsetTightInput.clear(); charsetTightOutput.clear();
        charsetDecoder.decode(charsetTightInput, charsetTightOutput, true);
        return charsetTightOutput.position();
    }

    @Benchmark public CoderResult charsetDecodeSmallBuffer() {
        charsetDecoder.reset(); charsetTightInput.clear(); charsetSmallOutput.clear();
        return charsetDecoder.decode(charsetTightInput, charsetSmallOutput, true);
    }

    @Benchmark public CoderResult charsetDecodeEmptyBuffer() {
        charsetDecoder.reset(); charsetTightInput.clear(); charsetEmptyOutput.clear();
        return charsetDecoder.decode(charsetTightInput, charsetEmptyOutput, true);
    }

    @Benchmark public int utf32SupplementaryCharsetEncode() {
        utf32Encoder.reset(); supplementaryInput.clear(); utf32SupplementaryBytes.clear();
        utf32Encoder.encode(supplementaryInput, utf32SupplementaryBytes, true);
        return utf32SupplementaryBytes.position();
    }

    @Benchmark public int malformedCharsetDecode() {
        malformedDecoder.reset(); malformedInput.clear(); malformedOutput.clear();
        malformedDecoder.decode(malformedInput, malformedOutput, true);
        return malformedOutput.position();
    }

    @Benchmark public int malformedCharsetEncode() {
        malformedEncoder.reset(); malformedChars.clear(); malformedBytes.clear();
        malformedEncoder.encode(malformedChars, malformedBytes, true);
        return malformedBytes.position();
    }

    @Benchmark public CoderResult malformedSequenceDecode(MalformedSequence state) {
        state.decoder.reset();
        state.input.clear();
        state.output.clear();
        return state.decoder.decode(state.input, state.output, true);
    }

    @State(Scope.Thread)
    public static class MalformedSequence {
        @Param({"overlong", "surrogate", "range", "continuation", "tail"})
        public String kind;

        @Param({"REPORT", "REPLACE"})
        public String action;

        private CharsetDecoder decoder;
        private ByteBuffer input;
        private CharBuffer output;

        @Setup
        public void setup(SimdUTF benchmark) {
            byte[] pattern = switch (kind) {
                case "overlong" -> new byte[]{(byte)0xe0, (byte)0x80, (byte)0x80};
                case "surrogate" -> new byte[]{(byte)0xed, (byte)0xa0, (byte)0x80};
                case "range" -> new byte[]{(byte)0xf4, (byte)0x90, (byte)0x80, (byte)0x80};
                case "continuation" -> new byte[]{(byte)0xe6, 0x20, (byte)0x80};
                case "tail" -> new byte[]{(byte)0xe6, (byte)0xbc, (byte)0xa2};
                default -> throw new IllegalArgumentException(kind);
            };
            byte[] bytes = new byte[benchmark.size];
            for (int i = 0; i < bytes.length; i++) {
                bytes[i] = pattern[i % pattern.length];
            }
            if (kind.equals("tail")) {
                int end = (bytes.length - 1) / 3 * 3;
                Arrays.fill(bytes, end, bytes.length, (byte)'a');
                bytes[bytes.length - 1] = (byte)0x80;
            }
            CodingErrorAction errorAction = switch (action) {
                case "REPORT" -> CodingErrorAction.REPORT;
                case "REPLACE" -> CodingErrorAction.REPLACE;
                default -> throw new IllegalArgumentException(action);
            };
            decoder = StandardCharsets.UTF_8.newDecoder().onMalformedInput(errorAction);
            input = ByteBuffer.wrap(bytes);
            output = CharBuffer.allocate(bytes.length);
        }
    }
}
