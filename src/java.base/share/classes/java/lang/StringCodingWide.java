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
 */

package java.lang;

import java.lang.foreign.MemorySegment;
import java.lang.foreign.ValueLayout;
import java.nio.ByteOrder;
import java.nio.charset.Charset;
import jdk.internal.access.JavaNioCharsetAccess;
import jdk.internal.access.SharedSecrets;
import jdk.internal.foreign.AbstractMemorySegmentImpl;
import jdk.internal.misc.Unsafe;
import jdk.internal.util.SimdUTF;
import jdk.internal.vm.annotation.DontInline;
import jdk.internal.vm.annotation.ForceInline;
import sun.nio.cs.*;

/** Valid-input specializations; null requests the existing charset fallback. */
final class StringCodingWide {
    private static final Unsafe UNSAFE = Unsafe.getUnsafe();
    private static final JavaNioCharsetAccess CHARSET_ACCESS = SharedSecrets.getJavaNioCharsetAccess();

    private StringCodingWide() { }

    private static final class SegmentLayouts {
        private static final ValueLayout.OfChar CHAR_BE = ValueLayout.JAVA_CHAR_UNALIGNED.withOrder(ByteOrder.BIG_ENDIAN);
        private static final ValueLayout.OfChar CHAR_LE = ValueLayout.JAVA_CHAR_UNALIGNED.withOrder(ByteOrder.LITTLE_ENDIAN);
    }

    private enum Kind {
        UTF16(2, true, 0, true),
        UTF16BE(2, true, 1, false),
        UTF16LE(2, false, -1, false),
        UTF32(4, true, 0, false),
        UTF32BE(4, true, 1, false),
        UTF32LE(4, false, -1, false),
        UTF32BE_BOM(4, true, 1, true),
        UTF32LE_BOM(4, false, -1, true);

        final int unit;
        final boolean big;
        final int expectedOrder;
        final boolean emitBOM;

        Kind(int unit, boolean big, int expectedOrder, boolean emitBOM) {
            this.unit = unit;
            this.big = big;
            this.expectedOrder = expectedOrder;
            this.emitBOM = emitBOM;
        }
    }

    @ForceInline
    static boolean supportsCharset(Charset cs) {
        int cached = CHARSET_ACCESS.getStringCodingWide(cs);
        return cached == 0 ? cacheCharset(cs) : cached == 2;
    }

    @DontInline
    private static boolean cacheCharset(Charset cs) {
        int cached = kind(cs) == null ? 1 : 2;
        CHARSET_ACCESS.setStringCodingWide(cs, cached);
        return cached == 2;
    }

    @ForceInline
    private static Kind kind(Charset cs) {
        // These classes are extensible. Subclasses may supply different codecs.
        Class<?> type = cs.getClass();
        if (type == UTF_16.class) return Kind.UTF16;
        if (type == UTF_16BE.class) return Kind.UTF16BE;
        if (type == UTF_16LE.class) return Kind.UTF16LE;
        if (type == UTF_32.class) return Kind.UTF32;
        if (type == UTF_32BE.class) return Kind.UTF32BE;
        if (type == UTF_32LE.class) return Kind.UTF32LE;
        if (type == UTF_32BE_BOM.class) return Kind.UTF32BE_BOM;
        if (type == UTF_32LE_BOM.class) return Kind.UTF32LE_BOM;
        return null;
    }

    @ForceInline
    private static int unit(byte[] src, MemorySegment segment, long offset, int width, boolean big) {
        if (src == null) {
            return segment.get(big ? SegmentLayouts.CHAR_BE : SegmentLayouts.CHAR_LE, offset);
        }
        int off = (int)offset;
        if (width == 2) {
            return UNSAFE.getCharUnaligned(src, Unsafe.ARRAY_BYTE_BASE_OFFSET + offset, big);
        }
        return big ? src[off] << 24 | (src[off + 1] & 255) << 16
                        | (src[off + 2] & 255) << 8 | src[off + 3] & 255
                : src[off + 3] << 24 | (src[off + 2] & 255) << 16
                        | (src[off + 1] & 255) << 8 | src[off] & 255;
    }

