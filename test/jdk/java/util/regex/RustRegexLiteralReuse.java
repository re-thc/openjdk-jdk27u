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
 * @summary Reuse prepared native engines without compiling Java for short literal misses
 * @modules java.base/java.util.regex:open java.base/jdk.internal.util.regex:+open
 * @run main/othervm RustRegexLiteralReuse
 * @run main/othervm -XX:-UseRustRegex RustRegexLiteralReuse
 * @run main/othervm -XX:-UseRustRegexIntrinsics RustRegexLiteralReuse
 * @run main/othervm -Xint RustRegexLiteralReuse
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch RustRegexLiteralReuse
 * @run main/othervm -XX:-TieredCompilation -Xbatch RustRegexLiteralReuse
 * @run main/othervm -XX:-CompactStrings RustRegexLiteralReuse
 */

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jdk.internal.util.regex.RustRegex;

public class RustRegexLiteralReuse {
    private static final Field BACKEND, ROOT, MATCH_ROOT, HANDLE, JAVA_PATTERN, TIER;
    private static final Constructor<Pattern> ORIGINAL;

    static {
        try {
            BACKEND = Pattern.class.getDeclaredField("rustRegex");
            ROOT = Pattern.class.getDeclaredField("root");
            MATCH_ROOT = Pattern.class.getDeclaredField("matchRoot");
            HANDLE = RustRegex.class.getDeclaredField("handle");
            JAVA_PATTERN = RustRegex.class.getDeclaredField("javaPattern");
            TIER = RustRegex.class.getDeclaredField("JAVA_TIER");
            ORIGINAL = Pattern.class.getDeclaredConstructor(String.class, int.class, boolean.class);
            ORIGINAL.setAccessible(true);
            for (Field field : new Field[]{BACKEND, ROOT, MATCH_ROOT, HANDLE, JAVA_PATTERN, TIER})
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
    }

    private static void compare(Matcher actual, Matcher expected, boolean flags) {
        boolean found = actual.find();
        if (found != expected.find() || actual.groupCount() != expected.groupCount())
            throw new AssertionError("literal search result");
        if (found) for (int group = 0; group <= actual.groupCount(); group++) {
            if (actual.start(group) != expected.start(group) || actual.end(group) != expected.end(group)
                    || !Objects.equals(actual.group(group), expected.group(group)))
                throw new AssertionError("literal capture " + group);
        }
        if (flags && (actual.hitEnd() != expected.hitEnd() || actual.requireEnd() != expected.requireEnd()))
            throw new AssertionError("literal end flags");
    }
}
