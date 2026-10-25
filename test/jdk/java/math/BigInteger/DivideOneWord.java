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
 */

/*
 * @test
 * @summary One word division across dividend sizes, unsigned values and reused storage
 * @compile --patch-module java.base=${test.src} DivideOneWord.java
 * @run main/othervm/timeout=300 -Xmx256m --patch-module java.base=${test.classes} java.math.DivideOneWord
 */

package java.math;

import java.util.Arrays;
import java.util.Random;

public class DivideOneWord {
    private static final long MASK = 0xffff_ffffL;
    private static final int POISON = 0x5a5a_a5a5;
    private static final int[] LENGTHS = {0, 1, 2, 64, 128, 255, 256, 257, 512, 1024};
    private static final Random RANDOM = new Random(0x32_64_256L);

    public static void main(String[] args) {
        // This object is reused after both long and short divisions, including
        // divisions whose quotient is zero or loses a leading word.
        MutableBigInteger reusable = new MutableBigInteger(new int[1031]);
        for (int length : LENGTHS) {
            for (int divisor : divisors()) {
                for (int shape = 0; shape < 6; shape++) {
                    int[] words = dividend(length, divisor, shape);
                    Expected expected = reference(words, divisor);
                    checkStorage(words, divisor, expected, shape % 4, reusable);
                    // Exercise both the existing capacity allocation and the
                    // exact-capacity case as well as oversized reused storage.
                    int capacity = shape % 2 == 0 ? 1 : Math.max(1, length);
                    checkStorage(words, divisor, expected, (shape + 1) % 4,
                            new MutableBigInteger(new int[capacity]));
                    if (shape == 0 || shape == 3 || shape == 4) {
                        checkPublic(words, divisor, expected);
                    }
                }
            }
            for (int i = 0; i < 64; i++) {
                int divisor;
                do {
                    divisor = RANDOM.nextInt();
                } while (divisor == 0);
                int[] words = dividend(length, divisor, 0);
                Expected expected = reference(words, divisor);
                checkStorage(words, divisor, expected, i % 4, reusable);
                checkPublic(words, divisor, expected);
            }
        }
        smallValues(reusable);
        divideByZero();
    }

    private static int[] divisors() {
        int[] values = new int[128];
        int count = 0;
        // Include every one word power of two and its nonzero neighbors.
        for (int bit = 0; bit < 32; bit++) {
            long power = 1L << bit;
            values[count++] = (int) power;
            if (power > 1) {
                values[count++] = (int) (power - 1);
            }
            values[count++] = (int) (power + 1);
        }
        for (int d : new int[] {7, 10, 37, 641, 0x5555_5555, 0xaaaa_aaab,
                0xffff_fffb, 0xffff_fffe, 0xffff_ffff}) {
            values[count++] = d;
        }
        return Arrays.stream(values, 0, count).distinct().toArray();
    }

    private static int[] dividend(int length, int divisor, int shape) {
        int[] words = new int[length];
        if (length == 0) {
            return words;
        }
        switch (shape) {
            case 0 -> {
                for (int i = 0; i < length; i++) {
                    words[i] = RANDOM.nextInt();
                }
                words[0] |= 1;
            }
            case 1 -> Arrays.fill(words, -1);
            case 2 -> words[0] = 1;
            // For the reciprocal estimate m = floor((2^64 - 1)/d), n = d
            // needs a correction. These words make every limb have n = d.
            case 3 -> Arrays.fill(words, divisor);
            // After the first word, every partial remainder is d - 1 and
            // every exact quotient word is 0xffffffff, including when n
            // is negative as a signed long and the remainder as a signed int.
            case 4 -> {
                Arrays.fill(words, -1);
                words[0] = divisor == 1 ? 1 : divisor - 1;
            }
            case 5 -> {
                for (int i = 0; i < length; i++) {
                    words[i] = (i & 1) == 0 ? 0x8000_0000 : 0;
                }
            }
            default -> throw new AssertionError(shape);
        }
        return words;
    }

    private record Expected(int[] quotient, long remainder) { }

    private static Expected reference(int[] words, int divisor) {
        // The oracle uses unsigned division, independently of reciprocal
        // multiplication and correction, and never calls BigInteger division.
        long d = divisor & MASK;
        int[] quotient = new int[words.length];
        long remainder = 0;
        for (int i = 0; i < words.length; i++) {
            long n = (remainder << 32) | (words[i] & MASK);
            quotient[i] = (int) Long.divideUnsigned(n, d);
            remainder = Long.remainderUnsigned(n, d);
        }
        return new Expected(quotient, remainder);
    }

