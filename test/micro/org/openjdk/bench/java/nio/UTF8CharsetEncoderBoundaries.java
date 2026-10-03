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
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
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
 * Focused public encode calls, kept out of the bulk benchmark's parameter grid.
 * Tight-output cases intentionally stop on OVERFLOW; malformed REPORT stops on
 * MALFORMED[1]. SPLIT_PAIR measures two calls on one stream: an incomplete pair
 * with endOfInput=false, then the rest of the input with endOfInput=true.
 */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(3)
@State(Scope.Thread)
public class UTF8CharsetEncoderBoundaries {
    @Param({"LATE_NON_ASCII", "BLOCK_2047", "BLOCK_2048", "BLOCK_2049",
            "PAIR_BLOCK_SPLIT", "SLICE_OFFSETS", "TIGHT_LATIN", "TIGHT_CJK",
            "TIGHT_PAIR", "SPLIT_PAIR", "MALFORMED_EARLY_0", "MALFORMED_EARLY_4",
            "MALFORMED_REPORT", "MALFORMED_REPLACE",
            "MALFORMED_IGNORE", "MALFORMED_CUSTOM", "TIGHT_CUSTOM"})
    public String scenario;

    private CharsetEncoder encoder;
    private CharBuffer input;
    private ByteBuffer output;
    private int inputStart;
    private int outputStart;
    private int inputLimit;
    private int outputLimit;
    private int completeLimit;
    private boolean splitPair;

    @Setup
    public void setup() {
        encoder = StandardCharsets.UTF_8.newEncoder();
        String bulk = "\u4e2d".repeat(2048);
        String text;
        String expectedText;
        CoderResult expectedResult = CoderResult.UNDERFLOW;
        int consumed = -1;
        int spareOutput = -1;
        splitPair = false;
        switch (scenario) {
            case "LATE_NON_ASCII" -> text = expectedText = "a".repeat(15) + "\u00e9";
            case "BLOCK_2047" -> text = expectedText = bulk.substring(1);
            case "BLOCK_2048" -> text = expectedText = bulk;
            case "BLOCK_2049" -> text = expectedText = bulk + "\u4e2d";
            case "PAIR_BLOCK_SPLIT" -> text = expectedText = bulk.substring(1)
                    + "\ud83d\ude00" + bulk.substring(1);
            case "SLICE_OFFSETS" -> text = expectedText = "abc\u00e9\u4e2d\ud83d\ude00";
            case "TIGHT_LATIN", "TIGHT_CJK", "TIGHT_PAIR" -> {
                String tail = switch (scenario) {
                    case "TIGHT_LATIN" -> "\u00e9";
                    case "TIGHT_CJK" -> "\u4e2d";
                    default -> "\ud83d\ude00";
                };
                text = bulk + tail;
                expectedText = bulk;
                consumed = bulk.length();
                spareOutput = tail.getBytes(StandardCharsets.UTF_8).length - 1;
                expectedResult = CoderResult.OVERFLOW;
            }
            case "SPLIT_PAIR" -> {
                text = bulk.substring(1) + "\ud83d\ude00" + bulk.substring(1);
                expectedText = bulk.substring(1);
                consumed = 2047;
                splitPair = true;
            }
            case "MALFORMED_EARLY_0", "MALFORMED_EARLY_4" -> {
                consumed = scenario.equals("MALFORMED_EARLY_0") ? 0 : 4;
                expectedText = bulk.substring(0, consumed);
                text = expectedText + "\ud800" + bulk.substring(consumed);
                expectedResult = CoderResult.malformedForLength(1);
            }
            case "MALFORMED_REPORT", "MALFORMED_REPLACE", "MALFORMED_IGNORE",
                    "MALFORMED_CUSTOM", "TIGHT_CUSTOM" -> {
                text = bulk + "\ud800";
                expectedText = bulk;
                switch (scenario) {
                    case "MALFORMED_REPORT" -> {
                        consumed = bulk.length();
                        expectedResult = CoderResult.malformedForLength(1);
                    }
                    case "MALFORMED_IGNORE" ->
                            encoder.onMalformedInput(CodingErrorAction.IGNORE);
                    case "MALFORMED_REPLACE" -> {
                        encoder.onMalformedInput(CodingErrorAction.REPLACE);
                        expectedText += "?";
                    }
                    default -> {
                        encoder.onMalformedInput(CodingErrorAction.REPLACE);
                        encoder.replaceWith(new byte[] {(byte) 0xef, (byte) 0xbf, (byte) 0xbd});
                        if (scenario.equals("TIGHT_CUSTOM")) {
                            consumed = bulk.length();
                            spareOutput = 2;
                            expectedResult = CoderResult.OVERFLOW;
                        } else {
                            expectedText += "\ufffd";
                        }
                    }
                }
            }
            default -> throw new IllegalArgumentException(scenario);
        }

        // Both buffers have nonzero arrayOffset AND nonzero position in this
        // one case. Guards cover storage outside the encoded output interval.
        boolean sliced = scenario.equals("SLICE_OFFSETS");
        inputStart = sliced ? 2 : 0;
        outputStart = sliced ? 4 : 0;
        int inputOffset = sliced ? 5 : 0;
        int outputOffset = sliced ? 7 : 0;
        char[] chars = new char[inputOffset + inputStart + text.length() + 9];
        Arrays.fill(chars, '\u2603');
        text.getChars(0, text.length(), chars, inputOffset + inputStart);
        input = CharBuffer.wrap(chars).position(inputOffset).slice();
        completeLimit = inputStart + text.length();
        inputLimit = splitPair ? inputStart + 2048 : completeLimit;
        byte[] expected = expectedText.getBytes(StandardCharsets.UTF_8);
        outputLimit = outputStart + (spareOutput >= 0
                ? expected.length + spareOutput : text.length() * 3);
        byte[] bytes = new byte[outputOffset + outputLimit + 9];
        Arrays.fill(bytes, (byte) 0x5a);
        output = ByteBuffer.wrap(bytes).position(outputOffset).slice();

        prepare();
        CoderResult result = encoder.encode(input, output, !splitPair);
        int expectedPosition = inputStart + (consumed >= 0 ? consumed : text.length());
        check(result, expectedResult, expectedPosition, expected, chars, text);
        if (splitPair) {
            input.limit(completeLimit);
            result = encoder.encode(input, output, true);
            check(result, CoderResult.UNDERFLOW, completeLimit,
                    text.getBytes(StandardCharsets.UTF_8), chars, text);
        }
    }

