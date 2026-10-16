/*
 * Copyright (c) 2026, re-thc. All rights reserved.
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
import java.lang.reflect.Field;
import java.util.regex.*;

public class RustRegexRouteProbe {
    public static void main(String[] args) throws Exception {
        String expression = "(?<word>error|warning)[0-9]{1,}";
        Pattern p = Pattern.compile(expression);
        Matcher search = p.matcher("!".repeat(4088) + "error123");
        Matcher anchored = p.matcher("error" + "3".repeat(4091));
        long sum = 0;
        for (int i = 0; i < 2000; i++) {
            if (!search.reset().find() || !anchored.reset().matches() || !anchored.reset().lookingAt())
                throw new AssertionError("route result");
            sum += search.start() + search.end() + anchored.start(1) + anchored.end(1);
        }
        Field root = Pattern.class.getDeclaredField("root"), engine = Pattern.class.getDeclaredField("rustRegex");
        root.setAccessible(true); engine.setAccessible(true);
        if (root.get(p) != null || engine.get(p) == null) throw new AssertionError("route promoted to Java");
        System.out.println("route-checksum=" + sum);
    }
}
