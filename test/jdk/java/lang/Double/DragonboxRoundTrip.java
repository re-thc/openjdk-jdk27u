/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @summary Library-backed shortest public floating-point strings preserve numeric bits and existing special/append behavior
 * @modules java.base/jdk.internal.math:open
 * @run main/othervm -XX:-TieredCompilation -Xbatch DragonboxRoundTrip
 * @run main/othervm -XX:TieredStopAtLevel=1 DragonboxRoundTrip
 * @run main/othervm -Xint DragonboxRoundTrip
 * @run main/othervm DragonboxRoundTrip
 * @run main/othervm -XX:-UseDragonboxFormatting DragonboxRoundTrip
 */
import java.lang.reflect.Method;

public class DragonboxRoundTrip {
    private static long state = 42;
    private static long next() {
        state ^= state << 13;
        state ^= state >>> 7;
        state ^= state << 17;
        return state;
    }
    private static void check(double v) {
        String s = Double.toString(v);
        double back = Double.parseDouble(s);
        if (Double.isNaN(v) ? !Double.isNaN(back)
                : Double.doubleToRawLongBits(v) != Double.doubleToRawLongBits(back)) {
            throw new AssertionError(Long.toHexString(Double.doubleToRawLongBits(v)) + ": " + s);
        }
        if (s.length() > 24) throw new AssertionError("double length: " + s);
    }
    private static void check(float v) {
        String s = Float.toString(v);
        float back = Float.parseFloat(s);
        if (Float.isNaN(v) ? !Float.isNaN(back)
                : Float.floatToRawIntBits(v) != Float.floatToRawIntBits(back)) {
            throw new AssertionError(Integer.toHexString(Float.floatToRawIntBits(v)) + ": " + s);
        }
        if (s.length() > 15) throw new AssertionError("float length: " + s);
    }
    private static void text(String expected, String actual) {
        if (!expected.equals(actual)) throw new AssertionError(expected + " != " + actual);
    }
    private static void bounds(Class<?> c, Class<?> type, Object value, int capacity) throws Exception {
        Method m = c.getDeclaredMethod("toShortestDecimal", byte[].class, type);
        m.setAccessible(true);
        for (byte[] destination : new byte[][] {null, new byte[capacity - 1]}) {
            try {
                m.invoke(null, destination, value);
                throw new AssertionError("accepted undersized/null buffer");
            } catch (java.lang.reflect.InvocationTargetException e) {
                Throwable cause = e.getCause();
                if (!(cause instanceof NullPointerException || cause instanceof ArrayIndexOutOfBoundsException
                        || cause instanceof UnsupportedOperationException)) throw e;
            }
        }
    }
    private static void canary(Class<?> c, Class<?> type, Object value, int capacity) throws Exception {
        Method m = c.getDeclaredMethod("toShortestDecimal", byte[].class, type);
        m.setAccessible(true);
        byte[] destination = new byte[capacity + 32];
        java.util.Arrays.fill(destination, (byte) 0x5a);
        int length = (int) m.invoke(null, destination, value);
        if (length < 1 || length > capacity) throw new AssertionError("native output length");
        for (int i = length; i < destination.length; i++) {
            if (destination[i] != (byte) 0x5a) throw new AssertionError("native output overrun");
        }
    }
    public static void main(String[] args) throws Exception {
        Class<?> dc = Class.forName("jdk.internal.math.DoubleToDecimal");
        Method enabled = dc.getDeclaredMethod("isNativeFormattingEnabled");
        enabled.setAccessible(true);
        boolean nativeEnabled = (boolean) enabled.invoke(null);
        if (nativeEnabled) {
            text("5E-324", Double.toString(Double.MIN_VALUE));
            text("1E-45", Float.toString(Float.MIN_VALUE));
        } else {
            text("4.9E-324", Double.toString(Double.MIN_VALUE));
            text("1.4E-45", Float.toString(Float.MIN_VALUE));
        }
        text("0.0", Double.toString(0.0)); text("-0.0", Double.toString(-0.0));
        text("0.0", Float.toString(0.0f)); text("-0.0", Float.toString(-0.0f));
        text("NaN", Double.toString(Double.NaN)); text("NaN", Float.toString(Float.NaN));
        text("Infinity", Double.toString(Double.POSITIVE_INFINITY));
        text("-Infinity", Double.toString(Double.NEGATIVE_INFINITY));
        text("Infinity", Float.toString(Float.POSITIVE_INFINITY));
        text("-Infinity", Float.toString(Float.NEGATIVE_INFINITY));
        text("4.9E-324", new StringBuilder().append(Double.MIN_VALUE).toString());
        text("1.4E-45", new StringBuilder().append(Float.MIN_VALUE).toString());
        text("1.234", Double.toString(1.234));
        text("1.0", Double.toString(1.0));
        text("1.0", Float.toString(1.0f));
        for (long b = 1; b <= 65536; b++) {
            check(Double.longBitsToDouble(b)); check(-Double.longBitsToDouble(b));
            check(Float.intBitsToFloat((int)b)); check(-Float.intBitsToFloat((int)b));
        }
        for (int e = -1074; e <= 1023; e++) {
            double v = Math.scalb(1.0, e); check(v); check(-v);
            check(Math.nextDown(v)); check(Math.nextUp(v));
        }
        for (int e = -149; e <= 127; e++) {
            float v = Math.scalb(1.0f, e); check(v); check(-v);
            check(Math.nextDown(v)); check(Math.nextUp(v));
        }
        int count = args.length == 0 ? 200000 : Integer.parseInt(args[0]);
        for (int i = 0; i < count; i++) {
            check(Double.longBitsToDouble(next())); check(Float.intBitsToFloat((int)next()));
        }
        bounds(dc, double.class, 1.234, 24);
        bounds(Class.forName("jdk.internal.math.FloatToDecimal"), float.class, 1.234f, 15);
        if (nativeEnabled) {
            canary(dc, double.class, Double.MIN_VALUE, 24);
            canary(Class.forName("jdk.internal.math.FloatToDecimal"), float.class, Float.MIN_VALUE, 15);
        }
        System.out.println("roundtrip/special/append/bounds/canary passed; native=" + nativeEnabled);
    }
}
