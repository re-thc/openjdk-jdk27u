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
public class JavaFallbackCandidates {
    @Param({"digits", "word", "space", "dot", "backref"}) public String shape;
    @Param({"16", "4096"}) public int length;
    @Param({"firstChars", "literalMiss", "denseLate"}) public String position;
    @Param({"false", "true"}) public boolean endFlags;
    private Matcher matcher;

    private String rejected(int width) {
        String token = shape.equals("dot") ? "error\n"
                : shape.equals("backref") ? "error3X" : "errorX";
        return token.repeat((width + token.length() - 1) / token.length()).substring(0, width);
    }

    @Setup public void setup() {
        String tail = switch (shape) {
            case "word" -> "[a-z]+";
            case "space" -> "\\s+";
            case "dot" -> ".+";
            case "backref" -> "([0-9])\\1+";
            default -> "[0-9]+";
        };
        char character = switch (shape) { case "word" -> 'a'; case "space" -> ' '; default -> '3'; };
        String token = "error" + String.valueOf(character).repeat(3);
        boolean expected = position.equals("denseLate");
        String input = expected ? rejected(length - token.length()) + token
                : position.equals("firstChars") ? "e".repeat(length) : rejected(length);
        matcher = Pattern.compile("(?=error)error" + tail).matcher(input);
        if (matcher.find() != expected) throw new AssertionError("fixture result");
        if (expected && (matcher.start() != length - token.length() || matcher.end() != length))
            throw new AssertionError("fixture position");
        if (expected && matcher.groupCount() != 0
                && (matcher.start(1) != length - 3 || matcher.end(1) != length - 2
                    || !matcher.group(1).equals("3")))
            throw new AssertionError("fixture capture");
        if (!matcher.hitEnd() || matcher.requireEnd()) throw new AssertionError("fixture end flags");
    }

    @Benchmark public int match() {
        boolean found = matcher.reset().find();
        int result = found ? matcher.start() + matcher.end() : -1;
        if (found && matcher.groupCount() != 0) result += matcher.start(1) + matcher.end(1);
        if (endFlags) result += (matcher.hitEnd() ? 1 : 0) + (matcher.requireEnd() ? 2 : 0);
        return result;
    }
}
