/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * Distributed under GNU GPL version 2; see the repository LICENSE file.
 */
package org.simdjson;

import java.lang.management.ManagementFactory;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.HexFormat;

/** Fixed workloads; 15 seconds total warmup and 30 seconds total measurement. */
public final class PR43ParserTiming {
    static volatile long sink;
    static final String[] NAMES = {"long", "escaped", "short-tail"};
    static final byte[][][] DATA = new byte[3][][];
    static final BitIndexes indexes = new BitIndexes(1 << 20);
    static final StructuralIndexer indexer = new StructuralIndexer(indexes);

    static long batch(int workload) {
        long checksum = 0;
        for (byte[] bytes : DATA[workload]) {
            indexer.index(bytes, bytes.length);
            while (indexes.hasNext()) checksum = checksum * 31 + indexes.getAndAdvance();
        }
        return checksum;
    }

    static void prepare() throws Exception {
        var oracle = PR43ParserProbe.class.getDeclaredMethod("oracle", byte[].class);
        oracle.setAccessible(true);
        for (int w = 0; w < 3; w++) {
            DATA[w] = new byte[64][];
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            for (int i = 0; i < 64; i++) {
                String value = switch (w) {
                    case 0 -> "{\"data\":[" + "123,true,null,\"abcdef\",".repeat(1024) + "0]}";
                    case 1 -> "[" + "\"a\\\"b\\\\c\\n\\u001fé\",".repeat(1024) + "0]";
                    default -> " ".repeat(i) + "[\"a\\\"b\",true,0,{\"é\":null}]" + " ".repeat((i * 17) % 65);
                };
                // Long documents also exercise all 64 starting alignments.
                if (w != 2) value = " ".repeat(i) + value;
                DATA[w][i] = value.getBytes(StandardCharsets.UTF_8);
                byte[] bytes = DATA[w][i];
                int[] expected = (int[]) oracle.invoke(null, (Object) bytes);
                indexer.index(bytes, bytes.length);
                int token = 0;
                while (indexes.hasNext()) {
                    int actual = indexes.getAndAdvance();
                    if (token == expected.length || actual != expected[token++])
                        throw new AssertionError("corpus oracle mismatch");
                }
                if (token != expected.length) throw new AssertionError("missing structural indexes");
                digest.update(java.nio.ByteBuffer.allocate(4).putInt(bytes.length).array());
                digest.update(bytes);
            }
            System.out.println("CORPUS " + NAMES[w] + " " + HexFormat.of().formatHex(digest.digest()));
        }
    }

    static void warm(int w) {
        long end = System.nanoTime() + 5_000_000_000L;
        do { sink = batch(w); } while (System.nanoTime() < end);
    }

    static void measure(int w, long expected) {
        long bytes = 0;
        for (byte[] b : DATA[w]) bytes += b.length;
        System.out.println("MEASURE_BEGIN " + NAMES[w] + " " + ManagementFactory.getRuntimeMXBean().getUptime());
        long iterations = 0, checksum = 0;
        long begin = System.nanoTime();
        do {
            checksum += batch(w);
            iterations++;
        } while (System.nanoTime() - begin < 10_000_000_000L);
        long nanos = System.nanoTime() - begin;
        long uptime = ManagementFactory.getRuntimeMXBean().getUptime();
        sink = checksum;
        System.out.println("MEASURE_END " + NAMES[w] + " " + uptime);
        if (checksum != expected * iterations) throw new AssertionError("checksum mismatch");
        System.out.println("RESULT " + NAMES[w] + " " + iterations + " " + bytes + " " + nanos + " " + expected);
    }

    public static void main(String[] args) throws Exception {
        if (VectorUtils.BYTE_SPECIES.vectorBitSize() != 128) throw new AssertionError("species");
        prepare();
        int rotation = Integer.parseInt(args[0]);
        long[] expected = new long[3];
        for (int w = 0; w < 3; w++) expected[w] = batch(w);
        for (int i = 0; i < 3; i++) warm((i + rotation) % 3);
        for (int i = 0; i < 3; i++) measure((i + rotation) % 3, expected[(i + rotation) % 3]);
    }
}
