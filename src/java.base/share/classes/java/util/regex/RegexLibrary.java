/*
 * Copyright (c) 2026, the openjdk-jdk27u contributors. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  The copyright holders designate this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
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

package java.util.regex;

import jdk.internal.loader.BootLoader;

/** JNI bridge for the explicitly bounded fixed-width ASCII engine subset. */
final class RegexLibrary {
    private static final boolean AVAILABLE = load();

    private static boolean load() {
        try {
            return BootLoader.getNativeLibraries().loadLibrary("jregex") != null;
        } catch (UnsatisfiedLinkError unavailable) {
            return false;
        }
    }

    static int find(int kind, String input, int begin, int end) {
        if (!AVAILABLE) {
            return -2;
        }
        try {
            return find0(kind, input, begin, end);
        } catch (UnsatisfiedLinkError | RuntimeException failed) {
            return -2;
        }
    }

    private static native int find0(int kind, String input, int begin, int end);
}
