/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 *
 */

package sun.nio.cs;

import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import jdk.internal.access.JavaNioAccess;
import jdk.internal.access.SharedSecrets;
import jdk.internal.util.SimdUTF;
import sun.nio.ch.DirectBuffer;

/** Bounded speculative conversions for buffers without accessible arrays. */
final class SimdUTFBufferSupport {
    private static final int BYTE_CHUNK = 8192;

    private SimdUTFBufferSupport() { }

    private static boolean mapped(Buffer buffer) {
        JavaNioAccess access = SharedSecrets.getJavaNioAccess();
        while (true) {
            var segment = access.bufferSegment(buffer);
            if (segment != null && segment.isMapped() || access.unmapper(buffer) != null) return true;
            if (buffer instanceof DirectBuffer direct && direct.attachment() instanceof Buffer parent) {
                buffer = parent;
            } else {
                return false;
            }
        }
    }

    private static boolean overlaps(Buffer src, int srcScale, Buffer dst, int dstScale) {
        JavaNioAccess access = SharedSecrets.getJavaNioAccess();
        if (access.getBufferBase(src) != access.getBufferBase(dst)) return false;
        long input = access.getBufferAddress(src) + (long)src.position() * srcScale;
        long output = access.getBufferAddress(dst) + (long)dst.position() * dstScale;
        return Long.compareUnsigned(input - output, (long)dst.remaining() * dstScale) < 0
                || Long.compareUnsigned(output - input, (long)src.remaining() * srcScale) < 0;
    }

    private static int getUnit(ByteBuffer src, int position, boolean big, int width) {
        int value = 0;
        for (int i = 0; i < width; i++) {
            value = (value << 8) | (src.get(position + (big ? i : width - 1 - i)) & 255);
        }
        return value;
    }

    private static boolean validStart(ByteBuffer src, boolean big, boolean utf32, int length,
                                      int capacity) {
        int first = getUnit(src, src.position(), big, utf32 ? 4 : 2);
        if (utf32) {
            return Character.isValidCodePoint(first)
                    && (first < Character.MIN_SURROGATE || first > Character.MAX_SURROGATE)
                    && (first < Character.MIN_SUPPLEMENTARY_CODE_POINT || capacity >= 2);
        }
        return !Character.isSurrogate((char)first)
                || Character.isHighSurrogate((char)first) && length >= 4 && capacity >= 2
                   && Character.isLowSurrogate((char)getUnit(src, src.position() + 2, big, 2));
    }

    static void decode(ByteBuffer src, CharBuffer dst, boolean big, boolean utf32) {
        // Speculative reads must not move a mapped-memory fault ahead of a
        // scalar malformed-input or output-capacity result.
        int width = utf32 ? 4 : 2;
        int length = (int)Math.min(Math.min(src.remaining(), BYTE_CHUNK),
                (long)dst.remaining() * width) & -width;
        if (!(utf32 ? SimdUTF.isEligibleUTF32Decoding(length) : SimdUTF.isEligible(length))) return;
        if (dst.isReadOnly() || mapped(src) || mapped(dst) || overlaps(src, 1, dst, 2)) return;
        // Replacement decoding retries after each malformed unit. Decline before
        // allocating staging buffers when the scalar loop must handle the prefix.
        if (!validStart(src, big, utf32, length, dst.remaining())) return;
        int chunkLength = length;
        boolean inputArray = src.hasArray() && ((src.arrayOffset() + src.position()) & (width - 1)) == 0;
        byte[] bytes = inputArray ? src.array() : new byte[chunkLength];
        // A private input snapshot cannot change after native validation. Keep
        // speculative output private when reading a caller-owned input array.
        boolean outputArray = !inputArray && dst.hasArray();
        char[] chars = outputArray ? dst.array() : new char[chunkLength / 2];
        while (true) {
            length = (int)Math.min(Math.min(src.remaining(), chunkLength),
                    (long)dst.remaining() * width) & -width;
            if (!(utf32 ? SimdUTF.isEligibleUTF32Decoding(length) : SimdUTF.isEligible(length))) return;
            // Absolute bulk reads leave the decoder's input position unchanged.
            int sp = inputArray ? src.arrayOffset() + src.position() : 0;
            if (!inputArray) src.get(src.position(), bytes, 0, length);
            if (!utf32 && length < src.remaining()) {
                int last = big ? (bytes[sp + length - 2] & 255) << 8 | bytes[sp + length - 1] & 255
                        : (bytes[sp + length - 1] & 255) << 8 | bytes[sp + length - 2] & 255;
                if (Character.isHighSurrogate((char)last)) length -= 2;
                if (!SimdUTF.isEligible(length)) return;
            }
            int capacity = Math.min(length / 2, dst.remaining());
            int dp = outputArray ? dst.arrayOffset() + dst.position() : 0;
            int written = utf32
                    ? SimdUTF.decodeUTF32Bytes(bytes, sp, length, chars, dp, capacity, big)
                    : SimdUTF.decodeUTF16Bytes(bytes, sp, length, chars, dp, capacity, big);
            if (written < 0) return;
            try {
                if (outputArray) dst.position(dst.position() + written);
                else dst.put(chars, 0, written);
            } catch (IllegalStateException | WrongThreadException ex) {
                // Retry through the scalar loop, which determines the position
                // and exception order for an inaccessible destination.
                return;
            }
            src.position(src.position() + length);
        }
    }

