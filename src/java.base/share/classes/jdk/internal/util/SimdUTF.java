/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 *
 */

package jdk.internal.util;

import java.nio.ByteOrder;
import jdk.internal.vm.annotation.DontInline;
import jdk.internal.vm.annotation.ForceInline;
import jdk.internal.vm.annotation.IntrinsicCandidate;
import jdk.internal.vm.annotation.Stable;

/**
 * Bulk UTF and Base64 operations. A negative result requests the Java
 * implementation, including its malformed-input and buffer-position semantics.
 * The VM validates array types, ranges and output capacity on every entry.
 */
public final class SimdUTF {
    private SimdUTF() { }

    // Keep operation values in sync with SimdUTF::Operation in simdutfSupport.hpp.
    private static final int COUNT_ASCII = 0;
    private static final int DECODE_UTF8 = 1;
    private static final int ENCODE_LATIN1 = 2;
    private static final int ENCODE_UTF16 = 3;
    private static final int ENCODE_ASCII = 4;
    private static final int ENCODE_LATIN1_FROM_UTF16 = 5;
    private static final int ENCODE_BASE64 = 6;
    private static final int ENCODE_BASE64_URL = 7;
    private static final int DECODE_BASE64 = 8;
    private static final int DECODE_BASE64_URL = 9;
    private static final int VALIDATE_UTF16 = 10;
    private static final int VALIDATE_ASCII = 11;
    private static final int VALIDATE_LATIN1 = 12;
    private static final int ENCODED_LENGTH_UTF16 = 13;
    private static final int ENCODED_LENGTH_LATIN1 = 14;
    private static final int ENCODE_UTF16_BE = 15;
    private static final int ENCODE_UTF16_LE = 16;
    private static final int DECODE_UTF16_BE = 17;
    private static final int DECODE_UTF16_LE = 18;
    private static final int INFLATE_LATIN1 = 19;
    private static final int ENCODE_UTF32_BE = 20;
    private static final int ENCODE_UTF32_LE = 21;
    private static final int DECODE_UTF32_BE = 22;
    private static final int DECODE_UTF32_LE = 23;
    private static final int DECODE_LATIN1 = 24;
    private static final int COUNT_CODE_POINTS = 25;
    private static final int COPY_UTF16 = 26;
    private static final int INDEX_OF_LATIN1 = 27;
    private static final int INDEX_OF_UTF16 = 28;
    private static final int VALIDATE_UTF8_LATIN1 = 29;
    private static final int MAX_CHUNK = 1024 * 1024;
    private static final boolean BIG_ENDIAN = ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN;

    // Kept zero during early bootstrap. Initialized once by System.initPhase1.
    @Stable
    private static int minLength;

    @Stable
    private static boolean automatic;

    public static void initialize() {
        int policy = registerNatives();
        automatic = policy < -1;
        minLength = automatic ? -(policy + 1) : policy;
    }

    private static native int registerNatives();

    // C1 supplies its bulk ASCII crossover; C2 retains its vector counter with zero.
    // Interpretation and other ports keep the Java prefix scan and scalar lead check.
    @ForceInline
    @IntrinsicCandidate
    public static int utf8DecoderPrefixThreshold() {
        return -1;
    }

    // C1 can discard an unprofitable native path before reading its first byte.
    // Other tiers retain the normal dispatch and their existing operation gates.
    @ForceInline
    @IntrinsicCandidate
    public static boolean useLatin1Decoding() {
        return true;
    }

    // C2 supplies the supplementary String crossover; zero keeps normal dispatch.
    @ForceInline
    @IntrinsicCandidate
    public static int utf8StringSupplementaryThreshold() {
        return 0;
    }

    @ForceInline
    public static boolean isEligible(int len) {
        int threshold = minLength;
        return threshold > 0 && len >= threshold;
    }

    @ForceInline
    public static boolean isEligibleUTF8Decoding(int len) {
        int threshold = minLength;
        return threshold > 0 && len >= threshold
                && (!automatic || len >= operationMinimumLength(DECODE_UTF8));
    }

