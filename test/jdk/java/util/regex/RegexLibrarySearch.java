/*
 * Copyright (c) 2026, the openjdk-jdk27u contributors. All rights reserved.
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
 * @summary Compare managed-library fixed-width searches with the original CharSequence path
 * @run main RegexLibrarySearch
 */

import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexLibrarySearch {
    private static final String UUID = "[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}";
    private static final String DATE = "([0-9]{4})-([0-9]{2})-([0-9]{2})";
    private static int checks;

    public static void main(String[] args) {
        String[] patterns = { UUID, DATE };
        String[] values = { "01234567-abCD-0123-4567-89abcdef0123", "2026-10-03" };
        for (int kind = 0; kind < patterns.length; kind++) {
            for (String fill : new String[] { "x", "f", "中", "\uD800", "😀" }) {
                for (int length : new int[] { 131071, 131072, 131073 }) {
                    String padding = fill.repeat(length / fill.length() + 1).substring(0, length);
                    for (int offset : new int[] { 0, 1, 511, 512, 1023, length - values[kind].length(), length }) {
                        String input = padding.substring(0, offset) + values[kind] + padding.substring(offset);
                        for (int flags : new int[] { 0, Pattern.CASE_INSENSITIVE, Pattern.LITERAL }) {
                            compare(Pattern.compile(patterns[kind], flags), input, 0, input.length(), false);
                            compare(Pattern.compile(patterns[kind], flags), input, 3, input.length() - 3, true);
                        }
                    }
                    compare(Pattern.compile(patterns[kind]), padding, 0, padding.length(), false);
                }
            }
        }
        for (String regex : new String[] { "fo(o+)\\1", "fo(?=o)", "(?i)foo", "[a-z]+", "", DATE + "$" }) {
            compare(Pattern.compile(regex), "x".repeat(131072) + "fooo2026-10-03", 0, 131085, true);
        }
        System.out.println("Compared " + checks + " searches");
    }

    private static void compare(Pattern pattern, String input, int from, int to, boolean transparent) {
        Matcher actual = pattern.matcher(input).region(from, to).useTransparentBounds(transparent);
        Matcher expected = pattern.matcher(new StringBuilder(input)).region(from, to).useTransparentBounds(transparent);
        for (int n = 0; n <= input.length() + 1; n++) {
            boolean a = actual.find();
            boolean e = expected.find();
            check(a == e && actual.hitEnd() == expected.hitEnd()
                    && actual.requireEnd() == expected.requireEnd(), "find/flags", pattern);
            checks++;
            if (!a) break;
            for (int g = 0; g <= actual.groupCount(); g++) {
                check(actual.start(g) == expected.start(g) && actual.end(g) == expected.end(g)
                        && Objects.equals(actual.group(g), expected.group(g)), "capture", pattern);
            }
        }
        check(actual.reset().matches() == expected.reset().matches(), "matches", pattern);
        check(actual.reset().lookingAt() == expected.reset().lookingAt(), "lookingAt", pattern);
        check(actual.reset().replaceAll("<$0>").equals(expected.reset().replaceAll("<$0>")), "replaceAll", pattern);
        for (int start : new int[] { 0, 512, input.length() }) {
            boolean a = actual.find(start);
            boolean e = expected.find(start);
            check(a == e && actual.hitEnd() == expected.hitEnd()
                    && actual.requireEnd() == expected.requireEnd(), "find(int)/flags", pattern);
            if (a) check(actual.start() == expected.start() && actual.end() == expected.end(), "find(int) range", pattern);
            checks++;
        }
    }

    private static void check(boolean ok, String operation, Pattern pattern) {
        if (!ok) throw new AssertionError(operation + " for " + pattern);
    }
}
