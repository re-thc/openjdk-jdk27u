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
 * @summary Buffer.hashCode() equals the documented element-by-element value for every
 *          buffer type, storage, byte order, position and limit
 * @key randomness
 * @library /test/lib
 * @run main/othervm BufferHashCode
 * @run main/othervm -Xint BufferHashCode
 * @run main/othervm -XX:TieredStopAtLevel=1 BufferHashCode
 * @run main/othervm -XX:-TieredCompilation BufferHashCode
 */

import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.CharBuffer;
import java.nio.DoubleBuffer;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;
import java.nio.LongBuffer;
import java.nio.ShortBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.function.IntUnaryOperator;
import jdk.test.lib.RandomFactory;

public class BufferHashCode {
    private static final Random RANDOM = RandomFactory.getRandom();

    // A buffer, and its elements as the int that hashCode() adds for them.
    private record Case(String what, Buffer buffer, IntUnaryOperator element) {}

    // The value the specification of hashCode() describes, one element at a time.
    private static int reference(Case c) {
        int h = 1;
        for (int i = c.buffer().limit() - 1; i >= c.buffer().position(); i--) {
            h = 31 * h + c.element().applyAsInt(i);
        }
        return h;
    }

    private static ByteBuffer bytes(int size, boolean direct, ByteOrder order) {
        ByteBuffer bb = direct ? ByteBuffer.allocateDirect(size) : ByteBuffer.allocate(size);
        byte[] content = new byte[size];
        RANDOM.nextBytes(content);
        bb.put(0, content).order(order);
        // Special floating-point values: a NaN, a negative zero and an infinity.
        if (size >= 16) {
            bb.putFloat(0, Float.NaN).putFloat(4, -0.0f).putDouble(8, Double.NEGATIVE_INFINITY);
        }
        return bb;
    }

    private static List<Case> cases(int size) {
        List<Case> cases = new ArrayList<>();
        byte[] array = new byte[size];
        RANDOM.nextBytes(array);
        ByteBuffer heap = ByteBuffer.wrap(array);
        cases.add(new Case("byte heap", heap, i -> heap.get(i)));
        for (boolean direct : new boolean[] {false, true}) {
            for (ByteOrder order : new ByteOrder[] {ByteOrder.BIG_ENDIAN, ByteOrder.LITTLE_ENDIAN}) {
                String kind = (direct ? "direct " : "heap ") + order;
                ByteBuffer bb = bytes(size * 8, direct, order);
                cases.add(new Case("byte " + kind, bb, i -> bb.get(i)));
                CharBuffer cb = bb.asCharBuffer();
                cases.add(new Case("char " + kind, cb, i -> cb.get(i)));
                ShortBuffer sb = bb.asShortBuffer();
                cases.add(new Case("short " + kind, sb, i -> sb.get(i)));
                IntBuffer ib = bb.asIntBuffer();
                cases.add(new Case("int " + kind, ib, i -> ib.get(i)));
                LongBuffer lb = bb.asLongBuffer();
                cases.add(new Case("long " + kind, lb, i -> (int) lb.get(i)));
                FloatBuffer fb = bb.asFloatBuffer();
                cases.add(new Case("float " + kind, fb, i -> (int) fb.get(i)));
                DoubleBuffer db = bb.asDoubleBuffer();
                cases.add(new Case("double " + kind, db, i -> (int) db.get(i)));
                CharBuffer ro = bb.asReadOnlyBuffer().asCharBuffer();
                cases.add(new Case("read-only char " + kind, ro, i -> ro.get(i)));
            }
        }
        char[] chars = new char[size];
        for (int i = 0; i < size; i++) {
            chars[i] = (char) RANDOM.nextInt();
        }
        CharBuffer heapChars = CharBuffer.wrap(chars);
        cases.add(new Case("char heap", heapChars, i -> heapChars.get(i)));
        CharBuffer string = CharBuffer.wrap(new String(chars));
        cases.add(new Case("char string", string, i -> string.get(i)));
        int[] ints = RANDOM.ints(size).toArray();
        IntBuffer heapInts = IntBuffer.wrap(ints);
        cases.add(new Case("int heap", heapInts, i -> heapInts.get(i)));
        long[] longs = RANDOM.longs(size).toArray();
        LongBuffer heapLongs = LongBuffer.wrap(longs);
        cases.add(new Case("long heap", heapLongs, i -> (int) heapLongs.get(i)));
        double[] doubles = RANDOM.doubles(size).map(d -> (d - 0.5) * 1e12).toArray();
        DoubleBuffer heapDoubles = DoubleBuffer.wrap(doubles);
        cases.add(new Case("double heap", heapDoubles, i -> (int) heapDoubles.get(i)));
        return cases;
    }

    public static void main(String[] args) {
        for (int round = 0; round < 50; round++) {
            for (int size : new int[] {0, 1, 2, 3, 4, 5, 7, 8, 9, 17, 64, 1000}) {
                for (Case c : cases(size)) {
                    Buffer b = c.buffer();
                    int capacity = b.capacity();
                    // The whole buffer, then a random range.
                    for (int range = 0; range < 2; range++) {
                        if (range == 1 && capacity > 0) {
                            int position = RANDOM.nextInt(capacity + 1);
                            int limit = position + RANDOM.nextInt(capacity - position + 1);
                            b.limit(limit).position(position);
                        }
                        int expected = reference(c);
                        int actual = b.hashCode();
                        if (actual != expected) {
                            throw new AssertionError(c.what() + ", size " + size + ", position " + b.position()
                                                     + ", limit " + b.limit() + ": hashCode " + actual
                                                     + ", expected " + expected);
                        }
                    }
                }
            }
        }
    }
}
