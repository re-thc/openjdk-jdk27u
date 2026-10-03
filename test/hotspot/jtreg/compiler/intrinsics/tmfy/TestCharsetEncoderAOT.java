/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

/*
 * @test
 * @summary CharsetEncoder public native admission rebinds fresh state after AOT record/create/use
 * @requires os.family == "linux" & os.arch == "amd64"
 * @requires vm.cds.supports.aot.code.caching & vm.gc.G1 & vm.gc.Serial & vm.jvmti
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & vm.flagless
 * @library /test/lib
 * @build compiler.intrinsics.tmfy.CharsetEncoderAOTApp jdk.test.lib.util.StringCodingAccess
 * @run driver jdk.test.lib.helpers.ClassFileInstaller -jar charset-encoder-aot.jar compiler.intrinsics.tmfy.CharsetEncoderAOTApp jdk.test.lib.util.StringCodingAccess
 * @run main/othervm/native compiler.intrinsics.tmfy.TestCharsetEncoderAOT
 */
package compiler.intrinsics.tmfy;

import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import jdk.test.lib.cds.CDSAppTester;
import jdk.test.lib.process.OutputAnalyzer;

public class TestCharsetEncoderAOT {
    public static void main(String[] args) throws Exception {
        Tester tester = new Tester();
        tester.run("AOT", "--two-step-training");
        tester.productionRun();
        tester.mode = "disabled";
        tester.productionRun(new String[] {"-XX:-UseTmfyStringCoding"});
        tester.mode = "intrinsic-disabled";
        tester.productionRun(new String[] {"-XX:DisableIntrinsic=_tmfy_encodeUtf16ArrayUtf8"});
        tester.mode = "tooling";
        String agent = Path.of(System.getProperty("test.nativepath"),
                System.mapLibraryName("StringCodingReentry")).toString();
        tester.productionRun(new String[] {"-agentpath:" + agent});
        tester.mode = "serial";
        tester.productionRun();
    }

    private static class Tester extends CDSAppTester {
        String mode = "enabled";
        Tester() { super("CharsetEncoderAOT"); }
        @Override
        public String classpath(RunMode runMode) { return "charset-encoder-aot.jar"; }
        @Override
        public String[] vmArgs(RunMode runMode) {
            List<String> args = new ArrayList<>(List.of("-Xmx128M", "-Xbatch", "-XX:TieredStopAtLevel=1",
                    "-XX:+UnlockDiagnosticVMOptions", "-XX:+TmfyStringCodingCounters",
                    "--add-opens=java.base/java.lang=ALL-UNNAMED",
                    "--add-opens=java.base/sun.nio.cs=ALL-UNNAMED",
                    "--enable-native-access=ALL-UNNAMED",
                    "-Xlog:aot+codecache+init=debug,aot+codecache+exit=debug,aot+load=info"));
            args.add(mode.equals("serial") ? "-XX:+UseSerialGC" : "-XX:+UseG1GC");
            args.add(mode.equals("serial") ? "-XX:-AbortVMOnAOTCodeFailure" : "-XX:+AbortVMOnAOTCodeFailure");
            return args.toArray(String[]::new);
        }
        @Override
        public String[] appCommandLine(RunMode runMode) {
            return new String[] {CharsetEncoderAOTApp.class.getName(), mode.equals("enabled") ? "leaf" : "java"};
        }
        @Override
        public void checkExecution(OutputAnalyzer out, RunMode runMode) {
            if (runMode == RunMode.ASSEMBLY) {
                out.shouldMatch("AOT code cache size: [1-9][0-9]* bytes");
            } else if (runMode == RunMode.PRODUCTION) {
                if (mode.equals("serial")) {
                    out.shouldContain("Unable to use AOT Code Cache.");
                } else {
                    out.shouldMatch("Loaded [1-9][0-9]* AOT code entries from AOT Code Cache");
                    out.shouldNotContain("Unable to use AOT Code Cache.");
                }
                out.shouldContain("CHARSET_ENCODER_AOT_OK initialReady=false leaf=" + mode.equals("enabled"));
            }
        }
    }
}
