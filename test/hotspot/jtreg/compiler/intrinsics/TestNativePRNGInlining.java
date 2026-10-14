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
 * @test id=c1
 * @summary Test that C1 inlines the NativePRNG.getRandomBytes0 intrinsic,
 *          but not the method that blocks
 * @requires os.family == "linux" | os.family == "mac"
 * @requires vm.compiler1.enabled
 * @library /test/lib
 * @run driver ${test.main.class} -XX:TieredStopAtLevel=1
 */

/*
 * @test id=c2
 * @summary Test that C2 inlines the NativePRNG.getRandomBytes0 intrinsic,
 *          but not the method that blocks
 * @requires os.family == "linux" | os.family == "mac"
 * @requires vm.compiler2.enabled
 * @library /test/lib
 * @run driver ${test.main.class} -XX:-TieredCompilation
 */

package compiler.intrinsics;

import java.security.SecureRandom;

import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class TestNativePRNGInlining {

    public static void main(String[] args) throws Exception {
        ProcessBuilder pb = ProcessTools.createLimitedTestJavaProcessBuilder(
            "-Xcomp", args[0],
            "-XX:+UnlockDiagnosticVMOptions", "-XX:+PrintInlining",
            "-XX:CompileCommand=quiet",
            "-XX:CompileCommand=compileonly,sun.security.provider.NativePRNG*::*",
            Compiled.class.getName());
        OutputAnalyzer output = new OutputAnalyzer(pb.start());
        output.shouldHaveExitValue(0);
        output.shouldMatch("NativePRNG::getRandomBytes0 \\(0 bytes\\)\\s+\\(?intrinsic\\)?");
        output.shouldMatch("NativePRNG::getBlockingRandomBytes0 \\(0 bytes\\)");
        output.shouldNotMatch("NativePRNG::getBlockingRandomBytes0 \\(0 bytes\\)\\s+\\(?intrinsic");
    }

    static class Compiled {
        public static void main(String[] args) throws Exception {
            byte[] bytes = new byte[16];
            SecureRandom.getInstance("NativePRNG").nextBytes(bytes);
            SecureRandom.getInstance("NativePRNGBlocking").nextBytes(bytes);
        }
    }
}
