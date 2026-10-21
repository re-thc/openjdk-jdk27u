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
        @Param({"empty", "shortBlank", "shortClean", "shortPad", "early", "prefix8", "prefix9", "suffix8", "suffix9", "probeAt", "probeAfter", "tailProbeAt", "tailProbeAfter",
                "prefix39", "prefix40", "prefix41", "prefix63", "prefix64", "prefix65", "suffix39", "suffix40", "suffix41", "suffix63", "suffix64", "suffix65", "length319", "length320", "length321", "gateBefore", "gateAt",
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
                    case "prefix8" -> " ".repeat(8) + text.repeat(4096);
                    case "prefix9" -> " ".repeat(9) + text.repeat(4096);
                    case "suffix8" -> text.repeat(4096) + " ".repeat(8);
                    case "suffix9" -> text.repeat(4096) + " ".repeat(9);
                    case "probeAt" -> " ".repeat(32) + text.repeat(4096);
                    case "probeAfter" -> " ".repeat(33) + text.repeat(4096);
                    case "tailProbeAt" -> text.repeat(4096) + " ".repeat(32);
                    case "tailProbeAfter" -> text.repeat(4096) + " ".repeat(33);
                    case "prefix39" -> " ".repeat(39) + text.repeat(4096);
                    case "prefix40" -> " ".repeat(40) + text.repeat(4096);
                    case "prefix41" -> " ".repeat(41) + text.repeat(4096);
                    case "prefix63" -> " ".repeat(63) + text.repeat(4096);
                    case "prefix64" -> " ".repeat(64) + text.repeat(4096);
                    case "prefix65" -> " ".repeat(65) + text.repeat(4096);
                    case "suffix39" -> text.repeat(4096) + " ".repeat(39);
                    case "suffix40" -> text.repeat(4096) + " ".repeat(40);
                    case "suffix41" -> text.repeat(4096) + " ".repeat(41);
                    case "suffix63" -> text.repeat(4096) + " ".repeat(63);
                    case "suffix64" -> text.repeat(4096) + " ".repeat(64);
                    case "suffix65" -> text.repeat(4096) + " ".repeat(65);
                    case "length319" -> " ".repeat(319);
                    case "length320" -> " ".repeat(320);
                    case "length321" -> " ".repeat(321);
                    case "gateBefore" -> " ".repeat(287);
                    case "gateAt" -> " ".repeat(288);
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
        @Param({"empty", "short", "immediate", "prefix8", "prefix9", "probeAt", "probeAfter",
                "prefix39", "prefix40", "prefix41", "prefix63", "prefix64", "prefix65", "prefix287", "prefix288", "prefix289", "prefix319", "prefix320", "prefix321",
                "length319", "length320", "length321", "length543", "length544", "length545", "length575", "length576", "length577",
                "lines16", "lines80", "lines128", "gateBefore", "gateAt", "noMatch", "longLines", "dense", "windowCRLF", "utf16"})
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
                    case "prefix8" -> text.repeat(8) + "\r\n" + text.repeat(4096);
                    case "prefix9" -> text.repeat(9) + "\r\n" + text.repeat(4096);
                    case "probeAt" -> text.repeat(32) + "\r\n" + text.repeat(4096);
                    case "probeAfter" -> text.repeat(33) + "\r\n" + text.repeat(4096);
                    case "prefix39" -> text.repeat(39) + "\r\n" + text.repeat(4096);
                    case "prefix40" -> text.repeat(40) + "\r\n" + text.repeat(4096);
                    case "prefix41" -> text.repeat(41) + "\r\n" + text.repeat(4096);
                    case "prefix63" -> text.repeat(63) + "\r\n" + text.repeat(4096);
                    case "prefix64" -> text.repeat(64) + "\r\n" + text.repeat(4096);
                    case "prefix65" -> text.repeat(65) + "\r\n" + text.repeat(4096);
                    case "prefix287" -> text.repeat(287) + "\r\n" + text.repeat(4096);
                    case "prefix288" -> text.repeat(288) + "\r\n" + text.repeat(4096);
                    case "prefix289" -> text.repeat(289) + "\r\n" + text.repeat(4096);
                    case "prefix319" -> text.repeat(319) + "\r\n" + text.repeat(4096);
                    case "prefix320" -> text.repeat(320) + "\r\n" + text.repeat(4096);
                    case "prefix321" -> text.repeat(321) + "\r\n" + text.repeat(4096);
                    case "length319" -> text.repeat(319);
                    case "length320" -> text.repeat(320);
                    case "length321" -> text.repeat(321);
                    case "length543" -> text.repeat(543);
                    case "length544" -> text.repeat(544);
                    case "length545" -> text.repeat(545);
                    case "length575" -> text.repeat(575);
                    case "length576" -> text.repeat(576);
                    case "length577" -> text.repeat(577);
                    case "lines16" -> (text.repeat(16) + "\r\n").repeat(256);
                    case "lines80" -> (text.repeat(80) + "\r\n").repeat(256);
                    case "lines128" -> (text.repeat(128) + "\r\n").repeat(256);
                    case "gateBefore" -> text.repeat(287);
                    case "gateAt" -> text.repeat(288);
                    case "noMatch" -> text.repeat(4096);
                    case "longLines" -> (text.repeat(4096) + "\r\n").repeat(4);
                    case "dense" -> (text + "\r\n").repeat(1024);
                    case "windowCRLF" -> text.repeat(65567) + "\r\n" + text.repeat(65536) + "\n";
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
