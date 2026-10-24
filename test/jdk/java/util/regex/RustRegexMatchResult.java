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
 * @summary MatchResult snapshots retain only captures and remain independent
 * @modules java.base/java.util.regex:open java.base/jdk.internal.util.regex
 * @run main/othervm RustRegexMatchResult
 * @run main/othervm -XX:-UseRustRegex RustRegexMatchResult
 * @run main/othervm -XX:-UseRustRegexIntrinsics RustRegexMatchResult
 * @run main/othervm -Xint RustRegexMatchResult
 * @run main/othervm -XX:TieredStopAtLevel=1 -Xbatch RustRegexMatchResult
 * @run main/othervm -XX:-TieredCompilation -Xbatch RustRegexMatchResult
 * @run main/othervm -XX:-CompactStrings RustRegexMatchResult
 */

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.regex.MatchResult;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jdk.internal.util.regex.RustRegex;

public class RustRegexMatchResult {
    private static final Constructor<Pattern> JAVA;
    private static final Field BACKEND, ROOT, MATCH_ROOT, GROUPS;

    static {
        try {
            JAVA = Pattern.class.getDeclaredConstructor(String.class, int.class, boolean.class);
            BACKEND = Pattern.class.getDeclaredField("rustRegex");
            ROOT = Pattern.class.getDeclaredField("root");
            MATCH_ROOT = Pattern.class.getDeclaredField("matchRoot");
            GROUPS = Pattern.compile("").matcher("").toMatchResult()
                    .getClass().getDeclaredField("groups");
            JAVA.setAccessible(true);
            for (Field field : new Field[]{BACKEND, ROOT, MATCH_ROOT, GROUPS})
                field.setAccessible(true);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    public static void main(String[] args) throws Exception {
        snapshots("[ab]+", "!ab!b!abb!", true);
        snapshots("(?<optional>a)?(?<tail>b+)", "!ab!b!abb!", true);
        snapshots("(a*)", "!a!", true);
        // These captures extend outside group zero; preserve its text snapshot too.
        snapshots("(?<=(?<before>a))(?<main>b)(?=(?<after>c))", "!abc!", false);
    }

    private static void snapshots(String expression, String input, boolean nativeSubset) throws Exception {
        Pattern pattern = Pattern.compile(expression);
        Pattern reference = JAVA.newInstance(expression, 0, false);
        Object backend = BACKEND.get(pattern);
        if (RustRegex.ENABLED && nativeSubset && backend == null)
            throw new AssertionError("snapshot fixture did not select the native backend");
        for (boolean mutable : new boolean[]{false, true}) {
            StringBuilder builder = new StringBuilder(input);
            Matcher actual = pattern.matcher(mutable ? builder : input);
            Matcher expected = reference.matcher(input);
            compare(actual.toMatchResult(), expected.toMatchResult());
            List<MatchResult> copies = new ArrayList<>(), references = new ArrayList<>();
            while (expected.find()) {
                if (!actual.find()) throw new AssertionError("missing match");
                copies.add(actual.toMatchResult());
                references.add(expected.toMatchResult());
                compare(copies.getLast(), references.getLast());
                unchangedBackend(pattern, backend);
            }
            if (actual.find()) throw new AssertionError("extra match");
            MatchResult last = copies.getLast();
            if (last.start() == input.length() && last.end() == input.length()) {
                // Check unmatched snapshots after reset for terminal empty matches.
                actual.reset();
                expected.reset();
            }
            compare(actual.toMatchResult(), expected.toMatchResult());
            actual.reset("bbb").find();
            actual.usePattern(Pattern.compile("(?<other>x+)")).reset("xxx").find();
            builder.replace(0, builder.length(), "changed");
            for (int i = 0; i < copies.size(); i++) compare(copies.get(i), references.get(i));
        }
        Matcher stream = pattern.matcher(input);
        List<MatchResult> copies = stream.results().toList();
        List<MatchResult> references = reference.matcher(input).results().toList();
        if (copies.size() != references.size()) throw new AssertionError("stream match count");
        unchangedBackend(pattern, backend);
        stream.reset("bbb").find();
        stream.usePattern(Pattern.compile("x")).reset("x").find();
        for (int i = 0; i < copies.size(); i++) compare(copies.get(i), references.get(i));
    }

    private static void unchangedBackend(Pattern pattern, Object backend) throws Exception {
        if (backend != null && (BACKEND.get(pattern) != backend
                || ROOT.get(pattern) != null || MATCH_ROOT.get(pattern) != null))
            throw new AssertionError("snapshot promoted the native Pattern");
    }

    private static void compare(MatchResult actual, MatchResult expected) throws Exception {
        if (((int[]) GROUPS.get(actual)).length != 2 * (actual.groupCount() + 1))
            throw new AssertionError("snapshot retained non-capture state");
        if (actual.hasMatch() != expected.hasMatch() || actual.groupCount() != expected.groupCount()
                || !actual.namedGroups().equals(expected.namedGroups()))
            throw new AssertionError("snapshot metadata");
        if (!actual.hasMatch()) {
            try {
                actual.group();
                throw new AssertionError("unmatched snapshot exposed a group");
            } catch (IllegalStateException expectedException) { }
            return;
        }
        for (int group = 0; group <= actual.groupCount(); group++) {
            if (actual.start(group) != expected.start(group) || actual.end(group) != expected.end(group)
                    || !Objects.equals(actual.group(group), expected.group(group)))
                throw new AssertionError("snapshot group " + group);
        }
        if (!actual.group().equals(expected.group()) || actual.start() != expected.start()
                || actual.end() != expected.end()) throw new AssertionError("snapshot group zero");
        for (String name : actual.namedGroups().keySet()) {
            if (actual.start(name) != expected.start(name) || actual.end(name) != expected.end(name)
                    || !Objects.equals(actual.group(name), expected.group(name)))
                throw new AssertionError("snapshot named group " + name);
        }
    }
}
