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
 * @summary Pending C1 expression-stack values precede shared bulk calls
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @run main/othervm -Xint -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonEvaluationOrder
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics -XX:CompileCommand=dontinline,compiler.intrinsics.common.TestCommonEvaluationOrder::hash* compiler.intrinsics.common.TestCommonEvaluationOrder
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics -XX:CompileCommand=dontinline,compiler.intrinsics.common.TestCommonEvaluationOrder::hash* compiler.intrinsics.common.TestCommonEvaluationOrder
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:-UseCommonIntrinsics compiler.intrinsics.common.TestCommonEvaluationOrder
 */

package compiler.intrinsics.common;

import java.util.Arrays;
import java.util.Random;

public class TestCommonEvaluationOrder {
    private static long hashBytes(long x, byte[] array) {
        return 4 * x + Arrays.hashCode(array);
    }

    private static long hashInts(long x, int[] array) {
        return 4 * x + Arrays.hashCode(array);
    }

    public static void main(String[] args) {
        Random random = new Random(42);
        byte[] bytes = new byte[257];
        random.nextBytes(bytes);
        int[] integers = random.ints(257).toArray();
        int byteHash = 1;
        for (byte value : bytes) {
            byteHash = 31 * byteHash + value;
        }
        int intHash = 1;
        for (int value : integers) {
            intHash = 31 * intHash + value;
        }
        for (int i = 0; i < 50_000; i++) {
            long x = 1234567890123L + i;
            if (hashBytes(x, bytes) != 4 * x + byteHash ||
                    hashInts(x, integers) != 4 * x + intHash) {
                throw new AssertionError("Pending expression changed a bulk result at iteration " + i);
            }
        }
    }
}
