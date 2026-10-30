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
import jdk.internal.misc.Unsafe;
import jdk.internal.vm.annotation.IntrinsicCandidate;

import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;

/* Legal UTF-8 Byte Sequences
 *
 * #    Code Points      Bits   Bit/Byte pattern
 * 1                     7      0xxxxxxx
 *      U+0000..U+007F          00..7F
 *
 * 2                     11     110xxxxx    10xxxxxx
 *      U+0080..U+07FF          C2..DF      80..BF
 *
 * 3                     16     1110xxxx    10xxxxxx    10xxxxxx
 *      U+0800..U+0FFF          E0          A0..BF      80..BF
 *      U+1000..U+FFFF          E1..EF      80..BF      80..BF
 *
 * 4                     21     11110xxx    10xxxxxx    10xxxxxx    10xxxxxx
 *     U+10000..U+3FFFF         F0          90..BF      80..BF      80..BF
 *     U+40000..U+FFFFF         F1..F3      80..BF      80..BF      80..BF
 *    U+100000..U10FFFF         F4          80..8F      80..BF      80..BF
 *
 */

public final class UTF_8 extends Unicode {

    public static final UTF_8 INSTANCE = new UTF_8();

    public UTF_8() {
        super("UTF-8", StandardCharsets.aliases_UTF_8());
    }

    public String historicalName() {
        return "UTF8";
    }

    public CharsetDecoder newDecoder() {
        return new Decoder(this);
    }

    public CharsetEncoder newEncoder() {
        return new Encoder(this);
    }

    static final void updatePositions(Buffer src, int sp,
                                              Buffer dst, int dp) {
        src.position(sp - src.arrayOffset());
        dst.position(dp - dst.arrayOffset());
    }

    private static final JavaLangAccess JLA = SharedSecrets.getJavaLangAccess();

    // Ranges shorter than BULK_MIN stay in the Java loops. The intrinsics convert at
    // most BULK_MAX source elements per call, so the loops below call them repeatedly.
    private static final int BULK_MIN = BufferStorage.BULK_MIN;
    private static final int BULK_MAX = BufferStorage.BULK_MAX;
    private static final int BULK_TAIL = BufferStorage.BULK_TAIL;

    /**
     * Converts the valid complete prefix of the {@code n} bytes of UTF-8 at {@code srcAddress}
     * into chars at {@code dstAddress}, with room for {@code room} chars, in calls of bounded
     * length, for the Java loops of String. The storage is given as (object, address) pairs.
     * The loops handle what follows the prefix, including malformed input.
     *
     * @return the consumed bytes in the high word and the produced chars in the low word
     */
    public static long decodeRun(Object src, long srcAddress, int n,
                                 Object dst, long dstAddress, int room) {
        return Decoder.decodeRun(src, srcAddress, n, dst, dstAddress, room);
    }

    /**
     * Converts the valid complete prefix of the {@code n} chars at {@code srcAddress} into
     * UTF-8 at {@code dstAddress}, with room for {@code room} bytes, in calls of bounded
     * length, for the Java loops of String. An unpaired surrogate ends the prefix.
     *
     * @return the consumed chars in the high word and the produced bytes in the low word
     */
    public static long encodeRun(Object src, long srcAddress, int n,
                                 Object dst, long dstAddress, int room) {
        return Encoder.encodeRun(src, srcAddress, n, dst, dstAddress, room);
    }

    /**
     * Converts the Latin-1 bytes of a compact string, {@code n} at {@code srcAddress}, into
     * UTF-8 at {@code dstAddress}, with room for {@code room} bytes, in calls of bounded
     * length, for the char buffer of a string. A char that does not fit ends the conversion.
     *
     * @return the consumed chars in the high word and the produced bytes in the low word
     */
    public static long encodeLatin1Run(Object src, long srcAddress, int n,
                                       Object dst, long dstAddress, int room) {
        return Encoder.encodeLatin1Run(src, srcAddress, n, dst, dstAddress, room);
    }

