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
 * @summary Exact Java floating-point renderings with zmij across execution tiers
 * @modules java.base/jdk.internal.math:+open
 * @run main/othervm TestZmij
 * @run main/othervm -Xint TestZmij
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 TestZmij
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:-CompactStrings TestZmij
 * @run main/othervm -Xbatch -XX:-TieredCompilation TestZmij
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_useJavaFloatAppend TestZmij
 * @run main/othervm -Xint -XX:-CompactStrings TestZmij
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:-CompactStrings TestZmij
 * @run main/othervm -Xint -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_formatZmij,_decimalZmij TestZmij
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_formatZmij,_decimalZmij TestZmij
 * @run main/othervm -XX:-UseZmijIntrinsics TestZmij
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:-UseZmijIntrinsics TestZmij
 */

/*
 * @test id=zgc
 * @requires vm.gc.Z & vm.compiler1.enabled & vm.compiler2.enabled
 * @summary Exercise native formatting with ZGC across execution tiers
 * @modules java.base/jdk.internal.math:+open
 * @run main/othervm -Xmx64m -Xint -XX:+UseZGC TestZmij
 * @run main/othervm -Xmx64m -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseZGC TestZmij
 * @run main/othervm -Xmx64m -Xbatch -XX:-TieredCompilation -XX:+UseZGC TestZmij
 */

import java.lang.reflect.Method;
import java.lang.reflect.Constructor;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Random;
import jdk.internal.math.DoubleToDecimal;
import jdk.internal.math.FloatToDecimal;
import jdk.internal.math.FormattedFPDecimal;

