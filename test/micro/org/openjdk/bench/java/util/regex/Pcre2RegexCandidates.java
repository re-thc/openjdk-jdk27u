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

import java.lang.reflect.Constructor;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.openjdk.jmh.annotations.*;

/** Exercises repeated possible starts as well as a late match after rejected starts. */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(value = 3, jvmArgsAppend = "--add-opens=java.base/java.util.regex=ALL-UNNAMED")
@State(Scope.Thread)
public class Pcre2RegexCandidates {
    @Param({"16", "32", "64", "256", "4096"}) public int length;
    @Param({"uncaptured", "prefix", "alternation"}) public String shape;
    @Param({"firstChars", "literalMiss", "late"}) public String position;
    @Param({"false", "true"}) public boolean endFlags;
    private Matcher matcher;

    @Setup
    public void setup() throws Exception {
        String expression = switch (shape) {
            case "uncaptured" -> "error[0-9]+";
            case "alternation" -> "(?<level>error|warning|fatal)([0-9]+)";
            default -> "(?<word>error)(?<digits>[0-9]+)";
        };
        String unit = position.equals("firstChars") ? "e" : "errorX ";
        String padding = unit.repeat((length + unit.length() - 1) / unit.length()).substring(0, length);
        String candidate = shape.equals("alternation") ? "warning123" : "error123";
        String input = position.equals("late") ? padding.substring(0, length - candidate.length()) + candidate : padding;
        matcher = Pattern.compile(expression).matcher(input);
        Pattern reference;
        try {
            Constructor<Pattern> constructor = Pattern.class.getDeclaredConstructor(String.class, int.class, boolean.class);
            constructor.setAccessible(true);
            reference = constructor.newInstance(expression, 0, false);
        } catch (NoSuchMethodException originalSources) {
            reference = Pattern.compile(expression);
        }
        Matcher control = reference.matcher(input);
        boolean found = matcher.find(), expected = control.find();
        if (found != expected || matcher.groupCount() != control.groupCount()
                || found != position.equals("late") || observe(matcher, found) != observe(control, expected))
            throw new IllegalStateException("candidate fixture mismatch");
        if (found) for (int i = 0; i <= matcher.groupCount(); i++) {
            if (matcher.start(i) != control.start(i) || matcher.end(i) != control.end(i)
                    || !matcher.group(i).equals(control.group(i))) throw new IllegalStateException("capture contents");
        }
    }

    private long observe(Matcher value, boolean found) {
        long result = found ? 1 : 0;
        if (found) for (int group = 0; group <= value.groupCount(); group++)
            result = 31 * result + value.start(group) + value.end(group);
        if (endFlags) result = 31 * result + (value.hitEnd() ? 2 : 0) + (value.requireEnd() ? 1 : 0);
        return result;
    }

    @Benchmark
    public long match() { return observe(matcher, matcher.reset().find()); }
}
