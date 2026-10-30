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
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
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
 * @bug 8387145 8387204
 * @summary Masked logic fusion preserves operand order and every inactive lane
 * @requires vm.compiler2.enabled
 * @requires os.simpleArch == "x64"
 * @modules jdk.incubator.vector
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=1000 -XX:CompileCommand=inline,compiler.vectorapi.TestMaskedLogicPassthrough::*Kernel -XX:UseAVX=2 compiler.vectorapi.TestMaskedLogicPassthrough
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=1000 -XX:CompileCommand=inline,compiler.vectorapi.TestMaskedLogicPassthrough::*Kernel -XX:UseAVX=3 compiler.vectorapi.TestMaskedLogicPassthrough
 */

package compiler.vectorapi;

import java.lang.reflect.Array;
import jdk.incubator.vector.*;

public class TestMaskedLogicPassthrough {
    private static final int SIZE = 64;
    private static final int RESULTS = 10;
    private static final int WARMUP = 5000;
    private static long checks;
    private static long failures;

    private static void byteKernel(VectorSpecies<Byte> species,
                                   byte[] aa, byte[] bb, byte[] cc,
                                   boolean[] mm, boolean[] qq, byte[][] rr) {
        for (int i = 0; i < SIZE; i += species.length()) {
            var a = ByteVector.fromArray(species, aa, i);
            var b = ByteVector.fromArray(species, bb, i);
            var c = ByteVector.fromArray(species, cc, i);
            var m = VectorMask.fromArray(species, mm, i);
            var q = VectorMask.fromArray(species, qq, i);
            var all = ByteVector.broadcast(species, (byte) -1);
            all.lanewise(VectorOperators.XOR, a, m).lanewise(VectorOperators.OR, b, m).intoArray(rr[0], i);
            a.lanewise(VectorOperators.XOR, all, m).lanewise(VectorOperators.OR, b, m).intoArray(rr[1], i);
            all.lanewise(VectorOperators.XOR, a, m).lanewise(VectorOperators.AND, b, m).intoArray(rr[2], i);
            a.lanewise(VectorOperators.XOR, all, m).lanewise(VectorOperators.AND, b, m).intoArray(rr[3], i);
            all.lanewise(VectorOperators.XOR, a, m).lanewise(VectorOperators.XOR, b, m).intoArray(rr[4], i);
            a.lanewise(VectorOperators.XOR, all, m).lanewise(VectorOperators.XOR, b, m).intoArray(rr[5], i);
            a.lanewise(VectorOperators.XOR, b, m).lanewise(VectorOperators.AND, b.lanewise(VectorOperators.OR, c, q), m).intoArray(rr[6], i);
            b.lanewise(VectorOperators.OR, c, q).lanewise(VectorOperators.AND, a.lanewise(VectorOperators.XOR, b, m), m).intoArray(rr[7], i);
            a.lanewise(VectorOperators.AND, b.lanewise(VectorOperators.OR, c, q), m).intoArray(rr[8], i);
            a.lanewise(VectorOperators.XOR, all).lanewise(VectorOperators.OR, b).intoArray(rr[9], i);
        }
    }

    private static void byte64(byte[] a, byte[] b, byte[] c,
                               boolean[] m, boolean[] q, byte[][] r) {
        byteKernel(ByteVector.SPECIES_64, a, b, c, m, q, r);
    }

    private static void byte128(byte[] a, byte[] b, byte[] c,
                                boolean[] m, boolean[] q, byte[][] r) {
        byteKernel(ByteVector.SPECIES_128, a, b, c, m, q, r);
    }

    private static void byte256(byte[] a, byte[] b, byte[] c,
                                boolean[] m, boolean[] q, byte[][] r) {
        byteKernel(ByteVector.SPECIES_256, a, b, c, m, q, r);
    }

    private static void byte512(byte[] a, byte[] b, byte[] c,
                                boolean[] m, boolean[] q, byte[][] r) {
        byteKernel(ByteVector.SPECIES_512, a, b, c, m, q, r);
    }