    static String decode(Charset cs, byte[] src, int off, int len) {
        if (!SimdUTF.isEligible(len)) return null;
        Kind kind = kind(cs);
        if (kind == null || (len & (kind.unit - 1)) != 0) return null;
        return kind.unit == 4 ? decodeUTF32(kind, src, off, len)
                : decodeUTF16(kind, src, null, off, len);
    }

    static String decodeSegment(MemorySegment segment, long off, int len, Charset cs) {
        if (!SimdUTF.isEligible(len) || segment.isMapped()) return null;
        Kind kind = kind(cs);
        // Leave UTF-32 length discovery to the array decoder.
        if (kind == null || kind.unit == 4 || (len & 1) != 0) return null;
        return decodeUTF16(kind, null, segment, off, len);
    }

    private static String decodeUTF32(Kind kind, byte[] src, int off, int len) {
        boolean big = kind.big;
        int first = SimdUTF.useUTF32WordReads() ? utf32Word(src, off, true)
                : unit(src, null, off, 4, true);
        if (first == 0xfeff && kind.expectedOrder != -1) {
            big = true;
            off += 4;
            len -= 4;
        } else if (first == 0xfffe0000 && kind.expectedOrder != 1) {
            big = false;
            off += 4;
            len -= 4;
        }
        return decodeUTF32(src, off, len, big);
    }

    @ForceInline
    private static String decodeUTF32(byte[] src, int off, int len, boolean big) {
        return SimdUTF.useUTF32WordReads() ? decodeUTF32Words(src, off, len, big)
                : decodeUTF32Portable(src, off, len, big);
    }

    private static String decodeUTF32Portable(byte[] src, int off, int len, boolean big) {
        int words = len >> 2;
        if ((off & 3) != 0 && !SimdUTF.useScalarUTF32StringDecoding(len)) {
            if (!String.COMPACT_STRINGS) return null;
            for (int i = 0; i < words; i++) {
                if ((unit(src, null, off + ((long)i << 2), 4, big) & ~255) != 0) return null;
            }
            return decodeLatin1UTF32(src, off, words, big);
        }
        int units = words;
        boolean latin1 = String.COMPACT_STRINGS;
        int nonLatinIndex = -1;
        boolean wordReads = SimdUTF.useUTF32WordReads();
        for (int i = 0; i < words; i++) {
            long offset = off + ((long)i << 2);
            int cp = wordReads ? UNSAFE.getIntUnaligned(src, Unsafe.ARRAY_BYTE_BASE_OFFSET + offset, big)
                    : unit(src, null, offset, 4, big);
            // Java accepts surrogate-valued UTF-32 through its decoder.
            if (!Character.isValidCodePoint(cp) || cp >= 0xd800 && cp <= 0xdfff) return null;
            if (latin1 && cp > 255) {
                nonLatinIndex = i;
                latin1 = false;
            }
            if (cp >= 0x10000) units++;
        }
        if (latin1) return decodeLatin1UTF32(src, off, words, big);
        if (len == 0) return "";
        if (!SimdUTF.isEligibleUTF32Decoding(len)) return null;
        byte[] value = StringUTF16.newBytesFor(units);
        if (SimdUTF.useScalarUTF32StringDecoding(len)) {
            return decodeShortUTF32(src, off, len, value, units, nonLatinIndex, big);
        }
        int written = SimdUTF.decodeUTF32Bytes(src, off, len, value, 0, units, big);
        return written == units ? newUTF16String(value, nonLatinIndex) : null;
    }

    private static String decodeLatin1UTF32(byte[] src, int off, int words, boolean big) {
        byte[] value = new byte[words];
        int lowByte = off + (big ? 3 : 0);
        for (int i = 0; i < words; i++, lowByte += 4) {
            value[i] = src[lowByte];
        }
        return new String(value, String.LATIN1);
    }

