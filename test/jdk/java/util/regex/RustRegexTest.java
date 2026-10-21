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
 *
 */

/*
 * @test
 * @summary Native primary matching, captures, fallback and Java API state
 * @modules java.base/java.util.regex:open java.base/jdk.internal.util.regex:+open
 * @run main/othervm RustRegexTest
 * @run main/othervm -XX:-UseRustRegex RustRegexTest
 * @run main/othervm -XX:+UseRustRegex RustRegexTest
 * @run main/othervm -XX:-UseRustRegexIntrinsics RustRegexTest
 * @run main/othervm/timeout=600 -Xint RustRegexTest
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch RustRegexTest
 * @run main/othervm -XX:-TieredCompilation -Xbatch RustRegexTest
 * @run main/othervm -XX:-CompactStrings RustRegexTest
 */

import java.io.*;
import java.lang.reflect.*;
import java.nio.CharBuffer;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;
import jdk.internal.util.regex.RustRegex;

public class RustRegexTest {
    private static final Field NATIVE, ROOT, MATCH_ROOT, HANDLE, TIER;
    private static final Constructor<Pattern> JAVA;
    private static int comparisons;
    static {
        try {
            NATIVE = Pattern.class.getDeclaredField("rustRegex");
            ROOT = Pattern.class.getDeclaredField("root");
            MATCH_ROOT = Pattern.class.getDeclaredField("matchRoot");
            HANDLE = RustRegex.class.getDeclaredField("handle");
            TIER = RustRegex.class.getDeclaredField("JAVA_TIER");
            JAVA = Pattern.class.getDeclaredConstructor(String.class, int.class, boolean.class);
            for (Field f : new Field[]{NATIVE, ROOT, MATCH_ROOT, HANDLE, TIER}) f.setAccessible(true);
            JAVA.setAccessible(true);
        } catch (ReflectiveOperationException e) { throw new ExceptionInInitializerError(e); }
    }

    private static Pattern reference(String expression, int flags) throws Exception {
        // Always invoke the original Java parser, independently of prepared plans.
        return JAVA.newInstance(expression, flags, false);
    }

    private static void nativeOnly(Pattern p) throws Exception {
        if (RustRegex.ENABLED && (NATIVE.get(p) == null || ROOT.get(p) != null || MATCH_ROOT.get(p) != null))
            throw new AssertionError("not a native-only Pattern: " + p);
    }

    private static String state(Matcher m, boolean found, boolean endFlags) {
        StringBuilder s = new StringBuilder().append(found).append('/').append(m.groupCount());
        if (endFlags) s.append('/').append(m.hitEnd()).append('/').append(m.requireEnd());
        if (found) {
            for (int i = 0; i <= m.groupCount(); i++)
                s.append('|').append(m.start(i)).append(':').append(m.end(i)).append(':').append(m.group(i));
            MatchResult copy = m.toMatchResult();
            if (!copy.group().equals(m.group()) || !copy.namedGroups().equals(m.namedGroups()))
                throw new AssertionError("immutable result state");
        }
        return s.toString();
    }

    private static void equal(Matcher a, Matcher b, boolean av, boolean bv, boolean endFlags) {
        String actual = state(a, av, endFlags), expected = state(b, bv, endFlags);
        if (!actual.equals(expected)) throw new AssertionError(a.pattern()+" actual="+actual+" expected="+expected);
        comparisons++;
    }

    private static void anchored(Pattern p, Matcher reference, String input, int lo, int hi,
                                 boolean transparent, boolean anchoring, boolean endFlags) {
        Matcher actual = Pattern.compile(p.pattern(), p.flags()).matcher(input).region(lo, hi)
                .useTransparentBounds(transparent).useAnchoringBounds(anchoring);
        reference.reset().region(lo, hi).useTransparentBounds(transparent).useAnchoringBounds(anchoring);
        equal(actual, reference, actual.matches(), reference.matches(), endFlags);
        actual = Pattern.compile(p.pattern(), p.flags()).matcher(input).region(lo, hi)
                .useTransparentBounds(transparent).useAnchoringBounds(anchoring);
        reference.reset().region(lo, hi).useTransparentBounds(transparent).useAnchoringBounds(anchoring);
        equal(actual, reference, actual.lookingAt(), reference.lookingAt(), endFlags);
    }

    private static void primary() throws Exception {
        String[] expressions = {"error([0-9]+)", "(?<word>error|warn):\\s*(?<code>[0-9]+)",
                "[0-9]{3}-[0-9]{2}-[0-9]{4}", "a.*b", "a.*?b", "(a|ab)",
                "[a-z]+[0-9]+", "(?:a|bc)+d", "[]a]x", "[^]a]x", "[a-z]{2,4}?",
                "[^x]+z", "\\D+q", "(ab)+", "(a|ab)+", "(a)?b", "a{1}?b", "^foo[0-9]+$", "\\Afoo.*\\z",
                "\\bfoo\\b", "\\Q[a].\\E[0-9]+", "(a|)", "(?:)", "a*", "a+?b", "a\\x00+b"};
        String[] inputs = {"", "abc", "ab", "aba", "abab", "error123", "x error123 y", "warn: 0003",
                "foo42", "foo", "123-45-6789", "]x ax bx", "[a].123", "a\0\0b", "abc123 z q",
                "x ".repeat(2048), "x ".repeat(2048)+"error123"};
        for (String expression : expressions) {
            for (int flags : new int[]{0, Pattern.CASE_INSENSITIVE, Pattern.DOTALL, Pattern.UNIX_LINES}) {
                Pattern p = Pattern.compile(expression, flags), ref = reference(expression, flags);
                nativeOnly(p);
                Object owner = NATIVE.get(p); // Keep the weak-cache engine alive across observer controls.
                for (String input : inputs) {
                    Matcher a = p.matcher(input), b = ref.matcher(input);
                    for (int i = 0; i <= input.length()+1; i++) {
                        boolean av = a.find(), bv = b.find();
                        equal(a,b,av,bv,false);
                        if (!av) break;
                    }
                    anchored(p, b, input, 0, input.length(), false, true, false);
                    for (int start : new int[]{0, input.length()/2, input.length()})
                        equal(a,b,a.find(start),b.find(start),false);
                }
                nativeOnly(p);
                java.lang.ref.Reference.reachabilityFence(owner);
            }
            System.gc();
        }
    }

