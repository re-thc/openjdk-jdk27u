/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @test id=default
 * @summary Segment and buffer mismatch must recover from faults in truncated mapped memory
 * @requires (os.family == "linux") & (os.simpleArch == "x64" | os.simpleArch == "aarch64") & vm.compiler2.enabled
 * @modules java.base/jdk.internal.misc
 * @run main/othervm -Xint -Dtest.warmup=10 TestMappedNativeMismatch
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 TestMappedNativeMismatch
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=1000 TestMappedNativeMismatch
 */

/*
 * @test id=avx3
 * @summary Segment and buffer mismatch must recover from faults in the x86 stub's AVX-512 paths
 * @requires (os.family == "linux") & (os.simpleArch == "x64") & vm.compiler2.enabled
 * @modules java.base/jdk.internal.misc
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=1000
 *                  -XX:+UnlockDiagnosticVMOptions -XX:AVX3Threshold=0 TestMappedNativeMismatch
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=1000
 *                  -XX:+UnlockDiagnosticVMOptions -XX:ArrayOperationPartialInlineSize=64
 *                  -XX:AVX3Threshold=0 TestMappedNativeMismatch
 */

/*
 * @test id=macos
 * @summary Recover from truncated mapped-memory faults on macOS AArch64
 * @requires (os.family == "mac") & (os.simpleArch == "aarch64") & vm.compiler2.enabled
 * @modules java.base/jdk.internal.misc
 * @run main/othervm -Xint -Dtest.warmup=10 TestMappedNativeMismatch
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 TestMappedNativeMismatch
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=1000 TestMappedNativeMismatch
 */

import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.nio.ByteBuffer;
import java.nio.IntBuffer;
import java.nio.FloatBuffer;
import java.nio.DoubleBuffer;
import java.nio.CharBuffer;
import java.nio.ShortBuffer;
import java.nio.LongBuffer;
import java.nio.channels.FileChannel;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import jdk.internal.misc.Unsafe;

public class TestMappedNativeMismatch {
    private static final int PAGE_SIZE = Unsafe.getUnsafe().pageSize();
    private static final int SIZE = PAGE_SIZE + 65537;

    private static long mappedSource(MemorySegment a, MemorySegment b) {
        return a.mismatch(b);
    }

    private static long mappedDestination(MemorySegment a, MemorySegment b) {
        return a.mismatch(b);
    }

    private static long mismatch(MemorySegment a, MemorySegment b,
                                 ByteBuffer ab, ByteBuffer bb, boolean source, int kind) {
        if (kind == 7) {
            return mappedLongs(ab.asLongBuffer(), bb.asLongBuffer());
        }
        if (kind == 6) {
            return mappedShorts(ab.asShortBuffer(), bb.asShortBuffer());
        }
        if (kind == 5) {
            return mappedChars(ab.asCharBuffer(), bb.asCharBuffer());
        }
        if (kind == 4) {
            return mappedDoubles(ab.asDoubleBuffer(), bb.asDoubleBuffer());
        }
        if (kind == 3) {
            return mappedFloats(ab.asFloatBuffer(), bb.asFloatBuffer());
        }
        if (kind == 2) {
            return mappedInts(ab.asIntBuffer(), bb.asIntBuffer());
        }
        if (kind == 1) {
            return source ? mappedSourceBuffer(ab, bb) : mappedDestinationBuffer(ab, bb);
        }
        return source ? mappedSource(a, b) : mappedDestination(a, b);
    }

    private static int mappedDoubles(DoubleBuffer a, DoubleBuffer b) {
        return a.mismatch(b);
    }

    private static int mappedChars(CharBuffer a, CharBuffer b) {
        return a.mismatch(b);
    }

    private static int mappedShorts(ShortBuffer a, ShortBuffer b) {
        return a.mismatch(b);
    }

    private static int mappedLongs(LongBuffer a, LongBuffer b) {
        return a.mismatch(b);
    }

    private static int mappedFloats(FloatBuffer a, FloatBuffer b) {
        return a.mismatch(b);
    }

    private static int mappedInts(IntBuffer a, IntBuffer b) {
        return a.mismatch(b);
    }

    private static int mappedSourceBuffer(ByteBuffer a, ByteBuffer b) {
        return a.mismatch(b);
    }

    private static int mappedDestinationBuffer(ByteBuffer a, ByteBuffer b) {
        return a.mismatch(b);
    }

    private static void checkFault(MemorySegment a, MemorySegment b, ByteBuffer ab,
                                   ByteBuffer bb, boolean source, int kind) throws Exception {
        try {
            long result = mismatch(a, b, ab, bb, source, kind);
            // Unsafe mapped-memory errors are delivered asynchronously.
            Thread.sleep(1);
            throw new AssertionError("Truncated mapping returned mismatch " + result);
        } catch (InternalError expected) {
        }
    }

    private static void test(boolean source, boolean heap, int offset, int size, int kind, long truncate) throws Exception {
        Path path = Files.createTempFile("native-mismatch", ".dat");
        try (Arena arena = Arena.ofConfined();
             FileChannel channel = FileChannel.open(path, StandardOpenOption.READ, StandardOpenOption.WRITE)) {
            channel.position(SIZE - 1).write(ByteBuffer.wrap(new byte[1]));
            MemorySegment mapped = channel.map(FileChannel.MapMode.READ_ONLY, 0, SIZE, arena);
            MemorySegment other = heap ? MemorySegment.ofArray(new byte[SIZE]) : arena.allocate(SIZE);
            MemorySegment a = (source ? mapped : other).asSlice(offset, size);
            MemorySegment b = (source ? other : mapped).asSlice(offset, size);
            ByteBuffer ab = a.asByteBuffer();
            ByteBuffer bb = b.asByteBuffer();
            for (int i = 0; i < Integer.getInteger("test.warmup", 10000); i++) {
                long result = mismatch(a, b, ab, bb, source, kind);
                if (result != -1) {
                    throw new AssertionError(result);
                }
            }
            // Leave the Java first-byte precheck accessible. The page-end offset
            // faults in the compiled first-word comparison; offset zero
            // faults later in the bulk stub. Exercise both base orders.
            channel.truncate(truncate);
            checkFault(a, b, ab, bb, source, kind);
        } finally {
            Files.delete(path);
        }
    }

    public static void main(String[] args) throws Exception {
        for (boolean source : new boolean[] {true, false}) {
            for (boolean heap : new boolean[] {true, false}) {
                for (int kind = 0; kind < 8; kind++) {
                    test(source, heap, 0, SIZE, kind, PAGE_SIZE);
                    test(source, heap, PAGE_SIZE - 8, 65536, kind, PAGE_SIZE);
                    test(source, heap, PAGE_SIZE - 2, 4096, kind, PAGE_SIZE);
                    test(source, heap, PAGE_SIZE - 2, 16, kind, PAGE_SIZE);
                    test(source, heap, PAGE_SIZE - 2, 128, kind, PAGE_SIZE);
                    test(source, heap, PAGE_SIZE - 8, 128, kind, PAGE_SIZE);
                    test(source, heap, PAGE_SIZE - 256, 511, kind, PAGE_SIZE);
                    test(source, heap, PAGE_SIZE - 256, 512, kind, PAGE_SIZE);
                    long lastPage = ((long) PAGE_SIZE - 8 + 65536 - 1) / PAGE_SIZE * PAGE_SIZE;
                    test(source, heap, PAGE_SIZE - 8, 65536, kind, lastPage);
                }
            }
        }
    }
}
