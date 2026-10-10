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
 * @test id=serial
 * @summary Four-byte static archives are deterministic across heap and archive relocation
 * @requires vm.cds & vm.gc.Serial & vm.bits == "64" & (os.arch == "amd64" | os.arch == "aarch64")
 * @requires vm.opt.UseFourByteObjectHeaders == null | vm.opt.UseFourByteObjectHeaders == true
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox DeterministicDump
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm/timeout=480 -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions
 *      -XX:+WhiteBoxAPI FourByteHeaderArchiveDeterminism Serial
 */

/*
 * @test id=g1
 * @summary Four-byte static archives are deterministic across heap and archive relocation
 * @requires vm.cds & vm.gc.G1 & vm.bits == "64" & (os.arch == "amd64" | os.arch == "aarch64")
 * @requires vm.opt.UseFourByteObjectHeaders == null | vm.opt.UseFourByteObjectHeaders == true
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox DeterministicDump
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm/timeout=480 -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions
 *      -XX:+WhiteBoxAPI FourByteHeaderArchiveDeterminism G1
 */

/*
 * @test id=z
 * @summary Four-byte static archives are deterministic across heap and archive relocation
 * @requires vm.cds & vm.gc.Z & vm.bits == "64" & (os.arch == "amd64" | os.arch == "aarch64")
 * @requires vm.opt.UseFourByteObjectHeaders == null | vm.opt.UseFourByteObjectHeaders == true
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox DeterministicDump
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm/timeout=480 -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions
 *      -XX:+WhiteBoxAPI FourByteHeaderArchiveDeterminism Z
 */

import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class FourByteHeaderArchiveDeterminism {
    public static void main(String[] args) throws Exception {
        String gc = "-XX:+Use" + args[0] + "GC";
        DeterministicDump.doTest(false, gc, "-XX:+UseFourByteObjectHeaders");
        DeterministicDump.doTest(true, gc, "-XX:+UseFourByteObjectHeaders");
        // The determinism runs use a fixed large young generation. Also dump
        // with ergonomic heap sizing, exercising hash expansion during GC.
        new OutputAnalyzer(ProcessTools.createLimitedTestJavaProcessBuilder(
                "-Xint", gc, "-XX:+UseFourByteObjectHeaders", "-Xlog:gc",
                "-XX:SharedArchiveFile=four-byte-young-gc.jsa", "-Xshare:dump").start())
                .shouldHaveExitValue(0);
    }
}
