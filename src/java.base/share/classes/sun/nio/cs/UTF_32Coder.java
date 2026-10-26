/*
 * Copyright (c) 2005, 2026, Oracle and/or its affiliates. All rights reserved.
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
 */

package sun.nio.cs;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CoderResult;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import jdk.internal.vm.annotation.IntrinsicCandidate;

class UTF_32Coder {
    // The bulk conversions read and write UTF-32 in the byte order of the host.
    // Only little-endian coders qualify; the library has no big-endian UTF-32,
    // so a big-endian coder keeps the loops below. Ranges shorter than BULK_MIN
    // stay in the loops, and the intrinsics convert at most BULK_MAX units per call.
    private static final boolean NATIVE_LITTLE = ByteOrder.nativeOrder() == ByteOrder.LITTLE_ENDIAN;
    private static final int BULK_MIN = 32;
    private static final int BULK_MAX = 1 << 20;

    protected static final int BOM_BIG = 0xFEFF;
    protected static final int BOM_LITTLE = 0xFFFE0000;
    protected static final int NONE = 0;
    protected static final int BIG = 1;
    protected static final int LITTLE = 2;

    protected static class Decoder extends CharsetDecoder {
        private int currentBO;
        private int expectedBO;

        protected Decoder(Charset cs, int bo) {
            super(cs, 0.25f, 1.0f);
            this.expectedBO = bo;
            this.currentBO = NONE;
        }

        // Converts the longest prefix of valid code points that fits, reading and
        // writing the given storage as (object, address) pairs, and returns the
        // consumed code points in the high word and the produced chars in the low
        // word. Surrogate code points and code points above U+10FFFF end the prefix,
        // so the loop below keeps deciding what they mean. The Java body declines
        // by consuming nothing.
        @IntrinsicCandidate
        private static long decodeBulk(Object src, long srcAddress, int srcLength,
                                       Object dst, long dstAddress, int dstCapacity) {
            return 0L;
        }

        // Advances both buffers over a converted prefix of little-endian code points.
        private static void decodeBuffers(ByteBuffer src, CharBuffer dst) {
            int n = src.remaining() >> 2;
            int room = dst.remaining();
            if (!NATIVE_LITTLE || n < BULK_MIN || room < BULK_MIN
                    || !BufferStorage.accessible(src, false) || !BufferStorage.accessible(dst, true)) {
                return;
            }
            Object srcBase = BufferStorage.base(src);
            Object dstBase = BufferStorage.base(dst);
            long srcAddress = BufferStorage.address(src, 0);
            long dstAddress = BufferStorage.address(dst, 1);
            if (BufferStorage.overlaps(srcBase, srcAddress, (long) n << 2, dstBase, dstAddress, (long) room << 1)) {
                return;
            }
            BufferStorage.acquire(src, dst);
            try {
                int sp = 0;
                int dp = 0;
                while (n - sp >= BULK_MIN && room - dp >= BULK_MIN) {
                    long r = decodeBulk(srcBase, srcAddress + ((long) sp << 2), Math.min(n - sp, BULK_MAX),
                                        dstBase, dstAddress + ((long) dp << 1), room - dp);
                    int consumed = (int) (r >>> 32);
                    if (consumed == 0) {
                        break;
                    }
                    sp += consumed;
                    dp += (int) r;
                }
                src.position(src.position() + (sp << 2));
                dst.position(dst.position() + dp);
            } finally {
                BufferStorage.release(src, dst);
            }
        }

        private int getCP(ByteBuffer src) {
            return (currentBO==BIG)
              ?(((src.get() & 0xff) << 24) |
                ((src.get() & 0xff) << 16) |
                ((src.get() & 0xff) <<  8) |
                (src.get() & 0xff))
              :((src.get() & 0xff) |
                ((src.get() & 0xff) <<  8) |
                ((src.get() & 0xff) << 16) |
                ((src.get() & 0xff) << 24));
        }

        protected CoderResult decodeLoop(ByteBuffer src, CharBuffer dst) {
            if (src.remaining() < 4)
                return CoderResult.UNDERFLOW;
            int mark = src.position();
            int cp;
            try {
                if (currentBO == NONE) {
                    cp = ((src.get() & 0xff) << 24) |
                         ((src.get() & 0xff) << 16) |
                         ((src.get() & 0xff) <<  8) |
                         (src.get() & 0xff);
                    if (cp == BOM_BIG && expectedBO != LITTLE) {
                        currentBO = BIG;
                        mark += 4;
                    } else if (cp == BOM_LITTLE && expectedBO != BIG) {
                        currentBO = LITTLE;
                        mark += 4;
                    } else {
                        if (expectedBO == NONE)
                            currentBO = BIG;
                        else
                            currentBO = expectedBO;
                        src.position(mark);
                    }
                }
                if (currentBO == LITTLE) {
                    decodeBuffers(src, dst);
                    mark = src.position();
                }
                while (src.remaining() >= 4) {
                    cp = getCP(src);
                    if (Character.isBmpCodePoint(cp)) {
                        if (!dst.hasRemaining())
                            return CoderResult.OVERFLOW;
                        mark += 4;
                        dst.put((char) cp);
                    } else if (Character.isValidCodePoint(cp)) {
                        if (dst.remaining() < 2)
                            return CoderResult.OVERFLOW;
                        mark += 4;
                        dst.put(Character.highSurrogate(cp));
                        dst.put(Character.lowSurrogate(cp));
                    } else {
                        return CoderResult.malformedForLength(4);
                    }
                }
                return CoderResult.UNDERFLOW;
            } finally {
                src.position(mark);
            }
        }
        protected void implReset() {
            currentBO = NONE;
        }
    }

