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
 * @summary Full-sized UTF-16 conversion must unwind cleanly on a small Java stack
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.compiler1.enabled & vm.compiler2.enabled
 * @library /test/lib
 * @modules java.base/java.lang:+open
 * @run main/othervm -Xss256k -Xint -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingUtf16SmallStack leaf
 * @run main/othervm -Xss256k -Xint -XX:-UseTmfyStringCoding -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingUtf16SmallStack jni
 * @run main/othervm -Xss256k -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingUtf16SmallStack leaf
 * @run main/othervm -Xss256k -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_tmfy_encodeUtf16Utf8 -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingUtf16SmallStack jni
 * @run main/othervm -Xss256k -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingUtf16SmallStack leaf
 * @run main/othervm -Xss256k -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_tmfy_encodeUtf16Utf8 -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingUtf16SmallStack jni
 */
package compiler.intrinsics.tmfy;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.test.lib.util.StringCodingAccess;

public class TestStringCodingUtf16SmallStack {
    private static final String INPUT = "\u0800".repeat(2048);
    private static final byte[] EXPECTED = new byte[6144];
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
        for (int i = 0; i < EXPECTED.length; i += 3) {
            EXPECTED[i] = (byte) 0xe0;
            EXPECTED[i + 1] = (byte) 0xa0;
            EXPECTED[i + 2] = (byte) 0x80;
        }
        for (int i = 0; i < 10_000; i++) checkEncoding();
        long[] before = StringCodingAccess.counters0();
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
        long[] after = StringCodingAccess.counters0();
        int route = args[0].equals("leaf") ? 0 : 1;
        if (after[route] <= before[route] || (route == 1 && after[0] != before[0])) {
            throw new AssertionError("small-stack conversion missed expected route");
        }
        System.out.println("STRING_CODING_UTF16_SMALL_STACK_OK mode=" + args[0]);
    }
}
