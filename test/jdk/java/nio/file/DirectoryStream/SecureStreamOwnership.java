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
 * @summary Secure directory streams share the descriptor owned by their directory stream
 * @requires (os.family == "linux" | os.family == "mac" | os.family == "aix")
 * @run junit/othervm SecureStreamOwnership
 */

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.file.ClosedDirectoryStreamException;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.SecureDirectoryStream;
import java.nio.file.StandardOpenOption;
import java.nio.file.attribute.BasicFileAttributeView;
import java.nio.file.attribute.FileTime;
import java.nio.file.attribute.PosixFileAttributeView;
import java.nio.file.attribute.PosixFilePermissions;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.EnumSource;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assumptions.assumeTrue;

public class SecureStreamOwnership {
    private static final Set<StandardOpenOption> READ = Set.of(StandardOpenOption.READ);
    private static final FileTime TIME = FileTime.fromMillis(1_234_560_000L);

    @TempDir
    Path root;

    @Test
    void descriptorBound() throws IOException {
        Path probe = Files.createFile(root.resolve("probe"));
        Path child = Files.createDirectory(root.resolve("child"));
        try (var stream = open(root)) {
            // Check secure-stream support before testing its resource bound.
        }
        Path descriptors = descriptorDirectory(probe);
        List<SecureDirectoryStream<Path>> streams = new ArrayList<>();
        try {
            for (int i = 0; i < 32; i++) {
                streams.add(open(root));
            }
            assertEquals(32, countDescriptors(descriptors, root),
                    "Each top-level stream should retain one descriptor");
        } finally {
            for (var stream : streams) {
                stream.close();
            }
        }
        assertEquals(0, countDescriptors(descriptors, root));
        streams.clear();
        try (var parent = open(root)) {
            try {
                for (int i = 0; i < 32; i++) {
                    streams.add(parent.newDirectoryStream(Path.of("child")));
                }
                assertEquals(32, countDescriptors(descriptors, child),
                        "Each nested stream should retain one descriptor");
            } finally {
                for (var stream : streams) {
                    stream.close();
                }
            }
            assertEquals(0, countDescriptors(descriptors, child));
        }
        assertEquals(0, countDescriptors(descriptors, root));
    }

    @Test
    void interleavedOperationsAfterRename() throws IOException {
        Path original = Files.createDirectory(root.resolve("original"));
        Path renamed = root.resolve("renamed");
        Path destination = Files.createDirectory(root.resolve("destination"));
        Files.createDirectory(original.resolve("child"));
        Set<String> remaining = new HashSet<>();
        remaining.add("child");
        // Enough long names to span multiple native directory-read buffers.
        for (int i = 0; i < 1024; i++) {
            String name = "entry-" + i + "-" + "x".repeat(80);
            Files.write(original.resolve(name), new byte[] { 42 });
            remaining.add(name);
        }
        String movable = remaining.stream().filter(s -> !s.equals("child")).findFirst().orElseThrow();
        try (var source = open(original); var target = open(destination)) {
            Files.move(original, renamed);
            Files.createDirectory(original);
            Files.writeString(original.resolve("replacement"), "unrelated");
            var directoryView = source.getFileAttributeView(PosixFileAttributeView.class);
            var permissions = directoryView.readAttributes().permissions();
            int count = 0;
            for (Path entry : source) {
                Path name = entry.getFileName();
                assertTrue(remaining.remove(name.toString()), "Unexpected or duplicate entry: " + name);
                var attrs = source.getFileAttributeView(name, BasicFileAttributeView.class).readAttributes();
                if (attrs.isRegularFile()) {
                    try (var channel = source.newByteChannel(name, READ)) {
                        ByteBuffer bytes = ByteBuffer.allocate(1);
                        assertEquals(1, channel.read(bytes));
                        assertEquals((byte) 42, bytes.get(0));
                    }
                } else {
                    assertTrue(attrs.isDirectory());
                }
                if (count++ % 32 == 0) {
                    directoryView.setTimes(TIME, null, null);
                    directoryView.setPermissions(permissions);
                    try (var child = source.newDirectoryStream(Path.of("child"))) {
                        assertFalse(child.iterator().hasNext());
                    }
                }
            }
            assertTrue(remaining.isEmpty(), "Missing directory entries: " + remaining.size());
            assertEquals(TIME, Files.getLastModifiedTime(renamed));
            source.move(Path.of(movable), target, Path.of("moved"));
            assertEquals(1, target.getFileAttributeView(Path.of("moved"),
                    BasicFileAttributeView.class).readAttributes().size());
            target.move(Path.of("moved"), source, Path.of(movable));
            source.deleteFile(Path.of(movable));
            source.deleteDirectory(Path.of("child"));
            assertEquals("unrelated", Files.readString(original.resolve("replacement")));
        }
    }

