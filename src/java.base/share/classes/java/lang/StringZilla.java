/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
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

import java.util.Objects;

import jdk.internal.misc.Unsafe;
import jdk.internal.util.ArraysSupport;
import jdk.internal.vm.annotation.DontInline;
import jdk.internal.vm.annotation.ForceInline;
import jdk.internal.vm.annotation.IntrinsicCandidate;

/** Bounded search and equality bridges to StringZilla. */
final class StringZilla {
    private static final int ENABLED_BIT = 8;
    private static final int MSVC_BIT = 16;
    private static final int BACKEND_MASK = 7;
    private static final int CONFIGURATION = initialize();
    static final boolean ENABLED = (CONFIGURATION & ENABLED_BIT) != 0;
    private static final int BACKEND = CONFIGURATION & BACKEND_MASK;
    private static final int SERIAL = 0;
    private static final int HASWELL = 1;
    private static final int SKYLAKE = 2;
    private static final int NEON = 4;
    // Byte-set kernels use AVX2 (also on the Skylake backend) or NEON.
    static final boolean SCANS_ENABLED = ENABLED && BACKEND != SERIAL;
    static final int SCAN_PROBE = 32;
    static final int SCAN_WORD_PROBE = 64;
    static final int MIN_SCAN_BYTES = 256;
    static final int LINE_SEPARATOR = 0;
    static final int NON_TRIM = 1;
    static final int NON_TRIM_REVERSE = 2;
    static final int NON_WHITESPACE = 3;
    static final int NON_WHITESPACE_REVERSE = 4;
    static final boolean MSVC_SERIAL = (CONFIGURATION & MSVC_BIT) != 0 && BACKEND == SERIAL;
    static final int UNRESOLVED_TIER = -1;
    static final int C1 = 1;
    static final int C2 = 4;
    // Keep small inputs on the existing Java / platform intrinsic paths.
    static final int MIN_BYTES = 256;
    static final int REVERSE_CHAR_PROBE_LENGTH = 8;
    static final int MIN_INTERPRETER_REVERSE_BYTES = 32;
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

    // Reject a bounded reverse suffix before C2's existing prefix mismatch intrinsic.
    @ForceInline
    static int mismatchReverseC2(byte[] src, long offset, byte[] tgt, int length) {
        return mismatchReverseC2(src, offset, tgt, length, length >= 32);
    }

    @ForceInline
    static int mismatchReverseC2(byte[] src, long offset, byte[] tgt, int length, boolean wideSuffix) {
        int suffix = wideSuffix ? 2 * Long.BYTES : Long.BYTES;
        int prefix = length - suffix;
        // Keep valid bounds inline even when C2 has not profiled the JDK helpers.
        if (length < 0 || offset < 0 || offset > (long)src.length - length) {
            Objects.checkFromIndexSize(offset, length, src.length);
        }
        if (prefix < 0 || length > tgt.length) {
            Objects.checkFromIndexSize(prefix, suffix, tgt.length);
        }
        Unsafe unsafe = Unsafe.getUnsafe();
        long base = Unsafe.ARRAY_BYTE_BASE_OFFSET;
        for (int index = length - Long.BYTES; index >= prefix; index -= Long.BYTES) {
            long difference = unsafe.getLongUnaligned(src, base + offset + index)
                    ^ unsafe.getLongUnaligned(tgt, base + index);
            if (difference != 0) {
                int equalBits = unsafe.isBigEndian()
                        ? Long.numberOfTrailingZeros(difference)
                        : Long.numberOfLeadingZeros(difference);
                return index + Long.BYTES - 1 - (equalBits >> 3);
            }
        }
        if (prefix <= 2 * Long.BYTES) {
            // These word windows overlap the suffix already proven equal.
            // Every load remains within the checked complete needle range.
            for (int index = 0; index < prefix; index += Long.BYTES) {
                long difference = unsafe.getLongUnaligned(src, base + offset + index)
                        ^ unsafe.getLongUnaligned(tgt, base + index);
                if (difference != 0) {
                    int equalBits = unsafe.isBigEndian()
                            ? Long.numberOfLeadingZeros(difference)
                            : Long.numberOfTrailingZeros(difference);
                    return index + (equalBits >> 3);
                }
            }
            return -1;
        }
        return ArraysSupport.mismatch(src, (int)offset, tgt, 0, prefix);
    }

