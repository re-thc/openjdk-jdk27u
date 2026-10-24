/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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

package build.tools.generatecollation;

import java.io.ByteArrayOutputStream;
import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.security.MessageDigest;
import java.text.RuleBasedCollator;
import java.util.Arrays;
import java.util.HexFormat;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.TreeMap;
import java.util.TreeSet;

/**
 * Snapshot the target source builder, never the build VM's collation tables.
 * The build supplies target Character, normalization, builder, and resource
 * implementations through module patches.
 * Reflection is confined to this build tool; the runtime decoder is typed.
 */
public final class GenerateCollationTables {
    public static void main(String[] args) throws Exception {
        if (args.length != 3) {
            throw new IllegalArgumentException("output-directory bundle-list source-manifest");
        }
        Path output = Path.of(args[0]);
        Files.createDirectories(output);
        var rulesField = Class.forName("sun.util.locale.provider.CollationRules")
                              .getDeclaredField("DEFAULTRULES");
        rulesField.setAccessible(true);
        String defaults = (String) rulesField.get(null);
        var rules = new TreeSet<String>();
        var baseRules = new TreeSet<String>();
        var bundleIndex = new TreeMap<String, TreeSet<String>>();
        rules.add(defaults);
        baseRules.add(defaults);
        for (String name : Files.readAllLines(Path.of(args[1]))) {
            ResourceBundle bundle = (ResourceBundle) Class.forName(name)
                    .getConstructor().newInstance();
            for (String key : new TreeSet<>(bundle.keySet())) {
                if (key.equals("Rule") || key.startsWith("Rule.")) {
                    String rule = defaults + bundle.getString(key);
                    rules.add(rule);
                    if (name.startsWith("sun.text.resources.ext.")) {
                        bundleIndex.computeIfAbsent(name.replace('.', '/') + ".class",
                                unused -> new TreeSet<>()).add(ruleHash(rule));
                    } else {
                        baseRules.add(rule);
                    }
                }
            }
        }

        Method getTables = RuleBasedCollator.class.getDeclaredMethod("getTables");
        getTables.setAccessible(true);
        Method write = Class.forName("java.text.RBCollationTables")
                .getDeclaredMethod("writeTo", DataOutputStream.class);
        write.setAccessible(true);
        Method read = Class.forName("java.text.RBCollationTables")
                .getDeclaredMethod("readFrom", DataInputStream.class, String.class);
        read.setAccessible(true);
        long bytes = 0;
        var files = new TreeMap<String, byte[]>();
        var baseFiles = new TreeSet<String>();
        for (String rule : rules) {
            RuleBasedCollator collator = new RuleBasedCollator(rule);
            var buffer = new ByteArrayOutputStream();
            try (var data = new DataOutputStream(buffer)) {
                write.invoke(getTables.invoke(collator), data);
            }
            String hash = ruleHash(rule);
            if (baseRules.contains(rule)) baseFiles.add(hash);
            byte[] payload = buffer.toByteArray();
            Object decoded;
            try (var input = new DataInputStream(new ByteArrayInputStream(payload))) {
                decoded = read.invoke(null, input, rule);
            }
            var roundTrip = new ByteArrayOutputStream();
            try (var data = new DataOutputStream(roundTrip)) {
                write.invoke(decoded, data);
            }
            if (!Arrays.equals(payload, roundTrip.toByteArray())) {
                throw new IllegalStateException("Non-exact table round trip: " + hash);
            }
            byte[] previous = files.putIfAbsent(hash, payload);
            if (previous != null && !Arrays.equals(previous, payload)) {
                throw new IllegalStateException("Rule digest collision");
            }
        }
        Path base = output.resolve("java.base/sun/text/resources");
        Path localedata = output.resolve("jdk.localedata/sun/text/resources/ext");
        Files.createDirectories(base);
        Files.createDirectories(localedata);
        for (var entry : files.entrySet()) {
            Path destination = baseFiles.contains(entry.getKey()) ? base : localedata;
            Files.write(destination.resolve("collation-" + entry.getKey() + ".bin"), entry.getValue());
            bytes += entry.getValue().length;
        }

        // jlink keeps payloads referenced by the surviving source bundles.
        var index = new StringBuilder();
        for (var entry : bundleIndex.entrySet()) {
            index.append(entry.getKey()).append('\t')
                 .append(String.join(",", entry.getValue())).append('\n');
        }
        Files.writeString(localedata.resolve("collation-index.txt"), index, StandardCharsets.UTF_8);
        Files.copy(Path.of(args[2]), output.resolve("sources.sha256"), StandardCopyOption.REPLACE_EXISTING);
        System.out.printf(Locale.ROOT, "tables=%d base=%d localedata=%d bytes=%d%n",
                          files.size(), baseFiles.size(), files.size() - baseFiles.size(), bytes);
    }

    private static String ruleHash(String rules) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        // Preserve every UTF-16 code unit, including unpaired surrogates.
        for (int i = 0; i < rules.length(); i++) {
            char c = rules.charAt(i);
            digest.update((byte) (c >>> 8));
            digest.update((byte) c);
        }
        return HexFormat.of().formatHex(digest.digest());
    }
}
