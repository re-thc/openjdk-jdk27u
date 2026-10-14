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
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Reports native search and explicit-GC latency, including new worker caches.
 * Run with --add-opens=java.base/java.util.regex=ALL-UNNAMED and safepoint logging.
 */
public class RustRegexLatency {
    private static final int WORKERS = 4;
    private static final int SAMPLES = 512;
    private static final int LENGTH = 65536;

    private static boolean match(Matcher matcher, String operation) {
        matcher.reset();
        return switch (operation) {
            case "find" -> matcher.find();
            case "matches" -> matcher.matches();
            case "lookingAt" -> matcher.lookingAt();
            default -> throw new IllegalArgumentException(operation);
        };
    }

    public static void main(String[] args) throws Exception {
        String operation = args.length == 0 ? "find" : args[0];
        String[] names = {"scan", "capture", "ambiguous", "bounded", "digit-run"};
        String[] expressions = {
            "error([0-9]+)", "([a-z]+)@([a-z]+)\\.[a-z]{2,4}",
            "((?:ab|a)+)([bc]+)", "\\A(?:[a-z]{1,64}|[0-9]{1,64})+\\z",
            "error([0-9]+)"
        };
        String[] inputs = {
            "!".repeat(LENGTH),
            "a".repeat(32766) + "@" + "b".repeat(32766) + ".co",
            "a".repeat(LENGTH - 2) + "bc",
            "abc01234".repeat(LENGTH / 8),
            "error" + "3".repeat(LENGTH - 5)
        };
        Field backend = Pattern.class.getDeclaredField("rustRegex");
        backend.setAccessible(true);
        for (int shape = 0; shape < expressions.length; shape++) {
            if (inputs[shape].length() != LENGTH) throw new AssertionError("region size");
            Pattern pattern = Pattern.compile(expressions[shape]);
            if (backend.get(pattern) == null) throw new AssertionError("Java backend: " + names[shape]);
            Matcher warm = pattern.matcher(inputs[shape]);
            for (int i = 0; i < 1200; i++) match(warm, operation);
            long[][] elapsed = new long[WORKERS][SAMPLES];
            CountDownLatch ready = new CountDownLatch(WORKERS + 1);
            CountDownLatch start = new CountDownLatch(1);
            CountDownLatch done = new CountDownLatch(WORKERS);
            List<Long> gc = new ArrayList<>();
            String input = inputs[shape];
            boolean hit = shape != 0;
            try (ExecutorService pool = Executors.newFixedThreadPool(WORKERS + 1)) {
                List<Future<?>> tasks = new ArrayList<>();
                for (int worker = 0; worker < WORKERS; worker++) {
                    int index = worker;
                    tasks.add(pool.submit(() -> {
                        Matcher matcher = pattern.matcher(input);
                        ready.countDown();
                        start.await();
                        try {
                            for (int sample = 0; sample < SAMPLES; sample++) {
                                long before = System.nanoTime();
                                boolean found = match(matcher, operation);
                                elapsed[index][sample] = System.nanoTime() - before;
                                if (found != hit) throw new AssertionError("unexpected result");
                            }
                        } finally {
                            done.countDown();
                        }
                        return null;
                    }));
                }
                Future<?> collection = pool.submit(() -> {
                    ready.countDown();
                    start.await();
                    do {
                        long before = System.nanoTime();
                        System.gc();
                        gc.add(System.nanoTime() - before);
                        Thread.sleep(1);
                    } while (done.getCount() != 0 && gc.size() < 32);
                    return null;
                });
                ready.await();
                start.countDown();
                for (Future<?> task : tasks) task.get();
                collection.get();
            }
            if (backend.get(pattern) == null) throw new AssertionError("promoted during measurement");
            long coldMax = 0;
            long[] steady = new long[WORKERS * (SAMPLES - 1)];
            int cursor = 0;
            for (long[] worker : elapsed) {
                coldMax = Math.max(coldMax, worker[0]);
                for (int i = 1; i < worker.length; i++) steady[cursor++] = worker[i];
            }
            Arrays.sort(steady);
            long gcMax = gc.stream().mapToLong(Long::longValue).max().orElseThrow();
            System.out.printf("{\"record\":\"latency\",\"shape\":\"%s\",\"operation\":\"%s\",\"length\":%d,"
                    + "\"workers\":%d,\"samplesPerWorker\":%d,\"coldMaxNs\":%d,"
                    + "\"steadyP99Ns\":%d,\"steadyMaxNs\":%d,\"gcCount\":%d,\"gcWallMaxNs\":%d}%n",
                    names[shape], operation, LENGTH, WORKERS, SAMPLES, coldMax,
                    steady[(int) Math.ceil(steady.length * 0.99) - 1],
                    steady[steady.length - 1], gc.size(), gcMax);
        }
    }
}
