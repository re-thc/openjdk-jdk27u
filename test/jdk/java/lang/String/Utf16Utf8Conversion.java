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
 * @summary Public UTF16 String encoding preserves UTF-8 bytes, bounds and strict error offsets
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.gc.Serial & vm.compiler1.enabled & vm.compiler2.enabled
 * @library /test/lib
 * @modules java.base/java.lang:+open java.base/jdk.internal.access
 * @run main/othervm -Xint -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters -XX:+UseG1GC Utf16Utf8Conversion leaf 16
 * @run main/othervm -Xint -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters -XX:+UseG1GC -XX:-UseTmfyStringCoding Utf16Utf8Conversion jni 16
 * @run main/othervm -Xint -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters -XX:+UseG1GC -XX:DisableIntrinsic=_tmfy_encodeUtf16Utf8 Utf16Utf8Conversion jni 16
 * @run main/othervm -Xint -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters -XX:+UseSerialGC Utf16Utf8Conversion jni 16
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters -XX:+UseG1GC Utf16Utf8Conversion leaf 64
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters -XX:+UseG1GC -XX:-UseTmfyStringCoding Utf16Utf8Conversion java 0
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters -XX:+UseG1GC -XX:DisableIntrinsic=_tmfy_encodeUtf16Utf8 Utf16Utf8Conversion jni 64
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters -XX:+UseSerialGC Utf16Utf8Conversion java 0
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters -XX:+UseG1GC Utf16Utf8Conversion leaf 64
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters -XX:+UseG1GC -XX:-UseTmfyStringCoding Utf16Utf8Conversion java 0
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters -XX:+UseG1GC -XX:DisableIntrinsic=_tmfy_encodeUtf16Utf8 Utf16Utf8Conversion jni 64
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters -XX:+UseSerialGC Utf16Utf8Conversion java 0
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:-CompactStrings -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters Utf16Utf8Conversion leaf 64
 */

import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CoderResult;
import java.nio.charset.StandardCharsets;
import java.nio.charset.UnmappableCharacterException;
import java.util.Arrays;
import jdk.internal.access.SharedSecrets;
import jdk.test.lib.util.StringCodingAccess;

public class Utf16Utf8Conversion {
    private static final int[] LENGTHS = {0, 1, 7, 8, 15, 16, 17, 31, 32, 63, 64, 65,
            127, 128, 2047, 2048, 2049, 4096};
    private static String mode;
    private static int minimumUnits;

    public static void main(String[] args) throws Exception {
        check(args.length == 2, "expected dispatch route and minimum UTF16 units");
        mode = args[0];
        minimumUnits = Integer.parseInt(args[1]);
        check(mode.equals("leaf") || mode.equals("jni") || mode.equals("java"), "unknown dispatch route");
        check(mode.equals("java") ? minimumUnits == 0 : minimumUnits == 16 || minimumUnits == 64,
                "unexpected minimum UTF16 units");
        String hot = "\u4e2d\u20ac\ud83d\ude00\u0000A".repeat(16);
        byte[] expected = scalar(hot.toCharArray());
        // Establish readiness before warmup: this fixture measures initialized
        // dispatch. The separate tier-admission fixtures test cold compilation.
        long[] before = StringCodingAccess.counters0();
        if (mode.equals("java")) {
            for (int i = 0; i < 20_000; i++) equal(expected, encode(hot));
            before = StringCodingAccess.counters0();
        }
        for (int i = 0; i < 20_000; i++) equal(expected, encode(hot));
        long[] calls = delta(before);
        route(calls, 20_000);
        for (int n : LENGTHS) {
            char[] chars = new char[n];
            Arrays.fill(chars, '\u4e2d');
            verify(chars);
            // Mixed NUL, ASCII, Latin1, BMP boundaries and CJK, retaining UTF16 storage.
            char[] units = {'\u0000', 'A', '\u007f', '\u0080', '\u00ff', '\u0100',
                    '\u07ff', '\u0800', '\ud7ff', '\ue000', '\uffff', '\u4e2d'};
            for (int i = 0; i < n; i++) chars[i] = units[i % units.length];
            if (n > 0) chars[0] = '\u4e2d';
            verify(chars);
            // Valid pairs crossing vector and eligibility boundaries.
            for (int at : new int[] {0, 1, 7, 8, 15, 16, 31, 32, n / 2, n - 2}) {
                if (at < 0 || at + 1 >= n) continue;
                Arrays.fill(chars, '\u4e2d');
                chars[at] = '\ud800'; chars[at + 1] = '\udc00';
                verify(chars);
                chars[at] = '\udbff'; chars[at + 1] = '\udfff';
                verify(chars);
            }
            for (int at : new int[] {0, 1, 7, 8, 15, 16, 31, n / 2, n - 2, n - 1}) {
                if (at < 0 || at >= n) continue;
                for (char bad : new char[] {'\ud800', '\udbff', '\udc00', '\udfff'}) {
                    Arrays.fill(chars, '\u4e2d');
                    chars[at] = bad;
                    verify(chars);
                }
                if (at + 1 < n) {
                    Arrays.fill(chars, '\u4e2d');
                    chars[at] = '\udc00'; chars[at + 1] = '\ud800';
                    verify(chars);
                }
            }
        }
        // The first malformed index must remain a UTF16 unit offset after a valid pair.
        verify(("\ud83d\ude00".repeat(8) + "\ud800Z").toCharArray());
        verify(("\u4e2d".repeat(2047) + "\ud800\udc00").toCharArray());
        System.out.println("STRING_UTF16_UTF8_OK mode=" + mode + " minimumUnits=" + minimumUnits
                + " public_calls=" + Arrays.toString(calls));
    }