    protected static class Encoder extends CharsetEncoder {
        private boolean doBOM = false;
        private boolean doneBOM = true;
        private int byteOrder;

        protected void put(int cp, ByteBuffer dst) {
            if (byteOrder==BIG) {
                dst.put((byte)(cp >> 24));
                dst.put((byte)(cp >> 16));
                dst.put((byte)(cp >> 8));
                dst.put((byte)cp);
            } else {
                dst.put((byte)cp);
                dst.put((byte)(cp >>  8));
                dst.put((byte)(cp >> 16));
                dst.put((byte)(cp >> 24));
            }
        }

        // Converts the longest prefix of chars that fits, reading and writing the
        // given storage as (object, address) pairs, and returns the consumed chars in
        // the high word and the produced code points in the low word. An unpaired
        // surrogate ends the prefix, so the loop below keeps deciding what it means.
        // The Java body declines by consuming nothing.
        @IntrinsicCandidate
        private static long encodeBulk(Object src, long srcAddress, int srcLength,
                                       Object dst, long dstAddress, int dstCapacity) {
            return 0L;
        }

        // Advances both buffers over a converted prefix, written as little-endian code points.
        private static void encodeBuffers(CharBuffer src, ByteBuffer dst) {
            int n = src.remaining();
            int room = dst.remaining() >> 2;
            if (!NATIVE_LITTLE || n < BULK_MIN || room < BULK_MIN
                    || !BufferStorage.accessible(src, false) || !BufferStorage.accessible(dst, true)) {
                return;
            }
            Object srcBase = BufferStorage.base(src);
            Object dstBase = BufferStorage.base(dst);
            long srcAddress = BufferStorage.address(src, 1);
            long dstAddress = BufferStorage.address(dst, 0);
            if (BufferStorage.overlaps(srcBase, srcAddress, (long) n << 1, dstBase, dstAddress, (long) room << 2)) {
                return;
            }
            BufferStorage.acquire(src, dst);
            try {
                int sp = 0;
                int dp = 0;
                while (n - sp >= BULK_MIN && room - dp >= BULK_MIN) {
                    long r = encodeBulk(srcBase, srcAddress + ((long) sp << 1), Math.min(n - sp, BULK_MAX),
                                        dstBase, dstAddress + ((long) dp << 2), room - dp);
                    int consumed = (int) (r >>> 32);
                    if (consumed == 0) {
                        break;
                    }
                    sp += consumed;
                    dp += (int) r;
                }
                src.position(src.position() + sp);
                dst.position(dst.position() + (dp << 2));
            } finally {
                BufferStorage.release(src, dst);
            }
        }

        protected Encoder(Charset cs, int byteOrder, boolean doBOM) {
            super(cs, 4.0f,
                  doBOM?8.0f:4.0f,
                  (byteOrder==BIG)?new byte[]{(byte)0, (byte)0, (byte)0xff, (byte)0xfd}
                                  :new byte[]{(byte)0xfd, (byte)0xff, (byte)0, (byte)0});
            this.byteOrder = byteOrder;
            this.doBOM = doBOM;
            this.doneBOM = !doBOM;
        }

        protected CoderResult encodeLoop(CharBuffer src, ByteBuffer dst) {
            int mark = src.position();
            if (!doneBOM && src.hasRemaining()) {
                if (dst.remaining() < 4)
                    return CoderResult.OVERFLOW;
                put(BOM_BIG, dst);
                doneBOM = true;
            }
            try {
                if (byteOrder == LITTLE) {
                    encodeBuffers(src, dst);
                    mark = src.position();
                }
                while (src.hasRemaining()) {
                    char c = src.get();
                    if (!Character.isSurrogate(c)) {
                        if (dst.remaining() < 4)
                            return CoderResult.OVERFLOW;
                        mark++;
                        put(c, dst);
                    } else if (Character.isHighSurrogate(c)) {
                        if (!src.hasRemaining())
                            return CoderResult.UNDERFLOW;
                        char low = src.get();
                        if (Character.isLowSurrogate(low)) {
                            if (dst.remaining() < 4)
                                return CoderResult.OVERFLOW;
                            mark += 2;
                            put(Character.toCodePoint(c, low), dst);
                        } else {
                            return CoderResult.malformedForLength(1);
                        }
                    } else {
                        // assert Character.isLowSurrogate(c);
                        return CoderResult.malformedForLength(1);
                    }
                }
                return CoderResult.UNDERFLOW;
            } finally {
                src.position(mark);
            }
        }

        protected void implReset() {
            doneBOM = !doBOM;
        }

        public boolean canEncode(char c) {
            return !Character.isSurrogate(c);
        }

        public boolean canEncode(CharSequence cs) {
            return Unicode.isValidUnicode(cs);
        }
    }
}
