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
 * @summary Malformed self-describing PSL data remains retryable and bounded
 * @modules java.base/sun.security.util:+open
 * @run main/othervm IndexedPublicSuffixFirstUse
 */

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.zip.DeflaterOutputStream;
import sun.security.util.RegisteredDomain;

public class IndexedPublicSuffixFirstUse {
    private static final String TLD = "first-audit29";
    private static final int HEADER = 84;

    public static void main(String[] args) throws Exception {
        String originalHome = System.getProperty("java.home");
        byte[] raw = trie(TLD, 1);
        byte[] valid = image(raw);
        int metadata = HEADER + 2 + TLD.length();
        int rootMetadata = 6 + TLD.length();
        Field cache = Class.forName("sun.security.util.DomainName").getDeclaredField("cache");
        cache.setAccessible(true);
        try {
            Class.forName("sun.security.util.DomainName$IndexedData").getDeclaredField("trusted");
            throw new AssertionError("Global trusted directory must not exist");
        } catch (NoSuchFieldException expected) { }
        java.time.ZoneId.systemDefault();
        Path home = Files.createTempDirectory(Path.of("."), "psl-first-").toAbsolutePath();
        Path resource = home.resolve("lib/security/public_suffix_list.dat");
        Files.createDirectories(resource.getParent());
        List<byte[]> broken = new ArrayList<>();
        for (int[] change : new int[][] {
                {4, 1}, {4, 3}, {8, -1}, {8, Integer.MAX_VALUE},
                {12, -1}, {12, 1024 * 1024 + 1}, {80, Integer.MAX_VALUE},
                {metadata, -1}, {metadata + 4, -1},
                {metadata + 4, 8 * 1024 * 1024 + 1},
                {metadata + 8, -1}, {metadata + 8, 8 * 1024 * 1024 + 1}}) {
            byte[] copy = valid.clone();
            putInt(copy, change[0], change[1]);
            broken.add(copy);
        }
        byte[] invalidName = valid.clone(); invalidName[HEADER + 2] = (byte) 0xc0;
        broken.add(invalidName);
        byte[] invalidNameLength = valid.clone();
        invalidNameLength[HEADER] = (byte) 255; invalidNameLength[HEADER + 1] = (byte) 255;
        broken.add(invalidNameLength);
        for (int size : new int[] {4, HEADER - 1, valid.length - 1, valid.length + 1}) {
            broken.add(Arrays.copyOf(valid, size));
        }
        byte[] badChecksum = valid.clone(); badChecksum[badChecksum.length - 1] ^= 1;
        broken.add(badChecksum);
        for (int[] change : new int[][] {{0, 0}, {0, Integer.MAX_VALUE},
                {rootMetadata, 0}, {rootMetadata, Integer.MAX_VALUE}}) {
            byte[] copy = raw.clone(); putInt(copy, change[0], change[1]);
            broken.add(image(copy));
        }
        byte[] invalidLabel = raw.clone(); invalidLabel[6] = (byte) 0xc0;
        broken.add(image(invalidLabel));
        broken.add(image(trie("wrong-audit29", 1)));
        broken.add(image(trie("", 1)));
        broken.add(image(trie(TLD, 3)));
        broken.add(image(trie(TLD, 0x80)));
        broken.add(image(trie(TLD, 0x10)));
        broken.add(image(trie(TLD, 4, "normal"))); // unsupported wildcard/normal overlap
        broken.add(image(trie(TLD, 1, "")));
        broken.add(image(trie(TLD, 1, "a.b")));
        broken.add(image(trie(TLD, 1, "*")));
        broken.add(image(trie(TLD, 1, "z", "a"))); // unsorted children
        byte[] child = trie(TLD, 1, "a");
        int childStart = raw.length;
        // Exercise the byte-array parser's label-prefix and metadata bounds.
        broken.add(image(Arrays.copyOf(child, childStart + 1)));
        broken.add(image(Arrays.copyOf(child, child.length - 1)));
        byte[] oversizedLabel = child.clone();
        oversizedLabel[childStart] = (byte) 255;
        oversizedLabel[childStart + 1] = (byte) 255;
        broken.add(image(oversizedLabel));
        broken.add(image(Arrays.copyOf(raw, raw.length + 1)));
        byte[] compressed = compress(raw);
        byte[] extraCompressed = Arrays.copyOf(compressed, compressed.length + 1);
        broken.add(imageCompressed(extraCompressed, raw.length));
        byte[] concatenated = new byte[compressed.length * 2];
        System.arraycopy(compressed, 0, concatenated, 0, compressed.length);
        System.arraycopy(compressed, 0, concatenated, compressed.length, compressed.length);
        broken.add(imageCompressed(concatenated, raw.length));
        broken.add(imageCompressed(compressed, raw.length - 1));
        broken.add(imageCompressed(compressed, raw.length + 1));
        try {
            System.setProperty("java.home", home.toString());
            rejected(cache); // missing
            Files.createDirectory(resource);
            rejected(cache); // a directory cannot serve as a PSL file
            Files.delete(resource);
            int count = 2;
            for (byte[] bytes : broken) {
                Files.write(resource, bytes);
                rejected(cache);
                count++;
            }
            // Provenance bytes are metadata, not a runtime build identity gate.
            valid[16] ^= 1;
            valid[48] ^= 1;
            Files.write(resource, valid);
            var result = RegisteredDomain.from("example." + TLD).orElseThrow();
            if (!result.name().equals("example." + TLD) || !result.publicSuffix().equals(TLD)
                    || result.type() != RegisteredDomain.Type.ICANN) {
                throw new AssertionError("First-use recovery failed");
            }
            System.out.println("Self-describing PSL failures remain retryable: " + count);
        } finally {
            System.setProperty("java.home", originalHome);
            Files.deleteIfExists(resource);
            Files.delete(resource.getParent());
            Files.delete(resource.getParent().getParent());
            Files.delete(home);
        }
    }

