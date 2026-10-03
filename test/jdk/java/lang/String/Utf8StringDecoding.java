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
 * @summary Stable compact String UTF-8 decoding preserves coders, offsets and malformed replacement spans
 * @library /test/lib
 * @modules java.base/java.lang:+open java.base/jdk.internal.access
 * @run main/othervm -Xint -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters Utf8StringDecoding counted
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters Utf8StringDecoding counted
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters Utf8StringDecoding counted
 * @run main/othervm -Xint -XX:-UseTmfyStringCoding Utf8StringDecoding
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters -XX:-UseTmfyStringCoding Utf8StringDecoding java
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters -XX:-UseTmfyStringCoding Utf8StringDecoding java
 * @run main/othervm -XX:-CompactStrings Utf8StringDecoding noncompact
 */

import java.lang.reflect.Field;
import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Random;
import jdk.internal.access.SharedSecrets;
import jdk.test.lib.util.StringCodingAccess;

public class Utf8StringDecoding {
    private static final int[] LENGTHS = {0, 1, 2, 3, 7, 15, 16, 31, 32, 63, 64,
            127, 128, 255, 256, 257, 511, 512, 4095, 4096, 4097, 8192};
    private static final byte[][] BAD = {
            {(byte) 0x80}, {(byte) 0xc0, (byte) 0x80}, {(byte) 0xc2},
            {(byte) 0xc2, 0x41}, {(byte) 0xe0, (byte) 0x80, (byte) 0x80},
            {(byte) 0xed, (byte) 0xa0, (byte) 0x80},
            {(byte) 0xe2, (byte) 0x82}, {(byte) 0xe2, 0x41, (byte) 0xac},
            {(byte) 0xf0, (byte) 0x80, (byte) 0x80, (byte) 0x80},
            {(byte) 0xf4, (byte) 0x90, (byte) 0x80, (byte) 0x80},
            {(byte) 0xf0, (byte) 0x90, 0x41, (byte) 0x80},
            {(byte) 0xf0, (byte) 0x90, (byte) 0x80}, {(byte) 0xff}};

    public static void main(String[] args) throws Exception {
        boolean compact = !Arrays.asList(args).contains("noncompact");
        publicRoute(compact, Arrays.asList(args).contains("counted"),
                Arrays.asList(args).contains("java"));
        for (int length : LENGTHS) {
            for (String token : new String[] {"A", "\u0000", "\u00e9", "\u0100", "\u20ac",
                    "\ud83d\ude00", "A\u00ff\u0100\u20ac\udbff\udfff"}) {
                byte[] source = token.repeat(length).getBytes(StandardCharsets.UTF_8);
                verify(source);
            }
        }
        for (int prefix : new int[] {0, 1, 63, 255, 256, 4095}) {
            for (byte[] bad : BAD) {
                byte[] lead = "\u20ac".repeat(100).getBytes(StandardCharsets.UTF_8);
                byte[] input = new byte[lead.length + prefix + bad.length + 97];
                System.arraycopy(lead, 0, input, 0, lead.length);
                Arrays.fill(input, lead.length, input.length, (byte) 'x');
                System.arraycopy(bad, 0, input, lead.length + prefix, bad.length);
                verify(input);
                verify(Arrays.copyOf(input, lead.length + prefix + bad.length));
            }
        }
        Random random = new Random(0xdec0de);
        for (int i = 0; i < 2_000; i++) {
            byte[] input = new byte[random.nextInt(5000)];
            random.nextBytes(input);
            verify(input);
        }
        coder(compact);
        // Only compact String construction takes the private source snapshot.
        // The unchanged noncompact Java path has no concurrent-read guarantee.
        if (compact) stableSnapshot();
        System.out.println("STRING_UTF8_DECODE_OK");
    }

