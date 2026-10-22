/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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
 * @summary DNS cache collections are initialized only for hostname lookups
 * @modules java.base/jdk.internal.misc
 * @run main/othervm LazyCacheInitialization numeric
 * @run main/othervm -Djava.net.preferIPv4Stack=true LazyCacheInitialization numeric
 * @run main/othervm -Djava.net.preferIPv6Addresses=true LazyCacheInitialization numeric
 * @run main/othervm LazyCacheInitialization hostname
 * @run main/othervm LazyCacheInitialization concurrent
 * @run main/othervm LazyCacheInitialization canonical
 */

import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.UnknownHostException;
import java.nio.channels.ServerSocketChannel;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import jdk.internal.misc.Unsafe;

public class LazyCacheInitialization {
    private static Class<?> cacheHolder;

    public static void main(String[] args) throws Exception {
        Path hosts = Path.of("lazy-cache-init.hosts").toAbsolutePath();
        Files.writeString(hosts, "127.0.0.11 lazy-cache.test\n");
        System.setProperty("jdk.net.hosts.file", hosts.toString());
        Class.forName("java.net.InetAddress", true, null);
        cacheHolder = Class.forName("java.net.InetAddress$CacheHolder", false, null);
        checkInitialized(false);

        switch (args[0]) {
            case "numeric" -> {
                InetAddress.getByAddress(new byte[] {127, 0, 0, 1});
                InetAddress.getByAddress("label", new byte[16]);
                InetAddress.getByName("127.0.0.1");
                InetAddress.getByName("::1");
                InetAddress.getLoopbackAddress();
                InetAddress.getByName(null);
                InetAddress.getByName("");
                checkInitialized(false);
                try (var socket = new ServerSocket()) {
                    socket.bind(new InetSocketAddress(
                            InetAddress.getByName("127.0.0.1"), 0));
                }
                try (var channel = ServerSocketChannel.open()) {
                    channel.bind(new InetSocketAddress(
                            InetAddress.getByName("127.0.0.1"), 0));
                }
                checkInitialized(false);
                lookup(false);
            }
            case "hostname" -> lookup(false);
            case "canonical" -> {
                String name = InetAddress.getByName("127.0.0.11").getCanonicalHostName();
                if (!name.equals("lazy-cache.test")) {
                    throw new AssertionError("Unexpected canonical name: " + name);
                }
            }
            case "concurrent" -> {
                // Both successful and failed first lookups race holder initialization.
                var start = new CountDownLatch(1);
                var ready = new CountDownLatch(100);
                try (var executor = Executors.newVirtualThreadPerTaskExecutor()) {
                    var futures = new ArrayList<Future<?>>();
                    for (int i = 0; i < 100; i++) {
                        boolean negative = (i & 1) != 0;
                        futures.add(executor.submit(() -> {
                            ready.countDown();
                            start.await();
                            lookup(negative);
                            return null;
                        }));
                    }
                    ready.await();
                    start.countDown();
                    for (var future : futures) {
                        future.get();
                    }
                }
            }
            default -> throw new IllegalArgumentException(args[0]);
        }
        checkInitialized(true);
    }

    private static void lookup(boolean negative) throws Exception {
        String host = negative ? "missing.test" : "lazy-cache.test";
        try {
            String address = InetAddress.getByName(host).getHostAddress();
            if (negative || !address.equals("127.0.0.11")) {
                throw new AssertionError("Unexpected address for " + host + ": " + address);
            }
        } catch (UnknownHostException e) {
            if (!negative) {
                throw e;
            }
        }
    }

    private static void checkInitialized(boolean expected) {
        if (Unsafe.getUnsafe().shouldBeInitialized(cacheHolder) == expected) {
            throw new AssertionError("CacheHolder initialized: expected " + expected);
        }
    }
}
