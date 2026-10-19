/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
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
import org.openjdk.jmh.infra.BenchmarkParams;

/** Public Matcher work, including capture publication and optional end-flag replay. */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(3)
@State(Scope.Thread)
public class Pcre2RegexState {
    @Param({"16", "64", "256", "4096"})
    public int length;
    @Param({"prefix", "digits", "email", "alternation", "unsupported", "unicode"})
    public String shape;
    @Param({"miss", "early", "late", "full"})
    public String position;
    @Param({"false", "true"})
    public boolean endFlags;
    private Matcher matcher;

    @Setup
    public void setup(BenchmarkParams parameters) {
        String expression = switch (shape) {
            case "digits" -> "([0-9]+)";
            case "email" -> "(?<user>[a-z0-9_]+)@(?<domain>[a-z0-9_]+)\\.[a-z]{2,4}";
            case "alternation" -> "(?<level>error|warning|fatal)([0-9]+)";
            case "unsupported" -> "(?=error)(error)([0-9]+)";
            default -> "(error)([0-9]+)";
        };
        String candidate = switch (shape) {
            case "digits" -> "123";
            case "email" -> "a@b.co";
            default -> "error123";
        };
        String padding = (shape.equals("unicode") ? "\u0100" : "!").repeat(length);
        String input = switch (position) {
            case "early" -> candidate + padding.substring(candidate.length());
            case "late" -> padding.substring(candidate.length()) + candidate;
            case "full" -> switch (shape) {
                case "digits" -> "3".repeat(length);
                case "email" -> "a".repeat(length - 5) + "@b.co";
                case "unicode" -> "\u0100error" + "3".repeat(length - 6);
                default -> "error" + "3".repeat(length - 5);
            };
            default -> padding;
        };
        matcher = Pattern.compile(expression).matcher(input);
        String operation = parameters.getBenchmark();
        boolean found = operation.endsWith(".matches") ? matcher.matches()
                : operation.endsWith(".lookingAt") ? matcher.lookingAt() : matcher.find();
        boolean expected = !position.equals("miss");
        if (operation.endsWith(".matches"))
            expected &= position.equals("full") && !shape.equals("unicode");
        else if (operation.endsWith(".lookingAt"))
            expected &= position.equals("early") || position.equals("full") && !shape.equals("unicode");
        if (found != expected || input.length() != length)
            throw new IllegalStateException("input does not fit the benchmark scenario");
        // Validate observations during setup as well as consuming them below.
        observe(found);
    }

    private long observe(boolean found) {
        long result = found ? 1 : 0;
        if (found) {
            for (int group = 0; group <= matcher.groupCount(); group++)
                result = 31 * result + matcher.start(group) + matcher.end(group);
        }
        if (endFlags) result = 31 * result + (matcher.hitEnd() ? 2 : 0) + (matcher.requireEnd() ? 1 : 0);
        return result;
    }

    @Benchmark
    public long match() {
        return observe(matcher.reset().find());
    }

    @Benchmark
    public long matches() {
        return observe(matcher.reset().matches());
    }

    @Benchmark
    public long lookingAt() {
        return observe(matcher.reset().lookingAt());
    }
}
