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
import java.nio.CharBuffer;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.test.lib.util.StringCodingAccess;

public class CharsetEncoderAOTApp {
    public static void main(String[] args) throws Exception {
        boolean leaf = args[0].equals("leaf");
        CharsetEncoder encoder = StandardCharsets.UTF_8.newEncoder();
        Field ready = encoder.getClass().getDeclaredField("utf8Ready");
        ready.setAccessible(true);
        if (ready.getBoolean(null)) throw new AssertionError("archived native readiness");
        char[] chars = new char[2048]; Arrays.fill(chars, '\u4e2d');
        CharBuffer src = CharBuffer.wrap(chars);
        ByteBuffer dst = ByteBuffer.allocate(chars.length * 3);
        // Warm the actual public origin; no direct Charset native setup.
        for (int i = 0; i < 20_000; ++i) encode(encoder, src, dst);
        long[] before = StringCodingAccess.counters0();
        for (int i = 0; i < 100; ++i) encode(encoder, src, dst);
        long[] after = StringCodingAccess.counters0();
        if (after[3] - before[3] != (leaf ? 100 : 0) || after[4] != before[4]) {
            throw new AssertionError("AOT Charset route: " + Arrays.toString(before) + " -> " + Arrays.toString(after));
        }
        if (ready.getBoolean(null) != leaf) throw new AssertionError("fresh process registration");
        System.out.println("CHARSET_ENCODER_AOT_OK initialReady=false leaf=" + leaf);
    }

    private static void encode(CharsetEncoder encoder, CharBuffer src, ByteBuffer dst) {
        encoder.reset(); src.clear(); dst.clear();
        if (!encoder.encode(src, dst, true).isUnderflow() || src.hasRemaining() || dst.hasRemaining()) {
            throw new AssertionError("AOT public positions");
        }
        for (int i = 0; i < dst.position(); i += 3) {
            if ((dst.get(i) & 255) != 0xe4 || (dst.get(i + 1) & 255) != 0xb8 ||
                    (dst.get(i + 2) & 255) != 0xad) throw new AssertionError("AOT public bytes");
        }
    }
}
