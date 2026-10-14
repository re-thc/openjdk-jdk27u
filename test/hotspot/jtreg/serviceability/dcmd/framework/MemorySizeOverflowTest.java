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
 * @summary Reject overflowing memory sizes in diagnostic commands and JFR startup options
 * @requires vm.hasJFR & vm.compiler2.enabled
 * @modules java.management jdk.jfr
 * @library /test/lib
 * @run main/othervm MemorySizeOverflowTest
 */

import javax.management.RuntimeMBeanException;

import jdk.test.lib.Asserts;
import jdk.test.lib.dcmd.JMXExecutor;
import jdk.test.lib.process.ProcessTools;

public class MemorySizeOverflowTest {
    private static final String ERROR = "Parsing error memory size value: value is too large";
    private static final String[] JFR_OPTIONS = {
        "globalbuffersize", "thread_buffer_size", "memorysize", "maxchunksize"
    };

    private static void rejectJmx(JMXExecutor executor, String command) throws Exception {
        try {
            executor.execute(command);
        } catch (RuntimeMBeanException e) {
            Asserts.assertTrue(e.getCause() instanceof IllegalArgumentException, "Unexpected cause for " + command);
            Asserts.assertTrue(e.getCause().getMessage().contains(ERROR), "Unexpected error for " + command + ": " + e.getCause());
            return;
        }
        throw new AssertionError("Accepted overflowing memory size: " + command);
    }

    public static void main(String[] args) throws Exception {
        JMXExecutor executor = new JMXExecutor();
        for (String size : new String[] {"18014398509481984k", "17592186044416M", "17179869184g"}) {
            rejectJmx(executor, "Compiler.memory minsize=" + size);
            for (String option : JFR_OPTIONS) {
                rejectJmx(executor, "JFR.configure " + option + "=" + size);
                String startupOption = option.equals("thread_buffer_size") ? "threadbuffersize" : option;
                ProcessTools.executeTestJava("-XX:FlightRecorderOptions=" + startupOption + "=" + size, "-version")
                    .shouldNotHaveExitValue(0).shouldContain(ERROR);
            }
        }
        executor.execute("Compiler.memory minsize=1k").shouldNotContain(ERROR);
        executor.execute("JFR.configure").shouldNotContain(ERROR);
    }
}
