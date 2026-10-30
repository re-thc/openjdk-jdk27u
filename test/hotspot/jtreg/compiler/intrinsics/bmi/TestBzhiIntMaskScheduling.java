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
 * @summary Keep local scratch-register definitions with selected int-mask instructions.
 * @requires vm.debug == true & vm.compiler2.enabled & vm.simpleArch == "x64" & vm.cpu.features ~= ".*bmi2.*"
 * @library /test/lib
 * @run driver compiler.intrinsics.bmi.TestBzhiIntMaskScheduling
 */

package compiler.intrinsics.bmi;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jdk.test.lib.Asserts;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class TestBzhiIntMaskScheduling {
    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            checkResults();
            return;
        }
        for (boolean pressure : new boolean[] {true, false}) {
            checkSchedule(pressure, false, false);
            checkSchedule(pressure, true, false);
        }
        checkSchedule(true, false, true);
    }

    private static void checkSchedule(boolean pressure, boolean stress, boolean pipeline) throws Exception {
        String name = TestBzhiIntMaskScheduling.class.getName();
        List<String> flags = new ArrayList<>(List.of(
                "-Xbatch", "-XX:-TieredCompilation", "-XX:CompileThreshold=100",
                "-XX:-UseOnStackReplacement", "-XX:-UseSuperWord", "-XX:+UseBMI2Instructions",
                "-XX:" + (pressure ? "+" : "-") + "OptoRegScheduling",
                "-XX:" + (pipeline ? "+" : "-") + "OptoScheduling",
                "-XX:CompileCommand=compileonly," + name + "::independent",
                "-XX:CompileCommand=option," + name + "::independent,TraceOptoPipelining"));
        if (stress) {
            flags.add("-XX:+StressLCM");
            flags.add("-XX:StressSeed=8389111");
        }
        flags.add(name);
        flags.add("child");
        OutputAnalyzer out = ProcessTools.executeTestJava(flags.toArray(String[]::new));
        out.shouldHaveExitValue(0);
        out.shouldContain("Results checked");
        out.shouldContain("bzhiI_rReg_rReg");
        checkMaskTemps(out.getStdout());
    }

    private static void checkMaskTemps(String trace) {
        Pattern mask = Pattern.compile("(?m)^#\\s+(\\d+)\\s+bzhiI_rReg_rReg\\S*\\s+===");
        Pattern temp = Pattern.compile("(?m)^#\\s+(\\d+)\\s+MachTemp\\s+===\\s+\\d+\\s+\\[\\[\\s+(\\d+)\\s+\\]\\]");
        int checked = 0;
        for (String block : trace.split("(?m)^# --- schedule_local ")) {
            String before = block.split("#   ready cnt:", 2)[0];
            Set<String> masks = new HashSet<>();
            Matcher m = mask.matcher(before);
            while (m.find()) {
                masks.add(m.group(1));
            }
            Matcher t = temp.matcher(before);
            while (t.find()) {
                if (!masks.contains(t.group(2))) {
                    continue;
                }
                // Only check local single-use temps of the mask instructions.
                // Fallback temps with other consumers retain normal scheduling.
                String id = t.group(1);
                Asserts.assertFalse(Pattern.compile("(?m)^#    select " + id + ": MachTemp,")
                        .matcher(block).find(), "Scratch temp competed on the ready list: " + id);
                int after = block.indexOf("# after schedule_local");
                String adjacent = "(?m)^#\\s+" + id + "\\s+MachTemp\\s+===[^\\r\\n]*\\R#\\s+" +
                        t.group(2) + "\\s+bzhiI_rReg_rReg\\S*\\s+===";
                Asserts.assertTrue(after >= 0 && Pattern.compile(adjacent)
                        .matcher(block.substring(after)).find(), "Scratch definition separated from its use: " + id);
                checked++;
            }
        }
        Asserts.assertTrue(checked > 0, "No local mask scratch definitions found");
    }

    // Four independent reduction chains expose producer lifetimes after loop
    // unrolling. The scalar mask rule requires a TEMP_DEF scratch definition.
    static int independent(int[] values, byte[] counts, int base) {
        int a = 0, b = 0, c = 0, d = 0;
        for (int i = 0; i < values.length; i += 4) {
            a ^= (values[i] + base) & ((1 << (counts[i] & 255)) - 1);
            b ^= (values[i + 1] + base) & ((1 << (counts[i + 1] & 255)) - 1);
            c ^= (values[i + 2] + base) & ((1 << (counts[i + 2] & 255)) - 1);
            d ^= (values[i + 3] + base) & ((1 << (counts[i + 3] & 255)) - 1);
        }
        return a ^ b ^ c ^ d;
    }

    private static void checkResults() {
        int[] values = new int[256];
        byte[] counts = new byte[values.length];
        Random random = new Random(8389111);
        for (int i = 0; i < values.length; i++) {
            values[i] = random.nextInt();
            counts[i] = (byte) i;
        }
        for (int trial = 0; trial < 2000; trial++) {
            int base = random.nextInt();
            int expected = 0;
            for (int i = 0; i < values.length; i++) {
                int width = counts[i] & 31;
                long mask = 0xffff_ffffL >>> (32 - width);
                expected ^= (int) (Integer.toUnsignedLong(values[i] + base) & mask);
            }
            int actual = independent(values, counts, base);
            if (actual != expected) {
                throw new AssertionError("Mask result: " + actual + " != " + expected);
            }
        }
        System.out.println("Results checked");
    }
}