    @ForceInline
    public static boolean isEligibleLatin1Decoding(int len) {
        int threshold = minLength;
        return threshold > 0 && len >= threshold
                && (!automatic || len >= operationMinimumLength(DECODE_LATIN1));
    }

    @ForceInline
    public static boolean isEligibleUTF16Encoding(int len) {
        int threshold = minLength;
        return threshold > 0 && len >= (automatic
                ? Math.max(threshold, operationMinimumLength(ENCODE_UTF16)) : threshold);
    }

    @ForceInline
    public static boolean useIndexOfPrefix() {
        return automatic;
    }

    @ForceInline
    private static int process(Object src, int sp, int len,
                               Object dst, int dp, int capacity, int operation) {
        if (!isEligible(len) || (automatic && len < operationMinimumLength(operation))) {
            return -1;
        }
        if ((operation == ENCODE_UTF16_BE || operation == ENCODE_UTF16_LE
                || operation == ENCODE_UTF32_BE || operation == ENCODE_UTF32_LE)
                && !validUTF16Start(src, sp, len)) {
            return -1;
        }
        return len <= MAX_CHUNK ? process0(src, sp, len, dst, dp, capacity, operation)
                               : processChunks(src, sp, len, dst, dp, capacity, operation);
    }

    // Return between bounded leaves so compiled loops can poll for safepoints.
    private static int processChunks(Object src, int sp, int len,
                                     Object dst, int dp, int capacity, int operation) {
        boolean src16 = operation >= ENCODE_UTF16 && operation <= ENCODE_LATIN1_FROM_UTF16
                || operation >= VALIDATE_UTF16 && operation <= ENCODED_LENGTH_UTF16
                || operation == ENCODE_UTF16_BE || operation == ENCODE_UTF16_LE
                || operation == ENCODE_UTF32_BE || operation == ENCODE_UTF32_LE
                || operation == COUNT_CODE_POINTS || operation == COPY_UTF16 || operation == INDEX_OF_UTF16;
        boolean dst16 = operation == DECODE_UTF8 || operation == DECODE_UTF16_BE || operation == DECODE_UTF16_LE
                || operation == INFLATE_LATIN1 || operation == DECODE_UTF32_BE || operation == DECODE_UTF32_LE
                || operation == COPY_UTF16;
        boolean readOnly = operation == COUNT_ASCII
                || operation >= VALIDATE_UTF16 && operation <= ENCODED_LENGTH_LATIN1
                || operation == COUNT_CODE_POINTS || operation >= INDEX_OF_LATIN1;
        if (!range(src, src16, sp, len)
                || (!readOnly && (!range(dst, dst16, dp, capacity)
                    || (src == dst && (operation != DECODE_LATIN1 || dp > sp))))) {
            return -1;
        }
        if (src == dst && operation == DECODE_LATIN1
                && (capacity < len || processChunks(src, sp, len, src, 0, 0, VALIDATE_UTF8_LATIN1) != 1)) {
            // A failed in-place conversion must not change input before Java retries it.
            return -1;
        }
        int consumed = 0;
        int written = 0;
        while (consumed < len) {
            int size = chunkLength(src, sp + consumed, len - consumed, operation);
            int result = processChunk(src, sp + consumed, size, dst,
                    readOnly ? dp : dp + written, readOnly ? capacity : capacity - written, operation);
            if (result < 0) {
                return operation == DECODE_UTF8 ? result - consumed : -1;
            }
            switch (operation) {
                case VALIDATE_UTF16, VALIDATE_ASCII, VALIDATE_LATIN1, VALIDATE_UTF8_LATIN1 -> {
                    if (result == 0) {
                        return 0;
                    }
                }
                case INDEX_OF_LATIN1, INDEX_OF_UTF16 -> {
                    if (result < size) {
                        return consumed + result;
                    }
                }
                default -> {
                    if (result > Integer.MAX_VALUE - written) {
                        return -1;
                    }
                    written += result;
                    if ((operation == COUNT_ASCII || operation == ENCODE_ASCII
                            || operation == ENCODE_LATIN1_FROM_UTF16) && result < size) {
                        return written;
                    }
                }
            }
            consumed += size;
        }
        return switch (operation) {
            case VALIDATE_UTF16, VALIDATE_ASCII, VALIDATE_LATIN1, VALIDATE_UTF8_LATIN1 -> 1;
            case INDEX_OF_LATIN1, INDEX_OF_UTF16 -> len;
            default -> written;
        };
    }

