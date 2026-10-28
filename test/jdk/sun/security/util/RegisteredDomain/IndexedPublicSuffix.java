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
 * @summary Indexed public suffix matching, concurrent loading and resource replacement
 * @modules java.base/sun.security.util
 * @run main/othervm IndexedPublicSuffix
 */

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeSet;
import java.util.concurrent.Callable;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.Executors;
import java.util.zip.Deflater;
import java.util.zip.DeflaterOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import sun.security.util.RegisteredDomain;

public class IndexedPublicSuffix {
    private static final String RESOURCE = "lib/security/public_suffix_list.dat";

    public static void main(String[] args) throws Exception {
        String originalHome = System.getProperty("java.home");
        // An optional image argument supports focused patch-module testing.
        byte[] image = Files.readAllBytes(args.length == 0
                ? Path.of(originalHome, RESOURCE) : Path.of(args[0]));
        if (image[0] != 'P' || image[1] != 'S' || image[2] != 'L' || image[3] != '1') {
            throw new AssertionError("Expected generated PSL1 resource");
        }
        java.time.ZoneId.systemDefault();
        Path home = Files.createTempDirectory(Path.of("."), "indexed-psl-").toAbsolutePath();
        Path resource = home.resolve(RESOURCE);
        Files.createDirectories(resource.getParent());
        Files.write(resource, image);
        try {
            System.setProperty("java.home", home.toString());
            concurrentFirstUse();
            check(".com", ".com", "com", RegisteredDomain.Type.ICANN);
            check("x..com", ".com", "com", RegisteredDomain.Type.ICANN);
            check("x..co.uk", ".co.uk", "co.uk", RegisteredDomain.Type.ICANN);
            check("x..ck", "x..ck", ".ck", RegisteredDomain.Type.ICANN);
            check("www.ck", "www.ck", "ck", RegisteredDomain.Type.ICANN);
            check("a.city.kawasaki.jp", "city.kawasaki.jp", "kawasaki.jp",
                    RegisteredDomain.Type.ICANN);
            check("x.blogspot.com", "x.blogspot.com", "blogspot.com",
                    RegisteredDomain.Type.PRIVATE);
            check("x.公司.cn", "x.公司.cn", "公司.cn", RegisteredDomain.Type.ICANN);
            empty("");
            empty(".");
            empty("x.com.");
            empty("x.COM");
            empty("x.\uD800");
            empty("x.\uDC00");
            empty("x.\uD800x");
            empty("x.\uD800\uDC00");
            try {
                RegisteredDomain.from(null);
                throw new AssertionError("null accepted");
            } catch (NullPointerException expected) { }

            // Change bytes in place while preserving size and modification time.
            // Corruption in an unrelated shard does not invalidate this TLD.
            var timestamp = Files.getLastModifiedTime(resource);
            byte[] sameSizeCorruption = image.clone();
            sameSizeCorruption[sameSizeCorruption.length - 1] ^= 1;
            Files.write(resource, sameSizeCorruption);
            Files.setLastModifiedTime(resource, timestamp);
            check("x.aero", "x.aero", "aero", RegisteredDomain.Type.ICANN);
            byte[] damagedInt = image.clone();
            int metadata = metadata(image, "int");
            int offset = readInt(image, metadata);
            int compressed = readInt(image, metadata + 4);
            damagedInt[offset + compressed - 1] ^= 1;
            Files.write(resource, damagedInt);
            empty("x.int");
            Files.write(resource, java.util.Arrays.copyOf(image, image.length + 1));
            empty("x.int");
            Files.write(resource, java.util.Arrays.copyOf(image, image.length - 1));
            empty("x.int");
            Files.write(resource, image);
            Files.setLastModifiedTime(resource, timestamp);

            for (int i = 0; i < 64; i++) {
                empty("x.absent-audit29-" + i);
            }
            empty("x.later-audit29");
            Files.delete(resource);
            empty("x.retry-audit29");
            Files.createDirectory(resource); // unreadable as a data file
            empty("x.retry-audit29");
            Files.delete(resource);
            Files.write(resource, new byte[] {'P', 'S', 'L', '1', 0});
            empty("x.retry-audit29");
            byte[] damaged = image.clone();
            damaged[damaged.length - 1] ^= 1;
            Files.write(resource, damaged);
            empty("x.retry-audit29");

            writeZip(resource, "future-audit29", "\0Other.*.future-audit29\n",
                    "retry-audit29", "\0retry-audit29\n",
                    "later-audit29", "\1later-audit29\n");
            // Future OTHER rules retain their original case-insensitive behavior.
            check("p.other.value.future-audit29", "p.other.value.future-audit29",
                    "other.value.future-audit29", RegisteredDomain.Type.ICANN);
            check("x.retry-audit29", "x.retry-audit29", "retry-audit29",
                    RegisteredDomain.Type.ICANN);
            check("x.later-audit29", "x.later-audit29", "later-audit29",
                    RegisteredDomain.Type.PRIVATE);
            writeZip(resource, "later-audit29", "\0x.later-audit29\n",
                    "replacement-audit29", "\0replacement-audit29\n");
            // Positive TLD results remain permanently cached across replacements.
            check("x.later-audit29", "x.later-audit29", "later-audit29",
                    RegisteredDomain.Type.PRIVATE);
            check("x.com", "x.com", "com", RegisteredDomain.Type.ICANN);
            check("x.replacement-audit29", "x.replacement-audit29",
                    "replacement-audit29", RegisteredDomain.Type.ICANN);
            // Failed reads do not prevent a subsequent indexed load.
            Files.write(resource, image);
            check("x.aero", "x.aero", "aero", RegisteredDomain.Type.ICANN);
            check("x.int", "x.int", "int", RegisteredDomain.Type.ICANN);

            // A valid, independently generated image is accepted without build identity.
            // New uncached names must use its current directory, even with identical
            // file length and timestamp; cached positive TLDs retain their old rules.
            byte[] first = indexed(1, "aa-audit29", "zzzzzz-audit29");
            byte[] second = indexed(2, "bbbb-audit29", "dddd-audit29");
            if (first.length != second.length || readInt(first, metadata(first, "zzzzzz-audit29"))
                    == readInt(second, metadata(second, "dddd-audit29"))) {
                throw new AssertionError("Fixture must preserve size while shifting shard offsets");
            }
            Files.write(resource, first);
            var sameTime = Files.getLastModifiedTime(resource);
            check("x.zzzzzz-audit29", "x.zzzzzz-audit29", "zzzzzz-audit29", RegisteredDomain.Type.ICANN);
            empty("x.dddd-audit29");
            Files.write(resource, second);
            Files.setLastModifiedTime(resource, sameTime);
            check("x.dddd-audit29", "x.dddd-audit29", "dddd-audit29", RegisteredDomain.Type.PRIVATE);
            check("x.zzzzzz-audit29", "x.zzzzzz-audit29", "zzzzzz-audit29", RegisteredDomain.Type.ICANN);
            empty("x.after-audit29");
            writeZip(resource, "after-audit29", "\0after-audit29\n");
            check("x.after-audit29", "x.after-audit29", "after-audit29", RegisteredDomain.Type.ICANN);
            empty("x.final-audit29");
            Files.write(resource, indexed(2, "final-audit29"));
            check("x.final-audit29", "x.final-audit29", "final-audit29", RegisteredDomain.Type.PRIVATE);
            System.out.println("Indexed public suffix replacement, concurrency and ZIP compatibility passed");
        } finally {
            System.setProperty("java.home", originalHome);
            Files.deleteIfExists(resource);
            Files.delete(resource.getParent());
            Files.delete(resource.getParent().getParent());
            Files.delete(home);
        }
    }

