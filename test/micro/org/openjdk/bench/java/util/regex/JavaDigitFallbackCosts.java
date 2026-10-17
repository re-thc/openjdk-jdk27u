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
@State(Scope.Thread)
public class JavaDigitFallbackCosts {
    @Param({"range", "digit", "unicodeDigit", "bitClass", "bounded", "reluctant", "possessive", "suffix", "backtrack", "named"}) public String shape;
    @Param({"16", "4096"}) public int length;
    @Param({"miss", "early", "late", "full"}) public String position;
    @Param({"false", "true"}) public boolean endFlags;
    private Matcher matcher;
    @Setup public void setup() {
        String tail = switch (shape) {
            case "digit" -> "\\d+";
            case "unicodeDigit" -> "(?U:\\d+)";
            case "bitClass" -> "[0123456789]+";
            case "bounded" -> "[0-9]{2,}";
            case "reluctant" -> "[0-9]+?";
            case "possessive" -> "[0-9]++";
            case "suffix" -> "[0-9]+3";
            case "backtrack" -> "[0-9]+[0-9]";
            case "named" -> "(?<n>[0-9]+)";
            default -> "[0-9]+";
        };
        String expression = "(?=error)error" + tail;
        char character = switch (shape) { case "word" -> 'a'; case "space" -> ' '; default -> '3'; };
        String token = "error" + String.valueOf(character).repeat(3);
        String input = switch (position) {
            case "early" -> token + "!".repeat(length - token.length());
            case "late" -> "!".repeat(length - token.length()) + token;
            case "full" -> "error" + String.valueOf(character).repeat(length - 5);
            default -> "!".repeat(length);
        };
        matcher = Pattern.compile(expression).matcher(input);
        boolean expected = !position.equals("miss");
        if (matcher.find() != expected) throw new AssertionError("fixture result");
        if (expected && matcher.start() != (position.equals("late") ? length - token.length() : 0))
            throw new AssertionError("fixture position");
    }
    @Benchmark public int match() {
        boolean found = matcher.reset().find();
        int result = found ? matcher.start() + matcher.end() : -1;
        if (found && matcher.groupCount() != 0) result += matcher.start(1) + matcher.end(1);
        if (endFlags) result += (matcher.hitEnd() ? 1 : 0) + (matcher.requireEnd() ? 2 : 0);
        return result;
    }
}
