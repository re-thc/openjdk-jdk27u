/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */
import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Random;

/**
 * Standalone reference-corpus generator for unicodeReplacementKernel.cpp.
 * Run on an unmodified JDK. It exercises the public String replacement APIs;
 * input/output UTF16 units in the file use big endian for platform independence.
 *
 * javac -d build/tmfy-deps/tests UnicodeReplacementOracle.java
 * java -cp build/tmfy-deps/tests UnicodeReplacementOracle build/tmfy-deps/tests/unicode.bin
 *
 * A fresh corpus is required after changes. This is not a timed benchmark.
 */
public class UnicodeReplacementOracle {
    private static DataOutputStream output;
    private static long records;

    private static byte[] utf16(char[] chars) {
        byte[] bytes = new byte[2 * chars.length];
        for (int i = 0; i < chars.length; ++i) {
            bytes[2 * i] = (byte) (chars[i] >>> 8);
            bytes[2 * i + 1] = (byte) chars[i];
        }
        return bytes;
    }

    private static void record(int operation, byte[] input, byte[] expected) throws Exception {
        output.writeByte(operation);
        output.writeInt(input.length);
        output.write(input);
        output.writeInt(expected.length);
        output.write(expected);
        records++;
    }

    private static void decode(byte[] input) throws Exception {
        record(3, input, utf16(new String(input, StandardCharsets.UTF_8).toCharArray()));
    }

    private static void encode(char[] input) throws Exception {
        record(2, utf16(input), new String(input).getBytes(StandardCharsets.UTF_8));
    }

    private static void latin1(byte[] input) throws Exception {
        record(1, input, new String(input, StandardCharsets.ISO_8859_1).getBytes(StandardCharsets.UTF_8));
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 1) throw new IllegalArgumentException("one corpus output path required");
        try (DataOutputStream stream = new DataOutputStream(
                new BufferedOutputStream(new FileOutputStream(args[0])))) {
            output = stream;
            output.writeBytes("TMFYUNI2");
            latin1(new byte[0]);
            encode(new char[0]);
            decode(new byte[0]);
            for (int i = 0; i < 256; ++i) {
                latin1(new byte[] {(byte) i});
                decode(new byte[] {(byte) i});
                for (int j = 0; j < 256; ++j) decode(new byte[] {(byte) i, (byte) j});
            }
            for (int c = 0; c <= 0xffff; ++c) encode(new char[] {(char) c});
            // Every 3-byte candidate starting with a 3-byte lead, including
            // surrogate encodings, overlong forms, and invalid continuations.
            for (int a = 0xe0; a <= 0xef; ++a) {
                for (int b = 0; b < 256; ++b) {
                    for (int c = 0; c < 256; ++c) decode(new byte[] {(byte) a, (byte) b, (byte) c});
                }
            }
            int[] tails = {0, 0x41, 0x7f, 0x80, 0x8f, 0x90, 0x9f, 0xa0, 0xbf, 0xc0, 0xef, 0xff};
            for (int a = 0xf0; a <= 0xff; ++a) {
                for (int b = 0; b < 256; ++b) {
                    for (int c : tails) {
                        decode(new byte[] {(byte) a, (byte) b, (byte) c});
                        for (int d : tails) decode(new byte[] {(byte) a, (byte) b, (byte) c, (byte) d});
                    }
                }
            }
            int[] sizes = {0, 1, 2, 3, 7, 8, 15, 16, 17, 31, 32, 33, 63, 64, 65,
                           127, 128, 129, 255, 256, 257, 511, 512, 1023, 1024, 2047, 2048, 4095, 4096};
            byte[][] errors = {{(byte)0xed, (byte)0xa0, (byte)0x80},
                               {(byte)0xe0, (byte)0x80, (byte)0x80},
                               {(byte)0xf0, (byte)0x90, (byte)0x80},
                               {(byte)0xf4, (byte)0x90, (byte)0x80, (byte)0x80},
                               {(byte)0xe1, (byte)0x80, 0x41},
                               {(byte)0xf1, (byte)0x80, (byte)0x80, 0x41}};
            Random random = new Random(0x544d4659554e494cL);
            for (int n : sizes) {
                byte[] bytes = new byte[n];
                random.nextBytes(bytes);
                latin1(bytes);
                decode(bytes);
                Arrays.fill(bytes, (byte) 'a');
                decode(bytes);
                for (byte[] error : errors) {
                    for (int at : new int[] {0, n / 2, Math.max(0, n - error.length)}) {
                        byte[] malformed = bytes.clone();
                        System.arraycopy(error, 0, malformed, at, Math.min(error.length, n - at));
                        decode(malformed);
                    }
                }
                if (n <= 2048) {
                    for (char c : new char[] {'a', 0xff, 0x100, 0x7ff, 0x800, 0xd800, 0xdc00, 0xffff}) {
                        char[] chars = new char[n];
                        Arrays.fill(chars, c);
                        encode(chars);
                    }
                    for (int at : new int[] {0, n / 2, Math.max(0, n - 1)}) {
                        char[] chars = new char[n];
                        Arrays.fill(chars, '\u20ac');
                        if (n != 0) chars[at] = '\ud800';
                        encode(chars);
                    }
                }
            }
            for (int trial = 0; trial < 12000; ++trial) {
                byte[] bytes = new byte[random.nextInt(4097)];
                random.nextBytes(bytes);
                decode(bytes);
                char[] chars = new char[random.nextInt(2049)];
                for (int i = 0; i < chars.length; ++i) chars[i] = (char) random.nextInt(65536);
                encode(chars);
                // Valid mixed BMP/supplementary UTF8 inputs exercise vector
                // boundaries without requiring a second decoder oracle.
                byte[] valid = new String(chars).getBytes(StandardCharsets.UTF_8);
                decode(Arrays.copyOf(valid, Math.min(valid.length, 4096)));
            }
            // A clean EOF between records must not validate a truncated corpus.
            output.writeByte(0);
            output.writeLong(records);
        }
        System.out.println("Public String oracle records=" + records + " java=" + System.getProperty("java.version"));
    }
}
