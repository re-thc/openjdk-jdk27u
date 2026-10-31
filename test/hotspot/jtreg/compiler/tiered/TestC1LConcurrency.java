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
 * @summary Concurrent C1L compilation with allocation, arraycopy and GC
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & vm.gc.G1
 * @run main/othervm
 *      -XX:CICompilerCount=6 -XX:-UseDynamicNumberOfCompilerThreads -XX:+UseG1GC -Xmx64m
 *      -XX:CompileCommand=dontinline,compiler.tiered.TestC1LConcurrency::target*
 *      compiler.tiered.TestC1LConcurrency
 */
package compiler.tiered;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;

public class TestC1LConcurrency {
    static int target0(int[] a, int i) { return a[i & 255] + i; }
    static int target1(int[] a, int i) { return a[i & 255] ^ i; }
    static int target2(int[] a, int i) {
        int[] copy = new int[256];
        System.arraycopy(a, 0, copy, 0, a.length);
        return copy[i & 255] - i;
    }
    static int target3(int[] a, int i) {
        synchronized (a) {
            try { return a[i]; }
            catch (ArrayIndexOutOfBoundsException e) { return -1; }
        }
    }

    public static void main(String[] args) throws Exception {
        CountDownLatch start = new CountDownLatch(1);
        AtomicReference<Throwable> failure = new AtomicReference<>();
        Thread[] threads = new Thread[4];
        for (int t = 0; t < threads.length; t++) {
            threads[t] = new Thread(() -> {
                try {
                    int[] a = new int[256];
                    for (int i = 0; i < a.length; i++) a[i] = i * 3;
                    start.await();
                    for (int i = 0; i < 20_000; i++) {
                        int value = (i & 255) * 3;
                        if (target0(a, i) != value + i || target1(a, i) != (value ^ i) ||
                            target2(a, i) != value - i || target3(a, i & 511) !=
                            ((i & 511) < 256 ? value : -1)) {
                            throw new AssertionError("result at " + i);
                        }
                        if ((i & 4095) == 0) System.gc();
                    }
                } catch (Throwable e) {
                    failure.compareAndSet(null, e);
                }
            });
            threads[t].start();
        }
        start.countDown();
        for (Thread thread : threads) thread.join();
        if (failure.get() != null) throw new AssertionError(failure.get());
    }
}
