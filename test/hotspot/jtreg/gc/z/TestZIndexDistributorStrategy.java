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
 * @bug 8388312
 * @summary Check the supported ZGC index distributor strategies and their range
 * @library /test/lib
 * @requires vm.gc.Z
 * @run driver gc.z.TestZIndexDistributorStrategy
 */
package gc.z;

import jdk.test.lib.process.ProcessTools;

public class TestZIndexDistributorStrategy {
    private static void test(String value, boolean valid) throws Exception {
        var output = ProcessTools.executeLimitedTestJava(
                "-XX:+UnlockDiagnosticVMOptions",
                "-XX:+UseZGC",
                "-Xms16m", "-Xmx64m",
                "-XX:ZIndexDistributorStrategy=" + value,
                "-version");
        output.shouldNotContain("assert").shouldHaveExitValue(valid ? 0 : 1);
        if (!valid) {
            output.shouldContain("ZIndexDistributorStrategy");
        }
    }

    public static void main(String[] args) throws Exception {
        test("0", true);
        test("1", true);
        test("2", false);
        test("-1", false);
        test("4294967295", false);
        test("4294967296", false);
    }
}