    private static class Decoder extends CharsetDecoder {

        private Decoder(Charset cs) {
            super(cs, 1.0f, 1.0f);
        }

        private static boolean isNotContinuation(int b) {
            return (b & 0xc0) != 0x80;
        }

        //  [E0]     [A0..BF] [80..BF]
        //  [E1..EF] [80..BF] [80..BF]
        private static boolean isMalformed3(int b1, int b2, int b3) {
            return (b1 == (byte)0xe0 && (b2 & 0xe0) == 0x80) ||
                   (b2 & 0xc0) != 0x80 || (b3 & 0xc0) != 0x80;
        }

        // only used when there is only one byte left in src buffer
        private static boolean isMalformed3_2(int b1, int b2) {
            return (b1 == (byte)0xe0 && (b2 & 0xe0) == 0x80) ||
                   (b2 & 0xc0) != 0x80;
        }

        //  [F0]     [90..BF] [80..BF] [80..BF]
        //  [F1..F3] [80..BF] [80..BF] [80..BF]
        //  [F4]     [80..8F] [80..BF] [80..BF]
        //  only check 80-be range here, the [0xf0,0x80...] and [0xf4,0x90-...]
        //  will be checked by Character.isSupplementaryCodePoint(uc)
        private static boolean isMalformed4(int b2, int b3, int b4) {
            return (b2 & 0xc0) != 0x80 || (b3 & 0xc0) != 0x80 ||
                   (b4 & 0xc0) != 0x80;
        }

        // only used when there is less than 4 bytes left in src buffer.
        // both b1 and b2 should be "& 0xff" before passed in.
        private static boolean isMalformed4_2(int b1, int b2) {
            return (b1 == 0xf0 && (b2  < 0x90 || b2 > 0xbf)) ||
                   (b1 == 0xf4 && (b2 & 0xf0) != 0x80) ||
                   (b2 & 0xc0) != 0x80;
        }

        // tests if b1 and b2 are malformed as the first 2 bytes of a
        // legal`4-byte utf-8 byte sequence.
        // only used when there is less than 4 bytes left in src buffer,
        // after isMalformed4_2 has been invoked.
        private static boolean isMalformed4_3(int b3) {
            return (b3 & 0xc0) != 0x80;
        }

        private static CoderResult malformedN(ByteBuffer src, int nb) {
            switch (nb) {
            case 1:
            case 2:                    // always 1
                return CoderResult.malformedForLength(1);
            case 3:
                int b1 = src.get();
                int b2 = src.get();    // no need to lookup b3
                return CoderResult.malformedForLength(
                    ((b1 == (byte)0xe0 && (b2 & 0xe0) == 0x80) ||
                     isNotContinuation(b2)) ? 1 : 2);
            case 4:  // we don't care the speed here
                b1 = src.get() & 0xff;
                b2 = src.get() & 0xff;
                if (b1 > 0xf4 ||
                    (b1 == 0xf0 && (b2 < 0x90 || b2 > 0xbf)) ||
                    (b1 == 0xf4 && (b2 & 0xf0) != 0x80) ||
                    isNotContinuation(b2))
                    return CoderResult.malformedForLength(1);
                if (isNotContinuation(src.get()))
                    return CoderResult.malformedForLength(2);
                return CoderResult.malformedForLength(3);
            default:
                assert false;
                return null;
            }
        }

        private static CoderResult malformed(ByteBuffer src, int sp,
                                             CharBuffer dst, int dp,
                                             int nb)
        {
            src.position(sp - src.arrayOffset());
            CoderResult cr = malformedN(src, nb);
            updatePositions(src, sp, dst, dp);
            return cr;
        }


        private static CoderResult malformed(ByteBuffer src,
                                             int mark, int nb)
        {
            src.position(mark);
            CoderResult cr = malformedN(src, nb);
            src.position(mark);
            return cr;
        }