    private static void apiState() throws Exception {
        String[] expressions = {"error([0-9]+)", "a.*b|a", "a.*?b", "a*", "(a|ab)",
                "^foo[0-9]+$", "\\bfoo\\b", "[]a]x", "[^]a]x", "\\d+", "\\D+", "a.b"};
        String[] inputs = {"", "a", "ab", "abc", "foo42", "foo42\n", "a\rb", "a\u0085b",
                "x foo x", "error123 error456", "]x ax", "\u00e9\u00ff\u0100\ud83d\ude00", "x ".repeat(1024)+"error789"};
        for (String expression : expressions) {
            Pattern ref = reference(expression,0);
            for (String input : inputs) {
                for (boolean transparent : new boolean[]{false,true}) {
                    for (boolean anchoring : new boolean[]{false,true}) {
                        for (int lo : new int[]{0,input.length()/2,input.length()}) {
                            Pattern p = Pattern.compile(expression);
                            Matcher a = p.matcher(input).region(lo,input.length())
                                    .useTransparentBounds(transparent).useAnchoringBounds(anchoring);
                            Matcher b = ref.matcher(input).region(lo,input.length())
                                    .useTransparentBounds(transparent).useAnchoringBounds(anchoring);
                            equal(a,b,a.find(),b.find(),true);
                            equal(a,b,a.reset().region(lo,input.length()).matches(),
                                    b.reset().region(lo,input.length()).matches(),true);
                            equal(a,b,a.reset().region(lo,input.length()).lookingAt(),
                                    b.reset().region(lo,input.length()).lookingAt(),true);
                        }
                    }
                }
                System.gc();
            }
        }
        // End flags describe the old operation even after reset, mutation or usePattern.
        Pattern p = Pattern.compile("a.*b|a"), ref = reference(p.pattern(),0);
        StringBuilder input = new StringBuilder("abc");
        Matcher a = p.matcher(input), b = ref.matcher(input);
        equal(a,b,a.find(),b.find(),false);
        input.setLength(0);
        a.reset("other").usePattern(Pattern.compile("x+"));
        b.reset("other").usePattern(Pattern.compile("x+"));
        if (a.hitEnd()!=b.hitEnd() || a.requireEnd()!=b.requireEnd()) throw new AssertionError("saved end state");

        // Switching backends must resize capture storage for the new Pattern.
        a = Pattern.compile("error123").matcher("error123");
        b = reference("error123", 0).matcher("error123");
        for (String expression : new String[]{"error([0-9]+)", "(?=error)error([0-9]+)",
                "(error)([0-9]+)", "error123"}) {
            a.usePattern(Pattern.compile(expression)).reset();
            b.usePattern(reference(expression, 0)).reset();
            equal(a, b, a.matches(), b.matches(), false);
        }
    }

    private static void digitEndFlags() throws Exception {
        String[] expressions = {"error[0-9]+", "(?<word>error)(?<digits>\\d+)",
                "[0-9]+", "(1)([0-9]+)"};
        String[] inputs = {"", "e", "err", "erro", "error", "errorx", "error123",
                "error123x", "xerror123", "errorerror123", "11", "1234", "3".repeat(4096), "xxxx",
                "\u00fferror123", "\u0100error123", "error" + "3".repeat(4096),
                "error" + "3".repeat(4096) + "x", "x".repeat(4096),
                "!".repeat(255) + "1", "!".repeat(256) + "1",
                "!".repeat(257), "\u00ff\u0100123!", "!123!456!"};
        for (String expression : expressions) {
            Pattern p = Pattern.compile(expression), ref = reference(expression, 0);
            for (String input : inputs) {
                for (int lo : new int[]{0, input.length()/2, input.length()}) {
                    for (int hi : new int[]{lo, (lo+input.length())/2, input.length()}) {
                        for (boolean transparent : new boolean[]{false, true}) {
                            for (boolean anchoring : new boolean[]{false, true}) {
                                Matcher a = p.matcher(input).region(lo, hi)
                                        .useTransparentBounds(transparent).useAnchoringBounds(anchoring);
                                Matcher b = ref.matcher(input).region(lo, hi)
                                        .useTransparentBounds(transparent).useAnchoringBounds(anchoring);
                                while (true) {
                                    boolean av = a.find(), bv = b.find();
                                    equal(a, b, av, bv, true);
                                    if (RustRegex.ENABLED) nativeOnly(p);
                                    if (!av) break;
                                }
                                anchored(p, b, input, lo, hi, transparent, anchoring, true);
                                if (RustRegex.ENABLED) nativeOnly(p);
                            }
                        }
                    }
                }
            }
        }
        Pattern p = Pattern.compile("ready[0-9]+"), ref = reference(p.pattern(), 0);
        StringBuilder input = new StringBuilder("ready123");
        Matcher a = p.matcher(input), b = ref.matcher(input);
        equal(a, b, a.find(), b.find(), false);
        input.setLength(0);
        a.reset("other").usePattern(Pattern.compile("x+"));
        b.reset("other").usePattern(Pattern.compile("x+"));
        if (a.hitEnd() != b.hitEnd() || a.requireEnd() != b.requireEnd())
            throw new AssertionError("saved digit end state");
        if (RustRegex.ENABLED) nativeOnly(p);
        for (String suffix : new String[]{"x".repeat(131072), "\u0100".repeat(131072)}) {
            Pattern large = Pattern.compile("(?<prefix>ready)(?<digits>[0-9]+)");
            Pattern java = reference(large.pattern(), 0);
            String text = "ready123" + suffix;
            Matcher actual = large.matcher(text), expected = java.matcher(text);
            equal(actual, expected, actual.find(), expected.find(), true);
            equal(actual, expected, actual.reset().lookingAt(), expected.reset().lookingAt(), true);
            Matcher full = Pattern.compile(large.pattern()).matcher(text);
            equal(full, expected, full.matches(), expected.reset().matches(), true);
            if (RustRegex.ENABLED) {
                nativeOnly(large);
                if (HANDLE.getLong(NATIVE.get(large)) != 0)
                    throw new AssertionError("large early candidate allocated native storage");
            }
        }
        for (String padding : new String[]{"x".repeat(131072), "\u0100".repeat(131072)}) {
            Pattern region = Pattern.compile("edge[0-9]+"), java = reference(region.pattern(), 0);
            String text = padding + "edge123";
            Matcher actual = region.matcher(text), expected = java.matcher(text);
            equal(actual, expected, actual.region(0, 64).find(), expected.region(0, 64).find(), true);
            equal(actual, expected, actual.reset().region(64, 128).find(),
                    expected.reset().region(64, 128).find(), true);
            if (RustRegex.ENABLED) {
                nativeOnly(region);
                if (HANDLE.getLong(NATIVE.get(region)) != 0)
                    throw new AssertionError("short region allocated native storage");
            }
        }
    }

