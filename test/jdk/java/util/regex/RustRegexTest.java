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
 *
 */

/*
 * @test
 * @summary Differential coverage for the conservative Rust regex filter
 * @modules java.base/java.util.regex:open java.base/jdk.internal.util.regex
 * @run main/othervm -XX:-UseRustRegex RustRegexTest
 * @run main/othervm -XX:+UseRustRegex RustRegexTest
 * @run main/othervm -XX:+UseRustRegex -XX:-UseRustRegexIntrinsics RustRegexTest
 * @run main/othervm/timeout=600 -XX:+UseRustRegex -Xint RustRegexTest
 * @run main/othervm -XX:+UseRustRegex -XX:TieredStopAtLevel=1 -Xbatch RustRegexTest
 * @run main/othervm -XX:+UseRustRegex -XX:-TieredCompilation -Xbatch RustRegexTest
 * @run main/othervm -XX:+UseRustRegex -XX:-CompactStrings RustRegexTest
 */

import java.io.*;
import java.lang.reflect.Field;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;
import jdk.internal.util.regex.RustRegex;

public class RustRegexTest {
    private static final Field COMPILED;
    private static final Field FILTER;
    private static final Field MISSES;
    static {
        try {
            COMPILED = Pattern.class.getDeclaredField("rustRegexCompiled");
            FILTER = Pattern.class.getDeclaredField("rustRegex");
            MISSES = Pattern.class.getDeclaredField("rustRegexMisses");
            COMPILED.setAccessible(true);
            FILTER.setAccessible(true);
            MISSES.setAccessible(true);
        } catch (ReflectiveOperationException e) { throw new ExceptionInInitializerError(e); }
    }

    private static Pattern reference(String regex, int flags) throws Exception {
        Pattern p = Pattern.compile(regex, flags);
        COMPILED.setBoolean(p, true); // Identical Java engine, with no Rust handle.
        return p;
    }

    private static void warm(Pattern p) {
        warm(p, "x ".repeat(2048));
    }

    private static void warm(Pattern p, String input) {
        for (int i = 0; i < 12; i++) p.matcher(input).find();
    }

    private static String matchState(Matcher m, boolean found) {
        StringBuilder s = new StringBuilder();
        s.append(found).append('/').append(m.hitEnd()).append('/').append(m.requireEnd());
        if (found) {
            for (int g = 0; g <= m.groupCount(); g++)
                s.append('|').append(m.start(g)).append(':').append(m.end(g)).append(':').append(m.group(g));
        }
        return s.toString();
    }

    private static String snapshot(Matcher m) {
        StringBuilder s = new StringBuilder();
        for (int i = 0; i < 20; i++) {
            boolean found = m.find();
            s.append(matchState(m, found)).append(';');
            if (!found) break;
        }
        return s.toString();
    }

