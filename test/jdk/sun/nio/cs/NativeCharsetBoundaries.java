/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
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
 * @summary Check supported stream encodings and reject removed encodings at byte boundaries
 * @library /test/lib
 * @run main/othervm -Dstdout.encoding=UTF-8 -Dstderr.encoding=UTF-8 NativeCharsetBoundaries
 */

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.test.lib.process.ProcessTools;

public class NativeCharsetBoundaries {
    private static void checkBytes(String encoding, String value, byte[] expected) throws Exception {
        Process p = ProcessTools.createTestJavaProcessBuilder(
                "-Dstderr.encoding=UTF-8", "-Dstdout.encoding=" + encoding,
                NativeCharsetBoundaries.class.getName(), value).start();
        byte[] output = p.getInputStream().readAllBytes();
        byte[] error = p.getErrorStream().readAllBytes();
        if (p.waitFor() != 0 || !Arrays.equals(expected, output)) {
            throw new AssertionError(encoding + " output=" + Arrays.toString(output)
                    + " error=" + new String(error, StandardCharsets.UTF_8));
        }
    }

    private static void reject(String property) throws Exception {
        ProcessTools.executeTestJava("-Dstdout.encoding=UTF-8", "-Dstderr.encoding=UTF-8",
                "-D" + property + "=windows-1252",
                NativeCharsetBoundaries.class.getName(), "child")
                .shouldNotHaveExitValue(0).shouldContain("Unsupported " + property + ": windows-1252");
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            if (args[0].equals("locks")) {
                var consoleHeld = new java.util.concurrent.CountDownLatch(1);
                var systemHeld = new java.util.concurrent.CountDownLatch(1);
                var failure = new java.util.concurrent.atomic.AtomicReference<Throwable>();
                Thread first = new Thread(() -> {
                    synchronized (java.io.Console.class) {
                        consoleHeld.countDown();
                        try { systemHeld.await(); } catch (InterruptedException e) { throw new AssertionError(e); }
                        System.console();
                    }
                });
                Thread second = new Thread(() -> {
                    try { consoleHeld.await(); } catch (InterruptedException e) { throw new AssertionError(e); }
                    synchronized (System.class) {
                        systemHeld.countDown();
                        System.console();
                    }
                });
                first.setUncaughtExceptionHandler((thread, error) -> failure.compareAndSet(null, error));
                second.setUncaughtExceptionHandler((thread, error) -> failure.compareAndSet(null, error));
                first.setDaemon(true);
                second.setDaemon(true);
                first.start();
                second.start();
                first.join(5000);
                second.join(5000);
                if (first.isAlive() || second.isAlive()) {
                    throw new AssertionError("Console initialization deadlocked");
                }
                if (failure.get() != null) {
                    throw new AssertionError("Console initialization failed", failure.get());
                }
                System.out.print("no deadlock");
            } else if (args[0].equals("default")) {
                System.out.print(java.nio.charset.Charset.defaultCharset().name());
            } else if (args[0].equals("stdin")) {
                if (System.console() != null || System.console() != null) {
                    throw new AssertionError("Expected redirected streams");
                }
                try {
                    IO.readln();
                    throw new AssertionError("Unsupported stdin encoding accepted");
                } catch (java.nio.charset.UnsupportedCharsetException expected) {
                    System.out.print("rejected stdin");
                }
            } else {
                System.out.print(args[0].equals("unicode") ? "\u00e9" : "A");
            }
            return;
        }
        for (String[] entry : new String[][] {
                {"UTF8", "UTF-8"}, {"ISO8859_1", "ISO-8859-1"}, {"US-ASCII", "US-ASCII"}}) {
            ProcessTools.executeTestJava("-Dstdout.encoding=UTF-8", "-Dstderr.encoding=UTF-8",
                    "-Dfile.encoding=" + entry[0], NativeCharsetBoundaries.class.getName(), "default")
                    .shouldHaveExitValue(0).shouldContain(entry[1]);
        }
        String nativeEncoding = System.getProperty("native.encoding");
        if (java.nio.charset.Charset.isSupported(nativeEncoding)) {
            ProcessTools.executeTestJava("-Dstdout.encoding=UTF-8", "-Dstderr.encoding=UTF-8",
                    "-Dfile.encoding=COMPAT", NativeCharsetBoundaries.class.getName(), "default")
                    .shouldHaveExitValue(0)
                    .shouldContain(java.nio.charset.Charset.forName(nativeEncoding).name());
        }
        checkBytes("UTF-8", "unicode", new byte[] {(byte) 0xc3, (byte) 0xa9});
        checkBytes("ISO-8859-1", "unicode", new byte[] {(byte) 0xe9});
        checkBytes("US-ASCII", "ascii", new byte[] {'A'});
        ProcessTools.executeTestJava("-Dstdout.encoding=UTF-8", "-Dstderr.encoding=UTF-8",
                NativeCharsetBoundaries.class.getName(), "locks")
                .shouldHaveExitValue(0).shouldContain("no deadlock");
        reject("stdout.encoding");
        reject("stderr.encoding");
        ProcessTools.executeTestJava("-Dstdout.encoding=UTF-8", "-Dstderr.encoding=UTF-8",
                "-Dfile.encoding=windows-1252", NativeCharsetBoundaries.class.getName(), "child")
                .shouldNotHaveExitValue(0).shouldContain("Unsupported file.encoding: windows-1252");
        ProcessTools.executeTestJava("-Dstdout.encoding=UTF-8", "-Dstderr.encoding=UTF-8",
                "-Dfile.encoding=bad name", NativeCharsetBoundaries.class.getName(), "child")
                .shouldNotHaveExitValue(0).shouldContain("Unsupported file.encoding: bad name");
        ProcessTools.executeTestJava("-Dstderr.encoding=UTF-8", "-Dstdout.encoding=bad name",
                NativeCharsetBoundaries.class.getName(), "child")
                .shouldNotHaveExitValue(0).shouldContain("Unsupported stdout.encoding: bad name");
        ProcessTools.executeTestJava("-Dstdout.encoding=UTF-8", "-Dstderr.encoding=UTF-8",
                "-Dstdin.encoding=windows-1252",
                NativeCharsetBoundaries.class.getName(), "stdin")
                .shouldHaveExitValue(0).shouldContain("rejected stdin");
        ProcessTools.executeTestJava("--add-modules=jdk.internal.le", "-Djdk.console=jdk.internal.le",
                "-Dstdout.encoding=UTF-8", "-Dstderr.encoding=UTF-8", "-Dstdin.encoding=windows-1252",
                NativeCharsetBoundaries.class.getName(), "stdin")
                .shouldHaveExitValue(0).shouldContain("rejected stdin");
    }
}
