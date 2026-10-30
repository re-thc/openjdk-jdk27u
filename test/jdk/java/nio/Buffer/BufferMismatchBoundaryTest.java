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
 * @summary Check mismatch consumers across heap, direct, mapped and typed buffer boundaries
 * @modules java.base/jdk.internal.misc
 * @run main/othervm BufferMismatchBoundaryTest
 * @run main/othervm/timeout=480 -Xint BufferMismatchBoundaryTest
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 BufferMismatchBoundaryTest
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=1000 BufferMismatchBoundaryTest
 * @run main/othervm -Xbatch -XX:+UnlockDiagnosticVMOptions -XX:-UseVectorizedMismatchIntrinsic BufferMismatchBoundaryTest
 */

import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.CharBuffer;
import java.nio.DoubleBuffer;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;
import java.nio.LongBuffer;
import java.nio.ShortBuffer;
import java.nio.channels.FileChannel;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import jdk.internal.misc.Unsafe;

public class BufferMismatchBoundaryTest {
    private static final int CAPACITY = (1 << 20) + 32;
    private static final int[] SIZES = {0, 1, 2, 3, 4, 7, 8, 15, 16, 31, 32, 63, 64,
            65, 127, 128, 129, 255, 256, 257, 4095, 4096, 4097, 65535, 65536, 65537,
            (1 << 20) - 1, 1 << 20};

    private static void equal(long actual, long expected) {
        if (actual != expected) {
            throw new AssertionError(actual + " != " + expected);
        }
    }

    private static void check(ByteBuffer a, ByteBuffer b, int expected) {
        int ap = a.position(), bp = b.position();
        int al = a.limit(), bl = b.limit();
        a.mark();
        b.mark();
        equal(a.mismatch(b), expected);
        equal(b.mismatch(a), expected);
        if (a.equals(b) != (expected < 0)) {
            throw new AssertionError("equals disagrees with mismatch");
        }
        int compare = expected < 0 ? 0 : expected < Math.min(a.remaining(), b.remaining())
                ? Byte.compare(a.get(ap + expected), b.get(bp + expected))
                : Integer.compare(a.remaining(), b.remaining());
        equal(Integer.signum(a.compareTo(b)), Integer.signum(compare));
        equal(Integer.signum(b.compareTo(a)), -Integer.signum(compare));
        equal(a.position(), ap);
        equal(b.position(), bp);
        equal(a.limit(), al);
        equal(b.limit(), bl);
        a.reset();
        b.reset();
    }

    private static void bytes(ByteBuffer a, ByteBuffer b) {
        ByteBuffer warmA = a.slice(0, 128), warmB = b.slice(0, 128);
        for (int i = 0; i < 5000; i++) {
            equal(warmA.mismatch(warmB), -1);
        }
        for (int size : SIZES) {
            for (int offset : new int[] {0, 1, 7}) {
                ByteBuffer left = a.duplicate().position(offset).limit(offset + size);
                int other = (offset + 3) & 7;
                ByteBuffer right = b.duplicate().position(other).limit(other + size);
                b.put(other + size, (byte) -1);
                check(left, right, -1);
                check(left.asReadOnlyBuffer(), right.asReadOnlyBuffer(), -1);
                check(left, left.duplicate(), -1);
                if (size == 0) {
                    b.put(other, (byte) 0);
                    continue;
                }
                check(left, right.duplicate().limit(right.limit() - 1), size - 1);
                int[] positions = size <= 65 ? null
                        : new int[] {0, 1, 7, 31, 32, 63, 64, size / 2, size - 1};
                for (int i = 0; i < (positions == null ? size : positions.length); i++) {
                    int position = positions == null ? i : positions[i];
                    // Signed byte ordering differs from an unsigned native memcmp.
                    right.put(other + position, (byte) -1);
                    check(left, right, position);
                    check(left.asReadOnlyBuffer(), right.asReadOnlyBuffer(), position);
                    right.put(other + position, (byte) 0);
                }
                b.put(other + size, (byte) 0);
            }
        }
    }

    private enum Kind {
        CHAR(2), SHORT(2), INT(4), LONG(8), FLOAT(4), DOUBLE(8);

        final int byteWidth;