    @ParameterizedTest
    @EnumSource(Operation.class)
    void closeRaces(Operation operation) throws Exception {
        Path marker = Files.write(root.resolve("marker"), new byte[] { 42 });
        for (int round = 0; round < 8; round++) {
            Path dir = Files.createDirectory(root.resolve("source-" + round));
            Path dest = Files.createDirectory(root.resolve("target-" + round));
            Files.write(dir.resolve("file"), new byte[] { 1 });
            Files.createDirectory(dir.resolve("empty"));
            try (var source = open(dir); var target = open(dest)) {
                // Obtain the iterator before close; obtaining one after close is illegal.
                var iterator = source.iterator();
                var start = new CountDownLatch(1);
                var failure = new AtomicReference<Throwable>();
                Thread worker = new Thread(() -> {
                    try {
                        start.await();
                        operation.run(source, target, iterator);
                    } catch (ClosedDirectoryStreamException expected) {
                    } catch (Throwable t) {
                        failure.set(t);
                    }
                });
                worker.start();
                start.countDown();
                // Also close the destination of cross-stream moves in half the rounds.
                if (operation == Operation.MOVE && round % 2 == 0) {
                    target.close();
                } else {
                    source.close();
                }
                // Encourage reuse of the closed descriptor, and keep it live until the worker ends.
                try (var sentinel = FileChannel.open(marker)) {
                    worker.join();
                    if (failure.get() != null) {
                        throw new AssertionError(operation + " raced with close", failure.get());
                    }
                    ByteBuffer bytes = ByteBuffer.allocate(1);
                    assertEquals(1, sentinel.read(bytes));
                    assertEquals((byte) 42, bytes.get(0));
                }
                source.close();
                target.close();
            }
        }
    }

    private enum Operation {
        ITERATE, OPEN_CHILD, OPEN_FILE, READ_DIRECTORY_ATTRIBUTES, READ_FILE_ATTRIBUTES,
        READ_POSIX_ATTRIBUTES, SET_DIRECTORY_TIMES, SET_FILE_TIMES, SET_DIRECTORY_PERMISSIONS,
        SET_FILE_PERMISSIONS, DELETE_FILE, DELETE_DIRECTORY, MOVE;

        void run(SecureDirectoryStream<Path> source, SecureDirectoryStream<Path> target,
                 Iterator<Path> iterator) throws IOException {
            switch (this) {
                case ITERATE -> {
                    while (iterator.hasNext()) {
                        iterator.next();
                    }
                }
                case OPEN_CHILD -> source.newDirectoryStream(Path.of("empty")).close();
                case OPEN_FILE -> source.newByteChannel(Path.of("file"), READ).close();
                case READ_DIRECTORY_ATTRIBUTES -> source.getFileAttributeView(
                        BasicFileAttributeView.class).readAttributes();
                case READ_FILE_ATTRIBUTES -> source.getFileAttributeView(
                        Path.of("file"), BasicFileAttributeView.class).readAttributes();
                case READ_POSIX_ATTRIBUTES -> source.getFileAttributeView(
                        PosixFileAttributeView.class).readAttributes();
                case SET_DIRECTORY_TIMES -> source.getFileAttributeView(
                        BasicFileAttributeView.class).setTimes(TIME, null, null);
                case SET_FILE_TIMES -> source.getFileAttributeView(
                        Path.of("file"), BasicFileAttributeView.class).setTimes(TIME, null, null);
                case SET_DIRECTORY_PERMISSIONS -> source.getFileAttributeView(
                        PosixFileAttributeView.class).setPermissions(PosixFilePermissions.fromString("rwx------"));
                case SET_FILE_PERMISSIONS -> source.getFileAttributeView(
                        Path.of("file"), PosixFileAttributeView.class)
                        .setPermissions(PosixFilePermissions.fromString("rw-------"));
                case DELETE_FILE -> source.deleteFile(Path.of("file"));
                case DELETE_DIRECTORY -> source.deleteDirectory(Path.of("empty"));
                case MOVE -> source.move(Path.of("file"), target, Path.of("moved"));
            }
        }
    }

    private static SecureDirectoryStream<Path> open(Path path) throws IOException {
        var stream = Files.newDirectoryStream(path);
        if (stream instanceof SecureDirectoryStream<Path> secure) {
            return secure;
        }
        stream.close();
        assumeTrue(false, "SecureDirectoryStream is not supported");
        return null;
    }

    private static Path descriptorDirectory(Path file) throws IOException {
        try (var channel = FileChannel.open(file)) {
            for (Path directory : new Path[] { Path.of("/proc/self/fd"), Path.of("/dev/fd") }) {
                if (Files.isDirectory(directory) && countDescriptors(directory, file) == 1) {
                    return directory;
                }
            }
        }
        assumeTrue(false, "File descriptor identities are not available");
        return null;
    }

    private static int countDescriptors(Path directory, Path file) throws IOException {
        int count = 0;
        try (var stream = Files.newDirectoryStream(directory)) {
            for (Path entry : stream) {
                try {
                    if (Files.isSameFile(entry, file)) {
                        count++;
                    }
                } catch (NoSuchFileException expected) {
                    // Ignore unrelated descriptors that close during enumeration.
                }
            }
        }
        // The enumeration descriptors refer to directory, not file.
        return count;
    }
}
