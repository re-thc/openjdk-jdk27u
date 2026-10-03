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
 * @summary A post-store native failure must throw InternalError without Java replay
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.compiler1.enabled & vm.compiler2.enabled
 * @library /test/lib
 * @modules java.base/java.lang:+open
 * @run main/othervm/native -Xint -XX:+UseG1GC --enable-native-access=ALL-UNNAMED compiler.intrinsics.tmfy.TestStringCodingUtf16Failure
 * @run main/othervm/native -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC --enable-native-access=ALL-UNNAMED compiler.intrinsics.tmfy.TestStringCodingUtf16Failure
 * @run main/othervm/native -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 -XX:+UseG1GC --enable-native-access=ALL-UNNAMED compiler.intrinsics.tmfy.TestStringCodingUtf16Failure
 */
package compiler.intrinsics.tmfy;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.test.lib.util.StringCodingAccess;
public class TestStringCodingUtf16Failure {
    static { System.loadLibrary("StringCodingRebind"); }
    private static native int install(Class<?> holder);
    private static native long calls();
    public static void main(String[] args) {
        if (!StringCodingAccess.ready()) throw new AssertionError("registration");
        String text = "\u4e2d".repeat(128);
        byte[] input = text.getBytes(StandardCharsets.UTF_8);
        for (int i=0;i<20_000;i++) {
            if (!Arrays.equals(input,text.getBytes(StandardCharsets.UTF_8))
                    || !text.equals(new String(input,StandardCharsets.UTF_8))) throw new AssertionError("warmup");
        }
        byte[] original = input.clone();
        if (install(StringCodingAccess.type()) != 0) throw new AssertionError("failure injection binding");
        long before = calls();
        try { text.getBytes(StandardCharsets.UTF_8); throw new AssertionError("post-store encode replayed"); }
        catch (InternalError expected) {
            if (!expected.getMessage().contains("UTF-16 UTF-8 conversion failed: -2")) throw expected;
        }
        try { new String(input,StandardCharsets.UTF_8); throw new AssertionError("post-store decode replayed"); }
        catch (InternalError expected) {
            if (!expected.getMessage().contains("UTF-8 UTF-16 conversion failed: -2")) throw expected;
        }
        if (calls()-before != 2 || !Arrays.equals(input,original)) throw new AssertionError("failure replay or input mutation");
        System.out.println("STRING_CODING_UTF16_FAILURE_OK");
    }
}
