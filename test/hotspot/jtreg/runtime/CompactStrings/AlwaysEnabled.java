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
 * @summary Compact Strings are always enabled, including before archive startup
 * @library /test/lib
 * @run driver AlwaysEnabled
 */

import jdk.test.lib.process.ProcessTools;

public class AlwaysEnabled {
    public static void main(String[] args) throws Exception {
        ProcessTools.executeLimitedTestJava("-Xshare:off", "-version")
                .shouldHaveExitValue(0);
        ProcessTools.executeLimitedTestJava("-XX:+CompactStrings", "-version")
                .shouldHaveExitValue(0);
        for (String mode : new String[] { "-Xshare:off", "-Xshare:auto", "-Xshare:dump" }) {
            ProcessTools.executeLimitedTestJava("-XX:-CompactStrings", mode, "-version")
                    .shouldHaveExitValue(1)
                    .shouldContain("CompactStrings cannot be disabled in this VM");
        }
        ProcessTools.executeLimitedTestJava("-XX:+IgnoreUnrecognizedVMOptions",
                                           "-XX:-CompactStrings", "-version")
                .shouldHaveExitValue(1)
                .shouldContain("CompactStrings cannot be disabled in this VM");
    }
}
