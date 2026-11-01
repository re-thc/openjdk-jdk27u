/*
 * Copyright (c) 2010, 2023, Oracle and/or its affiliates. All rights reserved.
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

/* @test
 * @summary Unit test for charset containment
 * @bug 6798572 8167252
 * @modules jdk.charsets
 * @run junit Contains
 */

import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import java.util.Arrays;
import java.util.stream.Stream;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class Contains {

    /**
     * Tests the containment of some charsets against themselves.
     * This test takes both true and false for 'cont'.
     */
    @ParameterizedTest
    @MethodSource("charsets")
    public void charsetsTest(Charset containerCs, Charset cs, boolean cont){
        shouldContain(containerCs, cs, cont);
    }

    /**
     * Tests UTF charsets with other charsets. In this case, each UTF charset
     * should contain every single charset they are tested against. 'cont' is
     * always true.
     */
    @ParameterizedTest
    @MethodSource("utfCharsets")
    public void UTFCharsetsTest(Charset containerCs, Charset cs, boolean cont){
        shouldContain(containerCs, cs, cont);
    }

    /**
     * Tests the assertion in the contains() method: "Every charset contains itself."
     */
    @Test
    public void containsSelfTest() {
        for (var entry : Charset.availableCharsets().entrySet()) {
            Charset charset = entry.getValue();
            boolean contains = charset.contains(charset);
            assertTrue(contains, String.format("Charset(%s).contains(Charset(%s)) returns %s",
                    charset.name(), charset.name(), contains));
        }
    }

    @Test
    public void externalLegacyNameContainment() {
        Charset external = new Charset("GBK", null) {
            public boolean contains(Charset cs) { return cs == this; }
            public CharsetEncoder newEncoder() { throw new UnsupportedOperationException(); }
            public CharsetDecoder newDecoder() { throw new UnsupportedOperationException(); }
        };
        assertTrue(Charset.forName("UTF-16").contains(external));
    }

    /**
     * Helper method that checks if a charset should contain another charset.
     */
    static void shouldContain(Charset containerCs, Charset cs, boolean cont){
        assertEquals((containerCs.contains(cs)), cont, String.format("%s %s %s",
                containerCs.name(), (cont ? " contains " : " does not contain "), cs.name()));
    }

    private static Stream<Arguments> utfCharsets() {
        String[] utfNames = {
                "utf-16",
                "utf-8",
                "utf-16le",
                "utf-16be",
                "x-utf-16le-bom",
                "UTF-32", "UTF-32BE", "UTF-32LE", "X-UTF-32BE-BOM", "X-UTF-32LE-BOM"
        };

        String[] charsetNames = {
                "US-ASCII", "ISO-8859-1", "UTF-8", "UTF-16", "UTF-16BE", "UTF-16LE",
                "x-UTF-16LE-BOM", "UTF-32", "UTF-32BE", "UTF-32LE",
                "X-UTF-32BE-BOM", "X-UTF-32LE-BOM"
        };

        // All charsets in utfNames should contain
        // all charsets in charsetNames
        return Arrays.stream(utfNames).flatMap(cs1 -> Arrays.stream(charsetNames)
                .map(cs2 -> Arguments.of(Charset.forName(cs1), Charset.forName(cs2), true)));
    }

    private static Stream<Arguments> charsets() {
        Charset ascii = Charset.forName("US-ASCII");
        Charset latin1 = Charset.forName("ISO-8859-1");
        Charset utf8 = Charset.forName("UTF-8");
        Charset utf16be = Charset.forName("UTF-16BE");

        return Stream.of(
            Arguments.of(ascii, ascii, true),
            Arguments.of(ascii, latin1, false),
            Arguments.of(ascii, utf8, false),
            Arguments.of(ascii, utf16be, false),
            Arguments.of(latin1, ascii, true),
            Arguments.of(latin1, latin1, true),
            Arguments.of(latin1, utf8, false),
            Arguments.of(latin1, utf16be, false),
            Arguments.of(utf8, ascii, true),
            Arguments.of(utf8, latin1, true),
            Arguments.of(utf8, utf8, true),
            Arguments.of(utf8, utf16be, true),
            Arguments.of(utf16be, ascii, true),
            Arguments.of(utf16be, latin1, true),
            Arguments.of(utf16be, utf8, true),
            Arguments.of(utf16be, utf16be, true)
        );
    }
}
