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
 * @summary Integral self-comparisons, constant-mask blends and partial-wrap shuffles
 * @modules jdk.incubator.vector
 * @run main/othervm -Xbatch -XX:-TieredCompilation compiler.vectorapi.TestVectorSelfCompareSemantics
 */
package compiler.vectorapi;

import java.lang.reflect.Array;
import jdk.incubator.vector.*;
import static jdk.incubator.vector.VectorOperators.*;

public class TestVectorSelfCompareSemantics {
    private static final VectorOperators.Comparison[] OPS = {
        EQ, NE, LT, LE, GT, GE, ULT, ULE, UGT, UGE
    };
    private static final boolean[] SELF = {true, false, false, true, false, true, false, true, false, true};
    private static long checks;

    private static void check(boolean value) {
        checks++;
        if (!value) throw new AssertionError("check " + checks);
    }

    private static <E> void integral(VectorSpecies<E> species, Object data, Object other) {
        Vector<E> v = species.fromArray(data, 0);
        Vector<E> w = species.fromArray(other, 0);
        for (int pattern = 0; pattern < 4; pattern++) {
            boolean[] active = new boolean[species.length()];
            for (int i = 0; i < active.length; i++) {
                active[i] = switch (pattern) {
                    case 0 -> false;
                    case 1 -> true;
                    case 2 -> (i & 1) == 0;
                    default -> i < active.length - 1;
                };
            }
            VectorMask<E> mask = VectorMask.fromArray(species, active, 0);
            for (int op = 0; op < OPS.length; op++) {
                VectorMask<E> full = v.compare(OPS[op], v);
                VectorMask<E> partial = v.compare(OPS[op], v, mask);
                VectorMask<E> different = v.compare(OPS[op], w);
                VectorMask<E> differentPartial = v.compare(OPS[op], w, mask);
                Object fullBlend = v.blend(w, full).toArray();
                Object partialBlend = v.blend(w, partial).toArray();
                for (int i = 0; i < species.length(); i++) {
                    long a = ((Number) Array.get(data, i)).longValue();
                    long b = ((Number) Array.get(other, i)).longValue();
                    long bits = -1L >>> (64 - species.elementSize());
                    int order = op < 6 ? Long.compare(a, b) : Long.compareUnsigned(a & bits, b & bits);
                    boolean expected = switch (op) {
                        case 0 -> order == 0;
                        case 1 -> order != 0;
                        case 2, 6 -> order < 0;
                        case 3, 7 -> order <= 0;
                        case 4, 8 -> order > 0;
                        default -> order >= 0;
                    };
                    check(different.laneIsSet(i) == expected);
                    check(differentPartial.laneIsSet(i) == (expected && active[i]));
                    check(full.laneIsSet(i) == SELF[op]);
                    check(partial.laneIsSet(i) == (SELF[op] && active[i]));
                    check(Array.get(fullBlend, i).equals(Array.get(SELF[op] ? other : data, i)));
                    check(Array.get(partialBlend, i).equals(Array.get(SELF[op] && active[i] ? other : data, i)));
                }
            }
        }
    }

    private static void shuffles(VectorSpecies<Byte> species) {
        int length = species.length();
        byte[] input = new byte[length], first = new byte[length], second = new byte[length];
        for (int i = 0; i < length; i++) {
            first[i] = (byte) (3 * i + 1);
            second[i] = (byte) (5 * i - 127);
        }
        ByteVector table = ByteVector.fromArray(species, first, 0);
        ByteVector other = ByteVector.fromArray(species, second, 0);
        // Every byte value, including negative and out-of-range shuffle sources.
        for (int base = -128; base < 128; base += length) {
            for (int i = 0; i < length; i++) input[i] = (byte) (base + i);
            ByteVector index = ByteVector.fromArray(species, input, 0);
            VectorShuffle<Byte> partial = index.toShuffle();
            byte[] twoSource = table.rearrange(partial, other).toArray();
            ByteVector wrappedIndex = index.and((byte) (length - 1));
            byte[] nibble = table.rearrange(wrappedIndex.toShuffle()).toArray();
            byte[] selected = wrappedIndex.selectFrom(table).toArray();
            for (int i = 0; i < length; i++) {
                int raw = input[i], wrapped = raw & (length - 1);
                boolean valid = raw >= 0 && raw < length;
                check(partial.laneSource(i) == (valid ? raw : wrapped - length));
                check(twoSource[i] == (valid ? first[wrapped] : second[wrapped]));
                check(nibble[i] == first[wrapped]);
                check(selected[i] == first[wrapped]);
            }
        }
    }

