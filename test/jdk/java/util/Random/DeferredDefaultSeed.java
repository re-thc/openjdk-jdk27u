/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
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

/*
 * @test
 * @summary Explicit seeds must not obtain an automatic seed or delay the property snapshot
 * @library /test/lib
 * @modules java.base/jdk.internal.random
 * @run driver DeferredDefaultSeed
 */

import java.security.Provider;
import java.security.Security;
import java.security.SecureRandomSpi;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.random.RandomGenerator;
import jdk.test.lib.process.ProcessTools;

public class DeferredDefaultSeed {
    private static final String[] ALGORITHMS = {
        "java.util.SplittableRandom",
        "jdk.internal.random.L32X64MixRandom",
        "jdk.internal.random.L64X128MixRandom",
        "jdk.internal.random.L64X128StarStarRandom",
        "jdk.internal.random.L64X256MixRandom",
        "jdk.internal.random.L64X1024MixRandom",
        "jdk.internal.random.L128X128MixRandom",
        "jdk.internal.random.L128X256MixRandom",
        "jdk.internal.random.L128X1024MixRandom",
        "jdk.internal.random.Xoshiro256PlusPlus",
        "jdk.internal.random.Xoroshiro128PlusPlus"
    };
    private static final AtomicInteger seeds = new AtomicInteger();

    public static class SeedSource extends SecureRandomSpi {
        protected void engineSetSeed(byte[] seed) { }
        protected void engineNextBytes(byte[] bytes) { }
        protected byte[] engineGenerateSeed(int size) {
            if (size != 8) throw new AssertionError("seed size: " + size);
            seeds.incrementAndGet();
            return new byte[size];
        }
    }

    public static void main(String[] args) throws Exception {
        if (args.length == 0) {
            for (String name : ALGORITHMS) {
                for (boolean secure : new boolean[] {false, true}) {
                    ProcessTools.executeTestJava(
                        "--add-exports=java.base/jdk.internal.random=ALL-UNNAMED",
                        "-Djava.util.secureRandomSeed=" + secure,
                        DeferredDefaultSeed.class.getName(), name, "" + secure)
                        .shouldHaveExitValue(0);
                }
            }
            return;
        }
        boolean secure = Boolean.parseBoolean(args[1]);
        Provider provider = new Provider("SeedCounter", "1", "Seed counter") { };
        provider.put("SecureRandom.Counter", SeedSource.class.getName());
        Security.insertProviderAt(provider, 1);
        // Initialize the algorithm before changing the property, even without
        // invoking a constructor. This used to call RandomSupport.initialSeed().
        Class<?> type = Class.forName(args[0]);
        if (seeds.get() != 0) throw new AssertionError("seed obtained at class initialization");
        System.setProperty("java.util.secureRandomSeed", "" + !secure);
        var seeded = type.getConstructor(long.class);
        var a = (RandomGenerator) seeded.newInstance(42L);
        var b = (RandomGenerator) seeded.newInstance(42L);
        for (int i = 0; i < 100; i++) {
            if (a.nextLong() != b.nextLong()) throw new AssertionError("seeded sequence");
        }
        if (seeds.get() != 0) throw new AssertionError("seed obtained for explicit seed");

        // ConcurrentHashMap contention may initialize ThreadLocalRandom, whose
        // intentional secure seeding is independent of these algorithms.
        java.util.concurrent.ThreadLocalRandom.current();
        int priorSeeds = seeds.get();
        var automatic = type.getConstructor();
        Set<Long> values = ConcurrentHashMap.newKeySet();
        CountDownLatch start = new CountDownLatch(1);
        try (var executor = java.util.concurrent.Executors.newFixedThreadPool(8)) {
            var futures = new java.util.ArrayList<java.util.concurrent.Future<?>>();
            for (int t = 0; t < 8; t++) {
                futures.add(executor.submit(() -> {
                    start.await();
                    for (int i = 0; i < 64; i++) {
                        var rng = (RandomGenerator) automatic.newInstance();
                        if (!values.add(rng.nextLong())) throw new AssertionError("duplicate automatic seed");
                    }
                    return null;
                }));
            }
            start.countDown();
            for (var future : futures) future.get();
        }
        if (seeds.get() != priorSeeds + (secure ? 1 : 0)) {
            throw new AssertionError("property snapshot or per-algorithm seeding: " + seeds);
        }
    }
}
