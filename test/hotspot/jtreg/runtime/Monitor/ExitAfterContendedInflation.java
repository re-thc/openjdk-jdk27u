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
 * @test id=c2-g1
 * @summary An owner that fast-locked an object finds the monitor another thread
 *          inflated, after GC movement, recursion, exceptions and deflation
 * @requires vm.compiler2.enabled & vm.gc.G1
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *                   -XX:GuaranteedAsyncDeflationInterval=1 -XX:PerMethodTrapLimit=0
 *                   -XX:+UseG1GC -XX:-BackgroundCompilation ExitAfterContendedInflation 4
 */

/*
 * @test id=c2-serial-eight-byte-headers
 * @requires vm.bits == "64" & vm.compiler2.enabled & vm.gc.Serial
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *                   -XX:GuaranteedAsyncDeflationInterval=1 -XX:PerMethodTrapLimit=0
 *                   -XX:+UseSerialGC -XX:-UseFourByteObjectHeaders -XX:-BackgroundCompilation
 *                   ExitAfterContendedInflation 4
 */

/*
 * @test id=c2-serial
 * @requires vm.compiler2.enabled & vm.gc.Serial
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *                   -XX:GuaranteedAsyncDeflationInterval=1 -XX:PerMethodTrapLimit=0
 *                   -XX:+UseSerialGC -XX:-BackgroundCompilation ExitAfterContendedInflation 4
 */

/*
 * @test id=c1-g1
 * @requires vm.compiler1.enabled & vm.gc.G1
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *                   -XX:GuaranteedAsyncDeflationInterval=1 -XX:PerMethodTrapLimit=0
 *                   -XX:+UseG1GC -XX:-BackgroundCompilation ExitAfterContendedInflation 1
 */

/*
 * @test id=int-g1
 * @requires vm.gc.G1
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *                   -XX:GuaranteedAsyncDeflationInterval=1
 *                   -XX:+UseG1GC -Xint ExitAfterContendedInflation 0
 */

import java.lang.reflect.Method;
import jdk.test.lib.Asserts;
import jdk.test.whitebox.WhiteBox;

public class ExitAfterContendedInflation {
    static final WhiteBox WB = WhiteBox.getWhiteBox();

    static final int RECURSIVE = 1;
    static final int EXCEPTION = 2;
    static final int MOVE = 4;
    static final int HASH_FIRST = 8;
    static final int MOVE_FIRST = 16;
    static final int ALL = 32;

    static final long WAIT_NANOS = 60_000_000_000L;

    // A plain field in the same eight bytes as a four-byte header, written
    // while the lock is held, like the Memoizer field of the original failure.
    static final class Holder {
        boolean inCall;
        Object a;
        Object b;
    }

    static volatile Holder target;
    static volatile long requests;
    static volatile boolean done;
    static volatile long entries;
    static volatile String failure;

    static void awaitInflatedAndBlocked(Holder o, Thread contender) {
        target = o;
        requests++;
        long deadline = System.nanoTime() + WAIT_NANOS;
        while (!(WB.isMonitorInflated(o) && contender.getState() == Thread.State.BLOCKED)) {
            if (failure != null || System.nanoTime() > deadline) {
                throw new RuntimeException("Contender did not inflate the monitor: " + contender.getState());
            }
            Thread.onSpinWait();
        }
    }

    static void inner(Holder o, int flags, Thread contender) {
        synchronized (o) {
            o.inCall = true;
            awaitInflatedAndBlocked(o, contender);
            if ((flags & MOVE) != 0) {
                WB.youngGC();
            }
            o.inCall = false;
            if ((flags & EXCEPTION) != 0) {
                throw new IllegalStateException("expected");
            }
        }
    }

