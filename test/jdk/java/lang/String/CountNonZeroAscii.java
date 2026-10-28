/*
 * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
 * Copyright (c) 2024, Alibaba Group Holding Limited. All Rights Reserved.
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
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

import jdk.internal.access.JavaLangAccess;
import jdk.internal.access.SharedSecrets;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;

/*
 * @test
 * @modules java.base/jdk.internal.access
 * @summary test Latin1 and UTF16 String countNonZeroAscii
 * @run main/othervm -XX:+CompactStrings CountNonZeroAscii
 */
public class CountNonZeroAscii {
    private static final JavaLangAccess JLA = SharedSecrets.getJavaLangAccess();

    public static void main(String [] args) {
        byte[] bytes = new byte[1000];

        Arrays.fill(bytes, (byte) 'A');
        String s = new String(bytes, StandardCharsets.ISO_8859_1);
        assertEquals(bytes.length, JLA.countNonZeroAscii(s));

        for (int i = 0; i < bytes.length; i++) {
            for (int j = Byte.MIN_VALUE; j <= 0; j++) {
                bytes[i] = (byte) j;
                s = new String(bytes, StandardCharsets.ISO_8859_1);
                assertEquals(i, JLA.countNonZeroAscii(s));
            }
            bytes[i] = (byte) 'A';
        }

        // Keep a non-Latin1 suffix so these prefixes exercise the UTF16 path.
        for (int i = 0; i <= bytes.length; i++) {
            String prefix = "A".repeat(i);
            assertEquals(i, JLA.countNonZeroAscii(prefix + '\u0100'));
            assertEquals(i, JLA.countNonZeroAscii(prefix + '\0' + '\u0100'));
            assertEquals(i, JLA.countNonZeroAscii(prefix + '\u0080' + '\u0100'));
        }
    }

    static void assertEquals(int expected, int actual) {
        if (expected != actual) {
            throw new AssertionError("Expected " + expected + " but got " + actual);
        }
    }
}
