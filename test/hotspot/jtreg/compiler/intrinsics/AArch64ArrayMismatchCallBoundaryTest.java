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
 * @test id=semantics
 * @summary Array mismatch keeps first-word, bulk, tail and floating-point semantics across dispatch boundaries
 * @library /test/lib
 * @modules java.base/jdk.internal.util
 * @run main/othervm -Xint compiler.intrinsics.AArch64ArrayMismatchCallBoundaryTest semantics
 * @run main/othervm -XX:TieredStopAtLevel=1 compiler.intrinsics.AArch64ArrayMismatchCallBoundaryTest semantics
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=1000 -XX:CompileCommand=dontinline,compiler.intrinsics.AArch64ArrayMismatchCallBoundaryTest::*Store compiler.intrinsics.AArch64ArrayMismatchCallBoundaryTest semantics
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=1000 -XX:CompileCommand=dontinline,compiler.intrinsics.AArch64ArrayMismatchCallBoundaryTest::*Store -XX:-UseVectorizedMismatchIntrinsic compiler.intrinsics.AArch64ArrayMismatchCallBoundaryTest semantics
 */

/*
 * @test id=call-boundary
 * @summary Precompiled early array mismatch remains inline while bulk-only work stays in a separate typed helper
 * @requires os.arch == "aarch64" & vm.debug == true & vm.compiler2.enabled & vm.opt.final.UseVectorizedMismatchIntrinsic == true
 * @library /test/lib
 * @modules java.base/jdk.internal.util
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver compiler.intrinsics.AArch64ArrayMismatchCallBoundaryTest
 */

package compiler.intrinsics;

