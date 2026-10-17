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
 * @test id=ir
 * @summary AArch64 mismatch keeps short inputs in Java and bounds vector work before its polling fallback
 * @requires os.arch == "aarch64" & vm.compiler2.enabled & vm.opt.final.UseVectorizedMismatchIntrinsic == true
 * @library /test/lib /
 * @modules java.base/jdk.internal.misc java.base/jdk.internal.util
 * @run driver compiler.intrinsics.AArch64VectorizedMismatchDispatchTest
 */

/*
 * @test id=ideal
 * @summary Check the actual leaf length argument and polling Java fallback after the bounded AArch64 prefix
 * @requires os.arch == "aarch64" & vm.debug == true & vm.compiler2.enabled & vm.opt.final.UseVectorizedMismatchIntrinsic == true
 * @library /test/lib /
 * @modules java.base/jdk.internal.misc java.base/jdk.internal.util
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver compiler.intrinsics.AArch64VectorizedMismatchDispatchTest ideal
 */

package compiler.intrinsics;

import compiler.lib.ir_framework.CompilePhase;
import compiler.lib.ir_framework.IR;
import compiler.lib.ir_framework.Run;
import compiler.lib.ir_framework.RunInfo;
import compiler.lib.ir_framework.Test;
import compiler.lib.ir_framework.TestFramework;
import compiler.lib.ir_framework.Warmup;
import java.lang.foreign.Arena;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.ValueLayout;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jdk.internal.misc.Unsafe;
import jdk.internal.util.ArraysSupport;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class AArch64VectorizedMismatchDispatchTest {
    private static final int MINIMUM = 128;
    private static final int PREFIX = 2048;
    private static final int LARGE = 65536;
    private static final int CAPACITY = 2 * LARGE + 32;
    private static final long BASE = Unsafe.ARRAY_BYTE_BASE_OFFSET;
    private static final byte[] HA = new byte[CAPACITY];
    private static final byte[] HB = new byte[CAPACITY];
    private static final MemorySegment NA = Arena.ofAuto().allocate(CAPACITY);
    private static final MemorySegment NB = Arena.ofAuto().allocate(CAPACITY);
    private static final String LEAF = "CallLeaf.*vectorizedMismatch";
    private static final String JAVA_CALL = "CallStaticJava.*ArraysSupport::vectorizedMismatch";

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int heap0(byte[] a, long ao, byte[] b, long bo, int length) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, length, 0);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int heap1(byte[] a, long ao, byte[] b, long bo, int length) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, length, 1);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int heap2(byte[] a, long ao, byte[] b, long bo, int length) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, length, 2);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int heap3(byte[] a, long ao, byte[] b, long bo, int length) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, length, 3);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int native0(long a, long b, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, length, 0);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int native1(long a, long b, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, length, 1);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int native2(long a, long b, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, length, 2);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int native3(long a, long b, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, length, 3);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int mixed0(byte[] a, long ao, long b, int length) {
        return ArraysSupport.vectorizedMismatch(a, ao, null, b, length, 0);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int mixed1(byte[] a, long ao, long b, int length) {
        return ArraysSupport.vectorizedMismatch(a, ao, null, b, length, 1);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int mixed2(byte[] a, long ao, long b, int length) {
        return ArraysSupport.vectorizedMismatch(a, ao, null, b, length, 2);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int mixed3(byte[] a, long ao, long b, int length) {
        return ArraysSupport.vectorizedMismatch(a, ao, null, b, length, 3);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int reverse0(long a, byte[] b, long bo, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, b, bo, length, 0);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int reverse1(long a, byte[] b, long bo, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, b, bo, length, 1);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int reverse2(long a, byte[] b, long bo, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, b, bo, length, 2);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int reverse3(long a, byte[] b, long bo, int length) {
        return ArraysSupport.vectorizedMismatch(null, a, b, bo, length, 3);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int short0(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, (MINIMUM >> 0) - 1, 0);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int short1(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, (MINIMUM >> 1) - 1, 1);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int short2(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, (MINIMUM >> 2) - 1, 2);
    }

    @Test
    @IR(failOn = {LEAF}, phase = CompilePhase.BEFORE_MATCHING)
    public static int short3(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, (MINIMUM >> 3) - 1, 3);
    }

    @Test
    @IR(counts = {LEAF, "1"}, phase = CompilePhase.BEFORE_MATCHING)
    public static int minimum(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, MINIMUM, 0);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int heapLarge0(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, LARGE >> 0, 0);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int heapLarge1(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, LARGE >> 1, 1);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int heapLarge2(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, LARGE >> 2, 2);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int heapLarge3(byte[] a, long ao, byte[] b, long bo) {
        return ArraysSupport.vectorizedMismatch(a, ao, b, bo, LARGE >> 3, 3);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeLarge0(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, LARGE >> 0, 0);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeLarge1(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, LARGE >> 1, 1);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeLarge2(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, LARGE >> 2, 2);
    }

    @Test
    @IR(counts = {LEAF, "1", JAVA_CALL, ">= 1"},
        phase = CompilePhase.BEFORE_MATCHING)
    public static int nativeLarge3(long a, long b) {
        return ArraysSupport.vectorizedMismatch(null, a, null, b, LARGE >> 3, 3);
    }

    @Run(test = {"heap0", "heap1", "heap2", "heap3", "native0", "native1", "native2", "native3", "mixed0", "mixed1", "mixed2", "mixed3", "reverse0", "reverse1", "reverse2", "reverse3", "short0", "short1", "short2", "short3", "minimum"})
    @Warmup(2000)
    public static void run(RunInfo info) {
        if (info.isWarmUp()) {
            int i = warmups++;
            int bytes = i % 128 == 0 ? LARGE : i % 8 == 0 ? PREFIX + 8 : MINIMUM + (i & 3) * 8;
            int[] differences = {-1, 1, 7, 10, 25, 82, 127, 128, 1267};
            int difference = differences[i % differences.length];
            if (difference >= bytes) {
                difference = -1;
            }
            setDifference(difference, 1, (byte) 1);
            for (int scale = 0; scale <= 3; scale++) {
                for (int storage = 0; storage < 4; storage++) {
                    raw(storage, scale, 1, bytes >> scale);
                }
                shortRange(scale, 1);
            }
            minimum(HA, BASE + 1, HB, BASE + 1);
            setDifference(difference, 1, (byte) 0);
        } else {
            verifyAll();
        }
    }

    private static int warmups;

    @Run(test = {"heapLarge0", "heapLarge1", "heapLarge2", "heapLarge3", "nativeLarge0", "nativeLarge1", "nativeLarge2", "nativeLarge3"})
    @Warmup(30)
    public static void runLarge(RunInfo info) {
        if (info != null && info.isWarmUp()) {
            for (int scale = 0; scale <= 3; scale++) {
                large(false, scale, 1);
                large(true, scale, 1);
            }
        } else {
            for (int scale = 0; scale <= 3; scale++) {
                for (int offset : new int[] {0, 1, 7}) {
                    for (int difference : new int[] {-1, 0, 7, 8, 10, 25, 82, 127, 128, 1267,
                                                       PREFIX - 1, PREFIX, PREFIX + 1, LARGE - 1}) {
                        setDifference(difference, offset, (byte) 1);
                        checkRaw(large(false, scale, offset), LARGE >> scale, scale, difference,
                                 "constant heap large");
                        checkRaw(large(true, scale, offset), LARGE >> scale, scale, difference,
                                 "constant native large");
                        setDifference(difference, offset, (byte) 0);
                    }
                }
            }
        }
    }

    private static int raw(int storage, int scale, int offset, int length) {
        long ao = BASE + offset, na = NA.address() + offset, nb = NB.address() + offset;
        return switch (4 * storage + scale) {
            case 0 -> heap0(HA, ao, HB, ao, length);
            case 1 -> heap1(HA, ao, HB, ao, length);
            case 2 -> heap2(HA, ao, HB, ao, length);
            case 3 -> heap3(HA, ao, HB, ao, length);
            case 4 -> native0(na, nb, length);
            case 5 -> native1(na, nb, length);
            case 6 -> native2(na, nb, length);
            case 7 -> native3(na, nb, length);
            case 8 -> mixed0(HA, ao, nb, length);
            case 9 -> mixed1(HA, ao, nb, length);
            case 10 -> mixed2(HA, ao, nb, length);
            case 11 -> mixed3(HA, ao, nb, length);
            case 12 -> reverse0(na, HB, ao, length);
            case 13 -> reverse1(na, HB, ao, length);
            case 14 -> reverse2(na, HB, ao, length);
            case 15 -> reverse3(na, HB, ao, length);
            default -> throw new AssertionError("bad storage or scale");
        };
    }

    private static int shortRange(int scale, int offset) {
        long ao = BASE + offset;
        return switch (scale) {
            case 0 -> short0(HA, ao, HB, ao);
            case 1 -> short1(HA, ao, HB, ao);
            case 2 -> short2(HA, ao, HB, ao);
            case 3 -> short3(HA, ao, HB, ao);
            default -> throw new AssertionError(scale);
        };
    }

    private static int large(boolean nativeMemory, int scale, int offset) {
        long ao = BASE + offset, na = NA.address() + offset, nb = NB.address() + offset;
        return switch (scale + (nativeMemory ? 4 : 0)) {
            case 0 -> heapLarge0(HA, ao, HB, ao);
            case 1 -> heapLarge1(HA, ao, HB, ao);
            case 2 -> heapLarge2(HA, ao, HB, ao);
            case 3 -> heapLarge3(HA, ao, HB, ao);
            case 4 -> nativeLarge0(na, nb);
            case 5 -> nativeLarge1(na, nb);
            case 6 -> nativeLarge2(na, nb);
            case 7 -> nativeLarge3(na, nb);
            default -> throw new AssertionError(scale);
        };
    }

    private static void setDifference(int difference, int offset, byte value) {
        if (difference >= 0) {
            HB[offset + difference] = value;
            NB.set(ValueLayout.JAVA_BYTE, offset + difference, value);
        }
    }

    // A negative result describes the unexamined tail, which the public caller checks.
    // Requiring -1 for all equal inputs would incorrectly reject the original Java body.
    private static void checkRaw(int actual, int length, int scale, int difference, String context) {
        int expected = difference < 0 ? -1 : difference >> scale;
        if (actual >= 0) {
            if (actual != expected) {
                throw new AssertionError(context + ": length=" + length + " scale=" + scale +
                                         " difference=" + difference + " actual=" + actual);
            }
        } else {
            int tail = ~actual;
            if (tail < 0 || tail > length || tail >= (8 >> scale) ||
                    expected >= 0 && expected < length - tail) {
                throw new AssertionError(context + ": invalid unexamined tail " + tail +
                                         " length=" + length + " scale=" + scale + " difference=" + difference);
            }
        }
    }

    private static void verifyAll() {
        for (int scale = 0; scale <= 3; scale++) {
            int minimum = MINIMUM >> scale, prefix = PREFIX >> scale, limit = LARGE >> scale;
            for (int offset : new int[] {0, 1, 7}) {
                for (int length : new int[] {0, 1, 2, 3, 7, 8, minimum - 1, minimum, minimum + 1,
                        prefix - 1, prefix, prefix + 1, prefix + 2, prefix + 3, prefix + 4,
                        prefix + 5, prefix + 6, prefix + 7, limit - 1, limit, limit + 1, 2 * limit}) {
                    int bytes = length << scale;
                    // Poison outside both ends. Neither the stub nor its prefilters may use it.
                    if (offset > 0) {
                        setDifference(offset - 1, 0, (byte) 1);
                    }
                    setDifference(bytes, offset, (byte) 1);
                    for (int difference : new int[] {-1, 0, 7, 8, 10, 25, 82, 127, 128, 1267,
                                                    PREFIX - 1, PREFIX, PREFIX + 1, bytes - 1}) {
                        if (difference >= bytes || difference < -1) {
                            continue;
                        }
                        setDifference(difference, offset, (byte) 1);
                        for (int storage = 0; storage < 4; storage++) {
                            checkRaw(raw(storage, scale, offset, length), length, scale, difference,
                                     "storage=" + storage + " offset=" + offset);
                        }
                        setDifference(difference, offset, (byte) 0);
                    }
                    setDifference(bytes, offset, (byte) 0);
                    if (offset > 0) {
                        setDifference(offset - 1, 0, (byte) 0);
                    }
                }
            }
        }
        // Constant-size expansions have their own compilation decisions.
        for (int scale = 0; scale <= 3; scale++) {
            int length = (MINIMUM >> scale) - 1;
            int bytes = length << scale;
            for (int offset : new int[] {0, 1, 7}) {
                for (int difference : new int[] {-1, 0, 7, 8, 10, 25, 82, bytes - 1}) {
                    setDifference(difference, offset, (byte) 1);
                    checkRaw(shortRange(scale, offset), length, scale, difference, "constant short");
                    setDifference(difference, offset, (byte) 0);
                }
            }
        }
        for (int difference : new int[] {-1, 0, 7, 8, 10, 25, 82, 127}) {
            setDifference(difference, 1, (byte) 1);
            checkRaw(minimum(HA, BASE + 1, HB, BASE + 1), MINIMUM, 0, difference, "constant minimum");
            setDifference(difference, 1, (byte) 0);
        }
        // Empty/negative raw ranges must not touch these invalid native addresses.
        for (int scale = 0; scale <= 3; scale++) {
            for (int length : new int[] {0, -1, -8, Integer.MIN_VALUE}) {
                int actual = switch (scale) {
                    case 0 -> native0(0, 0, length);
                    case 1 -> native1(0, 0, length);
                    case 2 -> native2(0, 0, length);
                    default -> native3(0, 0, length);
                };
                if (actual != ~length) {
                    throw new AssertionError("invalid native range " + length + ": " + actual);
                }
            }
        }
        verifyPublic();
    }

    private static void verifyPublic() {
        for (int length : new int[] {127, 128, 129, PREFIX - 1, PREFIX, PREFIX + 1, LARGE, LARGE + 1}) {
            for (int kind = 0; kind < 8; kind++) {
                Object a = newArray(kind, length + 8), b = newArray(kind, length + 8);
                for (int difference : new int[] {-1, 0, 1, 7, 8, 10, 25, 82, 127, 128, 1267,
                                                PREFIX - 1, PREFIX, length - 1}) {
                    if (difference >= length) {
                        continue;
                    }
                    if (difference >= 0) {
                        java.lang.reflect.Array.set(b, difference + 1, one(kind));
                    }
                    int actual = publicMismatch(kind, a, b, 1, length);
                    if (actual != difference) {
                        throw new AssertionError("public kind=" + kind + " length=" + length +
                                                 " difference=" + difference + " actual=" + actual);
                    }
                    if (difference >= 0) {
                        java.lang.reflect.Array.set(b, difference + 1, zero(kind));
                    }
                }
            }
        }
        float[] fa = new float[PREFIX + 16], fb = fa.clone();
        double[] da = new double[PREFIX + 16], db = da.clone();
        for (int at : new int[] {1, 127, 128, 1267, PREFIX - 1, PREFIX, PREFIX + 1}) {
            fa[at] = Float.intBitsToFloat(0x7fc00001);
            fb[at] = Float.intBitsToFloat(0x7fc00002);
            da[at] = Double.longBitsToDouble(0x7ff8000000000001L);
            db[at] = Double.longBitsToDouble(0x7ff8000000000002L);
            if (Arrays.mismatch(fa, fb) != -1 || Arrays.mismatch(da, db) != -1) {
                throw new AssertionError("NaN payload mismatch at " + at);
            }
            fa[at] = -0.0f; fb[at] = 0.0f;
            da[at] = -0.0d; db[at] = 0.0d;
            if (Arrays.mismatch(fa, fb) != at || Arrays.mismatch(da, db) != at) {
                throw new AssertionError("signed zero mismatch at " + at);
            }
            fa[at] = fb[at] = 0.0f;
            da[at] = db[at] = 0.0d;
        }
        byte[] a = new byte[PREFIX + 8], b = a.clone();
        expect(IllegalArgumentException.class, () -> Arrays.mismatch(a, 2, 1, b, 0, 1));
        expect(ArrayIndexOutOfBoundsException.class, () -> Arrays.mismatch(a, -1, 1, b, 0, 1));
        expect(ArrayIndexOutOfBoundsException.class, () -> Arrays.mismatch(a, 0, a.length + 1, b, 0, 1));
        expect(NullPointerException.class, () -> Arrays.mismatch((byte[]) null, 0, 0, b, 0, 0));
    }

    private static Object newArray(int kind, int length) {
        return switch (kind) {
            case 0 -> new byte[length]; case 1 -> new boolean[length];
            case 2 -> new char[length]; case 3 -> new short[length];
            case 4 -> new int[length]; case 5 -> new long[length];
            case 6 -> new float[length]; default -> new double[length];
        };
    }

    private static Object one(int kind) {
        return switch (kind) {
            case 0 -> (byte) 1; case 1 -> true; case 2 -> (char) 1; case 3 -> (short) 1;
            case 4 -> 1; case 5 -> 1L; case 6 -> 1.0f; default -> 1.0d;
        };
    }

    private static Object zero(int kind) {
        return switch (kind) {
            case 0 -> (byte) 0; case 1 -> false; case 2 -> (char) 0; case 3 -> (short) 0;
            case 4 -> 0; case 5 -> 0L; case 6 -> 0.0f; default -> 0.0d;
        };
    }

    private static int publicMismatch(int kind, Object a, Object b, int from, int length) {
        int end = from + length;
        return switch (kind) {
            case 0 -> Arrays.mismatch((byte[]) a, from, end, (byte[]) b, from, end);
            case 1 -> Arrays.mismatch((boolean[]) a, from, end, (boolean[]) b, from, end);
            case 2 -> Arrays.mismatch((char[]) a, from, end, (char[]) b, from, end);
            case 3 -> Arrays.mismatch((short[]) a, from, end, (short[]) b, from, end);
            case 4 -> Arrays.mismatch((int[]) a, from, end, (int[]) b, from, end);
            case 5 -> Arrays.mismatch((long[]) a, from, end, (long[]) b, from, end);
            case 6 -> Arrays.mismatch((float[]) a, from, end, (float[]) b, from, end);
            default -> Arrays.mismatch((double[]) a, from, end, (double[]) b, from, end);
        };
    }

    private static void expect(Class<? extends Throwable> type, Runnable call) {
        try {
            call.run();
        } catch (Throwable ex) {
            if (ex.getClass() == type) {
                return;
            }
            throw new AssertionError("expected " + type + " but got " + ex, ex);
        }
        throw new AssertionError("missing " + type);
    }

    private static final String MARKER = "@@bounded-mismatch ";

    private static void idealDriver() throws Exception {
        String test = AArch64VectorizedMismatchDispatchTest.class.getName();
        List<String> flags = new ArrayList<>(List.of(
                "-Xbootclasspath/a:.", "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI",
                "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED",
                "--add-exports=java.base/jdk.internal.util=ALL-UNNAMED",
                "--enable-native-access=ALL-UNNAMED",
                "-XX:-TieredCompilation", "-XX:-BackgroundCompilation",
                "-XX:CompileThreshold=100000000", "-XX:+UseCountedLoopSafepoints",
                "-XX:LoopStripMiningIter=1000", "-XX:CompileCommand=quiet"));
        List<String> methods = new ArrayList<>();
        for (String storage : new String[] {"heap", "native"}) {
            for (int scale = 0; scale <= 3; scale++) {
                String name = storage + "Large" + scale;
                methods.add(name);
                flags.add("-XX:CompileCommand=compileonly," + test + "::" + name);
                flags.add("-XX:CompileCommand=PrintIdealPhase," + test + "::" + name + ",BEFORE_MATCHING");
            }
        }
        String fallback = "jdk.internal.util.ArraysSupport::vectorizedMismatch";
        flags.add("-XX:CompileCommand=compileonly," + fallback);
        flags.add("-XX:CompileCommand=PrintIdealPhase," + fallback + ",BEFORE_MATCHING");
        flags.add(test);
        flags.add("ideal-child");
        OutputAnalyzer output = ProcessTools.executeProcess(ProcessTools.createLimitedTestJavaProcessBuilder(flags));
        Path capture = Path.of("AArch64VectorizedMismatchDispatchTest-ideal.log").toAbsolutePath();
        Files.writeString(capture, output.getStdout() + "\n" + output.getStderr());
        System.out.println("Ideal graph capture: " + capture);
        output.shouldHaveExitValue(0);
        Map<String, List<String>> dumps = new HashMap<>();
        String current = null;
        for (String line : output.getStdout().lines().toList()) {
            if (line.startsWith(MARKER)) {
                current = line.substring(MARKER.length());
                if (!current.equals("end")) {
                    if (dumps.put(current, new ArrayList<>()) != null) {
                        throw new AssertionError("duplicate graph " + current);
                    }
                }
            } else if (current != null && !current.equals("end")) {
                dumps.get(current).add(line);
            }
        }
        if (dumps.size() != methods.size() + 1) {
            throw new AssertionError("missing compilation graphs: " + dumps.keySet());
        }
        for (String name : methods) {
            new Graph(dumps.get(name)).verifyPrefix(name.charAt(name.length() - 1) - '0');
        }
        new Graph(dumps.get("fallback")).verifyPollingBody();
        System.out.println("Verified eight bounded leaves with full-range Java fallbacks and the polling callee");
    }

    private static void compile(WhiteBox wb, Method method, String name) {
        System.out.println(MARKER + name);
        System.out.flush();
        if (!wb.enqueueMethodForCompilation(method, 4) || wb.getMethodCompilationLevel(method) != 4) {
            throw new AssertionError("not C2 compiled: " + method);
        }
    }

    private static void idealChild() throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        // Above the interpreter leaf bound, this profiles the Java implementation itself.
        for (int i = 0; i < 30; i++) {
            int scale = i & 3;
            ArraysSupport.vectorizedMismatch(HA, BASE + 1, HB, BASE + 1, (2 * LARGE) >> scale, scale);
            ArraysSupport.vectorizedMismatch(null, NA.address() + 1, null, NB.address() + 1,
                                             (2 * LARGE) >> scale, scale);
        }
        for (String storage : new String[] {"heap", "native"}) {
            for (int scale = 0; scale <= 3; scale++) {
                boolean nativeMemory = storage.equals("native");
                for (int i = 0; i < 30; i++) {
                    large(nativeMemory, scale, 1);
                }
                String name = storage + "Large" + scale;
                Method method = nativeMemory
                        ? AArch64VectorizedMismatchDispatchTest.class.getDeclaredMethod(name, long.class, long.class)
                        : AArch64VectorizedMismatchDispatchTest.class.getDeclaredMethod(
                                name, byte[].class, long.class, byte[].class, long.class);
                compile(wb, method, name);
                checkRaw(large(nativeMemory, scale, 1), LARGE >> scale, scale, -1, name);
            }
        }
        Method fallback = ArraysSupport.class.getDeclaredMethod("vectorizedMismatch",
                Object.class, long.class, Object.class, long.class, int.class, int.class);
        compile(wb, fallback, "fallback");
        System.out.println(MARKER + "end");
    }

    // IR counts establish dispatch presence. These checks follow actual input edges,
    // rather than accepting an unrelated 2048 constant or return poll in the same graph.
    private static final class Graph {
        private record Node(int id, String name, int[] inputs, String detail) {}
        private static final Pattern NODE = Pattern.compile("^\\s*o?(\\d+)\\s+(\\w+)\\s+===(.*?)\\[\\[.*?\\]\\](.*)$");
        private static final Pattern INT = Pattern.compile("#int:(-?\\d+)");
        private static final Set<String> REGIONS = Set.of("Region", "Loop", "CountedLoop",
                "LongCountedLoop", "OuterStripMinedLoop");
        private final Map<Integer, Node> nodes = new HashMap<>();

        Graph(List<String> lines) {
            if (lines == null) {
                throw new AssertionError("missing graph");
            }
            for (String line : lines) {
                Matcher m = NODE.matcher(line);
                if (!m.matches()) {
                    continue;
                }
                List<Integer> inputs = new ArrayList<>();
                for (String token : m.group(3).replace('(', ' ').replace(')', ' ').trim().split("\\s+")) {
                    if (token.equals("|")) {
                        break;
                    }
                    if (token.equals("_")) {
                        inputs.add(-1);
                    } else if (token.matches("o?\\d+")) {
                        inputs.add(Integer.valueOf(token.replace("o", "")));
                    }
                }
                int id = Integer.parseInt(m.group(1));
                if (nodes.put(id, new Node(id, m.group(2),
                        inputs.stream().mapToInt(Integer::intValue).toArray(), m.group(4))) != null) {
                    throw new AssertionError("more than one compilation graph in one capture");
                }
            }
            if (nodes.isEmpty()) {
                throw new AssertionError("empty graph");
            }
        }

        private List<Node> named(String name) {
            return nodes.values().stream().filter(n -> n.name().equals(name)).toList();
        }

        private Node input(Node n, int index) {
            return index < n.inputs().length ? nodes.get(n.inputs()[index]) : null;
        }

        private void constantArgument(Node call, int index, int expected) {
            Node argument = input(call, index);
            Matcher value = argument == null ? null : INT.matcher(argument.detail());
            if (argument == null || !argument.name().equals("ConI") || !value.find() ||
                    Integer.parseInt(value.group(1)) != expected) {
                throw new AssertionError("wrong argument " + index + " of " + call + ": " + argument +
                                         "; expected " + expected);
            }
        }

        void verifyPrefix(int scale) {
            List<Node> leaves = named("CallLeaf").stream()
                    .filter(n -> n.detail().contains("# vectorizedMismatch")).toList();
            List<Node> fallback = named("CallStaticJava").stream()
                    .filter(n -> n.detail().contains("ArraysSupport::vectorizedMismatch")).toList();
            if (leaves.size() != 1 || fallback.size() != 1) {
                throw new AssertionError("expected one bounded leaf and one Java fallback: " +
                                         leaves + "; " + fallback);
            }
            // TypeFunc::Parms is 5. The leaf takes address,address,int,int.
            constantArgument(leaves.getFirst(), 7, PREFIX >> scale);
            constantArgument(leaves.getFirst(), 8, scale);
            // The Java call keeps both original object/long pairs, then length and scale.
            constantArgument(fallback.getFirst(), 11, LARGE >> scale);
            constantArgument(fallback.getFirst(), 12, scale);
        }

        private List<Integer> controls(Node node) {
            List<Integer> result = new ArrayList<>();
            if (REGIONS.contains(node.name())) {
                for (int i = 1; i < node.inputs().length; i++) {
                    if (node.inputs()[i] >= 0) {
                        result.add(node.inputs()[i]);
                    }
                }
            } else if (node.inputs().length > 0 && node.inputs()[0] >= 0) {
                result.add(node.inputs()[0]);
            }
            return result;
        }

        private boolean inLoop(Node node) {
            ArrayDeque<Integer> work = new ArrayDeque<>(controls(node));
            Set<Integer> seen = new HashSet<>();
            while (!work.isEmpty()) {
                int id = work.pop();
                if (id == node.id()) {
                    return true;
                }
                Node next = nodes.get(id);
                if (next == null) {
                    throw new AssertionError("missing control node " + id);
                }
                if (seen.add(id) && !next.name().equals("Start")) {
                    work.addAll(controls(next));
                }
            }
            return false;
        }

        void verifyPollingBody() {
            boolean leaf = named("CallLeaf").stream()
                    .anyMatch(n -> n.detail().contains("# vectorizedMismatch"));
            boolean poll = named("SafePoint").stream().anyMatch(this::inLoop);
            if (leaf || !poll) {
                throw new AssertionError("the Java fallback must contain its polling loop: leaf=" + leaf +
                                         " polls=" + named("SafePoint"));
            }
        }
    }

    public static void main(String[] args) throws Exception {
        String mode = args.length == 0 ? "" : args[0];
        switch (mode) {
            case "semantic" -> {
                verifyAll();
                runLarge(null);
                System.out.println("Bounded mismatch semantic fixtures passed");
            }
            case "ideal" -> idealDriver();
            case "ideal-child" -> idealChild();
            default -> TestFramework.runWithFlags(
                    "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED",
                    "--add-exports=java.base/jdk.internal.util=ALL-UNNAMED",
                    "--enable-native-access=ALL-UNNAMED",
                    "-XX:-TieredCompilation", "-XX:+UseCountedLoopSafepoints",
                    "-XX:LoopStripMiningIter=1000");
        }
    }
}
