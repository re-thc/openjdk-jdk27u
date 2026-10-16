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
 * @test id=values
 * @summary Interpreted ArraysSupport.vectorizedMismatch agrees with the Java implementation
 *          for heap, native and mixed inputs of every element scale
 * @library /test/lib
 * @modules java.base/jdk.internal.misc java.base/jdk.internal.util
 * @run main/othervm -Xint compiler.intrinsics.InterpretedVectorizedMismatchTest
 * @run main/othervm -Xint -XX:+UnlockDiagnosticVMOptions -XX:-UseVectorizedMismatchIntrinsic
 *                   compiler.intrinsics.InterpretedVectorizedMismatchTest
 * @run driver compiler.intrinsics.InterpretedVectorizedMismatchTest entry
 */

/*
 * @test id=no-intrinsics
 * @summary Interpreted ArraysSupport.vectorizedMismatch without interpreter intrinsics
 * @requires vm.debug == true
 * @library /test/lib
 * @modules java.base/jdk.internal.misc java.base/jdk.internal.util
 * @run main/othervm -Xint -XX:-InlineIntrinsics compiler.intrinsics.InterpretedVectorizedMismatchTest
 */

/*
 * @test id=counted
 * @summary Calls through the interpreter's vectorizedMismatch entry still count toward compilation
 * @requires vm.compMode != "Xint" & vm.opt.final.UseVectorizedMismatchIntrinsic == true
 * @library /test/lib
 * @modules java.base/jdk.internal.misc java.base/jdk.internal.util
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch
 *                   -XX:-ProfileInterpreter -XX:CompileCommand=quiet
 *                   -XX:CompileCommand=exclude,compiler.intrinsics.InterpretedVectorizedMismatchTest::interpreted
 *                   compiler.intrinsics.InterpretedVectorizedMismatchTest counted
 */

/*
 * @test id=profiled
 * @summary Once ArraysSupport.vectorizedMismatch has a MethodData, interpreted calls run
 *          and profile its Java body, which C2 still compiles for some inputs
 * @requires vm.compMode != "Xint" & vm.opt.final.UseVectorizedMismatchIntrinsic == true
 * @requires os.arch == "amd64" | os.arch == "x86_64"
 * @library /test/lib
 * @modules java.base/jdk.internal.misc java.base/jdk.internal.util
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *                   -XX:CompileCommand=quiet
 *                   -XX:CompileCommand=exclude,jdk.internal.util.ArraysSupport::vectorizedMismatch
 *                   -XX:CompileCommand=exclude,compiler.intrinsics.InterpretedVectorizedMismatchTest::interpreted
 *                   compiler.intrinsics.InterpretedVectorizedMismatchTest profiled
 */

package compiler.intrinsics;

