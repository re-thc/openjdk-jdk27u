/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
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
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(3)
@State(Scope.Thread)
public class RustRegexFilter {
    @Param({"64", "4096", "32768"})
    public int length;
    @Param({"miss", "hit", "hitAfterMisses", "unsupported", "literal", "utf16", "flags"})
    public String scenario;
    private Matcher matcher;

    @Setup
    public void setup() {
        String expression = switch (scenario) {
            case "unsupported" -> "(?=error)error[0-9]+";
            case "literal" -> "error123";
            default -> "error[0-9]+";
        };
        String input = "x ".repeat(length / 2);
        if (scenario.equals("utf16")) input = "\u0100 ".repeat(length / 2);
        if (scenario.equals("hit")) input = "error123" + input.substring(8);
        int flags = scenario.equals("flags") ? Pattern.CASE_INSENSITIVE : 0;
        matcher = Pattern.compile(expression, flags).matcher(input);
        for (int i = 0; i < 16; i++) matcher.reset().find();
        if (scenario.equals("hitAfterMisses")) {
            matcher.reset("error123" + input.substring(8));
        }
    }

    @Benchmark
    public boolean find() { return matcher.reset().find(); }
}
