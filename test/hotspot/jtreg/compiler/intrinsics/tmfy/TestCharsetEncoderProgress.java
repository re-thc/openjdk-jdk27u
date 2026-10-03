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
 * @summary Strict UTF-8 CharsetEncoder prefix progress, error actions, positions, and actual public routing
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & vm.gc.G1 & (os.family == "linux") & (os.arch == "amd64")
 * @library /test/lib
 * @modules java.base/sun.nio.cs:+open java.base/java.lang:+open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters -XX:+UseG1GC -Xint compiler.intrinsics.tmfy.TestCharsetEncoderProgress 0 leaf
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters -XX:+UseG1GC -Xbatch -XX:TieredStopAtLevel=1 compiler.intrinsics.tmfy.TestCharsetEncoderProgress 1 leaf
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters -XX:+UseG1GC -Xbatch -XX:-TieredCompilation compiler.intrinsics.tmfy.TestCharsetEncoderProgress 4 leaf
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters -XX:+UseG1GC -XX:-UseTmfyStringCoding -Xint compiler.intrinsics.tmfy.TestCharsetEncoderProgress 0 java
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters -XX:+UseG1GC -XX:-UseTmfyStringCoding -Xbatch -XX:TieredStopAtLevel=1 compiler.intrinsics.tmfy.TestCharsetEncoderProgress 1 java
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters -XX:+UseG1GC -XX:-UseTmfyStringCoding -Xbatch -XX:-TieredCompilation compiler.intrinsics.tmfy.TestCharsetEncoderProgress 4 java
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters -XX:+UseG1GC -XX:DisableIntrinsic=_tmfy_encodeUtf16ArrayUtf8 -Xbatch -XX:TieredStopAtLevel=1 compiler.intrinsics.tmfy.TestCharsetEncoderProgress 1 java
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters -XX:+UseG1GC -XX:DisableIntrinsic=_tmfy_encodeUtf16ArrayUtf8 -Xbatch -XX:-TieredCompilation compiler.intrinsics.tmfy.TestCharsetEncoderProgress 4 java
 */
package compiler.intrinsics.tmfy;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.test.lib.util.StringCodingAccess;
import jdk.test.whitebox.WhiteBox;

