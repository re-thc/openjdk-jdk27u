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
 * @summary Match wider String input through the native Unicode engine
 * @modules java.base/java.util.regex:open java.base/jdk.internal.util.regex:open
 *          java.base/jdk.internal.access
 * @run main/othervm RustRegexUtf8Test
 * @run main/othervm -XX:-UseRustRegex RustRegexUtf8Test
 * @run main/othervm -XX:-UseRustRegexIntrinsics RustRegexUtf8Test
 * @run main/othervm -XX:-CompactStrings RustRegexUtf8Test
 */

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jdk.internal.access.SharedSecrets;
import jdk.internal.util.regex.RustRegex;

public class RustRegexUtf8Test {
    private static final Constructor<Pattern> JAVA;
    private static final Field NATIVE, ROOT, UTF8;
    private static int checks;
    static {
        try {
            JAVA = Pattern.class.getDeclaredConstructor(String.class, int.class, boolean.class);
            NATIVE = Pattern.class.getDeclaredField("rustRegex");
            ROOT = Pattern.class.getDeclaredField("root");
            UTF8 = RustRegex.class.getDeclaredField("utf8Handle");
            JAVA.setAccessible(true);
            for (Field f : new Field[]{NATIVE, ROOT, UTF8}) f.setAccessible(true);
        } catch (ReflectiveOperationException e) { throw new ExceptionInInitializerError(e); }
    }

    private static String captures(Matcher m, boolean found) {
        if (!found) return "miss";
        List<String> values = new ArrayList<>();
        for (int i = 0; i <= m.groupCount(); i++)
            values.add(m.start(i) + ":" + m.end(i) + ":" + m.group(i));
        return values.toString();
    }

    private static void equal(Object a, Object b) {
        checks++;
        if (!a.equals(b)) throw new AssertionError(a + " != " + b);
    }

    private static void compare(String regex, String input, int from, int to, int start,
                                boolean nativeExpected) throws Exception {
        Pattern p = Pattern.compile(regex);
        Pattern reference = JAVA.newInstance(regex, 0, false);
        Matcher a = p.matcher(input).region(from, to);
        Matcher b = reference.matcher(input).region(from, to);
        for (int reuse = 0; reuse < 3; reuse++) {
            if (from == 0 && to == input.length()) {
                equal(captures(a, a.find(start)), captures(b, b.find(start)));
            } else {
                equal(captures(a, a.reset().region(from, to).find()),
                        captures(b, b.reset().region(from, to).find()));
            }
            if (nativeExpected && RustRegex.ENABLED) {
                Object backend = NATIVE.get(p);
                if (backend == null || ROOT.get(p) != null || UTF8.getLong(backend) == 0)
                    throw new AssertionError("Unicode matching fell back to Java: " + regex);
            }
        }
        // End-flag observation may legitimately replay through Java.
        equal(a.hitEnd(), b.hitEnd());
        equal(a.requireEnd(), b.requireEnd());
    }

    private static void compare(String regex, String input) throws Exception {
        compare(regex, input, 0, input.length(), 0, true);
    }

    public static void main(String[] args) throws Exception {
        for (int i = 0; i < 32; i++) {
            compare("err[oa]r(.+)", "前缀 error你好😀 尾");
            compare("(x)?([^0-9]+)", "β😀");
            compare("([^x]+)([0-9]+)", "界😀123");
            compare("([\\w]+)(\\W+)(\\d+)", "hello你好😀123");
            compare("(\\D+)(\\d+)", "前😀42");
            compare("([\\s]+)(\\S+)", " \t界😀");
            compare("([^\\x00-\\xff]+)", "中文😀");
            String input = "窗error你好😀end外";
            compare("err[oa]r(.+)", input, 1, input.length() - 1, 1, true);
            String late = "窗😀error文字";
            compare("err[oa]r(.+)", late, 0, late.length(), 3, true);
        }
        // Borrowed compact Latin-1 input must not create a Unicode engine.
        String latin = "!erroré";
        Pattern p = Pattern.compile("err[oa]r(.+)");
        Matcher m = p.matcher(latin);
        Object backend = NATIVE.get(p);
        long before = backend == null ? 0 : UTF8.getLong(backend);
        equal(captures(m, m.find()), "[1:7:erroré, 6:7:é]");
        if (RustRegex.ENABLED && SharedSecrets.getJavaLangAccess().getLatin1Bytes(latin) != null)
            equal(UTF8.getLong(backend), before);
        // The normal JDK validating encoder leaves malformed UTF-16 on Java.
        compare("err[oa]r(.+)", "error\ud800!", 0, 7, 0, false);
        String outside = "error中文😀" + "\ud800" + "界".repeat(100_000);
        compare("err[oa]r(.+)", outside, 0, 9, 0, true);
        compare("err[oa]r(.+)", "界".repeat(1600) + "error中文😀");
        compare("(a+)$", "a\u2028", 0, 2, 0, false);
        compare("(a+)$", "a\u2029", 0, 2, 0, false);
        Pattern named = Pattern.compile("err[oa]r(?<message>.+)", Pattern.DOTALL);
        Matcher full = named.matcher("error你好\n😀");
        equal(full.matches(), true);
        equal(full.group("message"), "你好\n😀");
        equal(full.reset().lookingAt(), true);
        equal(full.start("message"), 5);
        equal(full.end("message"), 10);
        Pattern shared = Pattern.compile("err[oa]r(?<parallel>.+)");
        CyclicBarrier ready = new CyclicBarrier(2);
        try (var workers = Executors.newFixedThreadPool(2)) {
            List<java.util.concurrent.Future<?>> futures = new ArrayList<>();
            for (int thread = 0; thread < 2; thread++) futures.add(workers.submit(() -> {
                ready.await();
                for (int i = 0; i < 32; i++) {
                    Matcher local = shared.matcher("error并发😀");
                    if (!local.find() || !local.group("parallel").equals("并发😀"))
                        throw new AssertionError("shared Unicode engine");
                }
                return null;
            }));
            for (var future : futures) future.get();
        }
        if (RustRegex.ENABLED) {
            equal(ROOT.get(shared) == null, true);
            equal(UTF8.getLong(NATIVE.get(shared)) != 0, true);
        }
        System.out.println("Unicode bridge checks=" + checks);
    }
}
