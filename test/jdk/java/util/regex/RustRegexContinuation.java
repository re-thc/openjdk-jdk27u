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
 * @summary Preserve Matcher continuation after failed operations without reset
 * @modules java.base/java.util.regex:open
 * @run main/othervm -Xint RustRegexContinuation
 * @run main/othervm -Xint -XX:-UseRustRegexIntrinsics RustRegexContinuation
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch RustRegexContinuation
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch -XX:-UseRustRegexIntrinsics RustRegexContinuation
 * @run main/othervm -XX:-TieredCompilation -Xbatch RustRegexContinuation
 * @run main/othervm -XX:-TieredCompilation -Xbatch -XX:-UseRustRegexIntrinsics RustRegexContinuation
 * @run main/othervm -XX:-UseRustRegex RustRegexContinuation
 * @run main/othervm -XX:-CompactStrings RustRegexContinuation
 */

import java.lang.reflect.Method;
import java.lang.reflect.Field;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RustRegexContinuation {
    private static final Method JAVA;
    private static int comparisons;
    static {
        try {
            JAVA = Pattern.class.getDeclaredMethod("ensureJava");
            JAVA.setAccessible(true);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private static Pattern reference(String expression) throws Exception {
        Pattern pattern = Pattern.compile(expression);
        JAVA.invoke(pattern);
        return pattern;
    }

    private static boolean operation(Matcher matcher, int mode) {
        return switch (mode) {
            case 0 -> matcher.find();
            case 1 -> matcher.lookingAt();
            default -> matcher.matches();
        };
    }

    private static String state(Matcher matcher, boolean found, boolean flags) {
        StringBuilder result = new StringBuilder().append(found);
        if (found) {
            for (int group = 0; group <= matcher.groupCount(); group++) {
                result.append('/').append(matcher.start(group)).append(':')
                        .append(matcher.end(group)).append(':').append(matcher.group(group));
            }
        }
        if (flags) result.append('/').append(matcher.hitEnd()).append('/').append(matcher.requireEnd());
        return result.toString();
    }

    private static void equal(Matcher actual, Matcher expected, boolean a, boolean b, boolean flags) {
        String av = state(actual, a, flags), bv = state(expected, b, flags);
        if (!av.equals(bv)) {
            throw new AssertionError(actual.pattern() + " region=" + actual.regionStart() + ":"
                    + actual.regionEnd() + " actual=" + av + " expected=" + bv);
        }
        comparisons++;
    }

    public static void main(String[] args) throws Exception {
        Matcher warm = Pattern.compile("(ab)+").matcher("ab".repeat(64));
        for (int i = 0; i < 20_000; i++) {
            if (!warm.reset().matches() || !warm.reset().lookingAt() || !warm.reset().find()) {
                throw new AssertionError("warmup match");
            }
        }
        String[] expressions = {"(ab)+", "(ab)+x|b", "a?b", "(ab)+x", "a{1,3}b", "a*?b",
                "(?:ab)+x|b", "(a|ab)+x", "(a)?b", "a.*b|a", "a*", "(?:)",
                "error([0-9]+)", "(error)[0-9]+", "(?<prefix>error)(?<number>[0-9]+)", "(1)([0-9]+)", "[0-9]+", "^a?b$", "a?b$", "([a-z0-9_]+)@([a-z0-9_]+)\\.[a-z]{2,4}",
                "[0-9]{3}-[0-9]{2}-[0-9]{4}", "\\d{3}-\\d{2}-\\d{4}"};
        String[] inputs = {"", "abx", "abz", "ax", "ababx", "aabx", "b", "abcabx",
                "123x", "error123x", "errorx", "a\n", "\u0100abx", "abx" + "!".repeat(125),
                "abz" + "!".repeat(125), "ax" + "!".repeat(126), "a@b.c", "a@b.co!",
                "123-45-6789", "123-xx-6789", "123-45-xxxx"};
        for (int repetition = 0; repetition < 3; repetition++) {
            for (String expression : expressions) {
                Pattern ref = reference(expression);
                for (String input : inputs) {
                    for (int mode = 0; mode < 3; mode++) {
                        for (int sequence = 0; sequence < 6; sequence++) {
                            for (int lo : new int[]{0, input.length() / 2}) {
                                Pattern pattern = Pattern.compile(expression);
                                Matcher a = pattern.matcher(input).region(lo, input.length());
                                Matcher b = ref.matcher(input).region(lo, input.length());
                                equal(a, b, operation(a, mode), operation(b, mode), sequence == 1);
                                if (sequence == 2 || sequence == 3) {
                                    // Keep position across both native and unsupported-pattern transitions.
                                    String next = sequence == 2 ? "." : "(?=.)";
                                    a.usePattern(Pattern.compile(next));
                                    b.usePattern(reference(next));
                                } else if (sequence == 4) {
                                    // Reset clears continuation but preserves the old end flags.
                                    a.reset("other");
                                    b.reset("other");
                                    equal(a, b, false, false, true);
                                } else if (sequence == 5) {
                                    a.useTransparentBounds(true).useAnchoringBounds(false);
                                    b.useTransparentBounds(true).useAnchoringBounds(false);
                                }
                                for (int next = 0; next < 3; next++) {
                                    equal(a, b, a.find(), b.find(), sequence != 0);
                                }
                                equal(a, b, a.lookingAt(), b.lookingAt(), true);
                                equal(a, b, a.matches(), b.matches(), true);
                            }
                        }
                    }
                }
            }
        }
        for (int mode : new int[]{1, 2}) {
            StringBuilder mutable = new StringBuilder("abz");
            Matcher a = Pattern.compile("(ab)+x").matcher(mutable);
            Matcher b = reference("(ab)+x").matcher(mutable);
            equal(a, b, a.find(), b.find(), false);
            mutable.setCharAt(0, 'x');
            mutable.setCharAt(1, 'x');
            equal(a, b, operation(a, mode), operation(b, mode), false);
            a.usePattern(Pattern.compile("."));
            b.usePattern(reference("."));
            equal(a, b, a.find(), b.find(), true);
        }
        // Failed fixed-count probes can advance the input position. A later
        // pattern change must use that position from the original snapshot,
        // even if mutable input changes before continuation is requested.
        for (String expression : new String[]{"[0-9]{3}-[0-9]{2}-[0-9]{4}", "\\d{3}-\\d{2}-\\d{4}"}) {
            for (int mode = 0; mode < 3; mode++) for (int lo : new int[]{0, 1}) {
                for (boolean flags : new boolean[]{false, true}) for (String next : new String[]{".", "(?=.)"}) {
                    StringBuilder mutable = new StringBuilder("!123-xx-6789");
                    Matcher a = Pattern.compile(expression).matcher(mutable).region(lo, mutable.length());
                    Matcher b = reference(expression).matcher(mutable).region(lo, mutable.length());
                    equal(a, b, operation(a, mode), operation(b, mode), flags);
                    mutable.setCharAt(1, 'x');
                    mutable.setCharAt(4, '?');
                    a.usePattern(Pattern.compile(next));
                    b.usePattern(reference(next));
                    equal(a, b, a.find(), b.find(), true);
                }
            }
        }
        // A Java choice for a small region or a repeated early hit must not
        // permanently disable the same Pattern's long native searches.
        Field backend = Pattern.class.getDeclaredField("rustRegex");
        backend.setAccessible(true);
        for (String expression : new String[]{"error[0-9]+", "(?:error|warning|fatal)[0-9]+",
                "[0-9]{3}-[0-9]{2}-[0-9]{4}"}) {
            Pattern pattern = Pattern.compile(expression);
            Object engine = backend.get(pattern);
            Matcher a = pattern.matcher("!!!!!!!!");
            Matcher b = reference(expression).matcher("!!!!!!!!");
            equal(a, b, a.find(), b.find(), false);
            String hit = expression.startsWith("[0-9]") ? "123-45-6789!!!!!" : "error123!!!!!!!!";
            for (int i = 0; i < 3; i++) {
                a.reset(hit); b.reset(hit);
                equal(a, b, a.find(), b.find(), false);
            }
            a.reset("!".repeat(4096)); b.reset("!".repeat(4096));
            equal(a, b, a.find(), b.find(), false);
            if (engine != null && backend.get(pattern) != engine)
                throw new AssertionError("small/early match promoted " + expression);
            equal(a, b, false, false, true);
        }
        System.out.println("Compared " + comparisons + " continuation results and end states");
    }
}