    private static void concurrentFirstUse() throws Exception {
        CyclicBarrier barrier = new CyclicBarrier(8);
        try (var executor = Executors.newFixedThreadPool(8)) {
            List<Callable<Void>> tasks = new ArrayList<>();
            for (int t = 0; t < 8; t++) {
                int offset = t;
                tasks.add(() -> {
                    barrier.await();
                    for (int i = 0; i < 600; i++) {
                        switch ((i + offset) % 3) {
                            case 0 -> check("x.com", "x.com", "com", RegisteredDomain.Type.ICANN);
                            case 1 -> check("x.co.jp", "x.co.jp", "co.jp", RegisteredDomain.Type.ICANN);
                            case 2 -> check("www.ck", "www.ck", "ck", RegisteredDomain.Type.ICANN);
                        }
                    }
                    return null;
                });
            }
            for (var result : executor.invokeAll(tasks)) {
                result.get();
            }
        }
    }

    private static int readInt(byte[] image, int offset) {
        return (image[offset] & 255) << 24 | (image[offset + 1] & 255) << 16
                | (image[offset + 2] & 255) << 8 | image[offset + 3] & 255;
    }

    private static int metadata(byte[] image, String tld) {
        int offset = 84;
        int count = readInt(image, 80);
        for (int i = 0; i < count; i++) {
            int length = (image[offset] & 255) << 8 | image[offset + 1] & 255;
            String name = new String(image, offset + 2, length, StandardCharsets.UTF_8);
            offset += 2 + length;
            if (name.equals(tld)) return offset;
            offset += 12;
        }
        throw new AssertionError("Missing fixture TLD " + tld);
    }

