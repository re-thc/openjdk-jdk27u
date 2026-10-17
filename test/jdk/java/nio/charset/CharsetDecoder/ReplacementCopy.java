/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 *
 */

/*
 * @test id=portable
 * @summary Decoder replacements preserve buffer contents, positions, marks and overflow semantics
 * @run main/othervm -Xint ReplacementCopy
 */

/*
 * @test id=compiled
 * @summary Decoder replacement copying in C1 and C2
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 ReplacementCopy
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 ReplacementCopy
 */

import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.ReadOnlyBufferException;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CoderResult;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;

public class ReplacementCopy {
    private static final int OFFSET = 3;
    private static final char GUARD = '\u5555';

    private static CharsetDecoder decoder(String replacement) {
        return new CharsetDecoder(StandardCharsets.UTF_8, 1, 2) {
            @Override
            protected CoderResult decodeLoop(ByteBuffer input, CharBuffer output) {
                return input.hasRemaining() ? CoderResult.malformedForLength(1)
                                            : CoderResult.UNDERFLOW;
            }
        }.onMalformedInput(CodingErrorAction.REPLACE).replaceWith(replacement);
    }

    private static void check(String replacement, int capacity,
                              boolean direct, boolean readOnly, boolean end) {
        int length = OFFSET + capacity + 2;
        CharBuffer storage = direct ? ByteBuffer.allocateDirect(length * 2).asCharBuffer()
                                    : CharBuffer.allocate(length);
        for (int i = 0; i < length; i++) {
            storage.put(i, GUARD);
        }
        CharBuffer output = storage.duplicate();
        output.position(OFFSET).limit(OFFSET + capacity);
        if (readOnly) {
            output = output.asReadOnlyBuffer();
        }
        output.mark();
        ByteBuffer input = ByteBuffer.allocate(7);
        input.limit(5).position(2).mark();

        int consumed = 0;
        try {
            CoderResult result = decoder(replacement).decode(input, output, end);
            require(!readOnly || capacity < replacement.length(), "missing read-only failure");
            consumed = Math.min(3, capacity / replacement.length());
            require(consumed == 3 ? result.isUnderflow() : result.isOverflow(), "result");
        } catch (ReadOnlyBufferException expected) {
            require(readOnly && capacity >= replacement.length(), "unexpected read-only failure");
        }
        String expected = replacement.repeat(consumed);
        require(input.position() == 2 + consumed && input.limit() == 5, "input positions");
        require(output.position() == OFFSET + expected.length()
                && output.limit() == OFFSET + capacity, "output positions");
        for (int i = 0; i < length; i++) {
            char value = i >= OFFSET && i < OFFSET + expected.length()
                    ? expected.charAt(i - OFFSET) : GUARD;
            require(storage.get(i) == value, "output contents or guards");
        }
        input.reset();
        output.reset();
        require(input.position() == 2 && output.position() == OFFSET, "marks");
    }

    private static void require(boolean condition, String message) {
        if (!condition) {
            throw new AssertionError(message);
        }
    }

    public static void main(String[] args) {
        for (int round = 0; round < 20; round++) {
            for (String replacement : new String[]{"\uFFFD", "x", "\u00E9", "\uD800",
                                                   "xy", "\uD83D\uDE03"}) {
                for (int capacity = 0; capacity <= 3 * replacement.length() + 1; capacity++) {
                    for (boolean direct : new boolean[]{false, true}) {
                        for (boolean readOnly : new boolean[]{false, true}) {
                            for (boolean end : new boolean[]{false, true}) {
                                check(replacement, capacity, direct, readOnly, end);
                            }
                        }
                    }
                }
            }
        }
    }
}
