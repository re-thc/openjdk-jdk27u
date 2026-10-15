/*
 * Copyright (c) 2026, re-thc. All rights reserved.
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
 * @summary Extract masked long fields after truncating to int on AArch64.
 * @requires vm.compiler2.enabled & (os.arch == "aarch64")
 * @run main/othervm -XX:-TieredCompilation -Xbatch
 *      -XX:CompileCommand=dontinline,compiler.c2.aarch64.TestLongBitfieldExtract::extract*
 *      compiler.c2.aarch64.TestLongBitfieldExtract
 */
package compiler.c2.aarch64;

import java.util.Random;

public class TestLongBitfieldExtract {
    public static int extract32(long x) { return (int)(x >>> 32) & 255; }
    public static int extract40(long x) { return (int)(x >>> 40) & 255; }
    public static int extract48(long x) { return (int)(x >>> 48) & 65535; }
    public static int extract31(long x) { return (int)(x >>> 31) & 0x7fffffff; }
    public static int extract63(long x) { return (int)(x >>> 63) & 255; }
    public static int extract64(long x) { return (int)(x >>> 64) & 255; }
    public static int extractNegative(long x) { return (int)(x >>> -24) & 255; }
    public static int extractNarrowMask(long x) { return (int)(x >>> 40) & 0x55; }

    private static int expected(long x, int shift, int mask) {
        int result = 0;
        shift &= 63;
        for (int bit = 0; bit < 31; bit++) {
            if (shift + bit < 64 && (mask & (1 << bit)) != 0
                    && (x & (1L << (shift + bit))) != 0) result |= 1 << bit;
        }
        return result;
    }
    private static void check(long x) {
        int[] actual = {extract32(x), extract40(x), extract48(x), extract31(x),
                        extract63(x), extract64(x), extractNegative(x), extractNarrowMask(x)};
        int[] shifts = {32, 40, 48, 31, 63, 64, -24, 40};
        int[] masks = {255, 255, 65535, 0x7fffffff, 255, 255, 255, 0x55};
        for (int i = 0; i < actual.length; i++) {
            if (actual[i] != expected(x, shifts[i], masks[i]))
                throw new AssertionError("case " + i + " value " + x);
        }
    }
    public static void main(String[] args) {
        for (long x : new long[] {0, -1, Long.MIN_VALUE, Long.MAX_VALUE}) check(x);
        Random random = new Random(27);
        for (int i = 0; i < 100_000; i++) check(random.nextLong());
        System.out.println("100004 randomized and boundary bitfield cases passed");
    }
}
