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
import jdk.internal.util.SimdUTF;
import sun.nio.cs.*;

/** Valid-input specializations; null requests the existing charset fallback. */
final class StringCodingWide {
    private StringCodingWide() { }

    private static final class SegmentLayouts {
        private static final ValueLayout.OfChar CHAR_BE = ValueLayout.JAVA_CHAR_UNALIGNED.withOrder(ByteOrder.BIG_ENDIAN);
        private static final ValueLayout.OfChar CHAR_LE = ValueLayout.JAVA_CHAR_UNALIGNED.withOrder(ByteOrder.LITTLE_ENDIAN);
        private static final ValueLayout.OfInt INT_BE = ValueLayout.JAVA_INT_UNALIGNED.withOrder(ByteOrder.BIG_ENDIAN);
        private static final ValueLayout.OfInt INT_LE = ValueLayout.JAVA_INT_UNALIGNED.withOrder(ByteOrder.LITTLE_ENDIAN);
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
            return width == 2 ? segment.get(big ? SegmentLayouts.CHAR_BE : SegmentLayouts.CHAR_LE, offset)
                    : segment.get(big ? SegmentLayouts.INT_BE : SegmentLayouts.INT_LE, offset);
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
        if (segment.isMapped()) return null;
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
        for (int i = 0; i < len; i += kind.unit) {
            int cp = unit(src, segment, off + i, kind.unit, big);
            latin1 &= cp >= 0 && cp <= 255;
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
            int written = kind.unit == 2
                    ? SimdUTF.decodeUTF16Bytes(src, (int)off, len, value, 0, units, big)
                    : SimdUTF.decodeUTF32Bytes(src, (int)off, len, value, 0, units, big);
            return written == units ? new String(value, String.UTF16) : null;
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
            int count = kind.unit == 2
                    ? SimdUTF.decodeUTF16Bytes(bytes, 0, size, value, written, units - written, big)
                    : SimdUTF.decodeUTF32Bytes(bytes, 0, size, value, written, units - written, big);
            if (count < 0) {
                count = decodeTail(bytes, size, value, written, units - written, kind.unit, big);
                if (count < 0) return null;
            }
            consumed += size;
            written += count;
        }
        return written == units ? new String(value, String.UTF16) : null;
    }

    private static int decodeTail(byte[] src, int len, byte[] dst, int dp, int capacity,
                                  int width, boolean big) {
        int written = 0;
        for (int i = 0; i < len; i += width) {
            int cp = unit(src, null, i, width, big);
            if (width == 2 && Character.isSurrogate((char)cp)) {
                if (!Character.isHighSurrogate((char)cp) || i + 2 >= len) return -1;
                char low = (char)unit(src, null, i + 2, 2, big);
                if (!Character.isLowSurrogate(low) || capacity - written < 2) return -1;
                StringUTF16.putChar(dst, dp + written++, cp);
                StringUTF16.putChar(dst, dp + written++, low);
                i += 2;
            } else if (width == 4 && cp >= 0x10000) {
                if (!Character.isValidCodePoint(cp) || capacity - written < 2) return -1;
                StringUTF16.putChar(dst, dp + written++, Character.highSurrogate(cp));
                StringUTF16.putChar(dst, dp + written++, Character.lowSurrogate(cp));
            } else {
                if (cp < 0 || capacity == written || cp >= 0xd800 && cp <= 0xdfff) return -1;
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
                if (coder == String.UTF16) {
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
        if (!SimdUTF.isEligible(len)) return null;
        Kind kind = kind(cs);
        if (kind == null) return null;
        int count = coder == String.UTF16 && kind.unit == 4
                ? StringUTF16.codePointCount(value, 0, len) : len;
        int prefix = kind.emitBOM ? kind.unit : 0;
        long capacity = (long)count * kind.unit + prefix;
        if (capacity > Integer.MAX_VALUE) return null;
        byte[] dst = new byte[(int)capacity];
        if (prefix != 0) put(dst, 0, 0xfeff, kind.unit, kind.big);
        if (coder == String.LATIN1) {
            for (int i = 0; i < len; i++) {
                put(dst, prefix + i * kind.unit, value[i] & 255, kind.unit, kind.big);
            }
            return dst;
        }
        int written = kind.unit == 2
                ? SimdUTF.encodeUTF16Bytes(value, 0, len, dst, prefix, dst.length - prefix, kind.big)
                : SimdUTF.encodeUTF32Bytes(value, 0, len, dst, prefix, dst.length - prefix, kind.big);
        return written == dst.length - prefix ? dst : null;
    }
}