    private static void shortAndEarlyMatches() throws Exception {
        if (RustRegex.ENABLED) {
            Pattern p=Pattern.compile("(?<prefix>ready)(?<digits>[0-9]+)");
            Object owner=NATIVE.get(p);
            nativeOnly(p);
            if (HANDLE.getLong(owner)!=0) throw new AssertionError("short plan allocated native storage");
            if (!p.matcher("ready123").matches() || HANDLE.getLong(owner)!=0)
                throw new AssertionError("short first match compiled a Rust engine");
            if (p.matcher("x".repeat(4096)).find()) throw new AssertionError("definite long miss");
            if (TIER.getInt(null) == 2 && HANDLE.getLong(owner) != 0)
                throw new AssertionError("definite prefix miss compiled unused native storage");
            nativeOnly(p);
            // A complete literal keeps this long search unresolved by the
            // literal rejection and requires the native handoff.
            if (p.matcher("x".repeat(4090) + "readyx").find() || HANDLE.getLong(owner)==0)
                throw new AssertionError("unresolved long search did not select Rust");
            nativeOnly(p);
        }
        // Combined grammar, capture and region cases exercise the short-search
        // specialization and its handoff to Rust without observing end flags.
        String[] expressions = {"error[0-9]+", "error([0-9]+)", "(error)[0-9]+",
                "(?<word>error)(?<code>[0-9]+)", "[0-9]+", "([0-9]+)", "\\d+",
                "(?<number>\\d+)", "12[0-9]+", "(12)([0-9]+)", "e\\d+"};
        List<String> inputs = new ArrayList<>(List.of("", "error", "error0", "error123x",
                "errorx error42", "eerror3", "errorerror7", "12", "12345", "xerror12error34",
                "\u00fferror9", "error"+"1".repeat(257), "x".repeat(257)+"error123",
                "error"+"9".repeat(4096), "1".repeat(4096)));
        Random random = new Random(0x4d61746368L);
        String alphabet = "error012x \u00ff";
        for (int i=0; i<200; i++) {
            StringBuilder s = new StringBuilder();
            for (int j=0, length=random.nextInt(80); j<length; j++)
                s.append(alphabet.charAt(random.nextInt(alphabet.length())));
            if ((i&1)==0) s.append("error123");
            inputs.add(s.toString());
        }
        for (String expression : expressions) {
            for (int flags : new int[]{0, Pattern.CASE_INSENSITIVE}) {
                Pattern p=Pattern.compile(expression,flags),ref=reference(expression,flags);
                for (String input : inputs) {
                    for (int lo : new int[]{0,input.length()/2,input.length()}) {
                        for (int hi : new int[]{lo,(lo+input.length())/2,input.length()}) {
                            Matcher a=p.matcher(input).region(lo,hi),b=ref.matcher(input).region(lo,hi);
                            for (;;) {
                                boolean av=a.find(),bv=b.find();
                                equal(a,b,av,bv,false);
                                if (!av) break;
                            }
                            anchored(p, b, input, lo, hi, false, true, false);
                        }
                    }
                }
                nativeOnly(p);
            }
        }
    }