    private static boolean range(Object array, boolean utf16, int off, int len) {
        int length;
        if (array instanceof byte[] bytes) {
            length = utf16 ? bytes.length >> 1 : bytes.length;
        } else if (utf16 && array instanceof char[] chars) {
            length = chars.length;
        } else {
            return false;
        }
        return (off | len) >= 0 && off <= length && len <= length - off;
    }

    private static int chunkLength(Object src, int sp, int remaining, int operation) {
        int size = Math.min(remaining, MAX_CHUNK);
        if (size == remaining) {
            return size;
        }
        // Keep the final leaf above C2's short-input gates.
        int minimumTail = operation == COUNT_CODE_POINTS ? 1024 : operation == DECODE_UTF8 ? 512 : 0;
        if (remaining - size < minimumTail) {
            size = remaining - minimumTail;
        }
        switch (operation) {
            case DECODE_UTF8, DECODE_LATIN1, VALIDATE_UTF8_LATIN1 -> {
                byte[] bytes = (byte[])src;
                int minimum = size - 3;
                while (size > minimum && (bytes[sp + size] & 0xc0) == 0x80) {
                    size--;
                }
            }
            case ENCODE_UTF16, VALIDATE_UTF16, ENCODED_LENGTH_UTF16,
                 ENCODE_UTF16_BE, ENCODE_UTF16_LE, ENCODE_UTF32_BE, ENCODE_UTF32_LE, COUNT_CODE_POINTS -> {
                char last = src instanceof char[] chars ? chars[sp + size - 1]
                        : byteChar((byte[])src, (sp + size - 1) << 1, BIG_ENDIAN);
                if (Character.isHighSurrogate(last)) {
                    size--;
                }
            }
            case DECODE_UTF16_BE, DECODE_UTF16_LE -> {
                size &= ~1;
                if (Character.isHighSurrogate(byteChar((byte[])src, sp + size - 2,
                        operation == DECODE_UTF16_BE))) {
                    size -= 2;
                }
            }
            case ENCODE_BASE64, ENCODE_BASE64_URL -> size -= size % 3;
            case DECODE_BASE64, DECODE_BASE64_URL, DECODE_UTF32_BE, DECODE_UTF32_LE -> size &= ~3;
        }
        return size;
    }

    private static char byteChar(byte[] bytes, int off, boolean bigEndian) {
        return (char)(bigEndian ? (bytes[off] & 0xff) << 8 | (bytes[off + 1] & 0xff)
                               : (bytes[off] & 0xff) | (bytes[off + 1] & 0xff) << 8);
    }

    private static boolean validUTF16Start(Object src, int sp, int len) {
        if (!range(src, true, sp, len) || len == 0) {
            return false;
        }
        char first = src instanceof char[] chars ? chars[sp] : byteChar((byte[])src, sp << 1, BIG_ENDIAN);
        if (!Character.isSurrogate(first)) {
            return true;
        }
        return Character.isHighSurrogate(first) && len > 1 && Character.isLowSurrogate(
                src instanceof char[] chars ? chars[sp + 1] : byteChar((byte[])src, (sp + 1) << 1, BIG_ENDIAN));
    }

