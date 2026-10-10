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
 * @summary C2 monitor-table lookup handles expanded hashes, collisions and special layouts
 * @requires vm.bits == "64" & (os.arch == "amd64" | os.arch == "aarch64")
 * @requires vm.compiler2.enabled & vm.gc.Serial & vm.gc.G1 & vm.gc.Z
 * @library /test/lib
 * @modules java.base/jdk.internal.misc
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseSerialGC
 *      -XX:GuaranteedAsyncDeflationInterval=0 -XX:AsyncDeflationInterval=0 -XX:MonitorUsedDeflationThreshold=0
 *      -XX:-TieredCompilation -Xbatch -XX:CompileThreshold=1000
 *      -XX:CompileCommand=dontinline,FourByteHeaderMonitorLookup::* FourByteHeaderMonitorLookup
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseSerialGC -XX:-UseFourByteObjectHeaders
 *      -XX:GuaranteedAsyncDeflationInterval=0 -XX:AsyncDeflationInterval=0 -XX:MonitorUsedDeflationThreshold=0
 *      -XX:-TieredCompilation -Xbatch -XX:CompileThreshold=1000
 *      -XX:CompileCommand=dontinline,FourByteHeaderMonitorLookup::* FourByteHeaderMonitorLookup
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseG1GC
 *      -XX:GuaranteedAsyncDeflationInterval=0 -XX:AsyncDeflationInterval=0 -XX:MonitorUsedDeflationThreshold=0
 *      -XX:-TieredCompilation -Xbatch -XX:CompileThreshold=1000
 *      -XX:CompileCommand=dontinline,FourByteHeaderMonitorLookup::* FourByteHeaderMonitorLookup
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseG1GC -XX:-UseFourByteObjectHeaders
 *      -XX:GuaranteedAsyncDeflationInterval=0 -XX:AsyncDeflationInterval=0 -XX:MonitorUsedDeflationThreshold=0
 *      -XX:-TieredCompilation -Xbatch -XX:CompileThreshold=1000
 *      -XX:CompileCommand=dontinline,FourByteHeaderMonitorLookup::* FourByteHeaderMonitorLookup
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseZGC
 *      -XX:GuaranteedAsyncDeflationInterval=0 -XX:AsyncDeflationInterval=0 -XX:MonitorUsedDeflationThreshold=0
 *      -XX:-TieredCompilation -Xbatch -XX:CompileThreshold=1000
 *      -XX:CompileCommand=dontinline,FourByteHeaderMonitorLookup::* FourByteHeaderMonitorLookup
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseZGC -XX:-UseFourByteObjectHeaders
 *      -XX:GuaranteedAsyncDeflationInterval=0 -XX:AsyncDeflationInterval=0 -XX:MonitorUsedDeflationThreshold=0
 *      -XX:-TieredCompilation -Xbatch -XX:CompileThreshold=1000
 *      -XX:CompileCommand=dontinline,FourByteHeaderMonitorLookup::* FourByteHeaderMonitorLookup
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+UseSerialGC
 *      -XX:+UnlockExperimentalVMOptions -XX:hashCode=2
 *      -XX:GuaranteedAsyncDeflationInterval=0 -XX:AsyncDeflationInterval=0 -XX:MonitorUsedDeflationThreshold=0
 *      -XX:-TieredCompilation -Xbatch -XX:CompileThreshold=1000
 *      -XX:CompileCommand=dontinline,FourByteHeaderMonitorLookup::* FourByteHeaderMonitorLookup
 */

import java.lang.ref.WeakReference;
import jdk.internal.misc.Unsafe;
import jdk.test.lib.Asserts;
import jdk.test.whitebox.WhiteBox;

public class FourByteHeaderMonitorLookup {
    static final WhiteBox WB = WhiteBox.getWhiteBox();
    static final Unsafe UNSAFE = Unsafe.getUnsafe();
    static final int ROUNDS = 20_000;
    static final int[] COUNTERS = new int[16];

    static final class Lock {
        int value = 123;
    }

    static void increment(Object lock, int index) {
        synchronized (lock) {
            // Exercise recursive acquisition and visibility using the same
            // compiled site for more monitors than the two-entry OM cache.
            recursiveIncrement(lock, index);
        }
    }

    static void recursiveIncrement(Object lock, int index) {
        synchronized (lock) {
            COUNTERS[index]++;
        }
    }

    static void inflate(Object lock) throws InterruptedException {
        synchronized (lock) {
            lock.wait(1);
        }
        Asserts.assertTrue(WB.isMonitorInflated(lock), "Expected an inflated monitor");
    }

    public static void main(String[] args) throws Exception {
        Object[] locks = new Object[16];
        for (int i = 0; i < 12; i++) {
            locks[i] = new Lock();
        }
        locks[12] = new int[31];
        locks[13] = new Object[17];
        locks[14] = new WeakReference<>(locks[0]);
        locks[15] = FourByteHeaderMonitorLookup.class;
        int[] hashes = new int[locks.length];
        for (int i = 0; i < locks.length; i++) {
            hashes[i] = System.identityHashCode(locks[i]);
        }
        System.gc();
        boolean four = Boolean.TRUE.equals(WB.getBooleanVMFlag("UseFourByteObjectHeaders"));
        if (four) {
            for (int i = 0; i < 12; i++) {
                Asserts.assertEQ(UNSAFE.getInt(locks[i], 0) & (3 << 11), 3 << 11,
                                 "Instance hash must be expanded after movement");
            }
            // Zero is valid for the address-derived scheme. Install it in an
            // expanded slot before the first monitor is created for the object.
            Asserts.assertEQ(UNSAFE.objectFieldOffset(Lock.class.getDeclaredField("value")), 4L);
            UNSAFE.putInt(locks[0], 8, 0);
            hashes[0] = 0;
        }
        for (Object lock : locks) {
            inflate(lock);
        }
        // Keep one newly inflated instance in the address-derived hash state.
        locks[11] = new Lock();
        hashes[11] = System.identityHashCode(locks[11]);
        inflate(locks[11]);
        Runnable work = () -> {
            for (int round = 0; round < ROUNDS; round++) {
                for (int i = 0; i < locks.length; i++) {
                    increment(locks[i], i);
                }
            }
        };
        Thread first = new Thread(work);
        Thread second = new Thread(work);
        first.start();
        second.start();
        first.join();
        second.join();
        Asserts.assertEQ(WB.getMethodCompilationLevel(FourByteHeaderMonitorLookup.class
                                 .getDeclaredMethod("increment", Object.class, int.class)),
                         4, "Monitor entry must execute compiled C2 code");
        for (int i = 0; i < locks.length; i++) {
            Asserts.assertEQ(COUNTERS[i], ROUNDS * 2, "Lost update for monitor " + i);
            Asserts.assertEQ(System.identityHashCode(locks[i]), hashes[i], "Changed identity hash");
            if (locks[i] instanceof Lock target) {
                Asserts.assertEQ(target.value, 123);
            }
        }
    }
}
