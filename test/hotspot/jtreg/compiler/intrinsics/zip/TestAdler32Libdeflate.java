/*
 * Copyright (c) 2026, re-thc. All rights reserved.
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
 */

/*
 * @test
 * @summary Assert bulk Adler32 leaf selection and retain the unknown-length fallback
 * @requires vm.compiler2.enabled & ((os.simpleArch == "x64" & vm.cpu.features ~= ".*avx2.*") | os.simpleArch == "aarch64")
 * @library /test/lib
 * @modules jdk.incubator.vector
 * @build compiler.intrinsics.zip.TestAdler32Bulk compiler.intrinsics.zip.TestAdler32Fp
 * @run driver compiler.intrinsics.zip.TestAdler32Libdeflate
 */

package compiler.intrinsics.zip;

import java.util.Arrays;
import jdk.test.lib.Platform;
import jdk.test.lib.Utils;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class TestAdler32Libdeflate {
    public static void main(String[] args) throws Exception {
        // Optional external-library builds request positive path assertions with
        // -Dtest.libdeflate=true. No VM counters or product flags are required.
        boolean expectLibrary = Boolean.getBoolean("test.libdeflate") ||
                Arrays.asList(Utils.getTestJavaOpts()).contains("-Dtest.libdeflate=true");
        OutputAnalyzer bulk = run(TestAdler32Bulk.class, 3000);
        checkCall(bulk, "arrayUnknown", "updateBytesAdler32");
        if (expectLibrary) {
            checkCall(bulk, "arrayRanged", "SharedRuntime::libdeflate_adler32");
            checkCall(bulk, "directRanged", "SharedRuntime::libdeflate_adler32");
        }
        OutputAnalyzer fp = run(TestAdler32Fp.class, 5000);
        if (expectLibrary) {
            checkCall(fp, "scalar", "SharedRuntime::libdeflate_adler32");
            checkCall(fp, "vector", "SharedRuntime::libdeflate_adler32");
        }
    }

    private static OutputAnalyzer run(Class<?> main, int iterations) throws Exception {
        java.util.ArrayList<String> options = new java.util.ArrayList<>(Arrays.asList(
                "--add-modules=jdk.incubator.vector", "-Xbatch", "-XX:-TieredCompilation",
                "-XX:CompileThreshold=1000", "-XX:+UnlockDiagnosticVMOptions",
                "-XX:+UseAdler32Intrinsics", "-XX:CompileCommand=dontinline," + main.getName() + "::*",
                "-XX:CompileCommand=print," + main.getName() + "::*"));
        if (Platform.isX64()) options.add("-XX:UseAVX=2");
        options.add(main.getName());
        options.add(Integer.toString(iterations));
        OutputAnalyzer output = ProcessTools.executeTestJava(options);
        output.shouldHaveExitValue(0);
        return output;
    }

    private static void checkCall(OutputAnalyzer output, String method, String target) {
        for (String block : output.getStdout().split("Compiled method \\(c2\\)")) {
            int lineEnd = block.indexOf('\n');
            if (lineEnd >= 0 && block.substring(0, lineEnd).contains("::" + method + " ") &&
                java.util.regex.Pattern.compile("runtime_call [^\\n]*" + java.util.regex.Pattern.quote(target))
                    .matcher(block).find()) {
                return;
            }
        }
        output.reportDiagnosticSummary();
        throw new AssertionError("No compiled " + method + " call to " + target);
    }
}
