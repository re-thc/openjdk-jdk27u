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

package jdk.internal.math;

import jdk.internal.vm.annotation.ForceInline;
import jdk.internal.vm.annotation.IntrinsicCandidate;

/** Shared native formatting entry; zero requests the Java conversion. */
final class Zmij {
    private static final boolean ENABLED = isEnabled0();

    private Zmij() { }

    private static native boolean isEnabled0();

    @ForceInline
    static boolean isEnabled() {
        return ENABLED;
    }

    @ForceInline
    @IntrinsicCandidate
    static boolean useJavaFloatAppend() {
        // C2 replaces this with true. Its Java builder path avoids the array
        // materialization and copying overhead of a native write.
        return false;
    }

    @IntrinsicCandidate
    private static native int format0(byte[] output, int byteIndex, long bits, int format);

    @IntrinsicCandidate
    private static native long decimal0(long bits);

    @ForceInline
    static boolean split(double v, FormattedFPDecimal fd) {
        if (!ENABLED) {
            return false;
        }
        long bits = Double.doubleToRawLongBits(v);
        if (bits <= 128 || bits >= 0x7ff0000000000000L) {
            // The Java splitter leaves fd unchanged for positive zero. Avoid its
            // unused scratch array and keep fd eligible for scalar replacement.
            return bits == 0;
        }
        int bq = (int) (bits >>> 52);
        int q = bq == 0 ? -1074 : bq - 1075;
        // Preserve the existing exact-integer fast path and its compact
        // significand. Calling native code and stripping many zeros costs
        // more than this Java path, especially for BigDecimal.valueOf.
        int mq = -q;
        if (0 < mq && mq < 53) {
            long c = (bits & 0xfffffffffffffL) | (1L << 52);
            long f = c >> mq;
            if (f << mq == c) {
                fd.set(f, 0, decimalDigits(f), true, false);
                return true;
            }
        }
        boolean irregular = (bits & 0xfffffffffffffL) == 0 && q != -1074;
        int e = irregular ? MathUtils.flog10threeQuartersPow2(q) : MathUtils.flog10pow2(q);
        long packed = decimal0(bits);
        if (packed == 0) {
            return false;
        }
        long f = packed & ((1L << 57) - 1);
        int n = decimalDigits(f);
        fd.set(f, e, n, (packed & (1L << 62)) != 0, packed < 0);
        return true;
    }

    @ForceInline
    private static int decimalDigits(long f) {
        int n = MathUtils.flog10pow2(64 - Long.numberOfLeadingZeros(f));
        if (f >= MathUtils.pow10(n)) {
            ++n;
        }
        return n;
    }

    @ForceInline
    static int format(byte[] output, int index, long bits, int type, boolean latin1) {
        if (!ENABLED) {
            return 0;
        }
        long magnitude = bits & (type == 0 ? 0x7fffffffL : 0x7fffffffffffffffL);
        if (magnitude <= 128
                || magnitude >= (type == 0 ? 0x7f800000L : 0x7ff0000000000000L)) {
            return 0;
        }
        int coder = latin1 ? 0 : 1;
        int maxChars = type == 0 ? FloatToDecimal.MAX_CHARS : DoubleToDecimal.MAX_CHARS;
        // putDecimal callers are trusted, but never pass an unchecked pointer
        // to native code if a caller misses its capacity check.
        if (index < 0 || index > (output.length >> coder) - maxChars) {
            return 0;
        }
        return format0(output, index << coder, bits, type | (coder << 1));
    }
}
