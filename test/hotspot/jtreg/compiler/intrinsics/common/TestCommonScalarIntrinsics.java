/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
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

/*
 * @test
 * @summary Direct scalar lowering agrees with independent bit-by-bit oracles
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @run main/othervm -Xint -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonScalarIntrinsics
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonScalarIntrinsics
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonScalarIntrinsics
 * @run main/othervm -Xbatch -XX:-UseCommonIntrinsics compiler.intrinsics.common.TestCommonScalarIntrinsics
 */

package compiler.intrinsics.common;

import java.util.Random;

public class TestCommonScalarIntrinsics {
    private static void check(long x, int width) {
        int leading = 0;
        int trailing = 0;
        int count = 0;
        long reverse = 0;
        long bytes = 0;
        for (int i = 0; i < width; i++) {
            long bit = (x >>> i) & 1;
            count += bit;
            reverse |= bit << (width - 1 - i);
        }
        for (int i = width - 1; i >= 0 && ((x >>> i) & 1) == 0; i--) leading++;
        for (int i = 0; i < width && ((x >>> i) & 1) == 0; i++) trailing++;
        for (int i = 0; i < width / 8; i++) {
            bytes |= ((x >>> (i * 8)) & 255) << (width - 8 - i * 8);
        }
        if (width == 32) {
            int value = (int) x;
            equal(Integer.numberOfLeadingZeros(value), leading);
            equal(Integer.numberOfTrailingZeros(value), trailing);
            equal(Integer.bitCount(value), count);
            equal(Integer.reverse(value), (int) reverse);
            equal(Integer.reverseBytes(value), (int) bytes);
        } else {
            equal(Long.numberOfLeadingZeros(x), leading);
            equal(Long.numberOfTrailingZeros(x), trailing);
            equal(Long.bitCount(x), count);
            equal(Long.reverse(x), reverse);
            equal(Long.reverseBytes(x), bytes);
        }
        int swapped = (((int) x & 255) << 8) | (((int) x >>> 8) & 255);
        equal(Short.reverseBytes((short) x), (short) swapped);
        equal(Character.reverseBytes((char) x), swapped);
    }

    private static void equal(long actual, long expected) {
        if (actual != expected) throw new AssertionError(actual + " != " + expected);
    }

    public static void main(String[] args) {
        for (long value : new long[] {0, 1, -1, Long.MIN_VALUE, Long.MAX_VALUE,
                                     0x0123456789abcdefL, 0xaaaaaaaaaaaaaaaaL}) {
            check(value, 32);
            check(value, 64);
        }
        for (int i = 0; i < 64; i++) {
            check(1L << i, 32);
            check(1L << i, 64);
            check(~(1L << i), 32);
            check(~(1L << i), 64);
        }
        Random random = new Random(42);
        for (int i = 0; i < 20_000; i++) {
            long value = random.nextLong();
            check(value, 32);
            check(value, 64);
        }
    }
}
