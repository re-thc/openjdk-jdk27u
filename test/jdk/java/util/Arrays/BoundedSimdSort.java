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
 * @summary Verify bounded in-place SIMD range sorting and primitive sort semantics
 * @requires vm.compiler2.enabled & vm.compiler1.enabled
 * @run main/othervm -Xbatch -Djava.util.concurrent.ForkJoinPool.common.parallelism=4 --add-opens=java.base/java.util=ALL-UNNAMED BoundedSimdSort
 * @run main/othervm -Xint -Djava.util.concurrent.ForkJoinPool.common.parallelism=4 --add-opens=java.base/java.util=ALL-UNNAMED BoundedSimdSort
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 -Djava.util.concurrent.ForkJoinPool.common.parallelism=4 --add-opens=java.base/java.util=ALL-UNNAMED BoundedSimdSort
 * @run main/othervm -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_trySortRange -Djava.util.concurrent.ForkJoinPool.common.parallelism=4 --add-opens=java.base/java.util=ALL-UNNAMED BoundedSimdSort
 */

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.util.Arrays;
import java.util.SplittableRandom;

/**
 * Tests the private helper's contract without depending on whether this VM
 * activates its intrinsic. A declined helper must leave the range untouched;
 * an accepted helper must finish the entire range before returning true.
 * Public sort tests independently verify the caller and fallback behavior.
 */
public class BoundedSimdSort {
    private static final int[] SIZES = {
        0, 1, 43, 44, 45, 255, 256, 257, 511, 512, 513,
        4095, 4096, 4097, 8191, 8192, 8193
    };
    private static final String[] PATTERNS = {
        "random", "equal", "two-values", "few-values", "ascending",
        "descending", "organ-pipe", "runs"
    };

    private static final MethodHandle TRY_SORT_RANGE;

