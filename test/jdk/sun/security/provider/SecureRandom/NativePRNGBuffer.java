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
import java.util.HexFormat;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

public class NativePRNGBuffer {

    // more threads than buffers, so that threads share them
    private static final int THREADS = 2 * Runtime.getRuntime().availableProcessors() + 2;
    private static final int REQUESTS = 20_000;
    // sizes below, at and above the largest buffered request
    private static final int[] SIZES = { 1, 7, 16, 63, 64, 65, 300 };

    public static void main(String[] args) throws Exception {
        SecureRandom random = SecureRandom.getInstance(args[0]);
        Set<String> seen = ConcurrentHashMap.newKeySet();
        List<Thread> threads = new ArrayList<>();
        List<Throwable> failures = new ArrayList<>();
        for (int t = 0; t < THREADS; t++) {
            int first = t;
            Thread thread = new Thread(() -> {
                for (int i = 0; i < REQUESTS; i++) {
                    byte[] b = new byte[SIZES[(first + i) % SIZES.length]];
                    random.nextBytes(b);
                    // Bytes handed out twice would repeat a value. Values of
                    // 7 bytes or more repeat by chance with a negligible
                    // probability, so they are checked.
                    if (b.length >= 7
                            && !seen.add(HexFormat.of().formatHex(b))) {
                        throw new RuntimeException("Repeated bytes: "
                                + HexFormat.of().formatHex(b));
                    }
                }
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

        // Consecutive small requests of one thread get different bytes.
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
}
