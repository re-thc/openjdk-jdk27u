/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @summary Compact PSL index comparison preserves UTF-16 order and raw caller spelling
 * @modules java.base/sun.security.util:open
 * @run main/othervm IndexedPublicSuffixIndex
 */

import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class IndexedPublicSuffixIndex {
    public static void main(String[] args) throws Exception {
        Method compare = Class.forName("sun.security.util.DomainName$IndexedData")
                .getDeclaredMethod("compareUTF8", byte[].class, int.class,
                        int.class, String.class);
        compare.setAccessible(true);
        List<String> stored = new ArrayList<>(List.of("", "a", "A", "com", "COM",
                ".com", "company", "公司", "рф", "\u0000", "\uD7FF", "\uE000",
                "\uFFFF", "\uD800\uDC00", "\uDBFF\uDFFF", "a\uD800\uDC00"));
        // Supplementary characters sort before U+E000 in UTF-16, unlike UTF-8.
        int[] alphabet = {'a', 'z', '.', 0, 0x7f, 0x80, 0x7ff, 0x800, 0xd7ff,
                0xe000, 0xffff, 0x10000, 0x20000, 0x10ffff};
        Random random = new Random(29);
        for (int n = 0; n < 128; n++) {
            StringBuilder value = new StringBuilder();
            for (int i = random.nextInt(7); i > 0; i--) {
                value.appendCodePoint(alphabet[random.nextInt(alphabet.length)]);
            }
            stored.add(value.toString());
        }
        List<String> targets = new ArrayList<>(stored);
        targets.addAll(List.of("\uD800", "\uDC00", "a\uD800", "\uDBFFx",
                "\uD800\uD800", "\uDC00\uDC00"));
        int count = 0;
        for (String name : stored) {
            byte[] encoded = name.getBytes(StandardCharsets.UTF_8);
            byte[] padded = new byte[encoded.length + 6];
            System.arraycopy(encoded, 0, padded, 3, encoded.length);
            for (String target : targets) {
                int expected = Integer.signum(name.compareTo(target));
                int actual = Integer.signum((int) compare.invoke(null, padded, 3,
                        encoded.length, target));
                if (expected != actual) {
                    throw new AssertionError("UTF-16 comparison differs at case " + count);
                }
                count++;
            }
        }
        System.out.println("Compact PSL comparison cases passed: " + count);
    }
}