        Kind(int byteWidth) {
            this.byteWidth = byteWidth;
        }
        Buffer view(ByteBuffer b) {
            return switch (this) {
                case CHAR -> b.asCharBuffer();
                case SHORT -> b.asShortBuffer();
                case INT -> b.asIntBuffer();
                case LONG -> b.asLongBuffer();
                case FLOAT -> b.asFloatBuffer();
                case DOUBLE -> b.asDoubleBuffer();
            };
        }
        int mismatch(Buffer a, Buffer b) {
            return switch (this) {
                case CHAR -> ((CharBuffer) a).mismatch((CharBuffer) b);
                case SHORT -> ((ShortBuffer) a).mismatch((ShortBuffer) b);
                case INT -> ((IntBuffer) a).mismatch((IntBuffer) b);
                case LONG -> ((LongBuffer) a).mismatch((LongBuffer) b);
                case FLOAT -> ((FloatBuffer) a).mismatch((FloatBuffer) b);
                case DOUBLE -> ((DoubleBuffer) a).mismatch((DoubleBuffer) b);
            };
        }
        int compare(Buffer a, Buffer b) {
            return switch (this) {
                case CHAR -> ((CharBuffer) a).compareTo((CharBuffer) b);
                case SHORT -> ((ShortBuffer) a).compareTo((ShortBuffer) b);
                case INT -> ((IntBuffer) a).compareTo((IntBuffer) b);
                case LONG -> ((LongBuffer) a).compareTo((LongBuffer) b);
                case FLOAT -> ((FloatBuffer) a).compareTo((FloatBuffer) b);
                case DOUBLE -> ((DoubleBuffer) a).compareTo((DoubleBuffer) b);
            };
        }
        void put(Buffer b, int i, int value) {
            switch (this) {
                case CHAR -> ((CharBuffer) b).put(i, (char) value);
                case SHORT -> ((ShortBuffer) b).put(i, (short) value);
                case INT -> ((IntBuffer) b).put(i, value);
                case LONG -> ((LongBuffer) b).put(i, value);
                case FLOAT -> ((FloatBuffer) b).put(i, value);
                case DOUBLE -> ((DoubleBuffer) b).put(i, value);
            }
        }
        void check(Buffer a, Buffer b, int expected) {
            int ap = a.position(), bp = b.position();
            equal(mismatch(a, b), expected);
            equal(mismatch(b, a), expected);
            if (a.equals(b) != (expected < 0)) throw new AssertionError(this);
            equal(Integer.signum(compare(a, b)), expected < 0 ? 0 : -1);
            equal(a.position(), ap);
            equal(b.position(), bp);
        }
    }

    private static void typed(ByteBuffer a, ByteBuffer b) {
        for (Kind kind : Kind.values()) {
            for (int offset : new int[] {0, 1, 7}) {
                for (ByteOrder order : new ByteOrder[] {ByteOrder.BIG_ENDIAN, ByteOrder.LITTLE_ENDIAN}) {
                    Buffer left = kind.view(a.slice(offset, 131104).order(ByteOrder.BIG_ENDIAN));
                    Buffer right = kind.view(b.slice((offset + 3) & 7, 131104).order(order));
                    // Nonzero positions make the result relative to the remaining region.
                    for (int i = 0; i < left.capacity(); i++) kind.put(left, i, 42);
                    for (int i = 0; i < right.capacity(); i++) kind.put(right, i, 42);
                    left.position(1);
                    right.position(2);
                    int boundary = 65536 / kind.byteWidth;
                    for (int size : new int[] {0, 1, 2, 3, 4, 7, 8, 15, 16, 31, 32, 33, 63, 64,
                            65, 1024, boundary - 1, boundary, boundary + 1, 2 * boundary}) {
                        left.limit(1 + size);
                        right.limit(2 + size);
                        right.limit(right.capacity());
                        kind.put(right, 2 + size, 43);
                        right.limit(2 + size);
                        kind.check(left, right, -1);
                        right.limit(right.capacity());
                        kind.put(right, 2 + size, 42);
                        right.limit(2 + size);
                        for (int pos : new int[] {0, Math.min(1, size - 1),
                                Math.min(7 / kind.byteWidth, size - 1), size / 2, size - 1}) {
                            if (size == 0) continue;
                            kind.put(right, 2 + pos, 43);
                            kind.check(left, right, pos);
                            kind.put(right, 2 + pos, 42);
                        }
                    }
                    // Distinct NaN payloads and signed zero must compare equal for NIO.
                    if (kind == Kind.FLOAT) {
                        FloatBuffer x = (FloatBuffer) left, y = (FloatBuffer) right;
                        x.put(1, Float.intBitsToFloat(0x7fc00001));
                        y.put(2, Float.intBitsToFloat(0x7fc01234));
                        x.put(2, -0.0f); y.put(3, +0.0f);
                        kind.check(x, y, -1);
                        x.put(1, 42); y.put(2, 42); x.put(2, 42); y.put(3, 42);
                    } else if (kind == Kind.DOUBLE) {
                        DoubleBuffer x = (DoubleBuffer) left, y = (DoubleBuffer) right;
                        x.put(1, Double.longBitsToDouble(0x7ff8000000000001L));
                        y.put(2, Double.longBitsToDouble(0x7ff8000000001234L));
                        x.put(2, -0.0); y.put(3, +0.0);
                        kind.check(x, y, -1);
                        x.put(1, 42); y.put(2, 42); x.put(2, 42); y.put(3, 42);
                    }
                }
            }
        }
        MemorySegment.ofBuffer(a.clear()).fill((byte) 0);
        MemorySegment.ofBuffer(b.clear()).fill((byte) 0);
    }

