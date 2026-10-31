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

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Comparator;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;

import jdk.incubator.vector.*;

public class ConversionRegistrationWorker {
    private static final Class<?>[] LANES = {
        byte.class, short.class, int.class, long.class, float.class, double.class
    };

    @SuppressWarnings({"unchecked", "rawtypes"})
    public static void main(String[] args) throws Throwable {
        // Race the first factory call, before reflection can initialize the outer class.
        CountDownLatch ready = new CountDownLatch(8), start = new CountDownLatch(1);
        Thread[] threads = new Thread[8];
        Object[] identities = new Object[8];
        AtomicReference<Throwable> failure = new AtomicReference<>();
        for (int i = 0; i < threads.length; i++) {
            int index = i;
            threads[i] = new Thread(() -> {
                ready.countDown();
                try {
                    start.await();
                    identities[index] = VectorOperators.Conversion.ofCast(int.class, double.class);
                } catch (Throwable t) {
                    failure.compareAndSet(null, t);
                }
            });
            threads[i].start();
        }
        ready.await();
        start.countDown();
        for (Thread thread : threads) thread.join();
        if (failure.get() != null) throw failure.get();
        for (Object identity : identities) {
            if (identity != VectorOperators.I2D) throw new AssertionError("concurrent registration");
        }

        int checks = 0;
        var fields = VectorOperators.class.getFields();
        Arrays.sort(fields, Comparator.comparing(java.lang.reflect.Field::getName));
        for (var field : fields) {
            if (field.getType() != VectorOperators.Conversion.class) continue;
            var constant = (VectorOperators.Conversion<?, ?>) field.get(null);
            checkRegistration(constant);
            record("FIELD " + field.getName() + " " + constant.name());
            checks++;
        }
        for (Class<?> from : LANES) {
            for (Class<?> to : LANES) {
                for (boolean reinterpret : new boolean[] {false, true}) {
                    var conversion = reinterpret ? VectorOperators.Conversion.ofReinterpret(from, to)
                                                 : VectorOperators.Conversion.ofCast(from, to);
                    var again = reinterpret ? VectorOperators.Conversion.ofReinterpret(from, to)
                                            : VectorOperators.Conversion.ofCast(from, to);
                    if (conversion != again || conversion.check((Class) from, (Class) to) != conversion
                            || conversion.domainType() != from || conversion.rangeType() != to) {
                        throw new AssertionError("lookup identity " + from + " " + to);
                    }
                    record("LOOKUP " + reinterpret + " " + from + " " + to + " " + conversion.name());
                    checks++;
                }
            }
        }
        double[] result = (double[]) IntVector.fromArray(IntVector.SPECIES_128, new int[] {1, 2, 3, 4}, 0)
            .convertShape(VectorOperators.I2D, DoubleVector.SPECIES_128, 0).toArray();
        if (!Arrays.equals(result, new double[] {1, 2})) throw new AssertionError(Arrays.toString(result));
        checks++;
        record("CORE_CHECKS=" + checks);

        // Compare complete results, including raw floating-point bits, in the driver.
        for (Class<?> from : LANES) {
            int lanes = 128 / VectorSpecies.of((Class) from, VectorShape.S_128_BIT).elementSize();
            int valueCount = from == float.class || from == double.class ? FLOATING.length : INTEGRAL.length;
            for (int sample = 0; sample < (valueCount + lanes - 1) / lanes; sample++) {
                Object array = Array.newInstance(from, 128 / VectorSpecies.of((Class) from,
                    VectorShape.S_128_BIT).elementSize());
                for (int i = 0; i < Array.getLength(array); i++) {
                    int n = sample * Array.getLength(array) + i;
                    long bits = INTEGRAL[n % INTEGRAL.length];
                    double fp = FLOATING[n % FLOATING.length];
                    if (from == byte.class) Array.setByte(array, i, (byte) bits);
                    if (from == short.class) Array.setShort(array, i, (short) bits);
                    if (from == int.class) Array.setInt(array, i, (int) bits);
                    if (from == long.class) Array.setLong(array, i, bits);
                    if (from == float.class) Array.setFloat(array, i, (float) fp);
                    if (from == double.class) Array.setDouble(array, i, fp);
                }
                Vector<?> input;
                if (from == byte.class) input = ByteVector.fromArray(ByteVector.SPECIES_128, (byte[]) array, 0);
                else if (from == short.class) input = ShortVector.fromArray(ShortVector.SPECIES_128, (short[]) array, 0);
                else if (from == int.class) input = IntVector.fromArray(IntVector.SPECIES_128, (int[]) array, 0);
                else if (from == long.class) input = LongVector.fromArray(LongVector.SPECIES_128, (long[]) array, 0);
                else if (from == float.class) input = FloatVector.fromArray(FloatVector.SPECIES_128, (float[]) array, 0);
                else input = DoubleVector.fromArray(DoubleVector.SPECIES_128, (double[]) array, 0);
                for (Class<?> to : LANES) {
                    var output = VectorSpecies.of((Class) to, VectorShape.S_128_BIT);
                    int min = input.length() < output.length() ? 1 - output.length() / input.length() : 0;
                    int max = input.length() > output.length() ? input.length() / output.length() - 1 : 0;
                    for (boolean reinterpret : new boolean[] {false, true}) {
                        var conversion = reinterpret ? VectorOperators.Conversion.ofReinterpret(from, to)
                                                     : VectorOperators.Conversion.ofCast(from, to);
                        // Include both invalid ends as well as every valid part.
                        for (int part = min - 1; part <= max + 1; part++) {
                            String key = "REAL " + sample + " " + reinterpret + " " + from + " " + to + " " + part;
                            try {
                                Object values = ((Vector) input).convertShape((VectorOperators.Conversion) conversion,
                                    output, part).toArray();
                                if (part < min || part > max) throw new AssertionError("accepted invalid part: " + key);
                                StringBuilder complete = new StringBuilder();
                                for (int i = 0; i < Array.getLength(values); i++) {
                                    Object value = Array.get(values, i);
                                    if (value instanceof Float f) value = Integer.toHexString(Float.floatToRawIntBits(f));
                                    if (value instanceof Double d) value = Long.toHexString(Double.doubleToRawLongBits(d));
                                    complete.append(value).append(',');
                                }
                                record(key + " " + complete);
                            } catch (RuntimeException ex) {
                                record(key + " " + ex.getClass().getName() + ":" + ex.getMessage());
                            }
                        }
                    }
                }
            }
        }
        Class<?>[] invalid = {null, boolean.class, char.class, void.class, Integer.class, Object.class};
        for (Class<?> bad : invalid) {
            checkInvalid(bad, int.class);
            checkInvalid(int.class, bad);
            // Two invalid arguments make evaluation order observable in the exception.
            for (Class<?> other : invalid) checkInvalid(bad, other);
        }
        record("END");
    }

