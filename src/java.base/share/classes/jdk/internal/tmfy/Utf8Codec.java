/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation. This file is subject to
 * the "Classpath" exception as provided in the accompanying LICENSE file.
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

package jdk.internal.tmfy;

import java.util.Objects;
import jdk.internal.vm.annotation.IntrinsicCandidate;

/** Bounded native conversion used by String's compact Latin-1 UTF-8 encoder. */
public final class Utf8Codec {
    private static final int MAX_INPUT_BYTES = 4096;
    private Utf8Codec() { }
    private static final boolean INITIALIZED;
    static {
        registerNatives();
        INITIALIZED = true;
    }
    private static native void registerNatives();

    public static int encodeLatin1(byte[] input, int offset, int length,
                                   byte[] output, int outputOffset, int capacity) {
        Objects.checkFromIndexSize(offset, length, input.length);
        Objects.checkFromIndexSize(outputOffset, capacity, output.length);
        if (input == output || length > capacity / 2) {
            throw new IllegalArgumentException("Latin-1 conversion requires a distinct, sufficiently large output");
        }
        // A NativeMethodBind callback may encode a String while this class is
        // being initialized on the same thread, before its native is bound.
        if (!INITIALIZED) {
            int written = 0;
            for (int i = offset, end = offset + length; i < end; i++) {
                int value = input[i] & 0xff;
                if (value >= 0x80) {
                    output[outputOffset + written++] = (byte) (0xc0 | (value >> 6));
                    output[outputOffset + written++] = (byte) (0x80 | (value & 0x3f));
                } else {
                    output[outputOffset + written++] = (byte) value;
                }
            }
            return written;
        }
        int consumed = 0;
        int written = 0;
        while (consumed < length) {
            int count = Math.min(length - consumed, MAX_INPUT_BYTES);
            int result = encodeLatin1Utf80(input, offset + consumed, count,
                                           output, outputOffset + written, count * 2);
            if (result < count || result > count * 2) {
                throw new InternalError("Latin-1 UTF-8 conversion failed: " + result);
            }
            consumed += count;
            written += result;
        }
        return written;
    }

    @IntrinsicCandidate
    private static native int encodeLatin1Utf80(byte[] input, int offset, int length,
                                                byte[] output, int outputOffset, int capacity);

    /** Diagnostic counts: leaf calls, JNI calls, prewrite rejections. */
    public static native long[] counters0();
}
