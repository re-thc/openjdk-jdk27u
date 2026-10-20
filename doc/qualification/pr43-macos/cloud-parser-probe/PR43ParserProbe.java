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
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

package org.simdjson;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

/** Functional/compilation probe only: deliberately contains no timer. */
public final class PR43ParserProbe {
    private static final Random RANDOM = new Random(0x43a128);
    private static long sink;
    private static int checks;

    private static boolean white(int c) { return c == 32 || c == 9 || c == 10 || c == 13; }
    private static boolean operator(int c) { return "{}[],:".indexOf(c) >= 0; }

    // Independent lexical oracle for valid JSON documents used by this probe.
    private static int[] oracle(byte[] bytes) {
        List<Integer> positions = new ArrayList<>();
        int p = 0;
        while (p < bytes.length) {
            int c = bytes[p] & 255;
            if (white(c)) { p++; continue; }
            positions.add(p);
            if (operator(c)) { p++; continue; }
            if (c == 34) {
                p++;
                boolean closed = false;
                while (p < bytes.length) {
                    c = bytes[p++] & 255;
                    if (c < 32) throw new IllegalArgumentException("control");
                    if (c == 92) {
                        if (p == bytes.length) break;
                        if ((bytes[p++] & 255) < 32) throw new IllegalArgumentException("control");
                    } else if (c == 34) { closed = true; break; }
                }
                if (!closed) throw new IllegalArgumentException("unclosed");
            } else {
                while (p < bytes.length && !white(bytes[p] & 255) && !operator(bytes[p] & 255)) p++;
            }
        }
        return positions.stream().mapToInt(Integer::intValue).toArray();
    }

    private static void check(StructuralIndexer indexer, BitIndexes indexes, String text) {
        byte[] bytes = text.getBytes(StandardCharsets.UTF_8);
        int[] expected = oracle(bytes);
        indexer.index(bytes, bytes.length);
        int i = 0;
        while (indexes.hasNext()) {
            int actual = indexes.getAndAdvance();
            if (i == expected.length || actual != expected[i])
                throw new AssertionError("at token " + i + ": got " + actual + " expected " + Arrays.toString(expected));
            sink = sink * 31 + actual;
            i++;
        }
        if (i != expected.length) throw new AssertionError("missing indexes " + i + "/" + expected.length);
        checks++;
    }

    private static String string(int length) {
        StringBuilder s = new StringBuilder("\"");
        String[] pieces = {"a", " ", "{", "}", "[", "]", ",", ":", "\\\"", "\\\\", "\\n", "\\t", "\\u001f", "é", "🍁"};
        for (int i = 0; i < length; i++) s.append(pieces[RANDOM.nextInt(pieces.length)]);
        return s.append('"').toString();
    }

    private static String document(int n) {
        StringBuilder s = new StringBuilder(" ".repeat(RANDOM.nextInt(130))).append("{\"x\":[");
        for (int i = 0; i < n; i++) {
            if (i != 0) s.append(", \n");
            s.append(switch (i % 6) {
                case 0 -> string(RANDOM.nextInt(200));
                case 1 -> "-12.75e+2";
                case 2 -> "true";
                case 3 -> "false";
                case 4 -> "null";
                default -> "{\"nested\":[0,1,2]}";
            });
        }
        return s.append("]}\t").append(" ".repeat(RANDOM.nextInt(130))).toString();
    }

    private static void malformed(StructuralIndexer indexer, String text) {
        byte[] bytes = text.getBytes(StandardCharsets.UTF_8);
        try { indexer.index(bytes, bytes.length); }
        catch (JsonParsingException expected) { checks++; return; }
        throw new AssertionError("missing stage-1 rejection");
    }

    public static void main(String[] args) {
        if (VectorUtils.BYTE_SPECIES.vectorBitSize() != 128) throw new AssertionError("species must be 128");
        BitIndexes indexes = new BitIndexes(1 << 20);
        StructuralIndexer indexer = new StructuralIndexer(indexes);
        String[] warm = new String[32];
        for (int i = 0; i < warm.length; i++) warm[i] = document(i + 1);
        // Warm the actual unmodified parser, including its conditional escape paths.
        for (int i = 0; i < 3000; i++) {
            String s = warm[i & 31];
            byte[] b = s.getBytes(StandardCharsets.UTF_8);
            indexer.index(b, b.length);
            while (indexes.hasNext()) sink += indexes.getAndAdvance();
        }
        System.out.println("PR43_WARMUP_COMPLETE species=128");
        for (String s : warm) check(indexer, indexes, s);
        for (int i = 0; i < 1024; i++) check(indexer, indexes, document(RANDOM.nextInt(64)));
        // Every byte alignment around the four 16-byte chunks and 64-byte carry.
        for (int pad = 0; pad < 192; pad++) {
            check(indexer, indexes, " ".repeat(pad) + "[\"a\\\"b\\\\c\",true,0,{\"é\":null}]" + " ".repeat(191 - pad));
            check(indexer, indexes, "[\"" + "x".repeat(pad) + "\\\\\\\"end\",false]");
        }
        check(indexer, indexes, document(4096));
        System.out.println("PR43_VALID_COMPLETE checks=" + checks);
        for (int pad = 0; pad < 130; pad++) {
            malformed(indexer, " ".repeat(pad) + "\"unterminated");
            malformed(indexer, "[\"" + "x".repeat(pad) + "\n\"]");
        }
        System.out.println("PR43_PARSER_PASS checks=" + checks + " checksum=" + sink);
    }
}