    private static void edgeCases() throws Exception {
        String padding = "z ".repeat(2048);
        // ']' is a literal at the start of a class in both dialects. A NUL
        // goes through the length-delimited ASCII byte array, not JNI UTF-8.
        for (String regex : new String[]{"[]a]x", "[^]a]x", "a\0+b"}) {
            Pattern p = Pattern.compile(regex), ref = reference(regex, 0);
            warm(p, padding);
            if (RustRegex.ENABLED && FILTER.get(p) == null)
                throw new AssertionError("edge-case filter was not compiled: " + regex);
            String input = padding + "]x ax bx a\0\0b";
            compare(p, ref, input, 0, input.length(), false, true);
            for (int start : new int[]{0, 3, 2048, padding.length(), input.length() - 2, input.length()}) {
                warm(p, padding);
                Matcher a = p.matcher(input), b = ref.matcher(input);
                String actual = matchState(a, a.find(start)), expected = matchState(b, b.find(start));
                if (!expected.equals(actual) || !snapshot(a).equals(snapshot(b)))
                    throw new AssertionError("find(int) " + regex + " start=" + start);
            }
            // Exclude all candidates while leaving an eligible long search.
            warm(p, padding);
            String beforeStart = "]x ax bx a\0\0b" + padding;
            Matcher a = p.matcher(beforeStart), b = ref.matcher(beforeStart);
            String actualState = matchState(a, a.find(32)), expectedState = matchState(b, b.find(32));
            if (!expectedState.equals(actualState) || !actualState.startsWith("false/"))
                throw new AssertionError("find(int) did not exclude earlier candidates: " + regex);
            for (int start : new int[]{-1, input.length() + 1}) {
                try {
                    p.matcher(input).find(start);
                    throw new AssertionError("invalid find(int) accepted");
                } catch (IndexOutOfBoundsException expected) { }
            }
        }

        Pattern p = Pattern.compile("error[0-9]+"), ref = reference(p.pattern(), 0);
        // Anchored operations must neither learn misses nor compile a filter.
        for (int i = 0; i < 12; i++) {
            for (boolean entire : new boolean[]{false, true}) {
                Matcher a = p.matcher(padding), b = ref.matcher(padding);
                boolean actual = entire ? a.matches() : a.lookingAt();
                boolean expected = entire ? b.matches() : b.lookingAt();
                if (!matchState(a, actual).equals(matchState(b, expected)))
                    throw new AssertionError("anchored match state");
            }
        }
        if (MISSES.getInt(p) != 0 || COMPILED.getBoolean(p) || FILTER.get(p) != null)
            throw new AssertionError("anchored operation entered filter learning");
        warm(p);
        int misses = MISSES.getInt(p);
        Object cached = FILTER.get(p);
        for (boolean entire : new boolean[]{false, true}) {
            Matcher a = p.matcher(padding), b = ref.matcher(padding);
            boolean actual = entire ? a.matches() : a.lookingAt();
            boolean expected = entire ? b.matches() : b.lookingAt();
            if (!matchState(a, actual).equals(matchState(b, expected)))
                throw new AssertionError("anchored operation used cached filter");
        }
        if (MISSES.getInt(p) != misses || FILTER.get(p) != cached)
            throw new AssertionError("anchored operation changed filter state");

        // Rust accepts nested repetition as a superset of Java possessive
        // repetition. A Rust candidate must still run the Java matcher.
        Pattern possessive = Pattern.compile("x*+x");
        warm(possessive);
        String input = "x ".repeat(2048);
        RustRegex filter = (RustRegex) FILTER.get(possessive);
        if (RustRegex.ENABLED && filter == null)
            throw new AssertionError("possessive superset case not compiled");
        if (filter != null && !filter.mayMatch(input, 0, input.length()))
            throw new AssertionError("Rust nested repetition did not broaden the language");
        if (possessive.matcher(input).find())
            throw new AssertionError("Rust candidate changed Java possessive semantics");
        compare(possessive, reference(possessive.pattern(), 0), padding, 0, padding.length(), false, true);
    }

    private static void compare(Pattern p, Pattern ref, CharSequence input, int lo, int hi,
                                boolean transparent, boolean anchoring) {
        Matcher a = p.matcher(input).region(lo, hi).useTransparentBounds(transparent).useAnchoringBounds(anchoring);
        Matcher b = ref.matcher(input).region(lo, hi).useTransparentBounds(transparent).useAnchoringBounds(anchoring);
        String expected = snapshot(b), actual = snapshot(a);
        if (!expected.equals(actual))
            throw new AssertionError(p + " bounds=" + lo + "," + hi + " expected=" + expected + " actual=" + actual);
    }

