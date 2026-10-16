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
 * @summary NativePRNG serves small requests from buffers that threads share,
 *          and never hands out the same bytes twice
 * @requires os.family != "windows"
 * @run main/othervm NativePRNGBuffer NativePRNG
 * @run main/othervm NativePRNGBuffer NativePRNGNonBlocking
 * @run main/othervm NativePRNGBuffer NativePRNGBlocking
 */

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class NativePRNGBuffer {

    // Bound retained samples independently of processor count.
    private static final int TOTAL_REQUESTS = 128_000;
    private static final int MIN_REQUESTS_PER_THREAD = 1_000;
    // Exercise the buffered-request boundary.
    private static final int[] SIZES = { 1, 7, 16, 63, 64, 65, 300 };
    private static final int KEY_BYTES = 7;

    // Mirror production buffer sizing to force sharing at every CPU count.
    static int buffers(int cpus) {
        int n = Math.min(4 * cpus, 64);
        return Integer.highestOneBit(2 * n - 1);
    }

    static int threads(int cpus) {
        return 2 * buffers(cpus);
    }

    public static void main(String[] args) throws Exception {
        for (int cpus : new int[] { 1, 2, 3, 4, 16, 64, 128, 1024, 1 << 20 }) {
            checkPlan(cpus);
        }

        SecureRandom random = SecureRandom.getInstance(args[0]);
        int nThreads = threads(Runtime.getRuntime().availableProcessors());
        int perThread = TOTAL_REQUESTS / nThreads;
        long[][] keys = new long[nThreads][];
        List<Thread> threads = new ArrayList<>();
        List<Throwable> failures = new ArrayList<>();
        for (int t = 0; t < nThreads; t++) {
            int index = t;
            Thread thread = new Thread(() -> {
                long[] k = new long[perThread];
                int n = 0;
                for (int i = 0; i < perThread; i++) {
                    byte[] b = new byte[SIZES[(index + i) % SIZES.length]];
                    random.nextBytes(b);
                    if (b.length >= KEY_BYTES) {
                        k[n++] = key(b);
                    }
                }
                keys[index] = Arrays.copyOf(k, n);
            });
            thread.setUncaughtExceptionHandler((th, e) -> {
                synchronized (failures) {
                    failures.add(e);
                }
            });
            threads.add(thread);
            thread.start();
        }
        for (Thread thread : threads) {
            thread.join();
        }
        if (!failures.isEmpty()) {
            throw new RuntimeException(failures.get(0));
        }

        // Bytes handed out twice would repeat the first bytes of a request.
        // Of 128,000 random keys of 56 bits, two are equal by chance with a
        // probability of less than 10^-6.
        long[] all = Arrays.stream(keys).flatMapToLong(Arrays::stream).toArray();
        Arrays.sort(all);
        for (int i = 1; i < all.length; i++) {
            if (all[i] == all[i - 1]) {
                throw new RuntimeException("Repeated bytes: "
                        + Long.toHexString(all[i]));
            }
        }

        byte[] a = new byte[8];
        byte[] b = new byte[8];
        for (int i = 0; i < 1000; i++) {
            random.nextBytes(a);
            random.nextBytes(b);
            if (Arrays.equals(a, b)) {
                throw new RuntimeException("Consecutive requests are equal");
            }
        }
    }

    private static void checkPlan(int cpus) {
        int buffers = buffers(cpus);
        int threads = threads(cpus);
        int perThread = TOTAL_REQUESTS / threads;
        if (buffers < 1 || buffers > 64 || Integer.bitCount(buffers) != 1
                || threads <= buffers
                || perThread < MIN_REQUESTS_PER_THREAD
                || (long) threads * perThread > TOTAL_REQUESTS) {
            throw new RuntimeException("Bad plan for " + cpus
                    + " processors: " + buffers + " buffers, " + threads
                    + " threads, " + perThread + " requests per thread");
        }
    }

    private static long key(byte[] b) {
        long k = 0;
        for (int i = 0; i < KEY_BYTES; i++) {
            k = (k << 8) | (b[i] & 0xff);
        }
        return k;
    }
}