    private static void shortEmailMatches() throws Exception {
        String[] expressions = {"([a-z0-9_]+)@([a-z0-9_]+)\\.[a-z]{2,4}",
                "(?<sender>[a-z0-9_]+)@(?<host>[a-z0-9_]+)\\.[a-z]{2,4}"};
        List<String> inputs = new ArrayList<>(List.of("", "a@b.co", "a@b.c", "a@b.com",
                "a@b.comm", "a@b.commm", "!a@b.co!", "a@b@c.co", "a@b..co",
                "a_12@b_34.co", "a@B.co", "A@b.co", "a@b.CO", "\u00ff a@b.co",
                "\u0100 a@b.co", "a".repeat(31) + "@b.co", "a".repeat(32) + "@b.co",
                "a@" + "b".repeat(32) + ".co", "!".repeat(33) + "a@b.co"));
        Random random = new Random(0x456d61696cL);
        String alphabet = "ab012_@.c!\u00ff\u0100";
        for (int i = 0; i < 500; i++) {
            StringBuilder input = new StringBuilder();
            for (int j = 0, size = random.nextInt(80); j < size; j++)
                input.append(alphabet.charAt(random.nextInt(alphabet.length())));
            if ((i & 1) == 0) input.append("a@b.co");
            inputs.add(input.toString());
        }
        for (String expression : expressions) {
            Pattern owner = Pattern.compile(expression), ref = reference(expression, 0);
            nativeOnly(owner);
            for (String input : inputs) {
                for (int lo : new int[]{0, input.length() / 2, input.length()}) {
                    for (int hi : new int[]{lo, (lo + input.length()) / 2, input.length()}) {
                        Pattern p = Pattern.compile(expression);
                        Matcher a = p.matcher(input).region(lo, hi), b = ref.matcher(input).region(lo, hi);
                        boolean av = a.find(), bv = b.find();
                        equal(a, b, av, bv, false);
                        if (hi - lo <= 32 || input.chars().allMatch(c -> c <= 255)) nativeOnly(p);
                        equal(a, b, av, bv, true);
                        for (int i = 0; i < 3; i++) equal(a, b, a.find(), b.find(), true);
                        anchored(owner, b, input, lo, hi, false, true, true);
                    }
                }
            }
            nativeOnly(owner);
            java.lang.ref.Reference.reachabilityFence(owner);
        }
        if (RustRegex.ENABLED) {
            Pattern p = Pattern.compile("(?<user>[a-z0-9_]+)@(?<domain>[a-z0-9_]+)\\.[a-z]{2,4}");
            Object owner = NATIVE.get(p);
            if (HANDLE.getLong(owner) != 0) throw new AssertionError("short email allocated native storage");
            Matcher a = p.matcher("a@b.co!");
            if (!a.find() || !a.group("user").equals("a") || !a.group("domain").equals("b")
                    || HANDLE.getLong(owner) != 0)
                throw new AssertionError("short email compiled a native engine");
            if (p.matcher("! ".repeat(2048)).find() || HANDLE.getLong(owner) == 0)
                throw new AssertionError("long email search did not select Rust");
            nativeOnly(p);
        }
    }

    private static void fallbackGrammar() throws Exception {
        // The leading literal ] must remain inside the class when escaped
        // operator characters follow it, even across repeated misses and a hit.
        for (String expression : new String[]{"[]a~~a]+", "[]a\\~\\~a]+"}) {
            Pattern p=Pattern.compile(expression),ref=reference(expression,0);
            for (int i=0; i<8; i++) {
                Matcher a=p.matcher("x".repeat(2048)),b=ref.matcher("x".repeat(2048));
                equal(a,b,a.find(),b.find(),false);
            }
            Matcher a=p.matcher("a".repeat(2048)),b=ref.matcher("a".repeat(2048));
            equal(a,b,a.find(),b.find(),false);
        }
        for (String prefix : new String[]{"", "^", "]", "^]", "\\]", "^\\]"}) {
            for (String body : new String[]{"a~~a", "a||b", "a-z--c", "a&&b", "a\\-~~a"}) {
                String expression = "["+prefix+body+"]+";
                Pattern p = Pattern.compile(expression), ref = reference(expression,0);
                if (NATIVE.get(p)!=null) throw new AssertionError("incompatible class accepted: "+expression);
                for (String input : new String[]{"x".repeat(2048),"a".repeat(2048),"]~~||b-c"}) {
                    Matcher a=p.matcher(input),b=ref.matcher(input);
                    equal(a,b,a.find(),b.find(),true);
                }
            }
        }
        for (String expression : new String[]{"(a(b)?)+", "(?:a|(b))*", "(?=a)a+", "(a)\\1", "x*+x", "[]a[b]]+"}) {
            Pattern p=Pattern.compile(expression),ref=reference(expression,0);
            if (NATIVE.get(p)!=null) throw new AssertionError("unsupported syntax accepted: "+expression);
            Matcher a=p.matcher("aba aa xx a"),b=ref.matcher("aba aa xx a");
            equal(a,b,a.find(),b.find(),true);
        }
        for (String invalid : new String[]{"(","[", "a{2,1}","a**", "(?<1x>a)","(?<x>a)(?<x>b)","\\q", "a\\"}) {
            try { Pattern.compile(invalid); throw new AssertionError("invalid expression accepted: "+invalid); }
            catch (PatternSyntaxException expected) { }
        }
    }

    private static void consumers() throws Exception {
        Pattern p=Pattern.compile("(?<word>error|warn): (?<code>[0-9]+)"),ref=reference(p.pattern(),0);
        String input="warn: 12 x error: 345";
        if (!p.matcher(input).replaceAll("${code}/${word}").equals(ref.matcher(input).replaceAll("${code}/${word}")))
            throw new AssertionError("named replacement");
        if (!p.matcher(input).replaceAll(m -> m.group(2)+":"+m.group(1))
                .equals(ref.matcher(input).replaceAll(m -> m.group(2)+":"+m.group(1)))) throw new AssertionError("functional replacement");
        Pattern delimiters=Pattern.compile("[,;]\\s*");
        String values="a, b; c,,d;";
        for (int limit : new int[]{-1,0,1,2,9}) {
            if (!Arrays.equals(delimiters.split(values,limit),reference(delimiters.pattern(),0).split(values,limit)))
                throw new AssertionError("split");
            if (!Arrays.equals(delimiters.splitWithDelimiters(values,limit),
                    reference(delimiters.pattern(),0).splitWithDelimiters(values,limit))) throw new AssertionError("delimiter split");
        }
        if (!delimiters.splitAsStream(values).toList().equals(reference(delimiters.pattern(),0).splitAsStream(values).toList()))
            throw new AssertionError("stream split");
        if (!p.matcher(input).results().map(MatchResult::group).toList().equals(List.of("warn: 12","error: 345")))
            throw new AssertionError("results stream");
        if (!"error123".matches("error[0-9]+") || !"a123b".replaceAll("[0-9]+","X").equals("aXb"))
            throw new AssertionError("String callers");
        try (Scanner scanner=new Scanner("12,34;56").useDelimiter("[,;]")) {
            if (scanner.nextInt()!=12 || scanner.nextInt()!=34 || scanner.nextInt()!=56 || scanner.hasNext())
                throw new AssertionError("Scanner");
        }
        Pattern mutable=Pattern.compile("error([0-9]+)");
        CharBuffer buffer=CharBuffer.wrap("x error123 y");
        if (!mutable.matcher(buffer).find()) throw new AssertionError("CharBuffer");
        nativeOnly(mutable);
    }

