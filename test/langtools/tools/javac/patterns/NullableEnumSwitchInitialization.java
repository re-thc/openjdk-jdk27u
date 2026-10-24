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
 */

/*
 * @test
 * @summary Nullable enum maps can recover after construction and publish safely under concurrent linkage
 * @run main/othervm/timeout=60 -Xverify:all NullableEnumSwitchInitialization
 * @run main/othervm/timeout=60 -Xint NullableEnumSwitchInitialization
 */

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

public class NullableEnumSwitchInitialization {
    enum Constructing {
        A;
        Constructing() {
            // Enum constants may be switched on before the values array exists.
            // Whatever happens here, a later invocation must be able to succeed.
            try { recovering(this); }
            catch (Throwable expected) {}
        }
    }

    static int recovering(Constructing e) {
        return switch (e) { case null -> -1; case A -> 7; };
    }

    static final CountDownLatch started = new CountDownLatch(1);
    static Thread initializingWorker;
    static volatile Throwable initializationFailure;
    static volatile int initializedResult;

    enum ConcurrentConstruction {
        A;
        ConcurrentConstruction() {
            initializingWorker = new Thread(() -> {
                started.countDown();
                try { initializedResult = workerSelect(this); }
                catch (Throwable ex) { initializationFailure = ex; }
            });
            initializingWorker.setDaemon(true);
            initializingWorker.start();
            try {
                if (!started.await(10, TimeUnit.SECONDS)) throw new AssertionError("worker did not start");
                // Let the worker enter another switch site while this thread owns
                // the enum initialization lock. A shared map lock must not deadlock.
                long end = System.nanoTime() + TimeUnit.SECONDS.toNanos(10);
                boolean entered = false;
                while (!entered && initializingWorker.isAlive() && System.nanoTime() < end) {
                    for (StackTraceElement frame : initializingWorker.getStackTrace()) {
                        entered |= frame.getClassName().equals(NullableEnumSwitchInitialization.class.getName())
                                && frame.getMethodName().equals("workerSelect");
                    }
                    if (!entered) Thread.sleep(1);
                }
                if (!entered && initializingWorker.isAlive()) throw new AssertionError("worker did not enter switch");
                try { constructorSelect(this); }
                catch (Throwable expected) {}
            } catch (InterruptedException ex) {
                throw new AssertionError(ex);
            }
        }
    }

    static int workerSelect(ConcurrentConstruction e) {
        return switch (e) { case null -> -1; case A -> 7; };
    }
    static int constructorSelect(ConcurrentConstruction e) {
        return switch (e) { case null -> -1; case A -> 7; };
    }

    enum Parallel { A, B, C, D, OTHER }
    static int parallel(Parallel e) {
        return switch (e) {
            case null -> -1;
            case A -> 0;
            case B -> 1;
            case C -> 2;
            case D -> 3;
            default -> 4;
        };
    }

    public static void main(String... args) throws Exception {
        if (recovering(Constructing.A) != 7) throw new AssertionError("failed construction was cached");
        ConcurrentConstruction e = ConcurrentConstruction.A;
        initializingWorker.join(10_000);
        if (initializingWorker.isAlive()) throw new AssertionError("enum initialization deadlocked");
        if (initializationFailure != null) throw new AssertionError(initializationFailure);
        if (initializedResult != 7 || constructorSelect(e) != 7) throw new AssertionError("constructor retry");

        // First link the same switch concurrently. No thread may see a partly filled map.
        Parallel[] values = Parallel.values();
        Thread[] workers = new Thread[12];
        CountDownLatch ready = new CountDownLatch(workers.length);
        CountDownLatch start = new CountDownLatch(1);
        AtomicReference<Throwable> failure = new AtomicReference<>();
        for (int i = 0; i < workers.length; i++) {
            workers[i] = new Thread(() -> {
                ready.countDown();
                try {
                    if (!start.await(10, TimeUnit.SECONDS)) throw new AssertionError("start");
                    for (int repeat = 0; repeat < 2_000; repeat++) {
                        for (int v = 0; v < values.length; v++) {
                            if (parallel(values[v]) != v) throw new AssertionError("partly initialized map");
                        }
                        if (parallel(null) != -1) throw new AssertionError("null");
                    }
                } catch (Throwable ex) { failure.compareAndSet(null, ex); }
            });
            workers[i].setDaemon(true);
            workers[i].start();
        }
        if (!ready.await(10, TimeUnit.SECONDS)) throw new AssertionError("workers did not start");
        start.countDown();
        for (Thread worker : workers) {
            worker.join(10_000);
            if (worker.isAlive()) throw new AssertionError("parallel linkage deadlocked");
        }
        if (failure.get() != null) throw new AssertionError(failure.get());
    }
}
