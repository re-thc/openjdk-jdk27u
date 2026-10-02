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
 * @summary String UTF-8 encoding preserves Latin1, ASCII, UTF16 and strict error semantics
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.compiler1.enabled & vm.compiler2.enabled
 * @modules java.base/jdk.internal.tmfy java.base/jdk.internal.access
 * @run main/othervm -Xint -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters Latin1Utf8Conversion leaf
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters Latin1Utf8Conversion leaf
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters Latin1Utf8Conversion leaf
 * @run main/othervm -Xint -XX:-UseTmfyStringCoding -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters Latin1Utf8Conversion jni
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:-UseTmfyStringCoding -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters Latin1Utf8Conversion jni
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:-UseTmfyStringCoding -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters Latin1Utf8Conversion jni
 * @run main/othervm -XX:-CompactStrings -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters Latin1Utf8Conversion utf16
 */

import java.nio.CharBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.internal.access.SharedSecrets;
import jdk.internal.tmfy.Utf8Codec;

public class Latin1Utf8Conversion {
    private static final int[] LENGTHS = {0, 1, 7, 8, 15, 16, 17, 31, 32, 63, 64,
            127, 128, 4095, 4096, 4097, 8191, 8192};

    public static void main(String[] args) throws Exception {
        // Measure only actual public String calls; diagnostic setup is outside the window.
        String hot = "\u00e9A\u00ff\u0000".repeat(65);
        byte[] expected = scalar(hot.toCharArray());
        long[] before = Utf8Codec.counters0();
        for (int i = 0; i < 20_000; i++) equal(expected, encode(hot));
        long[] delta = delta(before, Utf8Codec.counters0());
        if (args[0].equals("leaf")) {
            check(delta[0] == 20_000 && delta[1] == 0 && delta[2] == 0,
                    "public String leaf path: " + Arrays.toString(delta));
        } else if (args[0].equals("jni")) {
            check(delta[0] == 0 && delta[1] == 20_000 && delta[2] == 0,
                    "public String JNI path: " + Arrays.toString(delta));
        } else {
            check(Arrays.equals(delta, new long[3]), "noncompact path used Latin1 converter");
        }

        thresholdDispatch(args[0]);
        for (int value = 0; value < 256; value++) {
            verify(new char[] {(char) value});
            char[] repeated = new char[4097];
            Arrays.fill(repeated, (char) value);
            verify(repeated);
        }
        for (int length : LENGTHS) {
            for (int spacing : new int[] {0, 1, 2, 16, 128}) {
                char[] chars = new char[length];
                for (int i = 0; i < length; i++) {
                    chars[i] = spacing != 0 && i % spacing == 0
                            ? (char) (128 + (i & 127)) : (char) (i & 127);
                }
                verify(chars);
            }
            for (int highAt : new int[] {0, length / 2, length - 1}) {
                if (highAt < 0 || highAt >= length) continue;
                char[] chars = new char[length];
                Arrays.fill(chars, 'a');
                chars[highAt] = '\u00ff';
                verify(chars);
            }
        }
        asciiIsolation();
        utf16AndErrors();
        System.out.println("STRING_LATIN1_UTF8_OK mode=" + args[0]
                + " public_calls=" + Arrays.toString(delta));
    }

    private static byte[] encode(String value) {
        return value.getBytes(StandardCharsets.UTF_8);
    }

    private static void thresholdDispatch(String mode) {
        // The threshold applies to the suffix after the first non-ASCII byte,
        // not the total String length or number of non-ASCII bytes.
        for (int prefix : new int[] {0, 63, 4096}) {
            for (int suffix : new int[] {1, 8, 15, 16, 17}) {
                for (boolean dense : new boolean[] {false, true}) {
                    String text = "A".repeat(prefix) + "\u00e9"
                            + (dense ? "\u00ff" : "B").repeat(suffix - 1);
                    byte[] expected = scalar(text.toCharArray());
                    long[] before = Utf8Codec.counters0();
                    byte[] actual = encode(text);
                    long[] calls = delta(before, Utf8Codec.counters0());
                    equal(expected, actual);
                    long[] wanted = new long[3];
                    if (suffix >= 16 && !mode.equals("utf16")) {
                        wanted[mode.equals("leaf") ? 0 : 1] = 1;
                    }
                    check(Arrays.equals(calls, wanted), "suffix dispatch prefix=" + prefix
                            + " suffix=" + suffix + " dense=" + dense
                            + " calls=" + Arrays.toString(calls));
                }
            }
        }
        System.out.println("STRING_LATIN1_THRESHOLD_OK mode=" + mode);
    }