    private static void byteMAX(byte[] a, byte[] b, byte[] c,
                                boolean[] m, boolean[] q, byte[][] r) {
        byteKernel(ByteVector.SPECIES_MAX, a, b, c, m, q, r);
    }

    private static void shortKernel(VectorSpecies<Short> species,
                                    short[] aa, short[] bb, short[] cc,
                                    boolean[] mm, boolean[] qq, short[][] rr) {
        for (int i = 0; i < SIZE; i += species.length()) {
            var a = ShortVector.fromArray(species, aa, i);
            var b = ShortVector.fromArray(species, bb, i);
            var c = ShortVector.fromArray(species, cc, i);
            var m = VectorMask.fromArray(species, mm, i);
            var q = VectorMask.fromArray(species, qq, i);
            var all = ShortVector.broadcast(species, (short) -1);
            all.lanewise(VectorOperators.XOR, a, m).lanewise(VectorOperators.OR, b, m).intoArray(rr[0], i);
            a.lanewise(VectorOperators.XOR, all, m).lanewise(VectorOperators.OR, b, m).intoArray(rr[1], i);
            all.lanewise(VectorOperators.XOR, a, m).lanewise(VectorOperators.AND, b, m).intoArray(rr[2], i);
            a.lanewise(VectorOperators.XOR, all, m).lanewise(VectorOperators.AND, b, m).intoArray(rr[3], i);
            all.lanewise(VectorOperators.XOR, a, m).lanewise(VectorOperators.XOR, b, m).intoArray(rr[4], i);
            a.lanewise(VectorOperators.XOR, all, m).lanewise(VectorOperators.XOR, b, m).intoArray(rr[5], i);
            a.lanewise(VectorOperators.XOR, b, m).lanewise(VectorOperators.AND, b.lanewise(VectorOperators.OR, c, q), m).intoArray(rr[6], i);
            b.lanewise(VectorOperators.OR, c, q).lanewise(VectorOperators.AND, a.lanewise(VectorOperators.XOR, b, m), m).intoArray(rr[7], i);
            a.lanewise(VectorOperators.AND, b.lanewise(VectorOperators.OR, c, q), m).intoArray(rr[8], i);
            a.lanewise(VectorOperators.XOR, all).lanewise(VectorOperators.OR, b).intoArray(rr[9], i);
        }
    }

    private static void short64(short[] a, short[] b, short[] c,
                                boolean[] m, boolean[] q, short[][] r) {
        shortKernel(ShortVector.SPECIES_64, a, b, c, m, q, r);
    }

    private static void short128(short[] a, short[] b, short[] c,
                                 boolean[] m, boolean[] q, short[][] r) {
        shortKernel(ShortVector.SPECIES_128, a, b, c, m, q, r);
    }

    private static void short256(short[] a, short[] b, short[] c,
                                 boolean[] m, boolean[] q, short[][] r) {
        shortKernel(ShortVector.SPECIES_256, a, b, c, m, q, r);
    }

    private static void short512(short[] a, short[] b, short[] c,
                                 boolean[] m, boolean[] q, short[][] r) {
        shortKernel(ShortVector.SPECIES_512, a, b, c, m, q, r);
    }

    private static void shortMAX(short[] a, short[] b, short[] c,
                                 boolean[] m, boolean[] q, short[][] r) {
        shortKernel(ShortVector.SPECIES_MAX, a, b, c, m, q, r);
    }

