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
 * @summary Preserve opaque CharSequence traversal and native String reuse
 * @modules java.base/java.util.regex:open java.base/jdk.internal.util.regex:+open
 * @run main/othervm -Xint RustRegexCharSequence
 * @run main/othervm -Xint -XX:-UseRustRegexIntrinsics RustRegexCharSequence
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch RustRegexCharSequence
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch -XX:-UseRustRegexIntrinsics RustRegexCharSequence
 * @run main/othervm -XX:-TieredCompilation -Xbatch RustRegexCharSequence
 * @run main/othervm -XX:-TieredCompilation -Xbatch -XX:-UseRustRegexIntrinsics RustRegexCharSequence
 * @run main/othervm -XX:-UseRustRegex RustRegexCharSequence
 * @run main/othervm -XX:-CompactStrings RustRegexCharSequence
 */

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.nio.CharBuffer;
import java.util.Objects;
import java.util.regex.MatchResult;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RustRegexCharSequence {
    private static Constructor<Pattern> original;
    private static Field nativeEngine, root, matchRoot, nativeEndPattern;
    private static int comparisons;
    private static String detail;

    private static final class Opaque implements CharSequence {
        private String text;
        private final boolean rejectSnapshot;
        private int snapshots;

        Opaque(String text, boolean rejectSnapshot) {
            this.text = text;
            this.rejectSnapshot = rejectSnapshot;
        }
        public int length() { return text.length(); }
        public char charAt(int index) { return text.charAt(index); }
        public CharSequence subSequence(int start, int end) { return text.substring(start, end); }
        public String toString() {
            snapshots++;
            if (rejectSnapshot) throw new AssertionError("whole-input snapshot");
            return text;
        }
    }

    private static CharSequence input(String text, int kind) {
        return switch (kind) {
            case 0 -> new Opaque(text, false);
            case 1 -> new Opaque(text, true);
            case 2 -> new StringBuilder(text);
            case 3 -> new StringBuffer(text);
            default -> CharBuffer.wrap(text).asReadOnlyBuffer();
        };
    }

    private static void noSnapshot(CharSequence input) {
        if (input instanceof Opaque opaque && opaque.snapshots != 0)
            throw new AssertionError("matching requested a whole-input snapshot");
    }

    private static void equal(Matcher actual, Matcher expected, boolean a, boolean b) {
        if (a != b || actual.hasMatch() != expected.hasMatch()
                || actual.groupCount() != expected.groupCount()
                || !actual.namedGroups().equals(expected.namedGroups())
                || actual.hitEnd() != expected.hitEnd()
                || actual.requireEnd() != expected.requireEnd())
            throw new AssertionError("match state: " + actual.pattern());
        if (a) {
            for (int group = 0; group <= actual.groupCount(); group++) {
                if (actual.start(group) != expected.start(group)
                        || actual.end(group) != expected.end(group)
                        || !Objects.equals(actual.group(group), expected.group(group)))
                    throw new AssertionError(detail + " capture " + group + ": "
                            + actual.start(group) + ":" + actual.end(group) + " != "
                            + expected.start(group) + ":" + expected.end(group));
            }
            for (String name : actual.namedGroups().keySet()) {
                if (!Objects.equals(actual.group(name), expected.group(name)))
                    throw new AssertionError("named capture " + name);
            }
        }
        if (a) {
            MatchResult snapshot = actual.toMatchResult();
            if (!snapshot.hasMatch()) throw new AssertionError("snapshot state");
            for (int group = 0; group <= actual.groupCount(); group++) {
                if (snapshot.start(group) != actual.start(group)
                        || snapshot.end(group) != actual.end(group)
                        || !Objects.equals(snapshot.group(group), actual.group(group)))
                    throw new AssertionError(detail + " snapshot " + group);
            }
        }
        comparisons++;
    }

    private static void nativeOnly(Pattern p) throws Exception {
        if (nativeEngine.get(p) == null || root.get(p) != null || matchRoot.get(p) != null)
            throw new AssertionError("shared Pattern was promoted: " + p);
    }

    private static void publicStates() throws Exception {
        String[][] cases = {
            {"(?<x>a|ab)+", "ab ab"},
            {"(a)?b", "ab b"},
            {"error([0-9]+)", "x error123 error45"},
            {"(?<u>[a-z0-9_]+)@(?<d>[a-z0-9_]+)\\.[a-z]{2,4}", "!a@b.co xy@z.biz"},
            {"[0-9]{3}-[0-9]{2}-[0-9]{4}", "x 123-45-6789 y"},
            {"[a-z]+[0-9]+", "\u0100 aa12 b3"},
            {"a*", "ba a"},
            {"(?=a)(a)", "aa ba"},
            {"(a)\\1", "aa baa"},
        };
        for (String[] c : cases) {
            Pattern reference = original.newInstance(c[0], 0, false);
            for (int kind = 0; kind < 5; kind++) {
                for (int bounds = 0; bounds < 4; bounds++) {
                    for (int lo : new int[]{0, 1, c[1].length()}) {
                        detail = c[0] + " kind=" + kind + " bounds=" + bounds + " lo=" + lo;
                        Pattern p = Pattern.compile(c[0]);
                        boolean nativeOwner = nativeEngine.get(p) != null;
                        CharSequence left = input(c[1], kind), right = input(c[1], kind);
                        Matcher a = p.matcher(left), b = reference.matcher(right);
                        a.useTransparentBounds((bounds & 1) != 0).useAnchoringBounds((bounds & 2) != 0);
                        b.useTransparentBounds((bounds & 1) != 0).useAnchoringBounds((bounds & 2) != 0);
                        a.region(lo, left.length()); b.region(lo, right.length());
                        for (;;) {
                            boolean av = a.find(), bv = b.find();
                            equal(a, b, av, bv);
                            noSnapshot(left); noSnapshot(right);
                            if (nativeOwner) nativeOnly(p);
                            if (!av) break;
                        }
                        a.reset().region(lo, left.length()); b.reset().region(lo, right.length());
                        equal(a, b, a.lookingAt(), b.lookingAt());
                        a.reset().region(lo, left.length()); b.reset().region(lo, right.length());
                        equal(a, b, a.matches(), b.matches());
                        noSnapshot(left); noSnapshot(right);
                        if (nativeOwner) nativeOnly(p);
                    }
                }
            }
        }
    }

    private static void reuse() throws Exception {
        Pattern p = Pattern.compile("(?<x>a|ab)+");
        Pattern reference = original.newInstance(p.pattern(), 0, false);
        boolean nativeOwner = nativeEngine.get(p) != null;
        Opaque left = new Opaque("ab", true), right = new Opaque("ab", true);
        Matcher a = p.matcher(left), b = reference.matcher(right);
        equal(a, b, a.find(), b.find());
        MatchResult saved = a.toMatchResult();
        left.text = right.text = "aa";
        a.reset(); b.reset();
        equal(a, b, a.matches(), b.matches());
        if (!saved.group("x").equals("a")) throw new AssertionError("mutable snapshot");
        noSnapshot(left); noSnapshot(right);
        if (nativeOwner) nativeOnly(p);

        // No end-flag query before the route assertion: replay may promote.
        a.reset("abab"); b.reset("abab");
        boolean av = a.find(), bv = b.find();
        if (nativeOwner) {
            nativeOnly(p);
            if (nativeEndPattern.get(a) != p)
                throw new AssertionError("String reset retained the opaque-input Java choice");
        }
        equal(a, b, av, bv);

        Pattern optional = Pattern.compile("(a)?b");
        a.reset(left).usePattern(optional);
        b.reset(right).usePattern(original.newInstance(optional.pattern(), 0, false));
        equal(a, b, a.find(), b.find());
        left.text = right.text = "ab b";
        a.reset(); b.reset();
        equal(a, b, a.find(), b.find());
        equal(a, b, a.find(), b.find());
        noSnapshot(left); noSnapshot(right);
    }

    public static void main(String[] args) throws Exception {
        original = Pattern.class.getDeclaredConstructor(String.class, int.class, boolean.class);
        original.setAccessible(true);
        nativeEngine = Pattern.class.getDeclaredField("rustRegex");
        root = Pattern.class.getDeclaredField("root");
        matchRoot = Pattern.class.getDeclaredField("matchRoot");
        nativeEndPattern = Matcher.class.getDeclaredField("nativeEndPattern");
        for (Field field : new Field[]{nativeEngine, root, matchRoot, nativeEndPattern})
            field.setAccessible(true);
        publicStates();
        reuse();
        System.out.println("Opaque CharSequence: " + comparisons + " public state comparisons passed");
    }
}