    public static void main(String[] args) throws Exception {
        edgeCases();
        String[] patterns = {
            "error[0-9]+", "(error|warn): (\\w+)", "[0-9]{3}-[0-9]{2}-[0-9]{4}",
            "a+b", "a.*b", "a.b", "[a-z]+[0-9]+", "[^x]+z", "\\d+", "\\D+",
            "\\s+q", "\\S+q", "\\w+q", "\\W+q", "(?:error|warn)[0-9]+",
            "ab.*z|b", "a+?b", "a{2,4}b", "[a-z&&[^b]]+", "[aa~~a]+", "[a||b]+", "[a-z--c]+",
            "(?<name>a+)b", "(?=error)error", "(?<=x)error", "(a)\\1", "^error", "error$",
            "\\bword\\b", "\\Gx", "a*", "", "literal", "a++b", "\\Qerror\\E", "(?i)error",
            "é+", "\\p{L}+", "[\\x{10000}-\\x{10002}]", "\\R", "\\X"
        };
        String[] inputs = {
            "x ".repeat(2048), "~|c " + "x ".repeat(2048), "error123 " + "x ".repeat(2048), "x ".repeat(2048) + "error123",
            "a" + "x ".repeat(2047) + "b", "a" + "x ".repeat(2047) + "x",
            "x".repeat(2048) + "abbb", "x".repeat(2048) + "a\nb",
            "é x ".repeat(1024), "😀 x ".repeat(820), "\uD800 x ".repeat(1024),
            "\r\n\u0085\u000b\u000c\tx ".repeat(700), "x ".repeat(1024).substring(0, 2047), "x ".repeat(1024),
            "x ".repeat(32768), "x ".repeat(32769).substring(0, 65537)
        };
        int cases = 0;
        for (String regex : patterns) {
            Pattern p = Pattern.compile(regex), ref = reference(regex, 0);
            warm(p);
            for (String input : inputs) {
                for (boolean transparent : new boolean[]{false, true}) {
                    for (boolean anchoring : new boolean[]{false, true}) {
                        compare(p, ref, input, 0, input.length(), transparent, anchoring);
                        compare(p, ref, input, 7, input.length() - 3, transparent, anchoring);
                        cases += 2;
                    }
                }
                compare(p, ref, new StringBuilder(input), 0, input.length(), false, true);
                if (!p.matcher(input).replaceAll("!").equals(ref.matcher(input).replaceAll("!")))
                    throw new AssertionError("replacement " + regex);
                if (!Arrays.equals(p.split(input), ref.split(input))) throw new AssertionError("split " + regex);
            }
        }
        for (int flags : new int[]{Pattern.CASE_INSENSITIVE, Pattern.MULTILINE, Pattern.DOTALL,
                Pattern.UNICODE_CHARACTER_CLASS, Pattern.COMMENTS, Pattern.LITERAL, Pattern.CANON_EQ}) {
            Pattern p = Pattern.compile("error[0-9]+", flags), ref = reference(p.pattern(), flags);
            warm(p);
            compare(p, ref, inputs[0], 0, inputs[0].length(), false, true);
            if (FILTER.get(p) != null) throw new AssertionError("unsupported flags accelerated");
        }
        Pattern shared = Pattern.compile("error[0-9]+");
        warm(shared);
        // Exercise compiled C1/C2 callers and concurrent reuse of immutable DFAs.
        try (ExecutorService pool = Executors.newFixedThreadPool(4)) {
            List<Callable<Void>> work = new ArrayList<>();
            for (int t = 0; t < 4; t++) work.add(() -> {
                for (int i = 0; i < 4000; i++) {
                    if (shared.matcher(inputs[0]).find()) throw new AssertionError("concurrent search");
                    if ((i & 1023) == 0) System.gc();
                }
                return null;
            });
            for (Future<Void> f : pool.invokeAll(work)) f.get();
        }
        if (RustRegex.ENABLED && FILTER.get(shared) == null)
            throw new AssertionError("eligible pattern never compiled");
        if (RustRegex.ENABLED && FILTER.get(shared) != null) {
            Object cached = FILTER.get(shared);
            if (!shared.matcher(inputs[2]).find() || MISSES.getInt(shared) != 0)
                throw new AssertionError("successful probe did not pause filtering");
            warm(shared);
            if (FILTER.get(shared) != cached || MISSES.getInt(shared) != 8)
                throw new AssertionError("filter was not reused after further misses");
        }
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (ObjectOutputStream out = new ObjectOutputStream(bytes)) { out.writeObject(shared); }
        Pattern restored;
        try (ObjectInputStream in = new ObjectInputStream(new ByteArrayInputStream(bytes.toByteArray()))) {
            restored = (Pattern)in.readObject();
        }
        if (FILTER.get(restored) != null) throw new AssertionError("native handle serialized");
        warm(restored);
        compare(restored, reference(shared.pattern(), 0), inputs[2], 0, inputs[2].length(), false, true);
        Matcher reset = shared.matcher(inputs[2]);
        reset.find();
        reset.reset(inputs[0]);
        if (reset.find()) throw new AssertionError("reset");
        reset.usePattern(Pattern.compile("x+"));
        if (!reset.find()) throw new AssertionError("usePattern");
        System.out.println("Compared " + cases + " bound/state cases; Rust enabled=" + RustRegex.ENABLED);
    }
}
