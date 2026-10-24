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
 * @summary Check local endpoints after classic socket bind, connect, and accept
 * @library /test/lib
 * @run main/othervm -Xcheck:jni LocalSocketPort
 * @run main/othervm -Djava.net.preferIPv4Stack=true LocalSocketPort
 * @run main/othervm -Djava.net.preferIPv6Addresses=true LocalSocketPort
 */

import java.net.BindException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Arrays;
import java.util.concurrent.FutureTask;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;

import jdk.test.lib.net.IPSupport;

public class LocalSocketPort {
    private static final byte[] PAYLOAD = { 0, 1, 2, 127, (byte) 128, (byte) 255 };
    private static final int TIMEOUT = 30_000;

    public static void main(String[] args) throws Exception {
        IPSupport.throwSkippedExceptionIfNonOperational();
        for (ThreadFactory factory : new ThreadFactory[] {
                Thread.ofPlatform().daemon().factory(), Thread.ofVirtual().factory() }) {
            if (IPSupport.hasIPv4()) {
                testAddress(factory, InetAddress.getByName("127.0.0.1"),
                        InetAddress.getByName("0.0.0.0"));
            }
            if (IPSupport.hasIPv6()) {
                testAddress(factory, InetAddress.getByName("::1"), InetAddress.getByName("::"));
            }
        }
    }

    private static void testAddress(ThreadFactory factory, InetAddress loopback,
                                    InetAddress wildcard) throws Exception {
        for (InetAddress serverAddress : new InetAddress[] { loopback, wildcard }) {
            for (boolean explicitPort : new boolean[] { false, true }) {
                // 0: implicitly bound by connect; 1: wildcard bind; 2: specific bind.
                for (int clientBind = 0; clientBind < 3; clientBind++) {
                    testConnection(factory, loopback, serverAddress, explicitPort, clientBind);
                }
            }
        }
    }

    private static void testConnection(ThreadFactory factory, InetAddress loopback,
                                       InetAddress serverAddress, boolean explicitPort,
                                       int clientBind) throws Exception {
        // Retrying is confined to the small window after an explicit-port reservation.
        for (int attempt = 0; ; attempt++) {
            try (ServerSocket server = new ServerSocket(); Socket client = new Socket()) {
                FutureTask<Void> task = new FutureTask<>(() -> {
                    System.out.printf("virtual=%s, address=%s, explicit=%s, clientBind=%d%n",
                            Thread.currentThread().isVirtual(), serverAddress,
                            explicitPort, clientBind);
                    check(server.getLocalPort() == -1, "New listener has a port");
                    check(client.getLocalPort() == -1, "New client has a port");
                    int requestedServerPort = explicitPort ? reservePort(serverAddress) : 0;
                    server.bind(new InetSocketAddress(serverAddress, requestedServerPort));
                    server.setSoTimeout(TIMEOUT);
                    int serverPort = server.getLocalPort();
                    check(serverPort > 0, "Listener has no local port");
                    if (explicitPort) {
                        check(serverPort == requestedServerPort, "Listener explicit port changed");
                    }
                    checkEndpoint(server.getLocalSocketAddress(), server.getInetAddress(), serverPort);
                    check(server.getInetAddress().equals(serverAddress), "Listener address changed");

                    int boundPort = 0;
                    if (clientBind != 0) {
                        InetAddress bindAddress = clientBind == 1
                                ? InetAddress.getByAddress(new byte[loopback.getAddress().length])
                                : loopback;
                        int requestedPort = explicitPort ? reservePort(bindAddress) : 0;
                        client.bind(new InetSocketAddress(bindAddress, requestedPort));
                        boundPort = client.getLocalPort();
                        check(boundPort > 0, "Bound client has no port");
                        if (explicitPort) {
                            check(boundPort == requestedPort, "Client explicit port changed");
                        }
                        checkEndpoint(client.getLocalSocketAddress(), client.getLocalAddress(), boundPort);
                        check(bindAddress.isAnyLocalAddress()
                                        ? client.getLocalAddress().isAnyLocalAddress()
                                        : client.getLocalAddress().equals(bindAddress),
                                "Bound address changed");
                    }

                    InetSocketAddress target = new InetSocketAddress(loopback, serverPort);
                    client.connect(target, TIMEOUT);
                    client.setSoTimeout(TIMEOUT);
                    try (Socket accepted = server.accept()) {
                        accepted.setSoTimeout(TIMEOUT);
                        int clientPort = client.getLocalPort();
                        check(clientPort > 0, "Connected client has no port");
                        check(client.getLocalAddress().equals(loopback), "Connected address is not loopback");
                        if (clientBind != 0) {
                            check(clientPort == boundPort, "Connect changed bound port");
                        }
                        checkEndpoint(client.getLocalSocketAddress(), loopback, clientPort);
                        checkEndpoint(accepted.getLocalSocketAddress(), loopback, serverPort);
                        checkEndpoint(accepted.getRemoteSocketAddress(), loopback, clientPort);
                        checkEndpoint(client.getRemoteSocketAddress(), loopback, serverPort);
                        check(accepted.getLocalPort() == serverPort, "Accepted local port differs");
                        check(accepted.getPort() == clientPort, "Accepted remote port differs");
                        check(accepted.getLocalAddress().equals(loopback), "Accepted local address differs");
                        check(accepted.getInetAddress().equals(loopback), "Accepted peer address differs");

                        client.getOutputStream().write(PAYLOAD);
                        check(Arrays.equals(accepted.getInputStream().readNBytes(PAYLOAD.length), PAYLOAD),
                                "Accepted payload mismatch");
                        accepted.getOutputStream().write(PAYLOAD);
                        check(Arrays.equals(client.getInputStream().readNBytes(PAYLOAD.length), PAYLOAD),
                                "Client payload mismatch");
                    }
                    check(server.getLocalPort() == serverPort, "Accept changed listener port");
                    int savedPort = client.getLocalPort();
                    client.close();
                    check(client.getLocalPort() == savedPort, "Close changed client port");
                    check(((InetSocketAddress) client.getLocalSocketAddress()).getPort() == savedPort,
                            "Closed endpoint port changed");
                    return null;
                });
                Thread thread = factory.newThread(task);
                thread.start();
                try {
                    task.get(60, TimeUnit.SECONDS);
                    return;
                } catch (java.util.concurrent.ExecutionException e) {
                    if (explicitPort && attempt < 4 && e.getCause() instanceof BindException) {
                        continue;
                    }
                    throw e;
                } finally {
                    // Also unblock the worker on a failed or timed-out run.
                    try {
                        client.close();
                    } finally {
                        try {
                            server.close();
                        } finally {
                            thread.join(TIMEOUT);
                            check(!thread.isAlive(), "Socket worker did not terminate");
                        }
                    }
                }
            }
        }
    }

    private static int reservePort(InetAddress address) throws Exception {
        try (ServerSocket reservation = new ServerSocket()) {
            reservation.bind(new InetSocketAddress(address, 0));
            return reservation.getLocalPort();
        }
    }

    private static void checkEndpoint(Object endpoint, InetAddress address, int port) {
        InetSocketAddress expected = new InetSocketAddress(address, port);
        check(expected.equals(endpoint), "Endpoint " + endpoint + " != " + expected);
    }

    private static void check(boolean condition, String message) {
        if (!condition) {
            throw new AssertionError(message);
        }
    }
}
