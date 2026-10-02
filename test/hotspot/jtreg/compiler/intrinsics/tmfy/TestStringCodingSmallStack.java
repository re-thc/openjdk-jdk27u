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
 * @summary Full-sized Latin1 conversion must unwind cleanly on a small Java stack
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.compiler1.enabled & vm.compiler2.enabled
 * @modules java.base/jdk.internal.tmfy
 * @run main/othervm -Xss256k -Xint -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingSmallStack leaf
 * @run main/othervm -Xss256k -Xint -XX:-UseTmfyStringCoding -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingSmallStack jni
 * @run main/othervm -Xss256k -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingSmallStack leaf
 * @run main/othervm -Xss256k -Xbatch -XX:TieredStopAtLevel=1 -XX:-UseTmfyStringCoding -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingSmallStack jni
 * @run main/othervm -Xss256k -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingSmallStack leaf
 * @run main/othervm -Xss256k -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:-UseTmfyStringCoding -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingSmallStack jni
 */
package compiler.intrinsics.tmfy;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.internal.tmfy.Utf8Codec;

public class TestStringCodingSmallStack {
    private static final String INPUT = "\u00e9".repeat(4096);
    private static final byte[] EXPECTED = new byte[8192];
    private static int entered, unwound;

    private static void checkEncoding() {
        if (!Arrays.equals(EXPECTED, INPUT.getBytes(StandardCharsets.UTF_8))) {
            throw new AssertionError("encoding corrupted during stack exhaustion");
        }
    }
    private static void recurse() {
        entered++;
        try {
            checkEncoding();
            recurse();
        } finally {
            unwound++;
        }
    }
    public static void main(String[] args) {
        for (int i = 0; i < EXPECTED.length; i += 2) {
            EXPECTED[i] = (byte) 0xc3;
            EXPECTED[i + 1] = (byte) 0xa9;
        }
        for (int i = 0; i < 10_000; i++) checkEncoding();
        long[] before = Utf8Codec.counters0();
        for (int attempt = 0; attempt < 8; attempt++) {
            entered = unwound = 0;
            try {
                recurse();
                throw new AssertionError("unbounded recursion returned");
            } catch (StackOverflowError expected) { }
            if (entered == 0 || entered != unwound) {
                throw new AssertionError("incomplete stack unwinding: " + entered + "/" + unwound);
            }
            checkEncoding();
        }
        long[] after = Utf8Codec.counters0();
        int route = args[0].equals("leaf") ? 0 : 1;
        if (after[route] <= before[route] || (route == 1 && after[0] != before[0])) {
            throw new AssertionError("small-stack conversion missed expected route");
        }
        System.out.println("STRING_CODING_SMALL_STACK_OK mode=" + args[0]);
    }
}