    private static void sharingAndLifetime() throws Exception {
        Pattern p=Pattern.compile("error([0-9]+)"),same=Pattern.compile(p.pattern());
        nativeOnly(p);
        if (RustRegex.ENABLED && NATIVE.get(p)!=NATIVE.get(same)) throw new AssertionError("identical Patterns did not share their engine");
        try (ExecutorService workers=Executors.newFixedThreadPool(2)) {
            List<Future<?>> futures=new ArrayList<>();
            for (int worker=0;worker<2;worker++) futures.add(workers.submit(() -> {
                Matcher m=p.matcher("");
                for (int i=0;i<12000;i++) {
                    boolean hit=(i&1)!=0;
                    if (m.reset(hit?"error123":"x ".repeat(1024)).find()!=hit) throw new AssertionError("shared result");
                    if (hit && !m.group(1).equals("123")) throw new AssertionError("shared captures");
                }
            }));
            for (Future<?> f:futures) f.get();
        }
        nativeOnly(p);
        ByteArrayOutputStream bytes=new ByteArrayOutputStream();
        try (ObjectOutputStream out=new ObjectOutputStream(bytes)) { out.writeObject(p); }
        Pattern restored;
        try (ObjectInputStream in=new ObjectInputStream(new ByteArrayInputStream(bytes.toByteArray()))) {
            restored=(Pattern)in.readObject();
        }
        if (!restored.matcher("error123").matches()) throw new AssertionError("serialization");
        nativeOnly(restored);
        // Promotion removes the native reference; existing Matchers allocate
        // Java locals lazily and continue correctly after another Matcher promotes.
        Pattern promoted=Pattern.compile("error([0-9]{1,})");
        Matcher existing=promoted.matcher("error123");
        Matcher wide=promoted.matcher("\u0100 " + "x ".repeat(1024) + "error456");
        if (!wide.find() || !wide.group(1).equals("456")) throw new AssertionError("wide input fallback");
        if (NATIVE.get(promoted)!=null || ROOT.get(promoted)==null) throw new AssertionError("permanent Java promotion");
        if (!existing.find() || !existing.group(1).equals("123")) throw new AssertionError("old Matcher promotion");
        for (int i=0;i<10;i++) { System.gc(); same.matcher("error789").find(); }
        nativeOnly(same);
    }

    public static void main(String[] args) throws Exception {
        shortEmailMatches();
        emailSuccessEndFlags();
        collectedPreparation();
        mandatoryLiteralReject();
        literalSearchAdmission();
        resetCapturePublication();
        preparedPlans();
        preparedBoundaries();
        fixedCountContinuation();
        primary();
        shortAndEarlyMatches();
        digitEndFlags();
        fallbackGrammar();
        consumers();
        sharingAndLifetime();
        apiState();
        System.out.println("Compared "+comparisons+" native/Java results and API states; enabled="+RustRegex.ENABLED);
    }

    private static void fixedCountContinuation() throws Exception {
        List<String> inputs = new ArrayList<>(List.of("123-45-6789!", "1123-45-6789",
                "12X123-45-6789", "123-4X123-45-6789", "123-45-6X123-45-6789",
                "123-45-6789!123-45-6789", "!".repeat(16)));
        String complete = "123-45-6789";
        for (int i = 0; i <= complete.length(); i++) inputs.add(complete.substring(0, i));
        for (String expression : new String[]{"[0-9]{3}-[0-9]{2}-[0-9]{4}", "\\d{3}-\\d{2}-\\d{4}"}) {
            for (int flags : new int[]{0, Pattern.CASE_INSENSITIVE, Pattern.DOTALL, Pattern.UNIX_LINES}) {
                Pattern ref = reference(expression, flags);
                for (String input : inputs) for (boolean endFlags : new boolean[]{false, true})
                        for (CharSequence text : new CharSequence[]{
                                input, new StringBuilder(input), CharBuffer.wrap(input)}) {
                    for (int operation = 0; operation < 2; operation++) {
                        Pattern p = Pattern.compile(expression, flags);
                        Matcher a = p.matcher(text), b = ref.matcher(text);
                        equal(a, b, operation == 0 ? a.matches() : a.lookingAt(),
                                operation == 0 ? b.matches() : b.lookingAt(), endFlags);
                        nativeOnly(p);
                        for (int n = 0; n < 3; n++) {
                            equal(a, b, a.find(), b.find(), endFlags);
                            nativeOnly(p);
                        }
                        a.reset(); b.reset();
                        nativeOnly(p);
                        checkResetCaptures(a); checkResetCaptures(b);
                        equal(a, b, a.find(), b.find(), endFlags);
                        nativeOnly(p);
                    }
                }
            }
        }
    }

