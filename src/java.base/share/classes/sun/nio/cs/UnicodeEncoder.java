/*
 * Copyright (c) 2000, 2026, Oracle and/or its affiliates. All rights reserved.
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

import java.nio.*;
import java.nio.charset.*;
import jdk.internal.vm.annotation.IntrinsicCandidate;

/**
 * Base class for different flavors of UTF-16 encoders
 */
public abstract class UnicodeEncoder extends CharsetEncoder {

    protected static final char BYTE_ORDER_MARK = '\uFEFF';
    protected static final char REVERSED_MARK = '\uFFFE';

    protected static final int BIG = 0;
    protected static final int LITTLE = 1;

    private int byteOrder;      /* Byte order in use */
    private boolean usesMark;   /* Write an initial BOM */
    private boolean needsMark;

    protected UnicodeEncoder(Charset cs, int bo, boolean m) {
        super(cs, 2.0f,
              // Four bytes max if you need a BOM
              m ? 4.0f : 2.0f,
              // Replacement depends upon byte order
              ((bo == BIG)
               ? new byte[] { (byte)0xff, (byte)0xfd }
               : new byte[] { (byte)0xfd, (byte)0xff }));
        usesMark = needsMark = m;
        byteOrder = bo;
    }

    private void put(char c, ByteBuffer dst) {
        if (byteOrder == BIG) {
            dst.put((byte)(c >> 8));
            dst.put((byte)(c & 0xff));
        } else {
            dst.put((byte)(c & 0xff));
            dst.put((byte)(c >> 8));
        }
    }

    private final Surrogate.Parser sgp = new Surrogate.Parser();

    // Converts the longest prefix of well-formed chars that fits, reading and writing the
    // given storage as (object, address) pairs, with the units counted in 16-bit units, and
    // returns the consumed chars in the high word and the produced units in the low word.
    // A lone surrogate, and a pair that the end of the range cuts, end the prefix, so that
    // the loop in encodeLoop keeps deciding what they mean. The Java bodies decline by
    // consuming nothing.
    @IntrinsicCandidate
    private static long encodeBulkLE(Object src, long srcAddress, int srcLength,
                                     Object dst, long dstAddress, int dstCapacity) {
        return 0L;
    }

    @IntrinsicCandidate
    private static long encodeBulkBE(Object src, long srcAddress, int srcLength,
                                     Object dst, long dstAddress, int dstCapacity) {
        return 0L;
    }

    // Converts prefixes of the n chars at srcAddress until one makes no progress, and
    // returns the consumed chars in the high word and the produced units in the low word.
    private static long encodeRun(boolean big, Object src, long srcAddress, int n,
                                  Object dst, long dstAddress, int room) {
        int sp = 0;
        int dp = 0;
        while (n - sp >= BufferStorage.BULK_MIN && room - dp >= BufferStorage.BULK_MIN) {
            int chunk = Math.min(n - sp, BufferStorage.BULK_MAX);
            long srcPart = srcAddress + ((long) sp << 1);
            long dstPart = dstAddress + ((long) dp << 1);
            long r = big ? encodeBulkBE(src, srcPart, chunk, dst, dstPart, room - dp)
                         : encodeBulkLE(src, srcPart, chunk, dst, dstPart, room - dp);
            int consumed = (int) (r >>> 32);
            sp += consumed;
            dp += (int) r;
            if (chunk - consumed >= BufferStorage.BULK_TAIL) {
                break;
            }
        }
        return ((long) sp << 32) | dp;
    }

    // Advances both buffers over a converted prefix, unless the first char is a surrogate
    // that does not begin a pair, which the loop reports.
    private void encodeBuffers(CharBuffer src, ByteBuffer dst) {
        int n = src.remaining();
        int room = dst.remaining() >> 1;
        if (n < BufferStorage.BULK_MIN || room < BufferStorage.BULK_MIN) {
            return;
        }
        int p = src.position();
        char first = src.get(p);
        if (Character.isSurrogate(first)
                && !(Character.isHighSurrogate(first) && Character.isLowSurrogate(src.get(p + 1)))) {
            return;
        }
        if (!BufferStorage.accessible(src, false) || !BufferStorage.accessible(dst, true)) {
            return;
        }
        Object srcBase = BufferStorage.base(src);
        Object dstBase = BufferStorage.base(dst);
        long srcAddress = BufferStorage.address(src, 1);
        long dstAddress = BufferStorage.address(dst, 0);
        if (BufferStorage.overlaps(srcBase, srcAddress, (long) n << 1, dstBase, dstAddress, (long) room << 1)) {
            return;
        }
        BufferStorage.acquire(src, dst);
        try {
            long r = encodeRun(byteOrder == BIG, srcBase, srcAddress, n, dstBase, dstAddress, room);
            src.position(p + (int) (r >>> 32));
            dst.position(dst.position() + ((int) r << 1));
        } finally {
            BufferStorage.release(src, dst);
        }
    }

    protected CoderResult encodeLoop(CharBuffer src, ByteBuffer dst) {
        int mark = src.position();

        if (needsMark && src.hasRemaining()) {
            if (dst.remaining() < 2)
                return CoderResult.OVERFLOW;
            put(BYTE_ORDER_MARK, dst);
            needsMark = false;
        }
        try {
            encodeBuffers(src, dst);
            mark = src.position();
            while (src.hasRemaining()) {
                char c = src.get();
                if (!Character.isSurrogate(c)) {
                    if (dst.remaining() < 2)
                        return CoderResult.OVERFLOW;
                    mark++;
                    put(c, dst);
                    continue;
                }
                int d = sgp.parse(c, src);
                if (d < 0)
                    return sgp.error();
                if (dst.remaining() < 4)
                    return CoderResult.OVERFLOW;
                mark += 2;
                put(Character.highSurrogate(d), dst);
                put(Character.lowSurrogate(d), dst);
            }
            return CoderResult.UNDERFLOW;
        } finally {
            src.position(mark);
        }
    }

    protected void implReset() {
        needsMark = usesMark;
    }

    public boolean canEncode(char c) {
        return ! Character.isSurrogate(c);
    }

    public boolean canEncode(CharSequence cs) {
        return Unicode.isValidUnicode(cs);
    }
}
