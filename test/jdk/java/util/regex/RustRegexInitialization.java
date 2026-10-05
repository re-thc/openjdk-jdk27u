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
 */

/*
 * @test
 * @summary Pattern compilation initializes its native backend before the first search
 * @library /test/lib
 * @run driver RustRegexInitialization
 */

import java.util.regex.Pattern;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class RustRegexInitialization {
    private static final String INITIALIZATION = "Initializing 'jdk/internal/util/regex/RustRegex'";

    public static void main(String[] args) throws Exception {
        for (String mode : new String[]{"short", "mutable", "long"}) {
            OutputAnalyzer output = ProcessTools.executeTestJava(
                    "-Xint", "-Xshare:off", "-Xlog:class+init=info", Search.class.getName(), mode);
            output.shouldHaveExitValue(0);
            output.shouldContain(INITIALIZATION);
        }
    }

    public static class Search {
        public static void main(String[] args) {
            CharSequence input = args[0].equals("short") ? "x ".repeat(32) : "x ".repeat(2048);
            if (args[0].equals("mutable")) input = new StringBuilder(input);
            if (Pattern.compile("error[0-9]+").matcher(input).find()) {
                throw new AssertionError("unexpected match");
            }
        }
    }
}