    private static void preparedPlans() throws Exception {
        String[] expressions = {"error[0-9]+", "Aa0_Aa0_[0-9]+",
                "(?<level>error|warning|fatal)([0-9]+)",
                "(?<word>error)(?<number>[0-9]+)", "(error)([0-9]+)", "(?<number>\\d+)",
                "(?:a|bc|Def)(?<n>\\d+)", "(x|y)(?:[0-9]+)"};
        String[] inputs = {"", "e", "error", "errorX", "error123", "warning456", "fatal789",
                "Aa0_Aa0_123", "!error12 warning34!", "bc45 Def67 x8 y9",
                "eeeeeeee errorX fatalX", "\uD800\u0100error123\uDC00",
                "!".repeat(24) + "error123", "error" + "3".repeat(4091),
                "errorX ".repeat(586) + "warning123", "\u0100error" + "3".repeat(4090)};
        for (String expression : expressions) {
            for (int flags : new int[]{0, Pattern.CASE_INSENSITIVE, Pattern.UNIX_LINES, Pattern.DOTALL}) {
                Pattern ref = reference(expression, flags);
                for (String input : inputs) {
                    for (int lo : new int[]{0, input.length() / 2, input.length()}) {
                        Pattern p = Pattern.compile(expression, flags);
                        RustRegex engine = (RustRegex) NATIVE.get(p);
                        // Long UTF-16 handoffs may promote; retained-plan checks
                        // apply to bounded inputs and the native byte alphabet.
                        boolean exactPlan = engine != null && engine.hasExactEndFlags()
                                && (input.length() <= 256 || input.chars().allMatch(c -> c <= 255));
                        Matcher a = p.matcher(input), b = ref.matcher(input);
                        a.region(lo, input.length()); b.region(lo, input.length());
                        for (int i = 0; i < 3; i++) {
                            equal(a, b, a.find(), b.find(), true);
                            if (exactPlan) nativeOnly(p);
                        }
                        a.reset().region(lo, input.length()); b.reset().region(lo, input.length());
                        equal(a, b, a.lookingAt(), b.lookingAt(), true);
                        if (exactPlan) nativeOnly(p);
                        a.reset().region(lo, input.length()); b.reset().region(lo, input.length());
                        equal(a, b, a.matches(), b.matches(), true);
                        if (exactPlan) nativeOnly(p);
                        a.usePattern(Pattern.compile("([a-z]+)([0-9]+)"));
                        b.usePattern(reference("([a-z]+)([0-9]+)", 0));
                        equal(a, b, a.find(), b.find(), true);
                        a.usePattern(p).reset(input); b.usePattern(ref).reset(input);
                        equal(a, b, a.find(), b.find(), true);
                        if (exactPlan) nativeOnly(p);
                        if (!p.matcher(input).replaceAll("[$0]").equals(ref.matcher(input).replaceAll("[$0]")))
                            throw new AssertionError("prepared replacement");
                        StringBuilder mutable = new StringBuilder(input);
                        a = p.matcher(mutable); b = ref.matcher(mutable);
                        equal(a, b, a.find(), b.find(), true);
                        mutable.setLength(0); mutable.append("fatal123 error456");
                        a.reset(); b.reset();
                        equal(a, b, a.find(), b.find(), true);
                        if (exactPlan) nativeOnly(p);
                    }
                }
            }
        }
    }

    private static void preparedBoundaries() throws Exception {
        for (String expression : new String[]{"error[0-9]+", "(error)([0-9]+)",
                "(?<word>error)(?<number>[0-9]+)"}) {
            Pattern p = Pattern.compile(expression), ref = reference(expression, 0);
            for (int length : new int[]{16, 17, 32, 33, 39, 40, 41, 64, 65}) {
                String padding = "!".repeat(length);
                for (String input : new String[]{padding, "error123" + padding.substring(8),
                        padding.substring(8) + "error123", "errorX" + padding.substring(6)}) {
                    Matcher a = p.matcher(input), b = ref.matcher(input);
                    // Include first use and reused preparations at each boundary.
                    for (int use = 0; use < 20; use++) {
                        for (int operation = 0; operation < 3; operation++) {
                            a.reset(); b.reset();
                            boolean av = switch (operation) {
                                case 1 -> a.matches(); case 2 -> a.lookingAt(); default -> a.find();
                            };
                            boolean bv = switch (operation) {
                                case 1 -> b.matches(); case 2 -> b.lookingAt(); default -> b.find();
                            };
                            equal(a, b, av, bv, true);
                            nativeOnly(p);
                            // A rejected anchor must preserve the next search position.
                            equal(a, b, a.find(), b.find(), true);
                            nativeOnly(p);
                        }
                    }
                }
            }
        }
    }

    private static void emailSuccessEndFlags() throws Exception {
        String expression = "(?<user>[a-z0-9_]+)@(?<domain>[a-z0-9_]+)\\.[a-z]{2,4}";
        Pattern ref = reference(expression, 0);
        for (int suffix = 1; suffix <= 5; suffix++) {
            for (String prefix : new String[]{"", "!", "a@b.x!", "\uD800!", "!".repeat(64), "a".repeat(40)}) {
                for (String tail : new String[]{"", "!", "\uDC00"}) {
                    String input = prefix + "a@b." + "c".repeat(suffix) + tail;
                    for (int operation = 0; operation < 3; operation++) {
                        for (boolean region : new boolean[]{false, true}) {
                            Pattern p = Pattern.compile(expression);
                            Matcher a = p.matcher(input), b = ref.matcher(input);
                            if (region) { a.region(prefix.length(), input.length() - tail.length());
                                b.region(prefix.length(), input.length() - tail.length()); }
                            boolean av = switch (operation) { case 1 -> a.lookingAt(); case 2 -> a.matches(); default -> a.find(); };
                            boolean bv = switch (operation) { case 1 -> b.lookingAt(); case 2 -> b.matches(); default -> b.find(); };
                            equal(a, b, av, bv, true);
                            if (av && input.chars().allMatch(ch -> ch <= 255)) nativeOnly(p);
                            equal(a, b, a.find(), b.find(), true);
                            a.reset("different").usePattern(Pattern.compile("!+"));
                            b.reset("different").usePattern(reference("!+", 0));
                            if (a.hitEnd() != b.hitEnd() || a.requireEnd() != b.requireEnd())
                                throw new AssertionError("old email end state changed after reset/usePattern");
                        }
                    }
                }
            }
        }
    }