    // Keep word loads out of the portable reader so C2 does not parse byte
    // assembly into its callers. Keep both censuses below in sync: each must
    // validate the scalar range and fall back for surrogate-valued input.
    @ForceInline
    private static int utf32Word(byte[] src, long offset, boolean big) {
        return UNSAFE.getIntUnaligned(src, Unsafe.ARRAY_BYTE_BASE_OFFSET + offset, big);
    }

    private static String decodeUTF32Words(byte[] src, int off, int len, boolean big) {
        int words = len >> 2;
        if ((off & 3) != 0 && !SimdUTF.useScalarUTF32StringDecoding(len)) {
            if (!String.COMPACT_STRINGS) return null;
            for (int i = 0; i < words; i++) {
                if ((utf32Word(src, off + ((long)i << 2), big) & ~255) != 0) return null;
            }
            return decodeLatin1UTF32Words(src, off, words, big);
        }
        int units = words;
        boolean latin1 = String.COMPACT_STRINGS;
        int nonLatinIndex = -1;
        for (int i = 0; i < words; i++) {
            int cp = utf32Word(src, off + ((long)i << 2), big);
            // Java accepts surrogate-valued UTF-32 through its decoder.
            if (!Character.isValidCodePoint(cp) || cp >= 0xd800 && cp <= 0xdfff) return null;
            if (latin1 && cp > 255) {
                nonLatinIndex = i;
                latin1 = false;
            }
            if (cp >= 0x10000) units++;
        }
        if (latin1) return decodeLatin1UTF32Words(src, off, words, big);
        if (len == 0) return "";
        if (!SimdUTF.isEligibleUTF32Decoding(len)) return null;
        byte[] value = StringUTF16.newBytesFor(units);
        if (SimdUTF.useScalarUTF32StringDecoding(len)) {
            return decodeShortUTF32(src, off, len, value, units, nonLatinIndex, big);
        }
        int written = SimdUTF.decodeUTF32Bytes(src, off, len, value, 0, units, big);
        return written == units ? newUTF16String(value, nonLatinIndex) : null;
    }

    private static String decodeLatin1UTF32Words(byte[] src, int off, int words, boolean big) {
        byte[] value = new byte[words];
        for (int i = 0; i < words; i++) {
            value[i] = (byte)utf32Word(src, off + ((long)i << 2), big);
        }
        return new String(value, String.LATIN1);
    }

    private static String decodeUTF16(Kind kind, byte[] src, MemorySegment segment, long off, int len) {
        boolean big = kind.big;
        int first = unit(src, segment, off, 2, true);
        if (kind.expectedOrder == 0) {
            if (first == 0xfeff || first == 0xfffe) {
                big = first == 0xfeff;
                off += 2;
                len -= 2;
            }
        }
        int units = len >> 1;
        boolean latin1 = String.COMPACT_STRINGS;
        int nonLatinIndex = -1;
        for (int i = 0; i < len; i += 2) {
            int cp = unit(src, segment, off + i, 2, big);
            if (latin1 && cp > 255) {
                nonLatinIndex = i >> 1;
                latin1 = false;
            }
            if (!latin1) {
                // Native UTF-16 validation checks the remainder before publishing.
                break;
            }
        }
        if (latin1) {
            byte[] value = new byte[units];
            for (int i = 0; i < units; i++) {
                value[i] = (byte)unit(src, segment, off + ((long)i << 1), 2, big);
            }
            return new String(value, String.LATIN1);
        }
        if (len == 0) return "";
        if (src != null && ((off & 1) != 0 || !SimdUTF.isEligible(len))) return null;
        byte[] value = StringUTF16.newBytesFor(units);
        if (src != null) {
            int written = SimdUTF.decodeUTF16Bytes(src, (int)off, len, value, 0, units, big);
            return written == units ? newUTF16String(value, nonLatinIndex) : null;
        }
        byte[] bytes = new byte[Math.min(len, 8192)];
        int consumed = 0;
        int written = 0;
        while (consumed < len) {
            int size = Math.min(bytes.length, len - consumed);
            MemorySegment.copy(segment, ValueLayout.JAVA_BYTE, off + consumed, bytes, 0, size);
            if (consumed + size < len
                    && Character.isHighSurrogate((char)unit(bytes, null, size - 2, 2, big))) {
                size -= 2;
            }
            int count = SimdUTF.decodeUTF16Bytes(bytes, 0, size, value, written, units - written, big);
            if (count < 0) {
                count = decodeTail(bytes, size, value, written, units - written, big);
                if (count < 0) return null;
            }
            consumed += size;
            written += count;
        }
        return written == units ? newUTF16String(value, nonLatinIndex) : null;
    }

