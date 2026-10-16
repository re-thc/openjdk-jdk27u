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
 * @summary Test that starting the first virtual thread, submitting the first task to
 *     a virtual thread per task executor, and the first timed park, sleep and timed
 *     Object.wait don't bootstrap lambdas in the classes that implement virtual threads
 * @requires vm.continuations
 * @library /test/lib
 * @run main FirstUseNoLambdas
 */

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.locks.LockSupport;

import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class FirstUseNoLambdas {

    private static final String[] OWNERS = {
        "java.lang.VirtualThread",
        "java.lang.ThreadBuilders",
        "java.util.concurrent.ThreadPerTaskExecutor",
        "java.util.concurrent.FutureTask",
        "java.util.concurrent.ForkJoin",
        "java.util.concurrent.DelayScheduler",
        "jdk.internal.vm.",
        "jdk.internal.misc.CarrierThread",
    };

    public static void main(String[] args) throws Exception {
        if (args.length > 0) {
            run();
            return;
        }

        ProcessBuilder pb = ProcessTools.createTestJavaProcessBuilder(
                "-Xlog:class+load", "FirstUseNoLambdas", "run");
        OutputAnalyzer output = ProcessTools.executeProcess(pb);
        output.shouldHaveExitValue(0);
        output.shouldContain("done");

        boolean started = false;
        for (String line : output.asLines()) {
            if (!started) {
                started = line.contains("FirstUseNoLambdas ");
                continue;
            }
            // Archived lambda proxies do not require runtime linkage.
            if (line.contains("$$Lambda") && !line.contains("shared objects file")) {
                for (String owner : OWNERS) {
                    if (line.contains("] " + owner)) {
                        throw new RuntimeException("Lambda bootstrapped: " + line);
                    }
                }
            }
        }
    }

    private static void run() throws Exception {
        Thread.ofVirtual().start(new Task()).join();

        try (ExecutorService executor = Executors.newVirtualThreadPerTaskExecutor()) {
            executor.submit(new Task()).get();
        }

        Thread.ofVirtual().start(new TimedParkTask()).join();
        Thread.ofVirtual().start(new SleepTask()).join();
        Thread.ofVirtual().start(new TimedWaitTask()).join();

        System.out.println("done");
    }

    // Keep test callbacks from introducing lambda linkage.
    private static class Task implements Runnable {
        @Override
        public void run() { }
    }

    private static class TimedParkTask implements Runnable {
        @Override
        public void run() {
            LockSupport.parkNanos(1_000_000);
        }
    }

    private static class TimedWaitTask implements Runnable {
        @Override
        public void run() {
            Object lock = new Object();
            synchronized (lock) {
                try {
                    lock.wait(1);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }

    private static class SleepTask implements Runnable {
        @Override
        public void run() {
            try {
                Thread.sleep(1);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
