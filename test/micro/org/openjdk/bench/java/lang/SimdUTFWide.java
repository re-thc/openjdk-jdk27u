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

import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.HashSet;
import java.util.HexFormat;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

/** UTF-16/32 allocation and buffer-access workloads. Sizes count UTF-16 units. */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(3)
public class SimdUTFWide {
    @State(Scope.Thread)
    public static class Strings {
        @Param({"UTF-16BE", "UTF-16LE", "UTF-16", "UTF-32BE", "UTF-32LE", "UTF-32"})
        public String charsetName;

        @Param({"LATIN1", "BMP", "SUPPLEMENTARY"})
        public String content;

        @Param({"1", "2", "15", "16", "31", "32", "63", "64", "127", "128",
                "255", "256", "511", "512", "1023", "1024", "4096", "65536", "1048576"})
        public int size;

        Charset charset;
        String text;
        byte[] bytes;

        @Setup(Level.Trial)
        public void setup() {
            charset = Charset.forName(charsetName);
            text = switch (content) {
                case "LATIN1" -> "é".repeat(size);
                case "BMP" -> "漢".repeat(size);
                case "SUPPLEMENTARY" -> "😃".repeat(size / 2) + "a".repeat(size & 1);
                default -> throw new AssertionError(content);
            };
            bytes = fixedEncoding(text, charsetName);
            if (!Arrays.equals(text.getBytes(charset), bytes)
                    || !new String(bytes, charset).equals(text)) {
                throw new AssertionError("String round trip");
            }
        }
    }

    @State(Scope.Thread)
    public static class Buffers extends Strings {
        @Param({"HEAP", "DIRECT", "READ_ONLY", "SEGMENT"})
        public String sourceKind;
        @Param({"HEAP", "DIRECT", "SEGMENT"})
        public String destinationKind;

        Arena arena;
        ByteBuffer inputBytes, outputBytes;
        CharBuffer inputChars, outputChars;
        CharsetDecoder decoder;
        CharsetEncoder encoder;

        private ByteBuffer allocate(int capacity, String kind) {
            return switch (kind) {
                case "HEAP", "READ_ONLY" -> ByteBuffer.allocate(capacity);
                case "DIRECT" -> ByteBuffer.allocateDirect(capacity);
                case "SEGMENT" -> arena.allocate(capacity, 8).asByteBuffer();
                default -> throw new AssertionError(kind);
            };
        }

        @Setup(Level.Trial)
        public void setupBuffers() throws Exception {
            arena = Arena.ofConfined();
            inputBytes = allocate(bytes.length, sourceKind);
            inputBytes.put(bytes).flip();
            inputChars = sourceKind.equals("HEAP") || sourceKind.equals("READ_ONLY")
                    ? CharBuffer.allocate(size)
                    : allocate(Math.multiplyExact(size, 2), sourceKind).asCharBuffer();
            inputChars.put(text).flip();
            if (sourceKind.equals("READ_ONLY")) {
                inputBytes = inputBytes.asReadOnlyBuffer();
                inputChars = inputChars.asReadOnlyBuffer();
            }
            outputBytes = allocate(bytes.length, destinationKind);
            outputChars = destinationKind.equals("HEAP") ? CharBuffer.allocate(size)
                    : allocate(Math.multiplyExact(size, 2), destinationKind).asCharBuffer();
            decoder = charset.newDecoder();
            encoder = charset.newEncoder();
            decode();
            outputChars.flip();
            if (!outputChars.toString().equals(text)) {
                throw new AssertionError("Buffer decode");
            }
            encode();
            outputBytes.flip();
            if (!outputBytes.equals(ByteBuffer.wrap(bytes))) {
                throw new AssertionError("Buffer encode");
            }
        }

        private static void check(CoderResult result) throws Exception {
            if (!result.isUnderflow()) result.throwException();
        }

        int decode() throws Exception {
            decoder.reset();
            inputBytes.rewind();
            outputChars.clear();
            check(decoder.decode(inputBytes, outputChars, true));
            check(decoder.flush(outputChars));
            if (inputBytes.hasRemaining()) throw new AssertionError("Unconsumed bytes");
            return outputChars.position();
        }

        int encode() throws Exception {
            encoder.reset();
            inputChars.rewind();
            outputBytes.clear();
            check(encoder.encode(inputChars, outputBytes, true));
            check(encoder.flush(outputBytes));
            if (inputChars.hasRemaining()) throw new AssertionError("Unconsumed chars");
            return outputBytes.position();
        }

        @TearDown(Level.Trial)
        public void close() {
            arena.close();
        }
    }

    @State(Scope.Thread)
    public static class Segments extends Strings {
        @Param({"HEAP", "NATIVE"})
        public String memoryKind;
        Arena arena;
        MemorySegment segment;

        @Setup(Level.Trial)
        public void setupSegment() {
            arena = Arena.ofConfined();
            int capacity = Math.addExact(bytes.length, 4);
            segment = memoryKind.equals("HEAP")
                    ? MemorySegment.ofArray(new byte[capacity]) : arena.allocate(capacity, 8);
            segment.setString(0, text, charset);
            if (!Arrays.equals(segment.asSlice(0, bytes.length).toArray(java.lang.foreign.ValueLayout.JAVA_BYTE), bytes)
                    || !segment.getString(0, charset).equals(text)) {
                throw new AssertionError("Segment round trip");
            }
        }

        @TearDown(Level.Trial)
        public void close() {
            arena.close();
        }
    }

