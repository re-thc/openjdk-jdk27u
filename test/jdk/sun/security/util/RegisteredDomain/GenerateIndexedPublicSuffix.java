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
 * @summary Deterministic indexed PSL generation and compatibility fallback
 * @compile ${test.root}/../../make/jdk/src/classes/build/tools/publicsuffixlist/GeneratePublicSuffixList.java
 * @run main/othervm -Dfile.encoding=US-ASCII -Duser.language=tr GenerateIndexedPublicSuffix
 */

import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.zip.InflaterInputStream;
import build.tools.publicsuffixlist.GeneratePublicSuffixList;

public class GenerateIndexedPublicSuffix {
    public static void main(String[] args) throws Exception {
        Path directory = Files.createTempDirectory(Path.of("."), "generate-psl-");
        Path source = directory.resolve("source.txt");
        Path image = directory.resolve("image.dat");
        Path repeated = directory.resolve("repeated.dat");
        Path legacy = directory.resolve("legacy.zip");
        Path version = directory.resolve("VERSION");
        try {
            String rules = "test\nfoo.test\n*.wild.test\n!www.wild.test\n公司.cn\n"
                    + "// ===BEGIN PRIVATE DOMAINS===\nblog.test\n";
            Files.writeString(source, rules, StandardCharsets.UTF_8);
            Files.writeString(version, "independently versioned PSL\n", StandardCharsets.UTF_8);
            generate(source, image, version);
            generate(source, repeated, version);
            if (Files.mismatch(image, repeated) != -1) {
                throw new AssertionError("Nondeterministic output");
            }
            byte[] bytes = Files.readAllBytes(image);
            try (var in = new DataInputStream(new ByteArrayInputStream(bytes))) {
                if (in.readInt() != 0x50534c31 || in.readInt() != 2
                        || in.readInt() != bytes.length) {
                    throw new AssertionError("Incorrect self-describing header");
                }
                int directoryLength = in.readInt();
                if (!Arrays.equals(in.readNBytes(32), MessageDigest.getInstance("SHA-256")
                        .digest(Files.readAllBytes(source)))
                        || !Arrays.equals(in.readNBytes(32), MessageDigest.getInstance("SHA-256")
                        .digest(Files.readAllBytes(version)))) {
                    throw new AssertionError("Incorrect source/VERSION provenance");
                }
                if (in.readInt() != 2) {
                    throw new AssertionError("Expected two TLDs");
                }
                int extent = directoryLength;
                for (String expected : new String[] {"cn", "test"}) {
                    String name = new String(in.readNBytes(in.readUnsignedShort()),
                            StandardCharsets.UTF_8);
                    int offset = in.readInt();
                    int compressed = in.readInt();
                    int rawLength = in.readInt();
                    if (!name.equals(expected) || offset != extent || compressed <= 0
                            || offset > bytes.length - compressed || rawLength <= 0) {
                        throw new AssertionError("Incorrect directory entry");
                    }
                    extent += compressed;
                    try (var inflater = new InflaterInputStream(
                            new ByteArrayInputStream(bytes, offset, compressed))) {
                        if (inflater.readAllBytes().length != rawLength) {
                            throw new AssertionError("Incorrect shard size");
                        }
                    }
                }
                if (bytes.length - in.available() != directoryLength || extent != bytes.length) {
                    throw new AssertionError("Incorrect directory/image extent");
                }
            }
            // Sources accepted by the legacy generator remain buildable, even
            // when indexed syntax, precedence or format limits cannot represent them.
            for (String unsupported : new String[] {
                    "foo.*.test\n", "!foo\n", "*.test\nfoo.test\n",
                    "test\n// ===BEGIN PRIVATE DOMAINS===\ntest\n", "foo..test\n",
                    "a".repeat(65536) + ".test\n"}) {
                Files.writeString(source, unsupported, StandardCharsets.UTF_8);
                GeneratePublicSuffixList.main(new String[] {source.toString(), legacy.toString()});
                generate(source, image, version);
                if (Files.mismatch(image, legacy) != -1) {
                    throw new AssertionError("Fallback changed legacy ZIP output");
                }
            }
            System.out.println("PSL self-describing generation, reproducibility and ZIP fallback passed");
        } finally {
            for (Path path : new Path[] {source, image, repeated, legacy, version}) {
                Files.deleteIfExists(path);
            }
            Files.delete(directory);
        }
    }

    private static void generate(Path source, Path image, Path version) throws Exception {
        GeneratePublicSuffixList.main(new String[] {
                "--indexed", source.toString(), image.toString(), version.toString()});
    }
}
