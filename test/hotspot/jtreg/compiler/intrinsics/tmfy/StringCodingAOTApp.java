/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

package compiler.intrinsics.tmfy;

import java.lang.reflect.Field;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.test.lib.util.StringCodingAccess;

public class StringCodingAOTApp {
    private static final String LATIN1 = "\u00e9A\u00ff\u0000".repeat(128);
    private static final byte[] LATIN1_BYTES = repeat(0xc3, 0xa9, 0x41, 0xc3, 0xbf, 0);
    private static final String UTF16 = "\u4e2d\u20ac".repeat(128);
    private static final byte[] UTF16_BYTES = repeat(0xe4, 0xb8, 0xad, 0xe2, 0x82, 0xac);
    private static final String MALFORMED_UTF16 = "\u4e2d\ud800A\udc00".repeat(128);
    private static final byte[] REPLACED_UTF16_BYTES = repeat(0xe4, 0xb8, 0xad, 0x3f, 0x41, 0x3f);
    private static final byte[] MALFORMED_UTF8 = repeat(0xe4, 0xb8, 0xad, 0xed, 0xa0, 0x80, 0xf0, 0x9f, 0x98);
    private static final String REPLACED_UTF8 = "\u4e2d\ufffd\ufffd".repeat(128);

    private static byte[] repeat(int... unit) {
        byte[] bytes = new byte[unit.length * 128];
        for (int i = 0; i < bytes.length; i++) bytes[i] = (byte) unit[i % unit.length];
        return bytes;
    }

    private static void latin1() {
        if (!Arrays.equals(LATIN1_BYTES, LATIN1.getBytes(StandardCharsets.UTF_8))) {
            throw new AssertionError("public Latin1 encoding");
        }
    }

    private static void unicode() {
        if (!Arrays.equals(UTF16_BYTES, UTF16.getBytes(StandardCharsets.UTF_8)) ||
            !Arrays.equals(REPLACED_UTF16_BYTES, MALFORMED_UTF16.getBytes(StandardCharsets.UTF_8)) ||
            !UTF16.equals(new String(UTF16_BYTES, StandardCharsets.UTF_8)) ||
            !REPLACED_UTF8.equals(new String(MALFORMED_UTF8, StandardCharsets.UTF_8))) {
            throw new AssertionError("public Unicode conversion/replacement");
        }
    }

