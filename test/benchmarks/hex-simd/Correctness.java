/* Copyright (c) 2026, Harry Chan. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0 */
import java.nio.CharBuffer;
import java.util.*;
import java.util.function.Supplier;
import jdk.internal.util.HexFormatSupport;

public class Correctness {
    private static int checks;
    private static final Random RANDOM = new Random(0x483358);

    private static Object result(Supplier<?> f) {
        try {
            Object value = f.get();
            return value instanceof byte[] b ? Arrays.toString(b) : value;
        } catch (RuntimeException e) {
            return e.getClass().getName() + ":" + e.getMessage();
        }
    }
    private static void same(Supplier<?> expected, Supplier<?> actual) {
        Object a = result(expected), b = result(actual);
        checks++;
        if (!Objects.equals(a, b)) throw new AssertionError("check " + checks + " expected " + a + " got " + b);
    }
    private static void decode(CharSequence s, int from, int to) {
        same(() -> HexFormatReference.of().parseHex(s, from, to), () -> HexFormat.of().parseHex(s, from, to));
    }
    private static void bytes(int n) {
        byte[] src = new byte[n + 17];
        RANDOM.nextBytes(src);
        for (boolean upper : new boolean[]{false, true}) {
            HexFormat h = upper ? HexFormat.of().withUpperCase() : HexFormat.of();
            HexFormatReference r = upper ? HexFormatReference.of().withUpperCase() : HexFormatReference.of();
            same(() -> r.formatHex(src, 7, 7 + n), () -> h.formatHex(src, 7, 7 + n));
            String s = r.formatHex(src, 7, 7 + n);
            decode(s, 0, s.length());
            decode("!!" + s + "?", 2, 2 + s.length());
            same(() -> r.formatHex(new StringBuilder(), src, 7, 7 + n).toString(),
                 () -> h.formatHex(new StringBuilder(), src, 7, 7 + n).toString());
            if (n > 0) {
                char[] chars = s.toCharArray();
                for (int pos : new int[]{0, s.length() / 2, s.length() - 1}) {
                    char saved = chars[pos];
                    chars[pos] = '\u00ff';
                    decode(new String(chars), 0, chars.length);
                    chars[pos] = '\u1234';
                    decode(new String(chars), 0, chars.length);
                    chars[pos] = saved;
                }
            }
        }
    }
    private static boolean checkDecodeRoute() {
        // Availability alone does not prove entry into decode0. A successful
        // direct call does: decode has no Java implementation in the helper.
        String valid = "Aa".repeat(HexFormatSupport.DECODE_MIN);
        byte[] dst = new byte[valid.length() / 2];
        Arrays.fill(dst, (byte)0x5b);
        boolean routed = HexFormatSupport.decode(valid, dst);
        String expected = System.getProperty("hexsimd.expectDecodeNative");
        if (expected == null || routed != Boolean.parseBoolean(expected))
            throw new AssertionError("wrong decode route: " + routed + "; expected " + expected);
        for (byte b : dst) {
            if (b != (routed ? (byte)0xaa : (byte)0x5b))
                throw new AssertionError("wrong decode route output");
        }
        return routed;
    }
    private static void invalidBoundaries(boolean nativeDecode) {
        // Both nibbles around vector widths and the 8192-character JNI input
        // chunk boundary. A failure in the second chunk must leave the already
        // copied first chunk private; public parsing must still replay Java.
        char[] chars = new char[8320];
        Arrays.fill(chars, 'A');
        for (int pair : new int[]{0,14,16,30,32,62,64,126,128,254,256,8190,8192,8194,8318}) {
            for (int nibble = 0; nibble < 2; nibble++) {
                int pos = pair + nibble;
                for (int c = 0; c <= 255; c++) {
                    if (HexFormat.isHexDigit(c)) continue;
                    chars[pos] = (char)c;
                    String s = new String(chars);
                    byte[] dst = new byte[chars.length / 2];
                    Arrays.fill(dst, (byte)0x5b);
                    if (HexFormatSupport.decode(s, dst))
                        throw new AssertionError("accepted invalid Latin1 at " + pos + ": " + c);
                    for (int i = 0; i < dst.length; i++) {
                        byte expected = nativeDecode && pos >= 8192 && i < 4096
                                ? (byte)0xaa : (byte)0x5b;
                        if (dst[i] != expected)
                            throw new AssertionError("wrong private chunk copy at " + pos + ": " + c);
                    }
                    decode(s, 0, s.length());
                }
                // UTF16 is intentionally ineligible, even after a valid first
                // chunk: no part of the private destination may be touched.
                chars[pos] = '\u1234';
                String utf16 = new String(chars);
                byte[] dst = new byte[chars.length / 2];
                Arrays.fill(dst, (byte)0x5b);
                if (HexFormatSupport.decode(utf16, dst))
                    throw new AssertionError("UTF16 entered native decoder");
                for (byte b : dst) {
                    if (b != (byte)0x5b) throw new AssertionError("UTF16 fallback wrote output");
                }
                decode(utf16, 0, utf16.length());
                chars[pos] = 'A';
            }
        }
    }
    public static void main(String[] args) throws Exception {
        String expected = System.getProperty("hexsimd.expectNative");
        if (expected != null && HexFormatSupport.isAvailable() != Boolean.parseBoolean(expected))
            throw new AssertionError("wrong native availability");
        boolean nativeDecode = checkDecodeRoute();
        for (int n = 0; n <= 160; n++) bytes(n);
        for (int n : new int[]{255,256,257,511,512,513,1023,1024,1025,4095,4096,4097,8191,8192,8193,65536,1048576}) bytes(n);
        for (int i = 0; i < 1000; i++) bytes(RANDOM.nextInt(4000));
        // Every code unit, with enough characters to enter public native decode
        // for eligible Latin1 Strings. UTF16 deliberately checks Java fallback.
        for (int c = 0; c < 65536; c++) {
            char[] s = new char[2 * HexFormatSupport.DECODE_MIN];
            Arrays.fill(s, 'A');
            s[c % s.length] = (char)c;
            decode(new String(s), 0, s.length);
        }
        invalidBoundaries(nativeDecode);
        for (String s : new String[]{"", "0", "xyz", "0g", "g0", "00\n0", "aAbB09", "000\u1234"}) {
            decode(s, 0, s.length());
            decode(new StringBuilder(s), 0, s.length());
            decode(CharBuffer.wrap(s), 0, s.length());
            same(() -> HexFormatReference.of().parseHex(s.toCharArray(), 0, s.length()),
                 () -> HexFormat.of().parseHex(s.toCharArray(), 0, s.length()));
        }
        for (int[] range : new int[][]{{-1,0},{0,4},{2,1},{0,-1},{0,Integer.MAX_VALUE}}) {
            decode("00", range[0], range[1]);
            same(() -> HexFormatReference.of().formatHex(new byte[2], range[0], range[1]),
                 () -> HexFormat.of().formatHex(new byte[2], range[0], range[1]));
        }
        same(() -> HexFormatReference.of().formatHex(null, -1, -2), () -> HexFormat.of().formatHex(null, -1, -2));
        decode(null, -1, -2);
        same(() -> HexFormatReference.of().parseHex((CharSequence)null), () -> HexFormat.of().parseHex((CharSequence)null));
        same(() -> HexFormatReference.of().formatHex((Appendable)null, null, -1, -2),
             () -> HexFormat.of().formatHex((Appendable)null, null, -1, -2));
        for (String delimiter : new String[]{"", ":", "--", "\u1234"}) {
            for (String prefix : new String[]{"", "["}) {
                HexFormat h = HexFormat.ofDelimiter(delimiter).withPrefix(prefix).withSuffix("]");
                HexFormatReference r = HexFormatReference.ofDelimiter(delimiter).withPrefix(prefix).withSuffix("]");
                byte[] src = new byte[129]; RANDOM.nextBytes(src);
                same(() -> r.formatHex(src), () -> h.formatHex(src));
                String s = r.formatHex(src);
                same(() -> r.parseHex(s), () -> h.parseHex(s));
                same(() -> r.parseHex(s + "!"), () -> h.parseHex(s + "!"));
            }
            HexFormat h = HexFormat.ofDelimiter(delimiter);
            HexFormatReference r = HexFormatReference.ofDelimiter(delimiter);
            same(() -> r.formatHex(new byte[64]), () -> h.formatHex(new byte[64]));
        }
        // Encourage relocation between bounded region-copy calls. No native pointer
        // may survive return, under any of the supported collectors.
        Thread collector = Thread.ofPlatform().start(() -> { for (int i = 0; i < 12; i++) System.gc(); });
        for (int i = 0; i < 30; i++) bytes(131073);
        collector.join();
        System.out.println("PASS " + checks + " differential checks; nativeAvailable=" +
                HexFormatSupport.isAvailable() + "; nativeDecode=" + nativeDecode);
    }
}