        private static CoderResult malformedForLength(ByteBuffer src,
                                                      int sp,
                                                      CharBuffer dst,
                                                      int dp,
                                                      int malformedNB)
        {
            updatePositions(src, sp, dst, dp);
            return CoderResult.malformedForLength(malformedNB);
        }

        private static CoderResult malformedForLength(ByteBuffer src,
                                                      int mark,
                                                      int malformedNB)
        {
            src.position(mark);
            return CoderResult.malformedForLength(malformedNB);
        }


        private static CoderResult xflow(Buffer src, int sp, int sl,
                                         Buffer dst, int dp, int nb) {
            updatePositions(src, sp, dst, dp);
            return (nb == 0 || sl - sp < nb)
                   ? CoderResult.UNDERFLOW : CoderResult.OVERFLOW;
        }

        private static CoderResult xflow(Buffer src, int mark, int nb) {
            src.position(mark);
            return (nb == 0 || src.remaining() < nb)
                   ? CoderResult.UNDERFLOW : CoderResult.OVERFLOW;
        }

        // Converts the longest prefix of complete, valid UTF-8 that fits, reading and
        // writing the given storage as (object, address) pairs, and returns the
        // consumed bytes in the high word and the produced chars in the low word.
        // The caller's loop handles malformed input, a trailing partial sequence and
        // output that does not fit. The Java body declines by consuming nothing.
        @IntrinsicCandidate
        private static long decodeBulk(Object src, long srcAddress, int srcLength,
                                       Object dst, long dstAddress, int dstCapacity) {
            return 0L;
        }

        // Whether converting in bulk would make progress at an element, which is so for ASCII
        // and for a lead byte with its continuation byte. Elements for which it does not are
        // left to the loops, which report them without a call that fails at its first byte.
        private static boolean mayStart(int b1, int b2) {
            int lead = b1 & 0xff;
            return b1 >= 0 || (lead >= 0xc2 && lead <= 0xf4 && (b2 & 0xc0) == 0x80);
        }

        // Converts prefixes of the n bytes at srcAddress until one makes no progress, and
        // returns the consumed bytes in the high word and the produced chars in the low word.
        private static long decodeRun(Object src, long srcAddress, int n,
                                      Object dst, long dstAddress, int room) {
            int sp = 0;
            int dp = 0;
            while (n - sp >= BULK_MIN && room - dp >= BULK_MIN) {
                int chunk = Math.min(n - sp, BULK_MAX);
                long r = decodeBulk(src, srcAddress + sp, chunk, dst, dstAddress + ((long) dp << 1), room - dp);
                int consumed = (int) (r >>> 32);
                sp += consumed;
                dp += (int) r;
                if (chunk - consumed >= BULK_TAIL) {
                    break;
                }
            }
            return ((long) sp << 32) | dp;
        }

        // The buffer loop's counterpart of the array loop's bulk step: direct buffers,
        // and heap buffers without an accessible array, are advanced through
        // their storage before the remainder is decoded element by element.
        private static void decodeBuffers(ByteBuffer src, CharBuffer dst) {
            int n = src.remaining();
            int room = dst.remaining();
            if (n < BULK_MIN || room < BULK_MIN
                    || !mayStart(src.get(src.position()), src.get(src.position() + 1))
                    || !BufferStorage.accessible(src, false) || !BufferStorage.accessible(dst, true)) {
                return;
            }
            Object srcBase = BufferStorage.base(src);
            Object dstBase = BufferStorage.base(dst);
            long srcAddress = BufferStorage.address(src, 0);
            long dstAddress = BufferStorage.address(dst, 1);
            if (BufferStorage.overlaps(srcBase, srcAddress, n, dstBase, dstAddress, (long) room << 1)) {
                return;
            }
            BufferStorage.acquire(src, dst);
            try {
                long r = decodeRun(srcBase, srcAddress, n, dstBase, dstAddress, room);
                src.position(src.position() + (int) (r >>> 32));
                dst.position(dst.position() + (int) r);
            } finally {
                BufferStorage.release(src, dst);
            }
        }

