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

public class ExitAfterContendedInflationStress {
    static final int CONTENDERS = 2;
    static final long MAX_ITERATIONS = 20_000_000;

    // A plain field in the same eight bytes as a four-byte header, written
    // while the lock is held.
    static final class Holder {
        boolean inCall;
        Object a;
        Object b;
    }

    static volatile Holder slot;
    static volatile boolean stop;
    static volatile String failure;

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

    public static void main(String[] args) throws Exception {
        long seconds = Long.parseLong(args[0]);
        long deadline = System.nanoTime() + seconds * 1_000_000_000L;

        Thread[] contenders = new Thread[CONTENDERS];
        long[] entered = new long[CONTENDERS];
        for (int i = 0; i < CONTENDERS; i++) {
            final int id = i;
            contenders[i] = new Thread(() -> {
                Holder last = null;
                long n = 0;
                while (!stop) {
                    Holder o = slot;
                    if (o != null && o != last) {
                        last = o;
                        synchronized (o) {
                            if (o.inCall) {
                                failure = "Entered a monitor held by its owner";
                            }
                            n++;
                        }
                    } else {
                        Thread.onSpinWait();
                    }
                }
                entered[id] = n;
            });
            contenders[i].start();
        }

        // Vary how long the owner holds each fresh object, so that its exit
        // falls at different points of a contender's inflation.
        long iterations = 0;
        int seed = 0x9E3779B9;
        long sink = 0;
        while (iterations < MAX_ITERATIONS && failure == null && System.nanoTime() < deadline) {
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
        stop = true;
        long total = 0;
        for (int i = 0; i < CONTENDERS; i++) {
            contenders[i].join();
            total += entered[i];
        }
        if (failure != null) {
            throw new RuntimeException(failure);
        }
        System.out.println("iterations=" + iterations + " contended entries=" + total + " (" + sink + ")");
    }
}
