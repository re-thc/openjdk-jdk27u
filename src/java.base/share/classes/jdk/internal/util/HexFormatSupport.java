// Copyright (c) 2026, Harry Chan. All rights reserved.
// SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0

package jdk.internal.util;

import java.nio.charset.CharacterCodingException;
import java.nio.charset.StandardCharsets;
import jdk.internal.access.JavaLangAccess;
import jdk.internal.access.SharedSecrets;
import jdk.internal.loader.BootLoader;
import jdk.internal.misc.VM;

/** Optional bulk conversion support. No native state is initialized during VM bootstrap. */
public final class HexFormatSupport {
    // Binary-byte cutoffs measured through complete public calls on Linux
    // x64/AVX2, including allocation and both copies. Other targets remain
    // explicit opt-ins. Keep small inputs in Java.
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
        int prefix = decodePrefix(src, dst);
        return prefix >= 0 && prefix == src.length();
    }

    public static boolean canDecode(String src) {
        return SharedSecrets.getJavaLangAccess().stringCoder(src) == 0 && isAvailable();
    }

    /** Returns validated prefix characters, or -1 if the operation is ineligible. */
    public static int decodePrefix(String src, byte[] dst) {
        if (!canDecode(src)) return -1;
        JavaLangAccess jla = SharedSecrets.getJavaLangAccess();
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
    private static native int decode0(byte[] src, byte[] dst);
}
