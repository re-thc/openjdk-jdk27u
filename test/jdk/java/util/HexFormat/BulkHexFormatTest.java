/* Copyright (c) 2026, Harry Chan. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only */
/*
 * @test
 * @summary Bulk HexFormat conversion preserves bounds, validation and GC-safe array access
 * @modules java.base/jdk.internal.util
 * @run main/othervm -Xcheck:jni BulkHexFormatTest
 */
import java.util.Arrays;
import java.util.HexFormat;
import java.util.Random;
import jdk.internal.util.HexFormatSupport;

public class BulkHexFormatTest {
    private static void require(boolean value) {
        if (!value) throw new AssertionError();
    }
    public static void main(String[] args) throws Exception {
        String expected = System.getProperty("hexsimd.expectNative");
        if (expected != null) require(HexFormatSupport.isAvailable() == Boolean.parseBoolean(expected));
        HexFormat h = HexFormat.of();
        Random random = new Random(42);
        for (int n : new int[]{0,1,15,16,31,32,63,64,127,128,255,256,511,512,1023,1024,4095,4096,4097,8191,8192,8193,65536,1048576}) {
            byte[] input = new byte[n + 17]; random.nextBytes(input);
            byte[] copy = input.clone(), wanted = Arrays.copyOfRange(input, 7, 7 + n);
            String text = h.formatHex(input, 7, 7 + n);
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
        // Small platform stacks exercise the fixed 12 KiB scratch frames.
        Thread small = new Thread(null, () -> {
            byte[] bytes = new byte[131073];
            for (int i = 0; i < 100; i++) require(Arrays.equals(bytes, h.parseHex(h.formatHex(bytes))));
        }, "hex-small-stack", 192 * 1024);
        small.setUncaughtExceptionHandler((t, e) -> { e.printStackTrace(); System.exit(1); });
        Thread collector = new Thread(() -> { for (int i = 0; i < 20; i++) System.gc(); });
        small.start(); collector.start(); small.join(); collector.join();
        System.out.println("PASS nativeAvailable=" + HexFormatSupport.isAvailable());
    }
}
