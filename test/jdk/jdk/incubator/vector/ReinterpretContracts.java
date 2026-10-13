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
 */

/*
 * @test
 * @bug 8392004
 * @summary Reinterpretation preserves raw lane bits, shape parts and access contracts
 * @modules jdk.incubator.vector
 * @run main/othervm ReinterpretContracts
 * @run main/othervm -Xint ReinterpretContracts
 * @run main/othervm -XX:TieredStopAtLevel=1 ReinterpretContracts
 */

import java.lang.reflect.Array;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;
import java.util.Random;
import jdk.incubator.vector.*;

public class ReinterpretContracts {
    private static final Class<?>[] TYPES = {
        byte.class, short.class, int.class, long.class, float.class, double.class
    };
    private static long checks;

    private static void check(boolean condition, String message) {
        checks++;
        if (!condition) throw new AssertionError(message);
    }

    private static long bits(Object a, int i) {
        if (a instanceof byte[] v) return v[i] & 0xffL;
        if (a instanceof short[] v) return v[i] & 0xffffL;
        if (a instanceof int[] v) return v[i] & 0xffff_ffffL;
        if (a instanceof long[] v) return v[i];
        if (a instanceof float[] v) return Float.floatToRawIntBits(v[i]) & 0xffff_ffffL;
        return Double.doubleToRawLongBits(((double[]) a)[i]);
    }

    // The oracle packs scalar raw bits in the API's specified little-endian order.
    private static byte[] bytes(Object a, int laneBytes) {
        byte[] b = new byte[Array.getLength(a) * laneBytes];
        for (int i = 0; i < Array.getLength(a); i++) {
            long value = bits(a, i);
            for (int j = 0; j < laneBytes; j++) b[i * laneBytes + j] = (byte) (value >>> (8 * j));
        }
        return b;
    }