    // Keep operation constants visible to C2, including its preferred existing stubs.
    @ForceInline
    private static int processChunk(Object src, int sp, int len,
                                    Object dst, int dp, int capacity, int operation) {
        return switch (operation) {
            case COUNT_ASCII -> process0(src, sp, len, dst, dp, capacity, COUNT_ASCII);
            case ENCODE_ASCII -> process0(src, sp, len, dst, dp, capacity, ENCODE_ASCII);
            case ENCODE_LATIN1_FROM_UTF16 -> process0(src, sp, len, dst, dp, capacity, ENCODE_LATIN1_FROM_UTF16);
            case ENCODE_BASE64 -> process0(src, sp, len, dst, dp, capacity, ENCODE_BASE64);
            case ENCODE_BASE64_URL -> process0(src, sp, len, dst, dp, capacity, ENCODE_BASE64_URL);
            case DECODE_BASE64 -> process0(src, sp, len, dst, dp, capacity, DECODE_BASE64);
            case DECODE_BASE64_URL -> process0(src, sp, len, dst, dp, capacity, DECODE_BASE64_URL);
            case INFLATE_LATIN1 -> process0(src, sp, len, dst, dp, capacity, INFLATE_LATIN1);
            case INDEX_OF_LATIN1 -> process0(src, sp, len, dst, dp, capacity, INDEX_OF_LATIN1);
            case INDEX_OF_UTF16 -> process0(src, sp, len, dst, dp, capacity, INDEX_OF_UTF16);
            case DECODE_LATIN1 -> process0(src, sp, len, dst, dp, capacity, DECODE_LATIN1);
            case VALIDATE_UTF8_LATIN1 -> process0(src, sp, len, dst, dp, capacity, VALIDATE_UTF8_LATIN1);
            default -> process0(src, sp, len, dst, dp, capacity, operation);
        };
    }

    // Share operation floors across tiers when compilation is enabled; explicit thresholds bypass them.
    @ForceInline
    private static int operationMinimumLength(int operation) {
        return switch (operation) {
            case DECODE_UTF8 -> 256;
            case ENCODE_UTF16, DECODE_BASE64, DECODE_BASE64_URL,
                 COUNT_CODE_POINTS -> 128;
            case DECODE_LATIN1 -> 1024;
            case VALIDATE_ASCII, VALIDATE_LATIN1, ENCODED_LENGTH_UTF16,
                 ENCODED_LENGTH_LATIN1, DECODE_UTF32_BE, DECODE_UTF32_LE,
                 INDEX_OF_LATIN1, INDEX_OF_UTF16 -> 64;
            default -> 0;
        };
    }

    @IntrinsicCandidate
    private static native int process0(Object src, int sp, int len,
                                       Object dst, int dp, int capacity, int operation);

    // Validation kind: 0 = Unicode scalar sequence, 1 = ASCII, 2 = Latin-1.
    @ForceInline
    public static int validateUTF16(Object src, int sp, int len, int kind) {
        return process(src, sp, len, src, 0, 0, VALIDATE_UTF16 + kind);
    }

    @ForceInline
    public static int countCodePoints(Object src, int sp, int len) {
        return process(src, sp, len, src, 0, 0, COUNT_CODE_POINTS);
    }

    // Keep native dispatch out of C1 scalar-copy loops.
    @DontInline
    public static int copyUTF16(Object src, int sp, int len, Object dst, int dp) {
        return process(src, sp, len, dst, dp, len, COPY_UTF16);
    }

    // Return a relative index, len when absent, or a negative value to decline.
    @ForceInline
    public static int indexOfLatin1(byte[] src, int sp, int len, int ch) {
        return process(src, sp, len, src, ch, 0, INDEX_OF_LATIN1);
    }

    @ForceInline
    public static int indexOfUTF16(Object src, int sp, int len, int ch) {
        return process(src, sp, len, src, ch, 0, INDEX_OF_UTF16);
    }

    @ForceInline
    public static int encodedLengthUTF16(byte[] src, int len) {
        return process(src, 0, len, src, 0, 0, ENCODED_LENGTH_UTF16);
    }

