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
 * @summary Shared multiply-add preserves unsigned 32-bit limbs and carries
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @run main/othervm --add-opens=java.base/java.math=ALL-UNNAMED -Xint -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonMulAdd
 * @run main/othervm --add-opens=java.base/java.math=ALL-UNNAMED -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonMulAdd
 * @run main/othervm --add-opens=java.base/java.math=ALL-UNNAMED -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonMulAdd
 * @run main/othervm --add-opens=java.base/java.math=ALL-UNNAMED -Xbatch -XX:TieredStopAtLevel=1 -XX:-UseCommonIntrinsics compiler.intrinsics.common.TestCommonMulAdd
 */

package compiler.intrinsics.common;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.math.BigInteger;
import java.util.Arrays;
import java.util.Random;

public class TestCommonMulAdd {
    private static final MethodHandle MUL_ADD;
    static {
        try {
            // This Java wrapper calls the intrinsic worker at a normal invoke
            // bci, so C1 can lower it without a method-handle adapter fallback.
            MUL_ADD = MethodHandles.privateLookupIn(BigInteger.class, MethodHandles.lookup())
                    .findStatic(BigInteger.class, "mulAdd", MethodType.methodType(int.class,
                            int[].class, int[].class, int.class, int.class, int.class));
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private static BigInteger magnitude(int[] words, int start, int length) {
        byte[] bytes = new byte[length * 4];
        for (int i = 0; i < length; i++) {
            int value = words[start + i];
            for (int j = 0; j < 4; j++) {
                bytes[i * 4 + j] = (byte) (value >>> (24 - j * 8));
            }
        }
        return new BigInteger(1, bytes);
    }

    private static void check(int[] out, int[] in, int offset, int length, int k) throws Throwable {
        int start = out.length - offset - length;
        int[] expected = out.clone();
        int[] originalInput = in.clone();
        // Multiplication by a one-limb positive BigInteger and addition form
        // an independent oracle; they do not call the multiply-add worker.
        BigInteger sum = magnitude(in, 0, length)
                .multiply(BigInteger.valueOf(Integer.toUnsignedLong(k)))
                .add(magnitude(out, start, length));
        for (int i = start + length - 1; i >= start; i--) {
            expected[i] = sum.intValue();
            sum = sum.shiftRight(32);
        }
        int carry = (int) MUL_ADD.invokeExact(out, in, offset, length, k);
        if (carry != sum.intValue() || !Arrays.equals(out, expected) ||
                (out != in && !Arrays.equals(in, originalInput))) {
            throw new AssertionError("k=" + Integer.toUnsignedString(k) +
                                     ", length=" + length + ", offset=" + offset);
        }
    }

    public static void main(String[] args) throws Throwable {
        Random random = new Random(42);
        int[] values = {0, 1, -1, Integer.MIN_VALUE, Integer.MAX_VALUE, 0x8abc5432};
        for (int repeat = 0; repeat < 20; repeat++) {
            for (int length : new int[] {1, 2, 3, 16, 32, 257}) {
                for (int offset : new int[] {0, 1, 3}) {
                    for (int k : values) {
                        int[] in = random.ints(length).toArray();
                        int[] out = random.ints(length + offset + 3).toArray();
                        check(out, in, offset, length, k);
                    }
                }
            }
        }
        // Rejecting an alias must preserve Java's traversal and caller state.
        int[] alias = random.ints(20).toArray();
        check(alias, alias, 1, 16, -1);
    }
}
