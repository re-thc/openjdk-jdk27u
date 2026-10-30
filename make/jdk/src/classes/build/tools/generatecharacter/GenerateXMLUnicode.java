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

package build.tools.generatecharacter;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import static build.tools.generatecharacter.UnicodeSpec.*;

/** Generates Xerces' BMP category ranges from the target JDK's Unicode data. */
public final class GenerateXMLUnicode {
    // These indices follow Token.categoryNames, after UnicodeSpec's categories.
    private static final int LETTER = 31;
    private static final int MARK = 32;
    private static final int NUMBER = 33;
    private static final int SEPARATOR = 34;
    private static final int OTHER = 35;
    private static final int PUNCTUATION = 36;
    private static final int SYMBOL = 37;
    private static final int CATEGORY_COUNT = 38;
    private static final int BMP_LIMIT = 0x10000;

    // Leave ample room below the VM's 64K bytecode limit, even if the Unicode
    // data becomes much more fragmented. Large arrays are filled in chunks.
    private static final int METHOD_ENDPOINTS = 2048;

    public static void main(String[] args) throws IOException {
        if (args.length != 2) {
            throw new IllegalArgumentException(
                    "Usage: GenerateXMLUnicode UnicodeData.txt UnicodeRanges.java");
        }
        int[] types = readTypes(Path.of(args[0]));
        List<List<Integer>> ranges = new ArrayList<>();
        for (int category = 0; category < CATEGORY_COUNT; category++) {
            List<Integer> endpoints = new ArrayList<>();
            int start = -1;
            for (int cp = 0; cp <= BMP_LIMIT; cp++) {
                boolean matches = cp < BMP_LIMIT
                        && (types[cp] == category || aggregate(types[cp]) == category);
                if (matches && start < 0) {
                    start = cp;
                } else if (!matches && start >= 0) {
                    endpoints.add(start);
                    endpoints.add(cp - 1);
                    start = -1;
                }
            }
            ranges.add(endpoints);
        }
        Files.writeString(Path.of(args[1]), source(ranges), StandardCharsets.UTF_8);
    }

    private static int[] readTypes(Path data) throws IOException {
        // Missing code points have category Cn (zero), as in GenerateCharacter.
        int[] types = new int[BMP_LIMIT];
        UnicodeSpec first = null;
        int previous = -1;
        try (var reader = Files.newBufferedReader(data, StandardCharsets.UTF_8)) {
            String line;
            while ((line = reader.readLine()) != null) {
                UnicodeSpec spec = UnicodeSpec.parse(line);
                if (spec == null || spec.getCodePoint() <= previous) {
                    throw new IOException("Invalid or unordered Unicode data: " + line);
                }
                int cp = spec.getCodePoint();
                previous = cp;
                if (spec.getName().endsWith(", First>")) {
                    if (first != null) {
                        throw new IOException("Nested Unicode range: " + line);
                    }
                    first = spec;
                } else if (spec.getName().endsWith(", Last>")) {
                    if (first == null || first.getGeneralCategory() != spec.getGeneralCategory()
                            || !first.getName().replace(", First>", "")
                                    .equals(spec.getName().replace(", Last>", ""))) {
                        throw new IOException("Unmatched Unicode range: " + line);
                    }
                    if (first.getCodePoint() < BMP_LIMIT) {
                        Arrays.fill(types, first.getCodePoint(), Math.min(cp + 1, BMP_LIMIT),
                                spec.getGeneralCategory());
                    }
                    first = null;
                } else {
                    if (first != null) {
                        throw new IOException("Unterminated Unicode range: " + line);
                    }
                    if (cp < BMP_LIMIT) {
                        types[cp] = spec.getGeneralCategory();
                    }
                }
            }
        }
        if (first != null) {
            throw new IOException("Unterminated Unicode range at end of " + data);
        }
        // Preserve Token's XML-specific Pi/Pf corrections, conditional on the
        // original category being Ps or Pe. Do not classify supplementary code
        // points here: Token deliberately treats those differently from Character.
        for (int cp = 0; cp < types.length; cp++) {
            if (types[cp] == START_PUNCTUATION || types[cp] == END_PUNCTUATION) {
                types[cp] = switch (cp) {
                    case 0x00AB, 0x2018, 0x201B, 0x201C, 0x201F, 0x2039 -> INITIAL_QUOTE_PUNCTUATION;
                    case 0x00BB, 0x2019, 0x201D, 0x203A -> FINAL_QUOTE_PUNCTUATION;
                    default -> types[cp];
                };
            }
        }
        return types;
    }

