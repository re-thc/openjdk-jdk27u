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
 * @test id=regular
 * @summary Bulk FileInputStream reads use fresh size and preserve early errors
 * @library /test/lib
 * @modules java.base/sun.nio.ch
 * @run main/othervm BulkReadMetadata regular
 */
/*
 * @test id=unix
 * @summary Bulk FileInputStream reads preserve pipe and zero-size pseudo-file behavior
 * @requires (os.family != "windows")
 * @library /test/lib
 * @modules java.base/sun.nio.ch
 * @run main/othervm BulkReadMetadata unix
 */

import java.io.*;
import java.nio.ByteBuffer;
import java.nio.channels.Pipe;
import java.nio.file.*;
import java.util.*;
import java.util.concurrent.*;

import jdk.test.lib.Utils;
import sun.nio.ch.SelChImpl;

import static java.nio.file.StandardOpenOption.*;

public class BulkReadMetadata {
    private static final long TIMEOUT = Utils.adjustTimeout(30_000);
    private static void check(boolean ok, String text) { if (!ok) throw new AssertionError(text); }
    private static void equal(byte[] actual, byte[] expected, String where) {
        check(Arrays.equals(actual, expected), where + ": length " + actual.length + " != " + expected.length);
    }
    private static byte[] bytes(int n) { byte[] b = new byte[n]; new Random(n).nextBytes(b); return b; }
    private static void regular() throws Exception {
        Path path = Files.createTempFile(Path.of("."), "bulk-metadata", ".dat");
        try {
            for (int size : new int[] {0, 1, 8191, 8192, 8193, 1024 * 1024}) {
                byte[] data = bytes(size); Files.write(path, data);
                try (var in = new FileInputStream(path.toFile())) { equal(in.readAllBytes(), data, "readAllBytes"); }
                try (var in = new FileInputStream(path.toFile())) { equal(in.readNBytes(size + 11), data, "readNBytes"); }
            }
            // Opening must not cache a size which can change before the first bulk read.
            byte[] initial = bytes(17), grown = bytes(8193);
            Files.write(path, initial);
            try (var in = new FileInputStream(path.toFile())) {
                Files.write(path, grown);
                equal(in.readNBytes(grown.length + 11), grown, "growth before first query");
            }
            Files.write(path, grown);
            try (var in = new FileInputStream(path.toFile())) {
                Files.write(path, initial);
                equal(in.readAllBytes(), initial, "truncate before first query");
            }
            // Kind can be reused; length must remain fresh after a successful query.
            Files.write(path, initial);
            try (var in = new FileInputStream(path.toFile())) {
                equal(in.readNBytes(1), Arrays.copyOf(initial, 1), "initial kind query");
                Files.write(path, grown);
                in.getChannel().position(0);
                equal(in.readNBytes(grown.length + 11), grown, "growth after kind query");
                Files.write(path, initial);
                in.getChannel().position(0);
                equal(in.readNBytes(grown.length), initial, "truncate after kind query");
                in.getChannel().position(3);
                equal(in.readAllBytes(), Arrays.copyOfRange(initial, 3, initial.length), "current position");
            }
            var closed = new FileInputStream(path.toFile()); closed.close();
            equal(closed.readNBytes(0), new byte[0], "zero after close");
            try { closed.readNBytes(-1); throw new AssertionError("negative length accepted"); }
            catch (IllegalArgumentException expected) { }
            for (boolean all : new boolean[] {false, true}) {
                try { if (all) closed.readAllBytes(); else closed.readNBytes(1); throw new AssertionError("closed read succeeded"); }
                catch (IOException expected) { }
            }
            // Subclass read dispatch must still participate in both bulk paths.
            Files.write(path, grown);
            for (boolean all : new boolean[] {false, true}) {
                try (var in = new FileInputStream(path.toFile()) {
                    @Override public int read(byte[] b, int off, int len) throws IOException {
                        return super.read(b, off, Math.min(len, 3));
                    }
                }) {
                    equal(all ? in.readAllBytes() : in.readNBytes(grown.length + 11), grown, "subclass short reads");
                }
            }
        } finally { Files.delete(path); }
        Path dir = Files.createTempDirectory(Path.of("."), "bulk-directory");
        try {
            try (var ignored = new FileInputStream(dir.toFile())) { throw new AssertionError("directory open succeeded"); }
            catch (FileNotFoundException expected) { }
        } finally { Files.delete(dir); }
    }
    private static void pipe(boolean all) throws Exception {
        Pipe pipe = Pipe.open(); byte[] data = bytes(8193);
        try (var source = pipe.source(); var sink = pipe.sink();
             var in = new FileInputStream(((SelChImpl) source).getFD()) {
                 // The channel owns this borrowed descriptor.
                 @Override public void close() { }
             }) {
            var sender = new FutureTask<Void>(() -> {
                try (sink) {
                    var buffer = ByteBuffer.wrap(data);
                    while (buffer.hasRemaining()) sink.write(buffer);
                }
                return null;
            });
            Thread worker = Thread.ofPlatform().start(sender);
            try {
                equal(all ? in.readAllBytes() : in.readNBytes(data.length + 11), data, "pipe fallback");
                sender.get(TIMEOUT, TimeUnit.MILLISECONDS);
            } finally { source.close(); sink.close(); worker.join(TIMEOUT); }
        }
    }
    private static void unix() throws Exception {
        pipe(false); pipe(true);
        try (var in = new FileInputStream("/dev/null")) { equal(in.readAllBytes(), new byte[0], "character device fallback"); }
        // /proc reports a regular file of size zero whose contents must still be read.
        Path proc = Path.of("/proc/self/cmdline");
        if (Files.exists(proc)) {
            try (var in = new FileInputStream(proc.toFile())) {
                check(in.readAllBytes().length > 0, "zero-size regular pseudo-file lost content");
            }
            try (var in = new FileInputStream(proc.toFile())) {
                check(in.readNBytes(1).length == 1, "zero-size regular pseudo-file readNBytes");
            }
            System.out.println("zero-size regular pseudo-file executed");
        }
    }
    public static void main(String[] args) throws Exception {
        if (args[0].equals("regular")) regular(); else unix();
    }
}