    private static byte[] encode(String value) { return value.getBytes(StandardCharsets.UTF_8); }

    private static void verify(char[] chars) throws Exception {
        String text = new String(chars);
        byte[] expected = scalar(chars);
        int malformed = firstMalformed(chars);
        // Compiled supported origins use 64, including DisableIntrinsic JNI.
        // Unsupported compiled origins retain Java. Interpreter minimum is 16.
        int attempts = !mode.equals("java") && chars.length >= minimumUnits
                && chars.length <= 2048 ? 1 : 0;
        long[] before = StringCodingAccess.counters0();
        byte[] actual = encode(text);
        route(delta(before), attempts);
        equal(expected, actual);
        equal(expected, text.getBytes("UTF-8"));
        // Public results remain separate arrays, including exact-sized native output.
        byte[] another = encode(text);
        check(actual != another, "public encoder reused output array");
        if (actual.length > 0) {
            actual[0] ^= 1;
            equal(expected, another);
            equal(expected, encode(text));
        }
        strict(text, malformed, false, expected);
        strict(text, malformed, true, expected);
        CharBuffer input = CharBuffer.wrap(chars);
        ByteBuffer output = ByteBuffer.allocate(chars.length * 3 + 1);
        CoderResult result = StandardCharsets.UTF_8.newEncoder().encode(input, output, true);
        if (malformed >= 0) {
            check(result.isMalformed() && result.length() == 1 && input.position() == malformed,
                    "CharsetEncoder malformed index/type/length changed");
        } else {
            check(result.isUnderflow(), "CharsetEncoder rejected valid UTF16");
            equal(expected, Arrays.copyOf(output.array(), output.position()));
            check(text.equals(new String(expected, StandardCharsets.UTF_8)), "round trip");
        }
    }

    private static void strict(String text, int malformed, boolean utf8Only, byte[] expected) throws Exception {
        long[] before = StringCodingAccess.counters0();
        try {
            byte[] bytes = utf8Only ? SharedSecrets.getJavaLangAccess().getBytesUTF8OrThrow(text)
                    : SharedSecrets.getJavaLangAccess().uncheckedGetBytesOrThrow(text, StandardCharsets.UTF_8);
            check(malformed < 0, "strict encoder accepted malformed UTF16");
            equal(expected, bytes);
        } catch (UnmappableCharacterException e) {
            check(malformed >= 0 && e.getInputLength() == 1, "strict exception type/length");
            check(e.getCause() instanceof IllegalArgumentException
                    && e.getCause().getMessage().equals("malformed input offset : " + malformed + ", length : 1"),
                    "strict malformed UTF16 offset");
        }
        check(Arrays.equals(delta(before), new long[3]), "strict encoder dispatched native replacement");
    }
    private static int firstMalformed(char[] chars) {
        for (int i = 0; i < chars.length; i++) {
            char c = chars[i];
            if (Character.isHighSurrogate(c)) {
                if (i + 1 == chars.length || !Character.isLowSurrogate(chars[i + 1])) return i;
                i++;
            } else if (Character.isLowSurrogate(c)) return i;
        }
        return -1;
    }
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

    private static long[] delta(long[] before) {
        long[] after = StringCodingAccess.counters0();
        return new long[] {after[0] - before[0], after[1] - before[1], after[2] - before[2]};
    }
    private static void route(long[] calls, int expected) {
        long[] wanted = switch (mode) {
            case "leaf" -> new long[] {expected, 0, 0};
            case "jni" -> new long[] {0, expected, 0};
            case "java" -> new long[3];
            default -> throw new AssertionError("unknown dispatch route");
        };
        check(Arrays.equals(calls, wanted), "UTF16 route: " + Arrays.toString(calls)
                + " expected " + Arrays.toString(wanted));
    }
    private static void equal(byte[] expected, byte[] actual) {
        check(Arrays.equals(expected, actual), "UTF-8 byte mismatch");
    }
    private static void check(boolean ok, String message) {
        if (!ok) throw new AssertionError(message);
    }
}
