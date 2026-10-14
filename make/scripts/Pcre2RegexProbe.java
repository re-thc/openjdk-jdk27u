/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
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
import java.lang.reflect.Method;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Differential probe usable against both fixed and earlier runtime images. */
public class Pcre2RegexProbe {
    private static String find(Matcher m) {
        return m.find() ? m.start() + ":" + m.end() : "none";
    }

    public static void main(String[] args) throws Exception {
        boolean report = args.length != 0 && args[0].equals("--report");
        Method java = Pattern.class.getDeclaredMethod("ensureJava");
        java.setAccessible(true);
        Pattern warm = Pattern.compile("(ab)+");
        Matcher w = warm.matcher("ab".repeat(1024));
        for (int i = 0; i < 12000; i++) {
            if (!w.reset().find() || !w.reset().matches() || !w.reset().lookingAt())
                throw new AssertionError("warmup");
        }
        String[][] cases = {{"(ab)+", "abx", "matches"},
                {"(ab)+x|b", "abz", "lookingAt"}, {"a?b", "abx", "matches"}};
        int failures = 0;
        for (String[] c : cases) {
            Pattern reference = Pattern.compile(c[0]);
            java.invoke(reference);
            Matcher a = Pattern.compile(c[0]).matcher(c[1]), b = reference.matcher(c[1]);
            boolean av = c[2].equals("matches") ? a.matches() : a.lookingAt();
            boolean bv = c[2].equals("matches") ? b.matches() : b.lookingAt();
            String actual = av + ">" + find(a), expected = bv + ">" + find(b);
            if (!actual.equals(expected)) failures++;
            System.out.printf("{\"record\":\"continuation\",\"expression\":\"%s\","
                    + "\"operation\":\"%s\",\"actual\":\"%s\",\"expected\":\"%s\"}%n",
                    c[0], c[2], actual, expected);
        }
        if (failures != 0 && !report)
            throw new AssertionError(failures + " continuation mismatches");
    }
}