    @ForceInline
    static boolean matchesUTF16(byte[] src, int offset, byte[] tgt, int length) {
        return matchesUTF16(src, offset, tgt, length, String.compilerTier());
    }

    @ForceInline
    static boolean matchesUTF16(byte[] src, int offset, byte[] tgt, int length, int tier) {
        if (tier == 0) {
            int result = equalsRange(src, offset << 1, length << 1, tgt, 0);
            if (result != FALLBACK) {
                return result != 0;
            }
        }
        if (tier == C2 && length == Long.BYTES / 2) {
            // StringUTF16.lastIndexOf has checked both physical array ends.
            // This exact-width probe has no remaining prefix to compare.
            Unsafe unsafe = Unsafe.getUnsafe();
            long base = Unsafe.ARRAY_BYTE_BASE_OFFSET;
            return unsafe.getLongUnaligned(src, base + ((long)offset << 1))
                    == unsafe.getLongUnaligned(tgt, base);
        }
        int last = length - 1;
        if (last < 0) {
            return true;
        }
        int j = offset + last;
        if (StringUTF16.getChar(src, j--) != StringUTF16.getChar(tgt, last)) {
            return false;
        }
        int start = offset - 1;
        int k = last - 1;
        while (j > start) {
            if (StringUTF16.getChar(src, j--) != StringUTF16.getChar(tgt, k--)) {
                return false;
            }
        }
        return true;
    }

    @ForceInline
    static boolean matchesUTF16C2(byte[] src, int offset, byte[] tgt, int length) {
        if (BACKEND == SERIAL && length > 8 && length <= 256
                && (!MSVC_SERIAL || length > 128)) {
            return mismatchReverseC2(src, (long)offset << 1, tgt, length << 1) < 0;
        }
        return matchesUTF16(src, offset, tgt, length);
    }