    static {
        try {
            Class<?> dpq = Class.forName("java.util.DualPivotQuicksort");
            TRY_SORT_RANGE = MethodHandles.privateLookupIn(dpq, MethodHandles.lookup())
                    .findStatic(dpq, "trySortRange",
                            MethodType.methodType(boolean.class, long[].class,
                                    int.class, int.class));
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private static void require(boolean condition, String message) {
        if (!condition) {
            throw new AssertionError(message);
        }
    }

    private static long[] values(int size, String pattern, long salt) {
        long[] result = new long[size];
        SplittableRandom random = new SplittableRandom(0x57A11L ^ salt ^ size);
        for (int i = 0; i < size; i++) {
            switch (pattern) {
                case "random":
                    result[i] = random.nextLong();
                    break;
                case "equal":
                    result[i] = -0x1234_5678_9ABCL;
                    break;
                case "two-values":
                    result[i] = (i & 1) == 0 ? Long.MIN_VALUE : Long.MAX_VALUE;
                    break;
                case "few-values":
                    switch (i % 5) {
                        case 0: result[i] = Long.MIN_VALUE; break;
                        case 1: result[i] = -1; break;
                        case 2: result[i] = 0; break;
                        case 3: result[i] = 1; break;
                        default: result[i] = Long.MAX_VALUE; break;
                    }
                    break;
                case "ascending":
                    result[i] = (long) i - size / 2L;
                    break;
                case "descending":
                    result[i] = (long) size / 2L - i;
                    break;
                case "organ-pipe":
                    result[i] = Math.min(i, size - 1 - i);
                    break;
                case "runs":
                    int run = i / 31;
                    int inRun = i % 31;
                    result[i] = (run & 1) == 0
                            ? (long) run * 64 + inRun
                            : (long) (run + 1) * 64 - inRun;
                    break;
                default:
                    throw new AssertionError("Unknown pattern " + pattern);
            }
        }
        if (pattern.equals("random") && size > 1) {
            result[0] = Long.MIN_VALUE;
            result[size - 1] = Long.MAX_VALUE;
        }
        return result;
    }

    // Boxed object sorting is an independent oracle for primitive long sorting.
    private static Long[] expected(long[] source, int low, int high) {
        Long[] result = new Long[high - low];
        for (int i = low; i < high; i++) {
            result[i - low] = source[i];
        }
        Arrays.sort(result, Long::compare);
        return result;
    }

    private static void assertRange(long[] actual, long[] before, int low, int high,
                                    String where) {
        Long[] sorted = expected(before, low, high);
        for (int i = 0; i < low; i++) {
            require(actual[i] == before[i], where + " changed prefix at " + i);
        }
        for (int i = low; i < high; i++) {
            require(actual[i] == sorted[i - low], where + " wrong value at " + i);
        }
        for (int i = high; i < actual.length; i++) {
            require(actual[i] == before[i], where + " changed suffix at " + i);
        }
    }

    private static void testHelperContract() throws Throwable {
        int checks = 0;
        for (int size : SIZES) {
            for (String pattern : PATTERNS) {
                int low = 7;
                int high = low + size;
                long[] array = new long[size + 14];
                Arrays.fill(array, 0, low, 0x5A5A5A5A5A5A5A5AL);
                System.arraycopy(values(size, pattern, checks), 0, array, low, size);
                Arrays.fill(array, high, array.length, 0x2B2B2B2B2B2B2B2BL);
                long[] before = array.clone();

                boolean completed = (boolean) TRY_SORT_RANGE.invokeExact(array, low, high);
                if (completed) {
                    assertRange(array, before, low, high,
                            "accepted helper size=" + size + " pattern=" + pattern);
                } else {
                    require(Arrays.equals(array, before),
                            "declined helper mutated input size=" + size + " pattern=" + pattern);
                }
                if (size < 512 || size > 8192) {
                    require(!completed, "helper accepted out-of-policy size " + size);
                }
                checks++;
            }
        }

        for (int[] range : new int[][] {{-1, 512}, {7, 6}, {7, 8201}}) {
            long[] array = values(8200, "random", checks);
            long[] before = array.clone();
            boolean completed = (boolean) TRY_SORT_RANGE.invokeExact(array, range[0], range[1]);
            require(!completed, "helper accepted invalid range " + Arrays.toString(range));
            require(Arrays.equals(array, before), "invalid helper range mutated input");
            checks++;
        }
        System.out.println("helper contract checks=" + checks);
    }

    private static void testLongPublicSorts() {
        int checks = 0;
        for (int size : SIZES) {
            for (String pattern : PATTERNS) {
                int low = 7;
                int high = low + size;
                long[] array = new long[size + 14];
                Arrays.fill(array, 0, low, 0x5A5A5A5A5A5A5A5AL);
                System.arraycopy(values(size, pattern, checks + 1000), 0, array, low, size);
                Arrays.fill(array, high, array.length, 0x2B2B2B2B2B2B2B2BL);
                long[] before = array.clone();
                Arrays.sort(array, low, high);
                assertRange(array, before, low, high,
                        "Arrays.sort size=" + size + " pattern=" + pattern);
                checks++;
            }

            long[] full = values(size, "random", size + 2000);
            long[] fullBefore = full.clone();
            Arrays.sort(full);
            assertRange(full, fullBefore, 0, size, "full Arrays.sort size=" + size);
            checks++;
        }

        for (int size : new int[] {4097, 8192, 8193}) {
            for (String pattern : new String[] {"random", "runs", "two-values"}) {
                int low = 5;
                int high = low + size;
                long[] array = new long[size + 10];
                Arrays.fill(array, 0, low, Long.MIN_VALUE + 17);
                System.arraycopy(values(size, pattern, checks + 3000), 0, array, low, size);
                Arrays.fill(array, high, array.length, Long.MAX_VALUE - 17);
                long[] before = array.clone();
                Arrays.parallelSort(array, low, high);
                assertRange(array, before, low, high,
                        "parallelSort size=" + size + " pattern=" + pattern);
                checks++;
            }
        }
        System.out.println("long public sort checks=" + checks);
    }

    private static int[] intValues(int size) {
        int[] values = new int[size];
        SplittableRandom random = new SplittableRandom(0x1A7L + size);
        for (int i = 0; i < size; i++) {
            values[i] = random.nextInt();
        }
        if (size > 1) {
            values[0] = Integer.MIN_VALUE;
            values[size - 1] = Integer.MAX_VALUE;
        }
        return values;
    }

    private static float[] floatValues(int size) {
        float[] values = new float[size];
        SplittableRandom random = new SplittableRandom(0xF10A7L + size);
        for (int i = 0; i < size; i++) {
            values[i] = (float) random.nextInt(-10000, 10000);
        }
        if (size >= 8) {
            values[0] = Float.POSITIVE_INFINITY;
            values[1] = Float.NEGATIVE_INFINITY;
            values[2] = -0.0f;
            values[3] = 0.0f;
            values[4] = Float.intBitsToFloat(0x7fc00001);
            values[5] = Float.intBitsToFloat(0xffc01234);
            values[6] = -1.0f;
            values[7] = 1.0f;
        }
        return values;
    }

    private static double[] doubleValues(int size) {
        double[] values = new double[size];
        SplittableRandom random = new SplittableRandom(0xD0B1EL + size);
        for (int i = 0; i < size; i++) {
            values[i] = random.nextInt(-10000, 10000);
        }
        if (size >= 8) {
            values[0] = Double.POSITIVE_INFINITY;
            values[1] = Double.NEGATIVE_INFINITY;
            values[2] = -0.0d;
            values[3] = 0.0d;
            values[4] = Double.longBitsToDouble(0x7ff8000000000001L);
            values[5] = Double.longBitsToDouble(0xfff8000000001234L);
            values[6] = -1.0d;
            values[7] = 1.0d;
        }
        return values;
    }

    private static void testOtherPrimitivePaths() {
        int checks = 0;
        for (int size : new int[] {45, 257, 8193}) {
            int low = 3;
            int high = low + size;

            int[] ints = new int[size + 6];
            Arrays.fill(ints, 0, low, 0x5A5A5A5A);
            System.arraycopy(intValues(size), 0, ints, low, size);
            Arrays.fill(ints, high, ints.length, 0x2B2B2B2B);
            int[] intsBefore = ints.clone();
            Integer[] expectedInts = new Integer[size];
            for (int i = low; i < high; i++) expectedInts[i - low] = intsBefore[i];
            Arrays.sort(expectedInts, Integer::compare);
            if (size > 4096) Arrays.parallelSort(ints, low, high);
            else Arrays.sort(ints, low, high);
            for (int i = 0; i < low; i++) require(ints[i] == intsBefore[i], "int prefix changed");
            for (int i = low; i < high; i++) require(ints[i] == expectedInts[i - low], "int sort mismatch");
            for (int i = high; i < ints.length; i++) require(ints[i] == intsBefore[i], "int suffix changed");

            float[] floats = new float[size + 6];
            Arrays.fill(floats, 0, low, Float.intBitsToFloat(0x7fc05555));
            System.arraycopy(floatValues(size), 0, floats, low, size);
            Arrays.fill(floats, high, floats.length, Float.intBitsToFloat(0xffc06666));
            float[] floatsBefore = floats.clone();
            Float[] expectedFloats = new Float[size];
            for (int i = low; i < high; i++) expectedFloats[i - low] = floatsBefore[i];
            Arrays.sort(expectedFloats, Float::compare);
            if (size > 4096) Arrays.parallelSort(floats, low, high);
            else Arrays.sort(floats, low, high);
            for (int i = 0; i < low; i++) require(Float.floatToRawIntBits(floats[i]) == Float.floatToRawIntBits(floatsBefore[i]), "float prefix changed");
            for (int i = low; i < high; i++) require(Float.compare(floats[i], expectedFloats[i - low]) == 0, "float sort mismatch");
            for (int i = high; i < floats.length; i++) require(Float.floatToRawIntBits(floats[i]) == Float.floatToRawIntBits(floatsBefore[i]), "float suffix changed");

            double[] doubles = new double[size + 6];
            Arrays.fill(doubles, 0, low, Double.longBitsToDouble(0x7ff8000000005555L));
            System.arraycopy(doubleValues(size), 0, doubles, low, size);
            Arrays.fill(doubles, high, doubles.length, Double.longBitsToDouble(0xfff8000000006666L));
            double[] doublesBefore = doubles.clone();
            Double[] expectedDoubles = new Double[size];
            for (int i = low; i < high; i++) expectedDoubles[i - low] = doublesBefore[i];
            Arrays.sort(expectedDoubles, Double::compare);
            if (size > 4096) Arrays.parallelSort(doubles, low, high);
            else Arrays.sort(doubles, low, high);
            for (int i = 0; i < low; i++) require(Double.doubleToRawLongBits(doubles[i]) == Double.doubleToRawLongBits(doublesBefore[i]), "double prefix changed");
            for (int i = low; i < high; i++) require(Double.compare(doubles[i], expectedDoubles[i - low]) == 0, "double sort mismatch");
            for (int i = high; i < doubles.length; i++) require(Double.doubleToRawLongBits(doubles[i]) == Double.doubleToRawLongBits(doublesBefore[i]), "double suffix changed");
            checks += 3;
        }
        System.out.println("other primitive checks=" + checks);
    }

    private static void expect(Class<? extends Throwable> expected, Runnable action,
                               String description) {
        try {
            action.run();
            throw new AssertionError("Expected " + expected.getSimpleName() + " for " + description);
        } catch (Throwable actual) {
            if (!expected.isInstance(actual)) {
                throw new AssertionError("Unexpected exception for " + description, actual);
            }
        }
    }

    private static void testRangeExceptions() {
        long[] array = values(32, "random", 7000);
        long[] before = array.clone();
        expect(IllegalArgumentException.class, () -> Arrays.sort(array, 20, 10), "sort from > to");
        require(Arrays.equals(array, before), "invalid sort changed array");
        expect(ArrayIndexOutOfBoundsException.class, () -> Arrays.sort(array, -1, 10), "sort negative low");
        require(Arrays.equals(array, before), "invalid sort changed array");
        expect(ArrayIndexOutOfBoundsException.class, () -> Arrays.parallelSort(array, 0, 33), "parallelSort high out of bounds");
        require(Arrays.equals(array, before), "invalid parallelSort changed array");
    }

    public static void main(String[] args) throws Throwable {
        testHelperContract();
        testLongPublicSorts();
        testOtherPrimitivePaths();
        testRangeExceptions();
        System.out.println("PASS BoundedSimdSort");
    }
}
