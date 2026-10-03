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
 * @summary Bounded UTF-8 CharsetEncoder leaf and explicit JNI calls preserve a small Java stack
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.compiler1.enabled & vm.compiler2.enabled
 * @library /test/lib
 * @modules java.base/sun.nio.cs:+open java.base/java.lang:+open
 * @build compiler.intrinsics.tmfy.CharsetEncoderTestSupport jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -Xss256k -Xint -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestCharsetEncoderSmallStack 0 leaf
 * @run main/othervm -Xbootclasspath/a:. -Xss256k -Xint -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters -XX:DisableIntrinsic=_tmfy_encodeUtf16ArrayUtf8 compiler.intrinsics.tmfy.TestCharsetEncoderSmallStack 0 jni
 * @run main/othervm -Xbootclasspath/a:. -Xss256k -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestCharsetEncoderSmallStack 1 leaf
 * @run main/othervm -Xbootclasspath/a:. -Xss256k -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters -XX:DisableIntrinsic=_tmfy_encodeUtf16ArrayUtf8 compiler.intrinsics.tmfy.TestCharsetEncoderSmallStack 1 jni
 * @run main/othervm -Xbootclasspath/a:. -Xss256k -Xbatch -XX:-TieredCompilation -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestCharsetEncoderSmallStack 4 leaf
 * @run main/othervm -Xbootclasspath/a:. -Xss256k -Xbatch -XX:-TieredCompilation -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters -XX:DisableIntrinsic=_tmfy_encodeUtf16ArrayUtf8 compiler.intrinsics.tmfy.TestCharsetEncoderSmallStack 4 jni
 * @run main/othervm -Xbootclasspath/a:. -Xss256k -Xbatch -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestCharsetEncoderSmallStack tiered leaf
 * @run main/othervm -Xbootclasspath/a:. -Xss256k -Xbatch -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters -XX:DisableIntrinsic=_tmfy_encodeUtf16ArrayUtf8 compiler.intrinsics.tmfy.TestCharsetEncoderSmallStack tiered jni
 */
package compiler.intrinsics.tmfy;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.test.whitebox.WhiteBox;

import static compiler.intrinsics.tmfy.CharsetEncoderTestSupport.*;

public class TestCharsetEncoderSmallStack {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();
    private static final int LENGTH = 2048;
    private static final int SOURCE_OFFSET = 7;
    private static final int OUTPUT_OFFSET = 11;
    private static final int DEPTH = 64;
    private static final int ATTEMPTS = 32;
    private static final MethodHandle ENCODE;
    private static final Method WALK;
    private static final Method CONVERT;