    private static int aggregate(int type) {
        return switch (type) {
            case UPPERCASE_LETTER, LOWERCASE_LETTER, TITLECASE_LETTER,
                    MODIFIER_LETTER, OTHER_LETTER -> LETTER;
            case NON_SPACING_MARK, COMBINING_SPACING_MARK, ENCLOSING_MARK -> MARK;
            case DECIMAL_DIGIT_NUMBER, LETTER_NUMBER, OTHER_NUMBER -> NUMBER;
            case SPACE_SEPARATOR, LINE_SEPARATOR, PARAGRAPH_SEPARATOR -> SEPARATOR;
            case CONTROL, FORMAT, SURROGATE, PRIVATE_USE, UNASSIGNED -> OTHER;
            case CONNECTOR_PUNCTUATION, DASH_PUNCTUATION, START_PUNCTUATION,
                    END_PUNCTUATION, INITIAL_QUOTE_PUNCTUATION,
                    FINAL_QUOTE_PUNCTUATION, OTHER_PUNCTUATION -> PUNCTUATION;
            case MATH_SYMBOL, CURRENCY_SYMBOL, MODIFIER_SYMBOL, OTHER_SYMBOL -> SYMBOL;
            default -> throw new IllegalArgumentException("Unknown category: " + type);
        };
    }

    private static String source(List<List<Integer>> ranges) {
        StringBuilder out = new StringBuilder("""
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

                // Generated by build.tools.generatecharacter.GenerateXMLUnicode.
                // Do not edit. The input is java.base's UnicodeData.txt.
                package com.sun.org.apache.xerces.internal.impl.xpath.regex;

                final class UnicodeRanges {
                    private UnicodeRanges() { }

                    // Factories retain no second representation of the range data.
                    // This class is used only by Token's lazy category initialization.
                    static RangeToken[] create() {
                """);
        out.append("        RangeToken[] ranges = new RangeToken[").append(CATEGORY_COUNT).append("];\n");
        out.append("        for (int i = 0; i < ranges.length; i++) {\n");
        out.append("            ranges[i] = Token.createRange();\n        }\n");
        for (int i = 0; i < ranges.size(); i++) {
            if (!ranges.get(i).isEmpty()) {
                out.append("        ranges[").append(i).append("].ranges = category").append(i).append("();\n");
                out.append("        ranges[").append(i).append("].sorted = true;\n");
            }
        }
        out.append("        return ranges;\n    }\n");
        for (int i = 0; i < ranges.size(); i++) {
            List<Integer> endpoints = ranges.get(i);
            if (endpoints.isEmpty()) {
                continue;
            }
            out.append("\n    private static int[] category").append(i).append("() {\n");
            if (endpoints.size() <= METHOD_ENDPOINTS) {
                out.append("        return new int[] {\n");
                for (int j = 0; j < endpoints.size(); j++) {
                    if (j % 8 == 0) {
                        out.append("            ");
                    }
                    out.append(hex(endpoints.get(j))).append(',');
                    out.append(j % 8 == 7 || j == endpoints.size() - 1 ? '\n' : ' ');
                }
                out.append("        };\n    }\n");
            } else {
                out.append("        int[] ranges = new int[").append(endpoints.size()).append("];\n");
                for (int j = 0; j < endpoints.size(); j += METHOD_ENDPOINTS) {
                    out.append("        fill").append(i).append('_').append(j).append("(ranges);\n");
                }
                out.append("        return ranges;\n    }\n");
                for (int j = 0; j < endpoints.size(); j += METHOD_ENDPOINTS) {
                    out.append("\n    private static void fill").append(i).append('_').append(j)
                            .append("(int[] ranges) {\n");
                    for (int k = j; k < Math.min(j + METHOD_ENDPOINTS, endpoints.size()); k++) {
                        out.append("        ranges[").append(k).append("] = ")
                                .append(hex(endpoints.get(k))).append(";\n");
                    }
                    out.append("    }\n");
                }
            }
        }
        return out.append("}\n").toString();
    }

    private static String hex(int value) {
        return String.format(Locale.ROOT, "0x%04X", value);
    }
}
