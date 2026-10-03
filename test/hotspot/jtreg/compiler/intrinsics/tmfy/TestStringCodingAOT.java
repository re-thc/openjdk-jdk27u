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
 * @summary Public String UTF-8 conversions remain safe with the JDK AOT cache and changed runtime settings
 * @requires os.family == "linux" & os.arch == "amd64"
 * @requires vm.cds.supports.aot.code.caching & vm.gc.G1 & vm.gc.Serial & vm.jvmti
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & vm.flagless
 * @library /test/lib
 * @modules java.base/java.lang:+open
 * @build compiler.intrinsics.tmfy.StringCodingAOTApp jdk.test.lib.util.StringCodingAccess
 * @run driver jdk.test.lib.helpers.ClassFileInstaller -jar string-coding-aot.jar compiler.intrinsics.tmfy.StringCodingAOTApp jdk.test.lib.util.StringCodingAccess
 * @run main/othervm/native compiler.intrinsics.tmfy.TestStringCodingAOT
 */
package compiler.intrinsics.tmfy;

import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import jdk.test.lib.cds.CDSAppTester;
import jdk.test.lib.process.OutputAnalyzer;

public class TestStringCodingAOT {
    public static void main(String[] args) throws Exception {
        Tester tester = new Tester();
        tester.run("AOT", "--two-step-training");
        tester.productionRun(); // A separate process must bind current runtime addresses again.
        // Eager compilation does not guarantee that every origin is compiled
        // before explicit setup. The app checks stable per-iteration admission
        // after warmup; the independent Latin1 C1 lowering still admits work.
        tester.mode = "eager";
        tester.productionRun(new String[] {"-XX:+UnlockExperimentalVMOptions", "-XX:+AOTCompileEagerly"});

        tester.mode = "disabled";
        tester.productionRun(new String[] {"-XX:-UseTmfyStringCoding"});

        // This existing agent acquires NativeMethodBind capability at startup.
        // No callback fixture is armed; only the feature's tooling gate is tested.
        tester.mode = "tooling";
        String agent = Path.of(System.getProperty("test.nativepath"),
                System.mapLibraryName("StringCodingReentry")).toString();
        tester.productionRun(new String[] {"-agentpath:" + agent});

        tester.mode = "serial";
        tester.productionRun();

        if (tester.hasAVX) {
            tester.mode = "cpu";
            tester.productionRun(new String[] {"-XX:UseAVX=0"});
        } else {
            System.out.println("UseAVX mismatch case is inapplicable: assembly VM has no AVX feature");
        }
    }

    private static class Tester extends CDSAppTester {
        String mode = "enabled";
        boolean hasAVX;

        Tester() {
            super("StringCodingAOT");
        }

        @Override
        public String classpath(RunMode runMode) {
            return "string-coding-aot.jar";
        }

        @Override
        public String[] vmArgs(RunMode runMode) {
            List<String> args = new ArrayList<>(List.of(
                    "-Xmx128M", "-Xbatch", "-XX:TieredStopAtLevel=1",
                    "-XX:+UnlockDiagnosticVMOptions", "-XX:+TmfyStringCodingCounters",
                    "--add-opens=java.base/java.lang=ALL-UNNAMED",
                    "--enable-native-access=ALL-UNNAMED",
                    "-Xlog:aot+codecache+init=debug,aot+codecache+exit=debug,aot+codecache+stubs=debug,aot+load=info,tmfy=info"));
            args.add(mode.equals("serial") ? "-XX:+UseSerialGC" : "-XX:+UseG1GC");
            // GC/CPU mismatch deliberately exercises upstream's safe rejection.
            args.add(mode.equals("serial") || mode.equals("cpu")
                    ? "-XX:-AbortVMOnAOTCodeFailure" : "-XX:+AbortVMOnAOTCodeFailure");
            return args.toArray(String[]::new);
        }

        @Override
        public String[] appCommandLine(RunMode runMode) {
            boolean leaf = mode.equals("enabled") || mode.equals("cpu");
            String route = mode.equals("eager") ? "eager" : leaf ? "leaf"
                    : mode.equals("tooling") ? "fallback" : "java";
            return new String[] {StringCodingAOTApp.class.getName(), route};
        }

        @Override
        public void checkExecution(OutputAnalyzer out, RunMode runMode) {
            if (runMode == RunMode.ASSEMBLY) {
                out.shouldMatch("AOT code cache size: [1-9][0-9]* bytes");
                hasAVX = out.getOutput().matches("(?s).*CPU features recorded in AOTCodeCache:.*\\bavx\\b.*");
            } else if (runMode == RunMode.PRODUCTION) {
                if (mode.equals("serial")) {
                    out.shouldContain("AOT Code Cache disabled: it was created with GC =");
                    out.shouldContain("Unable to use AOT Code Cache.");
                    out.shouldNotMatch("Read blob.*kind=");
                } else if (mode.equals("cpu")) {
                    out.shouldContain("AOT Code Cache disabled: cpu features are incompatible");
                    out.shouldContain("Unable to use AOT Code Cache.");
                    out.shouldNotMatch("Read blob.*kind=");
                } else {
                    out.shouldMatch("Loaded [1-9][0-9]* AOT code entries from AOT Code Cache");
                    for (String stub : new String[] {
                            "tmfy_stringcoding_initialize", "throw_tmfy_stringcoding_error"}) {
                        out.shouldMatch("Read blob " + Pattern.quote("'" + stub + "_blob (C1 runtime)'")
                                + ".*kind=C1Blob");
                    }
                    out.shouldNotContain("Unable to use AOT Code Cache.");
                }
                out.shouldMatch("aot,load.*compiler.intrinsics.tmfy.StringCodingAOTApp");
                out.shouldContain("STRING_CODING_AOT_UNICODE_FIRST_OK initialReady=false registered=true");
                out.shouldContain("STRING_CODING_AOT_OK");
            }
        }
    }
}
