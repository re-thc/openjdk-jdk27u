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
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

package jdk.test.lib.charset;

import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;

/** A small stateful encoder whose trailer must be emitted by flush. */
public final class StatefulTestCharset extends Charset {
    public StatefulTestCharset() {
        super("x-test-stateful", null);
    }

    public boolean contains(Charset cs) {
        return cs instanceof StatefulTestCharset;
    }

    public CharsetDecoder newDecoder() {
        throw new UnsupportedOperationException();
    }

    public CharsetEncoder newEncoder() {
        return new CharsetEncoder(this, 5, 8) {
            @Override
            public boolean isLegalReplacement(byte[] replacement) {
                return true;
            }

            @Override
            protected CoderResult encodeLoop(CharBuffer in, ByteBuffer out) {
                while (in.hasRemaining()) {
                    char c = in.get(in.position());
                    if (c != '\u3001' && c != '\u4e00') {
                        return CoderResult.unmappableForLength(1);
                    }
                    if (out.remaining() < 5) return CoderResult.OVERFLOW;
                    in.get();
                    out.put((byte) 0x1b).put((byte) 0x24).put((byte) 0x42);
                    out.put(c == '\u3001' ? (byte) 0x21 : (byte) 0x30);
                    out.put(c == '\u3001' ? (byte) 0x22 : (byte) 0x6c);
                }
                return CoderResult.UNDERFLOW;
            }

            @Override
            protected CoderResult implFlush(ByteBuffer out) {
                if (out.remaining() < 3) return CoderResult.OVERFLOW;
                out.put((byte) 0x1b).put((byte) 0x28).put((byte) 0x42);
                return CoderResult.UNDERFLOW;
            }
        };
    }
}
