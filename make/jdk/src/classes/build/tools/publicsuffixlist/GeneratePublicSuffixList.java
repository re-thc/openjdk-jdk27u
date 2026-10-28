/*
 * Copyright (c) 2017, 2026, Oracle and/or its affiliates. All rights reserved.
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
 */

package build.tools.publicsuffixlist;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.StringReader;
import java.nio.file.attribute.FileTime;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.TreeMap;
import java.util.zip.Deflater;
import java.util.zip.DeflaterOutputStream;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * This tool takes the original Mozilla public suffix rule list as input
 * and slices it into a set of files, one for each top-level domain.
 * Each file contains only the rules for that domain. Lines containing comments
 * or only whitespace are not copied. Each of these files are then combined
 * into the target zipfile. The --indexed mode emits a self-describing indexed
 * image. Rules unsupported by the indexed matcher retain the legacy Zip format.
 *
 * Usage: java GeneratePublicSuffixList source destination
 *    or: java GeneratePublicSuffixList --indexed source destination VERSION
 */
public final class GeneratePublicSuffixList {
    // patterns
    private static final String COMMENT = "//";
    private static final String BEGIN_PRIVATE = "// ===BEGIN PRIVATE DOMAINS===";
    private static final Pattern WHITESPACE = Pattern.compile("\\s*");
    private static final byte ICANN = 0x00;
    private static final byte PRIVATE = 0x01;
    private static final int HEADER_LENGTH = 84;
    private static final int MAX_DIRECTORY_LENGTH = 1024 * 1024;
    private static final int MAX_SHARD_LENGTH = 8 * 1024 * 1024;

    private static class Domain {
        final String name;
        final byte type;
        Domain(String name, byte type) {
            this.name = name;
            this.type = type;
        }
    }