    private static byte[] indexed(int authority, String... tlds) throws Exception {
        var names = new TreeSet<>(List.of(tlds));
        var shards = new ArrayList<byte[]>();
        var rawLengths = new ArrayList<Integer>();
        int directory = 84;
        for (String name : names) {
            directory += 14 + name.getBytes(StandardCharsets.UTF_8).length;
            var raw = new ByteArrayOutputStream();
            try (var out = new DataOutputStream(raw)) {
                out.writeInt(1); label(out, name);
                out.writeInt(1); out.writeShort(0); out.writeByte(authority);
            }
            rawLengths.add(raw.size());
            var compressed = new ByteArrayOutputStream();
            var deflater = new Deflater(Deflater.NO_COMPRESSION);
            try (var out = new DeflaterOutputStream(compressed, deflater)) {
                raw.writeTo(out);
            } finally {
                deflater.end();
            }
            shards.add(compressed.toByteArray());
        }
        int imageLength = directory;
        for (byte[] shard : shards) imageLength += shard.length;
        var image = new ByteArrayOutputStream();
        try (var out = new DataOutputStream(image)) {
            out.writeInt(0x50534c31); out.writeInt(2);
            out.writeInt(imageLength); out.writeInt(directory);
            out.write(new byte[64]); out.writeInt(names.size());
            int offset = directory, index = 0;
            for (String name : names) {
                label(out, name); out.writeInt(offset);
                byte[] shard = shards.get(index);
                out.writeInt(shard.length); out.writeInt(rawLengths.get(index++));
                offset += shard.length;
            }
            for (byte[] shard : shards) out.write(shard);
        }
        return image.toByteArray();
    }

    private static void label(DataOutputStream out, String name) throws Exception {
        byte[] bytes = name.getBytes(StandardCharsets.UTF_8);
        out.writeShort(bytes.length); out.write(bytes);
    }

    private static void writeZip(Path path, String... entries) throws Exception {
        try (var out = new ZipOutputStream(Files.newOutputStream(path))) {
            for (int i = 0; i < entries.length; i += 2) {
                out.putNextEntry(new ZipEntry(entries[i]));
                out.write(entries[i + 1].getBytes(StandardCharsets.UTF_8));
                out.closeEntry();
            }
        }
    }

    private static void empty(String input) {
        if (RegisteredDomain.from(input).isPresent()) {
            throw new AssertionError("Expected empty: " + input);
        }
    }

    private static void check(String input, String name, String suffix,
                              RegisteredDomain.Type type) {
        RegisteredDomain result = RegisteredDomain.from(input).orElseThrow(
                () -> new AssertionError("Missing result: " + input));
        if (!result.name().equals(name) || !result.publicSuffix().equals(suffix)
                || result.type() != type) {
            throw new AssertionError(input + ": " + result.name() + " / "
                    + result.publicSuffix() + " / " + result.type());
        }
    }
}