    private static void mandatoryLiteralReject() throws Exception {
        String expression = "lazyprobe([0-9]+)";
        Pattern p = Pattern.compile(expression), ref = reference(expression, 0);
        Object engine = NATIVE.get(p);
        Matcher actual = p.matcher(""), expected = ref.matcher("");
        // The mandatory literal is absent throughout each region. Rejecting it
        // must avoid unused native automata in compiler-enabled configurations.
        // The interpreter retains native scanning for long inputs.
        int preparation = 0;
        for (int length : new int[]{16, 32, 256, 257, 4096, 65536}) {
            for (String character : new String[]{"x", "l", "\u0100", "\uD83D\uDE00"}) {
                expression = "lazyprobe" + preparation++ + "_([0-9]+)";
                p = Pattern.compile(expression);
                ref = reference(expression, 0);
                expected = ref.matcher("");
                engine = NATIVE.get(p);
                actual = p.matcher("");
                String input = character.repeat(length / character.length());
                for (int offset : new int[]{0, 3}) {
                    actual.reset(input).region(offset, input.length() - offset);
                    expected.reset(input).region(offset, input.length() - offset);
                    equal(actual, expected, actual.find(), expected.find(), true);
                    if (TIER.getInt(null) == 2 || character.equals("x") || character.equals("l")
                            || TIER.getInt(null) == 1 && offset == 0) nativeOnly(p);
                    if (RustRegex.ENABLED && TIER.getInt(null) != 0 && offset == 0 && HANDLE.getLong(engine) != 0)
                        throw new AssertionError("literal miss constructed unused native automata");
                }
            }
        }
        // A later literal must still reach the general engine. Region bounds
        // and find(start) must not hide a valid match after an initial miss.
        expression = "lazyprobe([0-9]+)";
        p = Pattern.compile(expression);
        ref = reference(expression, 0);
        expected = ref.matcher("");
        engine = NATIVE.get(p);
        actual = p.matcher("");
        String input = "x".repeat(4096) + "lazyprobe123";
        actual.reset(input); expected.reset(input);
        equal(actual, expected, actual.find(), expected.find(), true);
        nativeOnly(p);
        if (RustRegex.ENABLED && HANDLE.getLong(engine) == 0)
            throw new AssertionError("later literal did not initialize the native backend");
        for (int start : new int[]{0, 4096, 4097, input.length()}) {
            actual.reset(input); expected.reset(input);
            equal(actual, expected, actual.find(start), expected.find(start), true);
            nativeOnly(p);
        }
        input = "lazyprobe123" + "x".repeat(4096) + "lazyprobe456";
        actual.reset(input).region(12, input.length() - 12);
        expected.reset(input).region(12, input.length() - 12);
        equal(actual, expected, actual.find(), expected.find(), true);
        nativeOnly(p);
        java.lang.ref.Reference.reachabilityFence(engine);
        expression = "boundedprobe([0-9]+)";
        Pattern bounded = Pattern.compile(expression);
        ref = reference(expression, 0);
        input = "x".repeat(RustRegex.MAX_LENGTH + 1);
        actual = bounded.matcher(input); expected = ref.matcher(input);
        equal(actual, expected, actual.find(), expected.find(), true);
        if (RustRegex.ENABLED && NATIVE.get(bounded) != null)
            throw new AssertionError("oversized miss bypassed native input budget");
        Pattern early = Pattern.compile(expression);
        input = "boundedprobe123" + input;
        actual = early.matcher(input); expected = ref.matcher(input);
        equal(actual, expected, actual.find(), expected.find(), true);
        nativeOnly(early);
    }

    private static void literalSearchAdmission() throws Exception {
        if (!RustRegex.ENABLED || TIER.getInt(null) != 1) return;
        String expression = "admitprobe([0-9]+)";
        Pattern p = Pattern.compile(expression), ref = reference(expression, 0);
        Object owner = NATIVE.get(p);
        Matcher actual = p.matcher("x".repeat(4096)), expected = ref.matcher("x".repeat(4096));
        equal(actual, expected, actual.find(), expected.find(), true);
        nativeOnly(p);
        if (HANDLE.getLong(owner) != 0) throw new AssertionError("cold literal miss compiled native storage");
        for (int i = 0; i < 512 && HANDLE.getLong(owner) == 0; i++) {
            actual.reset(); expected.reset();
            equal(actual, expected, actual.find(), expected.find(), true);
            nativeOnly(p);
        }
        if (HANDLE.getLong(owner) == 0) throw new AssertionError("reused long searches never admitted native storage");
        for (int i = 0; i < 32; i++) {
            actual.reset(); expected.reset();
            equal(actual, expected, actual.find(), expected.find(), true);
            nativeOnly(p);
        }
        java.lang.ref.Reference.reachabilityFence(owner);
    }

