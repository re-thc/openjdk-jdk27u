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

    static void decode(ByteBuffer src, CharBuffer dst, boolean big, boolean utf32) {
        // Speculative reads must not move a mapped-memory fault ahead of a
        // scalar malformed-input or output-capacity result.
        int width = utf32 ? 4 : 2;
        int length = (int)Math.min(Math.min(src.remaining(), BYTE_CHUNK),
                (long)dst.remaining() * width) & -width;
        if (!(utf32 ? SimdUTF.isEligibleUTF32Decoding(length) : SimdUTF.isEligible(length))) return;
        if (dst.isReadOnly() || mapped(src) || mapped(dst) || overlaps(src, 1, dst, 2)) return;
        byte[] bytes = new byte[length];
        char[] chars = new char[length / 2];
        while (true) {
            length = (int)Math.min(Math.min(src.remaining(), bytes.length),
                    (long)dst.remaining() * width) & -width;
            if (!(utf32 ? SimdUTF.isEligibleUTF32Decoding(length) : SimdUTF.isEligible(length))) return;
            // Absolute bulk reads leave the decoder's input position unchanged.
            src.get(src.position(), bytes, 0, length);
            if (!utf32 && length < src.remaining()) {
                int last = big ? (bytes[length - 2] & 255) << 8 | bytes[length - 1] & 255
                        : (bytes[length - 1] & 255) << 8 | bytes[length - 2] & 255;
                if (Character.isHighSurrogate((char)last)) length -= 2;
                if (!SimdUTF.isEligible(length)) return;
            }
            int capacity = Math.min(chars.length, dst.remaining());
            int written = utf32
                    ? SimdUTF.decodeUTF32Bytes(bytes, 0, length, chars, 0, capacity, big)
                    : SimdUTF.decodeUTF16Bytes(bytes, 0, length, chars, 0, capacity, big);
            if (written < 0) return;
            try {
                dst.put(chars, 0, written);
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
        char[] chars = new char[length];
        byte[] bytes = new byte[length * width];
        while (true) {
            // UTF-32 may need fewer bytes for surrogate pairs. A tight buffer
            // can use the scalar path without exposing speculative output.
            length = Math.min(Math.min(src.remaining(), chars.length), dst.remaining() / width);
            if (!SimdUTF.isEligible(length)) return;
            src.get(src.position(), chars, 0, length);
            if (length < src.remaining() && Character.isHighSurrogate(chars[length - 1])) {
                length--;
                if (!SimdUTF.isEligible(length)) return;
            }
            int written = utf32
                    ? SimdUTF.encodeUTF32Bytes(chars, 0, length, bytes, 0, bytes.length, big)
                    : SimdUTF.encodeUTF16Bytes(chars, 0, length, bytes, 0, bytes.length, big);
            if (written < 0) return;
            try {
                dst.put(bytes, 0, written);
            } catch (IllegalStateException | WrongThreadException ex) {
                return;
            }
            src.position(src.position() + length);
        }
    }
}