    private static String newUTF16String(byte[] value, int nonLatinIndex) {
        // Input may change between the Latin-1 scan and conversion.
        if (String.COMPACT_STRINGS && (nonLatinIndex < 0
                || StringUTF16.getChar(value, nonLatinIndex) <= 255)) return null;
        return new String(value, String.UTF16);
    }

    private static String decodeShortUTF32(byte[] src, int off, int len,
                                          byte[] value, int capacity, int nonLatinIndex, boolean big) {
        int written = 0;
        for (int end = off + len; off < end; off += 4) {
            int cp = UNSAFE.getIntUnaligned(src, Unsafe.ARRAY_BYTE_BASE_OFFSET + (long)off, big);
            if (!Character.isValidCodePoint(cp) || cp >= 0xd800 && cp <= 0xdfff) return null;
            int size = cp >= 0x10000 ? 2 : 1;
            if (size > capacity - written) return null;
            if (size == 1) {
                StringUTF16.putChar(value, written++, cp);
            } else {
                StringUTF16.putChar(value, written++, Character.highSurrogate(cp));
                StringUTF16.putChar(value, written++, Character.lowSurrogate(cp));
            }
        }
        return written == capacity ? newUTF16String(value, nonLatinIndex) : null;
    }

    private static int decodeTail(byte[] src, int len, byte[] dst, int dp, int capacity,
                                  boolean big) {
        int written = 0;
        for (int i = 0; i < len; i += 2) {
            int cp = unit(src, null, i, 2, big);
            if (Character.isSurrogate((char)cp)) {
                if (!Character.isHighSurrogate((char)cp) || i + 2 >= len) return -1;
                char low = (char)unit(src, null, i + 2, 2, big);
                if (!Character.isLowSurrogate(low) || capacity - written < 2) return -1;
                StringUTF16.putChar(dst, dp + written++, cp);
                StringUTF16.putChar(dst, dp + written++, low);
                i += 2;
            } else {
                if (capacity == written) return -1;
                StringUTF16.putChar(dst, dp + written++, cp);
            }
        }
        return written;
    }

    private static void put(byte[] dst, int off, int cp, int width, boolean big) {
        for (int i = 0; i < width; i++) {
            dst[off + (big ? width - 1 - i : i)] = (byte)(cp >>> (i * 8));
        }
    }

    private static void encodeLatin1(byte[] src, int sp, int len, byte[] dst, int dp, Kind kind) {
        long offset = Unsafe.ARRAY_BYTE_BASE_OFFSET + (long)dp;
        if (kind.unit == 2) {
            for (int i = 0; i < len; i++) {
                UNSAFE.putShortUnaligned(dst, offset + ((long)i << 1),
                        (short)(src[sp + i] & 255), kind.big);
            }
        } else {
            for (int i = 0; i < len; i++) {
                UNSAFE.putIntUnaligned(dst, offset + ((long)i << 2), src[sp + i] & 255, kind.big);
            }
        }
    }