        private CoderResult decodeArrayLoop(ByteBuffer src,
                                            CharBuffer dst)
        {
            // This method is optimized for ASCII input.
            byte[] sa = src.array();
            int soff = src.arrayOffset();
            int sp = soff + src.position();
            int sl = soff + src.limit();

            char[] da = dst.array();
            int doff = dst.arrayOffset();
            int dp = doff + dst.position();
            int dl = doff + dst.limit();

            int n = JLA.decodeASCII(sa, sp, da, dp, Math.min(sl - sp, dl - dp));
            sp += n;
            dp += n;

            if (sl - sp >= BULK_MIN && dl - dp >= BULK_MIN && mayStart(sa[sp], sa[sp + 1])) {
                long r = decodeRun(sa, Unsafe.ARRAY_BYTE_BASE_OFFSET + sp, sl - sp,
                                   da, Unsafe.ARRAY_CHAR_BASE_OFFSET + ((long) dp << 1), dl - dp);
                sp += (int) (r >>> 32);
                dp += (int) r;
            }

            while (sp < sl) {
                int b1 = sa[sp];
                if (b1 >= 0) {
                    // 1 byte, 7 bits: 0xxxxxxx
                    if (dp >= dl)
                        return xflow(src, sp, sl, dst, dp, 1);
                    da[dp++] = (char) b1;
                    sp++;
                } else if ((b1 >> 5) == -2 && (b1 & 0x1e) != 0) {
                    // 2 bytes, 11 bits: 110xxxxx 10xxxxxx
                    //                   [C2..DF] [80..BF]
                    if (sl - sp < 2 || dp >= dl)
                        return xflow(src, sp, sl, dst, dp, 2);
                    int b2 = sa[sp + 1];
                    // Now we check the first byte of 2-byte sequence as
                    //     if ((b1 >> 5) == -2 && (b1 & 0x1e) != 0)
                    // no longer need to check b1 against c1 & c0 for
                    // malformed as we did in previous version
                    //   (b1 & 0x1e) == 0x0 || (b2 & 0xc0) != 0x80;
                    // only need to check the second byte b2.
                    if (isNotContinuation(b2))
                        return malformedForLength(src, sp, dst, dp, 1);
                    da[dp++] = (char) (((b1 << 6) ^ b2)
                                       ^
                                       (((byte) 0xC0 << 6) ^
                                        ((byte) 0x80 << 0)));
                    sp += 2;
                } else if ((b1 >> 4) == -2) {
                    // 3 bytes, 16 bits: 1110xxxx 10xxxxxx 10xxxxxx
                    int srcRemaining = sl - sp;
                    if (srcRemaining < 3 || dp >= dl) {
                        if (srcRemaining > 1 && isMalformed3_2(b1, sa[sp + 1]))
                            return malformedForLength(src, sp, dst, dp, 1);
                        return xflow(src, sp, sl, dst, dp, 3);
                    }
                    int b2 = sa[sp + 1];
                    int b3 = sa[sp + 2];
                    if (isMalformed3(b1, b2, b3))
                        return malformed(src, sp, dst, dp, 3);
                    char c = (char)
                        ((b1 << 12) ^
                         (b2 <<  6) ^
                         (b3 ^
                          (((byte) 0xE0 << 12) ^
                           ((byte) 0x80 <<  6) ^
                           ((byte) 0x80 <<  0))));
                    if (Character.isSurrogate(c))
                        return malformedForLength(src, sp, dst, dp, 3);
                    da[dp++] = c;
                    sp += 3;
                } else if ((b1 >> 3) == -2) {
                    // 4 bytes, 21 bits: 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
                    int srcRemaining = sl - sp;
                    if (srcRemaining < 4 || dl - dp < 2) {
                        b1 &= 0xff;
                        if (b1 > 0xf4 ||
                            srcRemaining > 1 && isMalformed4_2(b1, sa[sp + 1] & 0xff))
                            return malformedForLength(src, sp, dst, dp, 1);
                        if (srcRemaining > 2 && isMalformed4_3(sa[sp + 2]))
                            return malformedForLength(src, sp, dst, dp, 2);
                        return xflow(src, sp, sl, dst, dp, 4);
                    }
                    int b2 = sa[sp + 1];
                    int b3 = sa[sp + 2];
                    int b4 = sa[sp + 3];
                    int uc = ((b1 << 18) ^
                              (b2 << 12) ^
                              (b3 <<  6) ^
                              (b4 ^
                               (((byte) 0xF0 << 18) ^
                                ((byte) 0x80 << 12) ^
                                ((byte) 0x80 <<  6) ^
                                ((byte) 0x80 <<  0))));
                    if (isMalformed4(b2, b3, b4) ||
                        // shortest form check
                        !Character.isSupplementaryCodePoint(uc)) {
                        return malformed(src, sp, dst, dp, 4);
                    }
                    da[dp++] = Character.highSurrogate(uc);
                    da[dp++] = Character.lowSurrogate(uc);
                    sp += 4;
                } else
                    return malformed(src, sp, dst, dp, 1);
            }
            return xflow(src, sp, sl, dst, dp, 0);
        }

