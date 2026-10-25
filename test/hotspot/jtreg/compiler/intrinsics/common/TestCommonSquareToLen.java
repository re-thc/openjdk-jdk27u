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
 * @summary Typed square-to-length calls preserve results, destination identity and input
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @run main/othervm --add-opens=java.base/java.math=ALL-UNNAMED -Xint -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonSquareToLen
 * @run main/othervm --add-opens=java.base/java.math=ALL-UNNAMED -Xint -XX:-UseCommonIntrinsics compiler.intrinsics.common.TestCommonSquareToLen
 * @run main/othervm --add-opens=java.base/java.math=ALL-UNNAMED -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonSquareToLen
 * @run main/othervm --add-opens=java.base/java.math=ALL-UNNAMED -Xbatch -XX:TieredStopAtLevel=1 -XX:-UseCommonIntrinsics compiler.intrinsics.common.TestCommonSquareToLen
 * @run main/othervm --add-opens=java.base/java.math=ALL-UNNAMED -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonSquareToLen
 */

package compiler.intrinsics.common;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.math.BigInteger;
import java.util.Arrays;
import java.util.Random;

public class TestCommonSquareToLen {
    private static final MethodHandle SQUARE;
    static {
        try {
            SQUARE = MethodHandles.privateLookupIn(BigInteger.class, MethodHandles.lookup())
                    .findStatic(BigInteger.class, "squareToLen", MethodType.methodType(int[].class,
                            int[].class, int.class, int[].class));
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private static BigInteger magnitude(int[] words) {
        byte[] bytes = new byte[words.length * 4];
        for (int i = 0; i < words.length; i++) {
            for (int j = 0; j < 4; j++) {
                bytes[i * 4 + j] = (byte) (words[i] >>> (24 - j * 8));
            }
        }
        return new BigInteger(1, bytes);
    }

    private static void check(int[] input, int length) throws Throwable {
        int[] original = input.clone();
        int[] output = new int[length * 2];
        int[] result = (int[]) SQUARE.invokeExact(input, length, output);
        BigInteger value = magnitude(Arrays.copyOf(input, length));
        // Distinct operands select multiplication rather than BigInteger's square path.
        BigInteger expected = value.multiply(new BigInteger(value.toByteArray()));
        if (result != output || !Arrays.equals(input, original) ||
                !magnitude(output).equals(expected)) {
            throw new AssertionError("square result or array identity, length=" + length);
        }
    }

    public static void main(String[] args) throws Throwable {
        Random random = new Random(42);
        int[] warmup = random.ints(16).toArray();
        int[] warmResult = new int[warmup.length * 2];
        for (int i = 0; i < 10_000; i++) {
            warmResult = (int[]) SQUARE.invokeExact(warmup, warmup.length, warmResult);
        }
        for (int length : new int[] {1, 2, 3, 16, 31, 64, 127, 128, 257, 2048, 2049}) {
            check(random.ints(length + 7).toArray(), length);
            int[] ones = new int[length + 7];
            Arrays.fill(ones, -1);
            check(ones, length);
            check(new int[length + 7], length);
        }
    }
}
