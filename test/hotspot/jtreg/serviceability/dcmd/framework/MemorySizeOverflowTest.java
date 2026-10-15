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
 * @summary Reject overflowing memory sizes in diagnostic commands and JFR startup options,
 *          and accept the largest representable size
 * @requires vm.hasJFR & vm.compiler2.enabled
 * @modules java.management jdk.jfr
 * @library /test/lib
 * @run main/othervm MemorySizeOverflowTest
 */

import java.math.BigInteger;

import javax.management.RuntimeMBeanException;

import jdk.test.lib.Asserts;
import jdk.test.lib.dcmd.JMXExecutor;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class MemorySizeOverflowTest {
    private static final String ERROR = "Parsing error memory size value: value is too large";
    private static final String[] JFR_OPTIONS = {
        "globalbuffersize", "thread_buffer_size", "memorysize", "maxchunksize"
    };
    private static final String[] UNITS = {"", "b", "B", "k", "K", "m", "M", "g", "G"};
    private static final BigInteger MAX = BigInteger.ONE.shiftLeft(64).subtract(BigInteger.ONE);

    private static String startupOption(String option) {
        return option.equals("thread_buffer_size") ? "threadbuffersize" : option;
    }

    private static BigInteger multiplier(String unit) {
        return switch (unit) {
            case "k", "K" -> BigInteger.ONE.shiftLeft(10);
            case "m", "M" -> BigInteger.ONE.shiftLeft(20);
            case "g", "G" -> BigInteger.ONE.shiftLeft(30);
            default -> BigInteger.ONE;
        };
    }

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

    private static void acceptJmx(JMXExecutor executor, String command) throws Exception {
        try {
            executor.execute(command).shouldNotContain(ERROR);
        } catch (RuntimeMBeanException e) {
            throw new AssertionError("Rejected a representable memory size: " + command, e);
        }
    }

    private static void rejectOverflow(JMXExecutor executor, String size, boolean startup) throws Exception {
        rejectJmx(executor, "Compiler.memory minsize=" + size);
        for (String option : JFR_OPTIONS) {
            rejectJmx(executor, "JFR.configure " + option + "=" + size);
            if (startup) {
                ProcessTools.executeTestJava("-XX:FlightRecorderOptions=" + startupOption(option) + "=" + size, "-version")
                    .shouldNotHaveExitValue(0).shouldContain(ERROR);
            }
        }
    }

    // Compiler.memory only uses minsize as a report filter, so every representable value is safe to pass.
    private static void testCompilerMemoryBoundaries(JMXExecutor executor) throws Exception {
        for (String unit : UNITS) {
            BigInteger limit = MAX.divide(multiplier(unit));
            acceptJmx(executor, "Compiler.memory minsize=" + limit + unit);
            rejectJmx(executor, "Compiler.memory minsize=" + limit.add(BigInteger.ONE) + unit);
        }
    }

    // The parser accepts 2^64-1 bytes. JFR enforces smaller limits of its own, so the startup options must be
    // rejected by JFR (not by the parser) and before JFR allocates anything.
    private static void testJfrStartupMaximum() throws Exception {
        for (String size : new String[] {MAX.toString(), MAX + "b"}) {
            for (String option : JFR_OPTIONS) {
                OutputAnalyzer output = ProcessTools.executeTestJava(
                    "-XX:FlightRecorderOptions=" + startupOption(option) + "=" + size, "-version");
                output.shouldNotHaveExitValue(0).shouldNotContain("Parsing error memory size value");
                if (!option.equals("maxchunksize")) {
                    output.shouldMatch("This value is (lower|higher) than the (minimum|maximum) size");
                }
            }
        }
    }

    // Only maxchunksize is exercised with the maximum through JFR.configure: JFR rejects it before changing any
    // state. The other sizes would be stored in process-wide JFR state, so they are covered at startup instead.
    private static void testJfrConfigureMaximum(JMXExecutor executor) throws Exception {
        for (String size : new String[] {MAX.toString(), MAX + "b", MAX + "B"}) {
            String command = "JFR.configure maxchunksize=" + size;
            try {
                executor.execute(command).shouldNotContain(ERROR);
            } catch (RuntimeMBeanException e) {
                Asserts.assertFalse(String.valueOf(e.getCause()).contains(ERROR), "Parser rejected the maximum: " + command);
            }
        }
    }

    public static void main(String[] args) throws Exception {
        JMXExecutor executor = new JMXExecutor();
        BigInteger overflow = MAX.add(BigInteger.ONE);
        // k/m/g multiplication overflow.
        for (String size : new String[] {"18014398509481984k", "17592186044416M", "17179869184g"}) {
            rejectOverflow(executor, size, true);
        }
        // Decimal conversion overflow, with no unit and with the byte unit.
        for (String size : new String[] {overflow.toString(), overflow + "b", "9".repeat(32)}) {
            rejectOverflow(executor, size, true);
        }
        rejectOverflow(executor, overflow + "B", false);
        testCompilerMemoryBoundaries(executor);
        testJfrConfigureMaximum(executor);
        testJfrStartupMaximum();
        executor.execute("Compiler.memory minsize=1k").shouldNotContain(ERROR);
        executor.execute("JFR.configure").shouldNotContain(ERROR);
    }
}
