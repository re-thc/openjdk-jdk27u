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
package jdk.test.lib.util;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.util.Objects;

/** Test-only access to the existing StringCoding holder. */
public final class StringCodingAccess {
    public static final int MAX_INPUT_BYTES = 4096;
    private static final Class<?> TYPE;
    private static final MethodHandle READY, LATIN1, UTF16, UTF8, COUNTERS;
    static {
        try {
            TYPE = Class.forName("java.lang.StringCoding");
            MethodHandles.Lookup lookup = MethodHandles.privateLookupIn(TYPE, MethodHandles.lookup());
            MethodType conversion = MethodType.methodType(int.class,
                    byte[].class, int.class, int.class, byte[].class, int.class, int.class);
            READY = lookup.findStatic(TYPE, "utf8Ready", MethodType.methodType(boolean.class));
            LATIN1 = lookup.findStatic(TYPE, "encodeLatin1Utf80", conversion);
            UTF16 = lookup.findStatic(TYPE, "encodeUtf16Utf80", conversion);
            UTF8 = lookup.findStatic(TYPE, "decodeUtf8Utf160", conversion);
            COUNTERS = lookup.findStatic(TYPE, "counters0", MethodType.methodType(long[].class));
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }
    private StringCodingAccess() { }
    private static RuntimeException unchecked(Throwable t) {
        if (t instanceof Error e) throw e;
        return t instanceof RuntimeException r ? r : new RuntimeException(t);
    }
    public static boolean ready() {
        try { return (boolean) READY.invokeExact(); }
        catch (Throwable t) { throw unchecked(t); }
    }
    public static Class<?> type() {
        if (!ready()) throw new IllegalStateException("StringCoding is not ready");
        return TYPE;
    }
    public static long[] counters0() {
        if (!ready()) throw new IllegalStateException("StringCoding is not ready");
        try { return (long[]) COUNTERS.invokeExact(); }
        catch (Throwable t) { throw unchecked(t); }
    }
    public static int encodeLatin1(byte[] input, int offset, int length,
                                  byte[] output, int outputOffset, int capacity) {
        Objects.checkFromIndexSize(offset, length, input.length);
        Objects.checkFromIndexSize(outputOffset, capacity, output.length);
        if (input == output || length > capacity / 2) throw new IllegalArgumentException("Latin1 output");
        if (!ready()) {
            int n = 0;
            for (int i = offset; i < offset + length; i++) {
                int c = input[i] & 255;
                if (c >= 128) {
                    output[outputOffset + n++] = (byte) (0xc0 | c >>> 6);
                    c = 0x80 | c & 63;
                }
                output[outputOffset + n++] = (byte) c;
            }
            return n;
        }
        int consumed = 0, written = 0;
        while (consumed < length) {
            int count = Math.min(length - consumed, MAX_INPUT_BYTES);
            int n = encodeLatin1Utf80(input, offset + consumed, count, output, outputOffset + written, count * 2);
            if (n < count || n > count * 2) throw new InternalError("Latin1 UTF8 conversion failed: " + n);
            consumed += count;
            written += n;
        }
        return written;
    }
    public static int encodeLatin1Utf80(byte[] in, int off, int len, byte[] out, int pos, int cap) {
        try { return (int) LATIN1.invokeExact(in, off, len, out, pos, cap); }
        catch (Throwable t) { throw unchecked(t); }
    }
    public static int encodeUtf16Utf80(byte[] in, int off, int len, byte[] out, int pos, int cap) {
        try { return (int) UTF16.invokeExact(in, off, len, out, pos, cap); }
        catch (Throwable t) { throw unchecked(t); }
    }
    public static int decodeUtf8Utf160(byte[] in, int off, int len, byte[] out, int pos, int cap) {
        try { return (int) UTF8.invokeExact(in, off, len, out, pos, cap); }
        catch (Throwable t) { throw unchecked(t); }
    }
    public static int encodeUtf16(byte[] input, byte[] output) {
        int length = input.length, units = length >>> 1;
        if (length > MAX_INPUT_BYTES) return -1;
        if ((length & 1) != 0 || input == output || units > output.length / 3) {
            throw new IllegalArgumentException("UTF16 requires aligned distinct storage and capacity");
        }
        if (!ready()) return -1;
        int n = encodeUtf16Utf80(input, 0, length, output, 0, output.length);
        if (n == -1) return n;
        if (n < units || n > units * 3) throw new InternalError("UTF16 UTF8 conversion failed: " + n);
        return n;
    }
    public static int decodeUtf8(byte[] input, int offset, int length, byte[] output, int outputOffset) {
        Objects.checkFromIndexSize(offset, length, input.length);
        if (length > MAX_INPUT_BYTES) return -1;
        Objects.checkFromIndexSize(outputOffset, length * 2, output.length);
        if (input == output || (outputOffset & 1) != 0) throw new IllegalArgumentException("UTF8 output");
        if (length > MAX_INPUT_BYTES || !ready()) return -1;
        int n = decodeUtf8Utf160(input, offset, length, output, outputOffset, length * 2);
        if (n == -1) return n;
        if (n < 0 || n > length) throw new InternalError("UTF8 UTF16 conversion failed: " + n);
        return n;
    }
}
