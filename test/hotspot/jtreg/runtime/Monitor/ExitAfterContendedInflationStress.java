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
 * @test id=default
 * @summary Owners exit monitors that contending threads inflated just before
 * @run main/othervm -Xmx256m ExitAfterContendedInflationStress 10
 */

/*
 * @test id=c1
 * @requires vm.compiler1.enabled
 * @run main/othervm -Xmx256m -XX:TieredStopAtLevel=1 ExitAfterContendedInflationStress 10
 */

/*
 * @test id=c2
 * @requires vm.compiler2.enabled
 * @run main/othervm -Xmx256m -XX:-TieredCompilation ExitAfterContendedInflationStress 10
 */

/*
 * @test id=deflation
 * @run main/othervm -Xmx256m -XX:+UnlockDiagnosticVMOptions -XX:GuaranteedAsyncDeflationInterval=10
 *                   ExitAfterContendedInflationStress 10
 */

/*
 * @test id=eight-byte-headers
 * @requires vm.bits == "64"
 * @run main/othervm -Xmx256m -XX:-UseFourByteObjectHeaders ExitAfterContendedInflationStress 10
 */

import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

public class ExitAfterContendedInflationStress {
    static final int CONTENDERS = 2;
    static final long MAX_ITERATIONS = 20_000_000;
    static final long JOIN_NANOS = TimeUnit.SECONDS.toNanos(60);

    // A plain field in the same eight bytes as a four-byte header, written
    // while the lock is held.
    static final class Holder {
        boolean inCall;
        Object a;
        Object b;
    }

    static volatile Holder slot;
    static volatile boolean stop;
    static final AtomicReference<Throwable> contenderFailure = new AtomicReference<>();

    static int spin(int n) {
        int x = 0;
        for (int i = 0; i < n; i++) {
            Thread.onSpinWait();
            x += i;
        }
        return x;
    }

    static int hold(Holder o, int n, boolean recursive, boolean exceptional) {
        int x = 0;
        synchronized (o) {
            o.inCall = true;
            slot = o;
            if (recursive) {
                try {
                    x += nested(o, n, exceptional);
                } catch (IllegalStateException e) {
                    // expected
                }
            } else {
                x += spin(n);
            }
            o.inCall = false;
        }
        return x;
    }

    static int nested(Holder o, int n, boolean exceptional) {
        synchronized (o) {
            int x = spin(n);
            if (exceptional) {
                throw new IllegalStateException();
            }
            return x;
        }
    }

    static void contend(long[] entered, int id) {
        try {
            Holder last = null;
            long n = 0;
            while (!stop) {
                Holder o = slot;
                if (o != null && o != last) {
                    last = o;
                    synchronized (o) {
                        if (o.inCall) {
                            throw new RuntimeException("Entered a monitor held by its owner");
                        }
                        n++;
                    }
                } else {
                    Thread.onSpinWait();
                }
            }
            entered[id] = n;
        } catch (Throwable t) {
            contenderFailure.compareAndSet(null, t);
        }
    }

    // Preserve an owner exception if contender teardown also fails.
    static void stopContenders(Thread[] contenders, Throwable inFlight) throws InterruptedException {
        stop = true;
        long deadline = System.nanoTime() + JOIN_NANOS;
        StringBuilder alive = new StringBuilder();
        for (Thread t : contenders) {
            if (t == null) {
                continue;
            }
            long remaining = TimeUnit.NANOSECONDS.toMillis(deadline - System.nanoTime());
            t.join(Math.max(1, remaining));
            if (t.isAlive()) {
                alive.append(' ').append(t.getName()).append('(').append(t.getState()).append(')');
            }
        }
        if (alive.length() > 0) {
            RuntimeException e = new RuntimeException("Contenders did not stop:" + alive);
            if (inFlight == null) {
                throw e;
            }
            inFlight.addSuppressed(e);
        }
    }

    public static void main(String[] args) throws Exception {
        long seconds = Long.parseLong(args[0]);
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(seconds);

        Thread[] contenders = new Thread[CONTENDERS];
        long[] entered = new long[CONTENDERS];
        long iterations = 0;
        long sink = 0;
        Throwable inFlight = null;
        try {
            for (int i = 0; i < CONTENDERS; i++) {
                final int id = i;
                contenders[i] = new Thread(() -> contend(entered, id), "contender-" + i);
                contenders[i].setDaemon(true);
                contenders[i].start();
            }

            // Vary how long the owner holds each fresh object, so that its exit
            // falls at different points of a contender's inflation.
            int seed = 0x9E3779B9;
            while (iterations < MAX_ITERATIONS && contenderFailure.get() == null && System.nanoTime() < deadline) {
                for (int k = 0; k < 1000; k++) {
                    seed ^= seed << 13;
                    seed ^= seed >>> 17;
                    seed ^= seed << 5;
                    int mode = seed & 3;
                    sink += hold(new Holder(), (seed >>> 20) & 0x3ff, mode != 0, mode == 2);
                    slot = null;
                }
                iterations += 1000;
            }
        } catch (Throwable t) {
            inFlight = t;
            throw t;
        } finally {
            stopContenders(contenders, inFlight);
        }

        Throwable failure = contenderFailure.get();
        if (failure != null) {
            throw new RuntimeException("Contender failed", failure);
        }
        long total = 0;
        for (long n : entered) {
            total += n;
        }
        // Reject runs where contenders never acquire a published object.
        if (iterations == 0 || total == 0) {
            throw new RuntimeException("No contended work: iterations=" + iterations + " contended entries=" + total);
        }
        System.out.println("iterations=" + iterations + " contended entries=" + total + " (" + sink + ")");
    }
}
