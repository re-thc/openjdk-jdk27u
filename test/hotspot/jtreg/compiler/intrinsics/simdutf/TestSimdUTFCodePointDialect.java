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
 */

/*
 * @test id=portable
 * @summary Code-point counts retain Java's isolated-surrogate dialect
 * @modules java.base/jdk.internal.util
 * @run main/othervm -Xint -XX:SIMDUTFMinLength=1 TestSimdUTFCodePointDialect
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics TestSimdUTFCodePointDialect
 */

/*
 * @test id=compiled
 * @summary Code-point counts retain Java's isolated-surrogate dialect
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @modules java.base/jdk.internal.util
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:SIMDUTFMinLength=1 TestSimdUTFCodePointDialect
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:SIMDUTFMinLength=1 TestSimdUTFCodePointDialect
 */

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;
import jdk.internal.util.SimdUTF;

public class TestSimdUTFCodePointDialect {
    private static final char[] ALPHABET = {
            0, 'a', '\ud7ff', '\uffff', '\ud800', '\udbff', '\udc00', '\udfff'
    };

    private static void check(char[] chars, int start, int length) {
        int end = start + length;
        int expected = 0;
        // Walk code points independently of the count implementation.
        for (int i = start; i < end; expected++) {
            i += Character.charCount(Character.codePointAt(chars, i, end));
        }
        String text = new String(chars);
        if (Character.codePointCount(chars, start, length) != expected
                || text.codePointCount(start, end) != expected
                || new StringBuilder(text).codePointCount(start, end) != expected) {
            throw new AssertionError("Java dialect mismatch at " + start + ", " + length);
        }
        byte[] bytes = new byte[chars.length * 2];
        ByteBuffer.wrap(bytes).order(ByteOrder.nativeOrder()).asCharBuffer().put(chars);
        for (Object storage : new Object[]{chars, bytes}) {
            int actual = SimdUTF.countCodePoints(storage, start, length);
            if (actual >= 0 && actual != expected) {
                throw new AssertionError("Native dialect mismatch: " + actual + " != " + expected);
            }
        }
    }

    public static void main(String[] args) {
        char[] chars = new char[144];
        Arrays.fill(chars, 'x');
        for (int pattern = 0; pattern < 4096; pattern++) {
            for (int i = 5; i < 133; i++) {
                chars[i] = ALPHABET[(pattern >>> (((i - 5) & 3) * 3)) & 7];
            }
            check(chars, 5, 4);
            check(chars, 0, chars.length);
            for (int start : new int[]{4, 5, 6}) {
                for (int end : new int[]{132, 133, 134}) {
                    check(chars, start, end - start);
                }
            }
        }
        chars = new char[(1 << 20) + 1031];
        Arrays.fill(chars, '\u6f22');
        // A valid pair and isolated surrogates on both sides of a leaf boundary.
        for (int index : new int[]{(1 << 20) - 2, (1 << 20) - 1, (1 << 20),
                                   (1 << 20) + 1}) {
            chars[index] = '\ud800';
            chars[index + 1] = '\udc00';
            chars[index - 2] = '\udc00';
            chars[index + 3] = '\ud800';
            check(chars, 0, chars.length);
            Arrays.fill(chars, index - 2, index + 4, '\u6f22');
        }
    }
}
