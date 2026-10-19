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
 */

/*
 * @test
 * @summary Assert that the sibling sharing rule actually changes a C2 graph.
 * @requires vm.debug == true & vm.compiler2.enabled & (os.arch == "amd64" | os.arch == "x86_64")
 * @requires vm.cpu.features ~= ".*bmi2.*"
 * @library /test/lib
 * @build TestSharedSpillLoads TestSharedSpillSharingTrigger
 * @run driver TestSharedSpillSharingTrace
 */
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class TestSharedSpillSharingTrace {
    public static void main(String[] args) throws Exception {
        OutputAnalyzer output = ProcessTools.executeTestJava(
            "-Xbatch", "-Xshare:off", "-XX:+UnlockDiagnosticVMOptions",
            "-XX:+VerifyRegisterAllocator", "-XX:-OmitStackTraceInFastThrow",
            "-XX:+UseBMI2Instructions", "-XX:+UseFPUForSpilling",
            "-XX:CompileCommand=dontinline,TestSharedSpillLoads::kernel*",
            "-XX:CompileCommand=dontinline,TestSharedSpillLoads::cold",
            "-XX:CompileCommand=exclude,TestSharedSpillLoads::reference",
            "TestSharedSpillLoads");
        output.shouldHaveExitValue(0)
              .shouldContain("generated accumulator oracle checks=120")
              .shouldContain("alias checks=80 boundary-and-complete-output checks=60");

        OutputAnalyzer trigger = ProcessTools.executeTestJava(
            "-Xbatch", "-Xshare:off", "-XX:+UnlockDiagnosticVMOptions",
            "-XX:+VerifyRegisterAllocator", "-XX:+UseBMI2Instructions",
            "-XX:+UseFPUForSpilling", "-XX:CICompilerCount=2",
            "-XX:CompileCommand=dontinline,TestSharedSpillSharingTrigger::kernel",
            "-XX:CompileCommand=dontinline,TestSharedSpillSharingTrigger::barrier",
            "-XX:CompileCommand=exclude,TestSharedSpillSharingTrigger::reference",
            "-XX:CompileCommand=TraceSpilling,TestSharedSpillSharingTrigger::kernel",
            "TestSharedSpillSharingTrigger");
        trigger.shouldHaveExitValue(0)
               .shouldContain("trigger oracle checks=12000")
               .shouldMatch("(?m)^SHARED_RELOAD_SUMMARY .*TestSharedSpillSharingTrigger::kernel.* accepted=[1-9][0-9]* work=[0-9]+ nodes=[0-9]+ ranges=[0-9]+ exhausted=0$");
        for (String line : trigger.getStdout().split("\\R")) {
            if (line.startsWith("SHARED_RELOAD_SUMMARY ")) System.out.println(line);
        }
    }
}
