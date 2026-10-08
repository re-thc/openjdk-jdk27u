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
 * @summary Arithmetic lowering preserves overflow, unsigned values and caller state
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @run main/othervm -Xint -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonArithmeticIntrinsics
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:CompileCommand=dontinline,compiler.intrinsics.common.TestCommonArithmeticIntrinsics::valid* -XX:CompileCommand=dontinline,compiler.intrinsics.common.TestCommonArithmeticIntrinsics::constantRemainder -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonArithmeticIntrinsics
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=3 -XX:CompileCommand=dontinline,compiler.intrinsics.common.TestCommonArithmeticIntrinsics::valid* -XX:CompileCommand=dontinline,compiler.intrinsics.common.TestCommonArithmeticIntrinsics::constantRemainder -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonArithmeticIntrinsics
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:-UseCommonIntrinsics compiler.intrinsics.common.TestCommonArithmeticIntrinsics
 */

package compiler.intrinsics.common;

import java.math.BigInteger;
import java.util.Random;

public class TestCommonArithmeticIntrinsics {
    private static final BigInteger MASK = BigInteger.ONE.shiftLeft(64).subtract(BigInteger.ONE);

    private static void equal(long actual, long expected) {
        if (actual != expected) throw new AssertionError(actual + " != " + expected);
    }

    private static long exact(int operation, long x, long y) {
        return switch (operation) {
            case 0 -> Math.addExact(x, y);
            case 1 -> Math.subtractExact(x, y);
            case 2 -> Math.multiplyExact(x, y);
            case 3 -> Math.incrementExact(x);
            case 4 -> Math.decrementExact(x);
            case 5 -> Math.negateExact(x);
            case 6 -> Math.addExact((int) x, (int) y);
            case 7 -> Math.subtractExact((int) x, (int) y);
            case 8 -> Math.multiplyExact((int) x, (int) y);
            case 9 -> Math.incrementExact((int) x);
            case 10 -> Math.decrementExact((int) x);
            case 11 -> Math.negateExact((int) x);
            default -> throw new AssertionError();
        };
    }

    private static void checkExact(int operation, long x, long y) {
        int width = operation < 6 ? 64 : 32;
        if (width == 32) { x = (int) x; y = (int) y; }
        BigInteger a = BigInteger.valueOf(x);
        BigInteger b = BigInteger.valueOf(y);
        BigInteger expected = switch (operation % 6) {
            case 0 -> a.add(b);
            case 1 -> a.subtract(b);
            case 2 -> a.multiply(b);
            case 3 -> a.add(BigInteger.ONE);
            case 4 -> a.subtract(BigInteger.ONE);
            case 5 -> a.negate();
            default -> throw new AssertionError();
        };
        boolean overflow = expected.bitLength() >= width;
        try {
            long actual = exact(operation, x, y);
            if (overflow) throw new AssertionError("missing overflow: " + operation);
            equal(actual, expected.longValue());
        } catch (ArithmeticException e) {
            if (!overflow) throw new AssertionError("unexpected overflow: " + operation, e);
        }
        // x and y are live across any deoptimization of the invocation.
        equal(a.longValue(), x);
        equal(b.longValue(), y);
    }

    private static long unsigned(int operation, long x, long y) {
        return switch (operation) {
            case 0 -> Long.divideUnsigned(x, y);
            case 1 -> Long.remainderUnsigned(x, y);
            case 2 -> Integer.divideUnsigned((int) x, (int) y);
            case 3 -> Integer.remainderUnsigned((int) x, (int) y);
            default -> throw new AssertionError();
        };
    }

    private static void checkUnsigned(int operation, long x, long y) {
        int width = operation < 2 ? 64 : 32;
        BigInteger mask = width == 64 ? MASK : BigInteger.valueOf(0xffffffffL);
        BigInteger a = BigInteger.valueOf(x).and(mask);
        BigInteger b = BigInteger.valueOf(y).and(mask);
        try {
            long actual = unsigned(operation, x, y);
            if (b.signum() == 0) throw new AssertionError("missing division by zero");
            BigInteger expected = operation % 2 == 0 ? a.divide(b) : a.remainder(b);
            equal(actual, width == 64 ? expected.longValue() : expected.intValue());
        } catch (ArithmeticException e) {
            if (b.signum() != 0) throw new AssertionError("unexpected division by zero", e);
        }
    }