    @State(Scope.Thread)
    public static class Fallback {
        @Param({"Shift_JIS", "windows-1252"})
        public String charsetName;
        @Param({"1", "2", "15", "16", "31", "32", "63", "64", "127", "128",
                "255", "256", "511", "512", "1023", "1024", "4096", "65536", "1048576"})
        public int size;
        Charset charset;
        String text;
        byte[] bytes;

        @Setup(Level.Trial)
        public void setup() {
            charset = Charset.forName(charsetName);
            text = "a".repeat(size);
            bytes = new byte[size];
            Arrays.fill(bytes, (byte)'a');
            if (!Arrays.equals(text.getBytes(charset), bytes)
                    || !new String(bytes, charset).equals(text)) {
                throw new AssertionError("Fallback charset round trip");
            }
        }
    }

    // Generate the wire corpus without either charset conversion under test.
    private static byte[] fixedEncoding(String text, String name) {
        int width = name.startsWith("UTF-32") ? 4 : 2;
        boolean big = !name.endsWith("LE");
        int prefix = name.equals("UTF-16") && !text.isEmpty() ? 2 : 0;
        int points = text.length();
        for (int i = 0; i + 1 < text.length(); i++) {
            if (Character.isHighSurrogate(text.charAt(i))
                    && Character.isLowSurrogate(text.charAt(i + 1))) {
                points--;
                i++;
            }
        }
        byte[] result = new byte[prefix + width * (width == 2 ? text.length() : points)];
        if (prefix != 0) put(result, 0, 0xfeff, 2, true);
        for (int i = 0, offset = prefix; i < text.length(); offset += width) {
            int cp = text.charAt(i++);
            if (width == 4 && Character.isHighSurrogate((char)cp)) {
                cp = Character.toCodePoint((char)cp, text.charAt(i++));
            }
            put(result, offset, cp, width, big);
        }
        return result;
    }

    private static void put(byte[] bytes, int offset, int value, int width, boolean big) {
        for (int i = 0; i < width; i++) {
            bytes[offset + (big ? width - 1 - i : i)] = (byte)(value >>> (8 * i));
        }
    }

    @Benchmark public String constructString(Strings s) { return new String(s.bytes, s.charset); }
    @Benchmark public byte[] getBytes(Strings s) { return s.text.getBytes(s.charset); }
    @Benchmark public String fallbackConstructString(Fallback s) { return new String(s.bytes, s.charset); }
    @Benchmark public byte[] fallbackGetBytes(Fallback s) { return s.text.getBytes(s.charset); }
    @Benchmark public int decodeBuffer(Buffers s) throws Exception { return s.decode(); }
    @Benchmark public int encodeBuffer(Buffers s) throws Exception { return s.encode(); }
    @Benchmark public String getSegmentString(Segments s) { return s.segment.getString(0, s.charset); }
    @Benchmark public MemorySegment setSegmentString(Segments s) {
        s.segment.setString(0, s.text, s.charset);
        return s.segment;
    }

    /** Emit untimed workload metadata; --sizes accepts a frozen boundary or pilot grid. */
    public static void main(String[] args) throws Exception {
        String[] sizes = Strings.class.getField("size").getAnnotation(Param.class).value();
        if (args.length != 0) {
            if (args.length != 2 || !args[0].equals("--sizes")) {
                throw new IllegalArgumentException("Expected --sizes <comma-separated UTF-16 unit counts>");
            }
            sizes = args[1].split(",");
        }
        System.out.println("kind,benchmark,charsetName,content,size,sourceKind,destinationKind,memoryKind,encodedBytes,sha256");
        var seen = new HashSet<Integer>();
        for (String n : sizes) {
            int size = Integer.parseInt(n);
            if (size < 1 || size > 1048576 || !seen.add(size)) {
                throw new IllegalArgumentException("Invalid or duplicate size: " + size);
            }
            for (String charset : Strings.class.getField("charsetName").getAnnotation(Param.class).value()) {
                for (String content : Strings.class.getField("content").getAnnotation(Param.class).value()) {
                    Strings s = new Strings();
                    s.charsetName = charset; s.content = content; s.size = size; s.setup();
                    String hash = HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(s.bytes));
                    row("wide", "constructString", s, "", "", "", hash);
                    row("wide", "getBytes", s, "", "", "", hash);
                    for (String source : Buffers.class.getField("sourceKind").getAnnotation(Param.class).value()) {
                        for (String destination : Buffers.class.getField("destinationKind").getAnnotation(Param.class).value()) {
                            row("wide", "decodeBuffer", s, source, destination, "", hash);
                            row("wide", "encodeBuffer", s, source, destination, "", hash);
                        }
                    }
                    for (String memory : Segments.class.getField("memoryKind").getAnnotation(Param.class).value()) {
                        row("wide", "getSegmentString", s, "", "", memory, hash);
                        row("wide", "setSegmentString", s, "", "", memory, hash);
                    }
                }
            }
            for (String charset : Fallback.class.getField("charsetName").getAnnotation(Param.class).value()) {
                byte[] bytes = new byte[size];
                Arrays.fill(bytes, (byte)'a');
                String hash = HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(bytes));
                for (String method : new String[]{"fallbackConstructString", "fallbackGetBytes"}) {
                    System.out.println("fallback,org.openjdk.bench.java.lang.SimdUTFWide." + method
                            + "," + charset + ",," + size + ",,,," + bytes.length + "," + hash);
                }
            }
        }
    }

    private static void row(String kind, String method, Strings s,
                            String source, String destination, String memory, String hash) {
        System.out.println(kind + ",org.openjdk.bench.java.lang.SimdUTFWide." + method + ","
                + s.charsetName + "," + s.content + "," + s.size + "," + source + ","
                + destination + "," + memory + "," + s.bytes.length + "," + hash);
    }
}
