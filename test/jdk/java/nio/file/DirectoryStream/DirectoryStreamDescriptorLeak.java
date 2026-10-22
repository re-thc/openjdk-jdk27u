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
 * @summary Failed secure directory opens must close both file descriptors
 * @requires (os.family == "linux" | os.family == "mac" | os.family == "aix")
 * @run junit/othervm DirectoryStreamDescriptorLeak
 */

import java.io.IOException;
import java.nio.channels.FileChannel;
import java.nio.file.ClosedDirectoryStreamException;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.NoSuchFileException;
import java.nio.file.NotDirectoryException;
import java.nio.file.Path;
import java.nio.file.SecureDirectoryStream;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assumptions.assumeTrue;

public class DirectoryStreamDescriptorLeak {
    @TempDir
    Path root;

    @Test
    void failedOpen() throws IOException {
        Path file = Files.createFile(root.resolve("regular"));
        Path child = Files.createDirectory(root.resolve("child"));
        try (var stream = Files.newDirectoryStream(root)) {
            var secure = secureStream(stream);
            Path descriptors = descriptorDirectory(file);
            assertEquals(0, countDescriptors(descriptors, file));
            for (int i = 0; i < 32; i++) {
                LinkOption[] options = (i % 2 == 0) ? new LinkOption[0]
                        : new LinkOption[] { LinkOption.NOFOLLOW_LINKS };
                var exception = assertThrows(NotDirectoryException.class, () -> {
                    try (var unexpected = secure.newDirectoryStream(Path.of("regular"), options)) {
                        // Closing here also handles an unexpected successful open.
                    }
                });
                assertEquals("regular", exception.getFile());
            }
            assertEquals(0, countDescriptors(descriptors, file),
                    "Failed opens leaked descriptors for the regular file");
            assertThrows(NoSuchFileException.class, () ->
                    secure.newDirectoryStream(Path.of("missing")).close());
            try (var nested = secure.newDirectoryStream(Path.of("child"))) {
                assertFalse(nested.iterator().hasNext());
                assertTrue(countDescriptors(descriptors, child) > 0);
            }
            assertEquals(0, countDescriptors(descriptors, child),
                    "Successful open leaked descriptors for the child directory");
        }
    }

    @Test
    void childOutlivesParent() throws IOException {
        Path child = Files.createDirectory(root.resolve("child"));
        Files.createDirectory(child.resolve("grandchild"));
        Files.createFile(child.resolve("regular"));
        try (var stream = Files.newDirectoryStream(root)) {
            var parent = secureStream(stream);
            try (var nested = parent.newDirectoryStream(Path.of("child"))) {
                parent.close();
                assertThrows(ClosedDirectoryStreamException.class, () ->
                        parent.newDirectoryStream(Path.of("child")).close());
                assertThrows(NotDirectoryException.class, () ->
                        nested.newDirectoryStream(Path.of("regular")).close());
                // The child must retain both its iteration and relative-open descriptors.
                assertEquals(2, countEntries(nested));
                try (var grandchild = nested.newDirectoryStream(Path.of("grandchild"),
                        LinkOption.NOFOLLOW_LINKS)) {
                    assertEquals(0, countEntries(grandchild));
                }
            }
        }
    }

    private static SecureDirectoryStream<Path> secureStream(DirectoryStream<Path> stream) {
        assumeTrue(stream instanceof SecureDirectoryStream,
                "SecureDirectoryStream is not supported");
        return (SecureDirectoryStream<Path>) stream;
    }

    private static int countEntries(DirectoryStream<Path> stream) {
        int count = 0;
        for (Path ignored : stream) {
            count++;
        }
        return count;
    }

    private static Path descriptorDirectory(Path file) throws IOException {
        // Calibrate against a known open file: some Unix systems do not expose
        // descriptor identities through these directories.
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
                    // An unrelated descriptor may close during enumeration.
                }
            }
        }
        // Descriptors opened by enumeration refer to its directory, not file.
        return count;
    }
}
