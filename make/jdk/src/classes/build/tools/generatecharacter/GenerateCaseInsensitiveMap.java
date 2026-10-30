/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
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
/*
 * reserved comment block
 * DO NOT REMOVE OR ALTER!
 */
/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package build.tools.generatecharacter;

import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Generates the Xerces BMP case-equivalence table from target Unicode data. */
public final class GenerateCaseInsensitiveMap {
    private static final int CHUNK_SHIFT = 10;
    private static final int CHUNK_SIZE = 1 << CHUNK_SHIFT;
    private static final int CHUNK_MASK = CHUNK_SIZE - 1;
    private static final int INITIAL_CHUNK_COUNT = 64;
    private static final int LOWER_CASE_MATCH = 1;
    private static final int UPPER_CASE_MATCH = 2;

    private int[][][] caseInsensitiveMap;
    private final int[] lowerCase = new int[0x10000];
    private final int[] upperCase = new int[0x10000];

    public static void main(String[] args) throws IOException {
        if (args.length != 5) {
            throw new IllegalArgumentException("Usage: GenerateCaseInsensitiveMap "
                    + "<template> <UnicodeData.txt> <ReadMe.txt> <Character.java> <output>");
        }
        // Check target metadata, never the Unicode version of the build JDK.
        checkUnicodeVersion(Path.of(args[2]), Path.of(args[3]));
        GenerateCaseInsensitiveMap generator = new GenerateCaseInsensitiveMap();
        generator.readMappings(Path.of(args[1]));
        generator.buildCaseInsensitiveMap();
        String source = generator.generate(Files.readString(Path.of(args[0])));
        // All validation and generation precedes touching the destination.
        Files.writeString(Path.of(args[4]), source);
    }

    private static void checkUnicodeVersion(Path readme, Path character) throws IOException {
        String dataVersion = version(readme,
                "Version ([0-9]+(?:\\.[0-9]+)+) of the Unicode Standard");
        String characterVersion = version(character,
                "Unicode Standard, version ([0-9]+(?:\\.[0-9]+)+)");
        if (!dataVersion.equals(characterVersion)) {
            throw new IllegalArgumentException("Target Unicode version mismatch: "
                    + readme + " specifies " + dataVersion + ", "
                    + character + " specifies " + characterVersion);
        }
    }

    private static String version(Path file, String expression) throws IOException {
        Matcher matcher = Pattern.compile(expression).matcher(Files.readString(file));
        if (!matcher.find()) {
            throw new IllegalArgumentException("Missing target Unicode version in " + file);
        }
        return matcher.group(1).replaceFirst("(?:\\.0)+$", "");
    }

    private void readMappings(Path unicodeData) throws IOException {
        Arrays.setAll(lowerCase, i -> i);
        Arrays.setAll(upperCase, i -> i);
        // These are the simple mappings used by Character.toLowerCase(int) and
        // Character.toUpperCase(int). SpecialCasing's full/string mappings do
        // not apply; in particular, absent fields (e.g. sharp s) mean identity.
        try (BufferedReader reader = Files.newBufferedReader(unicodeData)) {
            int previous = -1;
            int lineNumber = 0;
            String rangeName = null;
            String rangeProperties = null;
            String line;
            while ((line = reader.readLine()) != null) {
                lineNumber++;
                String[] fields = line.split(";", -1);
                UnicodeSpec spec = fields.length == 15 && fields[0].matches("[0-9A-Fa-f]{4,6}")
                        ? UnicodeSpec.parse(line) : null;
                if (spec == null || spec.getCodePoint() <= previous
                        || spec.getCodePoint() > 0x10ffff) {
                    throw invalidData(unicodeData, lineNumber, "invalid or unordered record");
                }
                int cp = spec.getCodePoint();
                previous = cp;
                for (int field = 12; field < 15; field++) {
                    if (!fields[field].isEmpty() && !fields[field].matches("[0-9A-Fa-f]{4,6}")) {
                        throw invalidData(unicodeData, lineNumber, "invalid simple mapping");
                    }
                }
                for (int mapping : new int[] { spec.getUpperMap(), spec.getLowerMap(),
                        spec.getTitleMap() }) {
                    if (mapping < -1 || mapping > 0x10ffff) {
                        throw invalidData(unicodeData, lineNumber, "invalid simple mapping");
                    }
                }
                String name = spec.getName();
                String properties = line.substring(line.indexOf(';', line.indexOf(';') + 1));
                if (rangeName != null) {
                    if (!name.equals(rangeName + ", Last>")
                            || !properties.equals(rangeProperties)) {
                        throw invalidData(unicodeData, lineNumber, "unpaired range start");
                    }
                    rangeName = null;
                } else if (name.endsWith(", First>")) {
                    if (!name.startsWith("<") || spec.hasUpperMap()
                            || spec.hasLowerMap() || spec.hasTitleMap()) {
                        throw invalidData(unicodeData, lineNumber, "invalid range start");
                    }
                    rangeName = name.substring(0, name.length() - ", First>".length());
                    rangeProperties = properties;
                } else if (name.endsWith(", Last>")) {
                    throw invalidData(unicodeData, lineNumber, "unpaired range end");
                }
                if (cp < 0x10000) {
                    lowerCase[cp] = spec.hasLowerMap() ? spec.getLowerMap() : cp;
                    upperCase[cp] = spec.hasUpperMap() ? spec.getUpperMap() : cp;
                    if (lowerCase[cp] >= 0x10000 || upperCase[cp] >= 0x10000) {
                        throw invalidData(unicodeData, lineNumber, "non-BMP simple mapping");
                    }
                }
            }
            if (rangeName != null || previous == -1) {
                throw invalidData(unicodeData, lineNumber, "empty data or unpaired range start");
            }
        }
    }