    private static void verify(char[] chars) throws Exception {
        String text = new String(chars);
        byte[] expected = scalar(chars);
        equal(expected, encode(text));
        equal(expected, text.getBytes("UTF-8"));
        equal(expected, SharedSecrets.getJavaLangAccess()
                .uncheckedGetBytesOrThrow(text, StandardCharsets.UTF_8));
        var encoded = StandardCharsets.UTF_8.newEncoder().encode(CharBuffer.wrap(chars));
        byte[] ordinaryEncoder = new byte[encoded.remaining()];
        encoded.get(ordinaryEncoder);
        equal(expected, ordinaryEncoder);
        check(text.equals(new String(expected, StandardCharsets.UTF_8)), "round trip");
    }

    // Independent scalar oracle, including the public encoder's '?' replacement.
    private static byte[] scalar(char[] chars) {
        byte[] result = new byte[chars.length * 3];
        int n = 0;
        for (int i = 0; i < chars.length; i++) {
            int c = chars[i];
            if (c < 0x80) result[n++] = (byte) c;
            else if (c < 0x800) {
                result[n++] = (byte) (0xc0 | (c >>> 6));
                result[n++] = (byte) (0x80 | (c & 63));
            } else if (c >= 0xd800 && c <= 0xdfff) {
                if (c <= 0xdbff && i + 1 < chars.length
                        && chars[i + 1] >= 0xdc00 && chars[i + 1] <= 0xdfff) {
                    int cp = 0x10000 + ((c - 0xd800) << 10) + (chars[++i] - 0xdc00);
                    result[n++] = (byte) (0xf0 | (cp >>> 18));
                    result[n++] = (byte) (0x80 | ((cp >>> 12) & 63));
                    result[n++] = (byte) (0x80 | ((cp >>> 6) & 63));
                    result[n++] = (byte) (0x80 | (cp & 63));
                } else result[n++] = '?';
            } else {
                result[n++] = (byte) (0xe0 | (c >>> 12));
                result[n++] = (byte) (0x80 | ((c >>> 6) & 63));
                result[n++] = (byte) (0x80 | (c & 63));
            }
        }
        return Arrays.copyOf(result, n);
    }

    private static void asciiIsolation() {
        String ascii = "ASCII\u0000boundary";
        long[] before = Utf8Codec.counters0();
        byte[] one = encode(ascii), two = encode(ascii);
        check(one != two, "public ASCII result must be a fresh array");
        one[0] = 0;
        check(two[0] == 'A' && ascii.charAt(0) == 'A', "ASCII result aliases String");
        check(Arrays.equals(delta(before, Utf8Codec.counters0()), new long[3]),
                "ASCII should bypass Latin1 native conversion");
    }

    private static void utf16AndErrors() throws Exception {
        for (String s : new String[] {"\u0100\u20ac", "\ud83d\ude00", "\u00e9\u0100A"}) {
            long[] before = Utf8Codec.counters0();
            equal(scalar(s.toCharArray()), encode(s));
            equal(scalar(s.toCharArray()), SharedSecrets.getJavaLangAccess()
                    .uncheckedGetBytesOrThrow(s, StandardCharsets.UTF_8));
            check(Arrays.equals(delta(before, Utf8Codec.counters0()), new long[3]),
                    "UTF16 should bypass Latin1 native conversion");
        }
        for (String s : new String[] {"\ud800", "\udc00", "A\ud800B", "\ud800\ud800\udc00"}) {
            equal(scalar(s.toCharArray()), encode(s));
            try {
                SharedSecrets.getJavaLangAccess().uncheckedGetBytesOrThrow(s, StandardCharsets.UTF_8);
                throw new AssertionError("strict String encoder accepted an unpaired surrogate");
            } catch (CharacterCodingException expected) { }
            try {
                StandardCharsets.UTF_8.newEncoder().encode(CharBuffer.wrap(s));
                throw new AssertionError("strict CharsetEncoder accepted an unpaired surrogate");
            } catch (CharacterCodingException expected) { }
        }
    }

    private static long[] delta(long[] before, long[] after) {
        return new long[] {after[0] - before[0], after[1] - before[1], after[2] - before[2]};
    }
    private static void equal(byte[] expected, byte[] actual) {
        check(Arrays.equals(expected, actual), "UTF-8 byte mismatch");
    }
    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
