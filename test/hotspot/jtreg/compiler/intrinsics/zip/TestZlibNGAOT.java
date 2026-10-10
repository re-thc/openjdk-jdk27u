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

/**
 * @test
 * @summary Verify AOT code cache compatibility and ZIP backend initialization
 * @requires os.family == "linux"
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @requires os.simpleArch == "aarch64" | vm.cpu.features ~= ".*avx2.*"
 * @requires vm.cds.supports.aot.code.caching
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires vm.compMode != "Xcomp" & vm.compMode != "Xint"
 * @requires vm.opt.VerifyOops == null | vm.opt.VerifyOops == false
 * @library /test/lib
 * @build TestZlibNGAOT
 * @run driver jdk.test.lib.helpers.ClassFileInstaller -jar app.jar ZlibNGAOTApp
 * @run driver/timeout=600 TestZlibNGAOT
 */

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.zip.Deflater;
import java.util.zip.Inflater;

import jdk.test.lib.cds.CDSAppTester;
import jdk.test.lib.process.OutputAnalyzer;

public class TestZlibNGAOT {
    public static void main(String[] args) throws Exception {
        for (String flag : List.of("UseZlibNG", "UseZipIntrinsics", "UseAdler32Intrinsics")) {
            for (boolean saved : new boolean[] {false, true}) {
                for (boolean changed : new boolean[] {false, true}) {
                    test(flag, saved, changed);
                }
            }
        }
    }

    private static void test(String flag, boolean saved, boolean changed) throws Exception {
        new CDSAppTester("ZIP-" + flag + "-" + saved + "-" + changed) {
            private boolean value(RunMode mode) {
                return mode == RunMode.PRODUCTION && changed ? !saved : saved;
            }

            @Override
            public String[] vmArgs(RunMode mode) {
                List<String> options = new ArrayList<>(List.of(
                    "-XX:+UnlockDiagnosticVMOptions", "-XX:-AbortVMOnAOTCodeFailure",
                    "-XX:+UseZlibNG", "-XX:+UseZipIntrinsics", "-XX:+UseAdler32Intrinsics",
                    "-Xlog:aot+codecache*=debug",
                    "--add-opens=java.base/java.util.zip=ALL-UNNAMED"));
                options.add("-XX:" + (value(mode) ? "+" : "-") + flag);
                return options.toArray(String[]::new);
            }

            @Override
            public String classpath(RunMode mode) {
                return "app.jar";
            }

            @Override
            public String[] appCommandLine(RunMode mode) {
                boolean enabled = flag.equals("UseZipIntrinsics") ? value(mode) : true;
                return new String[] {"ZlibNGAOTApp", Boolean.toString(enabled)};
            }

            @Override
            public void checkExecution(OutputAnalyzer out, RunMode mode) {
                if (mode == RunMode.ASSEMBLY) {
                    out.shouldMatch("AOT code cache size: [1-9][0-9]+ bytes");
                } else if (mode == RunMode.PRODUCTION) {
                    out.shouldContain("ZIP backend initialized correctly");
                    if (changed) {
                        out.shouldContain("AOT Code Cache disabled: it was created with " + flag +
                            " = " + saved + " vs current " + !saved);
                    } else {
                        out.shouldMatch("Loaded [1-9][0-9]+ AOT code entries from AOT Code Cache");
                    }
                }
            }
        }.runAOTWorkflow("--two-step-training");
    }
}

class ZlibNGAOTApp {
    public static void main(String[] args) throws Exception {
        var field = Class.forName("java.util.zip.ZipUtils")
                         .getDeclaredField("USE_ZIP_INTRINSICS");
        field.setAccessible(true);
        if (field.getBoolean(null) != Boolean.parseBoolean(args[0])) {
            throw new AssertionError("ZIP flag was restored from a different AOT run");
        }

        byte[] input = new byte[65536];
        for (int i = 0; i < input.length; i++) {
            input[i] = (byte) (i % 23);
        }
        byte[] compressed = new byte[input.length + 1024];
        byte[] restored = new byte[input.length];
        try (Deflater deflater = new Deflater(); Inflater inflater = new Inflater()) {
            for (int i = 0; i < 100; i++) {
                deflater.reset();
                deflater.setInput(input);
                deflater.finish();
                int length = deflater.deflate(compressed);
                if (!deflater.finished()) {
                    throw new AssertionError("Incomplete compression");
                }
                inflater.reset();
                inflater.setInput(compressed, 0, length);
                if (inflater.inflate(restored) != input.length || !inflater.finished() ||
                    !Arrays.equals(input, restored)) {
                    throw new AssertionError("Incorrect decompression");
                }
            }
        }
        System.out.println("ZIP backend initialized correctly");
    }
}