import java.lang.reflect.Array;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jdk.internal.util.ArraysSupport;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class AArch64ArrayMismatchCallBoundaryTest {
    private static final Class<?>[] TYPES = {
        byte.class, boolean.class, char.class, short.class,
        int.class, long.class, float.class, double.class
    };
    private static final int[] SCALES = {0, 0, 1, 1, 2, 3, 2, 3};
    private static final int[] BYTES = {
        0, 1, 7, 8, 9, 15, 16, 17, 25, 63, 64, 65, 82,
        127, 128, 129, 255, 256, 257, 2047, 2048, 2049,
        4096, 65535, 65536, 65537, 131072
    };
    private static final String MARKER = "ARRAY-CALL-BOUNDARY ";

    public static int byteRange(byte[] a, int af, int at, byte[] b, int bf, int bt) {
        return Arrays.mismatch(a, af, at, b, bf, bt);
    }

    public static int byteFull(byte[] a, byte[] b) {
        return Arrays.mismatch(a, b);
    }

    public static int booleanRange(boolean[] a, int af, int at, boolean[] b, int bf, int bt) {
        return Arrays.mismatch(a, af, at, b, bf, bt);
    }

    public static int booleanFull(boolean[] a, boolean[] b) {
        return Arrays.mismatch(a, b);
    }

    public static int charRange(char[] a, int af, int at, char[] b, int bf, int bt) {
        return Arrays.mismatch(a, af, at, b, bf, bt);
    }

    public static int charFull(char[] a, char[] b) {
        return Arrays.mismatch(a, b);
    }

    public static int shortRange(short[] a, int af, int at, short[] b, int bf, int bt) {
        return Arrays.mismatch(a, af, at, b, bf, bt);
    }

    public static int shortFull(short[] a, short[] b) {
        return Arrays.mismatch(a, b);
    }

    public static int intRange(int[] a, int af, int at, int[] b, int bf, int bt) {
        return Arrays.mismatch(a, af, at, b, bf, bt);
    }

    public static int intFull(int[] a, int[] b) {
        return Arrays.mismatch(a, b);
    }

    public static int longRange(long[] a, int af, int at, long[] b, int bf, int bt) {
        return Arrays.mismatch(a, af, at, b, bf, bt);
    }

    public static int longFull(long[] a, long[] b) {
        return Arrays.mismatch(a, b);
    }

    public static int floatRange(float[] a, int af, int at, float[] b, int bf, int bt) {
        return Arrays.mismatch(a, af, at, b, bf, bt);
    }

    public static int floatFull(float[] a, float[] b) {
        return Arrays.mismatch(a, b);
    }

    public static int doubleRange(double[] a, int af, int at, double[] b, int bf, int bt) {
        return Arrays.mismatch(a, af, at, b, bf, bt);
    }

    public static int doubleFull(double[] a, double[] b) {
        return Arrays.mismatch(a, b);
    }

    public static int byteStore(byte[] a, int af, byte[] b, int bf, int length, int position) {
        b[bf + position] = 1;
        int result = Arrays.mismatch(a, af, af + length, b, bf, bf + length);
        b[bf + position] = 0;
        return result;
    }

    public static int booleanStore(boolean[] a, int af, boolean[] b, int bf, int length, int position) {
        b[bf + position] = true;
        int result = Arrays.mismatch(a, af, af + length, b, bf, bf + length);
        b[bf + position] = false;
        return result;
    }

    public static int charStore(char[] a, int af, char[] b, int bf, int length, int position) {
        b[bf + position] = 1;
        int result = Arrays.mismatch(a, af, af + length, b, bf, bf + length);
        b[bf + position] = 0;
        return result;
    }

    public static int shortStore(short[] a, int af, short[] b, int bf, int length, int position) {
        b[bf + position] = 1;
        int result = Arrays.mismatch(a, af, af + length, b, bf, bf + length);
        b[bf + position] = 0;
        return result;
    }

    public static int intStore(int[] a, int af, int[] b, int bf, int length, int position) {
        b[bf + position] = 1;
        int result = Arrays.mismatch(a, af, af + length, b, bf, bf + length);
        b[bf + position] = 0;
        return result;
    }

    public static int longStore(long[] a, int af, long[] b, int bf, int length, int position) {
        b[bf + position] = 1;
        int result = Arrays.mismatch(a, af, af + length, b, bf, bf + length);
        b[bf + position] = 0;
        return result;
    }

    public static int floatStore(float[] a, int af, float[] b, int bf, int length, int position) {
        b[bf + position] = 1;
        int result = Arrays.mismatch(a, af, af + length, b, bf, bf + length);
        b[bf + position] = 0;
        return result;
    }

    public static int doubleStore(double[] a, int af, double[] b, int bf, int length, int position) {
        b[bf + position] = 1;
        int result = Arrays.mismatch(a, af, af + length, b, bf, bf + length);
        b[bf + position] = 0;
        return result;
    }

    private static int range(int kind, Object a, int af, int at, Object b, int bf, int bt) {
        return switch (kind) {
            case 0 -> byteRange((byte[]) a, af, at, (byte[]) b, bf, bt);
            case 1 -> booleanRange((boolean[]) a, af, at, (boolean[]) b, bf, bt);
            case 2 -> charRange((char[]) a, af, at, (char[]) b, bf, bt);
            case 3 -> shortRange((short[]) a, af, at, (short[]) b, bf, bt);
            case 4 -> intRange((int[]) a, af, at, (int[]) b, bf, bt);
            case 5 -> longRange((long[]) a, af, at, (long[]) b, bf, bt);
            case 6 -> floatRange((float[]) a, af, at, (float[]) b, bf, bt);
            case 7 -> doubleRange((double[]) a, af, at, (double[]) b, bf, bt);
            default -> throw new AssertionError(kind);
        };
    }

    private static int full(int kind, Object a, Object b) {
        return switch (kind) {
            case 0 -> byteFull((byte[]) a, (byte[]) b);
            case 1 -> booleanFull((boolean[]) a, (boolean[]) b);
            case 2 -> charFull((char[]) a, (char[]) b);
            case 3 -> shortFull((short[]) a, (short[]) b);
            case 4 -> intFull((int[]) a, (int[]) b);
            case 5 -> longFull((long[]) a, (long[]) b);
            case 6 -> floatFull((float[]) a, (float[]) b);
            case 7 -> doubleFull((double[]) a, (double[]) b);
            default -> throw new AssertionError(kind);
        };
    }

    private static int store(int kind, Object a, int af, Object b, int bf, int length, int position) {
        return switch (kind) {
            case 0 -> byteStore((byte[]) a, af, (byte[]) b, bf, length, position);
            case 1 -> booleanStore((boolean[]) a, af, (boolean[]) b, bf, length, position);
            case 2 -> charStore((char[]) a, af, (char[]) b, bf, length, position);
            case 3 -> shortStore((short[]) a, af, (short[]) b, bf, length, position);
            case 4 -> intStore((int[]) a, af, (int[]) b, bf, length, position);
            case 5 -> longStore((long[]) a, af, (long[]) b, bf, length, position);
            case 6 -> floatStore((float[]) a, af, (float[]) b, bf, length, position);
            case 7 -> doubleStore((double[]) a, af, (double[]) b, bf, length, position);
            default -> throw new AssertionError(kind);
        };
    }

    private static void value(int kind, Object array, int index, boolean different) {
        switch (kind) {
            case 0 -> ((byte[]) array)[index] = (byte) (different ? 1 : 0);
            case 1 -> ((boolean[]) array)[index] = different;
            case 2 -> ((char[]) array)[index] = (char) (different ? 1 : 0);
            case 3 -> ((short[]) array)[index] = (short) (different ? 1 : 0);
            case 4 -> ((int[]) array)[index] = different ? 1 : 0;
            case 5 -> ((long[]) array)[index] = different ? 1 : 0;
            case 6 -> ((float[]) array)[index] = different ? 1 : 0;
            case 7 -> ((double[]) array)[index] = different ? 1 : 0;
            default -> throw new AssertionError(kind);
        }
    }

    private static void check(int actual, int expected, String context) {
        if (actual != expected) {
            throw new AssertionError(context + ": " + actual + " != " + expected);
        }
    }

    private static void semantics() {
        for (int kind = 0; kind < TYPES.length; kind++) {
            Object warmA = Array.newInstance(TYPES[kind], 4096);
            Object warmB = Array.newInstance(TYPES[kind], 4096);
            for (int i = 0; i < 2000; i++) {
                int position = switch (i % 3) { case 0 -> 1; case 1 -> 25; default -> 2176; };
                check(store(kind, warmA, 0, warmB, 0, 4096, position), position, "compiled store path");
            }
            for (int bytes : BYTES) {
                int length = bytes >> SCALES[kind];
                for (int offset : new int[] {0, 1, 7}) {
                    Object a = Array.newInstance(TYPES[kind], length + offset + 1);
                    Object b = Array.newInstance(TYPES[kind], length + offset + 1);
                    String context = TYPES[kind] + " length=" + length + " offset=" + offset;
                    check(range(kind, a, offset, offset + length, b, offset, offset + length), -1, context);
                    check(full(kind, a, b), -1, context);
                    check(range(kind, a, offset, offset + length, b, offset, offset + length + 1), length, context);
                    for (int position : new int[] {0, 1, 2, 3, 7, 8, 10, 15, 16, 17, 25, 31, 32, 33, 63, 64, 65, 82,
                                                   127, 128, 129, 255, 256, 257, 271, 272, 273,
                                                   511, 512, 513, 543, 544, 545, 1023, 1024, 1025,
                                                   1087, 1088, 1089, 1267, 2047, 2048, 2049,
                                                   2175, 2176, 2177, length / 2, length - 1}) {
                        if (position < 0 || position >= length) continue;
                        value(kind, b, offset + position, true);
                        check(range(kind, a, offset, offset + length, b, offset, offset + length), position, context);
                        check(full(kind, a, b), offset + position, context);
                        value(kind, a, offset + position, true);
                        check(range(kind, a, offset, offset + length, b, offset, offset + length), -1, context + " store");
                        value(kind, a, offset + position, false);
                        value(kind, b, offset + position, false);
                        check(store(kind, a, offset, b, offset, length, position), position, context + " store/compare/store");
                        check(range(kind, a, offset, offset + length, b, offset, offset + length), -1, context + " following store");
                    }
                }
            }
        }
        differentOffsets();
        floatingPoint();
        exceptions();
        rangeChecks();
        System.out.println("Array call-boundary semantics passed");
    }

    private static void differentOffsets() {
        int length = 65537, af = 1, bf = 7;
        for (int kind = 0; kind < TYPES.length; kind++) {
            Object a = Array.newInstance(TYPES[kind], af + length + 1);
            Object b = Array.newInstance(TYPES[kind], bf + length + 1);
            value(kind, b, bf - 1, true);
            value(kind, b, bf + length, true);
            check(range(kind, a, af, af + length, b, bf, bf + length), -1, "different offsets equal");
            for (int position : new int[] {0, 1, 7, 8, 15, 16, 25, 82, 127, 128, 1267, 2048, length - 1}) {
                value(kind, b, bf + position, true);
                check(range(kind, a, af, af + length, b, bf, bf + length), position, "different offsets mismatch");
                value(kind, a, af + position, true);
                check(range(kind, a, af, af + length, b, bf, bf + length), -1, "different offsets store");
                value(kind, a, af + position, false);
                value(kind, b, bf + position, false);
            }
        }
    }

    private static void floatingPoint() {
        for (int position : new int[] {0, 1, 3, 4, 7, 8, 15, 16, 25, 31, 32, 82, 127, 128, 1267}) {
            float[] fa = new float[2049], fb = new float[2049];
            double[] da = new double[2049], db = new double[2049];
            fa[position] = Float.intBitsToFloat(position % 2 == 0 ? 0xff800001 : 0x7fc00001);
            fb[position] = Float.intBitsToFloat(position % 3 == 0 ? 0xffc00002 : 0x7f800002);
            da[position] = Double.longBitsToDouble(position % 2 == 0 ? 0xfff0000000000001L : 0x7ff8000000000001L);
            db[position] = Double.longBitsToDouble(position % 3 == 0 ? 0xfff8000000000002L : 0x7ff0000000000002L);
            check(floatRange(fa, 0, fa.length, fb, 0, fb.length), -1, "float NaNs");
            check(doubleRange(da, 0, da.length, db, 0, db.length), -1, "double NaNs");
            fb[position] = 1;
            db[position] = 1;
            check(floatRange(fa, 0, fa.length, fb, 0, fb.length), position, "float only a NaN");
            check(doubleRange(da, 0, da.length, db, 0, db.length), position, "double only a NaN");
            fb[position] = fa[position];
            db[position] = da[position];
            fa[position] = 1;
            da[position] = 1;
            check(floatRange(fa, 0, fa.length, fb, 0, fb.length), position, "float only b NaN");
            check(doubleRange(da, 0, da.length, db, 0, db.length), position, "double only b NaN");
            fa[position] = Float.intBitsToFloat(0xff800001);
            fb[position] = Float.intBitsToFloat(0x7fc00001);
            da[position] = Double.longBitsToDouble(0xfff0000000000001L);
            db[position] = Double.longBitsToDouble(0x7ff8000000000001L);
            fb[position + 1] = 1;
            db[position + 1] = 1;
            fb[2000] = 1;
            db[2000] = 1;
            check(floatRange(fa, 0, fa.length, fb, 0, fb.length), position + 1, "float after NaNs");
            check(doubleRange(da, 0, da.length, db, 0, db.length), position + 1, "double after NaNs");
            fb[position] = -0.0f;
            fa[position] = 0.0f;
            db[position] = -0.0;
            da[position] = 0.0;
            check(floatRange(fa, 0, fa.length, fb, 0, fb.length), position, "float signed zero");
            check(doubleRange(da, 0, da.length, db, 0, db.length), position, "double signed zero");
        }
    }

    private static void exceptions() {
        byte[] a = new byte[256];
        expect(NullPointerException.class, () -> byteRange(null, 1, 0, a, 0, 1));
        expect(IllegalArgumentException.class, () -> byteRange(a, 1, 0, null, 0, 1));
        expect(ArrayIndexOutOfBoundsException.class, () -> byteRange(a, -1, 128, a, 0, 129));
        expect(ArrayIndexOutOfBoundsException.class, () -> byteRange(a, 0, 257, a, 0, 256));
        expect(NullPointerException.class, () -> ArraysSupport.mismatch((byte[]) null, 0, a, 0, 16));
        expect(NullPointerException.class, () -> ArraysSupport.mismatch(a, 0, (byte[]) null, 0, 16));
        expect(ArrayIndexOutOfBoundsException.class, () -> ArraysSupport.mismatch(a, -1, (byte[]) null, 0, 16));
        expect(NullPointerException.class, () -> ArraysSupport.mismatch((float[]) null, 0, new float[16], 0, 16));
        expect(ArrayIndexOutOfBoundsException.class, () -> ArraysSupport.mismatch(new float[16], -1, (float[]) null, 0, 2));
        expect(NullPointerException.class, () -> ArraysSupport.mismatch((long[]) null, 0, new long[16], 0, 2));
        expect(ArrayIndexOutOfBoundsException.class, () -> ArraysSupport.mismatch(new long[16], -1, (long[]) null, 0, 2));
        expect(NullPointerException.class, () -> ArraysSupport.mismatch((double[]) null, 0, new double[16], 0, 2));
        expect(ArrayIndexOutOfBoundsException.class, () -> ArraysSupport.mismatch(new double[16], -1, (double[]) null, 0, 2));
    }

    private static void rangeChecks() {
        int[] indices = {Integer.MIN_VALUE, -Integer.MAX_VALUE, -129, -1, 0, 1, 3, 4, 5, 129, Integer.MAX_VALUE};
        for (int kind = 0; kind < TYPES.length; kind++) {
            int type = kind;
            Object a = Array.newInstance(TYPES[kind], 4);
            Object b = Array.newInstance(TYPES[kind], 4);
            for (int from : indices) {
                for (int to : indices) {
                    Class<? extends Throwable> failure = from > to ? IllegalArgumentException.class
                            : from < 0 || to > 4 ? ArrayIndexOutOfBoundsException.class : null;
                    if (failure == null) {
                        int result = to - from == 4 ? -1 : to - from;
                        check(range(kind, a, from, to, b, 0, 4), result, "valid first range");
                        check(range(kind, a, 0, 4, b, from, to), result, "valid second range");
                    } else {
                        expect(failure, () -> range(type, a, from, to, b, 0, 4));
                        expect(failure, () -> range(type, a, 0, 4, b, from, to));
                    }
                    expect(failure == null ? NullPointerException.class : failure,
                            () -> range(type, a, from, to, null, 0, 4));
                    expect(NullPointerException.class, () -> range(type, null, from, to, b, 0, 4));
                }
            }
        }
    }

    private static void expect(Class<? extends Throwable> expected, Runnable action) {
        try {
            action.run();
        } catch (Throwable actual) {
            if (expected.isInstance(actual)) return;
            throw new AssertionError("expected " + expected + ", got " + actual, actual);
        }
        throw new AssertionError("missing " + expected);
    }

    private static void compile(WhiteBox wb, Method method) {
        if (!wb.enqueueMethodForCompilation(method, 4) || wb.getMethodCompilationLevel(method) != 4) {
            throw new AssertionError("not C2 compiled: " + method);
        }
    }

    private static void child() throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        for (int kind = 0; kind < TYPES.length; kind++) {
            Class<?> array = Array.newInstance(TYPES[kind], 0).getClass();
            Object a = Array.newInstance(TYPES[kind], 4097);
            Object b = Array.newInstance(TYPES[kind], 4097);
            Method support = ArraysSupport.class.getMethod("mismatch",
                    array, int.class, array, int.class, int.class);
            for (int i = 0; i < 2000; i++) {
                int length = i % 3 == 0 ? 8 : i % 3 == 1 ? 128 : 4096;
                value(kind, b, 2, true);
                check((int) support.invoke(null, a, 1, b, 1, length), 1, "profile support");
                check(range(kind, a, 1, 1 + length, b, 1, 1 + length), 1, "profile range");
                value(kind, b, 2, false);
                value(kind, b, 1, true);
                check(full(kind, a, b), 1, "profile full");
                value(kind, b, 1, false);
            }
            for (int i = 0; i < 2000; i++) {
                int length = i % 3 == 0 ? 8 : i % 3 == 1 ? 128 : 4096;
                check(store(kind, a, 1, b, 1, length, 1), 1, "profile store");
            }
            // Compile callees before callers, reproducing the early-mismatch inlining cliff.
            // A cold bulk exit may be an uncommon trap rather than a retained call.
            compile(wb, kind >= 6
                    ? ArraysSupport.class.getDeclaredMethod("mismatchLarge",
                            array, int.class, array, int.class, int.class, boolean.class)
                    : ArraysSupport.class.getDeclaredMethod("mismatchLarge",
                            array, int.class, array, int.class, int.class));
            for (Method callee : List.of(
                    ArraysSupport.class.getMethod("mismatch", array, int.class, array, int.class, int.class),
                    ArraysSupport.class.getMethod("mismatch", array, array, int.class),
                    Arrays.class.getMethod("mismatch", array, int.class, int.class, array, int.class, int.class),
                    Arrays.class.getMethod("mismatch", array, array))) {
                wb.deoptimizeMethod(callee);
                compile(wb, callee);
            }
            for (String suffix : new String[] {"Range", "Full", "Store"}) {
                String name = TYPES[kind].getName() + suffix;
                Method method = suffix.equals("Range")
                        ? AArch64ArrayMismatchCallBoundaryTest.class.getMethod(name, array, int.class,
                                int.class, array, int.class, int.class)
                        : suffix.equals("Full")
                            ? AArch64ArrayMismatchCallBoundaryTest.class.getMethod(name, array, array)
                            : AArch64ArrayMismatchCallBoundaryTest.class.getMethod(name, array, int.class,
                                    array, int.class, int.class, int.class);
                wb.deoptimizeMethod(method);
                System.out.println(MARKER + name);
                System.out.flush();
                compile(wb, method);
                System.out.println(MARKER + "end");
                if (suffix.equals("Store")) {
                    check(store(kind, a, 1, b, 1, 128, 1), 1, "installed inline store");
                    if (wb.getMethodCompilationLevel(method) != 4) {
                        throw new AssertionError("Store path deoptimized: " + method);
                    }
                }
            }
        }
        System.out.println(MARKER + "end");
        semantics();
    }

    public static void verify(String text) {
        Map<String, List<String>> graphs = new HashMap<>();
        String current = null;
        for (String line : text.lines().toList()) {
            if (line.startsWith(MARKER)) {
                current = line.substring(MARKER.length());
                if (!current.equals("end") && graphs.put(current, new ArrayList<>()) != null) {
                    throw new AssertionError("duplicate graph " + current);
                }
            } else if (current != null && !current.equals("end")) {
                graphs.get(current).add(line);
            }
        }
        for (Class<?> type : TYPES) {
            for (String suffix : new String[] {"Range", "Full", "Store"}) {
                if (!graphs.containsKey(type.getName() + suffix)) {
                    throw new AssertionError("missing graph " + type.getName() + suffix);
                }
            }
        }
        if (graphs.size() != 24) throw new AssertionError("unexpected graphs " + graphs.keySet());
        List<String> failures = new ArrayList<>();
        for (var entry : graphs.entrySet()) {
            List<String> nodes = entry.getValue().stream()
                    .filter(s -> s.matches("\\s*o?\\d+\\s+\\w+\\s+===.*")).toList();
            long bulk = nodes.stream().filter(s -> s.contains("CallStaticJava") &&
                    s.contains("# Static  jdk.internal.util.ArraysSupport::mismatchLarge ")).count();
            boolean hiddenCall = nodes.stream().anyMatch(s -> s.contains("CallStaticJava") &&
                    s.contains("# Static  ") &&
                    !s.contains("# Static  jdk.internal.util.ArraysSupport::mismatchLarge "));
            boolean leaf = nodes.stream().anyMatch(s -> s.contains("CallLeaf") && s.contains("vectorizedMismatch"));
            if (nodes.isEmpty() || bulk > 1 || hiddenCall || leaf) {
                failures.add(entry.getKey() + ": hidden mismatch boundary, leaf call, or missing graph");
            }
            if (entry.getKey().endsWith("Store")) {
                verifyStore(entry.getKey(), nodes, failures);
            }
        }
        if (!failures.isEmpty()) throw new AssertionError(String.join("; ", failures));
        System.out.println("Verified sixteen public boundaries and eight inlined store/prefix graphs");
    }

    private record IdealNode(int id, String op, List<Integer> inputs, String text) {}

    private static boolean dependsOn(Map<Integer, IdealNode> graph, int start, int target) {
        ArrayDeque<Integer> pending = new ArrayDeque<>();
        Set<Integer> visited = new HashSet<>();
        pending.push(start);
        while (!pending.isEmpty()) {
            int id = pending.pop();
            if (id == target) return true;
            if (id == 0 || !visited.add(id)) continue;
            IdealNode node = graph.get(id);
            if (node != null) pending.addAll(node.inputs());
        }
        return false;
    }

    private static void verifyStore(String name, List<String> lines, List<String> failures) {
        Pattern pattern = Pattern.compile("\\s*o?(\\d+)\\s+(\\w+)\\s+===\\s*(.*?)\\[\\[");
        Map<Integer, IdealNode> graph = new HashMap<>();
        for (String line : lines) {
            Matcher match = pattern.matcher(line);
            if (!match.find()) continue;
            List<Integer> inputs = Arrays.stream(match.group(3).split("\\|", 2)[0].trim().split("\\s+"))
                    .filter(s -> s.matches("\\d+")).map(Integer::valueOf).toList();
            int id = Integer.parseInt(match.group(1));
            graph.put(id, new IdealNode(id, match.group(2), inputs, line));
        }
        List<IdealNode> stores = graph.values().stream()
                .filter(n -> n.op().matches("Store[B-CDFILS]")).toList();
        List<IdealNode> loads = graph.values().stream()
                .filter(n -> n.op().matches("Load[ILDF]") && n.text().contains("unsafe") &&
                        (n.text().contains("ArraysSupport::mismatchPrefix") ||
                         n.text().contains("ArraysSupport::mismatch @"))).toList();
        if (stores.size() != 2 || loads.size() < 2) {
            failures.add(name + ": both stores and both unsafe prefix loads must be inline");
            return;
        }
        IdealNode first = stores.get(0), last = stores.get(1);
        if (dependsOn(graph, first.inputs().get(1), last.id())) {
            IdealNode swap = first; first = last; last = swap;
        }
        final int firstId = first.id();
        final int lastControl = last.inputs().get(0);
        if (!dependsOn(graph, last.inputs().get(1), firstId) ||
                loads.stream().anyMatch(n -> !dependsOn(graph, n.inputs().get(1), firstId)) ||
                loads.stream().noneMatch(n -> dependsOn(graph, lastControl, n.id()))) {
            failures.add(name + ": prefix loads must follow the first store and precede the last");
        }
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            switch (args[0]) {
                case "semantics" -> semantics();
                case "child" -> child();
                case "verify" -> verify(Files.readString(Path.of(args[1])));
                default -> throw new AssertionError(args[0]);
            }
            return;
        }
        String test = AArch64ArrayMismatchCallBoundaryTest.class.getName();
        List<String> flags = new ArrayList<>(List.of(
                "-Xbootclasspath/a:.", "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI",
                "--add-exports=java.base/jdk.internal.util=ALL-UNNAMED",
                "-XX:-TieredCompilation", "-XX:-BackgroundCompilation",
                "-XX:CompileThreshold=1000", "-XX:CompileCommand=quiet",
                "-XX:+LogCompilation", "-XX:LogFile=AArch64ArrayMismatchCallBoundaryTest-compilation.xml",
                "-XX:CompileCommand=DumpReplay,java.util.Arrays::mismatch",
                "-XX:CompileCommand=DumpReplay,jdk.internal.util.ArraysSupport::mismatch",
                "-XX:CompileCommand=dontinline," + test + "::*"));
        for (Class<?> type : TYPES) {
            for (String suffix : new String[] {"Range", "Full", "Store"}) {
                flags.add("-XX:CompileCommand=PrintIdealPhase," + test + "::" + type.getName() + suffix + ",BEFORE_MATCHING");
                flags.add("-XX:CompileCommand=DumpReplay," + test + "::" + type.getName() + suffix);
            }
        }
        flags.add(test);
        flags.add("child");
        OutputAnalyzer output = ProcessTools.executeProcess(ProcessTools.createLimitedTestJavaProcessBuilder(flags));
        String text = output.getStdout() + "\n" + output.getStderr();
        Path capture = Path.of("AArch64ArrayMismatchCallBoundaryTest-ideal.log").toAbsolutePath();
        Files.writeString(capture, text);
        System.out.println("Array call-boundary graph capture: " + capture);
        output.shouldHaveExitValue(0);
        verify(text);
    }
}