    private static void record(String value) {
        System.out.println("REGISTRATION " + value);
    }

    private static final long[] INTEGRAL = {
        0, -1, 1, Byte.MIN_VALUE, Byte.MAX_VALUE, Short.MIN_VALUE, Short.MAX_VALUE,
        Integer.MIN_VALUE, Integer.MAX_VALUE, Long.MIN_VALUE, Long.MAX_VALUE, 0x123456789abcdefL
    };
    private static final double[] FLOATING = {
        0.0, -0.0, 1.5, -1.5, Double.NaN, Double.POSITIVE_INFINITY,
        Double.NEGATIVE_INFINITY, Float.MAX_VALUE, Double.MAX_VALUE, Double.MIN_VALUE
    };

    @SuppressWarnings({"unchecked", "rawtypes"})
    private static void checkInvalid(Class<?> from, Class<?> to) {
        for (boolean reinterpret : new boolean[] {false, true}) {
            try {
                var value = reinterpret ? VectorOperators.Conversion.ofReinterpret((Class) from, (Class) to)
                                        : VectorOperators.Conversion.ofCast((Class) from, (Class) to);
                throw new AssertionError("accepted invalid lanes " + from + " " + to + " " + value);
            } catch (RuntimeException ex) {
                Class<?> firstBad = from == int.class ? to : from;
                Class<?> expected = firstBad == null ? NullPointerException.class : UnsupportedOperationException.class;
                if (ex.getClass() != expected) throw new AssertionError("wrong exception type", ex);
                record("ERROR " + from + " " + to + " " + reinterpret + " "
                    + ex.getClass().getName() + ":" + ex.getMessage());
            }
        }
    }

    // Inspect the actual conversion kind, including future W/N constants. Those two
    // kinds use an opcode-selected logical domain/range, rather than a public factory.
    private static void checkRegistration(VectorOperators.Conversion<?, ?> constant) throws Exception {
        Class<?> impl = constant.getClass();
        Class<?> lane = Class.forName("jdk.incubator.vector.LaneType");
        char kind = field(impl, "kind").getChar(constant);
        Object dom = field(impl, "dom").get(constant);
        Object ran = field(impl, "ran").get(constant);
        var opcode = impl.getSuperclass().getDeclaredMethod("opCodeRaw");
        opcode.setAccessible(true);
        int opc = (int) opcode.invoke(constant);
        var ordinal = lane.getDeclaredMethod("ofLaneTypeOrdinal", int.class);
        ordinal.setAccessible(true);
        if (kind == 'W') {
            int shift = field(VectorOperators.class, "VO_DOM_SHIFT").getInt(null);
            dom = ordinal.invoke(null, (opc >> shift) & 0xF);
        } else if (kind == 'N') {
            int shift = field(VectorOperators.class, "VO_RAN_SHIFT").getInt(null);
            ran = ordinal.invoke(null, (opc >> shift) & 0xF);
        }
        int grid = switch (kind) {
            case 'C', 'I' -> 0;
            case 'R', 'Z' -> 1;
            case 'W', 'N' -> 2;
            default -> throw new AssertionError("unknown conversion kind: " + kind);
        };
        Object[][][] caches = (Object[][][]) field(impl, "CACHES").get(null);
        var key = field(lane, "switchKey");
        if (caches[grid][key.getInt(dom)][key.getInt(ran)] != constant) {
            throw new AssertionError("unregistered constant: " + constant.name());
        }
        if (kind != 'W' && kind != 'N') {
            var cached = kind == 'R' || kind == 'Z'
                ? VectorOperators.Conversion.ofReinterpret(constant.domainType(), constant.rangeType())
                : VectorOperators.Conversion.ofCast(constant.domainType(), constant.rangeType());
            if (cached != constant) throw new AssertionError("factory identity: " + constant.name());
        }
    }

    private static java.lang.reflect.Field field(Class<?> owner, String name) throws Exception {
        var field = owner.getDeclaredField(name);
        field.setAccessible(true);
        return field;
    }
}