    private static void floating(VectorShape shape) {
        VectorSpecies<Float> fs = VectorSpecies.of(float.class, shape);
        VectorSpecies<Double> ds = VectorSpecies.of(double.class, shape);
        int[] fb = {0x7fc12345, 0xffc54321, 0x80000000, 0, 0x7f800000, 0xff800000, 1, 0x3f800000};
        long[] db = {0x7ff8123456789abcL, 0xfff8543212345678L, 0x8000000000000000L, 0,
                     0x7ff0000000000000L, 0xfff0000000000000L, 1, 0x3ff0000000000000L};
        float[] f = new float[fs.length()], g = new float[fs.length()];
        double[] d = new double[ds.length()], e = new double[ds.length()];
        for (int base = 0; base < 8; base++) {
            for (int i = 0; i < f.length; i++) {
                f[i] = Float.intBitsToFloat(fb[(base + i) & 7]);
                g[i] = Float.intBitsToFloat(fb[(base + i + 3) & 7]);
            }
            for (int i = 0; i < d.length; i++) {
                d[i] = Double.longBitsToDouble(db[(base + i) & 7]);
                e[i] = Double.longBitsToDouble(db[(base + i + 3) & 7]);
            }
            FloatVector fv = FloatVector.fromArray(fs, f, 0), fw = FloatVector.fromArray(fs, g, 0);
            DoubleVector dv = DoubleVector.fromArray(ds, d, 0), dw = DoubleVector.fromArray(ds, e, 0);
            for (int op = 0; op < 6; op++) {
                VectorMask<Float> fm = fv.compare(OPS[op], fv);
                VectorMask<Double> dm = dv.compare(OPS[op], dv);
                for (int i = 0; i < f.length; i++)
                    check(fm.laneIsSet(i) == (op == 1 ? Float.isNaN(f[i]) : SELF[op] && !Float.isNaN(f[i])));
                for (int i = 0; i < d.length; i++)
                    check(dm.laneIsSet(i) == (op == 1 ? Double.isNaN(d[i]) : SELF[op] && !Double.isNaN(d[i])));
            }
            for (boolean select : new boolean[] {false, true}) {
                float[] fr = fv.blend(fw, fs.maskAll(select)).toArray();
                double[] dr = dv.blend(dw, ds.maskAll(select)).toArray();
                for (int i = 0; i < f.length; i++)
                    check(Float.floatToRawIntBits(fr[i]) == Float.floatToRawIntBits(select ? g[i] : f[i]));
                for (int i = 0; i < d.length; i++)
                    check(Double.doubleToRawLongBits(dr[i]) == Double.doubleToRawLongBits(select ? e[i] : d[i]));
            }
        }
    }

    private static void tails(VectorSpecies<Byte> species) {
        for (int size : new int[] {0, 1, species.length() - 1, species.length() + 3}) {
            byte[] input = new byte[size], output = new byte[size];
            for (int i = 0; i < size; i++) input[i] = (byte) (i * 31);
            for (int offset = 0; offset <= size; offset += species.length()) {
                VectorMask<Byte> active = species.indexInRange(offset, size);
                ByteVector v = ByteVector.fromArray(species, input, offset, active);
                VectorMask<Byte> eq = v.compare(EQ, v, active);
                VectorMask<Byte> ne = v.compare(NE, v, active);
                for (int i = 0; i < species.length(); i++) {
                    check(eq.laneIsSet(i) == (offset + i < size));
                    check(!ne.laneIsSet(i));
                }
                v.intoArray(output, offset, eq);
            }
            for (int i = 0; i < size; i++) check(output[i] == input[i]);
        }
    }

    private static long checkedCompare(byte[] array, int offset) {
        ByteVector v = ByteVector.fromArray(ByteVector.SPECIES_128, array, offset);
        return v.compare(EQ, v).toLong();
    }

    private static void accessChecks() {
        byte[] array = new byte[32];
        for (int i = 0; i < 20000; i++) check(checkedCompare(array, i & 15) == 65535L);
        for (int offset : new int[] {-1, 17, Integer.MIN_VALUE, Integer.MAX_VALUE}) {
            try {
                checkedCompare(array, offset);
                throw new AssertionError("missing index exception: " + offset);
            } catch (IndexOutOfBoundsException expected) {
                checks++;
            }
        }
        try {
            checkedCompare(null, 0);
            throw new AssertionError("missing null exception");
        } catch (NullPointerException expected) {
            checks++;
        }
    }