public class TestCharsetEncoderProgress {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();
    private static final byte SENTINEL = 0x5a;
    private static final int MAX = 2048;
    private static final Class<?> ENCODER = StandardCharsets.UTF_8.newEncoder().getClass();
    private static final MethodType SIGNATURE = MethodType.methodType(int.class,
            char[].class, int.class, int.class, byte[].class, int.class, int.class);
    private static final MethodHandle NATIVE;
    private static final MethodHandle READY;
    static {
        try {
            MethodHandles.Lookup lookup = MethodHandles.privateLookupIn(ENCODER, MethodHandles.lookup());
            NATIVE = lookup.findStatic(ENCODER, "encodeUtf16ArrayUtf80", SIGNATURE);
            READY = lookup.findStatic(ENCODER, "utf8Ready", MethodType.methodType(boolean.class));
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private static int nativeEncode(char[] in, int off, int len, byte[] out, int pos, int cap)
            throws Throwable {
        return (int) NATIVE.invokeExact(in, off, len, out, pos, cap);
    }

    public static void main(String[] args) throws Throwable {
        int level = Integer.parseInt(args[0]);
        boolean leaf = args[1].equals("leaf");
        Method slow = ENCODER.getDeclaredMethod("encodeArrayLoopSlow", CharBuffer.class,
                char[].class, int.class, int.class, ByteBuffer.class, byte[].class, int.class, int.class);
        Method direct = TestCharsetEncoderProgress.class.getDeclaredMethod("nativeEncode", SIGNATURE.parameterArray());
        WB.testSetDontInlineMethod(slow, true);
        WB.testSetDontInlineMethod(direct, true);
        char[] input = new char[MAX];
        Arrays.fill(input, '\u4e2d');
        CharsetEncoder encoder = StandardCharsets.UTF_8.newEncoder();
        CharBuffer src = CharBuffer.wrap(input);
        ByteBuffer dst = ByteBuffer.allocate(MAX * 3);
        for (int i = 0; i < 200; ++i) {
            encoder.reset(); src.clear(); dst.clear();
            check(encoder.encode(src, dst, true).isUnderflow(), "warmup");
        }
        compile(slow, level);
        long[] before = StringCodingAccess.counters0();
        for (int i = 0; i < 10; ++i) {
            encoder.reset(); src.clear(); dst.clear();
            check(encoder.encode(src, dst, true).isUnderflow() && dst.position() == MAX * 3,
                    "public CJK route");
        }
        long[] after = StringCodingAccess.counters0();
        check(after[3] - before[3] == (leaf ? 10 : 0), "public Charset leaf delta");
        check(after[4] == before[4], "public origin must not use unqualified JNI");
        check(WB.getMethodCompilationLevel(slow) == level, "public slow loop compilation level");
        semantics();
        streaming();

        // Explicit private fallback remains correct, even when public admission
        // is disabled. This also registers the second holder without revoking
        // the first holder's legitimate bootstrap registration exemption.
        check((boolean) READY.invokeExact(), "native readiness");
        byte[] out = new byte[MAX * 3];
        for (int i = 0; i < 200; ++i) nativeEncode(input, 0, input.length, out, 0, out.length);
        compile(direct, level);
        before = StringCodingAccess.counters0();
        privateSemantics();
        after = StringCodingAccess.counters0();
        check(after[leaf ? 3 : 4] > before[leaf ? 3 : 4], "explicit private route");
        check(after[leaf ? 4 : 3] == before[leaf ? 4 : 3], "unexpected private route");
        System.out.println("CHARSET_ENCODER_PROGRESS_OK level=" + level + " leaf=" + leaf);
    }

    private static void compile(Method method, int level) {
        if (level != 0) {
            WB.deoptimizeMethod(method);
            check(WB.enqueueMethodForCompilation(method, level), "compilation rejected");
        }
        check(WB.getMethodCompilationLevel(method) == level, "wrong compilation level");
    }

    private static void semantics() {
        for (int n : new int[] {0, 1, 15, 16, 17, 31, 32, 127, 128, 129,
                               2047, 2048, 2049, 4095, 4096, 4097}) {
            for (int pattern = 0; pattern < 3; ++pattern) {
                char[] input = new char[n];
                for (int i = 0; i < n; ++i) input[i] = pattern == 0 ? 'a' :
                        pattern == 1 ? '\u4e2d' : (i % 4 == 0 ? '\u00e9' : '\u4e2d');
                compareCapacities(input);
            }
            for (int error : new int[] {0, 4, 15, 16, 127, 128, 2047, 2048, n - 1}) {
                if (error < 0 || error >= n) continue;
                for (int kind = 0; kind < 3; ++kind) {
                    char[] input = new char[n];
                    Arrays.fill(input, '\u4e2d');
                    input[error] = kind == 0 ? '\udc00' : '\ud800';
                    if (kind == 2 && error + 1 < n) input[error + 1] = '\udc00';
                    compareCapacities(input);
                }
            }
        }
        // Native admission stays absent for ASCII, short non-ASCII, and tight output.
        long[] before = StringCodingAccess.counters0();
        compare(new char[4096], 4096, CodingErrorAction.REPORT, true, false);
        char[] shortInput = new char[32]; Arrays.fill(shortInput, '\u4e2d');
        compare(shortInput, 96, CodingErrorAction.REPORT, true, false);
        char[] tight = new char[MAX]; Arrays.fill(tight, '\u4e2d');
        compare(tight, 383, CodingErrorAction.REPORT, true, false);
        long[] after = StringCodingAccess.counters0();
        check(after[3] == before[3] && after[4] == before[4], "small/tight/ASCII route");
    }

    private static void compareCapacities(char[] input) {
        for (int capacity : new int[] {0, 1, 2, 3, 4, Math.max(0, input.length * 3 - 1), input.length * 3}) {
            for (CodingErrorAction action : new CodingErrorAction[] {
                    CodingErrorAction.REPORT, CodingErrorAction.REPLACE, CodingErrorAction.IGNORE}) {
                compare(input, capacity, action, false, false);
                compare(input, capacity, action, true, action == CodingErrorAction.REPLACE);
            }
        }
    }

    private static void compare(char[] input, int capacity, CodingErrorAction action,
                                boolean end, boolean custom) {
        char[] padded = new char[input.length + 7];
        System.arraycopy(input, 0, padded, 3, input.length);
        CharBuffer actualSrc = CharBuffer.wrap(padded, 3, input.length).slice();
        // A read-only source deliberately selects unchanged encodeBufferLoop.
        CharBuffer oracleSrc = CharBuffer.wrap(padded, 3, input.length).slice().asReadOnlyBuffer();
        byte[] actual = new byte[capacity + 11], expected = new byte[capacity + 11];
        Arrays.fill(actual, SENTINEL); Arrays.fill(expected, SENTINEL);
        ByteBuffer actualDst = ByteBuffer.wrap(actual, 5, capacity).slice();
        ByteBuffer oracleDst = ByteBuffer.wrap(expected, 5, capacity).slice();
        CharsetEncoder a = configured(action, custom), b = configured(action, custom);
        CoderResult ar = a.encode(actualSrc, actualDst, end);
        CoderResult br = b.encode(oracleSrc, oracleDst, end);
        check(ar.toString().equals(br.toString()), "coder result");
        check(actualSrc.position() == oracleSrc.position(), "input position");
        check(actualDst.position() == oracleDst.position(), "output position");
        check(Arrays.equals(actual, expected), "output prefix/sentinels");
        check(Arrays.equals(input, Arrays.copyOfRange(padded, 3, 3 + input.length)), "input changed");
    }

    private static CharsetEncoder configured(CodingErrorAction action, boolean custom) {
        CharsetEncoder result = StandardCharsets.UTF_8.newEncoder().onMalformedInput(action);
        if (custom) result.replaceWith(new byte[] {(byte)0xef, (byte)0xbf, (byte)0xbd});
        return result;
    }

    private static void streaming() {
        char[] input = new char[MAX + 1]; Arrays.fill(input, '\u4e2d');
        input[MAX - 1] = '\ud800'; input[MAX] = '\udc00';
        CharBuffer src = CharBuffer.wrap(input); src.limit(MAX);
        ByteBuffer dst = ByteBuffer.allocate(input.length * 3);
        CharsetEncoder encoder = StandardCharsets.UTF_8.newEncoder();
        check(encoder.encode(src, dst, false).isUnderflow(), "split high underflow");
        check(src.position() == MAX - 1 && dst.position() == (MAX - 1) * 3, "split positions");
        src.limit(input.length);
        check(encoder.encode(src, dst, true).isUnderflow(), "resumed pair");
        check(src.position() == input.length && dst.position() == (MAX - 1) * 3 + 4, "resumed positions");
        check(encoder.flush(dst).isUnderflow(), "stream flush");
        byte[] expectedPair = {(byte)0xf0, (byte)0x90, (byte)0x80, (byte)0x80};
        for (int i = 0; i < 4; ++i) check(dst.get((MAX - 1) * 3 + i) == expectedPair[i], "pair bytes");
    }

    private static void privateSemantics() throws Throwable {
        for (int n : new int[] {0, 1, 15, 16, 17, 127, 128, MAX - 1, MAX}) {
            char[] input = new char[n + 5]; Arrays.fill(input, '\u4e2d');
            for (int malformed : new int[] {-1, 0, 4, 15, 16, n - 1}) {
                if (malformed >= n) continue;
                for (int trailing = 0; trailing < 2; ++trailing) {
                    Arrays.fill(input, '\u4e2d');
                    if (malformed >= 0) input[2 + malformed] = trailing == 1 ? '\ud800' : '\udc00';
                    byte[] out = new byte[3 * n + 11]; Arrays.fill(out, SENTINEL);
                    int progress = nativeEncode(input, 2, n, out, 5, n * 3);
                    int consumed = malformed < 0 ? n : malformed;
                    int status = malformed < 0 ? 0 : trailing == 1 && malformed == n - 1 ? 2 : 1;
                    check(progress == ((status << 25) | (consumed << 13) | (consumed * 3)), "packed progress");
                    for (int i = 0; i < out.length; ++i) {
                        byte expected = i < 5 || i >= 5 + consumed * 3 ? SENTINEL :
                                (byte) new int[] {0xe4, 0xb8, 0xad}[(i - 5) % 3];
                        check(out[i] == expected, "native prefix/sentinel");
                    }
                }
            }
        }
        char[] in = new char[MAX + 1]; byte[] out = new byte[(MAX + 1) * 3];
        Arrays.fill(out, SENTINEL);
        bad(null, 0, 0, out, 0, 0, -2);
        bad(in, 0, 0, null, 0, 0, -2);
        for (int invalid : new int[] {-1, Integer.MIN_VALUE, Integer.MAX_VALUE}) {
            bad(in, invalid, 1, out, 0, 3, -2);
            bad(in, 0, invalid, out, 0, 3, -2);
            bad(in, 0, 1, out, invalid, 3, -2);
            bad(in, 0, 1, out, 0, invalid, -2);
        }
        bad(in, 0, MAX + 1, out, 0, out.length, -1);
        bad(in, 0, MAX, out, 0, MAX * 3 - 1, -2);
        bad(in, in.length, 1, out, 0, 3, -2);
        bad(in, 0, 1, out, out.length, 3, -2);
        check(nativeEncode(in, in.length, 0, out, out.length, 0) == 0, "empty end ranges");
    }

    private static void bad(char[] in, int off, int len, byte[] out, int pos, int cap, int expected)
            throws Throwable {
        char[] originalIn = in == null ? null : in.clone();
        byte[] originalOut = out == null ? null : out.clone();
        check(nativeEncode(in, off, len, out, pos, cap) == expected, "rejection status");
        check(Arrays.equals(in, originalIn) && Arrays.equals(out, originalOut), "rejection stores");
    }

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
