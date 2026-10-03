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
 */

/*
 * @test
 * @summary Native mismatch must recover from faults in truncated mapped memory
 * @requires (os.family == "linux") & (os.simpleArch == "x64") & vm.compiler2.enabled
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=1000 TestMappedNativeMismatch
 * @run main/othervm -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=1000
 *                  -XX:+UnlockDiagnosticVMOptions -XX:AVX3Threshold=0 TestMappedNativeMismatch
 */

import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;

public class TestMappedNativeMismatch {
    private static final int SIZE = 65537;

    private static long mappedSource(MemorySegment a, MemorySegment b) {
        return a.mismatch(b);
    }

    private static long mappedDestination(MemorySegment a, MemorySegment b) {
        return a.mismatch(b);
    }

    private static void checkFault(MemorySegment a, MemorySegment b, boolean source) throws Exception {
        try {
            long result = source ? mappedSource(a, b) : mappedDestination(a, b);
            // Unsafe mapped-memory errors are delivered asynchronously.
            Thread.sleep(1);
            throw new AssertionError("Truncated mapping returned mismatch " + result);
        } catch (InternalError expected) {
        }
    }

    private static void test(boolean source) throws Exception {
        Path path = Files.createTempFile("native-mismatch", ".dat");
        try (Arena arena = Arena.ofConfined();
             FileChannel channel = FileChannel.open(path, StandardOpenOption.READ, StandardOpenOption.WRITE)) {
            channel.position(SIZE - 1).write(ByteBuffer.wrap(new byte[1]));
            MemorySegment mapped = channel.map(FileChannel.MapMode.READ_ONLY, 0, SIZE, arena);
            MemorySegment nativeSegment = arena.allocate(SIZE);
            MemorySegment a = source ? mapped : nativeSegment;
            MemorySegment b = source ? nativeSegment : mapped;
            for (int i = 0; i < 10000; i++) {
                long result = source ? mappedSource(a, b) : mappedDestination(a, b);
                if (result != -1) {
                    throw new AssertionError(result);
                }
            }
            // Leave the first page accessible, including the Java first-byte
            // precheck, so that the fault occurs during the bulk comparison.
            channel.truncate(4096);
            checkFault(a, b, source);
        } finally {
            Files.delete(path);
        }
    }

    public static void main(String[] args) throws Exception {
        test(true);
        test(false);
    }
}