    private static void collectedPreparation() throws Exception {
        if (!RustRegex.ENABLED) return;
        String expression = "(?<parts>(?:ab|cd)+)[ef]";
        Pattern first = Pattern.compile(expression);
        Object engine = NATIVE.get(first);
        if (engine == null || HANDLE.getLong(engine) == 0)
            throw new AssertionError("initial general preparation was not validated natively");
        checkPreparedNames((RustRegex) engine);
        Field entries = Class.forName("jdk.internal.util.regex.RustRegex$CompiledCache")
                .getDeclaredField("ENTRIES");
        entries.setAccessible(true);
        Map<?, ?> cache = (Map<?, ?>) entries.get(null);
        // Deterministically exercise the weak-backend collection path.
        synchronized (cache) {
            for (Object entry : cache.values()) {
                Field weak = entry.getClass().getDeclaredField("engine");
                weak.setAccessible(true);
                if (weak.get(entry) instanceof java.lang.ref.WeakReference<?> reference
                        && reference.get() == engine) reference.clear();
            }
        }
        Pattern replacement = Pattern.compile(expression);
        Object deferred = NATIVE.get(replacement);
        if (deferred == null || deferred == engine || HANDLE.getLong(deferred) != 0)
            throw new AssertionError("collected validated preparation was not reused lazily");
        checkPreparedNames((RustRegex) deferred);
        Pattern ref = reference(expression, 0);
        Matcher a = replacement.matcher("\u0100\uD800"), b = ref.matcher("\u0100\uD800");
        equal(a, b, a.find(), b.find(), true);
        if (HANDLE.getLong(deferred) != 0)
            throw new AssertionError("Java-only input compiled unused native automata");
        Pattern nativeReplacement = Pattern.compile(expression);
        a = nativeReplacement.matcher("abcdabe!"); b = ref.matcher("abcdabe!");
        equal(a, b, a.find(), b.find(), false);
        if (HANDLE.getLong(NATIVE.get(nativeReplacement)) == 0)
            throw new AssertionError("native input did not compile prepared automata");
        for (String invalid : new String[]{"(?<x>a)(?<x>b)", "a{3,2}", "[z-a]", "(abc"}) {
            for (int i = 0; i < 2; i++) {
                try { Pattern.compile(invalid); throw new AssertionError("deferred syntax error: " + invalid); }
                catch (PatternSyntaxException expected) { }
            }
        }
        java.lang.ref.Reference.reachabilityFence(first);
    }

    private static void checkPreparedNames(RustRegex engine) {
        if (!engine.namedGroups.equals(Map.of("parts", 1)))
            throw new AssertionError("prepared capture names changed");
        try {
            engine.namedGroups.put("unexpected", 2);
            throw new AssertionError("prepared capture names are mutable");
        } catch (UnsupportedOperationException expected) { }
    }

    private static void resetCapturePublication() throws Exception {
        // End-flag queries can replay a match in Java and permanently promote
        // the Pattern. Keep reuse checks independent so every reset and capture
        // publication below still exercises the native Matcher state.
        for (String expression : new String[]{"(a)?b", "(?<x>a|ab)+", "([a-z0-9_]+)@([a-z0-9_]+)\\.[a-z]{2,4}"}) {
            Pattern p = Pattern.compile(expression), ref = reference(expression, 0);
            nativeOnly(p);
            Matcher a = p.matcher("ab"), b = ref.matcher("ab");
            nativeOnly(p);
            for (String input : new String[]{"ab", "b", "none", "a@b.co", "ab", "", "a@b.co"}) {
                for (int operation = 0; operation < 3; operation++) {
                    a.reset(input); b.reset(input);
                    nativeOnly(p);
                    checkResetCaptures(a);
                    checkResetCaptures(b);
                    nativeOnly(p);
                    if (operation == 1) {
                        a.region(0, input.length()); b.region(0, input.length());
                        nativeOnly(p);
                    } else if (operation == 2) {
                        a.reset(); b.reset();
                        nativeOnly(p);
                    }
                    boolean av = a.find(), bv = b.find();
                    nativeOnly(p);
                    equal(a, b, av, bv, false);
                    nativeOnly(p);
                }
            }
            // Failed anchored matches intentionally select Java continuation.
            // Exercise native anchored reuse with successful inputs instead.
            String[] successes = expression.equals("(a)?b") ? new String[]{"ab", "b", "ab"}
                    : expression.equals("(?<x>a|ab)+") ? new String[]{"a", "ab", "a"}
                    : new String[]{"a@b.co", "xy@z.biz", "a@b.co"};
            for (String input : successes) {
                a.reset(input); b.reset(input);
                nativeOnly(p);
                equal(a, b, a.lookingAt(), b.lookingAt(), false);
                nativeOnly(p);
                a.reset(); b.reset();
                nativeOnly(p);
                checkResetCaptures(a);
                checkResetCaptures(b);
                nativeOnly(p);
                equal(a, b, a.matches(), b.matches(), false);
                nativeOnly(p);
            }
        }
        // Retain public end-flag comparisons, using a fresh Pattern for each
        // operation so replay cannot change the route of a later check.
        for (String expression : new String[]{"(a)?b", "(?<x>a|ab)+", "(?=a)(a)", "([a-z0-9_]+)@([a-z0-9_]+)\\.[a-z]{2,4}"}) {
            Pattern ref = reference(expression, 0);
            for (String input : new String[]{"ab", "b", "none", "a@b.co", "ab", ""}) {
                Matcher a = Pattern.compile(expression).matcher("ab"), b = ref.matcher("ab");
                a.reset(input); b.reset(input);
                checkResetCaptures(a);
                checkResetCaptures(b);
                equal(a, b, a.find(), b.find(), true);
                a = Pattern.compile(expression).matcher(input); b.reset(input);
                a.region(0, input.length()); b.region(0, input.length());
                equal(a, b, a.lookingAt(), b.lookingAt(), true);
                a = Pattern.compile(expression).matcher(input); b.reset(input);
                a.region(0, input.length()); b.region(0, input.length());
                equal(a, b, a.matches(), b.matches(), true);
            }
        }
    }

    private static void checkResetCaptures(Matcher m) {
        MatchResult empty = m.toMatchResult();
        if (empty.hasMatch() || m.hasMatch()) throw new AssertionError("reset retained a match");
        try { empty.group(); throw new AssertionError("reset snapshot exposed captures"); }
        catch (IllegalStateException expected) { }
    }
}
