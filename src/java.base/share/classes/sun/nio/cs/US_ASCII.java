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

import jdk.internal.access.JavaLangAccess;
import jdk.internal.access.SharedSecrets;
import jdk.internal.vm.annotation.IntrinsicCandidate;

import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;

public class US_ASCII
    extends Charset
    implements HistoricallyNamedCharset
{
    public static final US_ASCII INSTANCE = new US_ASCII();

    public US_ASCII() {
        super("US-ASCII", StandardCharsets.aliases_US_ASCII());
    }

    public String historicalName() {
        return "ASCII";
    }

    public boolean contains(Charset cs) {
        return (cs instanceof US_ASCII);
    }

    public CharsetDecoder newDecoder() {
        return new Decoder(this);
    }

    public CharsetEncoder newEncoder() {
        return new Encoder(this);
    }

    private static final JavaLangAccess JLA = SharedSecrets.getJavaLangAccess();

    private static final int BULK_MIN = BufferStorage.BULK_MIN;
    private static final int BULK_MAX = BufferStorage.BULK_MAX;
    private static final int BULK_TAIL = BufferStorage.BULK_TAIL;

    private static class Decoder extends CharsetDecoder {

        private Decoder(Charset cs) {
            super(cs, 1.0f, 1.0f);
        }

        private CoderResult decodeArrayLoop(ByteBuffer src,
                                            CharBuffer dst)
        {
            byte[] sa = src.array();
            int soff = src.arrayOffset();
            int sp = soff + src.position();
            int sl = soff + src.limit();

            char[] da = dst.array();
            int doff = dst.arrayOffset();
            int dp = doff + dst.position();
            int dl = doff + dst.limit();

            // ASCII only loop
            int n = JLA.decodeASCII(sa, sp, da, dp, Math.min(sl - sp, dl - dp));
            sp += n;
            dp += n;
            src.position(sp - soff);
            dst.position(dp - doff);
            if (sp < sl) {
                if (dp >= dl) {
                    return CoderResult.OVERFLOW;
                }
                return CoderResult.malformedForLength(1);
            }
            return CoderResult.UNDERFLOW;
        }


        // Converts the leading ASCII bytes that fit, reading and writing the given storage as
        // (object, address) pairs, and returns the consumed bytes in the high word and the
        // produced chars in the low word. The first byte with the high bit set ends the prefix. The Java body declines by consuming nothing.
        @IntrinsicCandidate
        private static long decodeBulk(Object src, long srcAddress, int srcLength,
                                       Object dst, long dstAddress, int dstCapacity) {
            return 0L;
        }

        // The buffer loop's bulk step: buffers whose storage the intrinsic reads and writes
        // directly are advanced before the remainder is decoded element by element.
        private static void decodeBuffers(ByteBuffer src, CharBuffer dst) {
            int n = Math.min(src.remaining(), dst.remaining());
            if (n < BULK_MIN
                    || src.get(src.position()) < 0
                    || !BufferStorage.accessible(src, false) || !BufferStorage.accessible(dst, true)) {
                return;
            }
            Object srcBase = BufferStorage.base(src);
            Object dstBase = BufferStorage.base(dst);
            long srcAddress = BufferStorage.address(src, 0);
            long dstAddress = BufferStorage.address(dst, 1);
            if (BufferStorage.overlaps(srcBase, srcAddress, n, dstBase, dstAddress, (long) n << 1)) {
                return;
            }
            BufferStorage.acquire(src, dst);
            try {
                int done = 0;
                while (n - done >= BULK_MIN) {
                    int chunk = Math.min(n - done, BULK_MAX);
                    long r = decodeBulk(srcBase, srcAddress + done, chunk,
                                        dstBase, dstAddress + ((long) done << 1), chunk);
                    int consumed = (int) (r >>> 32);
                    done += consumed;
                    if (chunk - consumed >= BULK_TAIL) {
                        break;
                    }
                }
                src.position(src.position() + done);
                dst.position(dst.position() + done);
            } finally {
                BufferStorage.release(src, dst);
            }
        }

        private CoderResult decodeBufferLoop(ByteBuffer src,
                                             CharBuffer dst)
        {
            decodeBuffers(src, dst);
            int mark = src.position();
            try {
                while (src.hasRemaining()) {
                    byte b = src.get();
                    if (b >= 0) {
                        if (!dst.hasRemaining())
                            return CoderResult.OVERFLOW;
                        dst.put((char)b);
                        mark++;
                        continue;
                    }
                    return CoderResult.malformedForLength(1);
                }
                return CoderResult.UNDERFLOW;
            } finally {
                src.position(mark);
            }
        }

        protected CoderResult decodeLoop(ByteBuffer src,
                                         CharBuffer dst)
        {
            if (src.hasArray() && dst.hasArray())
                return decodeArrayLoop(src, dst);
            else
                return decodeBufferLoop(src, dst);
        }
    }

    private static class Encoder extends CharsetEncoder {

        private Encoder(Charset cs) {
            super(cs, 1.0f, 1.0f);
        }

        public boolean canEncode(char c) {
            return c < 0x80;
        }

        public boolean canEncode(CharSequence cs) {
            int length = cs.length();
            for (int i = 0; i < length; i++) {
                if (!canEncode(cs.charAt(i))) {
                    return false;
                }
            }
            return true;
        }

        public boolean isLegalReplacement(byte[] repl) {
            return (repl.length == 1 && repl[0] >= 0) ||
                   super.isLegalReplacement(repl);
        }

        private final Surrogate.Parser sgp = new Surrogate.Parser();
        private CoderResult encodeArrayLoop(CharBuffer src,
                                            ByteBuffer dst)
        {
            char[] sa = src.array();
            int sp = src.arrayOffset() + src.position();
            int sl = src.arrayOffset() + src.limit();
            assert (sp <= sl);
            sp = (sp <= sl ? sp : sl);
            byte[] da = dst.array();
            int dp = dst.arrayOffset() + dst.position();
            int dl = dst.arrayOffset() + dst.limit();
            assert (dp <= dl);
            dp = (dp <= dl ? dp : dl);

            int n = JLA.encodeASCII(sa, sp, da, dp, Math.min(sl - sp, dl - dp));
            sp += n;
            dp += n;

            try {
                while (sp < sl) {
                    char c = sa[sp];
                    if (c < 0x80) {
                        if (dp >= dl)
                            return CoderResult.OVERFLOW;
                        da[dp] = (byte)c;
                        sp++; dp++;
                        continue;
                    }
                    if (sgp.parse(c, sa, sp, sl) < 0)
                        return sgp.error();
                    return sgp.unmappableResult();
                }
                return CoderResult.UNDERFLOW;
            } finally {
                src.position(sp - src.arrayOffset());
                dst.position(dp - dst.arrayOffset());
            }
        }


        // Converts the leading ASCII chars that fit, reading and writing the given storage as
        // (object, address) pairs, and returns the consumed chars in the high word and the
        // produced bytes in the low word. The first char above U+007F ends the prefix. The Java body declines by consuming nothing.
        @IntrinsicCandidate
        private static long encodeBulk(Object src, long srcAddress, int srcLength,
                                       Object dst, long dstAddress, int dstCapacity) {
            return 0L;
        }

        // The buffer loop's bulk step: buffers whose storage the intrinsic reads and writes
        // directly are advanced before the remainder is encoded element by element.
        private static void encodeBuffers(CharBuffer src, ByteBuffer dst) {
            int n = Math.min(src.remaining(), dst.remaining());
            if (n < BULK_MIN
                    || src.get(src.position()) >= 0x80
                    || !BufferStorage.accessible(src, false) || !BufferStorage.accessible(dst, true)) {
                return;
            }
            Object srcBase = BufferStorage.base(src);
            Object dstBase = BufferStorage.base(dst);
            long srcAddress = BufferStorage.address(src, 1);
            long dstAddress = BufferStorage.address(dst, 0);
            if (BufferStorage.overlaps(srcBase, srcAddress, (long) n << 1, dstBase, dstAddress, n)) {
                return;
            }
            BufferStorage.acquire(src, dst);
            try {
                int done = 0;
                while (n - done >= BULK_MIN) {
                    int chunk = Math.min(n - done, BULK_MAX);
                    long r = encodeBulk(srcBase, srcAddress + ((long) done << 1), chunk,
                                        dstBase, dstAddress + done, chunk);
                    int consumed = (int) (r >>> 32);
                    done += consumed;
                    if (chunk - consumed >= BULK_TAIL) {
                        break;
                    }
                }
                src.position(src.position() + done);
                dst.position(dst.position() + done);
            } finally {
                BufferStorage.release(src, dst);
            }
        }

        private CoderResult encodeBufferLoop(CharBuffer src,
                                             ByteBuffer dst)
        {
            encodeBuffers(src, dst);
            int mark = src.position();
            try {
                while (src.hasRemaining()) {
                    char c = src.get();
                    if (c < 0x80) {
                        if (!dst.hasRemaining())
                            return CoderResult.OVERFLOW;
                        dst.put((byte)c);
                        mark++;
                        continue;
                    }
                    if (sgp.parse(c, src) < 0)
                        return sgp.error();
                    return sgp.unmappableResult();
                }
                return CoderResult.UNDERFLOW;
            } finally {
                src.position(mark);
            }
        }

        protected CoderResult encodeLoop(CharBuffer src,
                                         ByteBuffer dst)
        {
            if (src.hasArray() && dst.hasArray())
                return encodeArrayLoop(src, dst);
            else
                return encodeBufferLoop(src, dst);
        }

    }
}
