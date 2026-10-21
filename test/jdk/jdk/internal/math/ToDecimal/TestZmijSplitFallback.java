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
 * @summary Preserve split precision metadata and null-holder behavior across native and Java routes
 * @modules java.base/jdk.internal.math:+open
 * @run main/othervm TestZmijSplitFallback
 * @run main/othervm -Xint TestZmijSplitFallback
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 TestZmijSplitFallback
 * @run main/othervm -Xbatch -XX:-TieredCompilation TestZmijSplitFallback
 * @run main/othervm -XX:-UseZmijIntrinsics TestZmijSplitFallback
 * @run main/othervm -Xint -XX:-UseZmijIntrinsics TestZmijSplitFallback
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:-UseZmijIntrinsics TestZmijSplitFallback
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=2 -XX:-UseZmijIntrinsics TestZmijSplitFallback
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=3 -XX:-UseZmijIntrinsics TestZmijSplitFallback
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:-UseZmijIntrinsics TestZmijSplitFallback
 * @run main/othervm -Xint -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_decimalZmij,_formatZmij TestZmijSplitFallback
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_decimalZmij,_formatZmij TestZmijSplitFallback
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_decimalZmij,_formatZmij TestZmijSplitFallback
 */

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.security.MessageDigest;
import java.nio.charset.StandardCharsets;
import java.util.HexFormat;
import java.util.Random;
import jdk.internal.math.DoubleToDecimal;
import jdk.internal.math.FormattedFPDecimal;

public class TestZmijSplitFallback {
    static final Constructor<FormattedFPDecimal> CTOR;
    static final Method JAVA, NATIVE;
    static final MessageDigest DIGEST;
    static int checked;
    static {
        try {
            CTOR = FormattedFPDecimal.class.getDeclaredConstructor();
            CTOR.setAccessible(true);
            JAVA = DoubleToDecimal.class.getDeclaredMethod("toDecimalJava", byte[].class,
                    int.class, double.class, FormattedFPDecimal.class);
            JAVA.setAccessible(true);
            NATIVE = Class.forName("jdk.internal.math.Zmij").getDeclaredMethod("split",
                    double.class, FormattedFPDecimal.class);
            NATIVE.setAccessible(true);
            DIGEST = MessageDigest.getInstance("SHA-256");
        } catch (Exception e) { throw new ExceptionInInitializerError(e); }
    }

    static FormattedFPDecimal holder() throws Exception {
        FormattedFPDecimal fd = CTOR.newInstance();
        fd.set(314159, -4, 6, false, true);
        return fd;
    }

    static String fields(FormattedFPDecimal fd, boolean normalized) {
        long f = fd.getSignificand();
        int e = fd.getExp(), n = fd.getPrecision();
        if (normalized) {
            while (f != 0 && f % 10 == 0) { f /= 10; ++e; --n; }
        }
        return f + ":" + e + ":" + n + ":" + fd.getExact() + ":" + fd.getAway();
    }

    static void check(long bits) throws Exception {
        double v = Double.longBitsToDouble(bits);
        FormattedFPDecimal expected = holder(), actual = holder();
        JAVA.invoke(DoubleToDecimal.LATIN1, new byte[DoubleToDecimal.MAX_CHARS], 0, v, expected);
        DoubleToDecimal.split(v, actual);
        if (!fields(expected, true).equals(fields(actual, true))) {
            throw new AssertionError("metadata " + Long.toHexString(bits) + ": "
                    + fields(expected, true) + " != " + fields(actual, true));
        }
        if (bits == 0 || bits == Long.MIN_VALUE) {
            if (!fields(actual, false).equals("314159:-4:6:false:true"))
                throw new AssertionError("zero must leave the supplied holder unchanged");
        } else if (Double.isFinite(v)) {
            long f = actual.getSignificand();
            int n = 0;
            for (long digits = f; digits != 0; digits /= 10) ++n;
            if (f < 0 || n != actual.getPrecision()) throw new AssertionError("precision " + bits);
        }
        if (bits >= 0) {
            FormattedFPDecimal withoutBuffer = holder();
            JAVA.invoke(DoubleToDecimal.LATIN1, null, 0, v, withoutBuffer);
            if (!fields(expected, false).equals(fields(withoutBuffer, false)))
                throw new AssertionError("Java buffer independence " + Long.toHexString(bits));
        }
        // Check native dispatch and exception behavior for fd == null.
        String nullExpected;
        try {
            if (!(boolean) NATIVE.invoke(null, v, null))
                JAVA.invoke(DoubleToDecimal.LATIN1, new byte[DoubleToDecimal.MAX_CHARS], 0, v, null);
            nullExpected = "ok";
        } catch (InvocationTargetException e) { nullExpected = e.getCause().getClass().getName(); }
        String nullActual;
        try { DoubleToDecimal.split(v, null); nullActual = "ok"; }
        catch (Throwable e) { nullActual = e.getClass().getName(); }
        if (!nullExpected.equals(nullActual)) throw new AssertionError("null contract " + bits);
        DIGEST.update((Long.toHexString(bits) + ":" + fields(actual, false) + ":" + nullActual + "\n")
                .getBytes(StandardCharsets.UTF_8));
        checked++;
    }

    public static void main(String[] args) throws Exception {
        for (long sign : new long[] {0, Long.MIN_VALUE}) {
            for (long bits = 0; bits < 257; bits++) check(sign | bits);
            for (int bq = 1; bq < 2047; bq++) {
                long bits = (long) bq << 52;
                for (int d = -2; d <= 2; d++) check(sign | bits + d);
            }
            check(sign | 0x7ff0000000000000L);
            check(sign | 0x7ff8000000000001L);
        }
        for (int e = -324; e <= 308; e++) {
            double v = Math.pow(10, e);
            check(Double.doubleToRawLongBits(v));
            check(Double.doubleToRawLongBits(Math.nextUp(v)));
            double down = Math.nextDown(v);
            if (down >= 0) check(Double.doubleToRawLongBits(down));
        }
        Random r = new Random(0x51_171_2026L);
        for (int i = 0; i < 20000; i++) check(r.nextLong());
        System.out.println("PASS: " + checked + " split metadata/null-contract cases; digest="
                + HexFormat.of().formatHex(DIGEST.digest()));
    }
}
