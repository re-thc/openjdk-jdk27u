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
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

/* @test
 * @summary Check the built-in charset profile and aliases against the mapping manifest
 * @modules jdk.charsets
 * @run main/othervm ModernCharsetProfile
 */

import java.nio.charset.Charset;
import java.nio.charset.UnsupportedCharsetException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

public class ModernCharsetProfile {
    public static void main(String[] args) throws Exception {
        Path dir = Path.of(System.getProperty("test.src", "."),
                "../../../../../make/data/charsetmapping").normalize();
        Set<String> profile = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
        for (String name : Files.readAllLines(dir.resolve("modern-profile"))) {
            if (!name.isBlank() && !name.startsWith("#")) profile.add(name);
        }
        if (profile.size() != 12 || !Charset.availableCharsets().keySet().equals(profile)) {
            throw new AssertionError("Unexpected built-in inventory: " + Charset.availableCharsets().keySet());
        }
        Map<String, String> names = new HashMap<>();
        Set<String> excluded = new HashSet<>();
        String canonical = null;
        for (String line : Files.readAllLines(dir.resolve("charsets"))) {
            String text = line.split("#", 2)[0].trim();
            if (text.isEmpty()) continue;
            String[] fields = text.split("\\s+");
            if (fields[0].equals("charset")) canonical = fields[1];
            else if (!fields[0].equals("alias")) continue;
            String name = fields[0].equals("charset") ? canonical : fields[1];
            String key = name.toLowerCase(Locale.ROOT);
            if (profile.contains(canonical)) names.put(key, canonical);
            else excluded.add(key);
        }
        excluded.add("gb18030-2000");
        excluded.add("gb18030-2022");
        for (var entry : names.entrySet()) {
            Charset cs = Charset.forName(entry.getKey());
            if (!cs.name().equalsIgnoreCase(entry.getValue()))
                throw new AssertionError(entry + " resolved to " + cs.name());
        }
        excluded.removeAll(names.keySet());
        for (String name : excluded) {
            if (Charset.isSupported(name)) throw new AssertionError("Unexpected charset: " + name);
            try {
                Charset.forName(name);
                throw new AssertionError("Unexpected charset: " + name);
            } catch (UnsupportedCharsetException expected) {
                // Expected for excluded built-ins.
            }
        }
        System.out.printf("Checked %d retained names and %d excluded names%n", names.size(), excluded.size());
    }
}
