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
 * @summary Common interpreter entries honor breakpoints without MethodEntry events
 * @requires vm.jvmti
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @modules java.base/jdk.internal.util
 * @run main/othervm/native -agentlib:TestCommonIntrinsicBreakpoints -Xint -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntrinsicBreakpoints
 */

package compiler.intrinsics.common;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import jdk.internal.util.ArraysSupport;

public class TestCommonIntrinsicBreakpoints {
    private static final MethodHandle REVERSE;
    private static volatile long sink;

    static {
        try {
            REVERSE = MethodHandles.lookup().findStatic(Integer.class, "reverse",
                                                       MethodType.methodType(int.class, int.class));
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private static native void install();
    private static native void clearFirstAddBreakpoint();
    private static native void remove();
    private static native long[] counts();

    private static long workload(int[] input, int value) throws Throwable {
        int indirect = (int) REVERSE.invokeExact(value);
        return Integer.reverse(value) + (long) indirect + Math.addExact(value, 7)
                + Long.reverse((long) value) + ArraysSupport.hashCode(input, 0, input.length, 1);
    }

    private static long run(int[] input, int iterations) throws Throwable {
        long result = 0;
        for (int i = 0; i < iterations; i++) {
            result ^= workload(input, i + 100);
        }
        return result;
    }

    private static void checkCounts(int iterations, boolean firstAddCleared) {
        String[] locations = {"Integer.reverse@0", "Math.addExact@0", "Math.addExact@1",
                              "Long.reverse@0", "ArraysSupport.vectorizedHashCode@0"};
        long[] actual = counts();
        for (int i = 0; i < locations.length; i++) {
            long expected = i == 0 ? 2L * iterations : iterations;
            if (i == 1 && firstAddCleared) {
                if (actual[i] != 0) {
                    throw new AssertionError("cleared breakpoint still reported: " + locations[i]);
                }
            } else if (actual[i] < expected) {
                throw new AssertionError("missing breakpoint " + locations[i] + ": " + actual[i]);
            }
        }
    }

    public static void main(String[] args) throws Throwable {
        System.loadLibrary("TestCommonIntrinsicBreakpoints");
        int[] input = new int[64];
        for (int i = 0; i < input.length; i++) {
            input[i] = i * 31;
        }
        sink = run(input, 20_000);
        int iterations = 128;
        long expected = run(input, iterations);
        for (int phase = 0; phase < 2; phase++) {
            install();
            try {
                if (run(input, iterations) != expected) {
                    throw new AssertionError("breakpoints changed results");
                }
                checkCounts(iterations, false);
                clearFirstAddBreakpoint();
                if (run(input, iterations) != expected) {
                    throw new AssertionError("partial removal changed results");
                }
                checkCounts(iterations, true);
            } finally {
                remove();
            }
            if (run(input, iterations) != expected) {
                throw new AssertionError("breakpoint removal changed results");
            }
        }
    }
}
