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
 * @summary Verify simultaneous native long sorts, GC, deoptimization and native-decline cleanup
 * @requires (os.family == "linux" & os.arch == "amd64") & vm.jvmti & !vm.asan
 * @library /test/lib
 * @build NativePrimitiveSort NativePrimitiveSortSupport jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm/native --enable-native-access=ALL-UNNAMED NativePrimitiveSortDeoptimization
 */

import java.util.Arrays;
import java.lang.management.ManagementFactory;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.atomic.AtomicReferenceArray;
import jdk.test.whitebox.WhiteBox;

public class NativePrimitiveSortDeoptimization {
    public static void main(String[] args) throws Exception {
        if (args.length == 0) {
            if (!NativePrimitiveSortSupport.supportedBuild()) return;
            NativePrimitiveSortSupport.child("NativePrimitiveSortDeoptimization", "-Xbootclasspath/a:.",
                    "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI", "-Xbatch",
                    "-Djdk.util.Arrays.disableNativeSort=false", "-XX:-DisableExplicitGC");
            return;
        }
        NativePrimitiveSortSupport.load();
        int n = 1 << 20, low = 17;
        long[] warm = NativePrimitiveSortSupport.input(low, n, 57, false);
        Arrays.sort(warm, low, low + n);
        long[] initial = NativePrimitiveSortSupport.stats();
        if (initial[0] == 0) throw new AssertionError("Native backend never activated");
        long retained = initial[3];
        for (int mode = 0; mode < 4; mode++) run(mode, retained);
    }
    static void run(int mode, long retained) throws Exception {
        // The small phase is not humongous with ordinary G1 region sizes;
        // it lets a moving collector relocate the array between JNI regions.
        int n = mode == 3 ? 32769 : 1 << 20, low = 17;
        AtomicReferenceArray<long[]> arrays = new AtomicReferenceArray<>(2);
        CountDownLatch ready = new CountDownLatch(2), start = new CountDownLatch(1);
        AtomicReference<Throwable> failure = new AtomicReference<>();
        Thread[] workers = new Thread[2];
        NativePrimitiveSortSupport.arm(mode);
        for (int worker = 0; worker < 2; worker++) {
            final int id = worker;
            workers[id] = new Thread(() -> {
                try {
                    long[] source = NativePrimitiveSortSupport.input(low, n, 20261019 + id, id == 0);
                    long[] expected = NativePrimitiveSort.oracle(source, low, n, 8);
                    ready.countDown(); start.await();
                    for (int iteration = 0; iteration < (mode == 0 ? 20 : mode == 3 ? 4 : 1); iteration++) {
                        long[] actual = source.clone(); arrays.set(id, actual);
                        Arrays.sort(actual, low, low + n);
                        NativePrimitiveSortSupport.check(actual, expected);
                    }
                } catch (Throwable problem) {
                    failure.compareAndSet(null, problem); ready.countDown();
                }
            }, "native-long-" + id);
            workers[id].start();
        }
        ready.await(); start.countDown();
        try {
            if (mode != 1) {
                long deadline = System.nanoTime() + 20_000_000_000L;
                while (NativePrimitiveSortSupport.stats()[7] != 2 && failure.get() == null) {
                    if (System.nanoTime() > deadline) throw new AssertionError("Two native long calls did not overlap");
                    Thread.sleep(1);
                }
                if (failure.get() != null) throw new AssertionError(failure.get());
                long[] held = NativePrimitiveSortSupport.stats();
                if (held[1] != 2 || held[3] < retained + 2L * n * Long.BYTES) {
                    throw new AssertionError("Two real native buffers were not simultaneously owned: " + Arrays.toString(held));
                }
                // Both threads are inside original C++ calls, after their first
                // copied region, with Java handles live and private buffers owned.
                WhiteBox wb = WhiteBox.getWhiteBox();
                long before0 = wb.getObjectAddress(arrays.get(0));
                long before1 = wb.getObjectAddress(arrays.get(1));
                long collections = collections();
                for (int i = 0; i < 3; i++) { wb.deoptimizeAll(); System.gc(); }
                if (collections() <= collections) throw new AssertionError("No GC occurred during native overlap");
                boolean moved = before0 != wb.getObjectAddress(arrays.get(0))
                        || before1 != wb.getObjectAddress(arrays.get(1));
                System.out.println("GC during two native calls, relocation observed=" + moved);
                System.out.println("Observed simultaneous original native calls " + Arrays.toString(held));
            }
        } finally {
            NativePrimitiveSortSupport.release();
            for (Thread worker : workers) worker.join();
        }
        if (failure.get() != null) throw new AssertionError(failure.get());
        long[] stats = NativePrimitiveSortSupport.stats();
        if (stats[0] < 2 || stats[1] != 0 || stats[3] != retained) throw new AssertionError("Native cleanup: " + Arrays.toString(stats));
        if (mode != 1 && stats[2] != 2) throw new AssertionError("Native calls were serialized");
        if (mode == 1 && stats[5] != 2) throw new AssertionError("Malloc declines not exercised");
        if (mode == 2 && stats[6] != 2) throw new AssertionError("Post-allocation declines not exercised");
        System.out.println("PASS simultaneous long/GC/deopt/failure mode=" + mode + " " + Arrays.toString(stats));
    }
    static long collections() {
        return ManagementFactory.getGarbageCollectorMXBeans().stream()
                .mapToLong(bean -> Math.max(0, bean.getCollectionCount())).sum();
    }
}
