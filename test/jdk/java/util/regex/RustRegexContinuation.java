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
 * @summary Native regex results preserve Matcher continuation and observer state
 * @modules java.base/java.util.regex:open
 * @run main/othervm RustRegexContinuation
 * @run main/othervm -XX:-UseRustRegex RustRegexContinuation
 * @run main/othervm -XX:-UseRustRegexIntrinsics RustRegexContinuation
 * @run main/othervm -Xint RustRegexContinuation
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch RustRegexContinuation
 * @run main/othervm -XX:-TieredCompilation -Xbatch RustRegexContinuation
 */

import java.lang.reflect.Method;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RustRegexContinuation {
    private static final Method JAVA;
    static {
        try {
            JAVA = Pattern.class.getDeclaredMethod("ensureJava");
            JAVA.setAccessible(true);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private static Pattern reference(String expression) throws Exception {
        Pattern p = Pattern.compile(expression);
        JAVA.invoke(p);
        return p;
    }

    private static void equal(Matcher actual, Matcher expected, boolean av, boolean ev,
                              boolean observeEnd) {
        if (av != ev) throw new AssertionError(actual.pattern() + ": match result");
        if (av) {
            if (actual.groupCount() != expected.groupCount())
                throw new AssertionError("capture count");
            for (int i = 0; i <= actual.groupCount(); i++) {
                if (actual.start(i) != expected.start(i) || actual.end(i) != expected.end(i)
                        || !java.util.Objects.equals(actual.group(i), expected.group(i)))
                    throw new AssertionError(actual.pattern() + ": capture " + i);
            }
        }
        if (observeEnd && (actual.hitEnd() != expected.hitEnd()
                || actual.requireEnd() != expected.requireEnd()))
            throw new AssertionError(actual.pattern() + ": end flags");
    }

    private static boolean operation(Matcher m, int mode) {
        return switch (mode) {
            case 0 -> m.find();
            case 1 -> m.lookingAt();
            default -> m.matches();
        };
    }

    public static void main(String[] args) throws Exception {
        // Warm the shared entry points before using fresh Patterns in each case.
        Pattern warm = Pattern.compile("(ab)+");
        Matcher m = warm.matcher("ab".repeat(1024));
        for (int i = 0; i < 12000; i++) {
            if (!m.reset().find() || !m.reset().matches() || !m.reset().lookingAt())
                throw new AssertionError("warmup");
        }
        String[][] cases = {
            {"(ab)+", "abx"}, {"(ab)+x|b", "abz"}, {"a?b", "abx"},
            {"(ab)+x", "abz"}, {"(a|ab)+x", "abz"}, {"(a)?b", "abx"},
            {"error([0-9]+)", "error123x"}, {"(error)([0-9]+)", "error123x"},
            {"(error)[0-9]+", "errorx"}, {"(?<prefix>error)(?<number>[0-9]+)", "errorx"},
            {"[0-9]+", "123x"}, {"a.*b", "abx"}, {"a.*?b", "abx"},
            {"a*", "aaax"}, {"(?:)", "x"}
        };
        for (String[] c : cases) {
            for (int mode = 0; mode < 3; mode++) {
                for (boolean observeEnd : new boolean[]{false, true}) {
                    for (boolean switchPattern : new boolean[]{false, true}) {
                        for (int lo : new int[]{0, 1}) {
                            Pattern p = Pattern.compile(c[0]);
                            Matcher actual = p.matcher("!" + c[1]).region(lo, c[1].length() + 1);
                            Matcher expected = reference(c[0]).matcher("!" + c[1])
                                    .region(lo, c[1].length() + 1);
                            equal(actual, expected, operation(actual, mode),
                                    operation(expected, mode), observeEnd);
                            if (switchPattern) {
                                actual.usePattern(Pattern.compile("(a)|(b)|(e)|(r)|(o)|(x)"));
                                expected.usePattern(reference("(a)|(b)|(e)|(r)|(o)|(x)"));
                                if (observeEnd && (actual.hitEnd() != expected.hitEnd()
                                        || actual.requireEnd() != expected.requireEnd()))
                                    throw new AssertionError("usePattern end flags");
                            }
                            for (int i = 0; i < 5; i++)
                                equal(actual, expected, actual.find(), expected.find(), observeEnd);
                            actual.reset();
                            expected.reset();
                            equal(actual, expected, actual.find(), expected.find(), true);
                        }
                    }
                }
            }
        }
        System.out.println("Matcher continuation states agree");
    }
}
