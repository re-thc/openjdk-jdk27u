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
 * @summary VM ISA restrictions constrain the selected Unicode backend
 * @requires os.family == "linux" & os.arch == "amd64" & vm.flagless
 * @library /test/lib
 * @run driver compiler.intrinsics.tmfy.TestStringCodingCpuSelection
 */
package compiler.intrinsics.tmfy;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.regex.Pattern;
import jdk.test.lib.process.ProcessTools;

public class TestStringCodingCpuSelection {
    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            String text = "\u4e2d\u20ac\ud83d\ude00".repeat(256);
            byte[] unit = {(byte)0xe4,(byte)0xb8,(byte)0xad,(byte)0xe2,(byte)0x82,(byte)0xac,
                           (byte)0xf0,(byte)0x9f,(byte)0x98,(byte)0x80};
            byte[] expected = new byte[unit.length*256];
            for (int i=0;i<expected.length;i++) expected[i]=unit[i%unit.length];
            for (int i=0;i<1000;i++) {
                if (!Arrays.equals(expected,text.getBytes(StandardCharsets.UTF_8))
                        || !text.equals(new String(expected,StandardCharsets.UTF_8))) {
                    throw new AssertionError("ISA-restricted public conversion");
                }
            }
            System.out.println("STRING_CODING_CPU_SELECTION_OK");
            return;
        }
        String[] flags = {"-XX:UseAVX=0", "-XX:UseAVX=1", "-XX:UseAVX=2", "-XX:UseSSE=2",
                "-XX:-UseBMI1Instructions", "-XX:-UseBMI2Instructions",
                "-XX:-UseCountLeadingZerosInstruction", "-XX:-UsePopCountInstruction"};
        for (String flag : flags) {
            var out = ProcessTools.executeTestJava("-Xmx128m", "-Xint", flag, "-Xlog:tmfy=info",
                    TestStringCodingCpuSelection.class.getName(), "child");
            out.shouldHaveExitValue(0).shouldContain("STRING_CODING_CPU_SELECTION_OK");
            var m = Pattern.compile("UTF-8 conversion backend=([^ ]+)").matcher(out.getOutput());
            if (!m.find()) throw new AssertionError("missing backend selection for " + flag);
            String backend=m.group(1);
            if ((flag.equals("-XX:UseAVX=0") || flag.equals("-XX:UseAVX=1"))
                    && (backend.equals("haswell") || backend.equals("icelake"))) {
                throw new AssertionError(flag+" admitted AVX backend "+backend);
            }
            if (flag.equals("-XX:UseAVX=2") && backend.equals("icelake")) {
                throw new AssertionError("AVX2 restriction admitted AVX512 backend");
            }
            if ((flag.equals("-XX:UseSSE=2") || flag.equals("-XX:-UsePopCountInstruction"))
                    && (backend.equals("westmere") || backend.equals("haswell") || backend.equals("icelake"))) {
                throw new AssertionError(flag+" admitted a backend with excluded SSE/POPCNT requirements");
            }
            if ((flag.contains("BMI") || flag.contains("LeadingZeros"))
                    && (backend.equals("haswell") || backend.equals("icelake"))) {
                throw new AssertionError(flag+" admitted a backend with excluded BMI/LZCNT requirements");
            }
        }
    }
}