    private static void unicodeFirst(String mode) throws Exception {
        // StringCoding currently has no archived initialized mirror. Its
        // mutable readiness and native bindings must be fresh in this process.
        // This checks the current scratch-mirror contract, not support for a
        // future archive containing an initialized StringCoding mirror.
        Class<?> holder = Class.forName("java.lang.StringCoding");
        Field readiness = holder.getDeclaredField("utf8Ready");
        readiness.setAccessible(true);
        if (readiness.getBoolean(null)) {
            throw new AssertionError("StringCoding readiness was not reset before Unicode first use");
        }
        // Eagerly compiled public origins may intentionally retain Java. Make
        // registration explicit so those origins cannot mask stale bindings.
        if (!StringCodingAccess.ready() || !readiness.getBoolean(null)) {
            throw new AssertionError("fresh Unicode native registration failed");
        }
        long[] before = StringCodingAccess.counters0();
        if (!Arrays.equals(before, new long[3])) {
            throw new AssertionError("conversion counters were not fresh: " + Arrays.toString(before));
        }
        ByteBuffer nativeInput = ByteBuffer.allocate(UTF16.length() * 2).order(ByteOrder.nativeOrder());
        for (int i = 0; i < UTF16.length(); i++) nativeInput.putChar(UTF16.charAt(i));
        byte[] encoded = new byte[UTF16.length() * 3];
        int written = StringCodingAccess.encodeUtf16(nativeInput.array(), encoded);
        if (written != UTF16_BYTES.length || !Arrays.equals(encoded, UTF16_BYTES)) {
            throw new AssertionError("first registered Unicode encoder output");
        }
        byte[] decoded = new byte[UTF16_BYTES.length * 2];
        int units = StringCodingAccess.decodeUtf8(UTF16_BYTES, 0, UTF16_BYTES.length, decoded, 0);
        if (units != UTF16.length()
                || !Arrays.equals(Arrays.copyOf(decoded, units * 2), nativeInput.array())) {
            throw new AssertionError("first registered Unicode decoder output");
        }
        long[] actual = delta(before, StringCodingAccess.counters0());
        long[] expected = mode.equals("leaf") || mode.equals("eager")
                ? new long[] {2, 0, 0} : new long[] {0, 2, 0};
        if (!Arrays.equals(actual, expected)) {
            throw new AssertionError("first registered Unicode route: " + Arrays.toString(actual)
                    + " expected " + Arrays.toString(expected));
        }
        unicode();
        System.out.println("STRING_CODING_AOT_UNICODE_FIRST_OK initialReady=false registered=true direct="
                + Arrays.toString(actual));
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 1 || !(args[0].equals("leaf") || args[0].equals("fallback")
                || args[0].equals("eager") || args[0].equals("java"))) {
            throw new AssertionError("expected leaf, fallback, eager or java dispatch mode");
        }
        unicodeFirst(args[0]);
        // Unicode registration and conversion precede all Latin1 warmup.
        // This is an AOT class/profile/stub-cache test, not nmethod restoration:
        // this JDK caches adapters and runtime stubs; Java methods compile afresh.
        for (int i = 0; i < 20_000; i++) latin1();
        boolean expectLatin1Leaf = args[0].equals("leaf") || args[0].equals("eager");
        long[] before = StringCodingAccess.counters0();
        for (int i = 0; i < 1000; i++) latin1();
        long[] after = StringCodingAccess.counters0();
        long latin1Leaves = after[0] - before[0];
        if (latin1Leaves != (expectLatin1Leaf ? 1000 : 0)
                || after[1] != before[1] || after[2] != before[2]) {
            throw new AssertionError("Latin1 route: " + Arrays.toString(delta(before, after)));
        }
        for (int i = 0; i < 20_000; i++) unicode();
        // Each public Unicode iteration performs two encodes and two decodes.
        // Eager compilation does not order every origin compilation before
        // readiness publication. Each callsite may therefore retain Java or
        // admit a leaf. Probe the warmed route and require exact, stable counts
        // in two subsequent windows, with no JNI calls or rejected leaves.
        long eagerLeaves = 0;
        if (args[0].equals("eager")) {
            before = StringCodingAccess.counters0();
            unicode();
            long[] probe = delta(before, StringCodingAccess.counters0());
            if (probe[0] < 0 || probe[0] > 4 || probe[1] != 0 || probe[2] != 0) {
                throw new AssertionError("eager Unicode probe: " + Arrays.toString(probe));
            }
            eagerLeaves = probe[0];
        }
        // flag-off and other-GC compiled origins also retain Java. Startup
        // tooling keeps ordinary admission and every eligible JNI call.
        long[] expected = switch (args[0]) {
            case "leaf" -> new long[] {4000, 0, 0};
            case "fallback" -> new long[] {0, 4000, 0};
            case "eager" -> new long[] {eagerLeaves * 1000, 0, 0};
            case "java" -> new long[3];
            default -> throw new AssertionError("unknown dispatch mode");
        };
        long unicodeLeaves = 0, unicodeJNI = 0;
        for (int window = 0; window < (args[0].equals("eager") ? 2 : 1); window++) {
            before = StringCodingAccess.counters0();
            for (int i = 0; i < 1000; i++) unicode();
            after = StringCodingAccess.counters0();
            unicodeLeaves = after[0] - before[0];
            unicodeJNI = after[1] - before[1];
            if (!Arrays.equals(delta(before, after), expected)) {
                throw new AssertionError("Unicode route in window " + window + ": "
                        + Arrays.toString(delta(before, after)) + " expected " + Arrays.toString(expected));
            }
        }
        System.out.println("STRING_CODING_AOT_OK mode=" + args[0] +
                " latin1Leaves=" + latin1Leaves + " unicodeLeaves=" + unicodeLeaves + " unicodeJNI=" + unicodeJNI);
    }

    private static long[] delta(long[] before, long[] after) {
        return new long[] {after[0] - before[0], after[1] - before[1], after[2] - before[2]};
    }
}
