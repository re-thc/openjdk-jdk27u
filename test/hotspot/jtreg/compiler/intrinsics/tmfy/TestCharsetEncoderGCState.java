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
 * @summary Public UTF-8 CharsetEncoder preserves live caller state across GC and active deoptimization
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.compiler1.enabled & vm.compiler2.enabled
 * @library /test/lib
 * @modules java.base/sun.nio.cs:+open java.base/java.lang:+open
 * @build compiler.intrinsics.tmfy.CharsetEncoderTestSupport jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -Xms32m -Xmx128m -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestCharsetEncoderGCState 1
 * @run main/othervm -Xbootclasspath/a:. -Xms32m -Xmx128m -Xbatch -XX:-TieredCompilation -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestCharsetEncoderGCState 4
 * @run main/othervm -Xbootclasspath/a:. -Xms32m -Xmx128m -Xbatch -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestCharsetEncoderGCState tiered
 */
package compiler.intrinsics.tmfy;

import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;
import jdk.test.whitebox.WhiteBox;

import static compiler.intrinsics.tmfy.CharsetEncoderTestSupport.*;

public class TestCharsetEncoderGCState {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();
    // Two full native chunks and one admitted tail, with nonzero array offsets.
    private static final int LENGTH = 2 * 2048 + 128;
    private static final int SOURCE_OFFSET = 7;
    private static final int OUTPUT_OFFSET = 11;
    private static final Method OUTER;
    private static final Method INNER;
    private static final Method BOUNDARY;
    private static volatile Object innerMarker, outerMarker;
    private static volatile long innerLong, outerLong;
    private static volatile int innerInt, outerInt, effects;
    private static volatile double innerDouble, outerDouble;
    private static int collections, deoptimizations;

