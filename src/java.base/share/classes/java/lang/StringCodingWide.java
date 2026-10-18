/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
import jdk.internal.foreign.AbstractMemorySegmentImpl;
import jdk.internal.misc.Unsafe;
import jdk.internal.util.SimdUTF;
import jdk.internal.vm.annotation.ForceInline;
import sun.nio.cs.*;

/** Valid-input specializations; null requests the existing charset fallback. */
final class StringCodingWide {
    private static final Unsafe UNSAFE = Unsafe.getUnsafe();

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
        return kind(cs) != null;
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

    private static int unit(byte[] src, MemorySegment segment, long offset, int width, boolean big) {
        if (src == null) {
            return segment.get(big ? SegmentLayouts.CHAR_BE : SegmentLayouts.CHAR_LE, offset);
        }
        int off = (int)offset;
        if (width == 2) {
            return big ? (src[off] & 255) << 8 | src[off + 1] & 255
                    : (src[off + 1] & 255) << 8 | src[off] & 255;
        }
        return big ? src[off] << 24 | (src[off + 1] & 255) << 16
                        | (src[off + 2] & 255) << 8 | src[off + 3] & 255
                : src[off + 3] << 24 | (src[off + 2] & 255) << 16
                        | (src[off + 1] & 255) << 8 | src[off] & 255;
    }

    static String decode(Charset cs, byte[] src, int off, int len) {
        return decode(cs, src, null, off, len);
    }

    static String decodeSegment(MemorySegment segment, long off, int len, Charset cs) {
        if (!SimdUTF.isEligible(len) || segment.isMapped()) return null;
        Kind kind = kind(cs);
        // Leave UTF-32 length discovery to the array decoder.
        if (kind == null || kind.unit == 4) return null;
        return decode(cs, null, segment, off, len);
    }

    private static String decode(Charset cs, byte[] src, MemorySegment segment, long off, int len) {
        if (!SimdUTF.isEligible(len)) return null;
        Kind kind = kind(cs);
        if (kind == null || (len & (kind.unit - 1)) != 0) return null;
        boolean big = kind.big;
        int first = unit(src, segment, off, kind.unit, true);
        if (kind.unit == 2 && kind.expectedOrder == 0) {
            if (first == 0xfeff || first == 0xfffe) {
                big = first == 0xfeff;
                off += 2;
                len -= 2;
            }
        } else if (kind.unit == 4) {
            if (first == 0xfeff && kind.expectedOrder != -1) {
                big = true;
                off += 4;
                len -= 4;
            } else if (first == 0xfffe0000 && kind.expectedOrder != 1) {
                big = false;
                off += 4;
                len -= 4;
            }
        }
        int units = len / kind.unit;
        boolean latin1 = String.COMPACT_STRINGS;
        int nonLatinIndex = -1;
        for (int i = 0; i < len; i += kind.unit) {
            int cp = unit(src, segment, off + i, kind.unit, big);
            if (latin1 && (cp < 0 || cp > 255)) {
                nonLatinIndex = i / kind.unit + units - len / kind.unit;
                latin1 = false;
            }
            if (kind.unit == 4) {
                // Java's UTF-32 decoder accepts surrogate-valued code points.
                // Leave that dialect, and malformed input, to its decoder.
                if (!Character.isValidCodePoint(cp) || cp >= 0xd800 && cp <= 0xdfff) return null;
                if (cp >= 0x10000) units++;
            } else if (!latin1) {
                // Native UTF-16 validation checks the remainder before publishing.
                break;
            }
        }
        if (latin1) {
            byte[] value = new byte[units];
            for (int i = 0; i < units; i++) {
                value[i] = (byte)unit(src, segment, off + (long)i * kind.unit, kind.unit, big);
            }
            return new String(value, String.LATIN1);
        }
        if (len == 0) return "";
        if (src != null && !(kind.unit == 4
                ? SimdUTF.isEligibleUTF32Decoding(len) : SimdUTF.isEligible(len))) return null;
        byte[] value = StringUTF16.newBytesFor(units);
        if (src != null) {
            if (kind.unit == 4 && SimdUTF.useScalarUTF32StringDecoding(len)) {
                return decodeShortUTF32(src, (int)off, len, value, units, nonLatinIndex, big);
            }
            int written = kind.unit == 2
                    ? SimdUTF.decodeUTF16Bytes(src, (int)off, len, value, 0, units, big)
                    : SimdUTF.decodeUTF32Bytes(src, (int)off, len, value, 0, units, big);
            return written == units ? newUTF16String(value, nonLatinIndex) : null;
        }
        byte[] bytes = new byte[Math.min(len, 8192)];
        int consumed = 0;
        int written = 0;
        while (consumed < len) {
            int size = Math.min(bytes.length, len - consumed);
            MemorySegment.copy(segment, ValueLayout.JAVA_BYTE, off + consumed, bytes, 0, size);
            if (kind.unit == 2 && consumed + size < len
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
