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
 * @summary Positive, negative and stale caches work after numeric or hostname first use
 * @run main/othervm CacheAfterFirstUse 0 0 numeric
 * @run main/othervm CacheAfterFirstUse 0 0 hostname
 * @run main/othervm CacheAfterFirstUse -1 0 numeric
 * @run main/othervm CacheAfterFirstUse -1 0 hostname
 * @run main/othervm CacheAfterFirstUse 1 0 numeric
 * @run main/othervm CacheAfterFirstUse 1 0 hostname
 * @run main/othervm -Djava.net.preferIPv4Stack=true CacheAfterFirstUse 1 0 numeric
 * @run main/othervm -Djava.net.preferIPv6Addresses=true CacheAfterFirstUse 1 0 numeric
 * @run main/othervm CacheAfterFirstUse 1 3 numeric
 * @run main/othervm CacheAfterFirstUse 1 3 hostname
 */

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.Security;
import java.util.ArrayList;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class CacheAfterFirstUse {
    public static void main(String[] args) throws Exception {
        int ttl = Integer.parseInt(args[0]);
        int stale = Integer.parseInt(args[1]);
        Security.setProperty("networkaddress.cache.ttl", args[0]);
        Security.setProperty("networkaddress.cache.negative.ttl", args[0]);
        Security.setProperty("networkaddress.cache.stale.ttl", args[1]);
        Path hosts = Path.of("cache-first-use.hosts").toAbsolutePath();
        System.setProperty("jdk.net.hosts.file", hosts.toString());
        Files.writeString(hosts, "127.0.0.11 positive.test\n");
        if (args[2].equals("numeric")) {
            InetAddress.getByAddress(new byte[] {127, 0, 0, 1});
        }
        address("positive.test", "127.0.0.11");
        missing("negative.test");
        Files.writeString(hosts, "127.0.0.12 positive.test\n127.0.0.13 negative.test\n");

        if (ttl == -1) {
            concurrent("127.0.0.11", true, false);
        } else if (ttl == 0) {
            concurrent("127.0.0.12", false, false);
        } else if (stale == 0) {
            // Let both entries expire, then race their removal and replacement.
            Thread.sleep(1500);
            concurrent("127.0.0.12", false, true);
            // After all racing removals finish, both lookups must be fresh.
            address("positive.test", "127.0.0.12");
            address("negative.test", "127.0.0.13");
        } else {
            Files.writeString(hosts, "");
            Thread.sleep(1500);
            address("positive.test", "127.0.0.11");
            // A failed refresh must not extend the stale lifetime indefinitely.
            Thread.sleep(3100);
            missing("positive.test");
        }
    }

    private static void concurrent(String positive, boolean negative,
                                   boolean expiryRace) throws Exception {
        var start = new CountDownLatch(1);
        try (var executor = Executors.newVirtualThreadPerTaskExecutor()) {
            var futures = new ArrayList<Future<?>>();
            for (int i = 0; i < 100; i++) {
                futures.add(executor.submit(() -> {
                    start.await();
                    if (expiryRace) {
                        // Expiry-set removal precedes map removal. A racing lookup
                        // can still obtain the old record during that interval.
                        address("positive.test", positive, "127.0.0.11");
                        try {
                            address("negative.test", "127.0.0.13");
                        } catch (UnknownHostException oldNegativeEntry) {
                        }
                    } else {
                        address("positive.test", positive);
                        if (negative) {
                            missing("negative.test");
                        } else {
                            address("negative.test", "127.0.0.13");
                        }
                    }
                    return null;
                }));
            }
            start.countDown();
            for (var future : futures) {
                future.get();
            }
        }
    }

    private static void address(String host, String... expected) throws Exception {
        String actual = InetAddress.getByName(host).getHostAddress();
        for (String value : expected) {
            if (actual.equals(value)) {
                return;
            }
        }
        throw new AssertionError(host + ": " + actual + " not in " + String.join(", ", expected));
    }

    private static void missing(String host) throws Exception {
        try {
            InetAddress.getByName(host);
            throw new AssertionError("Unexpected address for " + host);
        } catch (UnknownHostException expected) {
        }
    }
}
