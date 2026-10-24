/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
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
 *
 */

import java.lang.module.ModuleFinder;
import java.lang.management.ManagementFactory;
import java.util.Arrays;

/** Smoke tests for the server JDK and its compiler and serviceability tools. */
public class DevProfileSmoke {
    private DevProfileSmoke() {}

    static long compute(int count) {
        long value = 1;
        for (int i = 0; i < count; i++) value = value * 6364136223846793005L + i;
        return value;
    }

    /**
     * Run the smoke tests.
     * @param args unused
     * @throws Exception if a server facility fails
     */
    public static void main(String[] args) throws Exception {
        for (String module : new String[] { "java.desktop", "java.datatransfer", "java.se",
                "jdk.accessibility", "jdk.editpad", "jdk.hotspot.agent", "jdk.jconsole",
                "jdk.jpackage", "jdk.unsupported.desktop" }) {
            if (ModuleFinder.ofSystem().find(module).isPresent()) {
                throw new AssertionError("Unexpected desktop-dependent module: " + module);
            }
        }
        for (String module : new String[] { "jdk.compiler", "jdk.javadoc", "jdk.jdeps",
                "jdk.jshell", "jdk.jlink", "jdk.attach", "jdk.jdi", "jdk.management",
                "jdk.management.agent", "jdk.jfr", "java.sql", "java.naming", "jdk.unsupported" }) {
            if (ModuleFinder.ofSystem().find(module).isEmpty()) {
                throw new AssertionError("Missing server/development module: " + module);
            }
        }
        // Exercise allocation, collection, and native code under each supported GC.
        for (int i = 0; i < 10000; i++) {
            if (compute(100) != -235107049792752857L) throw new AssertionError("Compiled arithmetic");
        }
        for (int i = 0; i < 100; i++) {
            var bytes = new byte[1024 * 1024];
            Arrays.fill(bytes, (byte) i);
            if (bytes[bytes.length - 1] != (byte) i) {
                throw new AssertionError("Allocation or fill failed");
            }
        }
        System.gc();
        var failure = new java.util.concurrent.atomic.AtomicReference<Throwable>();
        try (var server = new java.net.ServerSocket(0, 1, java.net.InetAddress.getLoopbackAddress())) {
            var worker = Thread.ofVirtual().start(() -> {
                try (var socket = server.accept()) {
                    socket.getOutputStream().write(socket.getInputStream().read() + 1);
                } catch (Throwable ex) {
                    failure.set(ex);
                }
            });
            try (var client = new java.net.Socket(server.getInetAddress(), server.getLocalPort())) {
                client.setSoTimeout(10000);
                client.getOutputStream().write(41);
                if (client.getInputStream().read() != 42) throw new AssertionError("Socket round trip");
            }
            worker.join();
            if (failure.get() != null) throw new AssertionError(failure.get());
        }
        javax.net.ssl.SSLContext.getDefault().createSSLEngine();
        var digest = java.security.MessageDigest.getInstance("SHA-256");
        if (digest.digest(new byte[] { 1, 2, 3 }).length != 32) throw new AssertionError("SHA-256");
        ManagementFactory.getPlatformMBeanServer().getMBeanCount();
        try (var recording = new jdk.jfr.Recording()) {
            recording.start();
            recording.stop();
        }
        var jcmd = java.nio.file.Path.of(System.getProperty("java.home"), "bin",
                System.getProperty("os.name").startsWith("Windows") ? "jcmd.exe" : "jcmd");
        var process = new ProcessBuilder(jcmd.toString(), Long.toString(ProcessHandle.current().pid()),
                "VM.version").inheritIO().start();
        if (!process.waitFor(30, java.util.concurrent.TimeUnit.SECONDS) || process.exitValue() != 0) {
            process.destroyForcibly();
            throw new AssertionError("Attach/jcmd");
        }
        System.out.println(ManagementFactory.getGarbageCollectorMXBeans().stream()
                .map(bean -> bean.getName()).toList());
    }
}