    private static Object array(Class<?> type, byte[] b) {
        ByteBuffer buf = ByteBuffer.wrap(b).order(ByteOrder.LITTLE_ENDIAN);
        int laneBytes = VectorSpecies.of(type, VectorShape.S_64_BIT).elementSize() / 8;
        Object a = Array.newInstance(type, b.length / laneBytes);
        for (int i = 0; i < Array.getLength(a); i++) {
            if (a instanceof byte[] v) v[i] = buf.get();
            else if (a instanceof short[] v) v[i] = buf.getShort();
            else if (a instanceof int[] v) v[i] = buf.getInt();
            else if (a instanceof long[] v) v[i] = buf.getLong();
            else if (a instanceof float[] v) v[i] = Float.intBitsToFloat(buf.getInt());
            else ((double[]) a)[i] = Double.longBitsToDouble(buf.getLong());
        }
        return a;
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    private static Vector<?> load(VectorSpecies<?> s, Object a, int offset, VectorMask<?> m) {
        if (a instanceof byte[] v) return ByteVector.fromArray((VectorSpecies) s, v, offset, (VectorMask) m);
        if (a instanceof short[] v) return ShortVector.fromArray((VectorSpecies) s, v, offset, (VectorMask) m);
        if (a instanceof int[] v) return IntVector.fromArray((VectorSpecies) s, v, offset, (VectorMask) m);
        if (a instanceof long[] v) return LongVector.fromArray((VectorSpecies) s, v, offset, (VectorMask) m);
        if (a instanceof float[] v) return FloatVector.fromArray((VectorSpecies) s, v, offset, (VectorMask) m);
        return DoubleVector.fromArray((VectorSpecies) s, (double[]) a, offset, (VectorMask) m);
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    private static void store(Vector<?> v, Object a, int offset, VectorMask<?> m) {
        if (v instanceof ByteVector x) x.intoArray((byte[]) a, offset, (VectorMask) m);
        else if (v instanceof ShortVector x) x.intoArray((short[]) a, offset, (VectorMask) m);
        else if (v instanceof IntVector x) x.intoArray((int[]) a, offset, (VectorMask) m);
        else if (v instanceof LongVector x) x.intoArray((long[]) a, offset, (VectorMask) m);
        else if (v instanceof FloatVector x) x.intoArray((float[]) a, offset, (VectorMask) m);
        else ((DoubleVector) v).intoArray((double[]) a, offset, (VectorMask) m);
    }

    private static void badIndex(Runnable action) {
        try {
            action.run();
            throw new AssertionError("Expected index exception");
        } catch (IndexOutOfBoundsException expected) {
            checks++;
        }
    }

    private static void shapes(byte[] payload) {
        for (VectorShape from : VectorShape.values()) {
            byte[] input = Arrays.copyOf(payload, from.vectorBitSize() / 8);
            for (Class<?> fromType : TYPES) {
                VectorSpecies<?> s = VectorSpecies.of(fromType, from);
                Object a = array(fromType, input);
                Vector<?> v = load(s, a, 0, s.maskAll(true));
                check(Arrays.equals(input, bytes(v.toArray(), s.elementSize() / 8)), "load raw bits");
                for (VectorShape to : VectorShape.values()) {
                    int outputBytes = to.vectorBitSize() / 8;
                    int first = outputBytes > input.length ? 1 - outputBytes / input.length : 0;
                    int last = input.length > outputBytes ? input.length / outputBytes - 1 : 0;
                    for (Class<?> toType : TYPES) {
                        VectorSpecies<?> t = VectorSpecies.of(toType, to);
                        for (int part = first; part <= last; part++) {
                            byte[] expected = new byte[outputBytes];
                            if (input.length > outputBytes) System.arraycopy(input, part * outputBytes, expected, 0, outputBytes);
                            else System.arraycopy(input, 0, expected, -part * input.length, input.length);
                            Vector<?> result = v.reinterpretShape(t, part);
                            check(Arrays.equals(expected, bytes(result.toArray(), t.elementSize() / 8)),
                                  fromType + "/" + from + " -> " + toType + "/" + to + " part " + part);
                        }
                        badIndex(() -> v.reinterpretShape(t, first - 1));
                        badIndex(() -> v.reinterpretShape(t, last + 1));
                    }
                }
                // Reinterpreting all the way through bytes exercises asByteVectorRaw.
                Vector<?> roundTrip = v.reinterpretAsBytes().reinterpretShape(s, 0);
                check(Arrays.equals(input, bytes(roundTrip.toArray(), s.elementSize() / 8)), "byte round trip");
                // The same backing array can be both source and destination.
                store(roundTrip, a, 0, s.maskAll(true));
                check(Arrays.equals(input, bytes(a, s.elementSize() / 8)), "alias");
                access(s, a);
            }
        }
    }

    private static void access(VectorSpecies<?> s, Object full) {
        int n = s.length();
        Object shortArray = Array.newInstance(s.elementType(), Math.max(1, n - 1));
        System.arraycopy(full, 0, shortArray, 0, Array.getLength(shortArray));
        VectorMask<?> tail = s.indexInRange(0, Array.getLength(shortArray));
        Vector<?> v = load(s, shortArray, 0, tail);
        Object got = v.toArray();
        for (int i = 0; i < n; i++) check(bits(got, i) == (i < Array.getLength(shortArray) ? bits(shortArray, i) : 0), "masked load");
        store(v.reinterpretAsBytes().reinterpretShape(s, 0), shortArray, 0, tail);
        load(s, shortArray, Array.getLength(shortArray), s.maskAll(false));
        store(v, shortArray, Array.getLength(shortArray), s.maskAll(false));
        badIndex(() -> load(s, full, -1, s.maskAll(true)));
        badIndex(() -> store(v, full, -1, s.maskAll(true)));
        badIndex(() -> load(s, full, n, s.maskAll(true)));
        badIndex(() -> store(v, full, n, s.maskAll(true)));
        boolean[] mask = new boolean[n + 2];
        Arrays.fill(mask, true);
        tail.intoArray(mask, 1);
        check(mask[0] && mask[n + 1], "mask store sentinels");
        for (int i = 0; i < n; i++) check(mask[i + 1] == (i < Array.getLength(shortArray)), "mask store");
        badIndex(() -> tail.intoArray(mask, -1));
        badIndex(() -> tail.intoArray(mask, 3));
    }

    private static void conversions() {
        float[] fs = {Float.NaN, Float.NEGATIVE_INFINITY, Float.POSITIVE_INFINITY, -0.0f, 0.0f,
            -2147483648.0f, 2147483648.0f, 1.5f, -1.5f, Float.intBitsToFloat(0x7f800001)};
        for (VectorShape shape : VectorShape.values()) {
            VectorSpecies<Float> s = VectorSpecies.of(float.class, shape);
            float[] a = new float[s.length()];
            for (int shift = 0; shift < fs.length; shift++) {
                for (int i = 0; i < a.length; i++) a[i] = fs[(i + shift) % fs.length];
                IntVector iv = FloatVector.fromArray(s, a, 0).convert(VectorOperators.F2I, 0).reinterpretAsInts();
                FloatVector fv = iv.convert(VectorOperators.I2F, 0).reinterpretAsFloats();
                for (int i = 0; i < a.length; i++) {
                    check(iv.lane(i) == (int) a[i], "F2I boundary");
                    check(Float.floatToRawIntBits(fv.lane(i)) == Float.floatToRawIntBits((float) (int) a[i]), "I2F boundary");
                }
            }
        }
    }

    public static void main(String[] args) {
        Random r = new Random(8392004);
        byte[] input = new byte[64];
        // NaN payloads, infinities, signed zeros, extrema, and subnormals.
        long[] values = {0, Long.MIN_VALUE, -1, Long.MAX_VALUE, 0x7ff0000000000001L,
            0x7ff8000000001234L, 0xfff0000000000000L, 1, 0x7f80000180000000L,
            0x7fc012347f800000L, 0xff80000000000001L};
        for (long value : values) {
            ByteBuffer b = ByteBuffer.wrap(input).order(ByteOrder.LITTLE_ENDIAN);
            for (int i = 0; i < 8; i++) b.putLong(value);
            shapes(input);
        }
        for (int i = 0; i < 8; i++) {
            r.nextBytes(input);
            shapes(input);
        }
        conversions();
        System.out.println("Passed " + checks + " scalar/raw-bit/access checks");
    }
}
