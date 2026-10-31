/*
 * Copyright (c) 2017, 2025, Oracle and/or its affiliates. All rights reserved.
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

 /*
 * @test
 * @requires !jdk.static
 * @run main/othervm/native -Xcheck:jni -Dstdout.encoding=UTF-8 -Dstderr.encoding=UTF-8 StringPlatformChars
 */
import java.util.Arrays;
import java.nio.charset.Charset;

public class StringPlatformChars {

    private static final String JNU_ENCODING = System.getProperty("sun.jnu.encoding");

    public static void main(String... args) throws Exception {
        System.out.println("sun.jnu.encoding: " + JNU_ENCODING);
        System.loadLibrary("stringPlatformChars");
        if (!Arrays.equals(getBytesStrict("a"), new byte[] {'a'})) {
            throw new AssertionError("Strict ASCII platform conversion failed");
        }

        if (!Charset.isSupported(JNU_ENCODING)) {
            if (JNU_ENCODING.equalsIgnoreCase("Cp1252")) {
                // The Windows native helper remains available independently of
                // the public charset provider, and rejects lossy conversions.
                String text = "?\u00e9\u20ac";
                byte[] bytes = {'?', (byte) 0xe9, (byte) 0x80};
                if (!Arrays.equals(bytes, getBytes(text)) || !text.equals(newString(bytes))) {
                    throw new AssertionError("Native Cp1252 mapping mismatch");
                }
                for (String unmappable : new String[] {"\u0081", "\ud83d\ude00"}) {
                    try {
                        getBytes(unmappable);
                        throw new AssertionError("Unmappable character accepted");
                    } catch (IllegalArgumentException expected) { }
                }
            } else {
                // The ASCII subset remains usable for native library names;
                // non-ASCII conversions must fail rather than use UTF-8.
                if (!Arrays.equals(getBytes("ascii"), new byte[] {'a', 's', 'c', 'i', 'i'}) ||
                        !newString(new byte[] {'a'}).equals("a")) {
                    throw new AssertionError("Native ASCII subset mismatch");
                }
                for (String ascii : new String[] {"", "a".repeat(4096), "abc"}) {
                    byte[] expected = ascii.getBytes(java.nio.charset.StandardCharsets.US_ASCII);
                    if (!Arrays.equals(expected, getBytes(ascii)) ||
                            !Arrays.equals(expected, getBytesStrict(ascii))) {
                        throw new AssertionError("Native ASCII conversion failed");
                    }
                }
                if (!Arrays.equals(getBytes("a\u0000bc"), new byte[] {'a'})) {
                    throw new AssertionError("Native NUL termination failed");
                }
                try {
                    getBytesStrict("a\u0000bc");
                    throw new AssertionError("Strict conversion accepted NUL");
                } catch (IllegalArgumentException expected) { }
                try {
                    getBytes("ascii\u20ac");
                    throw new AssertionError("Unsupported native encoding accepted");
                } catch (InternalError expected) {
                    if (!expected.getMessage().contains("Unsupported native filesystem encoding")) {
                        throw expected;
                    }
                }
                try {
                    newString(new byte[] {(byte) 0xe9});
                    throw new AssertionError("Unsupported native decoding accepted");
                } catch (InternalError expected) {
                    if (!expected.getMessage().contains("Unsupported native filesystem encoding")) {
                        throw expected;
                    }
                }
            }
            return;
        }

        // Test varying lengths, provoking different allocation paths
        StringBuilder unicodeSb = new StringBuilder();
        StringBuilder asciiSb = new StringBuilder();
        StringBuilder latinSb = new StringBuilder();

        for (int i = 0; i < 2000; i++) {
            unicodeSb.append('\uFEFE');
            testString(unicodeSb.toString());

            asciiSb.append('x');
            testString(asciiSb.toString());

            latinSb.append('\u00FE');
            testString(latinSb.toString());

            testString(latinSb.toString() + asciiSb.toString() + unicodeSb.toString());
        }

        // Exhaustively test simple Strings made up of all possible chars:
        for (char c = '\u0001'; c < Character.MAX_VALUE; c++) {
            testString(String.valueOf(c));
        }
        // Special case: \u0000 is treated as end-of-string in the native code,
        // so strings with it should be truncated:
        if (getBytes("\u0000abcdef").length != 0 ||
            getBytes("a\u0000bcdef").length != 1) {
            System.out.println("Mismatching values for strings including \\u0000");
            throw new AssertionError();
        }
    }

    private static void testString(String s) throws Exception {
        byte[] nativeBytes = getBytes(s);
        byte[] stringBytes = s.getBytes(JNU_ENCODING);

        if (!Arrays.equals(nativeBytes, stringBytes)) {
            System.out.println("Mismatching values for: '" + s + "' " + Arrays.toString(s.chars().toArray()));
            System.out.println("Native: " + Arrays.toString(nativeBytes));
            System.out.println("String: " + Arrays.toString(stringBytes));
            throw new AssertionError(s);
        }

        String javaNewS = new String(nativeBytes, JNU_ENCODING);
        String nativeNewS = newString(nativeBytes);
        if (!javaNewS.equals(nativeNewS)) {
            System.out.println("New string via native doesn't match via java: '" + javaNewS + "' and '" + nativeNewS + "'");
            throw new AssertionError(s);
        }
    }

    static native byte[] getBytes(String string);

    static native byte[] getBytesStrict(String string);

    static native String newString(byte[] bytes);
}