    private static void intKernel(VectorSpecies<Integer> species,
                                  int[] aa, int[] bb, int[] cc,
                                  boolean[] mm, boolean[] qq, int[][] rr) {
        for (int i = 0; i < SIZE; i += species.length()) {
            var a = IntVector.fromArray(species, aa, i);
            var b = IntVector.fromArray(species, bb, i);
            var c = IntVector.fromArray(species, cc, i);
            var m = VectorMask.fromArray(species, mm, i);
            var q = VectorMask.fromArray(species, qq, i);
            var all = IntVector.broadcast(species, -1);
            all.lanewise(VectorOperators.XOR, a, m).lanewise(VectorOperators.OR, b, m).intoArray(rr[0], i);
            a.lanewise(VectorOperators.XOR, all, m).lanewise(VectorOperators.OR, b, m).intoArray(rr[1], i);
            all.lanewise(VectorOperators.XOR, a, m).lanewise(VectorOperators.AND, b, m).intoArray(rr[2], i);
            a.lanewise(VectorOperators.XOR, all, m).lanewise(VectorOperators.AND, b, m).intoArray(rr[3], i);
            all.lanewise(VectorOperators.XOR, a, m).lanewise(VectorOperators.XOR, b, m).intoArray(rr[4], i);
            a.lanewise(VectorOperators.XOR, all, m).lanewise(VectorOperators.XOR, b, m).intoArray(rr[5], i);
            a.lanewise(VectorOperators.XOR, b, m).lanewise(VectorOperators.AND, b.lanewise(VectorOperators.OR, c, q), m).intoArray(rr[6], i);
            b.lanewise(VectorOperators.OR, c, q).lanewise(VectorOperators.AND, a.lanewise(VectorOperators.XOR, b, m), m).intoArray(rr[7], i);
            a.lanewise(VectorOperators.AND, b.lanewise(VectorOperators.OR, c, q), m).intoArray(rr[8], i);
            a.lanewise(VectorOperators.XOR, all).lanewise(VectorOperators.OR, b).intoArray(rr[9], i);
        }
    }

    private static void int64(int[] a, int[] b, int[] c,
                              boolean[] m, boolean[] q, int[][] r) {
        intKernel(IntVector.SPECIES_64, a, b, c, m, q, r);
    }

    private static void int128(int[] a, int[] b, int[] c,
                               boolean[] m, boolean[] q, int[][] r) {
        intKernel(IntVector.SPECIES_128, a, b, c, m, q, r);
    }

    private static void int256(int[] a, int[] b, int[] c,
                               boolean[] m, boolean[] q, int[][] r) {
        intKernel(IntVector.SPECIES_256, a, b, c, m, q, r);
    }

    private static void int512(int[] a, int[] b, int[] c,
                               boolean[] m, boolean[] q, int[][] r) {
        intKernel(IntVector.SPECIES_512, a, b, c, m, q, r);
    }

    private static void intMAX(int[] a, int[] b, int[] c,
                               boolean[] m, boolean[] q, int[][] r) {
        intKernel(IntVector.SPECIES_MAX, a, b, c, m, q, r);
    }

    private static void longKernel(VectorSpecies<Long> species,
                                   long[] aa, long[] bb, long[] cc,
                                   boolean[] mm, boolean[] qq, long[][] rr) {
        for (int i = 0; i < SIZE; i += species.length()) {
            var a = LongVector.fromArray(species, aa, i);
            var b = LongVector.fromArray(species, bb, i);
            var c = LongVector.fromArray(species, cc, i);
            var m = VectorMask.fromArray(species, mm, i);
            var q = VectorMask.fromArray(species, qq, i);
            var all = LongVector.broadcast(species, -1L);
            all.lanewise(VectorOperators.XOR, a, m).lanewise(VectorOperators.OR, b, m).intoArray(rr[0], i);
            a.lanewise(VectorOperators.XOR, all, m).lanewise(VectorOperators.OR, b, m).intoArray(rr[1], i);
            all.lanewise(VectorOperators.XOR, a, m).lanewise(VectorOperators.AND, b, m).intoArray(rr[2], i);
            a.lanewise(VectorOperators.XOR, all, m).lanewise(VectorOperators.AND, b, m).intoArray(rr[3], i);
            all.lanewise(VectorOperators.XOR, a, m).lanewise(VectorOperators.XOR, b, m).intoArray(rr[4], i);
            a.lanewise(VectorOperators.XOR, all, m).lanewise(VectorOperators.XOR, b, m).intoArray(rr[5], i);
            a.lanewise(VectorOperators.XOR, b, m).lanewise(VectorOperators.AND, b.lanewise(VectorOperators.OR, c, q), m).intoArray(rr[6], i);
            b.lanewise(VectorOperators.OR, c, q).lanewise(VectorOperators.AND, a.lanewise(VectorOperators.XOR, b, m), m).intoArray(rr[7], i);
            a.lanewise(VectorOperators.AND, b.lanewise(VectorOperators.OR, c, q), m).intoArray(rr[8], i);
            a.lanewise(VectorOperators.XOR, all).lanewise(VectorOperators.OR, b).intoArray(rr[9], i);
        }
    }