        private CoderResult decodeBufferLoop(ByteBuffer src,
                                             CharBuffer dst)
        {
            decodeBuffers(src, dst);
            int mark = src.position();
            int limit = src.limit();
            while (mark < limit) {
                int b1 = src.get();
                if (b1 >= 0) {
                    // 1 byte, 7 bits: 0xxxxxxx
                    if (dst.remaining() < 1)
                        return xflow(src, mark, 1); // overflow
                    dst.put((char) b1);
                    mark++;
                } else if ((b1 >> 5) == -2 && (b1 & 0x1e) != 0) {
                    // 2 bytes, 11 bits: 110xxxxx 10xxxxxx
                    if (limit - mark < 2|| dst.remaining() < 1)
                        return xflow(src, mark, 2);
                    int b2 = src.get();
                    if (isNotContinuation(b2))
                        return malformedForLength(src, mark, 1);
                     dst.put((char) (((b1 << 6) ^ b2)
                                    ^
                                    (((byte) 0xC0 << 6) ^
                                     ((byte) 0x80 << 0))));
                    mark += 2;
                } else if ((b1 >> 4) == -2) {
                    // 3 bytes, 16 bits: 1110xxxx 10xxxxxx 10xxxxxx
                    int srcRemaining = limit - mark;
                    if (srcRemaining < 3 || dst.remaining() < 1) {
                        if (srcRemaining > 1 && isMalformed3_2(b1, src.get()))
                            return malformedForLength(src, mark, 1);
                        return xflow(src, mark, 3);
                    }
                    int b2 = src.get();
                    int b3 = src.get();
                    if (isMalformed3(b1, b2, b3))
                        return malformed(src, mark, 3);
                    char c = (char)
                        ((b1 << 12) ^
                         (b2 <<  6) ^
                         (b3 ^
                          (((byte) 0xE0 << 12) ^
                           ((byte) 0x80 <<  6) ^
                           ((byte) 0x80 <<  0))));
                    if (Character.isSurrogate(c))
                        return malformedForLength(src, mark, 3);
                    dst.put(c);
                    mark += 3;
                } else if ((b1 >> 3) == -2) {
                    // 4 bytes, 21 bits: 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
                    int srcRemaining = limit - mark;
                    if (srcRemaining < 4 || dst.remaining() < 2) {
                        b1 &= 0xff;
                        if (b1 > 0xf4 ||
                            srcRemaining > 1 && isMalformed4_2(b1, src.get() & 0xff))
                            return malformedForLength(src, mark, 1);
                        if (srcRemaining > 2 && isMalformed4_3(src.get()))
                            return malformedForLength(src, mark, 2);
                        return xflow(src, mark, 4);
                    }
                    int b2 = src.get();
                    int b3 = src.get();
                    int b4 = src.get();
                    int uc = ((b1 << 18) ^
                              (b2 << 12) ^
                              (b3 <<  6) ^
                              (b4 ^
                               (((byte) 0xF0 << 18) ^
                                ((byte) 0x80 << 12) ^
                                ((byte) 0x80 <<  6) ^
                                ((byte) 0x80 <<  0))));
                    if (isMalformed4(b2, b3, b4) ||
                        // shortest form check
                        !Character.isSupplementaryCodePoint(uc)) {
                        return malformed(src, mark, 4);
                    }
                    dst.put(Character.highSurrogate(uc));
                    dst.put(Character.lowSurrogate(uc));
                    mark += 4;
                } else {
                    return malformed(src, mark, 1);
                }
            }
            return xflow(src, mark, 0);
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

    private static final class Encoder extends CharsetEncoder {

        private Encoder(Charset cs) {
            super(cs, 1.1f, 3.0f);
        }

        public boolean canEncode(char c) {
            return !Character.isSurrogate(c);
        }

        public boolean canEncode(CharSequence cs) {
            return Unicode.isValidUnicode(cs);
        }

        public boolean isLegalReplacement(byte[] repl) {
            return ((repl.length == 1 && repl[0] >= 0) ||
                    super.isLegalReplacement(repl));
        }

        private static CoderResult overflow(CharBuffer src, int sp,
                                            ByteBuffer dst, int dp) {
            updatePositions(src, sp, dst, dp);
            return CoderResult.OVERFLOW;
        }

        private static CoderResult overflow(CharBuffer src, int mark) {
            src.position(mark);
            return CoderResult.OVERFLOW;
        }

        // Converts the longest prefix of complete characters that fits, reading and
        // writing the given storage as (object, address) pairs, and returns the
        // consumed chars in the high word and the produced bytes in the low word.
        // The caller's loop handles unpaired surrogates and output that does not
        // fit. The Java body declines by consuming nothing.
        @IntrinsicCandidate
        private static long encodeBulk(Object src, long srcAddress, int srcLength,
                                       Object dst, long dstAddress, int dstCapacity) {
            return 0L;
        }

        // Converts the leading Latin-1 bytes that fit, as UTF-8, reading and writing the
        // given storage as (object, address) pairs, and returns the consumed bytes in the
        // high word and the produced bytes in the low word. Every byte converts; the output
        // bounds the prefix. The Java body declines by consuming nothing.
        @IntrinsicCandidate
        private static long encodeLatin1Bulk(Object src, long srcAddress, int srcLength,
                                             Object dst, long dstAddress, int dstCapacity) {
            return 0L;
        }

        // Converts prefixes of the n Latin-1 bytes at srcAddress until one makes no progress.
        private static long encodeLatin1Run(Object src, long srcAddress, int n,
                                            Object dst, long dstAddress, int room) {
            int sp = 0;
            int dp = 0;
            while (n - sp >= BULK_MIN && room - dp >= BULK_MIN) {
                int chunk = Math.min(n - sp, BULK_MAX);
                long r = encodeLatin1Bulk(src, srcAddress + sp, chunk, dst, dstAddress + dp, room - dp);
                int consumed = (int) (r >>> 32);
                sp += consumed;
                dp += (int) r;
                if (chunk - consumed >= BULK_TAIL) {
                    break;
                }
            }
            return ((long) sp << 32) | dp;
        }

        // Whether converting in bulk would make progress at a char, which is so unless it is
        // a surrogate that does not begin a pair. Such chars are left to the loops, which
        // report them without a call that fails at its first char.
        private static boolean mayStart(char c, char next) {
            return !Character.isSurrogate(c)
                    || (Character.isHighSurrogate(c) && Character.isLowSurrogate(next));
        }

        // Converts prefixes of the n chars at srcAddress until one makes no progress, and
        // returns the consumed chars in the high word and the produced bytes in the low word.
        private static long encodeRun(Object src, long srcAddress, int n,
                                      Object dst, long dstAddress, int room) {
            int sp = 0;
            int dp = 0;
            while (n - sp >= BULK_MIN && room - dp >= BULK_MIN) {
                int chunk = Math.min(n - sp, BULK_MAX);
                long r = encodeBulk(src, srcAddress + ((long) sp << 1), chunk, dst, dstAddress + dp, room - dp);
                int consumed = (int) (r >>> 32);
                sp += consumed;
                dp += (int) r;
                if (chunk - consumed >= BULK_TAIL) {
                    break;
                }
            }
            return ((long) sp << 32) | dp;
        }

        // The buffer loop's counterpart of the array loop's bulk step.
        private static void encodeBuffers(CharBuffer src, ByteBuffer dst) {
            int n = src.remaining();
            int room = dst.remaining();
            if (n < BULK_MIN || room < BULK_MIN
                    || !mayStart(src.get(src.position()), src.get(src.position() + 1))
                    || !BufferStorage.accessible(dst, true)) {
                return;
            }
            String str = BufferStorage.string(src);
            if (str != null) {
                encodeString(str, src, dst, n, room);
                return;
            }
            if (!BufferStorage.accessible(src, false)) {
                return;
            }
            Object srcBase = BufferStorage.base(src);
            Object dstBase = BufferStorage.base(dst);
            long srcAddress = BufferStorage.address(src, 1);
            long dstAddress = BufferStorage.address(dst, 0);
            if (BufferStorage.overlaps(srcBase, srcAddress, (long) n << 1, dstBase, dstAddress, room)) {
                return;
            }
            BufferStorage.acquire(src, dst);
            try {
                long r = encodeRun(srcBase, srcAddress, n, dstBase, dstAddress, room);
                src.position(src.position() + (int) (r >>> 32));
                dst.position(dst.position() + (int) r);
            } finally {
                BufferStorage.release(src, dst);
            }
        }

        // A buffer made by wrapping a string reads the string's own storage, which neither
        // changes nor overlaps the destination.
        private static void encodeString(String str, CharBuffer src, ByteBuffer dst, int n, int room) {
            Object dstBase = BufferStorage.base(dst);
            long dstAddress = BufferStorage.address(dst, 0);
            BufferStorage.acquire(src, dst);
            try {
                long r = JLA.encodeUTF8Run(str, BufferStorage.stringOffset(src) + src.position(), n,
                                           dstBase, dstAddress, room);
                src.position(src.position() + (int) (r >>> 32));
                dst.position(dst.position() + (int) r);
            } finally {
                BufferStorage.release(src, dst);
            }
        }

        private Surrogate.Parser sgp;
        private CoderResult encodeArrayLoop(CharBuffer src,
                                            ByteBuffer dst) {
            char[] sa = src.array();
            int sp = src.arrayOffset() + src.position();
            int sl = src.arrayOffset() + src.limit();

            byte[] da = dst.array();
            int dp = dst.arrayOffset() + dst.position();
            int dl = dst.arrayOffset() + dst.limit();

            // Handle ASCII-only prefix
            int n = JLA.encodeASCII(sa, sp, da, dp, Math.min(sl - sp, dl - dp));
            sp += n;
            dp += n;

            if (sl - sp >= BULK_MIN && dl - dp >= BULK_MIN && mayStart(sa[sp], sa[sp + 1])) {
                long r = encodeRun(sa, Unsafe.ARRAY_CHAR_BASE_OFFSET + ((long) sp << 1), sl - sp,
                                   da, Unsafe.ARRAY_BYTE_BASE_OFFSET + dp, dl - dp);
                sp += (int) (r >>> 32);
                dp += (int) r;
            }

            if (sp < sl) {
                return encodeArrayLoopSlow(src, sa, sp, sl, dst, da, dp, dl);
            } else {
                updatePositions(src, sp, dst, dp);
                return CoderResult.UNDERFLOW;
            }
        }

        private CoderResult encodeArrayLoopSlow(CharBuffer src, char[] sa, int sp, int sl,
                                                ByteBuffer dst, byte[] da, int dp, int dl) {
            while (sp < sl) {
                char c = sa[sp];
                if (c < 0x80) {
                    // Have at most seven bits
                    if (dp >= dl)
                        return overflow(src, sp, dst, dp);
                    da[dp++] = (byte)c;
                } else if (c < 0x800) {
                    // 2 bytes, 11 bits
                    if (dl - dp < 2)
                        return overflow(src, sp, dst, dp);
                    da[dp++] = (byte)(0xc0 | (c >> 6));
                    da[dp++] = (byte)(0x80 | (c & 0x3f));
                } else if (Character.isSurrogate(c)) {
                    // Have a surrogate pair
                    if (sgp == null)
                        sgp = new Surrogate.Parser();
                    int uc = sgp.parse(c, sa, sp, sl);
                    if (uc < 0) {
                        updatePositions(src, sp, dst, dp);
                        return sgp.error();
                    }
                    if (dl - dp < 4)
                        return overflow(src, sp, dst, dp);
                    da[dp++] = (byte)(0xf0 | ((uc >> 18)));
                    da[dp++] = (byte)(0x80 | ((uc >> 12) & 0x3f));
                    da[dp++] = (byte)(0x80 | ((uc >>  6) & 0x3f));
                    da[dp++] = (byte)(0x80 | (uc & 0x3f));
                    sp++;  // 2 chars
                } else {
                    // 3 bytes, 16 bits
                    if (dl - dp < 3)
                        return overflow(src, sp, dst, dp);
                    da[dp++] = (byte)(0xe0 | ((c >> 12)));
                    da[dp++] = (byte)(0x80 | ((c >>  6) & 0x3f));
                    da[dp++] = (byte)(0x80 | (c & 0x3f));
                }
                sp++;
            }
            updatePositions(src, sp, dst, dp);
            return CoderResult.UNDERFLOW;
        }

        private CoderResult encodeBufferLoop(CharBuffer src,
                                             ByteBuffer dst)
        {
            encodeBuffers(src, dst);
            int mark = src.position();
            while (src.hasRemaining()) {
                char c = src.get();
                if (c < 0x80) {
                    // Have at most seven bits
                    if (!dst.hasRemaining())
                        return overflow(src, mark);
                    dst.put((byte)c);
                } else if (c < 0x800) {
                    // 2 bytes, 11 bits
                    if (dst.remaining() < 2)
                        return overflow(src, mark);
                    dst.put((byte)(0xc0 | (c >> 6)));
                    dst.put((byte)(0x80 | (c & 0x3f)));
                } else if (Character.isSurrogate(c)) {
                    // Have a surrogate pair
                    if (sgp == null)
                        sgp = new Surrogate.Parser();
                    int uc = sgp.parse(c, src);
                    if (uc < 0) {
                        src.position(mark);
                        return sgp.error();
                    }
                    if (dst.remaining() < 4)
                        return overflow(src, mark);
                    dst.put((byte)(0xf0 | ((uc >> 18))));
                    dst.put((byte)(0x80 | ((uc >> 12) & 0x3f)));
                    dst.put((byte)(0x80 | ((uc >>  6) & 0x3f)));
                    dst.put((byte)(0x80 | (uc & 0x3f)));
                    mark++;  // 2 chars
                } else {
                    // 3 bytes, 16 bits
                    if (dst.remaining() < 3)
                        return overflow(src, mark);
                    dst.put((byte)(0xe0 | ((c >> 12))));
                    dst.put((byte)(0x80 | ((c >>  6) & 0x3f)));
                    dst.put((byte)(0x80 | (c & 0x3f)));
                }
                mark++;
            }
            src.position(mark);
            return CoderResult.UNDERFLOW;
        }

        protected final CoderResult encodeLoop(CharBuffer src,
                                               ByteBuffer dst)
        {
            if (src.hasArray() && dst.hasArray())
                return encodeArrayLoop(src, dst);
            else
                return encodeBufferLoop(src, dst);
        }

    }
}
