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
 * @summary BigInteger shift workers preserve in-place words and Java fallback semantics
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @run main/othervm --add-opens=java.base/java.math=ALL-UNNAMED -Xint -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonBigIntegerShifts
 * @run main/othervm --add-opens=java.base/java.math=ALL-UNNAMED -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonBigIntegerShifts
 * @run main/othervm --add-opens=java.base/java.math=ALL-UNNAMED -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonBigIntegerShifts
 * @run main/othervm --add-opens=java.base/java.math=ALL-UNNAMED -Xbatch -XX:TieredStopAtLevel=1 -XX:-UseCommonIntrinsics compiler.intrinsics.common.TestCommonBigIntegerShifts
 */

package compiler.intrinsics.common;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.math.BigInteger;
import java.util.Arrays;
import java.util.Random;

public class TestCommonBigIntegerShifts {
    private static final MethodType TYPE = MethodType.methodType(void.class,
            int[].class, int[].class, int.class, int.class, int.class);
    private static final MethodHandle LEFT;
    private static final MethodHandle RIGHT;
    private static final MethodHandle PRIMITIVE_LEFT;
    private static final MethodHandle PRIMITIVE_RIGHT;
    static {
        try {
            MethodHandles.Lookup lookup = MethodHandles.privateLookupIn(BigInteger.class, MethodHandles.lookup());
            LEFT = lookup.findStatic(BigInteger.class, "shiftLeftImplWorker", TYPE);
            RIGHT = lookup.findStatic(BigInteger.class, "shiftRightImplWorker", TYPE);
            MethodType primitive = MethodType.methodType(void.class, int[].class, int.class, int.class);
            PRIMITIVE_LEFT = lookup.findStatic(BigInteger.class, "primitiveLeftShift", primitive);
            PRIMITIVE_RIGHT = lookup.findStatic(BigInteger.class, "primitiveRightShift", primitive);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    // Use the original Java traversal for rejected aliases, whose writes may
    // affect subsequent reads. Safe aliases also agree with a snapshot oracle.
    private static void oracle(boolean left, int[] out, int[] in, int index, int shift, int count) {
        if (left) {
            for (int i = 0; i < count; i++) {
                out[index + i] = (in[i] << shift) | (in[i + 1] >>> (32 - shift));
            }
        } else {
            int input = count;
            for (int output = index == 0 ? count - 1 : count; output >= index; output--) {
                out[output] = (in[input] >>> shift) | (in[--input] << (32 - shift));
            }
        }
    }

    private static void check(boolean left, int[] input, int index, int shift, boolean alias) throws Throwable {
        int count = input.length - 1;
        int[] actualIn = input.clone();
        int[] actualOut = alias ? actualIn : new int[input.length + 2];
        int[] expectedIn = input.clone();
        int[] expectedOut = alias ? expectedIn : actualOut.clone();
        oracle(left, expectedOut, expectedIn, index, shift, count);
        boolean primitive = alias && index == (left ? 0 : 1);
        if (primitive) {
            // These non-intrinsic Java wrappers call the worker at a normal
            // invoke bci, so C1 reaches the shared leaf rather than linkTo.
            if (left) {
                expectedOut[count] <<= shift;
                PRIMITIVE_LEFT.invokeExact(actualOut, input.length, shift);
            } else {
                expectedOut[0] >>>= shift;
                PRIMITIVE_RIGHT.invokeExact(actualOut, input.length, shift);
            }
        } else if (left) LEFT.invokeExact(actualOut, actualIn, index, shift, count);
        else RIGHT.invokeExact(actualOut, actualIn, index, shift, count);
        if (!Arrays.equals(actualOut, expectedOut) || !Arrays.equals(actualIn, expectedIn)) {
            throw new AssertionError("shift=" + shift + ", left=" + left + ", alias=" + alias + ", index=" + index);
        }
        if (alias && index == (left ? 0 : 1)) {
            int[] snapshot = input.clone();
            oracle(left, snapshot, input, index, shift, count);
            if (left) snapshot[count] <<= shift;
            else snapshot[0] >>>= shift;
            if (!Arrays.equals(actualOut, snapshot)) throw new AssertionError("unread word overwritten");
        }
    }

    public static void main(String[] args) throws Throwable {
        Random random = new Random(42);
        for (int repetition = 0; repetition < 50; repetition++) {
            for (int length : new int[] {2, 3, 4, 8, 17, 64, 257}) {
                int[] input = random.ints(length).toArray();
                for (int shift = 1; shift < 32; shift++) {
                    for (boolean left : new boolean[] {false, true}) {
                        check(left, input, left ? 0 : 1, shift, true);
                        check(left, input, left ? 1 : 0, shift, false);
                        check(left, input, left ? 1 : 0, shift, true);
                        if (!left) check(false, input, 2, shift, false);
                    }
                }
            }
        }
    }
}
