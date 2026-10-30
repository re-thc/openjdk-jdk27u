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
 * @summary Archived unsafe bulk-copy and mismatch stubs retain mapped-memory fault handlers
 * @requires vm.cds.supports.aot.code.caching
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires os.family == "linux" | os.family == "mac"
 * @requires vm.opt.VerifyOops == null | vm.opt.VerifyOops == false
 * @library /test/lib
 * @modules java.base/jdk.internal.misc
 * @build AOTMappedMemoryAccessTest
 * @run driver jdk.test.lib.helpers.ClassFileInstaller -jar app.jar AOTMappedMemoryAccessApp
 * @run driver/timeout=480 AOTMappedMemoryAccessTest
 */

import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.CharBuffer;
import java.nio.channels.FileChannel;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.Arrays;

import jdk.test.lib.cds.CDSAppTester;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.internal.misc.Unsafe;

public class AOTMappedMemoryAccessTest {
    public static void main(String[] args) throws Exception {
        new CDSAppTester("AOTMappedMemoryAccessTest") {
            @Override
            public String classpath(RunMode mode) {
                return "app.jar";
            }

            @Override
            public String[] vmArgs(RunMode mode) {
                return new String[] {"-Xmx128m", "-Xbatch", "-XX:-TieredCompilation", "-XX:CompileThreshold=100",
                        "-XX:+UnlockDiagnosticVMOptions",
                        "-XX:+AbortVMOnAOTCodeFailure", "-XX:+AOTStubCaching",
                        "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED",
                        "-Xlog:aot+codecache+stubs=debug"};
            }

            @Override
            public String[] appCommandLine(RunMode mode) {
                return new String[] {AOTMappedMemoryAccessApp.class.getName(), mode == RunMode.PRODUCTION ? "fault" : "train"};
            }

            @Override
            public void checkExecution(OutputAnalyzer out, RunMode mode) {
                if (mode == RunMode.PRODUCTION) {
                    out.shouldContain("Read blob 'final_blob (stub gen)'");
                    out.shouldNotContain("Failed to Read blob 'final_blob (stub gen)'");
                    out.shouldContain("Heap mismatch after AOT restoration passed");
                    out.shouldContain("Recovered mapped faults: forward, backward, String, mismatch source/destination");
                }
            }
        }.runAOTWorkflow("AOT", "--two-step-training");
    }
}

class AOTMappedMemoryAccessApp {
    private static final int COPY_BYTES = 131072;

    private static void copy(MemorySegment segment, boolean backwards) {
        // Both ends are 16-byte aligned. The AArch64 bulk-copy leaves run
        // without first loading an unaligned prefix in the calling stub.
        MemorySegment.copy(segment, backwards ? 0 : 16,
                segment, backwards ? 16 : 0, COPY_BYTES);
    }

    private static long mismatch(MemorySegment mapped, MemorySegment other, boolean reverse) {
        MemorySegment slice = mapped.asSlice(1, COPY_BYTES);
        return reverse ? other.mismatch(slice) : slice.mismatch(other);
    }

    private static int heapMismatch(float[] a, float[] b) {
        return Arrays.mismatch(a, 1, a.length, b, 1, b.length);
    }

    private static void expectFault(Runnable operation) {
        try {
            operation.run();
        } catch (InternalError expected) {
            if (expected.getMessage() != null && expected.getMessage().contains("unsafe memory access")) {
                return;
            }
            throw expected;
        }
        throw new AssertionError("Expected a fault in truncated mapped memory");
    }

    public static void main(String[] args) throws Exception {
        Path path = Files.createTempFile("aot-mapped-access", ".bin");
        String text = "\u03b1".repeat(COPY_BYTES / Character.BYTES);
        float[] heapA = new float[4098];
        float[] heapB = new float[4098];
        for (int i = 0; i < 1000; i++) {
            heapB[2] = (i & 1) == 0 ? 0.0f : 1.0f;
            int expected = (i & 1) == 0 ? -1 : 1;
            if (heapMismatch(heapA, heapB) != expected) {
                throw new AssertionError("Incorrect heap mismatch after AOT restoration");
            }
        }
        if (args[0].equals("fault")) {
            System.out.println("Heap mismatch after AOT restoration passed");
        }
        try (FileChannel channel = FileChannel.open(path, StandardOpenOption.READ, StandardOpenOption.WRITE);
                Arena arena = Arena.ofConfined()) {
            MemorySegment mapped = channel.map(FileChannel.MapMode.READ_WRITE, 0, 1 << 20, arena);
            MemorySegment other = arena.allocate(COPY_BYTES);
            CharBuffer chars = mapped.asByteBuffer().order(ByteOrder.nativeOrder()).asCharBuffer();
            for (int i = 0; i < 1000; i++) {
                copy(mapped, false);
                copy(mapped, true);
                chars.clear().put(text);
            }
            mapped.fill((byte) 0);
            for (int i = 0; i < 1000; i++) {
                if (mismatch(mapped, other, false) != -1 || mismatch(mapped, other, true) != -1) {
                    throw new AssertionError("Expected equal mapped/native regions");
                }
            }
            if (args[0].equals("fault")) {
                channel.truncate(0);
                channel.force(true);
                expectFault(() -> copy(mapped, false));
                expectFault(() -> copy(mapped, true));
                expectFault(() -> chars.clear().put(text));
                // Leave a readable prefix, then fault inside a bounded leaf rather
                // than in its scalar precheck. The odd start crosses the next page
                // even when a page is as large as the 64-KiB leaf bound.
                channel.position(Unsafe.getUnsafe().pageSize() - 1).write(ByteBuffer.wrap(new byte[1]));
                channel.force(true);
                expectFault(() -> mismatch(mapped, other, false));
                expectFault(() -> mismatch(mapped, other, true));
                System.out.println("Recovered mapped faults: forward, backward, String, mismatch source/destination");
            }
        } finally {
            Files.delete(path);
        }
    }
}
