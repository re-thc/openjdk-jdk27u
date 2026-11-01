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
 * @summary Guard failure restores invoke arguments and live C1 caller state
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @modules java.base/jdk.internal.util
 * @run main/othervm -Xint -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntrinsicFallback
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntrinsicFallback
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntrinsicFallback
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:-UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntrinsicFallback
 */

package compiler.intrinsics.common;

import jdk.internal.util.ArraysSupport;

public class TestCommonIntrinsicFallback {
    private static final Object lock = new Object();

    private static int hash(int[] input, int offset, int length, int seed) {
        synchronized (lock) {
            int live = seed ^ 0x12345678;
            int result = ArraysSupport.hashCode(input, offset, length, seed);
            if (live != (seed ^ 0x12345678)) throw new AssertionError("lost caller local");
            return result;
        }
    }

    private static int oracle(int[] input, int offset, int length, int seed) {
        int result = seed;
        for (int i = 0; i < length; i++) result = 31 * result + input[offset + i];
        return result;
    }

    private static void check(int[] input, int offset, int length, int seed) {
        Class<?> expectedException = null;
        int expected = 0;
        try {
            expected = oracle(input, offset, length, seed);
        } catch (RuntimeException e) {
            expectedException = e.getClass();
        }
        try {
            int actual = hash(input, offset, length, seed);
            if (expectedException != null || actual != expected) throw new AssertionError("wrong result");
        } catch (RuntimeException e) {
            if (e.getClass() != expectedException) throw new AssertionError("wrong exception", e);
        }
    }

    public static void main(String[] args) {
        int[] input = new int[80];
        for (int i = 0; i < input.length; i++) input[i] = i * 0x31415927;
        for (int i = 0; i < 20_000; i++) {
            check(input, 3, 64, i);
        }
        // Reach the same compiled call with inputs rejected by the native leaf.
        for (int i = 0; i < 20; i++) {
            check(null, 0, 64, i);
            check(input, -1, 64, i);
            check(input, 70, 64, i);
            check(input, 0, -16, i);
            check(input, 3, 64, i);
        }
        for (int length = 0; length <= 80; length++) {
            check(input, 0, length, 0x12345678);
        }
        // Large arrays stay in Java so the loop retains safepoints.
        check(new int[65537], 0, 65537, 1);
    }
}
