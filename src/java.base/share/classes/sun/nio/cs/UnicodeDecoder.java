/*
 * Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.
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
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CoderResult;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.MalformedInputException;
import jdk.internal.vm.annotation.IntrinsicCandidate;


abstract class UnicodeDecoder extends CharsetDecoder {

    protected static final char BYTE_ORDER_MARK = (char) 0xfeff;
    protected static final char REVERSED_MARK = (char) 0xfffe;

    protected static final int NONE = 0;
    protected static final int BIG = 1;
    protected static final int LITTLE = 2;

    private final int expectedByteOrder;
    private int currentByteOrder;
    private int defaultByteOrder = BIG;

    public UnicodeDecoder(Charset cs, int bo) {
        super(cs, 0.5f, 1.0f);
        expectedByteOrder = currentByteOrder = bo;
    }

    public UnicodeDecoder(Charset cs, int bo, int defaultBO) {
        this(cs, bo);
        defaultByteOrder = defaultBO;
    }

    // Converts the longest prefix of well-formed UTF-16 that fits, reading and writing the
    // given storage as (object, address) pairs, with the units counted in 16-bit units, and
    // returns the consumed units in the high word and the produced chars in the low word.
    // A lone surrogate, and a pair that the end of the range cuts, end the prefix, so that
    // the loop in decodeLoop keeps deciding what they mean. The Java bodies decline by
    // consuming nothing.
    @IntrinsicCandidate
    private static long decodeBulkLE(Object src, long srcAddress, int srcLength,
                                     Object dst, long dstAddress, int dstCapacity) {
        return 0L;
    }

    @IntrinsicCandidate
    private static long decodeBulkBE(Object src, long srcAddress, int srcLength,
                                     Object dst, long dstAddress, int dstCapacity) {
        return 0L;
    }

    // Converts prefixes of the n units at srcAddress until one makes no progress, and
    // returns the consumed units in the high word and the produced chars in the low word.
    private static long decodeRun(boolean big, Object src, long srcAddress, int n,
                                  Object dst, long dstAddress, int room) {
        int sp = 0;
        int dp = 0;
        while (n - sp >= BufferStorage.BULK_MIN && room - dp >= BufferStorage.BULK_MIN) {
            int chunk = Math.min(n - sp, BufferStorage.BULK_MAX);
            long srcPart = srcAddress + ((long) sp << 1);
            long dstPart = dstAddress + ((long) dp << 1);
            long r = big ? decodeBulkBE(src, srcPart, chunk, dst, dstPart, room - dp)
                         : decodeBulkLE(src, srcPart, chunk, dst, dstPart, room - dp);
            int consumed = (int) (r >>> 32);
            sp += consumed;
            dp += (int) r;
            if (chunk - consumed >= BufferStorage.BULK_TAIL) {
                break;
            }
        }
        return ((long) sp << 32) | dp;
    }

    // The unit at an absolute position of the buffer, in the byte order in use
    private char unit(ByteBuffer src, int position) {
        return decode(src.get(position) & 0xff, src.get(position + 1) & 0xff);
    }

    // Advances both buffers over a converted prefix, once the byte order is known and unless
    // the first unit is a surrogate that does not begin a pair, which the loop reports.
    private void decodeBuffers(ByteBuffer src, CharBuffer dst) {
        int n = src.remaining() >> 1;
        int room = dst.remaining();
        if (n < BufferStorage.BULK_MIN || room < BufferStorage.BULK_MIN) {
            return;
        }
        int p = src.position();
        char first = unit(src, p);
        if (Character.isSurrogate(first)
                && !(Character.isHighSurrogate(first) && Character.isLowSurrogate(unit(src, p + 2)))) {
            return;
        }
        if (!BufferStorage.accessible(src, false) || !BufferStorage.accessible(dst, true)) {
            return;
        }
        Object srcBase = BufferStorage.base(src);
        Object dstBase = BufferStorage.base(dst);
        long srcAddress = BufferStorage.address(src, 0);
        long dstAddress = BufferStorage.address(dst, 1);
        if (BufferStorage.overlaps(srcBase, srcAddress, (long) n << 1, dstBase, dstAddress, (long) room << 1)) {
            return;
        }
        BufferStorage.acquire(src, dst);
        try {
            long r = decodeRun(currentByteOrder == BIG, srcBase, srcAddress, n, dstBase, dstAddress, room);
            src.position(p + ((int) (r >>> 32) << 1));
            dst.position(dst.position() + (int) r);
        } finally {
            BufferStorage.release(src, dst);
        }
    }

    private char decode(int b1, int b2) {
        if (currentByteOrder == BIG)
            return (char)((b1 << 8) | b2);
        else
            return (char)((b2 << 8) | b1);
    }

    protected CoderResult decodeLoop(ByteBuffer src, CharBuffer dst) {
        int mark = src.position();

        try {
            if (currentByteOrder != NONE) {
                decodeBuffers(src, dst);
                mark = src.position();
            }
            while (src.remaining() > 1) {
                int b1 = src.get() & 0xff;
                int b2 = src.get() & 0xff;

                // Byte Order Mark interpretation
                if (currentByteOrder == NONE) {
                    char c = (char)((b1 << 8) | b2);
                    if (c == BYTE_ORDER_MARK) {
                        currentByteOrder = BIG;
                        mark += 2;
                        decodeBuffers(src, dst);
                        mark = src.position();
                        continue;
                    } else if (c == REVERSED_MARK) {
                        currentByteOrder = LITTLE;
                        mark += 2;
                        decodeBuffers(src, dst);
                        mark = src.position();
                        continue;
                    } else {
                        // No mark: read b1, b2 again with the default byte order
                        currentByteOrder = defaultByteOrder;
                        src.position(mark);
                        decodeBuffers(src, dst);
                        mark = src.position();
                        continue;
                    }
                }

                char c = decode(b1, b2);

                // Surrogates
                if (Character.isSurrogate(c)) {
                    if (Character.isHighSurrogate(c)) {
                        if (src.remaining() < 2)
                            return CoderResult.UNDERFLOW;
                        char c2 = decode(src.get() & 0xff, src.get() & 0xff);
                        if (!Character.isLowSurrogate(c2))
                            return CoderResult.malformedForLength(4);
                        if (dst.remaining() < 2)
                            return CoderResult.OVERFLOW;
                        mark += 4;
                        dst.put(c);
                        dst.put(c2);
                        continue;
                    }
                    // Unpaired low surrogate
                    return CoderResult.malformedForLength(2);
                }

                if (!dst.hasRemaining())
                    return CoderResult.OVERFLOW;
                mark += 2;
                dst.put(c);

            }
            return CoderResult.UNDERFLOW;

        } finally {
            src.position(mark);
        }
    }

    protected void implReset() {
        currentByteOrder = expectedByteOrder;
    }

}