    static int encodeSegment(String string, MemorySegment segment, long offset,
                             Charset cs, int from, int len) {
        if (!SimdUTF.isEligible(len) || from < 0 || len > string.length() - from || segment.isMapped()) return -1;
        Kind kind = kind(cs);
        if (kind == null) return -1;
        byte[] value = string.value();
        byte coder = string.coder();
        if (coder == String.UTF16 && SimdUTF.validateUTF16(value, from, len, 0) != 1) return -1;
        int count = coder == String.UTF16 && kind.unit == 4
                ? StringUTF16.codePointCount(value, from, from + len) : len;
        int prefix = kind.emitBOM ? kind.unit : 0;
        long capacity = (long)count * kind.unit + prefix;
        if (capacity > Integer.MAX_VALUE) return -1;
        AbstractMemorySegmentImpl impl = (AbstractMemorySegmentImpl)segment;
        impl.checkAccess(offset, capacity, false);
        var session = impl.sessionImpl();
        session.acquire0();
        try {
            // A surrogate pair needs two input units even when UTF-32 emits one word.
            byte[] bytes = new byte[(int)Math.min(Math.max(capacity, 2L * kind.unit), 8192)];
            int written = 0;
            int consumed = 0;
            if (prefix != 0) {
                put(bytes, 0, 0xfeff, kind.unit, kind.big);
                MemorySegment.copy(bytes, 0, segment, ValueLayout.JAVA_BYTE, offset, prefix);
                written = prefix;
            }
            while (consumed < len) {
                int size = Math.min(bytes.length / kind.unit, len - consumed);
                if (coder == String.UTF16 && consumed + size < len
                        && Character.isHighSurrogate(StringUTF16.getChar(value, from + consumed + size - 1))) {
                    size--;
                }
                int n = -1;
                if (coder == String.LATIN1) {
                    encodeLatin1(value, from + consumed, size, bytes, 0, kind);
                    n = size * kind.unit;
                } else {
                    n = kind.unit == 2
                            ? SimdUTF.encodeUTF16Bytes(value, from + consumed, size,
                                    bytes, 0, bytes.length, kind.big)
                            : SimdUTF.encodeUTF32Bytes(value, from + consumed, size,
                                    bytes, 0, bytes.length, kind.big);
                }
                if (n < 0) {
                    // Validation above makes this fallback safe after earlier
                    // chunks have been committed, including a short final chunk.
                    n = 0;
                    for (int i = 0; i < size; i++) {
                        int cp = coder == String.LATIN1 ? value[from + consumed + i] & 255
                                : StringUTF16.getChar(value, from + consumed + i);
                        if (kind.unit == 4 && Character.isHighSurrogate((char)cp)) {
                            cp = Character.toCodePoint((char)cp,
                                    StringUTF16.getChar(value, from + consumed + ++i));
                        }
                        put(bytes, n, cp, kind.unit, kind.big);
                        n += kind.unit;
                    }
                }
                MemorySegment.copy(bytes, 0, segment, ValueLayout.JAVA_BYTE, offset + written, n);
                written += n;
                consumed += size;
            }
            return written;
        } finally {
            session.release0();
        }
    }

    static byte[] encode(Charset cs, byte coder, byte[] value) {
        int len = value.length >> coder;
        if (!SimdUTF.isEligible(len) && (len != 1 || !SimdUTF.isEnabled())) return null;
        Kind kind = kind(cs);
        if (kind == null) return null;
        if (len == 1 && coder == String.UTF16
                && Character.isSurrogate(StringUTF16.getChar(value, 0))) return null;
        int count = coder == String.UTF16 && kind.unit == 4 && len > 1
                ? StringUTF16.codePointCount(value, 0, len) : len;
        int prefix = kind.emitBOM ? kind.unit : 0;
        long capacity = (long)count * kind.unit + prefix;
        if (capacity > Integer.MAX_VALUE) return null;
        byte[] dst = new byte[(int)capacity];
        if (prefix != 0) put(dst, 0, 0xfeff, kind.unit, kind.big);
        if (coder == String.LATIN1) {
            encodeLatin1(value, 0, len, dst, prefix, kind);
            return dst;
        }
        if (len == 1) {
            put(dst, prefix, StringUTF16.getChar(value, 0), kind.unit, kind.big);
            return dst;
        }
        int written = kind.unit == 2
                ? SimdUTF.encodeUTF16Bytes(value, 0, len, dst, prefix, dst.length - prefix, kind.big)
                : SimdUTF.encodeUTF32Bytes(value, 0, len, dst, prefix, dst.length - prefix, kind.big);
        return written == dst.length - prefix ? dst : null;
    }
}
