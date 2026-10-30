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
 * @summary Rejected Unix asynchronous channel construction closes its socket
 * @requires (os.family == "linux")
 * @modules java.base/sun.nio.ch
 * @compile --patch-module java.base=${test.src} ConstructorRegistrationFailure.java
 * @run main/othervm --patch-module java.base=${test.classes} -Xcheck:jni sun.nio.ch.ConstructorRegistrationFailure
 * @run main/othervm --patch-module java.base=${test.classes} -Djava.net.preferIPv4Stack=true sun.nio.ch.ConstructorRegistrationFailure
 */

package sun.nio.ch;

import java.io.IOException;
import java.nio.channels.ShutdownChannelGroupException;
import java.nio.channels.spi.AsynchronousChannelProvider;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.TimeUnit;

public class ConstructorRegistrationFailure {
    private static final long WAIT_SECONDS = 30;

    // No poller threads or background socket owners can race the census.
    private static class TestPort extends Port {
        TestPort() {
            super(AsynchronousChannelProvider.provider(),
                    ThreadPool.create(1, Thread.ofPlatform().daemon().factory()));
        }
        @Override void startPoll(int fd, int events) { }
        @Override void executeOnHandlerTask(Runnable task) { executor().execute(task); }
        @Override void shutdownHandlerTasks() { }

        void checkRegistered(int fd, PollableChannel channel) {
            fdToChannelLock.readLock().lock();
            try {
                check(fdToChannel.get(fd) == channel, "Missing channel registration");
            } finally {
                fdToChannelLock.readLock().unlock();
            }
        }
    }

    public static void main(String[] args) throws Exception {
        test(false);
        test(true);
    }

    private static void test(boolean shutdownNow) throws Exception {
        TestPort port = new TestPort();
        try {
            // Warm up both constructors and close before taking the census:
            // initializing UnixDispatcher may retain its own pre-close socket.
            try (var client = new UnixAsynchronousSocketChannelImpl(port);
                 var listener = new UnixAsynchronousServerSocketChannelImpl(port)) {
                port.checkRegistered(IOUtil.fdVal(client.fd), client);
                port.checkRegistered(IOUtil.fdVal(listener.fd), listener);
            }
            check(port.isEmpty(), "Successful close retained a registration");
            Map<Integer, String> before = sockets();
            // Keep this already registered channel alive for shutdown(), so
            // rejection is also checked before the group has terminated.
            var survivor = new UnixAsynchronousSocketChannelImpl(port);
            try (survivor) {
                int survivorFd = IOUtil.fdVal(survivor.fd);
                if (shutdownNow) {
                    port.shutdownNow();
                    check(!survivor.isOpen(), "shutdownNow did not close the channel");
                } else {
                    port.shutdown();
                    check(survivor.isOpen(), "shutdown closed the existing channel");
                    port.checkRegistered(survivorFd, survivor);
                }
                checkRejected(port);
                if (!shutdownNow) {
                    port.checkRegistered(survivorFd, survivor);
                }
            }
            check(port.awaitTermination(WAIT_SECONDS, TimeUnit.SECONDS),
                    "Group did not terminate");
            check(port.isEmpty(), "Group retained a registration");
            checkRejected(port);
            Map<Integer, String> after = sockets();
            check(after.equals(before), "Constructor cleanup changed socket ownership: "
                    + before + " -> " + after);
            System.out.println("Passed shutdownNow=" + shutdownNow);
        } finally {
            port.shutdownNow();
            check(port.awaitTermination(WAIT_SECONDS, TimeUnit.SECONDS),
                    "Test port did not terminate");
        }
    }

    private static void checkRejected(TestPort port) throws Exception {
        Map<Integer, String> before = sockets();
        for (int i = 0; i < 16; i++) {
            try (var ignored = new UnixAsynchronousSocketChannelImpl(port)) {
                throw new AssertionError("Client registered after shutdown");
            } catch (ShutdownChannelGroupException expected) {
                check(expected.getClass() == ShutdownChannelGroupException.class,
                        "Client rejection type changed");
                check(expected.getSuppressed().length == 0,
                        "Unexpected client cleanup failure");
            }
            try (var ignored = new UnixAsynchronousServerSocketChannelImpl(port)) {
                throw new AssertionError("Listener registered after shutdown");
            } catch (ShutdownChannelGroupException expected) {
                check(expected.getClass() == ShutdownChannelGroupException.class,
                        "Listener rejection type changed");
                check(expected.getSuppressed().length == 0,
                        "Unexpected listener cleanup failure");
            }
        }
        Map<Integer, String> after = sockets();
        check(after.equals(before), "Rejected construction leaked or closed sockets: "
                + before + " -> " + after);
    }

    private static Map<Integer, String> sockets() throws IOException {
        Map<Integer, String> sockets = new TreeMap<>();
        try (var entries = Files.list(Path.of("/proc/self/fd"))) {
            for (Path entry : entries.toList()) {
                try {
                    String target = Files.readSymbolicLink(entry).toString();
                    if (target.startsWith("socket:[")) {
                        sockets.put(Integer.valueOf(entry.getFileName().toString()), target);
                    }
                } catch (NoSuchFileException ignored) {
                    // A directory descriptor from Files.list may have closed.
                }
            }
        }
        return sockets;
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
