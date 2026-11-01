/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

/* @test
 * @summary Exercise retained charsets, including streaming, errors and BOMs
 * @run main ModernCharsetBehavior
 */

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.Writer;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CodingErrorAction;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;

public class ModernCharsetBehavior {
    private static void check(boolean condition, String what) {
        if (!condition) throw new AssertionError(what);
    }

    public static void main(String[] args) throws Exception {
        Path profile = Path.of(System.getProperty("test.src", "."),
                "../../../../../make/data/charsetmapping/modern-profile");
        for (String name : Files.readAllLines(profile)) {
            if (name.isBlank() || name.startsWith("#")) continue;
            Charset cs = Charset.forName(name);
            String sample = name.equals("US-ASCII") ? "A\0Z"
                    : name.equals("ISO-8859-1") ? "A\0éÿ" : "A\0é中文😀Z";
            byte[] expected = sample.getBytes(cs);
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            try (Writer writer = new OutputStreamWriter(bytes, cs)) {
                for (int i = 0; i < sample.length(); i++) {
                    writer.write(sample.charAt(i));
                    writer.flush();
                }
            }
            check(Arrays.equals(expected, bytes.toByteArray()), name + " streaming encode");
            InputStream slow = new ByteArrayInputStream(expected) {
                public synchronized int read(byte[] b, int off, int len) {
                    return super.read(b, off, Math.min(len, 1));
                }
            };
            StringBuilder actual = new StringBuilder();
            try (Reader reader = new InputStreamReader(slow, cs)) {
                for (int ch; (ch = reader.read()) != -1;) actual.append((char)ch);
            }
            check(sample.contentEquals(actual), name + " streaming decode");
            for (boolean direct : new boolean[] { false, true }) {
                ByteBuffer buffer = direct ? ByteBuffer.allocateDirect(expected.length)
                                          : ByteBuffer.allocate(expected.length);
                buffer.put(expected).flip();
                check(cs.newDecoder().decode(buffer).toString().equals(sample), name + " buffer");
            }
            var encoder = cs.newEncoder();
            for (int i = 0; i < 3; i++) {
                encoder.reset();
                ByteBuffer output = ByteBuffer.allocate(expected.length + 16);
                check(encoder.encode(CharBuffer.wrap(sample), output, true).isUnderflow(), name + " encode");
                check(encoder.flush(output).isUnderflow(), name + " flush");
                output.flip();
                byte[] got = new byte[output.remaining()];
                output.get(got);
                check(Arrays.equals(expected, got), name + " reset");
            }
            try {
                cs.newEncoder().encode(CharBuffer.wrap("\ud800"));
                throw new AssertionError(name + " accepted unpaired surrogate");
            } catch (CharacterCodingException expectedError) { }
            check(cs.newEncoder().onMalformedInput(CodingErrorAction.REPLACE)
                    .encode(CharBuffer.wrap("\ud800")).hasRemaining(), name + " replacement");
        }
        check(Arrays.equals("A".getBytes("UTF-16"), new byte[] {(byte)0xfe,(byte)0xff,0,65}), "UTF-16 BOM");
        check(Arrays.equals("A".getBytes("x-UTF-16LE-BOM"), new byte[] {(byte)0xff,(byte)0xfe,65,0}), "UTF-16LE BOM");
        check(Arrays.equals("A".getBytes("X-UTF-32BE-BOM"), new byte[] {0,0,(byte)0xfe,(byte)0xff,0,0,0,65}), "UTF-32BE BOM");
        check(Arrays.equals("A".getBytes("X-UTF-32LE-BOM"), new byte[] {(byte)0xff,(byte)0xfe,0,0,65,0,0,0}), "UTF-32LE BOM");
        try {
            Charset.forName("UTF-8").newDecoder().decode(ByteBuffer.wrap(new byte[] {(byte)0xc0,(byte)0x80}));
            throw new AssertionError("UTF-8 accepted overlong NUL");
        } catch (CharacterCodingException expected) { }
    }
}
