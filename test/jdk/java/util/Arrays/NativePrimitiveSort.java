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
 * @summary Verify bounded native integer sorting, Java fallback, ranges and signed extrema
 * @run main/othervm NativePrimitiveSort
 * @run main/othervm -Xint NativePrimitiveSort quick
 * @run main/othervm -XX:TieredStopAtLevel=1 NativePrimitiveSort quick
 * @run main/othervm -Djdk.util.Arrays.disableNativeSort=true NativePrimitiveSort quick
 */

import java.util.Arrays;

public class NativePrimitiveSort {
    private static long comparisons;
    private static long mix(long x) {
        x = (x ^ (x >>> 30)) * 0xbf58476d1ce4e5b9L;
        x = (x ^ (x >>> 27)) * 0x94d049bb133111ebL;
        return x ^ (x >>> 31);
    }

    private static long value(int i, int n, int pattern, int width) {
        long random = mix(i * 0x9e3779b97f4a7c15L + n + 20261019);
        long min = width == 4 ? Integer.MIN_VALUE : Long.MIN_VALUE;
        long max = width == 4 ? Integer.MAX_VALUE : Long.MAX_VALUE;
        return switch (pattern) {
            case 1 -> (random & 1) == 0 ? min : max;
            case 2 -> (random & 15) - 8;
            case 3 -> -17;
            case 4 -> i - n / 2;
            case 5 -> n / 2 - i;
            case 6 -> i % 97 == 0 ? random : i - n / 2;
            case 7 -> (i / 257 % 2 == 0 ? i % 257 : 256 - i % 257) + i / 257 * 13L;
            case 8 -> Math.min(i, n - i) - n / 4;
            case 9 -> i % 97 - 48;
            case 10 -> (random & 127) == 0 ? random : 0;
            case 11 -> switch (i % 6) { case 0 -> min; case 1 -> max; case 2 -> -1; case 3 -> 0; default -> random; };
            case 12 -> i < n / 3 ? n - i : random; // Run scan reverses a prefix, then declines.
            case 13 -> (i * 31L % Math.max(1, n)) - n / 2;
            case 14 -> (long) Integer.reverse(i);
            case 15 -> i % 2 == 0 ? i : n - i;
            case 16 -> i < 32 ? 32 - i : random;
            case 17 -> i < 32 ? 0 : random; // Constant prefix followed by random data.
            default -> random;
        };
    }

    // Independent signed LSD radix oracle; no Arrays.sort is used to build expected output.
    static long[] oracle(long[] input, int low, int size, int width) {
        long[] keys = Arrays.copyOfRange(input, low, low + size), temp = new long[size];
        for (int pass = 0; pass < width; pass++) {
            int[] counts = new int[256];
            int shift = pass * 8;
            for (long x : keys) counts[(int) (x >>> shift) & 255]++;
            int sum = 0;
            for (int i = 0; i < 256; i++) {
                int k = pass == width - 1 ? i ^ 128 : i;
                int count = counts[k]; counts[k] = sum; sum += count;
            }
            for (long x : keys) temp[counts[(int) (x >>> shift) & 255]++] = x;
            long[] swap = keys; keys = temp; temp = swap;
        }
        long[] result = input.clone();
        System.arraycopy(keys, 0, result, low, size);
        return result;
    }

    private static void check(int size, int offset, int pattern, int width) {
        long[] input = new long[size + offset + 19];
        for (int i = 0; i < input.length; i++) input[i] = mix(i + 57);
        for (int i = 0; i < size; i++) input[offset + i] = value(i, size, pattern, width);
        if (pattern == 18 && size > 0) {
            input[offset] = 0;
            for (int i = 1; i <= 32; i++) input[offset + (int) ((long) (size - 1) * i / 32)] = 0;
        }
        if (width == 4) for (int i = 0; i < input.length; i++) input[i] = (int) input[i];
        long[] expected = oracle(input, offset, size, width);
        if (width == 4) {
            int[] actual = new int[input.length];
            for (int i = 0; i < input.length; i++) actual[i] = (int) input[i];
            Arrays.sort(actual, offset, offset + size);
            for (int i = 0; i < actual.length; i++) if (actual[i] != expected[i]) fail(size, offset, pattern, width, i);
        } else {
            Arrays.sort(input, offset, offset + size);
            if (!Arrays.equals(input, expected)) fail(size, offset, pattern, width, -1);
        }
        comparisons++;
    }

    private static void fail(int n, int offset, int pattern, int width, int i) {
        throw new AssertionError("n=" + n + " offset=" + offset + " pattern=" + pattern + " width=" + width + " index=" + i);
    }

    private static void expect(Class<? extends Throwable> exception, Runnable operation) {
        try { operation.run(); } catch (Throwable actual) {
            if (exception.isInstance(actual)) return;
            throw new AssertionError("Wrong exception", actual);
        }
        throw new AssertionError("Missing " + exception);
    }

    private static void errors() {
        expect(NullPointerException.class, () -> Arrays.sort((int[]) null));
        expect(NullPointerException.class, () -> Arrays.sort((long[]) null, 0, 0));
        expect(IllegalArgumentException.class, () -> Arrays.sort(new int[8], 5, 2));
        expect(IllegalArgumentException.class, () -> Arrays.sort(new long[8], 5, 2));
        expect(ArrayIndexOutOfBoundsException.class, () -> Arrays.sort(new int[8], -1, 2));
        expect(ArrayIndexOutOfBoundsException.class, () -> Arrays.sort(new long[8], 0, 9));
    }

    public static void main(String[] args) {
        boolean quick = args.length != 0;
        int[] sizes = {0, 1, 2, 15, 31, 43, 44, 45, 64, 65, 127, 257, 1023, 1024, 1025,
                       4093, 4095, 4096, 4097, 8191, 16383, 16384, 16385, 32769,
                       65521, 65535, 65536, 65537};
        for (int width : new int[]{4, 8}) for (int size : sizes)
            for (int offset : new int[]{0, 3, 17}) for (int pattern = 0; pattern < 19; pattern++)
                check(size, offset, pattern, width);
        if (!quick) for (int width : new int[]{4, 8}) for (int size : new int[]{131071, 262147, 1048573, 1048576, 1048577})
            for (int offset : new int[]{0, 17}) for (int pattern = 0; pattern < 19; pattern++)
                check(size, offset, pattern, width);
        // Exercise public whole-array overloads as well as range overloads.
        for (int width : new int[]{4, 8}) {
            int n = 65537;
            long[] values = new long[n]; for (int i = 0; i < n; i++) values[i] = mix(i);
            long[] expected = oracle(values, 0, n, width);
            if (width == 8) { Arrays.sort(values); if (!Arrays.equals(values, expected)) throw new AssertionError(); }
            else {
                for (int i = 0; i < n; i++) values[i] = (int) values[i];
                expected = oracle(values, 0, n, width);
                int[] actual = new int[n]; for (int i = 0; i < n; i++) actual[i] = (int) values[i];
                Arrays.sort(actual); for (int i = 0; i < n; i++) if (actual[i] != expected[i]) throw new AssertionError();
            }
        }
        errors();
        System.out.println("PASS " + comparisons + " complete-output and guard comparisons");
    }
}
