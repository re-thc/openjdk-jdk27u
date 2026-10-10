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
 * @summary Common intrinsic entries deliver JVMTI method-entry events
 * @requires vm.jvmti
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @modules java.base/jdk.internal.util
 * @run main/othervm/native -agentlib:TestCommonIntrinsicEvents -Xint -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntrinsicEvents
 * @run main/othervm/native -agentlib:TestCommonIntrinsicEvents -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics compiler.intrinsics.common.TestCommonIntrinsicEvents
 */

package compiler.intrinsics.common;

import jdk.internal.util.ArraysSupport;

public class TestCommonIntrinsicEvents {
    private static volatile long sink;
    private static native void setEnabled(boolean enabled);
    private static native long[] eventCounts();

    private static long workload(int[] input, int value) {
        return Math.addExact(value, 7) ^ Integer.numberOfLeadingZeros(value)
                ^ Integer.numberOfTrailingZeros(value) ^ Long.bitCount(value)
                ^ Long.reverse(value) ^ ArraysSupport.hashCode(input, 0, input.length, 1);
    }

    public static void main(String[] args) {
        System.loadLibrary("TestCommonIntrinsicEvents");
        int[] input = new int[64];
        long before = 0;
        for (int i = 0; i < 20_000; i++) before ^= workload(input, i);
        sink = before;
        int iterations = 256;
        long expected = 0;
        for (int i = 0; i < iterations; i++) expected ^= workload(input, i);
        setEnabled(true);
        long actual = 0;
        try {
            for (int i = 0; i < iterations; i++) actual ^= workload(input, i);
        } finally {
            setEnabled(false);
        }
        if (actual != expected) throw new AssertionError("events changed results");
        String[] methods = {"addExact", "numberOfLeadingZeros", "numberOfTrailingZeros",
                            "bitCount", "reverse", "vectorizedHashCode"};
        long[] counts = eventCounts();
        for (int i = 0; i < methods.length; i++) {
            if (counts[i] < iterations) {
                throw new AssertionError("missing entry events for " + methods[i] + ": " + counts[i]);
            }
        }
    }
}