    private static void heapFloatingPoint() {
        for (int size : new int[] {0, 1, 2, 7, 8, 31, 32, 63, 64, 65, 128, 129, 4096}) {
            FloatBuffer fa = FloatBuffer.allocate(size + 8).position(3).slice();
            FloatBuffer fb = FloatBuffer.allocate(size + 8).position(5).slice();
            DoubleBuffer da = DoubleBuffer.allocate(size + 8).position(3).slice();
            DoubleBuffer db = DoubleBuffer.allocate(size + 8).position(5).slice();
            fa.limit(size); fb.limit(size); da.limit(size); db.limit(size);
            for (int i = 0; i < size; i++) {
                fa.put(i, (i & 1) == 0 ? -0.0f : Float.intBitsToFloat(0x7fc00001));
                fb.put(i, (i & 1) == 0 ? +0.0f : Float.intBitsToFloat(0x7fc01234));
                da.put(i, (i & 1) == 0 ? -0.0 : Double.longBitsToDouble(0x7ff8000000000001L));
                db.put(i, (i & 1) == 0 ? +0.0 : Double.longBitsToDouble(0x7ff8000000001234L));
            }
            for (boolean readOnly : new boolean[] {false, true}) {
                FloatBuffer x = readOnly ? fa.asReadOnlyBuffer() : fa;
                DoubleBuffer y = readOnly ? da.asReadOnlyBuffer() : da;
                equal(x.mismatch(fb), -1); equal(y.mismatch(db), -1);
                for (int i = 0; i < size; i++) {
                    float fv = fb.get(i); double dv = db.get(i);
                    fb.put(i, 42); db.put(i, 42);
                    equal(x.mismatch(fb), i); equal(fb.mismatch(x), i);
                    equal(y.mismatch(db), i); equal(db.mismatch(y), i);
                    fb.put(i, fv); db.put(i, dv);
                }
            }
        }
    }

    public static void main(String[] args) throws Exception {
        heapFloatingPoint();
        Path file = Files.createTempFile("buffer-mismatch", ".dat");
        ByteBuffer mappedBuffer = null;
        try (Arena arena = Arena.ofConfined();
             FileChannel channel = FileChannel.open(file, StandardOpenOption.READ, StandardOpenOption.WRITE)) {
            channel.position(CAPACITY - 1).write(ByteBuffer.wrap(new byte[1]));
            ByteBuffer heap = ByteBuffer.allocate(CAPACITY);
            ByteBuffer direct = ByteBuffer.allocateDirect(CAPACITY);
            ByteBuffer scoped = arena.allocate(CAPACITY).asByteBuffer();
            ByteBuffer mapped = channel.map(FileChannel.MapMode.READ_WRITE, 0, CAPACITY, arena).asByteBuffer();
            mappedBuffer = channel.map(FileChannel.MapMode.READ_WRITE, 0, CAPACITY);
            for (ByteBuffer a : new ByteBuffer[] {heap, direct, scoped, mapped, mappedBuffer}) {
                for (ByteBuffer b : new ByteBuffer[] {ByteBuffer.allocate(CAPACITY),
                        ByteBuffer.allocateDirect(CAPACITY)}) {
                    bytes(a, b);
                    typed(a, b);
                }
            }
        } finally {
            if (mappedBuffer != null) {
                Unsafe.getUnsafe().invokeCleaner(mappedBuffer);
            }
            Files.delete(file);
        }
    }
}
