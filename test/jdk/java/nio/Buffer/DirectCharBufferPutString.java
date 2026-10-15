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

/*
 * @test
 * @summary Direct CharBuffer.put(String, int, int) and append(String) copy the requested
 *          range in both byte orders, on either side of the bulk-copy threshold, and keep
 *          their precondition checks
 * @run main DirectCharBufferPutString
 */

import java.nio.BufferOverflowException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.CharBuffer;
import java.nio.ReadOnlyBufferException;

public class DirectCharBufferPutString {
    private static final int CAPACITY = 5000;

    private static String text(int length, boolean latin1) {
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append((char) (latin1 ? 'a' + i % 26 : 0x3b1 + i % 997));
        }
        return sb.toString();
    }

    private static void check(boolean condition, String message) {
        if (!condition) {
            throw new AssertionError(message);
        }
    }

    private static void expect(Class<? extends RuntimeException> type, Runnable action, String what) {
        try {
            action.run();
        } catch (RuntimeException e) {
            if (type.isInstance(e)) {
                return;
            }
            throw new AssertionError(what + ": unexpected " + e, e);
        }
        throw new AssertionError(what + ": expected " + type.getSimpleName());
    }

    private static void verify(CharBuffer cb, int position, String src, int start, int end, String what) {
        check(cb.position() == position + end - start, what + ": position " + cb.position());
        for (int i = 0; i < end - start; i++) {
            check(cb.get(position + i) == src.charAt(start + i), what + ": char " + i);
        }
        // Neighbouring chars are untouched.
        check(position == 0 || cb.get(position - 1) == '#', what + ": before");
        check(cb.position() == cb.limit() || cb.get(cb.position()) == '#', what + ": after");
    }

    private static CharBuffer fresh(ByteOrder order) {
        CharBuffer cb = ByteBuffer.allocateDirect(2 * CAPACITY + 2).order(order).asCharBuffer();
        check(cb.isDirect(), "direct view");
        while (cb.hasRemaining()) {
            cb.put('#');
        }
        return cb.clear();
    }

    public static void main(String[] args) {
        for (ByteOrder order : new ByteOrder[] {ByteOrder.nativeOrder(), ByteOrder.BIG_ENDIAN,
                                                ByteOrder.LITTLE_ENDIAN}) {
            for (boolean latin1 : new boolean[] {true, false}) {
                String src = text(4100, latin1);
                for (int length : new int[] {0, 1, 7, 31, 32, 33, 63, 64, 65, 1023, 1024, 1025, 2049, 4097}) {
                    for (int start : new int[] {0, 1, 3}) {
                        int end = start + length;
                        String what = order + "/" + (latin1 ? "latin1" : "utf16") + "/" + start + "+" + length;
                        CharBuffer cb = fresh(order).position(5);
                        check(cb.put(src, start, end) == cb, what + ": returns this");
                        verify(cb, 5, src, start, end, what);

                        cb = fresh(order).position(2);
                        cb.append(src, start, end);
                        verify(cb, 2, src, start, end, what + "/append");

                        cb = fresh(order).position(1);
                        cb.put(src.substring(start, end));
                        verify(cb, 1, src.substring(start, end), 0, length, what + "/whole");
                    }
                }

                // Preconditions are checked before any char is written.
                CharBuffer cb = fresh(order).position(3);
                CharBuffer target = cb;
                expect(IndexOutOfBoundsException.class, () -> target.put(src, -1, 2), "negative start");
                expect(IndexOutOfBoundsException.class, () -> target.put(src, 5, 4), "end before start");
                expect(IndexOutOfBoundsException.class, () -> target.put(src, 0, src.length() + 1), "end");
                check(cb.position() == 3 && cb.get(3) == '#', "no write after IndexOutOfBoundsException");
                cb.limit(10);
                expect(BufferOverflowException.class, () -> target.put(src, 0, 8), "overflow");
                expect(BufferOverflowException.class, () -> target.put(src, 0, 100), "bulk overflow");
                check(cb.position() == 3 && cb.get(3) == '#', "no write after BufferOverflowException");
                // An invalid range is reported before an overflow.
                expect(IndexOutOfBoundsException.class, () -> target.put("abc", 0, 8), "range first");
                CharBuffer readOnly = target.asReadOnlyBuffer();
                expect(ReadOnlyBufferException.class, () -> readOnly.put(src, 0, 2), "read-only");
                // Read-only is reported before an overflow, and after an invalid range.
                expect(ReadOnlyBufferException.class, () -> readOnly.put(src, 0, 100), "read-only overflow");
                expect(ReadOnlyBufferException.class, () -> readOnly.append(src, 0, 100), "read-only append");
                expect(IndexOutOfBoundsException.class, () -> readOnly.put("abc", 0, 8), "read-only range");
                check(cb.get(3) == '#', "no write through a read-only view");
            }
        }
    }
}