    // The exit of this region must find the monitor that the contender
    // inserted into the monitor table while this thread held a fast lock.
    static void owner(Holder o, int flags, Thread contender) {
        synchronized (o) {
            if ((flags & RECURSIVE) != 0) {
                try {
                    inner(o, flags, contender);
                } catch (IllegalStateException e) {
                    // expected
                }
                Asserts.assertTrue(Thread.holdsLock(o), "outer lock must still be held");
            } else {
                o.inCall = true;
                awaitInflatedAndBlocked(o, contender);
                if ((flags & MOVE) != 0) {
                    WB.youngGC();
                }
                o.inCall = false;
                if ((flags & EXCEPTION) != 0) {
                    throw new IllegalStateException("expected");
                }
            }
        }
    }

    static void runOwner(Holder o, int flags, Thread contender) {
        try {
            owner(o, flags, contender);
        } catch (IllegalStateException e) {
            if ((flags & EXCEPTION) == 0 || (flags & RECURSIVE) != 0) {
                throw e;
            }
        }
    }

    // Compiles m at level (0 keeps it interpreted) unless it already is.
    static void compile(Method m, int level) {
        if (level == 0 || WB.getMethodCompilationLevel(m) == level) {
            return;
        }
        Asserts.assertTrue(WB.enqueueMethodForCompilation(m, level), "Could not enqueue " + m);
        Asserts.assertEQ(WB.getMethodCompilationLevel(m), level, "Unexpected compilation level for " + m);
    }

    public static void main(String[] args) throws Exception {
        int level = Integer.parseInt(args[0]);
        Class<?> c = ExitAfterContendedInflation.class;
        Method owner = c.getDeclaredMethod("owner", Holder.class, int.class, Thread.class);
        Method inner = c.getDeclaredMethod("inner", Holder.class, int.class, Thread.class);
        // Load the classes used on the exceptional paths before compiling.
        new IllegalStateException().fillInStackTrace();
        new Holder();

        Thread contender = new Thread(() -> {
            long served = 0;
            while (!done) {
                if (requests != served) {
                    served = requests;
                    Holder o = target;
                    synchronized (o) {
                        if (o.inCall) {
                            failure = "Entered while the owner held the lock";
                        }
                        entries++;
                    }
                } else {
                    Thread.onSpinWait();
                }
            }
        }, "contender");
        contender.start();

        long expected = 0;
        for (int flags = 0; flags < ALL; flags++) {
            Holder o = new Holder();
            int hash = 0;
            if ((flags & HASH_FIRST) != 0) {
                hash = System.identityHashCode(o);
            }
            if ((flags & MOVE_FIRST) != 0) {
                // Move the object before it is locked, so that inflation uses the
                // hash preserved by GC rather than the current address.
                WB.youngGC();
            }
            for (int round = 0; round < 3; round++) {
                Asserts.assertFalse(WB.isMonitorInflated(o), "flags=" + flags + " round=" + round);
                compile(inner, level);
                compile(owner, level);
                runOwner(o, flags, contender);
                expected++;
                long deadline = System.nanoTime() + WAIT_NANOS;
                while (entries != expected) {
                    if (failure != null || System.nanoTime() > deadline) {
                        throw new RuntimeException("Contender did not enter: flags=" + flags + " " + failure);
                    }
                    Thread.onSpinWait();
                }
                Asserts.assertNull(failure, "flags=" + flags);
                if ((flags & HASH_FIRST) != 0) {
                    Asserts.assertEQ(System.identityHashCode(o), hash, "Changed identity hash, flags=" + flags);
                }
                // Wait for deflation, so that the next inflation of the same
                // object inserts a new monitor under the same hash.
                long deflationDeadline = System.nanoTime() + WAIT_NANOS;
                while (WB.isMonitorInflated(o)) {
                    if (System.nanoTime() > deflationDeadline) {
                        throw new RuntimeException("Monitor was not deflated: flags=" + flags);
                    }
                    Thread.onSpinWait();
                }
            }
        }
        done = true;
        contender.join();
        Asserts.assertEQ(entries, expected);
        Asserts.assertNull(failure);
        System.out.println("Verified " + expected + " exits after contended inflation");
    }
}
