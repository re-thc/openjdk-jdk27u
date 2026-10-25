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
 *
 */

/*
 * @test
 * @summary String UTF16 UTF-8 encoding retains replacement and throwing semantics
 * @modules java.base/jdk.internal.access
 * @run main/othervm -Xint TestUTF16UTF8
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 TestUTF16UTF8
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics TestUTF16UTF8
 * @run main/othervm -Xbatch -XX:-TieredCompilation TestUTF16UTF8
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:-CompactStrings TestUTF16UTF8
 */

import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.nio.charset.UnmappableCharacterException;
import java.util.Arrays;
import jdk.internal.access.SharedSecrets;

public class TestUTF16UTF8 {
    private static byte[] encode(String value) {
        return value.getBytes(StandardCharsets.UTF_8);
    }

    private static void check(String value, int bad, int repeats) throws Exception {
        ByteBuffer oracle = StandardCharsets.UTF_8.newEncoder()
                .onMalformedInput(CodingErrorAction.REPLACE)
                .encode(CharBuffer.wrap(value));
        byte[] expected = new byte[oracle.remaining()];
        oracle.get(expected);
        for (int i = 0; i < repeats; i++) {
            if (!Arrays.equals(expected, encode(value))) {
                throw new AssertionError("replacement length=" + value.length() + " bad=" + bad);
            }
            try {
                byte[] strict = SharedSecrets.getJavaLangAccess().getBytesUTF8OrThrow(value);
                if (bad >= 0 || !Arrays.equals(expected, strict)) {
                    throw new AssertionError("throwing length=" + value.length() + " bad=" + bad);
                }
            } catch (UnmappableCharacterException ex) {
                if (bad < 0 || ex.getInputLength() != 1 || ex.getCause() == null ||
                        !ex.getCause().getMessage().equals("malformed input offset : " + bad + ", length : 1")) {
                    throw new AssertionError("wrong malformed offset " + bad, ex);
                }
            }
        }
    }

    public static void main(String[] args) throws Exception {
        for (int length : new int[]{0, 1, 31, 255, 256, 257, 8192, 1048576, 1048577}) {
            for (int prefix : new int[]{0, Math.min(length, 32), length}) {
                String value = "a".repeat(prefix) + "\u20ac".repeat(length - prefix);
                check(value, -1, length <= 8192 ? 1000 : 1);
            }
        }
        for (String pattern : new String[]{"\u0080\u07ff\u0800\uffff", "\ud800\udc00", "\udbff\udfff"}) {
            check("ascii-prefix" + pattern.repeat(1024), -1, 1000);
        }
        for (int length : new int[]{31, 256, 8192}) {
            for (int bad : new int[]{0, length / 2, length - 1}) {
                for (char surrogate : new char[]{'\ud800', '\udbff', '\udc00', '\udfff'}) {
                    char[] chars = new char[length];
                    Arrays.fill(chars, '\u20ac');
                    chars[bad] = surrogate;
                    check(new String(chars), bad, 100);
                }
            }
        }
        check("a".repeat(32) + "\ud800\ud800\udc00\udc00" + "\u20ac".repeat(1024), 32, 1000);
    }
}
