/*
 * Copyright (c) 2026, re-thc. All rights reserved.
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

package java.lang;

import jdk.internal.vm.annotation.IntrinsicCandidate;
import jdk.internal.vm.annotation.ForceInline;
import jdk.internal.vm.annotation.DontInline;

/** Shared, allocation-free substring search entry points. */
final class StringZilla {
    static final boolean ENABLED = isEnabled();
    // Keep small inputs on the existing Java / platform intrinsic paths.
    static final int MIN_BYTES = 256;

    static final int MAX_MIXED_NEEDLE = 64;

    // Probe a bounded near-boundary match before paying for a native call.
    @ForceInline
    static boolean matches(byte[] src, int offset, byte[] tgt, int length) {
        for (int i = 0; i < length; i++) {
            if (src[offset + i] != tgt[i]) return false;
        }
        return true;
    }

    @ForceInline
    static boolean matchesUTF16(byte[] src, int offset, byte[] tgt, int length) {
        for (int i = 0; i < length; i++) {
            if (StringUTF16.getChar(src, offset + i) != StringUTF16.getChar(tgt, i)) return false;
        }
        return true;
    }

    @ForceInline
    static boolean matchesLatin1UTF16(byte[] src, int offset, byte[] tgt, int length) {
        for (int i = 0; i < length; i++) {
            if (StringUTF16.getChar(src, offset + i) != (tgt[i] & 0xff)) return false;
        }
        return true;
    }

    // Isolate native argument setup from C1's short/early scalar path.
    @DontInline
    static int indexOfLatin1(byte[] src, int end, byte[] tgt, int count, int from) {
        int result = findLatin1(src, from, end - from, tgt, count);
        return result < 0 ? -1 : from + result;
    }

    @DontInline
    static int indexOfUTF16(byte[] src, int end, byte[] tgt, int count, int from) {
        int result = findUTF16(src, from << 1, (end - from) << 1, tgt, count << 1);
        return result < 0 ? -1 : from + (result >> 1);
    }

    @DontInline
    static int indexOfUTF16Latin1(byte[] src, int end, byte[] tgt, int count, int from) {
        int result = findUTF16Latin1(src, from << 1, (end - from) << 1, tgt, count);
        return result < 0 ? -1 : from + (result >> 1);
    }

    private StringZilla() {}
    private static native boolean isEnabled();

    @IntrinsicCandidate
    static native int findUTF16Latin1(byte[] src, int offset, int length, byte[] tgt, int tgtLength);

    @IntrinsicCandidate
    static native int rfindUTF16Latin1(byte[] src, int offset, int length, byte[] tgt, int tgtLength);

    @IntrinsicCandidate
    static native int findCharLatin1(byte[] src, int offset, int length, int ch);

    @IntrinsicCandidate
    static native int findCharUTF16(byte[] src, int offset, int length, int ch);

    @IntrinsicCandidate
    static native int rfindCharLatin1(byte[] src, int offset, int length, int ch);

    @IntrinsicCandidate
    static native int rfindCharUTF16(byte[] src, int offset, int length, int ch);

    // Callers check nulls and ranges before entering these leaf intrinsics.
    // All offsets and lengths are in bytes; the result is a relative byte offset.
    @IntrinsicCandidate
    static native int findLatin1(byte[] src, int offset, int length, byte[] tgt, int tgtLength);

    @IntrinsicCandidate
    static native int findUTF16(byte[] src, int offset, int length, byte[] tgt, int tgtLength);

    @IntrinsicCandidate
    static native int rfindLatin1(byte[] src, int offset, int length, byte[] tgt, int tgtLength);

    @IntrinsicCandidate
    static native int rfindUTF16(byte[] src, int offset, int length, byte[] tgt, int tgtLength);

}
