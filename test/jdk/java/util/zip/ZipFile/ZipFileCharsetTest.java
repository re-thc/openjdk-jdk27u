/*
 * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
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

import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

import org.junit.jupiter.api.Test;
import static java.nio.charset.StandardCharsets.ISO_8859_1;
import static java.nio.charset.StandardCharsets.US_ASCII;
import static java.nio.charset.StandardCharsets.UTF_16BE;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

/*
 * @test
 * @bug 8355975
 * @summary verify that the internal ZIP structure caching in java.util.zip.ZipFile
 *          uses the correct Charset when parsing the ZIP structure of a ZIP file
 * @run junit ZipFileCharsetTest
 */
public class ZipFileCharsetTest {

    /**
     * The internal implementation of java.util.zip.ZipFile maintains a cache
     * of the ZIP structure of each ZIP file that's currently open. This cache
     * helps prevent repeat parsing of the ZIP structure of the same underlying
     * ZIP file, every time a ZipFile instance is created for the same ZIP file.
     * The cache uses an internal key to map a ZIP file to the corresponding
     * ZIP structure that's cached.
     * A ZipFile can be constructed by passing a Charset which will be used to
     * decode the entry names (and comment) in a ZIP file.
     * The test verifies that when multiple ZipFile instances are
     * constructed using different Charsets but the same underlying ZIP file,
     * then the internal caching implementation of ZipFile doesn't end up using
     * a wrong Charset for parsing the ZIP structure of the ZIP file.
     */
    @Test
    void testCachedZipFileSource() throws Exception {
        // Both codecs decode these bytes successfully, but to distinct names.
        final byte[] entryNameBytes = new byte[]{(byte) 0xc2, (byte) 0xa4};
        final String utf16Name = new String(entryNameBytes, UTF_16BE);
        final String latin1Name = new String(entryNameBytes, ISO_8859_1);
        final Path zip = createZIP("charset-cache", UTF_16BE, entryNameBytes);
        try (ZipFile latin1 = new ZipFile(zip.toFile(), ISO_8859_1);
             ZipFile utf16 = new ZipFile(zip.toFile(), UTF_16BE)) {
            assertNotNull(utf16.getEntry(utf16Name), "UTF-16BE name missing");
            assertNull(utf16.getEntry(latin1Name), "Latin-1 name unexpectedly found");
            assertNotNull(latin1.getEntry(latin1Name), "Latin-1 name missing");
            assertNull(latin1.getEntry(utf16Name), "UTF-16BE name unexpectedly found");
        }
    }

    /**
     * Creates and return ZIP file whose entry names are encoded using the given {@code charset}
     */
    private static Path createZIP(final String fileNamePrefix, final Charset charset,
                                  final byte[] entryNameBytes) throws IOException {
        final Path zip = Files.createTempFile(Path.of("."), fileNamePrefix, ".zip");
        // create a ZIP file whose entry name(s) use the given charset
        try (ZipOutputStream zos = new ZipOutputStream(Files.newOutputStream(zip), charset)) {
            zos.putNextEntry(new ZipEntry(new String(entryNameBytes, charset)));
            final byte[] entryContent = "doesnotmatter".getBytes(US_ASCII);
            zos.write(entryContent);
            zos.closeEntry();
        }
        return zip;
    }
}
