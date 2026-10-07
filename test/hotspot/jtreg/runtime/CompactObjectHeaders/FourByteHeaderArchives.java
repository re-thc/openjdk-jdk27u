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
 * @summary CDS archives reject a different compact-header width in both directions
 * @requires vm.cds & vm.bits == "64" & vm.gc.G1 & (os.arch == "amd64" | os.arch == "aarch64")
 * @library /test/lib
 * @run driver FourByteHeaderArchives
 */
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class FourByteHeaderArchives {
    static OutputAnalyzer run(boolean four, String mode, String path) throws Exception {
        return new OutputAnalyzer(ProcessTools.createLimitedTestJavaProcessBuilder(
            "-XX:" + (four ? "+" : "-") + "UseFourByteObjectHeaders",
            "-XX:+UseCompactObjectHeaders", "-XX:+UseG1GC", "-Xmx256m", "-Xshare:" + mode,
            "-XX:SharedArchiveFile=" + path, "-Xlog:aot", "-version").start());
    }
    public static void main(String[] args) throws Exception {
        for (boolean four : new boolean[] {false, true}) {
            String path = "headers-" + (four ? 4 : 8) + ".jsa";
            run(four, "dump", path).shouldHaveExitValue(0);
            run(four, "on", path).shouldHaveExitValue(0);
            run(!four, "on", path).shouldNotHaveExitValue(0).shouldContain("UseFourByteObjectHeaders");
        }
    }
}
