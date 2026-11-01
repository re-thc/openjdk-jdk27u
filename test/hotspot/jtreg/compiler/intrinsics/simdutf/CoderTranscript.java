/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
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

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;
import java.util.Random;

/**
 * Drives a Charset coder through windows of input and output and records
 * everything observable: the converted data, every malformed result with its
 * position, and the buffer positions after each call.
 *
 * The coder loops convert long ranges through a bulk step and short ranges
 * element by element, so one input yields two transcripts: a large window that
 * reaches the bulk step, and a window shorter than any bulk threshold that
 * only the element loops can serve. They must be identical.
 */
public class CoderTranscript {
    /** Window sizes that stay below every bulk threshold. */
    public static final int SHORT_BYTES = 24;
    public static final int SHORT_CHARS = 24;

    /** Storage of a buffer under test. */
    public enum Kind {
        HEAP,           // array-backed, at an offset of 3 bytes or 2 chars in a larger array
        HEAP_ALIGNED,   // array-backed, at an offset of 8 bytes or 4 chars
        DIRECT,         // direct, aligned
        DIRECT_ODD,     // direct, starting at an odd address
        READ_ONLY,      // read-only heap buffer, which has no accessible array
        SWAPPED,        // char view with the byte order opposite to the host
        STRING          // CharBuffer.wrap(String): no storage at all
    }

    private static final ByteOrder FOREIGN =
            ByteOrder.nativeOrder() == ByteOrder.LITTLE_ENDIAN ? ByteOrder.BIG_ENDIAN : ByteOrder.LITTLE_ENDIAN;

    private static ByteBuffer rawBytes(Kind kind, int length) {
        switch (kind) {
            case DIRECT:
            case SWAPPED:
                return ByteBuffer.allocateDirect(length);
            case DIRECT_ODD:
                return ByteBuffer.allocateDirect(length + 1).position(1).slice();
            case HEAP_ALIGNED:
                return ByteBuffer.allocate(length + 15).position(8).slice();
            default:
                return ByteBuffer.allocate(length + 7).position(3).slice();
        }
    }

    /** A byte buffer holding data, with position 0 and limit data.length. */
    public static ByteBuffer bytesOf(Kind kind, byte[] data) {
        ByteBuffer b = rawBytes(kind, data.length);
        b.put(data).flip();
        return kind == Kind.READ_ONLY ? b.asReadOnlyBuffer() : b;
    }

    /** An empty byte buffer with the given capacity. */
    public static ByteBuffer emptyBytes(Kind kind, int capacity) {
        ByteBuffer b = rawBytes(kind, capacity);
        return b;
    }

    private static CharBuffer charView(Kind kind, int length) {
        switch (kind) {
            case DIRECT:
                return ByteBuffer.allocateDirect(length * 2).order(ByteOrder.nativeOrder()).asCharBuffer();
            case DIRECT_ODD:
                return ByteBuffer.allocateDirect(length * 2 + 1).position(1).slice()
                        .order(ByteOrder.nativeOrder()).asCharBuffer();
            case SWAPPED:
                return ByteBuffer.allocateDirect(length * 2).order(FOREIGN).asCharBuffer();
            case HEAP_ALIGNED:
                return CharBuffer.allocate(length + 9).position(4).slice();
            default:
                return CharBuffer.allocate(length + 5).position(2).slice();
        }
    }

    /** A char buffer holding data, with position 0 and limit data.length. */
    public static CharBuffer charsOf(Kind kind, char[] data) {
        if (kind == Kind.STRING) {
            return CharBuffer.wrap(new String(data));
        }
        CharBuffer c = charView(kind, data.length);
        c.put(data).flip();
        return kind == Kind.READ_ONLY ? c.asReadOnlyBuffer() : c;
    }

    /** An empty char buffer with the given capacity. */
    public static CharBuffer emptyChars(Kind kind, int capacity) {
        return charView(kind, capacity);
    }

    private static void hex(StringBuilder sb, ByteBuffer b) {
        for (int i = 0; i < b.remaining(); i++) {
            sb.append(Character.forDigit((b.get(b.position() + i) >> 4) & 15, 16))
              .append(Character.forDigit(b.get(b.position() + i) & 15, 16));
        }
    }