    static {
        try {
            Class<?>[] signature = {Call.class, byte[].class, long.class, int.class, double.class, int.class};
            OUTER = TestCharsetEncoderGCState.class.getDeclaredMethod("outer", signature);
            INNER = TestCharsetEncoderGCState.class.getDeclaredMethod("inner", signature);
            BOUNDARY = TestCharsetEncoderGCState.class.getDeclaredMethod("boundary", int.class);
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

        Call() {
            Arrays.fill(input, '\u55aa');
            for (int i = 0; i < LENGTH; i++) {
                input[SOURCE_OFFSET + i] = switch (i % 3) {
                    case 0 -> '\u4e2d';
                    case 1 -> '\u0800';
                    default -> '\uffff';
                };
            }
            original = input.clone();
            Arrays.fill(expected, SENTINEL);
            // The read-only source selects the unchanged buffer-loop oracle.
            CoderResult oracle = StandardCharsets.UTF_8.newEncoder().encode(source.asReadOnlyBuffer(),
                    ByteBuffer.wrap(expected, OUTPUT_OFFSET, 3 * LENGTH).slice(), true);
            check(oracle.isUnderflow(), "oracle result");
        }

        CoderResult encode() {
            encoder.reset();
            source.clear();
            destination.clear();
            Arrays.fill(output, SENTINEL);
            return encoder.encode(source, destination, true);
        }

        void verify() {
            check(source.position() == LENGTH && destination.position() == 3 * LENGTH,
                    "source/destination positions");
            check(Arrays.equals(input, original), "input body or sentinels changed");
            check(Arrays.equals(output, expected), "output body or sentinels changed");
        }
    }

    // This helper receives no tested references. The arrays, buffers, encoder,
    // marker and primitive values must remain live in its Java caller scopes.
    // GC/deopt occurs between bounded leaves, never inside the no-safepoint kernel.
    private static void boundary(int mode) {
        if (mode == 0) return;
        if (mode == 1 || mode == 3) {
            WB.youngGC();
            collections++;
        }
        if (mode == 2 || mode == 3) {
            WB.fullGC();
            collections++;
        }
        if (mode == 3) {
            // outer is still active below this non-inlined helper. Invalidating
            // its installed nmethod forces reconstruction before it can resume.
            check(WB.deoptimizeMethod(OUTER) > 0, "active caller had no compiled nmethod");
            check(!WB.isMethodCompiled(OUTER), "active caller stayed compiled");
            deoptimizations++;
        }
    }

    private static void inner(Call call, byte[] marker, long token, int seed, double fraction, int mode) {
        char[] input = call.input;
        byte[] output = call.output;
        CharBuffer source = call.source;
        ByteBuffer destination = call.destination;
        CharsetEncoder encoder = call.encoder;
        effects = effects * 10 + 2;
        CoderResult first = call.encode();
        int consumed = source.position();
        int produced = destination.position();
        effects = effects * 10 + 3;
        boundary(mode);
        effects = effects * 10 + 4;
        check(first.isUnderflow() && consumed == LENGTH && produced == 3 * LENGTH,
                "first result or live positions lost");
        check(input == call.input && output == call.output && source == call.source &&
                destination == call.destination && encoder == call.encoder, "live reference identity lost");
        check(source.position() == consumed && destination.position() == produced &&
                Arrays.equals(input, call.original) && Arrays.equals(output, call.expected),
                "live buffers or array contents lost");
        encoder.reset();
        source.clear();
        destination.clear();
        Arrays.fill(output, SENTINEL);
        check(encoder.encode(source, destination, true).isUnderflow(), "second encode result");
        effects = effects * 10 + 5;
        innerMarker = marker;
        innerLong = token;
        innerInt = seed;
        innerDouble = fraction;
    }

    private static void outer(Call call, byte[] marker, long token, int seed, double fraction, int mode) {
        effects = effects * 10 + 1;
        inner(call, marker, token ^ 0x70f8e6d4c2b09183L, seed + 19, fraction + 0.25, mode);
        outerMarker = marker;
        outerLong = token;
        outerInt = seed;
        outerDouble = fraction;
        effects = effects * 10 + 6;
    }

    private static void exercise(Call call, int index, int mode) {
        byte[] marker = {(byte) (index + 7), (byte) (index ^ 0x5a)};
        long token = 0x8172635445362718L + index;
        int seed = 0x67230100 + index;
        double fraction = 3.5 + index;
        effects = 0;
        outer(call, marker, token, seed, fraction, mode);
        call.verify();
        check(innerMarker == marker && outerMarker == marker &&
                innerLong == (token ^ 0x70f8e6d4c2b09183L) && outerLong == token &&
                innerInt == seed + 19 && outerInt == seed &&
                innerDouble == fraction + 0.25 && outerDouble == fraction &&
                marker[0] == (byte) (index + 7) && marker[1] == (byte) (index ^ 0x5a) && effects == 123456,
                "caller state or exactly-once effects lost");
    }

    private static void compile(Method method, int level) {
        WB.deoptimizeMethod(method);
        check(WB.enqueueMethodForCompilation(method, level), "compilation rejected: " + method);
        check(WB.getMethodCompilationLevel(method) == level, "wrong compilation level: " + method);
    }

    private static void concurrentCollections() throws InterruptedException {
        CountDownLatch start = new CountDownLatch(1);
        AtomicReference<Throwable> failure = new AtomicReference<>();
        int[] completed = {0};
        Thread collector = new Thread(() -> {
            try {
                start.await();
                for (int i = 0; i < 8; i++) {
                    WB.youngGC();
                    completed[0]++;
                }
            } catch (Throwable t) {
                failure.set(t);
            }
        }, "charset-encoder-gc");
        collector.setDaemon(true);
        Call call = new Call();
        collector.start();
        long[] before = counters();
        try {
            start.countDown();
            // Fixed work on both threads stresses surrounding call transitions
            // and chunk-loop polls. There is no timing-dependent assertion that
            // a collection lands in any particular public call or leaf.
            for (int i = 0; i < 1_024; i++) exercise(call, i, 0);
        } finally {
            collector.join();
        }
        if (failure.get() != null) throw new AssertionError("concurrent collector failed", failure.get());
        check(completed[0] == 8, "concurrent collections missing");
        route(before, 1_024 * 6, 0, "concurrent young collections");
    }

    public static void main(String[] args) throws InterruptedException {
        boolean tiered = args[0].equals("tiered");
        int level = tiered ? -1 : Integer.parseInt(args[0]);
        WB.testSetDontInlineMethod(ORIGIN, true);
        WB.testSetDontInlineMethod(OUTER, true);
        WB.testSetForceInlineMethod(INNER, true);
        WB.testSetDontInlineMethod(BOUNDARY, true);
        WB.makeMethodNotCompilable(BOUNDARY);
        Call warm = new Call();
        for (int i = 0; i < (tiered ? 20_000 : 300); i++) exercise(warm, i, 0);
        if (!tiered) {
            compile(ORIGIN, level);
            compile(OUTER, level);
        }
        check(WB.getMethodCompilationLevel(ORIGIN) > 0 && WB.getMethodCompilationLevel(OUTER) > 0,
                "public origin and state caller must both be compiled");
        concurrentCollections();
        for (int mode = 1; mode <= 3; mode++) {
            // Fresh arrays have not been published to any static root. Both
            // calls must use the public char[] route, including after deopt.
            Call call = new Call();
            long[] before = counters();
            exercise(call, 30_000 + mode, mode);
            route(before, 6, 0, "GC/deopt mode=" + mode);
        }
        check(collections == 4 && deoptimizations == 1, "GC/deopt boundary did not execute exactly once");
        System.out.println("CHARSET_ENCODER_GC_STATE_OK mode=" + args[0]);
    }
}