    // The caller validates both complete ranges and selects 9..16 code units.
    // Overlapping word windows cover all 18..32 bytes without a mismatch call.
    @ForceInline
    static boolean matchesUTF16Words(byte[] src, int offset, byte[] tgt, int length) {
        assert length > 8 && length <= 16;
        Unsafe unsafe = Unsafe.getUnsafe();
        long base = Unsafe.ARRAY_BYTE_BASE_OFFSET;
        long from = base + ((long)offset << 1);
        int bytes = length << 1;
        return unsafe.getLongUnaligned(src, from + bytes - Long.BYTES)
                        == unsafe.getLongUnaligned(tgt, base + bytes - Long.BYTES)
                && unsafe.getLongUnaligned(src, from) == unsafe.getLongUnaligned(tgt, base)
                && unsafe.getLongUnaligned(src, from + Long.BYTES)
                        == unsafe.getLongUnaligned(tgt, base + Long.BYTES)
                && (bytes <= 3 * Long.BYTES
                    || unsafe.getLongUnaligned(src, from + bytes - 2 * Long.BYTES)
                        == unsafe.getLongUnaligned(tgt, base + bytes - 2 * Long.BYTES));
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

    @ForceInline
    static boolean usesSerial() {
        return BACKEND == SERIAL;
    }

    @ForceInline
    static boolean usesNeon() {
        return BACKEND == NEON;
    }

    @ForceInline
    static boolean useForwardUTF16(int count, boolean mixed) {
        return BACKEND != SERIAL || String.compilerTier() != C1
                || (mixed && count == MAX_MIXED_NEEDLE);
    }

    @ForceInline
    static boolean useCharUTF16(int length, boolean reverse) {
        if (BACKEND != SERIAL) {
            return (BACKEND != HASWELL && BACKEND != NEON)
                    || !reverse || length >= (BACKEND == NEON ? 768 : 256) || String.compilerTier() != C2;
        }
        int tier = String.compilerTier();
        return !(reverse && tier == C2)
                && (!MSVC_SERIAL || tier != C1);
    }

    @ForceInline
    static boolean probeMixedImmediate(int count) {
        return probeMixedImmediate(count, String.compilerTier());
    }

    @ForceInline
    static boolean probeMixedImmediate(int count, int tier) {
        if (BACKEND == SERIAL) {
            return tier != 0;
        }
        if (BACKEND == HASWELL || BACKEND == SKYLAKE || BACKEND == NEON) {
            return (tier == C1 && count <= 24) || (tier == C2 && count <= 64);
        }
        return false;
    }

    @ForceInline
    static boolean useMixedRangeIntrinsic(int count) {
        return useMixedRangeIntrinsic(count, String.compilerTier());
    }

    @ForceInline
    static boolean useMixedRangeIntrinsic(int count, int tier) {
        return count >= 16 && count <= MAX_MIXED_NEEDLE
                && (BACKEND == HASWELL || BACKEND == SKYLAKE) && tier == C2;
    }

    @ForceInline
    static boolean matchesUTF16Latin1Reverse(byte[] src, int offset, byte[] tgt, int count) {
        return matchesUTF16Latin1Reverse(src, offset, tgt, count, String.compilerTier());
    }

    @ForceInline
    static boolean matchesUTF16Latin1Reverse(byte[] src, int offset, byte[] tgt, int count, int tier) {
        if (tier == C1 && !MSVC_SERIAL && count > 8 && count < 32) {
            int last = count - 1;
            return StringUTF16.getChar(src, offset + last) == (tgt[last] & 0xff)
                    && matchesUTF16Latin1C1Prefix(src, offset, tgt, last);
        }
        if ((count >= (MSVC_SERIAL ? 64 : 32) && tier == C1)
                || (count >= 31 && tier == C2 && BACKEND == NEON)) {
            int last = count - 1;
            return StringUTF16.getChar(src, offset + last) == (tgt[last] & 0xff)
                    && matchesUTF16Latin1Native(src, offset, tgt, count);
        }
        return matchesUTF16Latin1JavaReverse(src, offset, tgt, count);
    }

    @DontInline
    private static boolean matchesUTF16Latin1Native(byte[] src, int offset, byte[] tgt, int count) {
        int result = rfindUTF16Latin1(src, offset << 1, count << 1, tgt, count);
        return result == FALLBACK ? matchesUTF16Latin1JavaReverse(src, offset, tgt, count) : result == 0;
    }

    @DontInline
    private static boolean matchesUTF16Latin1C1Prefix(byte[] src, int offset, byte[] tgt, int count) {
        return matchesUTF16Latin1JavaReverse(src, offset, tgt, count);
    }

    @ForceInline
    private static boolean matchesUTF16Latin1JavaReverse(byte[] src, int offset, byte[] tgt, int count) {
        int last = count - 1;
        if (last < 0) {
            return true;
        }
        int j = offset + last;
        if (StringUTF16.getChar(src, j--) != (tgt[last] & 0xff)) {
            return false;
        }
        int start = offset - 1;
        int k = last - 1;
        while (j > start) {
            if (StringUTF16.getChar(src, j--) != (tgt[k--] & 0xff)) {
                return false;
            }
        }
        return true;
    }

    // The caller has checked the last character. Verify the remaining suffix
    // in reverse order before widening the bounded prefix.
    @DontInline
    static boolean matchesLongUTF16Latin1(byte[] src, int offset, byte[] tgt, int count) {
        Objects.checkFromIndexSize(offset, count, src.length >> 1);
        for (int i = count - 2; i >= MAX_MIXED_NEEDLE; i--) {
            if (StringUTF16.getChar(src, offset + i) != (tgt[i] & 0xff)) {
                return false;
            }
        }
        int result = rfindUTF16Latin1(src, offset << 1, MAX_MIXED_NEEDLE << 1,
                tgt, MAX_MIXED_NEEDLE);
        if (result != FALLBACK) {
            return result == 0;
        }
        for (int i = MAX_MIXED_NEEDLE - 1; i >= 0; i--) {
            if (StringUTF16.getChar(src, offset + i) != (tgt[i] & 0xff)) {
                return false;
            }
        }
        return true;
    }

    // Skip impossible positions before Java verifies a long mixed needle.
    static int lastMixedCandidate(byte[] src, byte[] tgt, int count, int fromIndex) {
        int last = count - 1;
        int ch = tgt[last] & 0xff;
        int result = rfindCharUTF16(src, last << 1, (fromIndex + 1) << 1, ch);
        if (result == FALLBACK) {
            return fromIndex;
        }
        return result < 0 ? -1 : result >> 1;
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

    // Keep native argument setup out of C1's scalar character loop.
    @DontInline
    static int indexOfCharLatin1(byte[] src, int end, int ch, int from) {
        int result = findCharLatin1(src, from, end - from, ch);
        if (result == FALLBACK) {
            result = searchCharLarge(src, from, end - from, ch, false, false);
        }
        if (result == FALLBACK) {
            return FALLBACK;
        }
        return result < 0 ? -1 : from + result;
    }

    @DontInline
    static int indexOfCharUTF16(byte[] src, int end, int ch, int from) {
        int result = findCharUTF16(src, from << 1, (end - from) << 1, ch);
        if (result == FALLBACK) {
            result = searchCharLarge(src, from << 1, (end - from) << 1, ch, true, false);
        }
        if (result == FALLBACK) {
            return FALLBACK;
        }
        return result < 0 ? -1 : from + (result >> 1);
    }

    @DontInline
    static int lastIndexOfCharLatin1(byte[] src, int end, int ch) {
        int result = rfindCharLatin1(src, 0, end, ch);
        if (result == FALLBACK) {
            result = searchCharLarge(src, 0, end, ch, false, true);
        }
        return result;
    }

    @DontInline
    static int lastIndexOfCharUTF16(byte[] src, int end, int ch) {
        int result = rfindCharUTF16(src, 0, end << 1, ch);
        if (result == FALLBACK) {
            result = searchCharLarge(src, 0, end << 1, ch, true, true);
        }
        return result == FALLBACK ? FALLBACK : result < 0 ? -1 : result >> 1;
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

    // Keep C1's caller graph separate from the accelerated substring bodies.
    // The explicit tier remains C1 if these bridges later compile in C2.
    @DontInline
    static int lastIndexOfLatin1C1(byte[] src, int srcCount, byte[] tgt, int count, int from) {
        return StringLatin1.lastIndexOf(src, srcCount, tgt, count, from, C1);
    }

    @DontInline
    static int lastIndexOfUTF16C1(byte[] src, int srcCount, byte[] tgt, int count, int from) {
        return StringUTF16.lastIndexOf(src, srcCount, tgt, count, from, C1);
    }

    // The checked C1 entry has validated both complete physical ranges.
    // Reuse bounded equality when reverse search would select a Java fallback.
    @DontInline
    static int lastIndexOfUTF16FewCandidatesC1(byte[] src, byte[] tgt, int count, int from) {
        assert from == 0 || from == 1;
        assert count >= (MIN_BYTES >> 1) && count <= (MAX_BYTES >> 1);
        int bytes = count << 1;
        assert (long)(from + count) * 2 <= src.length && bytes <= tgt.length;
        int result = equalsRange(src, from << 1, bytes, tgt, 0);
        if (result == FALLBACK) {
            return StringUTF16.lastIndexOfJava(src, tgt, count, from);
        }
        if (result != 0) {
            return from;
        }
        if (from == 1 && StringUTF16.getChar(src, 0) == StringUTF16.getChar(tgt, 0)) {
            result = equalsRange(src, 0, bytes, tgt, 0);
            if (result == FALLBACK) {
                return StringUTF16.lastIndexOfJava(src, tgt, count, 0);
            }
            if (result != 0) {
                return 0;
            }
        }
        return -1;
    }

    @DontInline
    static int lastIndexOfUTF16Latin1C1(byte[] src, int srcCount, byte[] tgt, int count, int from) {
        return StringUTF16.lastIndexOfLatin1(src, srcCount, tgt, count, from, C1);
    }

    private StringZilla() {}

    // Bound each leaf call and return to Java between windows for safepoints.
    // Forward results are inclusive; reverse results are exclusive, like the
    // StringLatin1 whitespace helpers. A miss returns the corresponding fence.
    @ForceInline
    static int scan(byte[] src, int from, int to, int mode) {
        if (from < 0 || to > src.length || from > to) {
            Objects.checkFromToIndex(from, to, src.length);
        }
        int length = to - from;
        if (length == 0) {
            return from;
        }
        if (length >= Long.BYTES && String.compilerTier() != 0 && mode >= LINE_SEPARATOR
                && mode <= NON_WHITESPACE_REVERSE) {
            int result = scanWord(src, from, to, mode);
            if (result != FALLBACK) {
                return result;
            }
        }
        if (length <= MAX_BYTES) {
            int result = scanLatin1(src, from, length, mode);
            if (result == FALLBACK) {
                return FALLBACK;
            }
            boolean reverse = mode == NON_TRIM_REVERSE || mode == NON_WHITESPACE_REVERSE;
            if (result < 0) {
                return reverse ? from : to;
            }
            return from + result + (reverse ? 1 : 0);
        }
        return scanLarge(src, from, to, mode);
    }

    // The caller checks the complete interval and proves at least eight bytes.
    // A miss leaves the native interval unchanged, preserving window boundaries.
    @ForceInline
    static int scanWord(byte[] src, int from, int to, int mode) {
        boolean reverse = mode == NON_TRIM_REVERSE || mode == NON_WHITESPACE_REVERSE;
        int offset = reverse ? to - Long.BYTES : from;
        Unsafe unsafe = Unsafe.getUnsafe();
        long base = Unsafe.ARRAY_BYTE_BASE_OFFSET;
        long word = unsafe.getLongUnaligned(src, base + offset);
        if ((mode == NON_WHITESPACE || mode == NON_WHITESPACE_REVERSE)
                && word == 0x2020202020202020L) {
            return FALLBACK;
        }
        long high = 0x8080808080808080L;
        long low = word & 0x7f7f7f7f7f7f7f7fL;
        long hits;
        if (mode == LINE_SEPARATOR) {
            hits = zeroBytes(word ^ 0x0a0a0a0a0a0a0a0aL)
                    | zeroBytes(word ^ 0x0d0d0d0d0d0d0d0dL);
        } else if (mode == NON_TRIM || mode == NON_TRIM_REVERSE) {
            hits = ((low + 0x5f5f5f5f5f5f5f5fL) | word) & high;
        } else {
            // Masking to seven bits keeps every sum below 256: no byte carry.
            long whitespace = ((low + 0x7777777777777777L) & ~(low + 0x7272727272727272L))
                    | ((low + 0x6464646464646464L) & ~(low + 0x5f5f5f5f5f5f5f5fL));
            hits = (~whitespace | word) & high;
        }
        if (hits == 0) {
            return FALLBACK;
        }
        int bits = unsafe.isBigEndian() == reverse
                ? Long.numberOfTrailingZeros(hits) : Long.numberOfLeadingZeros(hits);
        int index = reverse ? Long.BYTES - 1 - (bits >> 3) : bits >> 3;
        return offset + index + (reverse ? 1 : 0);
    }

    @ForceInline
    private static long zeroBytes(long word) {
        return ~(((word & 0x7f7f7f7f7f7f7f7fL) + 0x7f7f7f7f7f7f7f7fL) | word)
                & 0x8080808080808080L;
    }

    @DontInline
    private static int scanLarge(byte[] src, int from, int to, int mode) {
        boolean reverse = mode == NON_TRIM_REVERSE || mode == NON_WHITESPACE_REVERSE;
        int cursor = reverse ? to : from;
        while (reverse ? cursor > from : cursor < to) {
            int size = Math.min(MAX_BYTES, reverse ? cursor - from : to - cursor);
            int offset = reverse ? cursor - size : cursor;
            int result = scanLatin1(src, offset, size, mode);
            if (result == FALLBACK) {
                return FALLBACK;
            }
            if (result >= 0) {
                return offset + result + (reverse ? 1 : 0);
            }
            cursor = reverse ? offset : cursor + size;
        }
        return reverse ? from : to;
    }

    @IntrinsicCandidate
    private static native int scanLatin1(byte[] src, int offset, int length, int mode);

    // The selected kernel, including serial-only builds, and the VM enable flag.
    private static native int initialize();

    // Same-coder reverse gates use the searched prefix length and needle count
    // in code units, after the public API has normalized fromIndex.
    @ForceInline
    static boolean useReverseLatin1(int length, int count) {
        return useReverseLatin1(length, count, String.compilerTier());
    }

    @ForceInline
    static boolean useReverseLatin1(int length, int count, int tier) {
        if (tier == 0) {
            return true;
        }
        if (BACKEND == NEON && count > 256) {
            if (tier == C1) {
                return reverseWork(length, count) >= 1024;
            }
            if (tier == C2) {
                return length - count >= 16 && reverseWork(length, count) >= 4096;
            }
        }
        if (BACKEND != SERIAL && BACKEND != HASWELL) {
            return true;
        }
        if (tier == C1) {
            return count <= 256
                    || (BACKEND == HASWELL && length - count < 64
                        && (long)length * count <= MAX_WORK)
                    || reverseWork(length, count) >= 1024;
        }
        if (count > 256) {
            // The bounded AVX2 filter avoids long-needle preprocessing for
            // at most 64 candidate positions.
            return (BACKEND == HASWELL && length - count < 64
                    && (long)length * count <= MAX_WORK)
                    || ((BACKEND != HASWELL || length - count >= 32)
                        && reverseWork(length, count) >= 4096);
        }
        return BACKEND == SERIAL ? count >= 32 && length >= 1024
                                 : count <= 128 || reverseWork(length, count) >= 1024;
    }

    @ForceInline
    static boolean useReverseLatin1Filter() {
        return useReverseLatin1Filter(String.compilerTier());
    }

    @ForceInline
    static boolean useReverseLatin1Filter(int tier) {
        return BACKEND == SERIAL && tier == C2;
    }

    // Expose the validated ranges to C2 before compiling the scalar loop.
    @DontInline
    static int lastIndexOfLatin1JavaC2(byte[] src, byte[] tgt, int count, int from) {
        Objects.checkFromIndexSize(from, count, src.length);
        Objects.checkFromIndexSize(0, count, tgt.length);
        return count > 256 ? StringLatin1.lastIndexOfJavaLong(src, tgt, count, from)
                           : StringLatin1.lastIndexOfJava(src, tgt, count, from);
    }

    @ForceInline
    static boolean useReverseUTF16(int length, int count) {
        return useReverseUTF16(length, count, String.compilerTier());
    }

    @ForceInline
    static boolean useReverseUTF16(int length, int count, int tier) {
        if (tier == 0) {
            return true;
        }
        if (MSVC_SERIAL && tier == C1 && count > 128 && length - count <= 1
                && (long)length * count <= MAX_WORK / 4) {
            return true;
        }
        if (MSVC_SERIAL && tier == C2 && count <= 128) {
            return false;
        }
        if (BACKEND == NEON) {
            if (tier == C1 && count > 128) {
                return reverseWork(length, count) >= 1024;
            }
            if (tier == C2) {
                return count > 128 ? length - count >= 8 && reverseWork(length, count) >= 2048
                                   : length >= (count <= 8 ? 1024 : 512);
            }
        }
        if ((BACKEND == SERIAL || BACKEND == HASWELL) && tier == C1) {
            return count <= 128 || reverseWork(length, count) >= 1024;
        }
        // A UTF-16 span of 16 code units supplies one AVX2 candidate vector.
        return tier != C2 || (BACKEND != SERIAL && BACKEND != HASWELL)
                || (count > 128 ? (BACKEND != HASWELL || length - count >= 16)
                                 && reverseWork(length, count) >= 2048
                                : length >= 512);
    }

    @ForceInline
    static boolean useReverseUTF16Filter(int count) {
        return count <= 128
                && (BACKEND == SERIAL || BACKEND == HASWELL || BACKEND == NEON);
    }

    @ForceInline
    private static long reverseWork(int length, int count) {
        return ((long)length - count + 1) * count;
    }

    // Isolate C1's native address setup from the surrounding scalar loop.
    @DontInline
    static int rfindUTF16C1(byte[] src, int length, byte[] tgt, int count) {
        if (MSVC_SERIAL && count <= 128) {
            int last = count - 1;
            char lastChar = StringUTF16.getChar(tgt, last);
            if (StringUTF16.getChar(src, length - 1) != lastChar) {
                int candidate = rfindCharUTF16(src, last << 1, (length - last) << 1, lastChar);
                if (candidate != FALLBACK) {
                    if (candidate < 0) {
                        return -1;
                    }
                    length = (candidate >> 1) + count;
                }
            }
        }
        return rfindUTF16(src, 0, length << 1, tgt, count << 1);
    }

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
