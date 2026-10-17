/* Copyright (c) 2026, Harry Chan. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only */
/*
 * @test
 * @summary Bulk HexFormat conversion preserves bounds, validation and GC-safe array access
 * @modules java.base/jdk.internal.util
 * @run main/othervm -Xms128m -Xmx512m -XX:ActiveProcessorCount=2 -Xcheck:jni -XX:+CompactStrings BulkHexFormatTest true
 * @run main/othervm -Xms128m -Xmx512m -XX:ActiveProcessorCount=2 -Xcheck:jni -XX:-CompactStrings BulkHexFormatTest false
 */
import java.util.Arrays;
import java.util.HexFormat;
import java.util.Random;
import java.util.Locale;
import jdk.internal.util.HexFormatSupport;

public class BulkHexFormatTest {
    private static void require(boolean value) {
        if (!value) throw new AssertionError();
    }

    private static String invalid(CharSequence text) {
        try {
            HexFormat.of().parseHex(text);
            throw new AssertionError("malformed input accepted");
        } catch (IllegalArgumentException expected) {
            return expected.getClass().getName() + ":" + expected.getMessage();
        }
    }

    private static boolean checkDecodeRoute(boolean compact) {
        // Availability alone does not prove that decode0 was entered.
        byte[] result = new byte[HexFormatSupport.DECODE_MIN];
        Arrays.fill(result, (byte)0x5b);
        boolean routed = HexFormatSupport.decode("Aa".repeat(result.length), result);
        require(routed == (compact && HexFormatSupport.isAvailable()));
        for (byte b : result) require(b == (routed ? (byte)0xaa : (byte)0x5b));
        return routed;
    }

    private static void invalidCodeUnits() {
        char[] chars = new char[2 * HexFormatSupport.DECODE_MIN];
        Arrays.fill(chars, 'A');
        for (int c = 0; c <= Character.MAX_VALUE; c++) {
            if (HexFormat.isHexDigit(c)) continue;
            int pos = c % chars.length;
            chars[pos] = (char)c;
            // The one-byte parse stays below the native cutoff and supplies
            // the existing Java parser's exact exception class and diagnostic.
            require(invalid("0" + (char)c).equals(invalid(new String(chars))));
            chars[pos] = 'A';
        }
    }

    private static void invalidBoundaries(boolean nativeDecode) {
        char[] chars = new char[8320];
        Arrays.fill(chars, 'A');
        for (int pair : new int[]{0,14,16,30,32,62,64,126,128,254,256,8190,8192,8194,8318}) {
            for (int nibble = 0; nibble < 2; nibble++) {
                int pos = pair + nibble;
                for (int c = 0; c <= 255; c++) {
                    if (HexFormat.isHexDigit(c)) continue;
                    chars[pos] = (char)c;
                    String text = new String(chars);
                    byte[] dst = new byte[chars.length / 2];
                    Arrays.fill(dst, (byte)0x5b);
                    require(!HexFormatSupport.decode(text, dst));
                    for (int i = 0; i < dst.length; i++) {
                        // Only completed chunks may have reached this private
                        // destination; failed scratch output must stay native.
                        byte expected = nativeDecode && pos >= 8192 && i < 4096
                                ? (byte)0xaa : (byte)0x5b;
                        require(dst[i] == expected);
                    }
                    require(invalid("0" + (char)c).equals(invalid(text)));
                }
                // UTF16 deliberately takes Java fallback, even when the
                // ineligible code unit appears after a whole valid chunk.
                chars[pos] = '\u1234';
                String utf16 = new String(chars);
                byte[] dst = new byte[chars.length / 2];
                Arrays.fill(dst, (byte)0x5b);
                require(!HexFormatSupport.decode(utf16, dst));
                for (byte b : dst) require(b == (byte)0x5b);
                require(invalid("0\u1234").equals(invalid(utf16)));
                chars[pos] = 'A';
            }
        }
    }

    public static void main(String[] args) throws Exception {
        require(args.length == 1 && (args[0].equals("true") || args[0].equals("false")));
        String expected = System.getProperty("hexsimd.expectNative");
        if (expected != null) require(HexFormatSupport.isAvailable() == Boolean.parseBoolean(expected));
        boolean nativeDecode = checkDecodeRoute(Boolean.parseBoolean(args[0]));
        HexFormat h = HexFormat.of();
        Random random = new Random(42);
        for (int n : new int[]{0,1,15,16,31,32,63,64,127,128,255,256,511,512,1023,1024,4095,4096,4097,8191,8192,8193,65536,1048576}) {
            byte[] input = new byte[n + 17]; random.nextBytes(input);
            byte[] copy = input.clone(), wanted = Arrays.copyOfRange(input, 7, 7 + n);
            String text = h.formatHex(input, 7, 7 + n);
            StringBuilder scalar = new StringBuilder(2 * n);
            for (byte b : wanted) scalar.append(h.toHexDigits(b));
            require(text.contentEquals(scalar));
            require(h.withUpperCase().formatHex(wanted).equals(text.toUpperCase(Locale.ROOT)));
            require(h.formatHex(new StringBuilder(), input, 7, 7 + n).toString().equals(text));
            require(Arrays.equals(wanted, h.parseHex(text)));
            require(Arrays.equals(wanted, h.parseHex("!!" + text + "!!", 2, 2 + text.length())));
            require(Arrays.equals(wanted, h.parseHex(new StringBuilder(text))));
            require(Arrays.equals(wanted, h.parseHex(text.toCharArray(), 0, text.length())));
            require(Arrays.equals(wanted, h.parseHex(h.withUpperCase().formatHex(wanted))));
            require(Arrays.equals(input, copy));
            if (n > 0) {
                for (int index : new int[]{0, text.length()/2, text.length()-1}) {
                    String bad = text.substring(0, index) + "g" + text.substring(index + 1);
                    try { h.parseHex(bad); throw new AssertionError(); }
                    catch (IllegalArgumentException invalid) {
                        require(invalid.getMessage().equals("not a hexadecimal digit: \"g\" = 103"));
                    }
                }
            }
        }
        invalidCodeUnits();
        invalidBoundaries(nativeDecode);
        // Request a small platform stack to exercise bounded scratch frames.
        // The VM may round the requested size up to its platform minimum.
        Thread small = new Thread(null, () -> {
            byte[] bytes = new byte[131073];
            for (int i = 0; i < 100; i++) require(Arrays.equals(bytes, h.parseHex(h.formatHex(bytes))));
        }, "hex-small-stack", 192 * 1024);
        small.setUncaughtExceptionHandler((t, e) -> { e.printStackTrace(); System.exit(1); });
        Thread collector = new Thread(() -> { for (int i = 0; i < 20; i++) System.gc(); });
        small.start(); collector.start(); small.join(); collector.join();
        System.out.println("PASS nativeAvailable=" + HexFormatSupport.isAvailable() + "; nativeDecode=" + nativeDecode);
    }
}
