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
 * @summary Keep multiple scratch definitions with their consumer and retain block-end temp scheduling.
 * @requires vm.debug == true & vm.compiler2.enabled & vm.simpleArch == "x64"
 * @library /test/lib
 * @run driver compiler.c2.TestMachTempScheduling
 */

package compiler.c2;

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

public class TestMachTempScheduling {
    private static final Pattern NODE = Pattern.compile(
            "(?m)^#\\s+(\\d+)\\s+(\\S+)\\s+===\\s*(.*?)\\s*\\[\\[\\s*(.*?)\\s*\\]\\].*$");
    private static final Pattern SELECTED_TEMP = Pattern.compile("(?m)^#    select (\\d+): MachTemp,");
    private static final int DEFAULT = 0x6e27d4a1;
    private static final int[] SWITCH_RESULTS = {
        0x31a6c7e2, 0x8d025b49, 0x67ef1023, 0xd4a93856,
        0x0b7c6e91, 0x95e142fa, 0x4c28a703, 0xe673bd15,
        0x29f0548c, 0xb14d9e62, 0x7ac305d8, 0xc8627f40,
        0x16dbe935, 0xa50f2867, 0x53c194be, 0xf9076a24,
        0x3e829d71, 0x80ba43c6, 0x65d71809, 0xda04f2b3,
        0x0279ce58, 0x9b6314ed, 0x47eab026, 0xec158793,
        0x24c96df0, 0xb8a20745, 0x709e3bc1, 0xc56f82da,
        0x1d43a698, 0xaec87032, 0x5f16d4ab, 0xf28b395e
    };

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
        String name = TestMachTempScheduling.class.getName();
        List<String> flags = new ArrayList<>(List.of(
                "-Xbatch", "-XX:-TieredCompilation", "-XX:CompileThreshold=100",
                "-XX:-UseOnStackReplacement", "-XX:-UseSuperWord", "-XX:+UseJumpTables",
                "-XX:" + (pressure ? "+" : "-") + "OptoRegScheduling",
                "-XX:" + (pipeline ? "+" : "-") + "OptoScheduling",
                "-XX:CompileCommand=compileonly," + name + "::reverseBits",
                "-XX:CompileCommand=compileonly," + name + "::denseSwitch",
                "-XX:CompileCommand=option," + name + "::reverseBits,TraceOptoPipelining",
                "-XX:CompileCommand=option," + name + "::denseSwitch,TraceOptoPipelining"));
        if (stress) {
            flags.add("-XX:+StressLCM");
            flags.add("-XX:StressSeed=8389111");
        }
        flags.add(name);
        flags.add("child");
        OutputAnalyzer out = ProcessTools.executeTestJava(flags.toArray(String[]::new));
        out.shouldHaveExitValue(0);
        out.shouldContain("Results checked");
        checkTemps(out.getStdout());
        System.out.println("Schedule checked: pressure=" + pressure + ", stress=" + stress +
                           ", pipeline=" + pipeline);
    }

    private record Node(String id, String name, String inputs, String outputs) { }

    private static List<Node> nodes(String graph) {
        List<Node> nodes = new ArrayList<>();
        Matcher m = NODE.matcher(graph);
        while (m.find()) {
            nodes.add(new Node(m.group(1), m.group(2), m.group(3).strip(), m.group(4).strip()));
        }
        return nodes;
    }

    private static void checkTemps(String trace) {
        Set<String> roots = new HashSet<>();
        for (Node n : nodes(trace)) {
            if (n.name().equals("Root")) {
                roots.add(n.id());
            }
        }
        int multiTempGroups = 0;
        int blockEndTemps = 0;
        for (String block : trace.split("(?m)^# --- schedule_local ")) {
            int ready = block.indexOf("#   ready cnt:");
            int afterStart = block.indexOf("# after schedule_local");
            if (ready < 0 || afterStart < 0) {
                continue;
            }
            List<Node> before = nodes(block.substring(0, ready));
            List<Node> after = nodes(block.substring(afterStart));
            List<String> order = after.stream().map(Node::id).toList();
            Set<String> selected = new HashSet<>();
            Matcher m = SELECTED_TEMP.matcher(block);
            while (m.find()) {
                selected.add(m.group(1));
            }
            for (Node use : before) {
                boolean reverse = use.name().matches("bytes_reversebit_long(?:_gfni)?");
                boolean jump = use.name().matches("jumpXtnd(?:_addr)?");
                if (!reverse && !jump) {
                    continue;
                }
                Set<String> temps = new HashSet<>();
                for (Node n : before) {
                    if (n.name().equals("MachTemp") && n.outputs().equals(use.id())) {
                        Asserts.assertTrue(roots.contains(n.inputs()), "Unexpected temp constraints: " + n);
                        temps.add(n.id());
                    }
                }
                Asserts.assertFalse(temps.isEmpty(), "No scratch definitions for " + use);
                int useIndex = order.indexOf(use.id());
                Asserts.assertTrue(useIndex >= 0, "Consumer missing after scheduling: " + use);
                for (String id : temps) {
                    Asserts.assertEQ(order.indexOf(id), order.lastIndexOf(id), "Duplicated temp: " + id);
                    Asserts.assertTrue(order.indexOf(id) >= 0, "Temp missing after scheduling: " + id);
                }
                if (reverse) {
                    // Both x64 Long.reverse rules use several temps. Permit any
                    // order among siblings, but no intervening instruction.
                    Asserts.assertTrue(temps.size() >= 2, "No multi-temp reverse instruction: " + use);
                    Asserts.assertTrue(before.size() > 10, "Block too small for pressure scheduling");
                    Asserts.assertTrue(useIndex >= temps.size(), "No room for scratch definitions: " + use);
                    Asserts.assertEQ(new HashSet<>(order.subList(useIndex - temps.size(), useIndex)),
                                     temps, "Scratch group separated from its consumer: " + use);
                    for (String id : temps) {
                        Asserts.assertFalse(selected.contains(id), "Scratch competed on the ready list: " + id);
                    }
                    multiTempGroups++;
                } else {
                    // A Jump is a block end, so its temp must keep the normal
                    // scheduling path. This does not exercise constrained temps
                    // with extra required or precedence inputs.
                    for (String id : temps) {
                        Asserts.assertTrue(selected.contains(id), "Block-end temp bypassed ready list: " + id);
                        Asserts.assertTrue(order.indexOf(id) < useIndex, "Block-end temp follows its use: " + id);
                        blockEndTemps++;
                    }
                }
            }
        }
        Asserts.assertTrue(multiTempGroups > 0, "No multi-temp reverse groups found");
        Asserts.assertTrue(blockEndTemps > 0, "No block-end jump temps found");
        System.out.println("Checked " + multiTempGroups + " multi-temp groups and " + blockEndTemps +
                           " block-end temps");
    }

    // Three x64 reversals provide several temps and a block large enough for pressure scheduling.
    static long reverseBits(long x, long y, long z) {
        return (Long.reverse(x) + Long.reverse(y)) ^ Long.reverse(z);
    }

    static int denseSwitch(int key) {
        return switch (key) {
            case 0 -> 0x31a6c7e2;
            case 1 -> 0x8d025b49;
            case 2 -> 0x67ef1023;
            case 3 -> 0xd4a93856;
            case 4 -> 0x0b7c6e91;
            case 5 -> 0x95e142fa;
            case 6 -> 0x4c28a703;
            case 7 -> 0xe673bd15;
            case 8 -> 0x29f0548c;
            case 9 -> 0xb14d9e62;
            case 10 -> 0x7ac305d8;
            case 11 -> 0xc8627f40;
            case 12 -> 0x16dbe935;
            case 13 -> 0xa50f2867;
            case 14 -> 0x53c194be;
            case 15 -> 0xf9076a24;
            case 16 -> 0x3e829d71;
            case 17 -> 0x80ba43c6;
            case 18 -> 0x65d71809;
            case 19 -> 0xda04f2b3;
            case 20 -> 0x0279ce58;
            case 21 -> 0x9b6314ed;
            case 22 -> 0x47eab026;
            case 23 -> 0xec158793;
            case 24 -> 0x24c96df0;
            case 25 -> 0xb8a20745;
            case 26 -> 0x709e3bc1;
            case 27 -> 0xc56f82da;
            case 28 -> 0x1d43a698;
            case 29 -> 0xaec87032;
            case 30 -> 0x5f16d4ab;
            case 31 -> 0xf28b395e;
            default -> DEFAULT;
        };
    }

    private static long reverseReference(long x) {
        long result = 0;
        for (int bit = 0; bit < Long.SIZE; bit++) {
            result = (result << 1) | (x & 1);
            x >>>= 1;
        }
        return result;
    }

    private static void checkReverse(long x, long y, long z) {
        long expected = (reverseReference(x) + reverseReference(y)) ^ reverseReference(z);
        Asserts.assertEQ(reverseBits(x, y, z), expected, "Bit reversal result");
    }

    private static void checkSwitch(int key) {
        int expected = key >= 0 && key < SWITCH_RESULTS.length ? SWITCH_RESULTS[key] : DEFAULT;
        Asserts.assertEQ(denseSwitch(key), expected, "Switch result for " + key);
    }

    private static void checkResults() {
        Random random = new Random(8389111);
        for (int trial = 0; trial < 2000; trial++) {
            checkReverse(random.nextLong(), random.nextLong(), random.nextLong());
            checkSwitch((trial & 63) - 16);
        }
        for (long x : new long[] {0, -1, Long.MIN_VALUE, Long.MAX_VALUE}) {
            checkReverse(x, ~x, x);
        }
        for (int bit = 0; bit < Long.SIZE; bit++) {
            long x = 1L << bit;
            checkReverse(x, ~x, x ^ Long.MIN_VALUE);
        }
        for (int key : new int[] {Integer.MIN_VALUE, -1, 0, 31, 32, Integer.MAX_VALUE}) {
            checkSwitch(key);
        }
        System.out.println("Results checked");
    }
}
