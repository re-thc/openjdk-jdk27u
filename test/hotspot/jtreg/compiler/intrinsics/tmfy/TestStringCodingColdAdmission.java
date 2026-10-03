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

/*
 * @test
 * @summary Small cold Unicode work retains Java; larger work enables existing small leaves
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.compiler1.enabled & vm.compiler2.enabled
 * @requires vm.flagless
 * @library /test/lib
 * @modules java.base/java.lang:+open
 * @run main/othervm -Xint -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingColdAdmission leaf
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingColdAdmission leaf
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:-UseTmfyStringCoding -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingColdAdmission java
 * @run main/othervm -Xint -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingColdAdmission leaf decode-first
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingColdAdmission leaf decode-first
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:-UseTmfyStringCoding -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingColdAdmission java decode-first
 */
package compiler.intrinsics.tmfy;

import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.test.lib.util.StringCodingAccess;

public class TestStringCodingColdAdmission {
    private static final String SMALL = "\u4e2d".repeat(64);
    private static final String LARGE = "\u4e2d".repeat(512);
    private static final byte[] SMALL_ENCODED = bytes(192);
    private static final byte[] DECODE_INPUT = bytes(256);
    private static final String DECODED = "\u4e2d".repeat(85) + "a";

    private static byte[] bytes(int count) {
        byte[] bytes = new byte[count];
        Arrays.fill(bytes, (byte) 'a');
        for (int i = 0; i + 2 < count; i += 3) {
            bytes[i] = (byte) 0xe4; bytes[i + 1] = (byte) 0xb8; bytes[i + 2] = (byte) 0xad;
        }
        return bytes;
    }

    private static void small() {
        if (!Arrays.equals(SMALL_ENCODED, SMALL.getBytes(StandardCharsets.UTF_8)) ||
                !DECODED.equals(new String(DECODE_INPUT, StandardCharsets.UTF_8))) {
            throw new AssertionError("small conversion changed");
        }
    }

    // Initialize on genuinely cold bulk work before the origins become hot.
    // Late setup after compiled warmup is covered separately by the C1/C2
    // admission fixtures, which require the compiled Java route to stay Java.
    public static void main(String[] args) throws Exception {
        if (args.length == 0 || !(args[0].equals("leaf") || args[0].equals("java"))) {
            throw new AssertionError("expected leaf or compiled Java route");
        }
        Field ready = Class.forName("java.lang.StringCoding").getDeclaredField("utf8Ready");
        ready.setAccessible(true);
        if (ready.getBoolean(null)) throw new AssertionError("converter initialized before requested work");
        if (args.length == 2 && args[1].equals("decode-first")) {
            decodeFirst(ready, args[0]);
            return;
        }
        small();
        if (ready.getBoolean(null)) throw new AssertionError("small work paid registration cost");
        if (LARGE.getBytes(StandardCharsets.UTF_8).length != 1536 || !ready.getBoolean(null)) {
            throw new AssertionError("large work did not initialize converter");
        }
        // Exercise the small paths after the monotonic stable-field publication,
        // allowing C1 to compile after readiness was published.
        for (int i = 0; i < (args[0].equals("java") ? 20_000 : 1000); i++) small();
        long[] before = StringCodingAccess.counters0();
        for (int i = 0; i < 1000; i++) small();
        long[] after = StringCodingAccess.counters0();
        long leaves = after[0] - before[0], jni = after[1] - before[1];
        if (leaves != (args[0].equals("leaf") ? 2000 : 0) || jni != 0 || after[2] != before[2]) {
            throw new AssertionError("post-initialization small route: " + leaves + "/" + jni);
        }
        System.out.println("STRING_CODING_COLD_ADMISSION_OK");
    }

    private static void decodeFirst(Field ready, String route) throws Exception {
        // The compact prologue consumes 64 ASCII bytes and the two-byte Latin1
        // character before handing off at the first three-byte Chinese character.
        // Use a nonzero constructor offset too: neither it nor the 66-byte
        // compact prefix belongs to decodeUTF8_UTF16Stable's remaining span.
        int offset = 11, prefix = 66;
        byte[][] inputs = new byte[2][];
        String[] expected = new String[2];
        for (int i = 0; i < inputs.length; i++) {
            int remaining = 1023 + i;
            byte[] input = new byte[offset + prefix + remaining + 7];
            Arrays.fill(input, (byte) 'A');
            input[offset + 64] = (byte) 0xc3;
            input[offset + 65] = (byte) 0xa9;
            System.arraycopy(bytes(remaining), 0, input, offset + prefix, remaining);
            inputs[i] = input;
            expected[i] = "A".repeat(64) + '\u00e9' + "\u4e2d".repeat(341)
                    + (i == 0 ? "" : "a");
        }
        decode(inputs[0], offset, prefix + 1023, expected[0]);
        if (ready.getBoolean(null)) throw new AssertionError("1023-byte remaining span initialized converter");
        decode(inputs[1], offset, prefix + 1024, expected[1]);
        if (!ready.getBoolean(null)) throw new AssertionError("1024-byte remaining span did not initialize converter");
        for (int i = 0; i < (route.equals("java") ? 20_000 : 1000); i++) {
            decode(inputs[0], offset, prefix + 1023, expected[0]);
        }
        long[] before = StringCodingAccess.counters0();
        for (int i = 0; i < 1000; i++) {
            decode(inputs[0], offset, prefix + 1023, expected[0]);
        }
        long[] after = StringCodingAccess.counters0();
        long leaves = after[0] - before[0], jni = after[1] - before[1];
        if (leaves != (route.equals("leaf") ? 1000 : 0) || jni != 0 || after[2] != before[2]) {
            throw new AssertionError("post-admission decode route: " + leaves + "/" + jni);
        }
        System.out.println("STRING_CODING_COLD_DECODE_ADMISSION_OK remaining=1023/1024 route=" + route);
    }

    private static void decode(byte[] input, int offset, int length, String expected) {
        if (!expected.equals(new String(input, offset, length, StandardCharsets.UTF_8))) {
            throw new AssertionError("decode-first conversion changed");
        }
    }
}