    private static void rejected(Field cache) throws Exception {
        if (RegisteredDomain.from("example." + TLD).isPresent()
                || !((Map<?, ?>) cache.get(null)).isEmpty()) {
            throw new AssertionError("Malformed first use succeeded or cached a failure");
        }
    }

    private static byte[] trie(String root, int flags, String... children) throws Exception {
        var bytes = new ByteArrayOutputStream();
        try (var out = new DataOutputStream(bytes)) {
            out.writeInt(1 + children.length);
            label(out, root); out.writeInt(1); out.writeShort(children.length); out.writeByte(flags);
            for (String child : children) {
                label(out, child); out.writeInt(1 + children.length); out.writeShort(0); out.writeByte(1);
            }
        }
        return bytes.toByteArray();
    }

    private static void label(DataOutputStream out, String value) throws Exception {
        byte[] bytes = value.getBytes(StandardCharsets.UTF_8);
        out.writeShort(bytes.length); out.write(bytes);
    }

    private static byte[] compress(byte[] raw) throws Exception {
        var bytes = new ByteArrayOutputStream();
        try (var out = new DeflaterOutputStream(bytes)) { out.write(raw); }
        return bytes.toByteArray();
    }

    private static byte[] image(byte[] raw) throws Exception {
        return imageCompressed(compress(raw), raw.length);
    }

    private static byte[] imageCompressed(byte[] compressed, int rawLength) throws Exception {
        var bytes = new ByteArrayOutputStream();
        int directory = HEADER + 2 + TLD.length() + 12;
        try (var out = new DataOutputStream(bytes)) {
            out.writeInt(0x50534c31); out.writeInt(2);
            out.writeInt(directory + compressed.length); out.writeInt(directory);
            out.write(new byte[64]); out.writeInt(1);
            label(out, TLD); out.writeInt(directory);
            out.writeInt(compressed.length); out.writeInt(rawLength); out.write(compressed);
        }
        return bytes.toByteArray();
    }

    private static void putInt(byte[] bytes, int offset, int value) {
        for (int i = 3; i >= 0; i--) {
            bytes[offset + i] = (byte) value; value >>>= 8;
        }
    }
}
