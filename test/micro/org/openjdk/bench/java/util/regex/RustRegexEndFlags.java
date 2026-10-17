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

import java.lang.reflect.Field;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.openjdk.jmh.annotations.*;

/** Matching plus Java end-state queries, including large-input routing. */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(value = 3, jvmArgsAppend = "--add-opens=java.base/java.util.regex=ALL-UNNAMED")
@State(Scope.Thread)
public class RustRegexEndFlags {
    @Param({"64", "4096", "131072"})
    public int length;
    @Param({"miss", "hit", "captures", "endHit", "regionMiss"})
    public String scenario;
    private Pattern pattern;
    private Matcher matcher;
    private boolean shortRegion;

    @Setup
    public void setup() {
        shortRegion = scenario.equals("regionMiss");
        String expression = scenario.equals("captures")
                ? "(?<word>error)(?<code>[0-9]+)" : "error[0-9]+";
        String input = "x ".repeat(length / 2);
        if (scenario.equals("hit") || scenario.equals("captures"))
            input = "error123" + input.substring(8);
        if (scenario.equals("endHit")) input = "error" + "3".repeat(length - 5);
        if (shortRegion) input += "error123";
        pattern = Pattern.compile(expression);
        matcher = pattern.matcher(input);
    }

    @Benchmark
    public int matchAndEndFlags() {
        matcher.reset();
        if (shortRegion) matcher.region(0, Math.min(64, length));
        boolean found = matcher.find();
        return (found ? 1 : 0) | (matcher.hitEnd() ? 2 : 0) | (matcher.requireEnd() ? 4 : 0);
    }

    @TearDown
    public void verifyBackend() throws ReflectiveOperationException {
        if (!Boolean.getBoolean("bench.rust.regex.checkBackend")) return;
        Field nativeBackend = Pattern.class.getDeclaredField("rustRegex");
        nativeBackend.setAccessible(true);
        boolean early = scenario.equals("hit") || scenario.equals("captures") || shortRegion;
        boolean expected = Boolean.getBoolean("bench.rust.regex.expectedNative")
                && (length <= 65536 || early);
        if ((nativeBackend.get(pattern) != null) != expected)
            throw new IllegalStateException("unexpected backend after end-state queries");
    }
}
