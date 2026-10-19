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
 * @summary Verify serial native integer sorting across deoptimization and GC
 * @library /test/lib
 * @build NativePrimitiveSort jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -Xmx512m NativePrimitiveSortDeoptimization
 */

import java.util.Arrays;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.atomic.AtomicInteger;
import jdk.test.whitebox.WhiteBox;

public class NativePrimitiveSortDeoptimization {
    public static void main(String[] args) throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        CountDownLatch start = new CountDownLatch(1);
        CountDownLatch ready = new CountDownLatch(2);
        AtomicInteger active = new AtomicInteger();
        AtomicReference<Throwable> failure = new AtomicReference<>();
        Thread[] workers = new Thread[2];
        for (int worker = 0; worker < 2; worker++) {
            int width = worker == 0 ? 4 : 8;
            workers[worker] = new Thread(() -> {
                try {
                    int size = 1 << 20, low = 17;
                    long[] source = new long[size + low + 19];
                    long state = 20261019;
                    for (int i = 0; i < source.length; i++) {
                        state ^= state << 13; state ^= state >>> 7; state ^= state << 17;
                        source[i] = width == 4 ? (int) state : state;
                    }
                    long[] expected = NativePrimitiveSort.oracle(source, low, size, width);
                    ready.countDown();
                    start.await();
                    for (int iteration = 0; iteration < 30; iteration++) {
                        if (width == 8) {
                            long[] actual = source.clone();
                            active.incrementAndGet();
                            try { Arrays.sort(actual, low, low + size); }
                            finally { active.decrementAndGet(); }
                            if (!Arrays.equals(actual, expected)) throw new AssertionError("long output");
                        } else {
                            int[] actual = new int[source.length];
                            for (int i = 0; i < actual.length; i++) actual[i] = (int) source[i];
                            active.incrementAndGet();
                            try { Arrays.sort(actual, low, low + size); }
                            finally { active.decrementAndGet(); }
                            for (int i = 0; i < actual.length; i++) if (actual[i] != expected[i]) throw new AssertionError("int output");
                        }
                    }
                } catch (Throwable problem) {
                    failure.compareAndSet(null, problem);
                    ready.countDown();
                }
            });
            workers[worker].start();
        }
        ready.await();
        start.countDown();
        for (int iteration = 0; iteration < 30; iteration++) {
            while (active.get() == 0 && (workers[0].isAlive() || workers[1].isAlive())) {
                Thread.yield();
            }
            wb.deoptimizeAll();
            System.gc();
            Thread.yield();
        }
        for (Thread worker : workers) worker.join();
        if (failure.get() != null) throw new AssertionError(failure.get());
        System.out.println("PASS 60 complete-output/guard sorts across deoptimization and GC");
    }
}
