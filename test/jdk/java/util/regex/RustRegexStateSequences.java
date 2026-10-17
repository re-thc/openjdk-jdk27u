/*
 * Copyright (c) 2026, re-thc. All rights reserved.
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
 * @summary Compare native and Java state across reset, reuse and backend changes
 * @modules java.base/java.util.regex:open java.base/jdk.internal.util.regex:+open
 * @run main/othervm/timeout=600 -Xint RustRegexStateSequences
 * @run main/othervm/timeout=600 -Xint -XX:-UseRustRegexIntrinsics RustRegexStateSequences
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch RustRegexStateSequences
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch -XX:-UseRustRegexIntrinsics RustRegexStateSequences
 * @run main/othervm -XX:-TieredCompilation -Xbatch RustRegexStateSequences
 * @run main/othervm -XX:-TieredCompilation -Xbatch -XX:-UseRustRegexIntrinsics RustRegexStateSequences
 * @run main/othervm -XX:-UseRustRegex RustRegexStateSequences
 * @run main/othervm -XX:-CompactStrings RustRegexStateSequences
 */

import java.lang.reflect.*;
import java.util.*;
import java.util.regex.*;

public class RustRegexStateSequences {
    static Constructor<Pattern> oracle;
    static Field backend, root;
    static long checks;
    static java.security.MessageDigest digest;
    static String state(Matcher m, boolean found, boolean flags) {
        StringBuilder s = new StringBuilder().append(found).append('/').append(m.hasMatch())
                .append('/').append(new TreeMap<>(m.namedGroups()));
        if (found) {
            MatchResult copy = m.toMatchResult();
            for (int i = 0; i <= m.groupCount(); i++) {
                s.append('/').append(m.start(i)).append(':').append(m.end(i)).append(':').append(m.group(i));
                if (copy.start(i) != m.start(i) || copy.end(i) != m.end(i) ||
                        !Objects.equals(copy.group(i), m.group(i))) throw new AssertionError("snapshot");
            }
        }
        if (flags) s.append('/').append(m.hitEnd()).append('/').append(m.requireEnd());
        return s.toString();
    }
    static void equal(Matcher a, Matcher b, boolean x, boolean y, boolean flags, String detail) {
        String left = state(a, x, flags), right = state(b, y, flags);
        if (!left.equals(right)) throw new AssertionError(detail + " " + left + " != " + right);
        digest.update(left.getBytes(java.nio.charset.StandardCharsets.UTF_8));
        digest.update((byte) 0);
        checks++;
    }
    public static void main(String[] args) throws Exception {
        digest = java.security.MessageDigest.getInstance("SHA-256");
        try {
            oracle = Pattern.class.getDeclaredConstructor(String.class, int.class, boolean.class);
            oracle.setAccessible(true);
        } catch (NoSuchMethodException originalJava) {
            oracle = null;
        }
        try {
            backend = Pattern.class.getDeclaredField("rustRegex"); backend.setAccessible(true);
        } catch (NoSuchFieldException originalJava) {
            backend = null;
        }
        if (backend != null && oracle == null)
            throw new AssertionError("integrated Pattern has no independent Java oracle");
        root = Pattern.class.getDeclaredField("root"); root.setAccessible(true);
        String[] expressions = {"error[0-9]+", "(?<w>error)(?<n>[0-9]+)",
                "abcdefghijklmno[0-9]+", "(abcd)([0-9]+)",
                "(?:error|warning|fatal)[0-9]+", "(error|warning|fatal)([0-9]+)",
                "(?<w>a|bbbb|cc)(?<n>\\d+)", "(?:error|epsilon)[0-9]+",
                "[0-9]{3}-[0-9]{2}-[0-9]{4}", "\\d{3}-\\d{2}-\\d{4}", "(?=error)error[0-9]+"};
        LinkedHashSet<String> inputs = new LinkedHashSet<>(List.of("", "error", "error0", "error1error2", "a0", "bbbb12cc3", "warning123!fatal4", "abcdefghijklmno12", "abcd0abcd1", "123-45-6789", "1123-45-6789", "123-45-6789!", "123-45-", "0000", "!!!!", "!!!!!!!", "!!!!!!!!!!!", "!".repeat(4096)));
        for (String token : List.of("error0", "warning00", "fatal9", "123-45-6789", "abcd1")) {
            for (int n : new int[]{0, 1, 5, 15, 16, 17, 31, 32, 33, 64, 256}) {
                inputs.add("!".repeat(n) + token); inputs.add(token + "!".repeat(n));
                inputs.add("e".repeat(n) + token); inputs.add("\u0165".repeat(n) + token);
            }
        }
        for (String token : List.of("error0", "warning123", "123-45-6789")) {
            for (int n = 0; n <= token.length(); n++) inputs.add(token.substring(0, n));
            inputs.add("\ud800" + token + "\udc00");
            inputs.add("\ud83d\ude00" + token + "\n");
        }
        for (String expression : expressions) for (int bits : new int[]{0, Pattern.CASE_INSENSITIVE, Pattern.DOTALL, Pattern.UNIX_LINES}) {
            Pattern reference = oracle == null ? Pattern.compile(expression, bits)
                    : oracle.newInstance(expression, bits, false);
            for (boolean endFlags : new boolean[]{false, true}) {
                for (String input : inputs) {
                    Pattern p = Pattern.compile(expression, bits);
                    Object owner = backend == null ? null : backend.get(p);
                    boolean retain = owner != null &&
                            (boolean) owner.getClass().getMethod("hasExactEndFlags").invoke(owner) &&
                            input.chars().allMatch(c -> c <= 255);
                    Matcher a = p.matcher(""), b = reference.matcher("");
                    String detail = expression + " " + bits + " " + input.length() + " " + endFlags;
                    for (int begin : new int[]{0, Math.min(1, input.length())}) for (boolean transparent : new boolean[]{false, true}) {
                        a.reset(input).region(begin, input.length()).useTransparentBounds(transparent);
                        b.reset(input).region(begin, input.length()).useTransparentBounds(transparent);
                        equal(a, b, a.find(), b.find(), endFlags, detail + " find");
                        equal(a, b, a.find(), b.find(), endFlags, detail + " next");
                        a.reset().region(begin, input.length()); b.reset().region(begin, input.length());
                        equal(a, b, a.matches(), b.matches(), endFlags, detail + " matches");
                        equal(a, b, a.find(), b.find(), endFlags, detail + " following find");
                        a.reset().region(begin, input.length()); b.reset().region(begin, input.length());
                        equal(a, b, a.lookingAt(), b.lookingAt(), endFlags, detail + " lookingAt");
                        equal(a, b, a.find(), b.find(), endFlags, detail + " continuation");
                    }
                    a.reset(new StringBuilder(input)); b.reset(new StringBuilder(input));
                    equal(a, b, a.find(), b.find(), endFlags, detail + " mutable sequence");
                    a.usePattern(reference); b.usePattern(reference);
                    equal(a, b, a.find(), b.find(), endFlags, detail + " use Java");
                    a.usePattern(p); b.usePattern(reference);
                    equal(a, b, a.find(), b.find(), endFlags, detail + " restore");
                    if (retain && (backend.get(p) == null || root.get(p) != null))
                        throw new AssertionError("exact plan promoted: " + detail);
                    java.lang.ref.Reference.reachabilityFence(owner);
                }
            }
        }
        System.out.println("RustRegexStateSequences " + checks + " exact public comparisons passed; semantic-sha256="
                + HexFormat.of().formatHex(digest.digest()));
    }
}
