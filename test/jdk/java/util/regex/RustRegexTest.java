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
 * @summary Native primary matching, captures, fallback and Java API state
 * @modules java.base/java.util.regex:open java.base/jdk.internal.util.regex:open
 * @run main/othervm RustRegexTest
 * @run main/othervm -XX:-UseRustRegex RustRegexTest
 * @run main/othervm -XX:+UseRustRegex RustRegexTest
 * @run main/othervm -XX:-UseRustRegexIntrinsics RustRegexTest
 * @run main/othervm -Xint RustRegexTest
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
    private static final Field NATIVE, ROOT, MATCH_ROOT, HANDLE;
    private static final Method JAVA;
    private static int comparisons;
    static {
        try {
            NATIVE = Pattern.class.getDeclaredField("rustRegex");
            ROOT = Pattern.class.getDeclaredField("root");
            MATCH_ROOT = Pattern.class.getDeclaredField("matchRoot");
            HANDLE = RustRegex.class.getDeclaredField("handle");
            JAVA = Pattern.class.getDeclaredMethod("ensureJava");
            for (Field f : new Field[]{NATIVE, ROOT, MATCH_ROOT, HANDLE}) f.setAccessible(true);
            JAVA.setAccessible(true);
        } catch (ReflectiveOperationException e) { throw new ExceptionInInitializerError(e); }
    }

    private static Pattern reference(String expression, int flags) throws Exception {
        Pattern p = Pattern.compile(expression, flags);
        JAVA.invoke(p);
        return p;
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
                    equal(a,b,a.reset().matches(),b.reset().matches(),false);
                    equal(a,b,a.reset().lookingAt(),b.reset().lookingAt(),false);
                    for (int start : new int[]{0, input.length()/2, input.length()})
                        equal(a,b,a.find(start),b.find(start),false);
                }
                nativeOnly(p); // No eighth-call gate and no Java verification scan.
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
    }

    private static void shortAndEarlyMatches() throws Exception {
        if (RustRegex.ENABLED) {
            Pattern p=Pattern.compile("(?<prefix>ready)(?<digits>[0-9]+)");
            Object owner=NATIVE.get(p);
            nativeOnly(p);
            if (HANDLE.getLong(owner)!=0) throw new AssertionError("short plan allocated native storage");
            if (!p.matcher("ready123").matches() || HANDLE.getLong(owner)!=0)
                throw new AssertionError("short first match compiled a Rust engine");
            if (p.matcher("x".repeat(4096)).find() || HANDLE.getLong(owner)==0)
                throw new AssertionError("first long search did not select Rust immediately");
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
                            equal(a,b,a.reset().region(lo,hi).matches(),b.reset().region(lo,hi).matches(),false);
                            equal(a,b,a.reset().region(lo,hi).lookingAt(),b.reset().region(lo,hi).lookingAt(),false);
                        }
                    }
                }
                nativeOnly(p);
            }
        }
    }

    private static void fallbackGrammar() throws Exception {
        // The leading literal ] must remain inside the class when escaped
        // operator characters follow it. Exercise the former activation sequence.
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
        Matcher existing=p.matcher("error123");
        Matcher wide=p.matcher("\u0100 error456");
        if (!wide.find() || !wide.group(1).equals("456")) throw new AssertionError("wide input fallback");
        if (NATIVE.get(p)!=null || ROOT.get(p)==null) throw new AssertionError("permanent Java promotion");
        if (!existing.find() || !existing.group(1).equals("123")) throw new AssertionError("old Matcher promotion");
        for (int i=0;i<10;i++) { System.gc(); same.matcher("error789").find(); }
        nativeOnly(same);
    }

    public static void main(String[] args) throws Exception {
        primary();
        shortAndEarlyMatches();
        fallbackGrammar();
        consumers();
        sharingAndLifetime();
        apiState();
        System.out.println("Compared "+comparisons+" native/Java results and API states; enabled="+RustRegex.ENABLED);
    }
}
