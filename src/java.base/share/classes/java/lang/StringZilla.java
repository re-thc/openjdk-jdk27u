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

import jdk.internal.vm.annotation.DontInline;
import jdk.internal.vm.annotation.ForceInline;
import jdk.internal.vm.annotation.IntrinsicCandidate;

/** Bounded search and equality bridges to StringZilla. */
final class StringZilla {
    static final boolean ENABLED = isEnabled();
    // Keep small inputs on the existing Java / platform intrinsic paths.
    static final int MIN_BYTES = 256;
    // Match the independent native bounds. Exceeding either resumes Java code.
    static final int MAX_BYTES = 64 * 1024;
    static final int MAX_WORK = 4 * 1024 * 1024;
    static final int FALLBACK = -2;

    static final int MAX_MIXED_NEEDLE = 64;

    // Probe a bounded near-boundary match before paying for a native call.
    @ForceInline
    static boolean matches(byte[] src, int offset, byte[] tgt, int length) {
        for (int i = 0; i < length; i++) {
            if (src[offset + i] != tgt[i]) {
                return false;
            }
        }
        return true;
    }

    @ForceInline
    static boolean matchesUTF16(byte[] src, int offset, byte[] tgt, int length) {
        for (int i = 0; i < length; i++) {
            if (StringUTF16.getChar(src, offset + i) != StringUTF16.getChar(tgt, i)) {
                return false;
            }
        }
        return true;
    }

    @ForceInline
    static boolean matchesUTF16Latin1(byte[] src, int offset, byte[] tgt, int length) {
        for (int i = 0; i < length; i++) {
            if (StringUTF16.getChar(src, offset + i) != (tgt[i] & 0xff)) {
                return false;
            }
        }
        return true;
    }

    // Isolate native argument setup from C1's short/early scalar path.
    @DontInline
    static int indexOfLatin1(byte[] src, int end, byte[] tgt, int count, int from) {
        int result = findLatin1(src, from, end - from, tgt, count);
        if (result == FALLBACK) {
            result = searchLarge(src, from, end - from, tgt, count, 0, false);
        }
        if (result == FALLBACK) {
            return FALLBACK;
        }
        return result < 0 ? -1 : from + result;
    }

    @DontInline
    static int indexOfUTF16(byte[] src, int end, byte[] tgt, int count, int from) {
        int result = findUTF16(src, from << 1, (end - from) << 1, tgt, count << 1);
        if (result == FALLBACK) {
            result = searchLarge(src, from << 1, (end - from) << 1, tgt, count << 1, 1, false);
        }
        if (result == FALLBACK) {
            return FALLBACK;
        }
        return result < 0 ? -1 : from + (result >> 1);
    }

    @DontInline
    static int indexOfUTF16Latin1(byte[] src, int end, byte[] tgt, int count, int from) {
        int result = findUTF16Latin1(src, from << 1, (end - from) << 1, tgt, count);
        if (result == FALLBACK) {
            result = searchLarge(src, from << 1, (end - from) << 1, tgt, count, 2, false);
        }
        if (result == FALLBACK) {
            return FALLBACK;
        }
        return result < 0 ? -1 : from + (result >> 1);
    }

    private StringZilla() {}

    private static native boolean isEnabled();

    // Chunk boundaries provide safepoint polls without retaining heap addresses.
    // Source ranges use bytes; mixed-coder needle counts use Latin-1 code units.
    @DontInline
    static int searchLarge(byte[] src, int offset, int length, byte[] tgt,
                           int count, int encoding, boolean reverse) {
        int unit = encoding == 0 ? 1 : 2;
        if (encoding == 2 && count > MAX_MIXED_NEEDLE) {
            return FALLBACK;
        }
        int bytes = encoding == 2 ? count * 2 : count;
        if (bytes == 0) {
            return reverse ? length : 0;
        }
        int window = Math.min(MAX_BYTES, MAX_WORK / bytes) & -unit;
        // Avoid almost-complete overlaps: at most half a chunk is rescanned.
        if (bytes > window / 2) {
            return FALLBACK;
        }
        int end = offset + length;
        int cursor = reverse ? end : offset;
        while ((reverse ? cursor - offset : end - cursor) >= bytes) {
            int size = Math.min(window, reverse ? cursor - offset : end - cursor);
            int start = reverse ? cursor - size : cursor;
            int result;
            if (encoding == 0) {
                result = reverse ? rfindLatin1(src, start, size, tgt, count)
                                 : findLatin1(src, start, size, tgt, count);
            } else if (encoding == 1) {
                result = reverse ? rfindUTF16(src, start, size, tgt, count)
                                 : findUTF16(src, start, size, tgt, count);
            } else {
                result = reverse ? rfindUTF16Latin1(src, start, size, tgt, count)
                                 : findUTF16Latin1(src, start, size, tgt, count);
            }
            if (result == FALLBACK) {
                return FALLBACK;
            }
            if (result >= 0) {
                return start - offset + result;
            }
            // Overlap by needle length minus one code unit, so matches crossing
            // either chunk boundary are seen exactly in the search order.
            int step = size - bytes + unit;
            cursor += reverse ? -step : step;
        }
        return -1;
    }

    @DontInline
    static int searchCharLarge(byte[] src, int offset, int length, int ch,
                               boolean utf16, boolean reverse) {
        int unit = utf16 ? 2 : 1;
        int bytes = utf16 && ch >= Character.MIN_SUPPLEMENTARY_CODE_POINT ? 4 : unit;
        int end = offset + length;
        int cursor = reverse ? end : offset;
        while ((reverse ? cursor - offset : end - cursor) >= bytes) {
            int size = Math.min(MAX_BYTES, reverse ? cursor - offset : end - cursor);
            int start = reverse ? cursor - size : cursor;
            int result;
            if (utf16) {
                result = reverse ? rfindCharUTF16(src, start, size, ch)
                                 : findCharUTF16(src, start, size, ch);
            } else {
                result = reverse ? rfindCharLatin1(src, start, size, ch)
                                 : findCharLatin1(src, start, size, ch);
            }
            if (result == FALLBACK) {
                return FALLBACK;
            }
            if (result >= 0) {
                return start - offset + result;
            }
            int step = size - bytes + unit;
            cursor += reverse ? -step : step;
        }
        return -1;
    }

    @DontInline
    static boolean equalsLarge(byte[] src, byte[] tgt) {
        if (src.length != tgt.length) {
            return false;
        }
        int offset = 0;
        while (offset < src.length) {
            int size = Math.min(MAX_BYTES, src.length - offset);
            int result = equalsRange(src, offset, size, tgt, offset);
            if (result == FALLBACK) {
                return StringLatin1.equalsJava(src, tgt);
            }
            if (result == 0) {
                return false;
            }
            offset += size;
        }
        return true;
    }

    // Use the search adapters' calling convention for bounded equality.
    @IntrinsicCandidate
    static native int equalsRange(byte[] src, int offset, int length, byte[] tgt, int tgtOffset);

    // Callers validate nulls and ranges. Search results are relative byte offsets;
    // mixed-coder needle lengths count Latin-1 code units.
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

    @IntrinsicCandidate
    static native int findLatin1(byte[] src, int offset, int length, byte[] tgt, int tgtLength);

    @IntrinsicCandidate
    static native int findUTF16(byte[] src, int offset, int length, byte[] tgt, int tgtLength);

    @IntrinsicCandidate
    static native int rfindLatin1(byte[] src, int offset, int length, byte[] tgt, int tgtLength);

    @IntrinsicCandidate
    static native int rfindUTF16(byte[] src, int offset, int length, byte[] tgt, int tgtLength);
}