    private static void long64(long[] a, long[] b, long[] c,
                               boolean[] m, boolean[] q, long[][] r) {
        longKernel(LongVector.SPECIES_64, a, b, c, m, q, r);
    }

    private static void long128(long[] a, long[] b, long[] c,
                                boolean[] m, boolean[] q, long[][] r) {
        longKernel(LongVector.SPECIES_128, a, b, c, m, q, r);
    }

    private static void long256(long[] a, long[] b, long[] c,
                                boolean[] m, boolean[] q, long[][] r) {
        longKernel(LongVector.SPECIES_256, a, b, c, m, q, r);
    }

    private static void long512(long[] a, long[] b, long[] c,
                                boolean[] m, boolean[] q, long[][] r) {
        longKernel(LongVector.SPECIES_512, a, b, c, m, q, r);
    }

    private static void longMAX(long[] a, long[] b, long[] c,
                                boolean[] m, boolean[] q, long[][] r) {
        longKernel(LongVector.SPECIES_MAX, a, b, c, m, q, r);
    }

    // Each callee has a fixed species and a constant typed expression tree.
    private static void run(int type, int shape, Object a, Object b, Object c,
                            boolean[] m, boolean[] q, Object r) {
        switch (type) {
            case 0 -> {
                var aa = (byte[]) a;
                var bb = (byte[]) b;
                var cc = (byte[]) c;
                var rr = (byte[][]) r;
                switch (shape) {
                    case 0 -> byte64(aa, bb, cc, m, q, rr);
                    case 1 -> byte128(aa, bb, cc, m, q, rr);
                    case 2 -> byte256(aa, bb, cc, m, q, rr);
                    case 3 -> byte512(aa, bb, cc, m, q, rr);
                    case 4 -> byteMAX(aa, bb, cc, m, q, rr);
                    default -> throw new AssertionError(shape);
                }
            }
            case 1 -> {
                var aa = (short[]) a;
                var bb = (short[]) b;
                var cc = (short[]) c;
                var rr = (short[][]) r;
                switch (shape) {
                    case 0 -> short64(aa, bb, cc, m, q, rr);
                    case 1 -> short128(aa, bb, cc, m, q, rr);
                    case 2 -> short256(aa, bb, cc, m, q, rr);
                    case 3 -> short512(aa, bb, cc, m, q, rr);
                    case 4 -> shortMAX(aa, bb, cc, m, q, rr);
                    default -> throw new AssertionError(shape);
                }
            }
            case 2 -> {
                var aa = (int[]) a;
                var bb = (int[]) b;
                var cc = (int[]) c;
                var rr = (int[][]) r;
                switch (shape) {
                    case 0 -> int64(aa, bb, cc, m, q, rr);
                    case 1 -> int128(aa, bb, cc, m, q, rr);
                    case 2 -> int256(aa, bb, cc, m, q, rr);
                    case 3 -> int512(aa, bb, cc, m, q, rr);
                    case 4 -> intMAX(aa, bb, cc, m, q, rr);
                    default -> throw new AssertionError(shape);
                }
            }
            case 3 -> {
                var aa = (long[]) a;
                var bb = (long[]) b;
                var cc = (long[]) c;
                var rr = (long[][]) r;
                switch (shape) {
                    case 0 -> long64(aa, bb, cc, m, q, rr);
                    case 1 -> long128(aa, bb, cc, m, q, rr);
                    case 2 -> long256(aa, bb, cc, m, q, rr);
                    case 3 -> long512(aa, bb, cc, m, q, rr);
                    case 4 -> longMAX(aa, bb, cc, m, q, rr);
                    default -> throw new AssertionError(shape);
                }
            }
            default -> throw new AssertionError(type);
        }
    }

