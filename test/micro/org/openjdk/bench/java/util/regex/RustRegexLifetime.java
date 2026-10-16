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
@BenchmarkMode(Mode.SingleShotTime)
@OutputTimeUnit(TimeUnit.MICROSECONDS)
@Warmup(iterations = 10, batchSize = 1)
@Measurement(iterations = 20, batchSize = 1)
@Fork(value = 3, jvmArgsAppend = "--add-opens=java.base/java.util.regex=ALL-UNNAMED")
@State(Scope.Thread)
public class RustRegexLifetime {
    @Param({"2048", "4096", "32768"})
    public int length;
    @Param({"1", "8", "9", "10", "16", "32"})
    public int calls;
    @Param({"miss", "lastHit", "alternating"})
    public String scenario;
    @Param({"error", "ssn", "alternation", "email"})
    public String expression;
    @Param({"1", "4"})
    public int threads;
    @Param({"shared", "cold"})
    public String reuse;
    private String regex, miss, hit;
    private ExecutorService pool;
    private Pattern retained;
    private Field nativeBackend;
    private boolean checkBackend, expectedNative;

    @Setup
    public void setup() throws Exception {
        checkBackend = Boolean.getBoolean("bench.rust.regex.checkBackend");
        expectedNative = Boolean.getBoolean("bench.rust.regex.expectedNative");
        if (checkBackend) {
            try {
                nativeBackend = Pattern.class.getDeclaredField("rustRegex");
                nativeBackend.setAccessible(true);
            } catch (NoSuchFieldException missing) {
                if (expectedNative) throw new IllegalStateException("native backend is unavailable", missing);
            }
        }
        regex = switch (expression) {
            case "ssn" -> "[0-9]{3}-[0-9]{2}-[0-9]{4}";
            case "alternation" -> "(?:error|warning|fatal)[0-9]+";
            case "email" -> "([a-z0-9_]+)@([a-z0-9_]+)\\.[a-z]{2,4}";
            default -> "error[0-9]+";
        };
        if (reuse.equals("shared")) retained = Pattern.compile(regex);
        miss = "x ".repeat(length / 2);
        String candidate = switch (expression) {
            case "ssn" -> "123-45-6789";
            case "email" -> "a@b.co";
            default -> "error123";
        };
        hit = candidate + miss.substring(candidate.length());
        Pattern warm = Pattern.compile(regex);
        for (int i = 0; i < 12000; i++)
            Pattern.compile(regex).matcher(candidate + "!").find();
        if (threads > 1) {
            pool = Executors.newFixedThreadPool(threads);
            // Create workers before measuring Pattern lifetimes.
            List<Callable<Integer>> tasks = new ArrayList<>();
            for (int i = 0; i < threads; i++) tasks.add(() -> 0);
            pool.invokeAll(tasks);
        }
        // Warm the complete facade before timing cold backends. In the paired
        // C2 runs (CompileThreshold=1000), warming only Pattern.compile/find
        // leaves this low-invocation method in the interpreter.
        if (reuse.equals("cold")) {
            for (int i = 0; i < 2000; i++) lifetime();
        }
        // Validate the same workload outside the measured method. In particular,
        // never prepare a validation Pattern in the per-iteration cold setup.
        if (checkBackend) verifyLifetime();
        java.lang.ref.Reference.reachabilityFence(warm);
    }

    @TearDown
    public void tearDown() {
        if (pool != null) pool.close();
    }

    @Setup(Level.Iteration)
    public void prepareColdPattern() {
        // Single-shot iterations contain one complete cold lifetime.
        if (reuse.equals("cold")) System.gc();
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
        Pattern pattern = Pattern.compile(regex);
        if (threads == 1) {
            return search(pattern, 0);
        }
        List<Callable<Integer>> tasks = new ArrayList<>();
        for (int i = 0; i < threads; i++) {
            int worker = i;
            tasks.add(() -> search(pattern, worker));
        }
        int hits = 0;
        for (Future<Integer> result : pool.invokeAll(tasks)) hits += result.get();
        return hits;
    }

    private void verifyLifetime() throws Exception {
        Pattern pattern = Pattern.compile(regex);
        verifyBackend(pattern);
        int hits = 0;
        if (threads == 1) {
            hits = search(pattern, 0);
        } else {
            List<Callable<Integer>> tasks = new ArrayList<>();
            for (int i = 0; i < threads; i++) {
                int worker = i;
                tasks.add(() -> search(pattern, worker));
            }
            for (Future<Integer> result : pool.invokeAll(tasks)) hits += result.get();
        }
        int expectedHits = scenario.equals("lastHit") ? 1 : scenario.equals("alternating") ? calls / 2 : 0;
        if (hits != expectedHits) throw new IllegalStateException("unexpected lifetime match count");
        verifyBackend(pattern);
    }

    private void verifyBackend(Pattern pattern) throws IllegalAccessException {
        if ((nativeBackend != null && nativeBackend.get(pattern) != null) != expectedNative)
            throw new IllegalStateException("unexpected backend after complete Pattern lifetime");
    }
}
