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
 * @test
 * @summary Canonical built-in names use ASCII case folding without initializing lookup maps
 * @modules java.base/sun.nio.cs:+open
 * @run main/othervm CanonicalCase
 * @run main/othervm -Duser.language=tr -Duser.country=TR CanonicalCase
 */

import java.nio.charset.Charset;
import java.nio.charset.IllegalCharsetNameException;
import java.nio.charset.UnsupportedCharsetException;

public class CanonicalCase {
    public static void main(String[] args) throws Exception {
        var provider = new sun.nio.cs.StandardCharsets();
        String[] names = {"UTF-8", "US-ASCII", "ISO-8859-1"};
        Charset[] expected = {java.nio.charset.StandardCharsets.UTF_8,
                             java.nio.charset.StandardCharsets.US_ASCII,
                             java.nio.charset.StandardCharsets.ISO_8859_1};
        for (int n = 0; n < names.length; n++) {
            String name = names[n];
            // Every ASCII case permutation, including mixed case.
            for (int bits = 0; bits < (1 << name.length()); bits++) {
                char[] chars = name.toCharArray();
                for (int i = 0; i < chars.length; i++) {
                    if ((bits & (1 << i)) != 0 && chars[i] >= 'A' && chars[i] <= 'Z') {
                        chars[i] += 'a' - 'A';
                    }
                }
                String variant = new String(chars);
                if (provider.charsetForName(variant) != expected[n] || Charset.forName(variant) != expected[n]) {
                    throw new AssertionError(variant);
                }
            }
        }
        for (String name : new String[] {"aliasMap", "classMap", "cache"}) {
            var field = provider.getClass().getDeclaredField(name);
            field.setAccessible(true);
            if (field.get(provider) != null) throw new AssertionError(name + " initialized");
        }
        for (String miss : new String[] {"UTF-9", "US-ASCIX", "ISO-8859-0",
                                       "UTF-8x", "US-ASCIIx", "ISO-8859-10x", "UTF_8", "uTF--8"}) {
            if (provider.charsetForName(miss) != null) throw new AssertionError(miss);
            try {
                Charset.forName(miss);
                throw new AssertionError(miss);
            } catch (UnsupportedCharsetException expectedError) { }
        }
        for (String miss : new String[] {"U\u0131F-8", "US-A\u017fCII", "\u0130SO-8859-1", "\u0131SO-8859-1"}) {
            if (provider.charsetForName(miss) != null) throw new AssertionError(miss);
            try {
                Charset.forName(miss);
                throw new AssertionError(miss);
            } catch (IllegalCharsetNameException expectedError) { }
        }
        if (provider.charsetForName("UTF8") != expected[0]
                || provider.charsetForName("latin1") != expected[2]
                || !Charset.forName("windows-1252").name().equals("windows-1252")
                || !provider.charsetForName("UTF-16").equals(java.nio.charset.StandardCharsets.UTF_16)) {
            throw new AssertionError("alias/fallback");
        }
    }
}
