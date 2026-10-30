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
 * @summary Reuse prepared engines and literal candidates while preserving Matcher state
 * @modules java.base/java.util.regex:open java.base/jdk.internal.util.regex:+open
 * @run main/othervm RustRegexLiteralReuse
 * @run main/othervm -XX:-UseRustRegex RustRegexLiteralReuse
 * @run main/othervm -XX:-UseRustRegexIntrinsics RustRegexLiteralReuse
 * @run main/othervm -Xint RustRegexLiteralReuse
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch RustRegexLiteralReuse
 * @run main/othervm -XX:-TieredCompilation -Xbatch RustRegexLiteralReuse
 */

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jdk.internal.util.regex.RustRegex;

public class RustRegexLiteralReuse {
    private static final Field BACKEND, ROOT, MATCH_ROOT, HANDLE, JAVA_PATTERN, TIER;
    private static final Field FIRST, LAST, OLD_LAST;
    private static final Constructor<Pattern> ORIGINAL;

    static {
        try {
            BACKEND = Pattern.class.getDeclaredField("rustRegex");
            ROOT = Pattern.class.getDeclaredField("root");
            MATCH_ROOT = Pattern.class.getDeclaredField("matchRoot");
            HANDLE = RustRegex.class.getDeclaredField("handle");
            JAVA_PATTERN = RustRegex.class.getDeclaredField("javaPattern");
            TIER = RustRegex.class.getDeclaredField("JAVA_TIER");
            FIRST = Matcher.class.getDeclaredField("first");
            LAST = Matcher.class.getDeclaredField("last");
            OLD_LAST = Matcher.class.getDeclaredField("oldLast");
            ORIGINAL = Pattern.class.getDeclaredConstructor(String.class, int.class, boolean.class);
            ORIGINAL.setAccessible(true);
            for (Field field : new Field[]{BACKEND, ROOT, MATCH_ROOT, HANDLE, JAVA_PATTERN, TIER, FIRST, LAST, OLD_LAST})
                field.setAccessible(true);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    public static void main(String[] args) throws Exception {
        int sequence = 0;
        for (boolean captures : new boolean[]{false, true}) {
            for (int length : new int[]{16, 8, 64, 256, 0, 257}) {
                String prefix = "reuseprobe" + sequence++;
                String expression = captures ? "(?<word>" + prefix + ")(?<digits>[0-9]+)"
                        : prefix + "[0-9]+";
                Pattern pattern = Pattern.compile(expression);
                Pattern reference = ORIGINAL.newInstance(expression, 0, false);
                Object engine = BACKEND.get(pattern);
                String warm = "x ".repeat(2048) + prefix + "123!";
                compare(pattern.matcher(warm), reference.matcher(warm), false);
                long handle = engine == null ? 0 : HANDLE.getLong(engine);
                if (RustRegex.ENABLED && (engine == null || handle == 0))
                    throw new AssertionError("fixture did not prepare its native handle");

                String miss = "x ".repeat(length / 2) + (length % 2 == 0 ? "" : "x");
                Matcher actual = pattern.matcher(miss), expected = reference.matcher(miss);
                for (int use = 0; use < 32; use++) {
                    actual.reset(); expected.reset();
                    compare(actual, expected, false);
                    if (engine != null) {
                        if (BACKEND.get(pattern) != engine || ROOT.get(pattern) != null
                                || MATCH_ROOT.get(pattern) != null || HANDLE.getLong(engine) != handle)
                            throw new AssertionError("short literal rejection replaced its prepared engine");
                        if (TIER.getInt(null) != 0 && length <= 256 && JAVA_PATTERN.get(engine) != null)
                            throw new AssertionError("literal miss compiled an unused Java sibling");
                    }
                }
                // Check public flags on fresh Matchers and cover near misses,
                // early/later hits and regions.
                for (String input : new String[]{miss, prefix, prefix + "123!", "!" + prefix + "123!"}) {
                    actual = pattern.matcher(input); expected = reference.matcher(input);
                    compare(actual, expected, true);
                    int lo = Math.min(1, input.length());
                    int hi = Math.max(lo, input.length() - 1);
                    actual.reset().region(lo, hi);
                    expected.reset().region(lo, hi);
                    compare(actual, expected, true);
                }
            }
        }
        candidatePositions();
        candidateValidation();
        admissionBoundary();
    }

    private static Pattern reference(String expression, int flags) throws Exception {
        return ORIGINAL.newInstance(expression, flags, false);
    }

    private static Object prepared(Pattern pattern, Pattern reference) throws Exception {
        Object engine = BACKEND.get(pattern);
        String warm = "!".repeat(4096) + "error123!";
        compare(pattern.matcher(warm), reference.matcher(warm), false);
        if (RustRegex.ENABLED && (engine == null || HANDLE.getLong(engine) == 0))
            throw new AssertionError("candidate fixture did not prepare native storage");
        return engine;
    }

    private static void owner(Pattern pattern, Object engine) throws Exception {
        if (engine != null && (BACKEND.get(pattern) != engine || ROOT.get(pattern) != null
                || MATCH_ROOT.get(pattern) != null))
            throw new AssertionError("literal candidate promoted its Pattern");
    }

    private static void sameState(Matcher actual, Matcher expected,
                                  boolean found, boolean reference) throws Exception {
        equal(actual, expected, found, reference, true);
        if (actual.regionStart() != expected.regionStart() || actual.regionEnd() != expected.regionEnd()
                || actual.hasTransparentBounds() != expected.hasTransparentBounds()
                || actual.hasAnchoringBounds() != expected.hasAnchoringBounds())
            throw new AssertionError("literal candidate changed hard bounds");
        for (Field field : new Field[]{FIRST, LAST, OLD_LAST})
            if (field.getInt(actual) != field.getInt(expected))
                throw new AssertionError("literal candidate changed " + field.getName());
    }

    private static String suffix(int length) {
        String tail = length >= 32 ? "eX!error12!error34!" : "error1!";
        if (length < tail.length()) return "eXerr".substring(0, Math.min(length, 5));
        return "!".repeat(length - tail.length()) + tail;
    }

    private static void candidatePositions() throws Exception {
        String[] expressions = {"error[0-9]+", "(?<word>error)(?<digits>[0-9]+)",
                "error([0-9]+)"};
        for (String expression : expressions) {
            Pattern pattern = Pattern.compile(expression), reference = reference(expression, 0);
            Object engine = prepared(pattern, reference);
            for (int remaining : new int[]{0, 1, 5, 8, 16, 32, 64, 255, 256, 257}) {
                int start = 4096 - remaining;
                int placements = remaining >= 16 ? 3 : remaining >= 7 ? 2 : 1;
                for (int placement = 0; placement < placements; placement++) {
                    // Cover an advancing candidate, a hit at the original start,
                    // and an initial false-prefix candidate followed by a hit.
                    String tail = placement == 0 ? suffix(remaining)
                            : placement == 1 ? "error1!" : "eX!error1!";
                    tail += "!".repeat(remaining - tail.length());
                    String input = "!".repeat(start) + tail;
                    Matcher actual = pattern.matcher(input), expected = reference.matcher(input);
                    for (int reuse = 0; reuse < 3; reuse++) {
                        sameState(actual, expected, actual.find(start), expected.find(start));
                        owner(pattern, engine);
                        sameState(actual, expected, actual.find(), expected.find());
                        owner(pattern, engine);
                    }
                }
            }
            for (boolean transparent : new boolean[]{false, true}) {
                for (boolean anchoring : new boolean[]{false, true}) {
                    markerContinuation(expression, 0, transparent, anchoring, false);
                    // A narrow hard region also exercises existing Java-sibling selection.
                    Matcher actual = pattern.matcher("!!error1").region(1, 8);
                    Matcher expected = reference.matcher("!!error1").region(1, 8);
                    actual.useTransparentBounds(transparent).useAnchoringBounds(anchoring);
                    expected.useTransparentBounds(transparent).useAnchoringBounds(anchoring);
                    for (int reuse = 0; reuse < 3; reuse++) {
                        actual.reset().region(1, 8); expected.reset().region(1, 8);
                        sameState(actual, expected, actual.find(), expected.find());
                        owner(pattern, engine);
                    }
                    if (engine != null && JAVA_PATTERN.get(engine) == null)
                        throw new AssertionError("narrow fixture did not select its Java sibling");
                }
            }
        }
        markerContinuation("error[0-9]+", 0, false, true, true);
        for (String expression : new String[]{"^error[0-9]+", "\\Aerror[0-9]+",
                "\\berror[0-9]+", "\\Gerror[0-9]+", "error[0-9]+$", "(?<=!)error[0-9]+", "(?:error)([0-9]+)"}) {
            for (boolean transparent : new boolean[]{false, true})
                for (boolean anchoring : new boolean[]{false, true})
                    markerContinuation(expression, 0, transparent, anchoring, false);
        }
        for (int flags : new int[]{Pattern.CASE_INSENSITIVE, Pattern.UNIX_LINES, Pattern.DOTALL})
            markerContinuation("error[0-9]+", flags, true, false, false);
    }

    private static void markerContinuation(String expression, int flags, boolean transparent,
                                           boolean anchoring, boolean mutable) throws Exception {
        // usePattern preserves the marker's position, unlike find(int), which resets the region.
        String input = "\u0100UT\u0100" + "!".repeat(4096 - 256 - 5) + "mark" + suffix(256) + "END";
        if ((flags & Pattern.CASE_INSENSITIVE) != 0) input = input.replace("error", "ERROR");
        CharSequence actualInput = mutable ? new StringBuilder(input) : input;
        CharSequence expectedInput = mutable ? new StringBuilder(input) : input;
        Pattern pattern = Pattern.compile(expression, flags), reference = reference(expression, flags);
        boolean literal = (flags & Pattern.CASE_INSENSITIVE) == 0 &&
                (expression.equals("error[0-9]+") || expression.equals("error([0-9]+)")
                        || expression.equals("(?<word>error)(?<digits>[0-9]+)"));
        Object engine = literal ? prepared(pattern, reference) : null;
        // Interpreted wide-region encoding can correctly promote to Java.
        Object literalOwner = TIER.getInt(null) != 0 || mutable ? engine : null;
        Matcher actual = Pattern.compile("mark").matcher(actualInput).region(3, 4099);
        Matcher expected = reference("mark", 0).matcher(expectedInput).region(3, 4099);
        actual.useTransparentBounds(transparent).useAnchoringBounds(anchoring);
        expected.useTransparentBounds(transparent).useAnchoringBounds(anchoring);
        sameState(actual, expected, actual.find(), expected.find());
        actual.usePattern(pattern); expected.usePattern(reference);
        sameState(actual, expected, actual.find(), expected.find());
        owner(pattern, literalOwner);
        if (mutable) {
            int at = input.indexOf("error12");
            ((StringBuilder)actualInput).setCharAt(at + 5, '9');
            ((StringBuilder)expectedInput).setCharAt(at + 5, '9');
            // Existing captures still read the live mutable input.
            sameState(actual, expected, true, true);
        }
        sameState(actual, expected, actual.find(), expected.find());
        owner(pattern, literalOwner);
        sameState(actual, expected, actual.find(), expected.find());
        owner(pattern, literalOwner);
        actual.usePattern(Pattern.compile("\\G!"));
        expected.usePattern(reference("\\G!", 0));
        sameState(actual, expected, actual.find(), expected.find());
        actual.usePattern(pattern).reset(input).region(3, 4099);
        expected.usePattern(reference).reset(input).region(3, 4099);
        sameState(actual, expected, actual.find(), expected.find());
        actual.reset().region(3, 4099); expected.reset().region(3, 4099);
        sameState(actual, expected, actual.lookingAt(), expected.lookingAt());
        sameState(actual, expected, actual.matches(), expected.matches());
    }

    private static void candidateValidation() throws Exception {
        for (String prefix : new String[]{"error", "aaaa", ""}) {
            String expression = prefix.isEmpty() ? "(?<digits>[0-9]+)"
                    : "(?<word>" + prefix + ")(?<digits>[0-9]+)";
            Pattern pattern = Pattern.compile(expression), reference = reference(expression, 0);
            Object engine = BACKEND.get(pattern);
            String warm = "!".repeat(4096) + prefix + "123!";
            compare(pattern.matcher(warm), reference.matcher(warm), false);
            if (RustRegex.ENABLED && (engine == null || HANDLE.getLong(engine) == 0))
                throw new AssertionError("candidate validation did not prepare native storage");
            String dense = prefix.isEmpty() ? "!".repeat(240)
                    : prefix.substring(0, 1).repeat(240);
            String partial = prefix.isEmpty() ? "!" : prefix.substring(0, prefix.length() - 1);
            for (String body : new String[]{dense, dense + prefix + "7!",
                    dense + partial, prefix, prefix + "!" + prefix + "12!",
                    prefix + "1!" + prefix + "2!", "!".repeat(256 - prefix.length()) + prefix}) {
                for (boolean bounded : new boolean[]{false, true}) {
                    String input = "!".repeat(4092) + "mark" + body + prefix + "9!";
                    int end = bounded ? 4096 + body.length() : input.length();
                    Matcher actual = Pattern.compile("mark").matcher(input).region(3, end);
                    Matcher expected = reference("mark", 0).matcher(input).region(3, end);
                    sameState(actual, expected, actual.find(), expected.find());
                    actual.usePattern(pattern); expected.usePattern(reference);
                    for (int operation = 0; operation < 3; operation++) {
                        sameState(actual, expected, actual.find(), expected.find());
                        owner(pattern, engine);
                    }
                }
            }
        }
    }

    private static void admissionBoundary() throws Exception {
        for (int remaining : new int[]{256, 257}) {
            String expression = "(?<edge" + remaining + ">error)([0-9]+)";
            Pattern pattern = Pattern.compile(expression), reference = reference(expression, 0);
            Object engine = BACKEND.get(pattern);
            if (engine != null && HANDLE.getLong(engine) != 0)
                throw new AssertionError("boundary fixture already prepared native storage");
            String input = "!error1" + "!".repeat(remaining - 7);
            Matcher actual = pattern.matcher(input), expected = reference.matcher(input);
            sameState(actual, expected, actual.find(), expected.find());
            owner(pattern, engine);
            if (engine != null) {
                boolean prepared = HANDLE.getLong(engine) != 0;
                boolean required = remaining == 257;
                if (prepared != required)
                    throw new AssertionError("candidate changed original-span admission: " + remaining);
            }
        }
    }

    private static void compare(Matcher actual, Matcher expected, boolean flags) {
        equal(actual, expected, actual.find(), expected.find(), flags);
    }

    private static void equal(Matcher actual, Matcher expected, boolean found, boolean reference,
                              boolean flags) {
        if (found != reference || actual.groupCount() != expected.groupCount())
            throw new AssertionError("literal search result");
        if (found) for (int group = 0; group <= actual.groupCount(); group++) {
            if (actual.start(group) != expected.start(group) || actual.end(group) != expected.end(group)
                    || !Objects.equals(actual.group(group), expected.group(group)))
                throw new AssertionError("literal capture " + group);
        }
        if (!actual.namedGroups().equals(expected.namedGroups()))
            throw new AssertionError("literal capture names");
        if (flags && (actual.hitEnd() != expected.hitEnd() || actual.requireEnd() != expected.requireEnd()))
            throw new AssertionError("literal end flags");
    }
}
