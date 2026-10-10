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

import jdk.internal.vm.annotation.ForceInline;
import jdk.internal.vm.annotation.IntrinsicCandidate;
import jdk.internal.vm.annotation.Stable;

/**
 * Optional bulk UTF and Base64 operations. A negative result requests the Java
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

    @ForceInline
    public static boolean isEligible(int len) {
        int threshold = minLength;
        return threshold > 0 && len >= threshold && len <= 1024 * 1024;
    }

    @ForceInline
    private static int process(Object src, int sp, int len,
                               Object dst, int dp, int capacity, int operation) {
        if (!isEligible(len) || (automatic && len < compiledMinimumLength(operation))) {
            return -1;
        }
        return process0(src, sp, len, dst, dp, capacity, operation);
    }

    // Share fallback profiles across tiers; explicit thresholds bypass these floors.
    @ForceInline
    private static int compiledMinimumLength(int operation) {
        return switch (operation) {
            case DECODE_UTF8 -> 256;
            case ENCODE_UTF16, DECODE_BASE64, DECODE_BASE64_URL,
                 DECODE_LATIN1, COUNT_CODE_POINTS -> 128;
            case VALIDATE_ASCII, VALIDATE_LATIN1, ENCODED_LENGTH_UTF16,
                 ENCODED_LENGTH_LATIN1, DECODE_UTF32_BE, DECODE_UTF32_LE -> 64;
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

    @ForceInline
    public static int copyUTF16(Object src, int sp, int len, Object dst, int dp) {
        return process(src, sp, len, dst, dp, len, COPY_UTF16);
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

    @ForceInline
    public static int decodeUTF8(byte[] src, int sp, int len,
                                 Object dst, int dp, int capacity) {
        return process(src, sp, len, dst, dp, capacity, DECODE_UTF8);
    }

    @ForceInline
    public static int decodeLatin1(byte[] src, int sp, int len,
                                  byte[] dst, int dp, int capacity) {
        return process(src, sp, len, dst, dp, capacity, DECODE_LATIN1);
    }

    @ForceInline
    public static int encodeLatin1(byte[] src, int sp, int len,
                                    byte[] dst, int dp, int capacity) {
        return process(src, sp, len, dst, dp, capacity, ENCODE_LATIN1);
    }

    @ForceInline
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
