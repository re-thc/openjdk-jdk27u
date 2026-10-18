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
 */

/*
 * @test
 * @summary Check serial int sorting and its Java fallback against an independent radix oracle
 * @run main/othervm SerialIntSort
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_arraySort,_arrayPartition SerialIntSort
 * @run main/othervm -XX:TieredStopAtLevel=1 SerialIntSort
 */

import java.util.Arrays;
import java.util.Random;

public class SerialIntSort {
    private static final String[] PATTERNS = {
        "random", "equal", "few", "sorted", "reversed", "nearly", "runs",
        "organpipe", "sawtooth", "alternating", "prefix", "extremes", "killer"
    };

    public static void main(String[] args) {
        if (args.length == 0 || !args[0].equals("cold")) {
            int[] seed = create(4097, "random", 0), work = seed.clone();
            for (int i = 0; i < 20000; i++) {
                System.arraycopy(seed, 0, work, 0, seed.length);
                Arrays.sort(work);
            }
        }
        int[] sizes = {0, 1, 2, 43, 44, 65, 512, 4095, 4096, 4097, 65536,
                       (1 << 20) - 1, 1 << 20, (1 << 20) + 1};
        int checks = 0;
        for (int size : sizes) {
            for (String pattern : PATTERNS) {
                for (int offset : new int[] {0, 17}) {
                    int[] original = create(size, pattern, checks);
                    int[] a = new int[size + offset + (offset == 0 ? 0 : 19)];
                    for (int i = 0; i < a.length; i++) a[i] = 0x5a5a5a5a ^ i * 0x9e3779b9;
                    System.arraycopy(original, 0, a, offset, size);
                    int[] expected = a.clone();
                    int[] ordered = radix(original);
                    System.arraycopy(ordered, 0, expected, offset, size);
                    if (offset == 0) Arrays.sort(a);
                    else Arrays.sort(a, offset, offset + size);
                    if (!Arrays.equals(a, expected)) {
                        throw new AssertionError(size + "/" + pattern + "/" + offset
                                                 + " at " + Arrays.mismatch(a, expected));
                    }
                    checks++;
                }
            }
        }
        int[] a = {3, 2, 1};
        expect(NullPointerException.class, () -> Arrays.sort((int[]) null));
        expect(NullPointerException.class, () -> Arrays.sort((int[]) null, 2, 1));
        expect(IllegalArgumentException.class, () -> Arrays.sort(a, 2, 1));
        expect(ArrayIndexOutOfBoundsException.class, () -> Arrays.sort(a, -1, 2));
        expect(ArrayIndexOutOfBoundsException.class, () -> Arrays.sort(a, 0, 4));
        if (!Arrays.equals(a, new int[] {3, 2, 1})) throw new AssertionError("exception mutation");
        System.out.println("Passed " + checks + " complete-output/range comparisons");
    }

    static int[] create(int n, String pattern, int seed) {
        int[] a = new int[n];
        Random r = new Random(0xc0ffeeL + seed);
        for (int i = 0; i < n; i++) {
            a[i] = switch (pattern) {
                case "equal" -> 42;
                case "few" -> r.nextInt(4);
                case "sorted", "nearly" -> i;
                case "reversed" -> n - i;
                case "runs" -> (i + n / 4) % n;
                case "organpipe" -> Math.min(i, n - i);
                case "sawtooth" -> i % 97;
                case "alternating" -> (i & 1) == 0 ? i : -i;
                case "prefix" -> i < n / 2 ? n - i : r.nextInt();
                case "killer" -> i < n / 2 ? ((i & 1) == 0 ? i + 1 : n / 2 + i) : (i - n / 2) * 2 + 2;
                case "extremes" -> switch (i % 5) {
                    case 0 -> Integer.MIN_VALUE;
                    case 1 -> Integer.MAX_VALUE;
                    default -> r.nextInt();
                };
                default -> r.nextInt();
            };
        }
        if (pattern.equals("nearly") && n > 1) {
            for (int i = 0; i < 32; i++) {
                int p = r.nextInt(n), q = r.nextInt(n), t = a[p];
                a[p] = a[q]; a[q] = t;
            }
        }
        return a;
    }

    // Four stable byte passes, with the sign byte biased into unsigned order.
    static int[] radix(int[] source) {
        int[] a = source.clone(), b = new int[a.length];
        for (int shift = 0; shift < 32; shift += 8) {
            int[] counts = new int[256];
            for (int v : a) counts[((v ^ Integer.MIN_VALUE) >>> shift) & 255]++;
            int sum = 0;
            for (int i = 0; i < 256; i++) {
                int n = counts[i]; counts[i] = sum; sum += n;
            }
            for (int v : a) b[counts[((v ^ Integer.MIN_VALUE) >>> shift) & 255]++] = v;
            int[] t = a; a = b; b = t;
        }
        return a;
    }

    static void expect(Class<? extends Throwable> expected, Runnable action) {
        try { action.run(); }
        catch (Throwable t) {
            if (expected.isInstance(t)) return;
            throw new AssertionError(t);
        }
        throw new AssertionError("Missing " + expected.getName());
    }
}