import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.ValueLayout;
import java.lang.reflect.Method;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jdk.internal.misc.Unsafe;
import jdk.internal.util.ArraysSupport;
import jdk.test.lib.Platform;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class InterpretedVectorizedMismatchTest {
    private static final Unsafe U = Unsafe.getUnsafe();
    private static final int LIMIT = 65536;
    private static final long[] BASES = {Unsafe.ARRAY_BYTE_BASE_OFFSET, Unsafe.ARRAY_CHAR_BASE_OFFSET,
                                         Unsafe.ARRAY_INT_BASE_OFFSET, Unsafe.ARRAY_LONG_BASE_OFFSET};

    private static Object array(int scale, int bytes) {
        return switch (scale) {
            case 0 -> new byte[bytes];
            case 1 -> new char[bytes / 2];
            case 2 -> new int[bytes / 4];
            default -> new long[bytes / 8];
        };
    }

    // An input is a heap array (base != null) or native memory (base == null).
    private record Input(Object base, long offset) {
        byte get(long i) {
            return U.getByte(base, offset + i);
        }

        void set(long i, int value) {
            U.putByte(base, offset + i, (byte) value);
        }
    }

    // Normalizes a result to the first differing element, or -1. A complemented
    // result reports a tail of less than one word that the caller must compare.
    private static int firstDifference(int result, Input a, Input b, int length, int scale) {
        if (result >= 0) {
            return result;
        }
        int tail = ~result;
        if (tail > (7 >> scale) || tail > length) {
            throw new AssertionError("length=" + length + ", scale=" + scale + ": invalid tail " + tail);
        }
        for (int i = length - tail; i < length; i++) {
            for (int j = 0; j < 1 << scale; j++) {
                long k = ((long) i << scale) + j;
                if (a.get(k) != b.get(k)) {
                    return i;
                }
            }
        }
        return -1;
    }

    private static void check(Input a, Input b, int length, int scale, int expected) {
        int result = ArraysSupport.vectorizedMismatch(a.base(), a.offset(), b.base(), b.offset(), length, scale);
        int actual = firstDifference(result, a, b, length, scale);
        if (actual != expected) {
            throw new AssertionError("length=" + length + ", scale=" + scale + ", heap=" +
                                     (a.base() != null) + "/" + (b.base() != null) + ": " + actual +
                                     " (raw " + result + ") != " + expected);
        }
    }

    private static void checkPair(Input a, Input b, int scale, int[] lengths) {
        for (int length : lengths) {
            check(a, b, length, scale, -1);
            int[] positions = length <= 80 ? null : new int[] {0, 1, (8 >> scale) - 1, 8 >> scale,
                    length / 2, length - (8 >> scale) - 1, length - 1};
            int count = positions == null ? length : positions.length;
            for (int p = 0; p < count; p++) {
                int element = positions == null ? p : positions[p];
                if (element < 0 || element >= length) {
                    continue;
                }
                long at = ((long) element << scale) + (1 << scale) - 1; // most significant byte
                b.set(at, 1);
                check(a, b, length, scale, element);
                check(b, a, length, scale, element);
                b.set(at, 0);
            }
            // A difference just after the range is ignored.
            b.set((long) length << scale, 1);
            check(a, b, length, scale, -1);
            b.set((long) length << scale, 0);
        }
    }

    private static void run() {
        int maxBytes = 2 * LIMIT + 64;
        try (Arena arena = Arena.ofConfined()) {
            MemorySegment nativeA = arena.allocate(maxBytes);
            MemorySegment nativeB = arena.allocate(maxBytes);
            for (int scale = 0; scale <= 3; scale++) {
                int limit = LIMIT >> scale;
                int[] lengths = {0, 1, 2, 3, 4, 7, 8, 9, 15, 16, 17, 31, 32, 33, 63, 64, 65, 80,
                                 127, 128, 129, 1000, limit - 1, limit, limit + 1, 2 * limit};
                Object heapA = array(scale, maxBytes);
                Object heapB = array(scale, maxBytes);
                // Misaligned native inputs; heap inputs start at the first element.
                Input[] as = {new Input(heapA, BASES[scale]), new Input(null, nativeA.address() + 1)};
                Input[] bs = {new Input(heapB, BASES[scale]), new Input(null, nativeB.address() + 3)};
                for (Input a : as) {
                    for (Input b : bs) {
                        checkPair(a, b, scale, lengths);
                    }
                }
                // Negative lengths keep the Java result and do not access memory.
                for (int length : new int[] {-1, -7, -8, Integer.MIN_VALUE}) {
                    for (Input a : as) {
                        int result = ArraysSupport.vectorizedMismatch(a.base(), a.offset(), null, 0, length, scale);
                        int expected = ArraysSupport.vectorizedMismatch(null, 0, null, 0, length, scale);
                        if (result != expected || (scale < 2 && result != ~length)) {
                            throw new AssertionError("negative length " + length + ", scale " + scale + ": " + result);
                        }
                    }
                }
            }
        }
    }

    // The interpreter installs a dedicated entry exactly when the intrinsic is available.
    private static void checkEntry() throws Exception {
        String codelet = "method entry point (kind = jdk_internal_util_ArraysSupport_vectorizedMismatch)";
        Pattern size = Pattern.compile(Pattern.quote(codelet) + ".*?(\\d+) bytes");
        for (boolean enabled : new boolean[] {true, false}) {
            OutputAnalyzer output = ProcessTools.executeProcess(ProcessTools.createLimitedTestJavaProcessBuilder(
                    "-XX:+UnlockDiagnosticVMOptions", "-XX:+PrintInterpreter",
                    "-XX:" + (enabled ? "+" : "-") + "UseVectorizedMismatchIntrinsic", "-version"));
            output.shouldHaveExitValue(0);
            boolean supported = Platform.isX64() &&
                    !output.getOutput().contains("UseVectorizedMismatchIntrinsic specified, but not available");
            Matcher m = size.matcher(output.getStdout());
            int bytes = m.find() ? Integer.parseInt(m.group(1)) : 0;
            if ((bytes > 0) != (enabled && supported)) {
                throw new AssertionError("enabled=" + enabled + ", supported=" + supported +
                                         ": entry codelet has " + bytes + " bytes");
            }
        }
    }

    // Always interpreted: its calls use the interpreter's entry for the callee.
    private static int interpreted(byte[] a, byte[] b) {
        return interpreted(a, b, a.length);
    }

    private static int interpreted(byte[] a, byte[] b, int length) {
        return ArraysSupport.vectorizedMismatch(a, Unsafe.ARRAY_BYTE_BASE_OFFSET,
                                                b, Unsafe.ARRAY_BYTE_BASE_OFFSET, length, 0);
    }

    // Interpreted calls until the target is compiled, starting from cleared counters.
    private static int callsToCompile(WhiteBox wb, Method target, byte[] a, byte[] b, int length) {
        wb.deoptimizeMethod(target);
        wb.clearMethodState(target);
        for (int i = 1; i <= 100_000; i++) {
            interpreted(a, b, length);
            if (wb.isMethodCompiled(target)) {
                return i;
            }
        }
        throw new AssertionError("ArraysSupport.vectorizedMismatch was not compiled, length " + length);
    }

    private static Method target() throws Exception {
        return ArraysSupport.class.getDeclaredMethod("vectorizedMismatch",
                Object.class, long.class, Object.class, long.class, int.class, int.class);
    }

    // The entry keeps the method's invocation counters, so the compilation
    // policy and C2's inlining heuristics see these calls. The test disables
    // interpreter profiling, under which the entry also serves methods that
    // already have a MethodData.
    private static void checkCounted() throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        Method target = target();
        wb.deoptimizeMethod(target);
        wb.clearMethodState(target);
        byte[] a = new byte[256], b = new byte[256];
        b[200] = 1;
        if (interpreted(a, b) != 200) {
            throw new AssertionError("mismatch result");
        }
        // The stub serves the first length; a negative length falls back to the vanilla
        // entry before reaching any loop. Each invocation must be counted once either way,
        // so both reach the compilation threshold after about as many calls. Counting a
        // fallback invocation twice would halve the second number.
        int stub = callsToCompile(wb, target, a, b, a.length);
        int fallback = callsToCompile(wb, target, a, b, -1);
        System.out.println("calls to compile: stub " + stub + ", fallback " + fallback);
        if (fallback * 4 < stub * 3 || stub * 4 < fallback * 3) {
            throw new AssertionError("stub calls " + stub + " and fallback calls " + fallback +
                                     " reach the threshold differently");
        }
    }

    // The two implementations differ on equal input: the Java body leaves a
    // tail of less than one word to its caller (~3 for 127 bytes), while the
    // x86 stub compares the tail and returns -1.
    private static void checkProfiled() throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        Method target = target();
        byte[] a = new byte[127], b = new byte[127];
        if (wb.getMethodData(target) == 0) {
            int stub = 0;
            for (int i = 0; i < 16; i++) {
                stub += interpreted(a, b) == -1 ? 1 : 0;
            }
            if (stub == 0) {
                throw new AssertionError("interpreted calls without a MethodData did not use the stub");
            }
            wb.markMethodProfiled(target);
        }
        if (wb.getMethodData(target) == 0) {
            throw new AssertionError("no MethodData");
        }
        for (int i = 0; i < 1000; i++) {
            int result = interpreted(a, b);
            if (result != ~3) {
                throw new AssertionError("call " + i + " with a MethodData returned " + result);
            }
        }
    }

    public static void main(String[] args) throws Exception {
        String mode = args.length > 0 ? args[0] : "";
        switch (mode) {
            case "entry" -> checkEntry();
            case "counted" -> checkCounted();
            case "profiled" -> checkProfiled();
            default -> run();
        }
    }
}