    private static void checkStorage(int[] words, int divisor, Expected expected,
                                     int offset, MutableBigInteger quotient) {
        int[] source = new int[offset + words.length + 3];
        Arrays.fill(source, POISON);
        System.arraycopy(words, 0, source, offset, words.length);
        int[] snapshot = source.clone();
        MutableBigInteger dividend = new MutableBigInteger(source);
        dividend.offset = offset;
        dividend.intLen = words.length;

        int[] storage = quotient.value;
        Arrays.fill(storage, POISON);
        quotient.offset = Math.min(3, storage.length - 1);
        quotient.intLen = storage.length - quotient.offset;

        long remainder = Integer.toUnsignedLong(dividend.divideOneWord(divisor, quotient));
        String context = "length=" + words.length + ", offset=" + offset +
                ", divisor=" + Integer.toUnsignedString(divisor);
        require(remainder == expected.remainder, "unsigned remainder: " + context);
        require(Arrays.equals(quotient.value, 0, words.length,
                expected.quotient, 0, words.length), "quotient words: " + context);
        int leadingZeros = 0;
        while (leadingZeros < words.length && expected.quotient[leadingZeros] == 0) {
            leadingZeros++;
        }
        int expectedLength = words.length - leadingZeros;
        require(quotient.intLen == expectedLength, "normalized length: " + context);
        require(quotient.offset == (expectedLength == 0 ? 0 : leadingZeros),
                "normalized offset: " + context);
        require(quotient.isNormal(), "normal form: " + context);
        require(dividend.value == source && dividend.offset == offset &&
                dividend.intLen == words.length && Arrays.equals(source, snapshot),
                "dividend changed: " + context);
        if (storage.length >= words.length) {
            require(quotient.value == storage, "storage was not reused: " + context);
            for (int i = words.length; i < storage.length; i++) {
                require(storage[i] == POISON, "write beyond quotient: " + context);
            }
        } else {
            require(quotient.value != storage && quotient.value.length == words.length,
                    "quotient capacity: " + context);
            for (int word : storage) {
                require(word == POISON, "discarded storage changed: " + context);
            }
        }
    }

    private static BigInteger magnitude(int[] words) {
        byte[] bytes = new byte[words.length * 4];
        for (int i = 0; i < words.length; i++) {
            int word = words[i];
            bytes[4 * i] = (byte) (word >>> 24);
            bytes[4 * i + 1] = (byte) (word >>> 16);
            bytes[4 * i + 2] = (byte) (word >>> 8);
            bytes[4 * i + 3] = (byte) word;
        }
        return new BigInteger(1, bytes);
    }

    private static void checkPublic(int[] words, int divisor, Expected expected) {
        BigInteger a = magnitude(words);
        BigInteger d = BigInteger.valueOf(divisor & MASK);
        BigInteger q = magnitude(expected.quotient);
        BigInteger r = BigInteger.valueOf(expected.remainder);
        for (int dividendSign : new int[] {-1, 1}) {
            for (int divisorSign : new int[] {-1, 1}) {
                BigInteger signedA = dividendSign < 0 ? a.negate() : a;
                BigInteger signedD = divisorSign < 0 ? d.negate() : d;
                BigInteger expectedQ = dividendSign == divisorSign ? q : q.negate();
                BigInteger expectedR = dividendSign < 0 ? r.negate() : r;
                String context = "length=" + words.length + ", divisor=" + signedD +
                        ", dividend sign=" + dividendSign;
                require(signedA.divide(signedD).equals(expectedQ), "divide: " + context);
                BigInteger[] qr = signedA.divideAndRemainder(signedD);
                require(qr[0].equals(expectedQ) && qr[1].equals(expectedR),
                        "divideAndRemainder: " + context);
                require(signedA.remainder(signedD).equals(expectedR), "remainder: " + context);
                require(qr[0].multiply(signedD).add(qr[1]).equals(signedA),
                        "reconstruction: " + context);
                require(qr[1].abs().compareTo(d) < 0 &&
                        (qr[1].signum() == 0 || qr[1].signum() == signedA.signum()),
                        "remainder range and sign: " + context);
            }
        }
    }

    private static void smallValues(MutableBigInteger reusable) {
        for (int divisor : divisors()) {
            long d = divisor & MASK;
            for (long n : new long[] {0, 1, d - 1, d, Math.min(MASK, d + 1), MASK}) {
                int[] words = n == 0 ? new int[0] : new int[] {(int) n};
                Expected expected = reference(words, divisor);
                checkStorage(words, divisor, expected, 2, reusable);
                checkPublic(words, divisor, expected);
            }
        }
    }

    private static void divideByZero() {
        for (BigInteger a : new BigInteger[] {BigInteger.ZERO, BigInteger.ONE,
                BigInteger.ONE.shiftLeft(32 * 256), BigInteger.ONE.shiftLeft(32 * 1024).negate()}) {
            expectArithmetic(() -> a.divide(BigInteger.ZERO));
            expectArithmetic(() -> a.divideAndRemainder(BigInteger.ZERO));
            expectArithmetic(() -> a.remainder(BigInteger.ZERO));
        }
    }

    private static void expectArithmetic(Runnable action) {
        try {
            action.run();
        } catch (ArithmeticException expected) {
            return;
        }
        throw new AssertionError("division by zero did not throw");
    }

    private static void require(boolean condition, String message) {
        if (!condition) {
            throw new AssertionError(message);
        }
    }
}