    private static byte checkedBlendFalse(byte[] first, int firstOffset, byte[] second, int secondOffset) {
        ByteVector a = ByteVector.fromArray(ByteVector.SPECIES_128, first, firstOffset);
        ByteVector b = ByteVector.fromArray(ByteVector.SPECIES_128, second, secondOffset);
        return a.blend(b, ByteVector.SPECIES_128.maskAll(false)).lane(0);
    }

    private static byte checkedBlendTrue(byte[] first, int firstOffset, byte[] second, int secondOffset) {
        ByteVector a = ByteVector.fromArray(ByteVector.SPECIES_128, first, firstOffset);
        ByteVector b = ByteVector.fromArray(ByteVector.SPECIES_128, second, secondOffset);
        return a.blend(b, ByteVector.SPECIES_128.maskAll(true)).lane(0);
    }

    private static void expect(Class<? extends RuntimeException> type, Runnable action) {
        try {
            action.run();
            throw new AssertionError("missing " + type.getName());
        } catch (RuntimeException error) {
            if (!type.isInstance(error)) throw new AssertionError(error);
            checks++;
        }
    }

    private static void blendAccessChecks() {
        byte[] first = new byte[32], second = new byte[32];
        for (int i = 0; i < first.length; i++) {
            first[i] = (byte) (i * 31);
            second[i] = (byte) ~first[i];
        }
        for (int i = 0; i < 20000; i++) {
            int offset = i & 15;
            check(checkedBlendFalse(first, offset, second, offset) == first[offset]);
            check(checkedBlendTrue(first, offset, second, offset) == second[offset]);
        }
        // Both inputs must be evaluated, including the input discarded by the mask.
        for (int offset : new int[] {-1, 17, Integer.MIN_VALUE, Integer.MAX_VALUE}) {
            expect(IndexOutOfBoundsException.class, () -> checkedBlendFalse(first, offset, second, 0));
            expect(IndexOutOfBoundsException.class, () -> checkedBlendTrue(first, offset, second, 0));
            expect(IndexOutOfBoundsException.class, () -> checkedBlendFalse(first, 0, second, offset));
            expect(IndexOutOfBoundsException.class, () -> checkedBlendTrue(first, 0, second, offset));
        }
        expect(NullPointerException.class, () -> checkedBlendFalse(null, 0, second, 0));
        expect(NullPointerException.class, () -> checkedBlendTrue(null, 0, second, 0));
        expect(NullPointerException.class, () -> checkedBlendFalse(first, 0, null, 0));
        expect(NullPointerException.class, () -> checkedBlendTrue(first, 0, null, 0));
        // Preserve evaluation order when both accesses are invalid.
        expect(IndexOutOfBoundsException.class, () -> checkedBlendFalse(first, 17, null, 0));
        expect(IndexOutOfBoundsException.class, () -> checkedBlendTrue(first, 17, null, 0));
        expect(NullPointerException.class, () -> checkedBlendFalse(null, 0, second, 17));
        expect(NullPointerException.class, () -> checkedBlendTrue(null, 0, second, 17));
    }

    public static void main(String[] args) {
        int rounds = args.length == 0 ? 200 : Integer.parseInt(args[0]);
        for (int round = 0; round < rounds; round++) {
            for (VectorShape shape : VectorShape.values()) {
                int length = VectorSpecies.of(byte.class, shape).length();
                byte[] b = new byte[length], c = new byte[length];
                short[] s = new short[length], t = new short[length];
                int[] j = new int[length], k = new int[length];
                long[] l = new long[length], m = new long[length];
                for (int i = 0; i < length; i++) {
                    b[i] = (byte) (round + i * 31); c[i] = (byte) ~b[i];
                    s[i] = (short) (round + i * 8191); t[i] = (short) ~s[i];
                    j[i] = Integer.rotateLeft(round ^ 0x80000001, i); k[i] = ~j[i];
                    l[i] = Long.rotateLeft(round ^ 0x8000000000000001L, i); m[i] = ~l[i];
                }
                integral(VectorSpecies.of(byte.class, shape), b, c);
                integral(VectorSpecies.of(short.class, shape), s, t);
                integral(VectorSpecies.of(int.class, shape), j, k);
                integral(VectorSpecies.of(long.class, shape), l, m);
                shuffles(VectorSpecies.of(byte.class, shape));
                tails(VectorSpecies.of(byte.class, shape));
                floating(shape);
            }
        }
        accessChecks();
        blendAccessChecks();
        System.out.println("SCALAR_CHECKS=" + checks);
    }
}
