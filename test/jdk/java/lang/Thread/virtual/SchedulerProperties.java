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
 * @summary Test that the jdk.virtualThreadScheduler.* system properties are read when
 *     the first virtual thread is created, and that an invalid value fails then
 * @requires vm.continuations
 * @library /test/lib
 * @run main SchedulerProperties
 */

import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class SchedulerProperties {

    public static void main(String[] args) throws Exception {
        if (args.length > 0) {
            run();
            return;
        }

        // valid values
        test("ok", "-Djdk.virtualThreadScheduler.parallelism=1",
                   "-Djdk.virtualThreadScheduler.maxPoolSize=2",
                   "-Djdk.virtualThreadScheduler.minRunnable=1");

        // invalid values fail when the first virtual thread is created
        test("java.lang.NumberFormatException", "-Djdk.virtualThreadScheduler.parallelism=abc");
        test("java.lang.NumberFormatException", "-Djdk.virtualThreadScheduler.maxPoolSize=abc");
        test("java.lang.NumberFormatException", "-Djdk.virtualThreadScheduler.minRunnable=abc");
        test("java.lang.IllegalArgumentException", "-Djdk.virtualThreadScheduler.parallelism=0");
        test("java.lang.IllegalArgumentException", "-Djdk.virtualThreadScheduler.maxPoolSize=0");
    }

    /**
     * Runs "SchedulerProperties run" with the given options, expecting it to exit
     * normally with the given string in the output.
     */
    private static void test(String expectedOutput, String... options)
            throws Exception {
        String[] command = new String[options.length + 2];
        System.arraycopy(options, 0, command, 0, options.length);
        command[options.length] = "SchedulerProperties";
        command[options.length + 1] = "run";
        ProcessBuilder pb = ProcessTools.createTestJavaProcessBuilder(command);
        OutputAnalyzer output = ProcessTools.executeProcess(pb);
        output.shouldHaveExitValue(0);
        output.shouldContain(expectedOutput);
    }

    private static void run() throws Exception {
        // a platform thread can be started, no scheduler is needed
        Thread thread = new Thread(new Task());
        thread.start();
        thread.join();

        // the properties are read here
        try {
            Thread.ofVirtual().start(new Task()).join();
            System.out.println("ok");
        } catch (Throwable e) {
            System.out.println(e + ", cause " + e.getCause());
        }
    }

    private static class Task implements Runnable {
        @Override
        public void run() { }
    }
}