    @ForceInline
    public static int encodedLengthLatin1(byte[] src, int len) {
        return process(src, 0, len, src, 0, 0, ENCODED_LENGTH_LATIN1);
    }

    @ForceInline
    public static int encodeUTF16Bytes(char[] src, int sp, int len,
                                       byte[] dst, int dp, int capacity, boolean bigEndian) {
        return process(src, sp, len, dst, dp, capacity, bigEndian ? ENCODE_UTF16_BE : ENCODE_UTF16_LE);
    }

    @ForceInline
    public static int decodeUTF16Bytes(byte[] src, int sp, int len,
                                       char[] dst, int dp, int capacity, boolean bigEndian) {
        return process(src, sp, len, dst, dp, capacity, bigEndian ? DECODE_UTF16_BE : DECODE_UTF16_LE);
    }

    @ForceInline
    public static int inflateLatin1(byte[] src, int sp, int len, Object dst, int dp) {
        return process(src, sp, len, dst, dp, len, INFLATE_LATIN1);
    }

    @ForceInline
    public static int encodeUTF32Bytes(char[] src, int sp, int len,
                                       byte[] dst, int dp, int capacity, boolean bigEndian) {
        return process(src, sp, len, dst, dp, capacity, bigEndian ? ENCODE_UTF32_BE : ENCODE_UTF32_LE);
    }

    @ForceInline
    public static int decodeUTF32Bytes(byte[] src, int sp, int len,
                                       char[] dst, int dp, int capacity, boolean bigEndian) {
        return process(src, sp, len, dst, dp, capacity, bigEndian ? DECODE_UTF32_BE : DECODE_UTF32_LE);
    }

    @ForceInline
    public static int countAscii(byte[] src, int sp, int len) {
        return process(src, sp, len, src, 0, 0, COUNT_ASCII);
    }

    /**
     * Returns the UTF-16 units written, or a negative result on failure.
     * A negative result encodes the input bytes preceding failure as
     * {@code -(result + 1)}. The caller may retry that prefix before falling back.
     */
    @ForceInline
    public static int decodeUTF8(byte[] src, int sp, int len,
                                 Object dst, int dp, int capacity) {
        return process(src, sp, len, dst, dp, capacity, DECODE_UTF8);
    }

    @ForceInline
    @IntrinsicCandidate
    public static int decodeLatin1(byte[] src, int sp, int len,
                                   byte[] dst, int dp, int capacity) {
        return process(src, sp, len, dst, dp, capacity, DECODE_LATIN1);
    }

    @ForceInline
    public static int encodeLatin1(byte[] src, int sp, int len,
                                   byte[] dst, int dp, int capacity) {
        return process(src, sp, len, dst, dp, capacity, ENCODE_LATIN1);
    }

    // Keep native call setup out of compilation of scalar encoder fallbacks.
    @DontInline
    public static int encodeUTF16(Object src, int sp, int len,
                                  byte[] dst, int dp, int capacity) {
        return process(src, sp, len, dst, dp, capacity, ENCODE_UTF16);
    }

    @ForceInline
    public static int encodeAscii(char[] src, int sp, int len,
                                  byte[] dst, int dp) {
        return process(src, sp, len, dst, dp, len, ENCODE_ASCII);
    }

    @ForceInline
    public static int encodeLatin1FromUTF16(Object src, int sp, int len,
                                            byte[] dst, int dp) {
        return process(src, sp, len, dst, dp, len, ENCODE_LATIN1_FROM_UTF16);
    }

    @ForceInline
    public static int encodeBase64(byte[] src, int sp, int len,
                                   byte[] dst, int dp, boolean url) {
        return process(src, sp, len, dst, dp, dst.length - dp, url ? ENCODE_BASE64_URL : ENCODE_BASE64);
    }

    @ForceInline
    public static int decodeBase64(byte[] src, int sp, int len,
                                   byte[] dst, int dp, boolean url) {
        return process(src, sp, len, dst, dp, dst.length - dp, url ? DECODE_BASE64_URL : DECODE_BASE64);
    }
}