    private static void publicRoute(boolean compact, boolean counted, boolean compiledJava) {
        byte[] input = "\u20ac".repeat(300).getBytes(StandardCharsets.UTF_8);
        long[] before = StringCodingAccess.counters0();
        if (compiledJava) {
            // Allow interpreter JNI calls before the compiled Java-only window.
            for (int i = 0; i < 20_000; i++) {
                String actual = new String(input, StandardCharsets.UTF_8);
                if (actual.length() != 300 || actual.charAt(299) != '\u20ac') {
                    throw new AssertionError("public constructor warmup corruption");
                }
            }
            before = StringCodingAccess.counters0();
        }
        for (int i = 0; i < 20_000; i++) {
            String actual = new String(input, StandardCharsets.UTF_8);
            if (actual.length() != 300 || actual.charAt(299) != '\u20ac') {
                throw new AssertionError("public constructor corruption");
            }
        }
        long[] after = StringCodingAccess.counters0();
        long calls = after[0] - before[0] + after[1] - before[1];
        // With diagnostics enabled, prove that the actual public callsite
        // reaches the native family rather than merely testing its facade.
        if ((counted && calls != (compact ? 20_000 : 0))
                || (compiledJava && (calls != 0 || after[2] != before[2]))) {
            throw new AssertionError("unexpected public decoder calls: " + calls);
        }
    }

    private static void verify(byte[] input) throws Exception {
        String expected = StandardCharsets.UTF_8.newDecoder()
                .onMalformedInput(CodingErrorAction.REPLACE)
                .onUnmappableCharacter(CodingErrorAction.REPLACE)
                .decode(ByteBuffer.wrap(input)).toString();
        byte[] original = input.clone();
        equal(expected, new String(input, StandardCharsets.UTF_8));
        equal(expected, new String(input, "UTF-8"));
        byte[] padded = new byte[input.length + 19];
        Arrays.fill(padded, (byte) 0xff);
        System.arraycopy(input, 0, padded, 7, input.length);
        equal(expected, new String(padded, 7, input.length, StandardCharsets.UTF_8));
        if (!Arrays.equals(input, original)) throw new AssertionError("modified caller bytes");
        String strict = null;
        try {
            strict = StandardCharsets.UTF_8.newDecoder().decode(ByteBuffer.wrap(input)).toString();
        } catch (CharacterCodingException expectedFailure) { }
        if (strict != null) {
            equal(strict, SharedSecrets.getJavaLangAccess()
                    .uncheckedNewStringOrThrow(input.clone(), StandardCharsets.UTF_8));
        } else {
            try {
                SharedSecrets.getJavaLangAccess()
                        .uncheckedNewStringOrThrow(input.clone(), StandardCharsets.UTF_8);
                throw new AssertionError("strict String decoder accepted malformed UTF-8");
            } catch (CharacterCodingException expectedStrictFailure) { }
        }
    }

    private static void coder(boolean compact) throws Exception {
        Field field = String.class.getDeclaredField("coder");
        field.setAccessible(true);
        for (String text : new String[] {"A".repeat(4096), "\u00e9".repeat(2000),
                "\u00e9".repeat(17) + "\u20ac".repeat(300), "\ud83d\ude00".repeat(1000)}) {
            byte[] bytes = text.getBytes(StandardCharsets.UTF_8);
            String decoded = new String(bytes, StandardCharsets.UTF_8);
            int expected = compact && text.chars().allMatch(c -> c <= 255) ? 0 : 1;
            if (field.getByte(decoded) != expected) throw new AssertionError("wrong String coder");
            Arrays.fill(bytes, (byte) 0);
            equal(text, decoded);
        }
    }

    private static void stableSnapshot() throws Exception {
        byte[] input = "\u20ac".repeat(300).getBytes(StandardCharsets.UTF_8);
        int index = 451;
        String first = new String(input, StandardCharsets.UTF_8);
        input[index] = 'A';
        String second = new String(input, StandardCharsets.UTF_8);
        Thread writer = new Thread(() -> {
            while (!Thread.currentThread().isInterrupted()) {
                input[index] = (byte) 0x82;
                input[index] = 'A';
            }
        });
        writer.start();
        try {
            for (int i = 0; i < 10_000; i++) {
                String actual = new String(input, StandardCharsets.UTF_8);
                if (!actual.equals(first) && !actual.equals(second)) {
                    throw new AssertionError("validation and conversion used different snapshots");
                }
            }
        } finally {
            writer.interrupt();
            writer.join();
        }
    }


    private static void equal(String expected, String actual) {
        if (!expected.equals(actual)) throw new AssertionError("UTF-8 decoding mismatch");
    }
}