    public static void main(String[] args) throws Exception {
        if (args.length == 4 && args[0].equals("--indexed")) {
            try {
                writeIndexed(Path.of(args[1]), Path.of(args[2]),
                             Files.readAllBytes(Path.of(args[3])));
            } catch (UnsupportedIndexedRules e) {
                // Preserve the legacy matcher for future/nonstandard rules.
                main(new String[] { args[1], args[2] });
            }
            return;
        }
        if (args.length != 2) {
            throw new Exception("source destination or --indexed source destination VERSION required");
        }
        try (FileInputStream fis = new FileInputStream(args[0]);
             ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(args[1])))
        {
            BufferedReader br =
                new BufferedReader(new InputStreamReader(fis, "UTF-8"));

            List<Domain> domains = new LinkedList<>();
            byte type = ICANN;
            String line;
            while ((line = br.readLine()) != null) {
                if (line.startsWith(COMMENT)) {
                    if (line.startsWith(BEGIN_PRIVATE)) {
                        type = PRIVATE;
                    }
                    continue;
                }
                if (WHITESPACE.matcher(line).matches()) {
                    continue;
                }
                domains.add(new Domain(line, type));
            }
            // have a list of rules now

            // Map of TLD names to rules with the same TLD
            Map<String, List<Domain>> rules = addDomains(domains);

            // stream for writing the file contents
            BufferedWriter bw =
                new BufferedWriter(new OutputStreamWriter(zos, "UTF-8"));

            // now output each map entry to its own file,
            // whose filename is the TLD
            writeRules(zos, bw, rules);
        }
    }

    private static Map<String, List<Domain>> addDomains(List<Domain> domains) {
        Map<String, List<Domain>> rules = new HashMap<>();
        for (Domain domain : domains) {
            String tld = getTLD(domain.name);

            rules.compute(tld, (k, v) -> {
                if (v == null) {
                    List<Domain> newV = new LinkedList<>();
                    newV.add(domain);
                    return newV;
                } else {
                    v.add(domain);
                    return v;
                }
            });
        }
        return rules;
    }

    private static void writeRules(ZipOutputStream zos, BufferedWriter bw,
                                   Map<String, List<Domain>> rules)
                                   throws IOException {
        // Sort keys for deterministic output
        List<String> tlds = rules.keySet().stream().sorted().collect(Collectors.toList());
        for (String tld : tlds) {
            List<Domain> entries = rules.get(tld);
            ZipEntry ze = new ZipEntry(tld);
            ze.setLastModifiedTime(FileTime.fromMillis(0));
            zos.putNextEntry(ze);
            for (Domain entry : entries) {
                bw.write(entry.type);
                bw.write(entry.name, 0, entry.name.length());
                bw.newLine();
            }
            bw.flush();
        }
    }

    /*
     * Indexed format (all integers big endian): PSL1, version 2, image length,
     * directory length, source SHA-256, VERSION metadata SHA-256, TLD count.
     * The 84-byte header is followed by a UTF-8 name and offset/compressed/raw
     * length per TLD. Digests record provenance; runtime uses structural checks.
     * Each independently zlib-compressed shard contains a node count followed
     * by BFS nodes: UTF-8 label, first child, child count and terminal flags.
     * UTF-8 byte lengths and child counts are unsigned shorts.
     * Child ranges are sorted by String.compareTo, independent of locale.
     */
    private static final class Node {
        final String label;
        final Map<String, Node> children = new TreeMap<>();
        int flags;
        int first;
        Node(String label) {
            this.label = label;
        }
    }

    private static void writeString(DataOutputStream out, String value)
            throws IOException {
        byte[] bytes = value.getBytes(java.nio.charset.StandardCharsets.UTF_8);
        if (bytes.length > 65535) {
            throw new UnsupportedIndexedRules("Public suffix label too long");
        }
        out.writeShort(bytes.length);
        out.write(bytes);
    }

    private static byte[] digest(byte[] bytes) throws Exception {
        return MessageDigest.getInstance("SHA-256").digest(bytes);
    }

    private static void writeIndexed(Path source, Path destination,
                                     byte[] versionBytes)
            throws Exception {
        byte[] sourceBytes = Files.readAllBytes(source);
        Map<String, Node> roots = new TreeMap<>();
        byte auth = ICANN;
        try (BufferedReader reader = new BufferedReader(new StringReader(
                new String(sourceBytes, java.nio.charset.StandardCharsets.UTF_8)))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.startsWith(COMMENT)) {
                    if (line.startsWith(BEGIN_PRIVATE)) {
                        auth = PRIVATE;
                    }
                    continue;
                }
                if (WHITESPACE.matcher(line).matches()) {
                    continue;
                }
                int kind = 0; // normal, wildcard, exception: two bits each
                String name = line;
                if (name.startsWith("!")) {
                    kind = 2;
                    name = name.substring(1);
                } else if (name.startsWith("*.")) {
                    kind = 1;
                    name = name.substring(2);
                }
                if ((kind == 2 && name.indexOf('.') < 0) ||
                        name.indexOf('*') >= 0 || name.isEmpty() ||
                        name.startsWith(".") || name.endsWith(".") ||
                        name.contains("..")) {
                    throw new UnsupportedIndexedRules("Unsupported indexed rule: " + line);
                }
                String[] labels = name.split("\\.");
                Node node = roots.computeIfAbsent(labels[labels.length - 1],
                                                  k -> new Node(k));
                for (int i = labels.length - 2; i >= 0; i--) {
                    node = node.children.computeIfAbsent(labels[i], Node::new);
                }
                int shift = kind * 2;
                int value = auth + 1;
                int previous = (node.flags >>> shift) & 3;
                if (previous != 0 && previous != value) {
                    throw new UnsupportedIndexedRules("Conflicting indexed rule: " + line);
                }
                node.flags |= value << shift;
            }
        }
        List<byte[]> shards = new ArrayList<>();
        List<Integer> lengths = new ArrayList<>();
        int directoryLength = HEADER_LENGTH;
        for (Map.Entry<String, Node> entry : roots.entrySet()) {
            directoryLength = Math.addExact(directoryLength,
                                            2 + entry.getKey().getBytes(
                                                java.nio.charset.StandardCharsets.UTF_8).length + 12);
            if (directoryLength > MAX_DIRECTORY_LENGTH) {
                throw new UnsupportedIndexedRules("Public suffix directory too large");
            }
            List<Node> nodes = new ArrayList<>();
            nodes.add(entry.getValue());
            for (int i = 0; i < nodes.size(); i++) {
                Node node = nodes.get(i);
                if (((node.flags >>> 2) & 3) != 0) {
                    for (Node child : node.children.values()) {
                        if ((child.flags & 3) != 0) {
                            throw new UnsupportedIndexedRules("Overlapping normal/wildcard rules");
                        }
                    }
                }
                node.first = nodes.size();
                nodes.addAll(node.children.values());
            }
            ByteArrayOutputStream raw = new ByteArrayOutputStream();
            try (DataOutputStream out = new DataOutputStream(raw)) {
                out.writeInt(nodes.size());
                for (Node node : nodes) {
                    writeString(out, node.label);
                    out.writeInt(node.first);
                    if (node.children.size() > 65535) {
                        throw new UnsupportedIndexedRules("Too many trie children");
                    }
                    out.writeShort(node.children.size());
                    out.writeByte(node.flags);
                }
            }
            if (raw.size() > MAX_SHARD_LENGTH) {
                throw new UnsupportedIndexedRules("Public suffix shard too large");
            }
            lengths.add(raw.size());
            ByteArrayOutputStream compressed = new ByteArrayOutputStream();
            Deflater deflater = new Deflater(1);
            try (DeflaterOutputStream out =
                     new DeflaterOutputStream(compressed, deflater)) {
                raw.writeTo(out);
            } finally {
                deflater.end();
            }
            if (compressed.size() > MAX_SHARD_LENGTH) {
                throw new UnsupportedIndexedRules("Compressed public suffix shard too large");
            }
            shards.add(compressed.toByteArray());
        }
        long imageLength = directoryLength;
        for (byte[] shard : shards) {
            imageLength += shard.length;
        }
        if (imageLength > Integer.MAX_VALUE) {
            throw new UnsupportedIndexedRules("Public suffix image too large");
        }
        ByteArrayOutputStream image = new ByteArrayOutputStream();
        try (DataOutputStream out = new DataOutputStream(image)) {
            out.writeInt(0x50534c31); // PSL1
            out.writeInt(2);
            out.writeInt((int) imageLength);
            out.writeInt(directoryLength);
            byte[] sourceDigest = digest(sourceBytes);
            out.write(sourceDigest);
            out.write(digest(versionBytes));
            out.writeInt(roots.size());
            int offset = directoryLength;
            int i = 0;
            for (String tld : roots.keySet()) {
                writeString(out, tld);
                byte[] shard = shards.get(i);
                out.writeInt(offset);
                out.writeInt(shard.length);
                out.writeInt(lengths.get(i++));
                offset = Math.addExact(offset, shard.length);
            }
            for (byte[] shard : shards) {
                out.write(shard);
            }
        }
        byte[] bytes = image.toByteArray();
        Files.write(destination, bytes);
    }

    private static final class UnsupportedIndexedRules extends IOException {
        private static final long serialVersionUID = 1L;

        UnsupportedIndexedRules(String message) {
            super(message);
        }
    }

    private static String getTLD(String line) {
        int dotIndex = line.lastIndexOf('.');
        return (dotIndex == -1) ? line : line.substring(dotIndex + 1);
    }
}
