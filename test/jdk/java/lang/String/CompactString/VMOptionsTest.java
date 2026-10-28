/*
 * Copyright (c) 2015, Oracle and/or its affiliates. All rights reserved.
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

import java.io.*;
import java.lang.reflect.Field;

import org.testng.annotations.BeforeClass;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import static org.testng.Assert.*;

/*
 * @test
 * @bug 8077559
 * @summary Verify always-enabled compact storage and genuine UTF16 coders.
 * @modules java.base/java.lang:open
 * @run testng/othervm VMOptionsTest
 * @run testng/othervm -XX:+CompactStrings VMOptionsTest
 */

public class VMOptionsTest {
    // corresponding "COMPACT_STRINGS" field in String class.
    Field COMPACT_STRINGS;
    // corresponding "coder" field in String class.
    Field coder;

    // corresponding coder type in String class.
    final byte LATIN1 = 0;
    final byte UTF16  = 1;

    @BeforeClass
    public void setUp() throws Exception {
        COMPACT_STRINGS = String.class.getDeclaredField("COMPACT_STRINGS");
        COMPACT_STRINGS.setAccessible(true);
        coder = String.class.getDeclaredField("coder");
        coder.setAccessible(true);
    }

    @DataProvider
    public Object[][] provider() {
        return new Object[][] {
                new Object[] {"", LATIN1},
                new Object[] {"abc", LATIN1},
                new Object[] {"\u00ff", LATIN1},
                new Object[] {"\ud83d\ude00", UTF16},
                new Object[] {"a\ud800", UTF16},
                new Object[] {"\udc00", UTF16},
                new Object[] {"A\uff21", UTF16},
                new Object[] {"\uff21\uff22", UTF16}
        };
    }

    /*
     * verify the coder field in String objects.
     */
    @Test(dataProvider = "provider")
    public void testCoder(String str, byte expected) throws Exception {
        byte c = (byte) coder.get(str);
        assertEquals(c, expected);
    }

    /*
     * verify the COMPACT_STRINGS flag in String objects.
     */
    @Test
    public void testCompactStringFlag() throws Exception {
        assertTrue(COMPACT_STRINGS.getBoolean(null));
    }
}
