/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * Distributed under GNU GPL version 2; see the repository LICENSE file.
 */
package org.simdjson;

import java.lang.management.ManagementFactory;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.HexFormat;

/** Complete DOM parsing plus immediate value consumption; fixed 15s/30s intervals. */
public final class PR43FullParserTiming {
    static volatile long sink;
    static final String[] NAMES = {"long", "escaped", "short-tail"};
    static final byte[][][] DATA = new byte[3][][];
    static final long[] EXPECTED = new long[3];
    static final SimdJsonParser PARSER = new SimdJsonParser(1 << 20, 128);
    static long mix(long a, long b) { return a * 31 + b; }
    static long consume(JsonValue v) {
        if (v.isArray()) {
            long h = 17;
            var it = v.arrayIterator();
            while (it.hasNext()) h = mix(h, consume(it.next()));
            return h;
        }
        if (v.isObject()) {
            long h = 19;
            var it = v.objectIterator();
            while (it.hasNext()) {
                var e = it.next();
                h = mix(mix(h, e.getKey().hashCode()), consume(e.getValue()));
            }
            return h;
        }
        if (v.isString()) return mix(23, v.asString().hashCode());
        if (v.isLong()) return mix(29, v.asLong());
        if (v.isDouble()) return mix(31, Double.doubleToLongBits(v.asDouble()));
        if (v.isBoolean()) return v.asBoolean() ? 37 : 41;
        if (v.isNull()) return 43;
        throw new AssertionError("unknown value kind");
    }
    // Expected values derive from the generated document recipe, never parser output.
    static long expectedDocument(int w) {
        long h = 17;
        if (w == 0) {
            for (int i = 0; i < 1024; i++) {
                h = mix(h, mix(29, 123)); h = mix(h, 37);
                h = mix(h, 43); h = mix(h, mix(23, "abcdef".hashCode()));
            }
            return mix(mix(19, "data".hashCode()), mix(h, mix(29, 0)));
        }
        if (w == 1) {
            for (int i = 0; i < 1024; i++) h = mix(h, mix(23, "a\"b\\c\n\u001fé".hashCode()));
            return mix(h, mix(29, 0));
        }
        h = mix(h, mix(23, "a\"b".hashCode())); h = mix(h, 37); h = mix(h, mix(29, 0));
        return mix(h, mix(mix(19, "é".hashCode()), 43));
    }
    static long batch(int w) {
        long h = 0;
        for (byte[] b : DATA[w]) h = mix(h, consume(PARSER.parse(b, b.length)));
        return h;
    }
    static void prepare() throws Exception {
        if (VectorUtils.BYTE_SPECIES.vectorBitSize() != 128) throw new AssertionError("species");
        for (int w = 0; w < 3; w++) {
            DATA[w] = new byte[64][];
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            for (int i = 0; i < 64; i++) {
                String value = switch (w) {
                    case 0 -> "{\"data\":[" + "123,true,null,\"abcdef\",".repeat(1024) + "0]}";
                    case 1 -> "[" + "\"a\\\"b\\\\c\\n\\u001fé\",".repeat(1024) + "0]";
                    default -> " ".repeat(i) + "[\"a\\\"b\",true,0,{\"é\":null}]" + " ".repeat((i * 17) % 65);
                };
                if (w != 2) value = " ".repeat(i) + value;
                byte[] b = value.getBytes(StandardCharsets.UTF_8);
                DATA[w][i] = b;
                if (consume(PARSER.parse(b, b.length)) != expectedDocument(w))
                    throw new AssertionError("independent document result mismatch " + w + ":" + i);
                EXPECTED[w] = mix(EXPECTED[w], expectedDocument(w));
                digest.update(java.nio.ByteBuffer.allocate(4).putInt(b.length).array());
                digest.update(b);
            }
            System.out.println("CORPUS " + NAMES[w] + " " + HexFormat.of().formatHex(digest.digest()));
            if (batch(w) != EXPECTED[w]) throw new AssertionError("batch mismatch");
        }
        // Additional value kinds and rejected input stay outside timing.
        byte[] kinds = "[false,1.5,null,\"😀\"]".getBytes(StandardCharsets.UTF_8);
        long expected = mix(mix(mix(mix(17,41),mix(31,Double.doubleToLongBits(1.5))),43),mix(23,"😀".hashCode()));
        if (consume(PARSER.parse(kinds,kinds.length)) != expected) throw new AssertionError("value kinds");
        for (byte[] bad : new byte[][] { "[1,]".getBytes(StandardCharsets.UTF_8),
                "{\"a\":}".getBytes(StandardCharsets.UTF_8), new byte[] {'[','"',(byte)0xc0,(byte)0xaf,'"',']'} }) {
            boolean rejected = false;
            try { PARSER.parse(bad,bad.length); } catch (JsonParsingException e) { rejected = true; }
            if (!rejected) throw new AssertionError("invalid JSON/UTF8 accepted");
        }
        System.out.println("FULL_PARSER_SEMANTICS_PASS documents=192 additional=4");
    }
    static void warm(int w, long nanos) {
        long end = System.nanoTime() + nanos;
        do { long h = batch(w); if (h != EXPECTED[w]) throw new AssertionError("warmup result"); sink=h; }
        while (System.nanoTime() < end);
    }
    static void measure(int w) {
        long bytes = 0;
        for (byte[] b : DATA[w]) bytes += b.length;
        System.out.println("MEASURE_BEGIN " + NAMES[w] + " " + ManagementFactory.getRuntimeMXBean().getUptime());
        long iterations=0, checksum=0, begin=System.nanoTime();
        do { checksum += batch(w); iterations++; } while (System.nanoTime()-begin < 10_000_000_000L);
        long nanos=System.nanoTime()-begin, uptime=ManagementFactory.getRuntimeMXBean().getUptime();
        sink=checksum;
        System.out.println("MEASURE_END " + NAMES[w] + " " + uptime);
        if (checksum != EXPECTED[w]*iterations) throw new AssertionError("measured result mismatch");
        System.out.println("RESULT " + NAMES[w] + " " + iterations + " " + bytes + " " + nanos + " " + EXPECTED[w]);
    }
    public static void main(String[] args) throws Exception {
        boolean diagnostic=args[0].equals("diagnostic");
        if (diagnostic) PR43ParserProbe.main(new String[0]);
        prepare();
        int rotation=diagnostic ? 0 : Integer.parseInt(args[0]);
        for (int i=0;i<3;i++) warm((i+rotation)%3, diagnostic ? 2_000_000_000L : 5_000_000_000L);
        if (diagnostic) { System.out.println("FULL_PARSER_DIAGNOSTIC_PASS"); return; }
        for (int i=0;i<3;i++) measure((i+rotation)%3);
    }
}
