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

package java.lang;

public class StringZillaDispatchHelper {
    public static int tier() {
        return StringZilla.compilerTier();
    }

    public static boolean latin(int length, int count) {
        return StringZilla.useReverseLatin1(length, count);
    }

    public static boolean latinFilter() {
        return StringZilla.useReverseLatin1Filter();
    }

    public static boolean utf16(int length, int count) {
        return StringZilla.useReverseUTF16(length, count);
    }

    public static boolean forwardUTF16(int count, boolean mixed) {
        return StringZilla.useForwardUTF16(count, mixed);
    }

    public static boolean charUTF16(int length, boolean reverse) {
        return StringZilla.useCharUTF16(length, reverse);
    }

    public static int search(String value, String needle, int from) {
        return value.lastIndexOf(needle, from);
    }
}