    private static long expected(int expression, long a, long b, long c, boolean m, boolean q) {
        long leftAll = m ? ~a : -1L;
        long leftA = m ? ~a : a;
        long right = q ? b | c : b;
        long left = m ? a ^ b : a;
        return switch (expression) {
            case 0 -> m ? leftAll | b : leftAll;
            case 1 -> m ? leftA | b : leftA;
            case 2 -> m ? leftAll & b : leftAll;
            case 3 -> m ? leftA & b : leftA;
            case 4 -> m ? leftAll ^ b : leftAll;
            case 5 -> m ? leftA ^ b : leftA;
            case 6 -> m ? left & right : left;
            case 7 -> m ? right & left : right;
            case 8 -> m ? a & right : a;
            case 9 -> ~a | b;
            default -> throw new AssertionError(expression);
        };
    }

    private static void set(Object array, int index, long value) {
        if (array instanceof byte[] x) x[index] = (byte) value;
        else if (array instanceof short[] x) x[index] = (short) value;
        else if (array instanceof int[] x) x[index] = (int) value;
        else ((long[]) array)[index] = value;
    }

    private static void masks(boolean[] m, boolean[] q, int pattern) {
        for (int i = 0; i < SIZE; i++) {
            m[i] = switch (pattern) {
                case 0 -> false;
                case 1 -> true;
                case 2, 3 -> (i & 1) == 0;
                case 4 -> i % 3 != 0;
                default -> throw new AssertionError(pattern);
            };
            q[i] = switch (pattern) {
                case 0 -> false;
                case 1 -> true;
                case 2 -> m[i];
                case 3 -> !m[i];
                case 4 -> i % 5 < 2;
                default -> throw new AssertionError(pattern);
            };
        }
    }

    public static void main(String[] args) {
        Class<?>[] types = {byte.class, short.class, int.class, long.class};
        int[] bits = {8, 16, 32, 64};
        String[] shapes = {"64", "128", "256", "512", "MAX"};
        for (int type = 0; type < types.length; type++) {
            long laneMask = bits[type] == 64 ? -1L : (1L << bits[type]) - 1;
            long[] values = {0, 1, -1, Long.MIN_VALUE, Long.MAX_VALUE,
                             1L << (bits[type] - 1), (1L << (bits[type] - 1)) - 1,
                             0x5555555555555555L, 0xaaaaaaaaaaaaaaaaL};
            Object a = Array.newInstance(types[type], SIZE);
            Object b = Array.newInstance(types[type], SIZE);
            Object c = Array.newInstance(types[type], SIZE);
            Object r = Array.newInstance(types[type], RESULTS, SIZE);
            for (int i = 0; i < SIZE; i++) {
                set(a, i, values[i % values.length]);
                set(b, i, values[(i * 3 + 1) % values.length]);
                set(c, i, values[(i * 5 + 2) % values.length]);
            }
            for (int shape = 0; shape < shapes.length; shape++) {
                for (int pattern = 0; pattern < 5; pattern++) {
                    boolean[] m = new boolean[SIZE];
                    boolean[] q = new boolean[SIZE];
                    masks(m, q, pattern);
                    for (int i = 0; i < WARMUP; i++) run(type, shape, a, b, c, m, q, r);
                    run(type, shape, a, b, c, m, q, r);
                    for (int expression = 0; expression < RESULTS; expression++) {
                        Object result = Array.get(r, expression);
                        for (int i = 0; i < SIZE; i++) {
                            long want = expected(expression, Array.getLong(a, i), Array.getLong(b, i),
                                                 Array.getLong(c, i), m[i], q[i]) & laneMask;
                            long got = Array.getLong(result, i) & laneMask;
                            checks++;
                            if (got != want) {
                                if (failures < 12) {
                                    System.out.printf("%s%s mask=%d expression=%d lane=%d got=%x expected=%x%n",
                                                      types[type], shapes[shape], pattern, expression, i, got, want);
                                }
                                failures++;
                            }
                        }
                    }
                }
            }
        }
        System.out.println("Checked " + checks + " lanes; failures=" + failures);
        if (failures != 0) throw new AssertionError("Masked logic passthrough failures: " + failures);
    }
}
