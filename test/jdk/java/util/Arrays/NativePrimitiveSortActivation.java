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
 * @summary Assert that supported builds activate native long sorting and honor opt-out
 * @requires (os.family == "linux" & os.arch == "amd64") & vm.jvmti & !vm.asan
 * @library /test/lib
 * @build NativePrimitiveSort NativePrimitiveSortSupport
 * @run main/othervm/native --enable-native-access=ALL-UNNAMED NativePrimitiveSortActivation
 */

import java.util.Arrays;

public class NativePrimitiveSortActivation {
    public static void main(String[] args) throws Exception {
        if (args.length == 0) {
            if (!NativePrimitiveSortSupport.supportedBuild()) return;
            NativePrimitiveSortSupport.child("NativePrimitiveSortActivation", "-Djdk.util.Arrays.disableNativeSort=false");
            NativePrimitiveSortSupport.child("NativePrimitiveSortActivation", "-Djdk.util.Arrays.disableNativeSort=false", "-Xint");
            NativePrimitiveSortSupport.child("NativePrimitiveSortActivation", "-Djdk.util.Arrays.disableNativeSort=false", "-XX:TieredStopAtLevel=1");
            NativePrimitiveSortSupport.child("NativePrimitiveSortActivation", "-Djdk.util.Arrays.disableNativeSort=true");
            return;
        }
        NativePrimitiveSortSupport.load();
        int low = 17, n = 65537;
        long[] input = NativePrimitiveSortSupport.input(low, n, 20261019, false);
        long[] expected = NativePrimitiveSort.oracle(input, low, n, 8);
        for (int iteration = 0; iteration < 4; iteration++) {
            long[] actual = input.clone();
            Arrays.sort(actual, low, low + n);
            NativePrimitiveSortSupport.check(actual, expected);
        }
        long[] stats = NativePrimitiveSortSupport.stats();
        boolean expectedNative = !Boolean.getBoolean("jdk.util.Arrays.disableNativeSort");
        if ((stats[0] > 0) != expectedNative) throw new AssertionError("Native activation: " + Arrays.toString(stats));
        // After return, only the runtime pool measured after the first call may remain.
        long live = stats[3];
        long[] actual = input.clone(); Arrays.sort(actual, low, low + n);
        NativePrimitiveSortSupport.check(actual, expected);
        if (NativePrimitiveSortSupport.stats()[3] != live) throw new AssertionError("Unreleased native buffer");
        for (int direction : new int[]{-1, 1}) for (int run : new int[]{15, 16}) {
            long[] boundary = input.clone();
            for (int i = 0; i < run; i++) boundary[low + i] = direction * i;
            boundary[low + run] = direction > 0 ? Long.MIN_VALUE : Long.MAX_VALUE;
            long[] oracle = NativePrimitiveSort.oracle(boundary, low, n, 8);
            long before = NativePrimitiveSortSupport.stats()[0];
            Arrays.sort(boundary, low, low + n);
            NativePrimitiveSortSupport.check(boundary, oracle);
            boolean used = NativePrimitiveSortSupport.stats()[0] > before;
            if (used != (expectedNative && run == 15)) throw new AssertionError("First-run admission boundary " + run);
        }
        long[] whole = Arrays.copyOfRange(input, low, low + n);
        long[] oracle = NativePrimitiveSort.oracle(whole, 0, n, 8);
        long before = NativePrimitiveSortSupport.stats()[0];
        Arrays.sort(whole); NativePrimitiveSortSupport.check(whole, oracle);
        if ((NativePrimitiveSortSupport.stats()[0] > before) != expectedNative) throw new AssertionError("Whole-array activation");
        System.out.println("PASS native activation expected=" + expectedNative + " " + Arrays.toString(stats));
    }
}
