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
package compiler.intrinsics.tmfy;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.test.lib.util.StringCodingAccess;

/** Shared fixtures for the Charset holder; no registration during class initialization. */
final class CharsetEncoderTestSupport {
    static final String HOLDER = "sun.nio.cs.UTF_8$Encoder";
    static final String NATIVE_NAME = "encodeUtf16ArrayUtf80";
    static final String NATIVE_TYPE = "([CII[BII)I";
    static final int LEAF = 3;
    static final int JNI = 4;
    static final int UNITS = 256;
    static final byte SENTINEL = 0x5a;
    static final Class<?> TYPE;
    static final Method READY;
    static final Method REGISTER;
    static final Method NATIVE;
    static final Method POLICY;
    static final Method ORIGIN;
    static {
        try {
            TYPE = Class.forName(HOLDER);
            READY = method("utf8Ready");
            REGISTER = method("registerNatives");
            NATIVE = method(NATIVE_NAME, char[].class, int.class, int.class,
                    byte[].class, int.class, int.class);
            POLICY = method("useNativeEncoder");
            ORIGIN = method("encodeArrayLoopSlow", CharBuffer.class, char[].class,
                    int.class, int.class, ByteBuffer.class, byte[].class, int.class, int.class);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private static Method method(String name, Class<?>... parameters)
            throws ReflectiveOperationException {
        Method m = TYPE.getDeclaredMethod(name, parameters);
        m.setAccessible(true);
        return m;
    }

    static Object invoke(Method method, Object... arguments) throws Throwable {
        try {
            return method.invoke(null, arguments);
        } catch (InvocationTargetException e) {
            throw e.getCause();
        }
    }

    static boolean ready() throws Throwable { return (boolean) invoke(READY); }

    static boolean initialized(Class<?> holder) throws ReflectiveOperationException {
        var state = holder.getDeclaredField("utf8Ready");
        state.setAccessible(true);
        return state.getBoolean(null);
    }

    // Raw-call tests must register the exact Charset holder explicitly. Reading
    // String's diagnostics is not evidence that this holder has been registered.
    static void register() throws Throwable {
        check((boolean) invoke(REGISTER), "Charset registerNatives returned false");
    }

    static int raw(char[] source, byte[] output) throws Throwable {
        return (int) invoke(NATIVE, source, 0, source.length, output, 0, output.length);
    }

    static char[] input() {
        char[] result = new char[UNITS];
        Arrays.fill(result, '\u4e2d');
        return result;
    }

    static long[] counters() {
        long[] result = StringCodingAccess.counters0();
        check(result.length > JNI, "Charset diagnostic slots missing");
        return result;
    }

    static void route(long[] before, long leaves, long jni, String label) {
        long[] after = counters();
        check(after[LEAF] - before[LEAF] == leaves && after[JNI] - before[JNI] == jni,
                label + ": Charset leaf/JNI " + (after[LEAF] - before[LEAF]) + "/"
                        + (after[JNI] - before[JNI]) + ", expected " + leaves + "/" + jni);
    }

    static final class PublicCall {
        final char[] input = input();
        final byte[] output = new byte[3 * UNITS];
        final CharsetEncoder encoder = StandardCharsets.UTF_8.newEncoder();
        final CharBuffer source = CharBuffer.wrap(input);
        final ByteBuffer destination = ByteBuffer.wrap(output);

        void run() {
            encoder.reset();
            source.clear();
            destination.clear();
            Arrays.fill(output, SENTINEL);
            CoderResult result = encoder.encode(source, destination, true);
            check(result.isUnderflow() && source.position() == UNITS &&
                    destination.position() == output.length, "public result/positions");
            for (int i = 0; i < output.length; i++) {
                byte expected = (byte) switch (i % 3) { case 0 -> 0xe4; case 1 -> 0xb8; default -> 0xad; };
                if (output[i] != expected) throw new AssertionError("public byte at " + i);
            }
        }
    }

    // Read-only CharBuffers select the unchanged buffer loop as the oracle.
    static void semantics() {
        for (int kind = 0; kind < 4; kind++) {
            char[] input = input();
            if (kind == 1) input[128] = '\udc00';
            if (kind == 2) input[UNITS - 1] = '\ud800';
            if (kind == 3) { input[127] = '\ud800'; input[128] = '\udc00'; }
            for (int capacity : new int[] {383, 3 * UNITS}) {
                for (boolean end : new boolean[] {false, true}) {
                    for (CodingErrorAction action : new CodingErrorAction[] {
                            CodingErrorAction.REPORT, CodingErrorAction.REPLACE, CodingErrorAction.IGNORE}) {
                        char[] padded = new char[input.length + 7];
                        System.arraycopy(input, 0, padded, 3, input.length);
                        CharBuffer a = CharBuffer.wrap(padded, 3, input.length).slice();
                        CharBuffer b = a.asReadOnlyBuffer();
                        byte[] actual = new byte[capacity + 11];
                        byte[] expected = new byte[actual.length];
                        Arrays.fill(actual, SENTINEL);
                        Arrays.fill(expected, SENTINEL);
                        ByteBuffer da = ByteBuffer.wrap(actual, 5, capacity).slice();
                        ByteBuffer db = ByteBuffer.wrap(expected, 5, capacity).slice();
                        CoderResult ra = StandardCharsets.UTF_8.newEncoder().onMalformedInput(action).encode(a, da, end);
                        CoderResult rb = StandardCharsets.UTF_8.newEncoder().onMalformedInput(action).encode(b, db, end);
                        check(ra.toString().equals(rb.toString()) && a.position() == b.position() &&
                                da.position() == db.position() && Arrays.equals(actual, expected),
                                "public semantics kind=" + kind + " capacity=" + capacity + " action=" + action + " end=" + end);
                        check(Arrays.equals(input, Arrays.copyOfRange(padded, 3, 3 + input.length)), "source changed");
                    }
                }
            }
        }
    }

    static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
