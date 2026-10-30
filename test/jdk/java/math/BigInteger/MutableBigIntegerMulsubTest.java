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
 * @summary Check division multiply/subtract carries and the borrow-only no-write contract
 * @modules java.base/java.math:open
 * @library /test/lib
 * @key randomness
 * @run main MutableBigIntegerMulsubTest
 * @run main/othervm -Xint MutableBigIntegerMulsubTest
 */

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.math.BigInteger;
import java.util.Arrays;
import java.util.Random;

import jdk.test.lib.RandomFactory;

public class MutableBigIntegerMulsubTest {
    private static final int[] WORDS = {
        0, 1, 0x7fff_ffff, 0x8000_0000, 0xffff_fffe, 0xffff_ffff
    };
    private static final Random RANDOM = RandomFactory.getRandom();
    private static final long MASK = 0xffff_ffffL;

    public static void main(String[] args) throws Exception {
        Class<?> type = Class.forName("java.math.MutableBigInteger");
        Constructor<?> constructor = type.getDeclaredConstructor();
        constructor.setAccessible(true);
        Object receiver = constructor.newInstance();
        Method mulsub = type.getDeclaredMethod("mulsub", int[].class,
                int[].class, int.class, int.class, int.class);
        Method borrow = type.getDeclaredMethod("mulsubBorrow", int[].class,
                int[].class, int.class, int.class, int.class);
        mulsub.setAccessible(true);
        borrow.setAccessible(true);

        for (int x : WORDS) {
            for (int a : WORDS) {
                for (int q : WORDS) {
                    check(receiver, mulsub, borrow,
                            new int[] { 123, q, 456 }, new int[] { a }, x, 1, 0);
                }
            }
        }
        for (int len : new int[] { 0, 1, 2, 3, 8, 32, 79, 80, 81, 128, 256 }) {
            for (int offset : new int[] { 0, 1, 5 }) {
                for (int x : WORDS) {
                    int[] a = new int[len + 2];
                    int[] q = new int[offset + len + 4];
                    // All-ones multiplication and long borrow chains, with
                    // untouched words on both sides and beyond a's used prefix.
                    Arrays.fill(a, -1);
                    Arrays.fill(q, -1);
                    check(receiver, mulsub, borrow, q, a, x, len, offset);
                    Arrays.fill(q, 0);
                    check(receiver, mulsub, borrow, q, a, x, len, offset);
                    for (int i = 0; i < 8; i++) {
                        for (int j = 0; j < a.length; j++) {
                            a[j] = RANDOM.nextInt();
                        }
                        // Reuse the destination produced by the previous call.
                        check(receiver, mulsub, borrow, q, a,
                                RANDOM.nextInt(), len, offset);
                    }
                }
            }
        }
        division();
    }

    private static void check(Object receiver, Method mulsub, Method borrow,
                              int[] q, int[] a, int x, int len, int offset)
            throws Exception {
        int[] original = q.clone();
        int[] source = a.clone();
        BigInteger difference = magnitude(q, offset + 1, len).subtract(
                magnitude(a, 0, len).multiply(BigInteger.valueOf(x & MASK)));
        int expectedBorrow = difference.shiftRight(32 * len).negate().intValue();
        int[] expected = q.clone();
        BigInteger low = difference;
        for (int j = offset + len; j > offset; j--) {
            expected[j] = low.intValue();
            low = low.shiftRight(32);
        }
        int actualBorrow = (int) borrow.invoke(receiver, q, a, x, len, offset);
        if (actualBorrow != expectedBorrow || !Arrays.equals(q, original)) {
            throw new AssertionError("mulsubBorrow: len=" + len + ", offset=" + offset
                    + ", x=" + Integer.toUnsignedString(x));
        }
        actualBorrow = (int) mulsub.invoke(receiver, q, a, x, len, offset);
        if (actualBorrow != expectedBorrow || !Arrays.equals(q, expected)
                || !Arrays.equals(a, source)) {
            throw new AssertionError("mulsub: len=" + len + ", offset=" + offset
                    + ", x=" + Integer.toUnsignedString(x));
        }
    }

    private static BigInteger magnitude(int[] words, int offset, int len) {
        BigInteger result = BigInteger.ZERO;
        for (int i = offset; i < offset + len; i++) {
            result = result.shiftLeft(32).add(BigInteger.valueOf(words[i] & MASK));
        }
        return result;
    }

    private static void division() {
        // Exercise both sides of the Knuth/Burnikel-Ziegler thresholds, with
        // known quotients and remainders constructed without using division.
        for (int dlen : new int[] { 1, 2, 8, 32, 79, 80, 81, 128 }) {
            for (int qlen : new int[] { 1, 2, 39, 40, 41, 64 }) {
                for (boolean ones : new boolean[] { false, true }) {
                    BigInteger divisor = number(dlen, ones);
                    BigInteger quotient = number(qlen, ones);
                    for (BigInteger remainder : new BigInteger[] {
                            BigInteger.ZERO, BigInteger.ONE,
                            divisor.shiftRight(1), divisor.subtract(BigInteger.ONE) }) {
                        checkDivision(divisor, quotient, remainder);
                        // Common powers of two trigger cancellation in Knuth.
                        checkDivision(divisor.shiftLeft(96), quotient,
                                remainder.shiftLeft(96));
                    }
                    checkDivision(divisor, BigInteger.ZERO, divisor.subtract(BigInteger.ONE));
                }
            }
        }
    }

    private static BigInteger number(int limbs, boolean ones) {
        int bits = limbs * 32;
        return ones ? BigInteger.ONE.shiftLeft(bits).subtract(BigInteger.ONE)
                : new BigInteger(bits, RANDOM).setBit(bits - 1);
    }

    private static void checkDivision(BigInteger divisor, BigInteger quotient,
                                      BigInteger remainder) {
        BigInteger dividend = divisor.multiply(quotient).add(remainder);
        for (int nsign : new int[] { -1, 1 }) {
            for (int dsign : new int[] { -1, 1 }) {
                BigInteger n = nsign < 0 ? dividend.negate() : dividend;
                BigInteger d = dsign < 0 ? divisor.negate() : divisor;
                BigInteger q = nsign == dsign ? quotient : quotient.negate();
                BigInteger r = nsign < 0 ? remainder.negate() : remainder;
                BigInteger[] qr = n.divideAndRemainder(d);
                if (!qr[0].equals(q) || !qr[1].equals(r)
                        || !n.divide(d).equals(q) || !n.remainder(d).equals(r)) {
                    throw new AssertionError("division: dividend bits=" + n.bitLength()
                            + ", divisor bits=" + d.bitLength());
                }
            }
        }
    }
}
