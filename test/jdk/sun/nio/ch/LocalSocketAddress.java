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
 * @summary Check native local socket endpoint, address-only, and port-only queries
 * @library /test/lib
 * @modules java.base/sun.nio.ch:+open
 * @run main/othervm -Xcheck:jni LocalSocketAddress
 * @run main/othervm -Djava.net.preferIPv4Stack=true LocalSocketAddress
 * @run main/othervm -Djava.net.preferIPv6Addresses=true LocalSocketAddress
 */

import java.io.FileDescriptor;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.BindException;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.StandardProtocolFamily;
import java.nio.ByteBuffer;
import java.nio.channels.DatagramChannel;
import java.nio.channels.NetworkChannel;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.util.Arrays;

import jdk.test.lib.Platform;
import jdk.test.lib.net.IPSupport;
import sun.nio.ch.Net;
import sun.nio.ch.SelChImpl;

public class LocalSocketAddress {
    private static final byte[] PAYLOAD = { 0, 1, 2, 127, (byte) 128, (byte) 255 };
    private static final long TIMEOUT_NANOS = 30_000_000_000L;
    private static final Method LOCAL_PORT;
    private static final Method LOCAL_PORT_STRICT;
    private static final Method LOCAL_INET_ADDRESS;

    static {
        try {
            LOCAL_PORT = Net.class.getDeclaredMethod("localPort", FileDescriptor.class);
            LOCAL_PORT.setAccessible(true);
            LOCAL_PORT_STRICT = Net.class.getDeclaredMethod("localPortStrict", FileDescriptor.class);
            LOCAL_PORT_STRICT.setAccessible(true);
            LOCAL_INET_ADDRESS = Net.class.getDeclaredMethod("localInetAddress", FileDescriptor.class);
            LOCAL_INET_ADDRESS.setAccessible(true);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    enum Kind {
        STREAM, LISTENER, DATAGRAM;

        NetworkChannel open(StandardProtocolFamily family) throws IOException {
            return switch (this) {
                case STREAM -> SocketChannel.open(family);
                case LISTENER -> ServerSocketChannel.open(family);
                case DATAGRAM -> DatagramChannel.open(family);
            };
        }
    }

    public static void main(String[] args) throws Exception {
        IPSupport.throwSkippedExceptionIfNonOperational();
        expectSocketException(() -> Net.localAddress(new FileDescriptor()));
        expectSocketException(() -> localPort(new FileDescriptor()));
        expectSocketException(() -> localPortStrict(new FileDescriptor()));
        expectSocketException(() -> localInetAddress(new FileDescriptor()));
        if (IPSupport.hasIPv4()) {
            testFamily(StandardProtocolFamily.INET, InetAddress.getByName("127.0.0.1"),
                    InetAddress.getByName("0.0.0.0"));
        }
        if (IPSupport.hasIPv6()) {
            testFamily(StandardProtocolFamily.INET6, InetAddress.getByName("::1"),
                    InetAddress.getByName("::"));
            // An IPv4 address on a dual-stack socket must be returned as Inet4Address.
            if (IPSupport.hasIPv4()) {
                for (Kind kind : Kind.values()) {
                    testBind(kind, StandardProtocolFamily.INET6,
                            InetAddress.getByName("127.0.0.1"), false);
                }
            }
            testScopedAddress();
        } else {
            System.out.println("Skipping IPv6: unavailable");
        }
    }

    private static void testFamily(StandardProtocolFamily family, InetAddress loopback,
                                   InetAddress wildcard) throws Exception {
        System.out.println("Testing " + family);
        for (Kind kind : Kind.values()) {
            try (NetworkChannel channel = kind.open(family)) {
                check(channel.getLocalAddress() == null, "New channel is bound");
                FileDescriptor fd = fd(channel);
                if (Platform.isWindows()) {
                    expectSocketException(() -> Net.localAddress(fd));
                    check(localPort(fd) == 0, "Nonzero unbound legacy native port");
                    expectSocketException(() -> localPortStrict(fd));
                    expectSocketException(() -> localInetAddress(fd));
                } else {
                    InetSocketAddress actual = Net.localAddress(fd);
                    checkAddress(actual.getAddress(), wildcard);
                    checkAddress(localInetAddress(fd), actual.getAddress());
                    check(actual.getPort() == 0, "Unbound port: " + actual);
                    check(localPort(fd) == 0, "Nonzero unbound legacy native port");
                    check(localPortStrict(fd) == 0, "Nonzero unbound strict native port");
                }
            }
            for (InetAddress address : new InetAddress[] { wildcard, loopback }) {
                testBind(kind, family, address, false);
                testBind(kind, family, address, true);
            }
            NetworkChannel channel = kind.open(family);
            FileDescriptor fd = fd(channel);
            channel.close();
            expectSocketException(() -> Net.localAddress(fd));
            expectSocketException(() -> localPort(fd));
            expectSocketException(() -> localPortStrict(fd));
            expectSocketException(() -> localInetAddress(fd));
        }
        testStream(family, loopback, wildcard);
        testDatagram(family, loopback);
    }

    private static void testBind(Kind kind, StandardProtocolFamily family,
                                 InetAddress address, boolean explicit) throws Exception {
        // Retry only a collision between releasing a reservation and the explicit bind.
        for (int attempt = 0; ; attempt++) {
            int port = 0;
            if (explicit) {
                try (NetworkChannel reservation = kind.open(family)) {
                    reservation.bind(new InetSocketAddress(address, 0));
                    port = ((InetSocketAddress) reservation.getLocalAddress()).getPort();
                }
            }
            try (NetworkChannel channel = kind.open(family)) {
                try {
                    channel.bind(new InetSocketAddress(address, port));
                } catch (BindException e) {
                    if (explicit && attempt < 4) {
                        continue;
                    }
                    throw e;
                }
                InetSocketAddress actual = checkEndpoint(channel);
                checkAddress(actual.getAddress(), address);
                check(actual.getPort() > 0, "No ephemeral port: " + actual);
                if (explicit) {
                    check(actual.getPort() == port, "Explicit port changed: " + actual);
                }
                return;
            }
        }
    }

    private static void testScopedAddress() throws Exception {
        for (NetworkInterface nif : NetworkInterface.networkInterfaces().toList()) {
            if (nif.isUp()) {
                for (InetAddress address : nif.inetAddresses().toList()) {
                    if (address instanceof Inet6Address a
                            && a.isLinkLocalAddress() && a.getScopeId() != 0) {
                        System.out.println("Testing scoped address " + a);
                        for (Kind kind : Kind.values()) {
                            testBind(kind, StandardProtocolFamily.INET6, a, false);
                        }
                        return;
                    }
                }
            }
        }
        System.out.println("Skipping scoped IPv6: no configured link-local address");
    }

    private static void testStream(StandardProtocolFamily family, InetAddress loopback,
                                   InetAddress wildcard) throws Exception {
        for (boolean bindClient : new boolean[] { false, true }) {
            try (ServerSocketChannel listener = ServerSocketChannel.open(family);
                 SocketChannel client = SocketChannel.open(family)) {
                listener.bind(new InetSocketAddress(wildcard, 0));
                InetSocketAddress listening = checkEndpoint(listener);
                int boundPort = 0;
                if (bindClient) {
                    client.bind(new InetSocketAddress(wildcard, 0));
                    boundPort = checkEndpoint(client).getPort();
                }
                client.socket().connect(new InetSocketAddress(loopback, listening.getPort()),
                        30_000);
                listener.socket().setSoTimeout(30_000);
                try (SocketChannel accepted = listener.socket().accept().getChannel()) {
                    InetSocketAddress local = checkEndpoint(client);
                    InetSocketAddress peer = checkEndpoint(accepted);
                    checkAddress(local.getAddress(), loopback);
                    checkAddress(peer.getAddress(), loopback);
                    check(peer.getPort() == listening.getPort(), "Accepted port changed");
                    check(local.equals(accepted.getRemoteAddress()), "Accepted peer mismatch");
                    check(peer.equals(client.getRemoteAddress()), "Client peer mismatch");
                    if (bindClient) {
                        check(local.getPort() == boundPort, "Connect changed bound port");
                    }
                    client.configureBlocking(false);
                    accepted.configureBlocking(false);
                    transfer(client, accepted);
                    transfer(accepted, client);
                    checkEndpoint(listener);
                    checkEndpoint(client);
                    checkEndpoint(accepted);
                }
            }
        }
    }

    private static void transfer(SocketChannel sender, SocketChannel receiver) throws Exception {
        long deadline = System.nanoTime() + TIMEOUT_NANOS;
        ByteBuffer output = ByteBuffer.wrap(PAYLOAD);
        ByteBuffer input = ByteBuffer.allocate(PAYLOAD.length);
        while (output.hasRemaining() || input.hasRemaining()) {
            if (output.hasRemaining()) {
                sender.write(output);
            }
            if (input.hasRemaining()) {
                check(receiver.read(input) >= 0, "Premature stream EOF");
            }
            check(System.nanoTime() < deadline, "Stream transfer timed out");
            Thread.sleep(1);
        }
        check(Arrays.equals(input.array(), PAYLOAD), "Stream payload mismatch");
    }

    private static void testDatagram(StandardProtocolFamily family, InetAddress loopback)
            throws Exception {
        try (DatagramChannel receiver = DatagramChannel.open(family);
             DatagramChannel sender = DatagramChannel.open(family)) {
            receiver.bind(new InetSocketAddress(loopback, 0));
            receiver.configureBlocking(false);
            sender.configureBlocking(false);
            InetSocketAddress destination = checkEndpoint(receiver);

            // send implicitly binds the sender; connect and disconnect refresh its address.
            sendDatagram(sender, receiver, destination, false);
            int port = checkEndpoint(sender).getPort();
            sender.connect(destination);
            InetSocketAddress connected = checkEndpoint(sender);
            checkAddress(connected.getAddress(), loopback);
            check(connected.getPort() == port, "UDP connect changed port");
            sendDatagram(sender, receiver, destination, true);
            sender.disconnect();
            check(!sender.isConnected(), "UDP disconnect failed");
            check(checkEndpoint(sender).getPort() == port, "UDP disconnect changed port");
            sendDatagram(sender, receiver, destination, false);
            checkEndpoint(sender);
            checkEndpoint(receiver);
        }
    }

    private static void sendDatagram(DatagramChannel sender, DatagramChannel receiver,
                                     InetSocketAddress destination, boolean connected)
            throws Exception {
        long deadline = System.nanoTime() + TIMEOUT_NANOS;
        ByteBuffer output = ByteBuffer.wrap(PAYLOAD);
        while ((connected ? sender.write(output) : sender.send(output, destination)) == 0) {
            check(System.nanoTime() < deadline, "Datagram send timed out");
            Thread.sleep(1);
        }
        ByteBuffer input = ByteBuffer.allocate(PAYLOAD.length + 1);
        InetSocketAddress source;
        while ((source = (InetSocketAddress) receiver.receive(input)) == null) {
            check(System.nanoTime() < deadline, "Datagram receive timed out");
            Thread.sleep(1);
        }
        check(input.position() == PAYLOAD.length, "Datagram length mismatch");
        check(Arrays.equals(Arrays.copyOf(input.array(), input.position()), PAYLOAD),
                "Datagram payload mismatch");
        check(source.getPort() == checkEndpoint(sender).getPort(), "UDP source port mismatch");
        checkAddress(source.getAddress(), destination.getAddress());
    }

    private static FileDescriptor fd(NetworkChannel channel) {
        return ((SelChImpl) channel).getFD();
    }

    private static InetSocketAddress checkEndpoint(NetworkChannel channel) throws Exception {
        InetSocketAddress expected = (InetSocketAddress) channel.getLocalAddress();
        InetSocketAddress actual = Net.localAddress(fd(channel));
        check(actual.equals(expected), "Native endpoint " + actual + " != " + expected);
        checkAddress(actual.getAddress(), expected.getAddress());
        checkAddress(localInetAddress(fd(channel)), actual.getAddress());
        check(localPort(fd(channel)) == actual.getPort(), "Legacy native port differs: " + actual);
        check(localPortStrict(fd(channel)) == actual.getPort(), "Strict native port differs: " + actual);
        return actual;
    }

    private static void checkAddress(InetAddress actual, InetAddress expected) {
        check(Arrays.equals(actual.getAddress(), expected.getAddress())
                        && actual.getClass() == expected.getClass(),
                "Address " + actual + " != " + expected);
        if (expected instanceof Inet6Address e && actual instanceof Inet6Address a) {
            check(a.getScopeId() == e.getScopeId(), "Scope " + a + " != " + e);
        }
    }

    private static int localPort(FileDescriptor fd) throws Exception {
        return (int) invoke(LOCAL_PORT, fd);
    }

    private static int localPortStrict(FileDescriptor fd) throws Exception {
        return (int) invoke(LOCAL_PORT_STRICT, fd);
    }

    private static InetAddress localInetAddress(FileDescriptor fd) throws Exception {
        return (InetAddress) invoke(LOCAL_INET_ADDRESS, fd);
    }

    private static Object invoke(Method method, FileDescriptor fd) throws Exception {
        try {
            return method.invoke(null, fd);
        } catch (InvocationTargetException e) {
            if (e.getCause() instanceof Exception cause) {
                throw cause;
            }
            throw e;
        }
    }

    @FunctionalInterface
    interface Operation {
        void run() throws Exception;
    }

    private static void expectSocketException(Operation operation) throws Exception {
        try {
            operation.run();
            throw new AssertionError("Expected SocketException");
        } catch (SocketException expected) {
        }
    }

    private static void check(boolean condition, String message) {
        if (!condition) {
            throw new AssertionError(message);
        }
    }
}
