/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
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

package jdk.internal.util;

import java.nio.charset.CharacterCodingException;
import java.nio.charset.StandardCharsets;
import jdk.internal.access.JavaLangAccess;
import jdk.internal.access.SharedSecrets;
import jdk.internal.loader.BootLoader;
import jdk.internal.misc.VM;

/** Optional bulk conversion support. No native state is initialized during VM bootstrap. */
public final class HexFormatSupport {
    // Provisional binary-byte cutoffs from complete-call screening on Linux
    // x64, including allocation and both copies. They are not qualified for
    // default enablement or other targets. Keep small inputs in Java.
    public static final int ENCODE_MIN = 1024;
    public static final int DECODE_MIN = 128;

    private HexFormatSupport() { }

    private static final class Native {
        // Do not mark this holder AOT-safe: library availability belongs to this process.
        static final boolean AVAILABLE = load();

        private static boolean load() {
            if ("false".equals(VM.getSavedProperty("jdk.hexFormat.useNative"))) {
                return false;
            }
            try {
                return BootLoader.getNativeLibraries().loadLibrary("hexsimd") != null && init0() == 1;
            } catch (LinkageError unavailable) {
                return false;
            }
        }
    }

    /** Used internally and by qualification tests; never touches the holder before boot. */
    public static boolean isAvailable() {
        return VM.isBooted() && Native.AVAILABLE;
    }

    public static boolean encode(byte[] src, int from, int len, byte[] dst, boolean upper) {
        return isAvailable() && encode0(src, from, len, dst, upper);
    }

    public static boolean decode(String src, byte[] dst) {
        JavaLangAccess jla = SharedSecrets.getJavaLangAccess();
        if (jla.stringCoder(src) != 0 || !isAvailable()) {
            return false;
        }
        try {
            // For coder zero this existing internal operation returns the backing
            // bytes without copying. They are only read by the JNI region API.
            return decode0(jla.uncheckedGetBytesOrThrow(src, StandardCharsets.ISO_8859_1), dst);
        } catch (CharacterCodingException impossible) {
            throw new AssertionError(impossible);
        }
    }

    private static native int init0();
    private static native boolean encode0(byte[] src, int from, int len, byte[] dst, boolean upper);
    private static native boolean decode0(byte[] src, byte[] dst);
}
