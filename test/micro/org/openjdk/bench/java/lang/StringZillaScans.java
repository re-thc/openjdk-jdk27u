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

package org.openjdk.bench.java.lang;

import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

/** Complete public operations, including scalar controls and allocation. */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(3)
public class StringZillaScans {
    @State(Scope.Thread)
    public static class Whitespace {
        @Param({"empty", "shortBlank", "shortClean", "shortPad", "early", "gateBefore", "gateAt",
                "longBlank", "longClean", "longLeading", "longTrailing", "longBoth", "lateNbsp", "nul", "window", "utf16"})
        public String workload;
        private String[] values;
        private int cursor;

        @Setup
        public void setup() {
            values = new String[16];
            for (int i = 0; i < values.length; i++) {
                String text = String.valueOf((char)('A' + i));
                String pad = " \t\u001c\n".repeat(1024);
                values[i] = switch (workload) {
                    case "empty" -> new String("");
                    case "shortBlank" -> " \t\n ".repeat(4);
                    case "shortClean" -> text.repeat(16);
                    case "shortPad" -> "  " + text + "  ";
                    case "early" -> " ".repeat(7) + text + " ".repeat(4088);
                    case "gateBefore" -> " ".repeat(263);
                    case "gateAt" -> " ".repeat(264);
                    case "longBlank" -> pad;
                    case "longClean" -> text.repeat(4096);
                    case "longLeading" -> pad + text;
                    case "longTrailing" -> text + pad;
                    case "longBoth" -> pad + text + pad;
                    case "lateNbsp" -> pad + "\u00a0";
                    case "nul" -> "\0".repeat(4096);
                    case "window" -> " ".repeat(131089) + text;
                    case "utf16" -> "\u2000".repeat(4096) + text + "\u2000".repeat(4096);
                    default -> throw new IllegalArgumentException(workload);
                };
            }
        }

        public String next() {
            String value = values[cursor];
            cursor = (cursor + 1) & 15;
            return value;
        }
    }

    @State(Scope.Thread)
    public static class Lines {
        @Param({"empty", "short", "immediate", "gateBefore", "gateAt", "noMatch", "longLines", "dense", "windowCRLF", "utf16"})
        public String workload;
        private String[] values;
        private int cursor;

        @Setup
        public void setup() {
            values = new String[16];
            for (int i = 0; i < values.length; i++) {
                String text = String.valueOf((char)('A' + i));
                values[i] = switch (workload) {
                    case "empty" -> new String("");
                    case "short" -> text + "bc\r\ndef\nghi\r";
                    case "immediate" -> "\r\n" + text.repeat(4096);
                    case "gateBefore" -> text.repeat(263);
                    case "gateAt" -> text.repeat(264);
                    case "noMatch" -> text.repeat(4096);
                    case "longLines" -> (text.repeat(4096) + "\r\n").repeat(4);
                    case "dense" -> (text + "\r\n").repeat(1024);
                    case "windowCRLF" -> text.repeat(65543) + "\r\n" + text.repeat(65536) + "\n";
                    case "utf16" -> ("\u0100".repeat(4096) + "\r\n").repeat(4);
                    default -> throw new IllegalArgumentException(workload);
                };
            }
        }

        public String next() {
            String value = values[cursor];
            cursor = (cursor + 1) & 15;
            return value;
        }
    }

    @Benchmark public String trim(Whitespace state) { return state.next().trim(); }
    @Benchmark public String strip(Whitespace state) { return state.next().strip(); }
    @Benchmark public String stripLeading(Whitespace state) { return state.next().stripLeading(); }
    @Benchmark public String stripTrailing(Whitespace state) { return state.next().stripTrailing(); }
    @Benchmark public boolean isBlank(Whitespace state) { return state.next().isBlank(); }
    @Benchmark public long linesCount(Lines state) { return state.next().lines().count(); }
    @Benchmark public String linesFirst(Lines state) { return state.next().lines().findFirst().orElse(""); }
}
