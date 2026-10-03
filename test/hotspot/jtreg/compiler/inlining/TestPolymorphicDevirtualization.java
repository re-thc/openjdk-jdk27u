/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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
 */

/*
 * @test
 * @summary Exercise wider receiver guards, trace logging, fallback and exceptions
 * @requires vm.compiler2.enabled
 * @library /test/lib
 * @run driver compiler.inlining.TestPolymorphicDevirtualization
 */

package compiler.inlining;

import java.util.ArrayList;
import java.util.List;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class TestPolymorphicDevirtualization {
    public static void main(String[] args) throws Exception {
        for (int receivers : new int[] {3, 6, 8}) {
            for (boolean enabled : new boolean[] {false, true}) {
                for (boolean printInlining : new boolean[] {false, true}) {
                    List<String> options = new ArrayList<>(List.of(
                            "-XX:+UnlockExperimentalVMOptions",
                            "-XX:+UnlockDiagnosticVMOptions",
                            "-XX:" + (enabled ? "+" : "-") + "PolymorphicInlining",
                            "-XX:MorphismLimit=8", "-XX:TypeProfileWidth=8",
                            "-XX:-TieredCompilation", "-Xbatch",
                            "-XX:+TraceTypeProfile",
                            "-XX:CompileCommand=compileonly," + Workload.class.getName() + "::call",
                            "-XX:CompileCommand=dontinline," + Workload.class.getName() + "::call"));
                    if (printInlining) {
                        options.add("-XX:+PrintInlining");
                    }
                    options.add(Workload.class.getName());
                    options.add(Integer.toString(receivers));
                    OutputAnalyzer output = ProcessTools.executeTestJava(options.toArray(String[]::new));
                    output.shouldHaveExitValue(0);
                    output.shouldContain("checks passed");
                    if (enabled) {
                        output.shouldContain("TypeProfile");
                        if (printInlining) {
                            output.shouldMatch("TestPolymorphicDevirtualization\\$Workload\\$R[0-7]::apply.*inline");
                        }
                    }
                }
            }
        }
    }

    public static class Workload {
        interface Rule { long apply(long x); }
        static class R0 implements Rule { public long apply(long x) { return x + 1; } }
        static class R1 implements Rule { public long apply(long x) { return x * 3; } }
        static class R2 implements Rule { public synchronized long apply(long x) { return x - 7; } }
        static class R3 implements Rule { public long apply(long x) { return x ^ 17; } }
        static class R4 implements Rule { public long apply(long x) { return -x; } }
        static class R5 implements Rule { public long apply(long x) { if (x == Long.MIN_VALUE) throw new Marker(); return x / 5; } }
        static class R6 implements Rule { public long apply(long x) { return Math.min(x, 123); } }
        static class R7 implements Rule { public long apply(long x) { return Long.rotateLeft(x, 11); } }
        static class Late implements Rule { public long apply(long x) { return x + 1009; } }
        static class Marker extends RuntimeException {}
        static volatile long sink;

        static long call(Rule rule, long x) { return rule.apply(x); }

        static long expected(int k, long x) {
            return switch (k) {
                case 0 -> x + 1;
                case 1 -> x * 3;
                case 2 -> x - 7;
                case 3 -> x ^ 17;
                case 4 -> -x;
                case 5 -> x / 5;
                case 6 -> Math.min(x, 123);
                case 7 -> Long.rotateLeft(x, 11);
                default -> throw new AssertionError(k);
            };
        }

        public static void main(String[] args) {
            int n = Integer.parseInt(args[0]);
            Rule[] rules = {new R0(), new R1(), new R2(), new R3(), new R4(), new R5(), new R6(), new R7()};
            long total = 0;
            for (int i = 0; i < 100_000; i++) {
                int k = i % n;
                long x = i * 1_000_003L;
                long actual = call(rules[k], x);
                if (actual != expected(k, x)) throw new AssertionError("receiver " + k);
                total += actual;
            }
            // The wider profile is complete before this new receiver is loaded.
            Rule late = new Late();
            for (long x : new long[] {Long.MIN_VALUE, -1, 0, 1, Long.MAX_VALUE}) {
                if (call(late, x) != x + 1009) throw new AssertionError("late receiver");
                for (int k = 0; k < rules.length; k++) {
                    if (k == 5 && x == Long.MIN_VALUE) continue;
                    if (call(rules[k], x) != expected(k, x)) throw new AssertionError("overflow");
                }
            }
            try { call(rules[5], Long.MIN_VALUE); throw new AssertionError("missing exception"); }
            catch (Marker expected) {}
            try { call(null, 0); throw new AssertionError("missing null check"); }
            catch (NullPointerException expected) {}
            System.gc();
            for (int k = 0; k < rules.length; k++) {
                if (call(rules[k], 41) != expected(k, 41)) throw new AssertionError("after GC");
            }
            sink = total;
            System.out.println("checks passed");
        }
    }
}
