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

import java.util.ArrayList;
import java.util.List;
import java.lang.reflect.Field;
import java.util.concurrent.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.openjdk.jmh.annotations.*;

/** Includes backend compilation/cache lookup and every search in a lifetime. */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.MICROSECONDS)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(value = 3, jvmArgsAppend = "--add-opens=java.base/java.util.regex=ALL-UNNAMED")
@State(Scope.Thread)
public class RustRegexLifetime {
    @Param({"2048", "4096", "32768"})
    public int length;
    @Param({"1", "8", "9", "10", "16", "32"})
    public int calls;
    @Param({"miss", "lastHit", "alternating"})
    public String scenario;
    @Param({"error", "ssn"})
    public String expression;
    @Param({"1", "4"})
    public int threads;
    @Param({"shared", "cold", "distinct"})
    public String reuse;
    private String regex, miss, hit;
    private ExecutorService pool;
    private long sequence;
    private Pattern retained;
    private Field nativeBackend;
    private boolean checkBackend, expectedNative;

    @Setup
    public void setup() throws Exception {
        checkBackend = Boolean.getBoolean("bench.rust.regex.checkBackend");
        expectedNative = Boolean.getBoolean("bench.rust.regex.expectedNative");
        if (checkBackend) {
            nativeBackend = Pattern.class.getDeclaredField("rustRegex");
            nativeBackend.setAccessible(true);
        }
        regex = expression.equals("ssn") ? "[0-9]{3}-[0-9]{2}-[0-9]{4}" : "error[0-9]+";
        if (reuse.equals("shared")) retained = Pattern.compile(regex);
        miss = "x ".repeat(length / 2);
        String candidate = expression.equals("ssn") ? "123-45-6789" : "error123";
        hit = candidate + miss.substring(candidate.length());
        if (threads > 1) {
            pool = Executors.newFixedThreadPool(threads);
            // Create workers before measuring Pattern lifetimes.
            List<Callable<Integer>> tasks = new ArrayList<>();
            for (int i = 0; i < threads; i++) tasks.add(() -> 0);
            pool.invokeAll(tasks);
        }
    }

    @TearDown
    public void tearDown() {
        if (pool != null) pool.close();
    }

    @Setup(Level.Invocation)
    public void prepareColdPattern() {
        // Outside the timed operation. Prevent budget exhaustion from silently
        // turning the distinct-expression compiler measurement into Java.
        if (!reuse.equals("shared")) System.gc();
    }

    private int search(Pattern pattern, int worker) {
        Matcher matcher = pattern.matcher(miss);
        int hits = 0;
        for (int i = worker; i < calls; i += threads) {
            boolean positive = scenario.equals("lastHit") ? i == calls - 1
                    : scenario.equals("alternating") && (i & 1) != 0;
            if (matcher.reset(positive ? hit : miss).find()) hits++;
        }
        return hits;
    }

    @Benchmark
    public int lifetime() throws Exception {
        // Optional unique suffix changes neither input's match, but prevents
        // reuse of a compiled native engine for the distinct-pattern case.
        String source = reuse.equals("distinct") ? regex + "(?:marker" + sequence++ + ")?" : regex;
        Pattern pattern = Pattern.compile(source);
        if (checkBackend && (nativeBackend.get(pattern) != null) != expectedNative)
            throw new IllegalStateException("unexpected Pattern backend in lifetime measurement");
        if (threads == 1) {
            int hits = search(pattern, 0);
            verifyBackend(pattern);
            return hits;
        }
        List<Callable<Integer>> tasks = new ArrayList<>();
        for (int i = 0; i < threads; i++) {
            int worker = i;
            tasks.add(() -> search(pattern, worker));
        }
        int hits = 0;
        for (Future<Integer> result : pool.invokeAll(tasks)) hits += result.get();
        verifyBackend(pattern);
        return hits;
    }

    private void verifyBackend(Pattern pattern) throws IllegalAccessException {
        if (checkBackend && (nativeBackend.get(pattern) != null) != expectedNative)
            throw new IllegalStateException("unexpected backend after complete Pattern lifetime");
    }
}
