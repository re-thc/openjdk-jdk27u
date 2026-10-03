/*
 * Copyright (c) 2026, the openjdk-jdk27u contributors. All rights reserved.
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

package org.openjdk.bench.java.util.regex;

import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.openjdk.jmh.annotations.*;

@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@State(Scope.Thread)
@Fork(3)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 3, time = 1)
public class RegexLibrarySearch {
    @Param({"uuid", "date", "backref", "lookahead"})
    public String kind;
    @Param({"131072", "1048576"})
    public int length;
    @Param({"short", "early", "late", "missing", "dense", "utf16"})
    public String shape;
    private String regex;
    private String input;
    private Pattern pattern;
    private Matcher matcher;

    @Setup
    public void setup() {
        regex = switch (kind) {
            case "uuid" -> "[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}";
            case "date" -> "([0-9]{4})-([0-9]{2})-([0-9]{2})";
            case "backref" -> "fo(o+)\\1";
            case "lookahead" -> "fo(?=o)";
            default -> throw new IllegalArgumentException(kind);
        };
        String value = switch (kind) {
            case "uuid" -> "01234567-abCD-0123-4567-89abcdef0123";
            case "date" -> "2026-10-03";
            default -> "fooo";
        };
        input = switch (shape) {
            case "short" -> value;
            case "early" -> value + "x".repeat(length);
            case "late" -> "x".repeat(length) + value;
            case "missing" -> "x".repeat(length);
            case "dense" -> (kind.equals("date") ? "0" : "f").repeat(length);
            case "utf16" -> "中".repeat(length) + value;
            default -> throw new IllegalArgumentException(shape);
        };
        pattern = Pattern.compile(regex);
        matcher = pattern.matcher(input);
    }

    @Benchmark public Pattern compile() { return Pattern.compile(regex); }
    @Benchmark public boolean compileAndFirstFind() { return Pattern.compile(regex).matcher(input).find(); }
    @Benchmark public boolean newMatcherFind() { return pattern.matcher(input).find(); }
    @Benchmark public boolean reusedFind() { return matcher.reset().find(); }
}