    static {
        try {
            ENCODE = MethodHandles.lookup().unreflect(NATIVE);
            WALK = TestCharsetEncoderSmallStack.class.getDeclaredMethod("walk", Call.class, int.class, long.class);
            CONVERT = TestCharsetEncoderSmallStack.class.getDeclaredMethod("convert", Call.class);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private static final class Call {
        final char[] input = new char[SOURCE_OFFSET + LENGTH + 13];
        final byte[] output = new byte[OUTPUT_OFFSET + 3 * LENGTH + 17];
        final char[] original;
        final byte[] expected = new byte[output.length];
        final CharBuffer source = CharBuffer.wrap(input, SOURCE_OFFSET, LENGTH).slice();
        final ByteBuffer destination = ByteBuffer.wrap(output, OUTPUT_OFFSET, 3 * LENGTH).slice();
        final CharsetEncoder encoder = StandardCharsets.UTF_8.newEncoder();
        final boolean jni;
        int entered, unwound, completed;

        Call(boolean jni) {
            this.jni = jni;
            Arrays.fill(input, '\u55aa');
            Arrays.fill(input, SOURCE_OFFSET, SOURCE_OFFSET + LENGTH, '\u4e2d');
            original = input.clone();
            Arrays.fill(expected, SENTINEL);
            check(StandardCharsets.UTF_8.newEncoder().encode(source.asReadOnlyBuffer(),
                    ByteBuffer.wrap(expected, OUTPUT_OFFSET, 3 * LENGTH).slice(), true).isUnderflow(),
                    "oracle result");
        }

        void reset() {
            entered = unwound = completed = 0;
            encoder.reset();
            source.clear();
            destination.clear();
            Arrays.fill(output, SENTINEL);
        }

        void verify() {
            check(Arrays.equals(input, original), "source body or sentinels changed");
            check(Arrays.equals(output, expected), "output body or sentinels changed");
        }
    }

    private static void convert(Call call) throws Throwable {
        check(call.encoder.encode(call.source, call.destination, true).isUnderflow() &&
                call.source.position() == LENGTH && call.destination.position() == 3 * LENGTH,
                "public encode result/positions");
        call.verify();
        if (call.jni) {
            // Public admission is disabled in this mode. Explicitly invoke the
            // exact typed method to cover its bounded-copy ordinary JNI bridge.
            Arrays.fill(call.output, SENTINEL);
            int progress = (int) ENCODE.invokeExact(call.input, SOURCE_OFFSET, LENGTH,
                    call.output, OUTPUT_OFFSET, 3 * LENGTH);
            check(progress == ((LENGTH << 13) | (3 * LENGTH)), "explicit JNI progress");
            call.verify();
        }
        call.completed++;
    }

    // A realistic, fixed call-chain budget leaves room for both the leaf's
    // snapshot and the JNI bridge. This does not deliberately exhaust the
    // remaining native stack or claim arbitrary-depth StackOverflow recovery.
    private static long walk(Call call, int depth, long token) throws Throwable {
        char[] liveInput = call.input;
        byte[] liveOutput = call.output;
        call.entered++;
        long result;
        try {
            if (depth == 0) {
                convert(call);
                result = token;
            } else {
                result = walk(call, depth - 1, token + depth);
            }
            check(liveInput == call.input && liveOutput == call.output, "caller references changed");
            return result ^ token;
        } finally {
            call.unwound++;
        }
    }

    private static void exercise(Call call, int depth) throws Throwable {
        call.reset();
        long token = 0x8172635445362718L;
        long expected = 0;
        for (int remaining = depth; remaining > 0; remaining--) {
            expected ^= token;
            token += remaining;
        }
        check(walk(call, depth, 0x8172635445362718L) == expected, "stack-local token changed");
        check(call.entered == depth + 1 && call.unwound == depth + 1 && call.completed == 1,
                "call-chain effects were skipped or repeated");
        call.verify();
    }

    private static void compile(Method method, int level) {
        WB.deoptimizeMethod(method);
        check(WB.enqueueMethodForCompilation(method, level), "compilation rejected: " + method);
        check(WB.getMethodCompilationLevel(method) == level, "wrong compilation level: " + method);
    }

    public static void main(String[] args) throws Throwable {
        boolean tiered = args[0].equals("tiered");
        int level = tiered ? -1 : Integer.parseInt(args[0]);
        boolean jni = args[1].equals("jni");
        WB.testSetDontInlineMethod(ORIGIN, true);
        WB.testSetDontInlineMethod(WALK, true);
        WB.testSetDontInlineMethod(CONVERT, true);
        if (jni) check(ready(), "Charset JNI readiness");
        Call call = new Call(jni);
        for (int i = 0; i < (tiered ? 20_000 : 300); i++) exercise(call, 4);
        if (level > 0) {
            compile(ORIGIN, level);
            compile(CONVERT, level);
            compile(WALK, level);
        }
        if (tiered) {
            check(WB.getMethodCompilationLevel(ORIGIN) > 0 && WB.getMethodCompilationLevel(CONVERT) > 0 &&
                    WB.getMethodCompilationLevel(WALK) > 0, "ordinary tiering did not compile tested call chain");
        }
        long[] before = counters();
        for (int i = 0; i < ATTEMPTS; i++) exercise(call, DEPTH);
        route(before, jni ? 0 : ATTEMPTS, jni ? ATTEMPTS : 0, "bounded small-stack call chain");
        System.out.println("CHARSET_ENCODER_SMALL_STACK_OK mode=" + args[0] + " route=" + args[1]);
    }
}
