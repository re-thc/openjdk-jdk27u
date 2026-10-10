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
public class RustRegexNative {
    @Param({"64", "4096", "32768"})
    public int length;
    @Param({"miss", "hit", "lateHit", "fullHit", "captures", "unsupported", "literal", "utf16", "flags"})
    public String scenario;
    @Param({"find", "matches", "lookingAt"})
    public String operation;
    // Other shapes are selected explicitly by the paired benchmark runner.
    @Param({"prefix"})
    public String regexType;
    private Matcher matcher;

    @Setup
    public void setup() {
        String expression = switch (scenario) {
            case "unsupported" -> "(?=error)error[0-9]+";
            case "literal" -> "error123";
            case "captures" -> "(?<word>error)(?<code>[0-9]+)";
            default -> switch (regexType) {
                case "digits" -> "[0-9]+";
                case "ssn" -> "[0-9]{3}-[0-9]{2}-[0-9]{4}";
                case "alternation" -> "(?:error|warning|fatal)[0-9]+";
                case "email" -> "([a-z0-9_]+)@([a-z0-9_]+)\\.[a-z]{2,4}";
                default -> "error[0-9]+";
            };
        };
        String input = "!".repeat(length);
        if (scenario.equals("utf16")) input = "\u0100 ".repeat(length / 2);
        String shape = switch (scenario) {
            case "captures", "unsupported", "literal", "flags" -> "prefix";
            default -> regexType;
        };
        String candidate = switch (shape) {
            case "digits" -> "123";
            case "ssn" -> "123-45-6789";
            case "email" -> "a@b.co";
            default -> "error123";
        };
        if (!scenario.equals("hit") && !scenario.equals("lateHit")) candidate = "error123";
        if (scenario.equals("hit") || scenario.equals("captures"))
            input = candidate + input.substring(candidate.length());
        if (scenario.equals("lateHit")) input = input.substring(candidate.length()) + candidate;
        if (scenario.equals("fullHit")) {
            input = switch (shape) {
                case "digits" -> "3".repeat(length);
                case "email" -> "a".repeat(length - 5) + "@b.co";
                case "ssn" -> "123-45-6789";
                default -> "error" + "3".repeat(length - 5);
            };
            if (input.length() != length)
                throw new IllegalArgumentException("fullHit length does not fit the regex shape");
        }
        int flags = scenario.equals("flags") ? Pattern.CASE_INSENSITIVE : 0;
        matcher = Pattern.compile(expression, flags).matcher(input);
        boolean expectedHit = switch (scenario) {
            case "hit", "lateHit", "fullHit", "captures" -> true;
            default -> false;
        };
        for (int i = 0; i < 16; i++) {
            if (matcher.reset().find() != expectedHit)
                throw new IllegalStateException("input does not fit the benchmark scenario");
        }
    }

    @Benchmark
    public boolean match() {
        matcher.reset();
        return switch (operation) {
            case "matches" -> matcher.matches();
            case "lookingAt" -> matcher.lookingAt();
            default -> matcher.find();
        };
    }
}
