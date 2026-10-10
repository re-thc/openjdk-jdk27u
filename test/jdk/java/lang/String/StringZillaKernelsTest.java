/*
 * Copyright (c) 2026, re-thc. All rights reserved.
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
 * @summary Enforce native work/stack bounds and verify odd-byte UTF-16 searches
 * @modules java.base/java.lang:open
 * @run main/native StringZillaKernelsTest
 */

public class StringZillaKernelsTest {
    private static native int check();
    private static native long limits();

    public static void main(String[] args) throws Exception {
        System.loadLibrary("StringZillaKernelsTest");
        int failure = check();
        if (failure != 0) {
            throw new AssertionError("Native kernel check failed at line " + failure);
        }
        Class<?> bridge = Class.forName("java.lang.StringZilla");
        var bytes = bridge.getDeclaredField("MAX_BYTES");
        var work = bridge.getDeclaredField("MAX_WORK");
        bytes.setAccessible(true);
        work.setAccessible(true);
        long expected = ((long)bytes.getInt(null) << 32) | work.getInt(null);
        if (limits() != expected) throw new AssertionError("Java/native work limits differ");
    }
}