    static void encode(CharBuffer src, ByteBuffer dst, boolean big, boolean utf32) {
        // Speculative reads must not move a mapped-memory fault ahead of a
        // scalar malformed-input or output-capacity result.
        if (dst.isReadOnly() || mapped(src) || mapped(dst) || overlaps(src, 2, dst, 1)) return;
        int width = utf32 ? 4 : 2;
        int length = Math.min(Math.min(src.remaining(), BYTE_CHUNK / width), dst.remaining() / width);
        if (!SimdUTF.isEligible(length)) return;
        char first = src.get(src.position());
        if (Character.isSurrogate(first) && (!Character.isHighSurrogate(first)
                || length < 2 || !Character.isLowSurrogate(src.get(src.position() + 1)))) return;
        int chunkLength = length;
        boolean inputArray = src.hasArray();
        // Direct output requires stable input and the native word alignment.
        boolean outputArray = !inputArray && dst.hasArray()
                && ((dst.arrayOffset() + dst.position()) & (width - 1)) == 0;
        if (!inputArray && !outputArray) {
            encodeStaged(src, dst, big, utf32, chunkLength);
            return;
        }
        encodeAccessible(src, dst, big, utf32, chunkLength, inputArray);
    }

    private static void encodeAccessible(CharBuffer src, ByteBuffer dst, boolean big,
                                         boolean utf32, int chunkLength, boolean inputArray) {
        int width = utf32 ? 4 : 2;
        boolean outputArray = !inputArray;
        char[] chars = inputArray ? src.array() : new char[chunkLength];
        byte[] bytes = outputArray ? dst.array() : new byte[chunkLength * width];
        while (true) {
            // UTF-32 may need fewer bytes for surrogate pairs. A tight buffer
            // can use the scalar path without exposing speculative output.
            int length = Math.min(Math.min(src.remaining(), chunkLength), dst.remaining() / width);
            if (!SimdUTF.isEligible(length)) return;
            int sp = inputArray ? src.arrayOffset() + src.position() : 0;
            if (!inputArray) src.get(src.position(), chars, 0, length);
            if (length < src.remaining() && Character.isHighSurrogate(chars[sp + length - 1])) {
                length--;
                if (!SimdUTF.isEligible(length)) return;
            }
            int dp = outputArray ? dst.arrayOffset() + dst.position() : 0;
            int capacity = outputArray ? dst.remaining() : bytes.length;
            int written = encodeChunk(chars, sp, length, bytes, dp, capacity, big, utf32);
            if (written < 0) {
                if (!inputArray) encodeMalformedPrefix(src, dst, chars, length, bytes,
                        dp, capacity, big, utf32, outputArray);
                return;
            }
            try {
                if (outputArray) dst.position(dst.position() + written);
                else dst.put(bytes, 0, written);
            } catch (IllegalStateException | WrongThreadException ex) {
                return;
            }
            src.position(src.position() + length);
        }
    }

    // Keep the fully staged path free of per-chunk storage-strategy branches.
    private static void encodeStaged(CharBuffer src, ByteBuffer dst, boolean big,
                                     boolean utf32, int chunkLength) {
        int width = utf32 ? 4 : 2;
        char[] chars = new char[chunkLength];
        byte[] bytes = new byte[chunkLength * width];
        while (true) {
            int length = Math.min(Math.min(src.remaining(), chunkLength), dst.remaining() / width);
            if (!SimdUTF.isEligible(length)) return;
            src.get(src.position(), chars, 0, length);
            if (length < src.remaining() && Character.isHighSurrogate(chars[length - 1])) {
                length--;
                if (!SimdUTF.isEligible(length)) return;
            }
            int written = utf32
                    ? SimdUTF.encodeUTF32Bytes(chars, 0, length, bytes, 0, bytes.length, big)
                    : SimdUTF.encodeUTF16Bytes(chars, 0, length, bytes, 0, bytes.length, big);
            if (written < 0) {
                encodeMalformedPrefix(src, dst, chars, length, bytes, 0, bytes.length,
                        big, utf32, false);
                return;
            }
            try {
                dst.put(bytes, 0, written);
            } catch (IllegalStateException | WrongThreadException ex) {
                return;
            }
            src.position(src.position() + length);
        }
    }

    private static int encodeChunk(char[] chars, int sp, int length, byte[] bytes, int dp,
                                   int capacity, boolean big, boolean utf32) {
        return utf32 ? SimdUTF.encodeUTF32Bytes(chars, sp, length, bytes, dp, capacity, big)
                : SimdUTF.encodeUTF16Bytes(chars, sp, length, bytes, dp, capacity, big);
    }

    private static void encodeMalformedPrefix(CharBuffer src, ByteBuffer dst, char[] chars,
                                              int length, byte[] bytes, int dp, int capacity,
                                              boolean big, boolean utf32, boolean outputArray) {
        int prefix = malformedPrefix(chars, length);
        if (!SimdUTF.isEligible(prefix)) return;
        int written = encodeChunk(chars, 0, prefix, bytes, dp, capacity, big, utf32);
        if (written < 0) return;
        try {
            if (outputArray) dst.position(dst.position() + written);
            else dst.put(bytes, 0, written);
        } catch (IllegalStateException | WrongThreadException ex) {
            return;
        }
        src.position(src.position() + prefix);
    }

    // Called only after native decline, on private input. A wholly valid chunk
    // returns zero so an unrelated admission failure is never retried.
    private static int malformedPrefix(char[] chars, int length) {
        for (int i = 0; i < length; i++) {
            char c = chars[i];
            if (Character.isSurrogate(c)) {
                if (!Character.isHighSurrogate(c) || i + 1 == length
                        || !Character.isLowSurrogate(chars[i + 1])) return i;
                i++;
            }
        }
        return 0;
    }

}
