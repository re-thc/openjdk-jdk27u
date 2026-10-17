/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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
 * @summary Require accepted spill-copy recoloring in a normal C2 compilation, with numeric controls
 * @requires vm.debug == true & vm.compiler2.enabled & (os.arch == "amd64" | os.arch == "x86_64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox compiler.regalloc.TestRetainSpillCopiesActivation
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver compiler.regalloc.TestRetainSpillCopiesActivation
 */

package compiler.regalloc;

import jdk.test.whitebox.WhiteBox;

public class TestRetainSpillCopies {
    private static volatile int callValue;

    // dontinline preserves this returning call; compileonly leaves its body
    // and the independent array-based oracle interpreted. No debugger
    // capability, deoptimization or GC test hooks.
    private static long returningCall(int[] data, long a, long b, int shift) {
        callValue = shift;
        return (a ^ b) + shift + data[(shift >>> 7) & 63];
    }

    private static long compiled(int[] data, long seed, int mode) {
        long a0 = seed + 1, a1 = seed + 2, a2 = seed + 3, a3 = seed + 4;
        long a4 = seed + 5, a5 = seed + 6, a6 = seed + 7, a7 = seed + 8;
        long a8 = seed + 9, a9 = seed + 10, a10 = seed + 11, a11 = seed + 12;
        long a12 = seed + 13, a13 = seed + 14, a14 = seed + 15, a15 = seed + 16;
        int[] invariant = data;
        int bits = mode;
        for (int outer = 0; outer < 3; outer++) {
            int[] nestedInvariant = invariant;
            for (int i = 0; i < 32; i++) {
                int x = nestedInvariant[(i + outer) & 63];
                bits = Integer.rotateLeft(bits + x, i & 31);
                long divisor = (x & 15) + 1L;
                long q = a0 / divisor; // x86 fixed dividend/result registers.
                long old = a15;
                int y0 = nestedInvariant[(int) q & 63];
                a15 = a14 + bits; a14 = a13 ^ q; a13 = a12 + x; a12 = a11 - bits + y0;
                int y1 = nestedInvariant[(int) a12 & 63];
                a11 = a10 ^ x; a10 = a9 + q; a9 = a8 - x; a8 = (a7 ^ bits) + y1;
                int y2 = nestedInvariant[(int) a8 & 63];
                a7 = a6 + x; a6 = a5 - q; a5 = a4 ^ bits; a4 = a3 + x + y2;
                int y3 = nestedInvariant[(int) a4 & 63];
                a3 = a2 - bits; a2 = a1 ^ q; a1 = a0 + x + y3;
                a0 = (mode & 1) == 0 ? old + q : old ^ q;
                if (((i + mode) & 31) == 7) {
                    a0 ^= returningCall(nestedInvariant, a8, a15, bits);
                }
            }
            if ((mode & 2) != 0) {
                long swap = a3; a3 = a12; a12 = swap;
            }
        }
        return a0 ^ a1 ^ a2 ^ a3 ^ a4 ^ a5 ^ a6 ^ a7 ^ a8 ^ a9 ^ a10 ^ a11
                ^ a12 ^ a13 ^ a14 ^ a15 ^ bits;
    }

    private static long reference(int[] data, long seed, int mode) {
        long[] state = new long[16];
        for (int i = 0; i < state.length; i++) state[i] = seed + i + 1;
        int bits = mode;
        for (int outer = 0; outer < 3; outer++) {
            for (int i = 0; i < 32; i++) {
                int x = data[(i + outer) & 63];
                bits = Integer.rotateLeft(bits + x, i & 31);
                long q = state[0] / ((x & 15) + 1L);
                long[] next = new long[16];
                next[0] = (mode & 1) == 0 ? state[15] + q : state[15] ^ q;
                next[2] = state[1] ^ q; next[3] = state[2] - bits;
                next[5] = state[4] ^ bits; next[6] = state[5] - q;
                next[7] = state[6] + x;
                next[9] = state[8] - x; next[10] = state[9] + q;
                next[11] = state[10] ^ x; next[12] = state[11] - bits + data[(int) q & 63];
                next[8] = (state[7] ^ bits) + data[(int) next[12] & 63];
                next[4] = state[3] + x + data[(int) next[8] & 63];
                next[1] = state[0] + x + data[(int) next[4] & 63];
                next[13] = state[12] + x; next[14] = state[13] ^ q;
                next[15] = state[14] + bits;
                if (((i + mode) & 31) == 7) next[0] ^= (next[8] ^ next[15]) + bits + data[(bits >>> 7) & 63];
                state = next;
            }
            if ((mode & 2) != 0) {
                long swap = state[3]; state[3] = state[12]; state[12] = swap;
            }
        }
        long result = bits;
        for (long value : state) result ^= value;
        return result;
    }

    public static void main(String[] args) throws Exception {
        int[] data = new int[64];
        for (int i = 0; i < data.length; i++) data[i] = i * 0x7f4a7c15 + 0x9e3779b9;
        for (int i = 0; i < 1200; i++) {
            long seed = 0x123456789abcdef0L + 0x9e3779b97f4a7c15L * i;
            int mode = i & 7;
            long expected = reference(data, seed, mode);
            long actual = compiled(data, seed, mode);
            if (actual != expected) {
                throw new AssertionError("case " + i + ": " + actual + " != " + expected);
            }
        }
        var method = TestRetainSpillCopies.class.getDeclaredMethod("compiled", int[].class, long.class, int.class);
        if (WhiteBox.getWhiteBox().getMethodCompilationLevel(method) != 4) {
            throw new AssertionError("numeric stress method was not compiled by C2");
        }
        System.out.println("RETENTION_ORACLE_PASS cases=1200");
    }
}
