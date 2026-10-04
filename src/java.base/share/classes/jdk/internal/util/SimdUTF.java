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

import jdk.internal.vm.annotation.IntrinsicCandidate;
import jdk.internal.vm.annotation.ForceInline;
import jdk.internal.vm.annotation.Stable;

/**
 * Optional bulk UTF and Base64 operations. A negative result requests the Java
 * implementation, including its malformed-input and buffer-position semantics.
 * The VM validates array types, ranges and output capacity on every entry.
 */
public final class SimdUTF {
    private SimdUTF() { }

    // Kept zero during early bootstrap. Initialized once by System.initPhase1.
    @Stable
    private static int minLength;

    public static void initialize() {
        minLength = registerNatives();
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
        if (!isEligible(len)) {
            return -1;
        }
        return process0(src, sp, len, dst, dp, capacity, operation);
    }

    @IntrinsicCandidate
    private static native int process0(Object src, int sp, int len,
                                       Object dst, int dp, int capacity, int operation);

    // Validation kind: 0 = Unicode scalar sequence, 1 = ASCII, 2 = Latin-1.
    @ForceInline
    public static int validateUTF16(Object src, int sp, int len, int kind) {
        return process(src, sp, len, src, 0, 0, 10 + kind);
    }

    @ForceInline
    public static int encodedLengthUTF16(byte[] src, int len) {
        return process(src, 0, len, src, 0, 0, 13);
    }

    @ForceInline
    public static int encodedLengthLatin1(byte[] src, int len) {
        return process(src, 0, len, src, 0, 0, 14);
    }

    @ForceInline
    public static int encodeUTF16Bytes(char[] src, int sp, int len,
                                       byte[] dst, int dp, int capacity, boolean bigEndian) {
        return process(src, sp, len, dst, dp, capacity, bigEndian ? 15 : 16);
    }

    @ForceInline
    public static int decodeUTF16Bytes(byte[] src, int sp, int len,
                                       char[] dst, int dp, int capacity, boolean bigEndian) {
        return process(src, sp, len, dst, dp, capacity, bigEndian ? 17 : 18);
    }

    @ForceInline
    public static int inflateLatin1(byte[] src, int sp, int len, Object dst, int dp) {
        return process(src, sp, len, dst, dp, len, 19);
    }

    @ForceInline
    public static int encodeUTF32Bytes(char[] src, int sp, int len,
                                      byte[] dst, int dp, int capacity, boolean bigEndian) {
        return process(src, sp, len, dst, dp, capacity, bigEndian ? 20 : 21);
    }

    @ForceInline
    public static int decodeUTF32Bytes(byte[] src, int sp, int len,
                                      char[] dst, int dp, int capacity, boolean bigEndian) {
        return process(src, sp, len, dst, dp, capacity, bigEndian ? 22 : 23);
    }

    @ForceInline
    public static int countAscii(byte[] src, int sp, int len) {
        return process(src, sp, len, src, 0, 0, 0);
    }

    @ForceInline
    public static int decodeUTF8(byte[] src, int sp, int len,
                                 Object dst, int dp, int capacity) {
        return process(src, sp, len, dst, dp, capacity, 1);
    }

    @ForceInline
    public static int encodeLatin1(byte[] src, int sp, int len,
                                    byte[] dst, int dp, int capacity) {
        return process(src, sp, len, dst, dp, capacity, 2);
    }

    @ForceInline
    public static int encodeUTF16(Object src, int sp, int len,
                                  byte[] dst, int dp, int capacity) {
        return process(src, sp, len, dst, dp, capacity, 3);
    }

    @ForceInline
    public static int encodeAscii(char[] src, int sp, int len,
                                   byte[] dst, int dp) {
        return process(src, sp, len, dst, dp, len, 4);
    }

    @ForceInline
    public static int encodeLatin1FromUTF16(Object src, int sp, int len,
                                            byte[] dst, int dp) {
        return process(src, sp, len, dst, dp, len, 5);
    }

    @ForceInline
    public static int encodeBase64(byte[] src, int sp, int len,
                                    byte[] dst, int dp, boolean url) {
        return process(src, sp, len, dst, dp, dst.length - dp, url ? 7 : 6);
    }

    @ForceInline
    public static int decodeBase64(byte[] src, int sp, int len,
                                    byte[] dst, int dp, boolean url) {
        return process(src, sp, len, dst, dp, dst.length - dp, url ? 9 : 8);
    }
}