    /**
     * Decodes data with the charset, feeding window bytes at a time into a buffer of
     * the given kind and collecting output through a char buffer of capacity outCapacity.
     * Malformed input is reported, recorded and skipped, as REPLACE would.
     */
    public static String decode(Charset charset, byte[] data, Kind srcKind, Kind dstKind,
                                int window, int outCapacity) {
        CharsetDecoder decoder = charset.newDecoder();
        ByteBuffer in = bytesOf(srcKind, data);
        CharBuffer out = emptyChars(dstKind, outCapacity);
        StringBuilder text = new StringBuilder();
        StringBuilder events = new StringBuilder();
        int limit = Math.min(data.length, window);
        in.limit(limit);
        for (int calls = 0; ; calls++) {
            if (calls > 4 * data.length + 100) {
                throw new AssertionError("no progress");
            }
            boolean last = limit == data.length;
            CoderResult result = decoder.decode(in, out, last);
            out.flip();
            text.append(out);
            out.clear();
            if (result.isOverflow()) {
                continue;
            }
            if (result.isMalformed() || result.isUnmappable()) {
                events.append(result).append('@').append(in.position()).append(';');
                in.position(in.position() + result.length());
                text.append('\uFFFD');
                continue;
            }
            if (last) {
                break;
            }
            limit = Math.min(data.length, limit + window);
            in.limit(limit);
        }
        CoderResult flushed = decoder.flush(out);
        if (!flushed.isUnderflow()) {
            throw new AssertionError(flushed);
        }
        out.flip();
        text.append(out);
        return text.toString().length() + ":" + text + "|" + events;
    }

    /**
     * Encodes data with the charset, feeding window chars at a time and collecting
     * output through a byte buffer of capacity outCapacity. Malformed input is
     * reported, recorded and skipped, as REPLACE would, without a replacement.
     */
    public static String encode(Charset charset, char[] data, Kind srcKind, Kind dstKind,
                                int window, int outCapacity) {
        CharsetEncoder encoder = charset.newEncoder();
        CharBuffer in = charsOf(srcKind, data);
        ByteBuffer out = emptyBytes(dstKind, outCapacity);
        StringBuilder bytes = new StringBuilder();
        StringBuilder events = new StringBuilder();
        int limit = Math.min(data.length, window);
        in.limit(limit);
        for (int calls = 0; ; calls++) {
            if (calls > 4 * data.length + 100) {
                throw new AssertionError("no progress");
            }
            boolean last = limit == data.length;
            CoderResult result = encoder.encode(in, out, last);
            out.flip();
            hex(bytes, out);
            out.clear();
            if (result.isOverflow()) {
                continue;
            }
            if (result.isMalformed() || result.isUnmappable()) {
                events.append(result).append('@').append(in.position()).append(';');
                in.position(in.position() + result.length());
                continue;
            }
            if (last) {
                break;
            }
            limit = Math.min(data.length, limit + window);
            in.limit(limit);
        }
        CoderResult flushed = encoder.flush(out);
        if (!flushed.isUnderflow()) {
            throw new AssertionError(flushed);
        }
        out.flip();
        hex(bytes, out);
        return bytes + "|" + events;
    }

    /** Random text mixing every UTF-8 length class and all UTF-16 surrogate shapes. */
    public static char[] randomChars(Random random, int length, boolean unpaired) {
        char[] chars = new char[length];
        for (int i = 0; i < length; i++) {
            int kind = random.nextInt(12);
            char c;
            if (kind < 4) {
                c = (char) random.nextInt(0x80);
            } else if (kind < 6) {
                c = (char) (0x80 + random.nextInt(0x780));
            } else if (kind < 9) {
                do {
                    c = (char) (0x800 + random.nextInt(0xf800));
                } while (Character.isSurrogate(c));
            } else if (i + 1 < length) {
                chars[i++] = (char) (0xd800 + random.nextInt(0x400));
                c = (char) (0xdc00 + random.nextInt(0x400));
            } else {
                c = 'z';
            }
            chars[i] = c;
        }
        if (unpaired) {
            for (int n = 1 + random.nextInt(3); n > 0 && length > 0; n--) {
                int at = random.nextInt(4) == 0 ? length - 1 : random.nextInt(length);
                chars[at] = random.nextBoolean() ? (char) (0xd800 + random.nextInt(0x400))
                                                  : (char) (0xdc00 + random.nextInt(0x400));
            }
        }
        return chars;
    }
}