    private static void check(long x, long y) {
        int a = (int) x;
        int b = (int) y;
        equal(Math.abs(x), x < 0 ? -x : x);
        equal(Math.abs(a), a < 0 ? -a : a);
        equal(Math.min(x, y), x < y ? x : y);
        equal(Math.max(x, y), x > y ? x : y);
        equal(Math.min(a, b), a < b ? a : b);
        equal(Math.max(a, b), a > b ? a : b);
        equal(StrictMath.min(a, b), a < b ? a : b);
        equal(StrictMath.max(a, b), a > b ? a : b);
        BigInteger bigX = BigInteger.valueOf(x);
        BigInteger bigY = BigInteger.valueOf(y);
        equal(Math.multiplyHigh(x, y), bigX.multiply(bigY).shiftRight(64).longValue());
        equal(Math.unsignedMultiplyHigh(x, y),
              bigX.and(MASK).multiply(bigY.and(MASK)).shiftRight(64).longValue());
        equal(Long.compareUnsigned(x, y), bigX.and(MASK).compareTo(bigY.and(MASK)));
        long ua = ((long) a) & 0xffffffffL;
        long ub = ((long) b) & 0xffffffffL;
        equal(Integer.compareUnsigned(a, b), ua < ub ? -1 : ua == ub ? 0 : 1);
        for (int operation = 0; operation < 12; operation++) checkExact(operation, x, y);
        for (int operation = 0; operation < 4; operation++) checkUnsigned(operation, x, y);
    }

    // Keep more values live than fit in registers across implicit RAX/RDX
    // clobbers. This catches missing fixed-register definitions in C1 LIR.
    private static long pressure(long a, long b, long c, long d, long e, long f,
                                 long g, long h, long i, long j, long k, long l) {
        long high = Math.multiplyHigh(a, b);
        long unsignedHigh = Math.unsignedMultiplyHigh(c, d);
        long quotient = Long.divideUnsigned(e, f | 1);
        long remainder = Long.remainderUnsigned(g, h | 1);
        return high + unsignedHigh + quotient + remainder
                + a + b + c + d + e + f + g + h + i + j + k + l;
    }

    private static void checkPressure(Random random) {
        long[] v = new long[12];
        long expected = 0;
        for (int i = 0; i < v.length; i++) {
            v[i] = random.nextLong();
            expected += v[i];
        }
        expected += BigInteger.valueOf(v[0]).multiply(BigInteger.valueOf(v[1])).shiftRight(64).longValue();
        expected += BigInteger.valueOf(v[2]).and(MASK).multiply(BigInteger.valueOf(v[3]).and(MASK))
                .shiftRight(64).longValue();
        expected += BigInteger.valueOf(v[4]).and(MASK).divide(BigInteger.valueOf(v[5] | 1).and(MASK)).longValue();
        expected += BigInteger.valueOf(v[6]).and(MASK).remainder(BigInteger.valueOf(v[7] | 1).and(MASK)).longValue();
        equal(pressure(v[0], v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8], v[9], v[10], v[11]), expected);
    }

    private static long constantRemainder() {
        return Long.remainderUnsigned(-68719476738L, -134217730L);
    }

    private static long validConstantMultiply() {
        return Math.multiplyExact(1234567L, -13L);
    }

    private static int validConstantMultiplyInt() {
        return Math.multiplyExact(1234567, -13);
    }

    private static long validRemainder(long x, long y) {
        return Long.remainderUnsigned(x, y);
    }

    private static int validRemainderInt(int x, int y) {
        return Integer.remainderUnsigned(x, y);
    }

    private static long validMultiply(long x, long y) {
        return Math.multiplyExact(x, y);
    }

    private static int validMultiplyInt(int x, int y) {
        return Math.multiplyExact(x, y);
    }

    private static long validAdd(long x, long y) {
        return Math.addExact(x, y);
    }

    private static int validAddInt(int x, int y) {
        return Math.addExact(x, y);
    }

    private static long validSubtract(long x, long y) {
        return Math.subtractExact(x, y);
    }

    private static int validSubtractInt(int x, int y) {
        return Math.subtractExact(x, y);
    }

    private static void checkValidCompiledInputs() {
        // Compile these small roots while all operands are valid. An earlier
        // guard failure would suppress their common intrinsic on recompilation
        // and hide scratch/input register overlap in the accelerated path.
        for (int i = 0; i < 50_000; i++) {
            int x = (i & 255) + 1;
            int y = (i & 127) + 1;
            equal(constantRemainder(), -68719476738L);
            equal(validConstantMultiply(), -16049371L);
            equal(validConstantMultiplyInt(), -16049371L);
            equal(validRemainder(-68719476738L - i, -134217730L), -68719476738L - i);
            equal(validRemainderInt(-1000 - x, -5), -1000 - x);
            equal(validMultiply(-x, y), (long) -x * y);
            equal(validMultiplyInt(-x, y), -x * y);
            equal(validAdd(-x, y), -x + y);
            equal(validAddInt(-x, y), -x + y);
            equal(validSubtract(-x, y), -x - y);
            equal(validSubtractInt(-x, y), -x - y);
        }
    }

    public static void main(String[] args) {
        checkValidCompiledInputs();
        Random random = new Random(42);
        for (int i = 0; i < 5_000; i++) {
            check((short) random.nextInt(), (short) random.nextInt());
            checkPressure(random);
        }
        long[] edges = {0, 1, -1, 2, -2, Integer.MIN_VALUE, Integer.MAX_VALUE,
                        Long.MIN_VALUE, Long.MAX_VALUE, 0x00000000ffffffffL,
                        0xffffffff00000000L};
        for (long x : edges) for (long y : edges) check(x, y);
        for (int i = 0; i < 500; i++) check(random.nextLong(), random.nextLong());
    }
}