public class TestZmij {
    private static final Method FLOAT, DOUBLE;
    private static final Constructor<FormattedFPDecimal> DECIMAL;
    static {
        try {
            FLOAT = FloatToDecimal.class.getDeclaredMethod("toDecimalJava", byte[].class, int.class, float.class);
            DOUBLE = DoubleToDecimal.class.getDeclaredMethod("toDecimalJava", byte[].class, int.class, double.class, FormattedFPDecimal.class);
            FLOAT.setAccessible(true);
            DOUBLE.setAccessible(true);
            DECIMAL = FormattedFPDecimal.class.getDeclaredConstructor();
            DECIMAL.setAccessible(true);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private static String special(int type) {
        return switch (type) {
            case 0x100 -> "0.0";
            case 0x200 -> "-0.0";
            case 0x300 -> "Infinity";
            case 0x400 -> "-Infinity";
            case 0x500 -> "NaN";
            default -> throw new AssertionError(type);
        };
    }

    private static void check(long bits, boolean isFloat, boolean append) throws Exception {
        byte[] original = new byte[24];
        String expected, actual;
        if (isFloat) {
            float v = Float.intBitsToFloat((int) bits);
            int pair = (int) FLOAT.invoke(FloatToDecimal.LATIN1, original, 0, v);
            expected = (pair & 0xff00) == 0
                    ? new String(original, 0, pair & 0xff, StandardCharsets.ISO_8859_1) : special(pair & 0xff00);
            actual = Float.toString(v);
            if (append) {
                equal("builder float", "prefix:" + expected, new StringBuilder("prefix:").append(v).toString());
                equal("UTF16 builder float", "\u0100" + expected, new StringBuilder("\u0100").append(v).toString());
                equal("concat float", "\u0100" + expected + "!", "\u0100" + v + "!");
                checkBuffer(v, true, expected, false);
                checkBuffer(v, true, expected, true);
            }
        } else {
            double v = Double.longBitsToDouble(bits);
            int pair = (int) DOUBLE.invoke(DoubleToDecimal.LATIN1, original, 0, v, null);
            expected = (pair & 0xff00) == 0
                    ? new String(original, 0, pair & 0xff, StandardCharsets.ISO_8859_1) : special(pair & 0xff00);
            actual = Double.toString(v);
            if (v >= 0 && Double.isFinite(v)) {
                checkSplit(v);
            }
            if (append) {
                equal("builder double", "prefix:" + expected, new StringBuilder("prefix:").append(v).toString());
                equal("UTF16 builder double", "\u0100" + expected, new StringBuilder("\u0100").append(v).toString());
                equal("concat double", "\u0100" + expected + "!", "\u0100" + v + "!");
                checkBuffer(v, false, expected, false);
                checkBuffer(v, false, expected, true);
            }
        }
        equal((isFloat ? "float " : "double ") + Long.toHexString(bits), expected, actual);
    }

    private static void checkBuffer(double v, boolean isFloat, String expected, boolean utf16) {
        int coder = utf16 ? 1 : 0;
        int capacity = isFloat ? FloatToDecimal.MAX_CHARS : DoubleToDecimal.MAX_CHARS;
        byte[] out = new byte[(capacity + 14) << coder];
        Arrays.fill(out, (byte) 0x55);
        int start = 5;
        int end = isFloat
                ? (utf16 ? FloatToDecimal.UTF16 : FloatToDecimal.LATIN1).putDecimal(out, start, (float) v)
                : (utf16 ? DoubleToDecimal.UTF16 : DoubleToDecimal.LATIN1).putDecimal(out, start, v);
        var charset = utf16 ? (ByteOrder.nativeOrder() == ByteOrder.LITTLE_ENDIAN
                ? StandardCharsets.UTF_16LE : StandardCharsets.UTF_16BE) : StandardCharsets.ISO_8859_1;
        equal("destination", expected, new String(out, start << coder, (end - start) << coder, charset));
        for (int i = 0; i < out.length; ++i) {
            if ((i < (start << coder) || i >= ((start + capacity) << coder)) && out[i] != 0x55) {
                throw new AssertionError("Write outside caller capacity at " + i);
            }
        }
    }

    private static void equal(String label, String expected, String actual) {
        if (!expected.equals(actual)) {
            throw new AssertionError(label + ": expected " + expected + ", got " + actual);
        }
    }

    private static void checkSplit(double v) throws Exception {
        var expected = DECIMAL.newInstance();
        var actual = DECIMAL.newInstance();
        DOUBLE.invoke(DoubleToDecimal.LATIN1, new byte[24], 0, v, expected);
        DoubleToDecimal.split(v, actual);
        long ef = expected.getSignificand(), af = actual.getSignificand();
        int ee = expected.getExp(), ae = actual.getExp();
        while (ef != 0 && ef % 10 == 0) { ef /= 10; ++ee; }
        while (af != 0 && af % 10 == 0) { af /= 10; ++ae; }
        if (ef != af || ee != ae || expected.getExact() != actual.getExact()
                || (!expected.getExact() && expected.getAway() != actual.getAway())) {
            throw new AssertionError("split " + Long.toHexString(Double.doubleToRawLongBits(v))
                    + ": expected " + ef + "e" + ee + " exact=" + expected.getExact() + " away=" + expected.getAway()
                    + ", got " + af + "e" + ae + " exact=" + actual.getExact() + " away=" + actual.getAway());
        }
    }

    public static void main(String[] args) throws Exception {
        // Special values, payload NaNs, tiny subnormals, binade boundaries.
        for (long sign : new long[] {0, Long.MIN_VALUE}) {
            for (long bits = 0; bits < 256; ++bits) check(sign | bits, false, true);
            for (int e = 0; e < 2048; ++e) {
                long power = (long) e << 52;
                for (int delta = -2; delta <= 2; ++delta) check(sign | (power + delta), false, true);
            }
            check(sign | 0x7ff8000000000001L, false, true);
        }
        for (int sign : new int[] {0, Integer.MIN_VALUE}) {
            for (int bits = 0; bits < 256; ++bits) check(sign | bits, true, true);
            for (int e = 0; e < 256; ++e) {
                for (int delta = -2; delta <= 2; ++delta) check(sign | ((e << 23) + delta), true, true);
            }
            check(sign | 0x7fc00001, true, true);
        }
        // Decimal powers and their immediate binary neighbors cross fixed/scientific thresholds.
        for (int e = -324; e <= 308; ++e) {
            double v = Math.pow(10.0, e);
            for (double n : new double[] {Math.nextDown(v), v, Math.nextUp(v)}) {
                check(Double.doubleToRawLongBits(n), false, true);
                check(Float.floatToRawIntBits((float) n), true, true);
            }
        }
        Random random = new Random(0xF70A_1_11L);
        for (int i = 0; i < 50_000; ++i) {
            check(random.nextLong(), false, i < 1000);
            check(random.nextInt(), true, i < 1000);
        }
        System.out.println("zmij exact rendering and destination checks passed");
    }
}