    private void prepare() {
        encoder.reset();
        input.clear().limit(inputLimit).position(inputStart);
        output.clear().limit(outputLimit).position(outputStart);
    }

    private void check(CoderResult actual, CoderResult expected, int consumed,
                       byte[] encoded, char[] chars, String text) {
        boolean sameResult = expected.isMalformed()
                ? actual.isMalformed() && actual.length() == expected.length()
                : actual == expected;
        if (!sameResult || input.position() != consumed || input.limit() != (splitPair
                && consumed != completeLimit ? inputLimit : completeLimit)
                || output.position() != outputStart + encoded.length
                || output.limit() != outputLimit) {
            throw new IllegalStateException("Result/position/limit mismatch: " + scenario);
        }
        int start = output.arrayOffset() + outputStart;
        byte[] bytes = output.array();
        for (int i = 0; i < bytes.length; i++) {
            byte value = i >= start && i < start + encoded.length
                    ? encoded[i - start] : (byte) 0x5a;
            if (bytes[i] != value) {
                throw new IllegalStateException("Output/guard mismatch: " + scenario);
            }
        }
        int sourceStart = input.arrayOffset() + inputStart;
        for (int i = 0; i < chars.length; i++) {
            char value = i >= sourceStart && i < sourceStart + text.length()
                    ? text.charAt(i - sourceStart) : '\u2603';
            if (chars[i] != value) {
                throw new IllegalStateException("Input modified: " + scenario);
            }
        }
    }

    @Benchmark
    public ByteBuffer encode(Blackhole bh) {
        prepare();
        bh.consume(encoder.encode(input, output, !splitPair));
        bh.consume(input.position());
        bh.consume(output.position());
        if (splitPair) {
            input.limit(completeLimit);
            bh.consume(encoder.encode(input, output, true));
            bh.consume(input.position());
            bh.consume(output.position());
        }
        return output;
    }
}