    private static IllegalArgumentException invalidData(Path file, int line, String reason) {
        return new IllegalArgumentException(file + ":" + line + ": " + reason);
    }

    private String generate(String template) {
        StringBuilder pages = new StringBuilder();
        StringBuilder methods = new StringBuilder();
        for (int page = 0; page < 256; page++) {
            boolean nonempty = false;
            for (int slot = 0; slot < 256; slot++) {
                nonempty |= getMapping(page * 256 + slot) != null;
            }
            String name = "page" + Integer.toHexString(page);
            if (!nonempty) {
                continue;
            }
            pages.append("        caseInsensitiveMap[").append(page).append("] = ")
                    .append(name).append("();\n");
            methods.append("    private static int[][] ").append(name).append("() {\n")
                    .append("        int[][] page = new int[256][];\n");
            for (int slot = 0; slot < 256; slot++) {
                int[] map = getMapping(page * 256 + slot);
                if (map != null) {
                    methods.append("        page[").append(slot).append("] = new int[] { ");
                    for (int i = 0; i < map.length; i++) {
                        if (i != 0) {
                            methods.append(", ");
                        }
                        methods.append("0x").append(Integer.toHexString(map[i]));
                    }
                    methods.append(" };\n");
                }
            }
            methods.append("        return page;\n    }\n\n");
        }
        for (String marker : new String[] { "@@PAGES@@", "@@PAGE_METHODS@@" }) {
            if (template.indexOf(marker) < 0
                    || template.indexOf(marker) != template.lastIndexOf(marker)) {
                throw new IllegalArgumentException("Template must contain one " + marker);
            }
        }
        return template.replace("@@PAGES@@", pages).replace("@@PAGE_METHODS@@", methods);
    }

    private int[] getMapping(int codePoint) {
        return caseInsensitiveMap[codePoint >>> CHUNK_SHIFT][codePoint & CHUNK_MASK];
    }

    // The original Xerces closure algorithm. Preserve ordering, match types and
    // updates to mappings already visited in the ascending BMP traversal.
    private void buildCaseInsensitiveMap() {
        caseInsensitiveMap = new int[INITIAL_CHUNK_COUNT][CHUNK_SIZE][];
        int lc, uc;
        for (int i=0; i<0x10000; i++) {
            lc = lowerCase[i];
            uc = upperCase[i];

            // lower/upper case value is not the same as code point
            if (lc != uc || lc != i) {
                int[] map = new int[2];
                int index = 0;

                if (lc != i) {
                    map[index++] = lc;
                    map[index++] = LOWER_CASE_MATCH;
                    int[] lcMap = getMapping(lc);
                    if (lcMap != null) {
                        map = updateMap(i, map, lc, lcMap, LOWER_CASE_MATCH);
                    }
                }

                if (uc != i) {
                    if (index == map.length) {
                        map = expandMap(map, 2);
                    }
                    map[index++] = uc;
                    map[index++] = UPPER_CASE_MATCH;
                    int[] ucMap = getMapping(uc);
                    if (ucMap != null) {
                        map = updateMap(i, map, uc, ucMap, UPPER_CASE_MATCH);
                    }
                }

                set(i, map);
            }
        }
    }

    private int[] expandMap(int[] srcMap, int expandBy) {
        final int oldLen = srcMap.length;
        int[] newMap = new int[oldLen + expandBy];

        System.arraycopy(srcMap, 0, newMap, 0, oldLen);
        return newMap;
    }

    private void set(int codePoint, int[] map) {
        int chunk = codePoint >>> CHUNK_SHIFT;
        int offset = codePoint & CHUNK_MASK;

        caseInsensitiveMap[chunk][offset] = map;
    }

    private int[] updateMap(int codePoint, int[] codePointMap,
            int ciCodePoint, int[] ciCodePointMap, int matchType) {
        for (int i=0; i<ciCodePointMap.length; i+=2) {
            int c = ciCodePointMap[i];
            int[] cMap = getMapping(c);
            if (cMap != null) {
                if (contains(cMap, ciCodePoint, matchType)) {
                    if (!contains(cMap, codePoint)) {
                        cMap = expandAndAdd(cMap, codePoint, matchType);
                        set(c, cMap);
                    }
                    if (!contains(codePointMap, c)) {
                        codePointMap = expandAndAdd(codePointMap, c,matchType);
                    }
                }
            }
        }

        if (!contains(ciCodePointMap, codePoint)) {
            ciCodePointMap = expandAndAdd(ciCodePointMap, codePoint, matchType);
            set(ciCodePoint, ciCodePointMap);
        }

        return codePointMap;
    }

    private boolean contains(int[] map, int codePoint) {
        for (int i=0; i<map.length; i += 2) {
            if (map[i] == codePoint) {
                return true;
            }
        }
        return false;
    }

    private boolean contains(int[] map, int codePoint, int matchType) {
        for (int i=0; i<map.length; i += 2) {
            if (map[i] == codePoint && map[i+1] == matchType) {
                return true;
            }
        }
        return false;
    }

    private int[] expandAndAdd(int[] srcMap, int codePoint, int matchType) {
        final int oldLen = srcMap.length;
        int[] newMap = new int[oldLen + 2];

        System.arraycopy(srcMap, 0, newMap, 0, oldLen);
        newMap[oldLen] = codePoint;
        newMap[oldLen+1] = matchType;
        return newMap;
    }
}
