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
 * @summary Verify literal-prefix searches against the general CharSequence path
 * @run main LiteralPrefixSearch
 */

import java.util.Objects;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class LiteralPrefixSearch {
    private static final String[] REGEXES = {
        "ab", "foo", "fo(o+)", "fo(?=o)", "fo(?!x)", "fo$", "fo\\b",
        "fo(?<capture>o)\\k<capture>", "fo(o+)\\1", "fo(a+)+b",
        "fo(?:o|ox)", "fo.*?z", "fo.*z", "fo(?<=fo)o", "fo(?=o$)",
        "foo|ab", "(foo)", "(?i)foo", "^foo", "foobar", "a+b",
        "fo.{2147483647}.{2147483647}x",
        "fo\\x{1f600}", "\\ud800x", "éé", "中中", "", "(?=foo)"
    };
    private static int checks;

    public static void main(String[] args) {
        for (String regex : REGEXES) {
            for (int flags : new int[] {0, Pattern.LITERAL,
                    Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE,
                    Pattern.CANON_EQ, Pattern.UNICODE_CHARACTER_CLASS}) {
                Pattern p = Pattern.compile(regex, flags);
                for (int length : new int[] {0, 1, 2, 8, 63, 64, 65, 66, 127, 128, 1024}) {
                    for (String fill : new String[] {"x", "f", "é", "中", "\ud83d\ude00", "\ud800"}) {
                        String padding = fill.repeat(length);
                        compare(p, padding + "foofooabz", 0, padding.length() + 9, false, true);
                        compare(p, padding + "foofooabz", 0, padding.length() + 2, true, false);
                        compare(p, "foofooabz" + padding, 1, padding.length() + 8, false, false);
                    }
                }
            }
        }
        Random random = new Random(0x5ca11ab1eL);
        String[] pieces = {"x", "f", "o", "a", "b", "z", "\n", "é", "中",
                           "\ud83d\ude00", "\ud800", "\udc00", "\u0000"};
        for (int n = 0; n < 3000; n++) {
            StringBuilder input = new StringBuilder();
            for (int j = 0, length = random.nextInt(200); j < length; j++) {
                input.append(pieces[random.nextInt(pieces.length)]);
            }
            int from = random.nextInt(input.length() + 1);
            int to = from + random.nextInt(input.length() - from + 1);
            compare(Pattern.compile(REGEXES[random.nextInt(REGEXES.length)]),
                    input.toString(), from, to, random.nextBoolean(), random.nextBoolean());
        }
        System.out.println("Compared " + checks + " searches");
    }

    private static void compare(Pattern p, String input, int from, int to,
                                boolean transparent, boolean anchoring) {
        Matcher actual = p.matcher(input).region(from, to)
                .useTransparentBounds(transparent).useAnchoringBounds(anchoring);
        Matcher expected = p.matcher(new StringBuilder(input)).region(from, to)
                .useTransparentBounds(transparent).useAnchoringBounds(anchoring);
        for (int n = 0; n <= input.length() + 1; n++) {
            boolean a = actual.find();
            boolean e = expected.find();
            check(a == e, p, input, "find");
            check(actual.hitEnd() == expected.hitEnd(), p, input, "hitEnd");
            check(actual.requireEnd() == expected.requireEnd(), p, input, "requireEnd");
            checks++;
            if (!a) {
                break;
            }
            for (int group = 0; group <= actual.groupCount(); group++) {
                check(actual.start(group) == expected.start(group), p, input, "start");
                check(actual.end(group) == expected.end(group), p, input, "end");
                check(Objects.equals(actual.group(group), expected.group(group)), p, input, "group");
            }
            check(actual.toMatchResult().group().equals(expected.toMatchResult().group()),
                    p, input, "snapshot");
        }
        check(actual.reset().matches() == expected.reset().matches(), p, input, "matches");
        check(actual.reset().lookingAt() == expected.reset().lookingAt(), p, input, "lookingAt");
        check(actual.reset().replaceAll("<$0>").equals(expected.reset().replaceAll("<$0>")),
                p, input, "replaceAll");
    }

    private static void check(boolean ok, Pattern p, String input, String operation) {
        if (!ok) {
            throw new AssertionError(operation + " for " + p + ", flags " + p.flags()
                    + ", input length " + input.length());
        }
    }
}
