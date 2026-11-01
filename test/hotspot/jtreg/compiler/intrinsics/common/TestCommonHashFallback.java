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
 * @test id=level1
 * @summary Bounded C1 hash fallbacks preserve typed and dynamic callers and live state
 * @requires vm.compiler1.enabled
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @requires vm.opt.final.UseVectorizedHashCodeIntrinsic == true
 * @modules java.base/jdk.internal.util:+open
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox jdk.test.whitebox.code.NMethod
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @compile/module=java.base jdk/internal/util/HashPrivateProbe.java
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseCommonIntrinsics -XX:CompileCommand=inline,jdk.internal.util.ArraysSupport::hashCode -XX:CompileCommand=inline,jdk.internal.util.ArraysSupport::hashCodeOfUnsigned -XX:CompileCommand=inline,jdk.internal.util.ArraysSupport::hashCodeOfUTF16 -XX:CompileCommand=dontinline,compiler.intrinsics.common.TestCommonHashFallback::hash* compiler.intrinsics.common.TestCommonHashFallback 1
 */

/*
 * @test id=level3
 * @summary Bounded profiling C1 hash fallbacks preserve all typed callers and live state
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @requires vm.opt.final.UseVectorizedHashCodeIntrinsic == true
 * @modules java.base/jdk.internal.util:+open
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox jdk.test.whitebox.code.NMethod
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @compile/module=java.base jdk/internal/util/HashPrivateProbe.java
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseCommonIntrinsics -XX:CompileCommand=inline,jdk.internal.util.ArraysSupport::hashCode -XX:CompileCommand=inline,jdk.internal.util.ArraysSupport::hashCodeOfUnsigned -XX:CompileCommand=inline,jdk.internal.util.ArraysSupport::hashCodeOfUTF16 -XX:CompileCommand=dontinline,compiler.intrinsics.common.TestCommonHashFallback::hash* compiler.intrinsics.common.TestCommonHashFallback 3
 */

package compiler.intrinsics.common;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.ByteOrder;
import jdk.internal.util.ArraysSupport;
import jdk.internal.util.HashPrivateProbe;
import jdk.test.whitebox.WhiteBox;
import jdk.test.whitebox.code.NMethod;

public class TestCommonHashFallback {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();
    private static final int SMALL = 64;
    private static final int LARGE = 65537;
    private static final int SEED = -13;
    private static final int[] INTS = new int[LARGE + 3];
    private static final short[] SHORTS = new short[INTS.length];
    private static final char[] CHARS = new char[INTS.length];
    private static final byte[] BYTES = new byte[INTS.length];
    private static final byte[] UTF16 = new byte[INTS.length * 2];
    private static volatile int sink;

    public static int hashInts(int n) { return ArraysSupport.hashCode(INTS, 1, n, SEED); }
    public static int hashShorts(int n) { return ArraysSupport.hashCode(SHORTS, 1, n, SEED); }
    public static int hashChars(int n) { return ArraysSupport.hashCode(CHARS, 1, n, SEED); }
    public static int hashBytes(int n) { return ArraysSupport.hashCode(BYTES, 1, n, SEED); }
    public static int hashUnsigned(int n) { return ArraysSupport.hashCodeOfUnsigned(BYTES, 1, n, SEED); }
    public static int hashUTF16(int n) { return ArraysSupport.hashCodeOfUTF16(UTF16, 1, n, SEED); }

    private static class Box {
        final byte[] data = {7, -11};
        int count;
    }

    public static int hashLive(Box witness, int[] input, int n, int seed) {
        byte[] local = witness.data;
        int keep = seed * 17 + local[1];
        int result;
        try {
            result = ArraysSupport.hashCode(input, 1, n, seed) ^ keep;
        } catch (NullPointerException expected) {
            result = keep + 11;
        } finally {
            witness.count++;
            sink = keep ^ local[0];
        }
        if (local != witness.data) {
            throw new AssertionError("live reference changed");
        }
        return result + local[0];
    }

    private static int invoke(int kind, int length) {
        return switch (kind) {
            case 0 -> hashInts(length);
            case 1 -> hashShorts(length);
            case 2 -> hashChars(length);
            case 3 -> hashBytes(length);
            case 4 -> hashUnsigned(length);
            case 5 -> hashUTF16(length);
            default -> throw new AssertionError(kind);
        };
    }

    private static int expected(int kind, int length) {
        int result = SEED;
        for (int i = 1; i <= length; i++) {
            int value = switch (kind) {
                case 0 -> INTS[i];
                case 1 -> SHORTS[i];
                case 2, 5 -> CHARS[i];
                case 3 -> BYTES[i];
                case 4 -> BYTES[i] & 255;
                default -> throw new AssertionError(kind);
            };
            result = 31 * result + value;
        }
        return result;
    }

    private static int compile(Method method, int level) {
        if (!WB.enqueueMethodForCompilation(method, level)
                || WB.getMethodCompilationLevel(method) != level) {
            throw new AssertionError("C1 compilation failed: " + method);
        }
        return NMethod.get(method, false).compile_id;
    }

    private static void stable(Method method, int id) {
        NMethod code = NMethod.get(method, false);
        if (code == null || code.compile_id != id) {
            throw new AssertionError("ordinary hash fallback invalidated " + method);
        }
    }

    private static void equal(int actual, int expected) {
        if (actual != expected) {
            throw new AssertionError("hash/state mismatch: " + actual + " != " + expected);
        }
    }

    private static int dynamic(Method method, Object array, int length, int tag) throws Exception {
        try {
            return (Integer) method.invoke(null, array, 1, length, SEED, tag);
        } catch (InvocationTargetException exception) {
            if (exception.getCause() instanceof RuntimeException cause) throw cause;
            if (exception.getCause() instanceof Error cause) throw cause;
            throw exception;
        }
    }

    private static void dynamicException(Method method, Object array, int tag,
                                         Class<? extends RuntimeException> expected) throws Exception {
        try {
            dynamic(method, array, SMALL, tag);
            throw new AssertionError("expected " + expected.getName());
        } catch (RuntimeException exception) {
            if (exception.getClass() != expected) throw exception;
        }
    }

    private static void checkDynamic(int level) throws Exception {
        // The generated caller uses an ordinary invokestatic, without a method-handle adapter.
        Method method = HashPrivateProbe.make().getDeclaredMethod("call", Object.class,
                int.class, int.class, int.class, int.class);
        method.setAccessible(true);
        WB.testSetDontInlineMethod(method, true);
        for (int i = 0; i < 3000; i++) sink = dynamic(method, INTS, SMALL, 10);
        int id = compile(method, level);
        int traps = WB.getMethodTrapCount(method, "intrinsic");
        Object[] arrays = {INTS, SHORTS, CHARS, BYTES, BYTES, UTF16};
        int[] tags = {10, 9, 5, 8, 4, 5};
        for (int kind = 0; kind < arrays.length; kind++) {
            for (int length : new int[] {SMALL, LARGE, SMALL}) {
                equal(dynamic(method, arrays[kind], length, tags[kind]), expected(kind, length));
                stable(method, id);
                equal(WB.getMethodTrapCount(method, "intrinsic"), traps);
            }
        }
        dynamicException(method, null, 10, NullPointerException.class);
        dynamicException(method, INTS, 8, ClassCastException.class);
        dynamicException(method, INTS, 99, IllegalArgumentException.class);
        stable(method, id);
        equal(WB.getMethodTrapCount(method, "intrinsic"), traps);
        System.out.println("Dynamic hash fallbacks preserve C1 level " + level);
    }

    public static void main(String[] args) throws Exception {
        int level = Integer.parseInt(args[0]);
        boolean little = ByteOrder.nativeOrder() == ByteOrder.LITTLE_ENDIAN;
        for (int i = 0; i < INTS.length; i++) {
            INTS[i] = i * 0x1020304 + 0x88776655;
            SHORTS[i] = (short) INTS[i];
            CHARS[i] = (char) INTS[i];
            BYTES[i] = (byte) INTS[i];
            UTF16[2 * i + (little ? 0 : 1)] = (byte) CHARS[i];
            UTF16[2 * i + (little ? 1 : 0)] = (byte) (CHARS[i] >>> 8);
        }
        String[] names = {"hashInts", "hashShorts", "hashChars", "hashBytes", "hashUnsigned", "hashUTF16"};
        Method[] callers = new Method[names.length];
        int[] ids = new int[names.length];
        for (int kind = 0; kind < names.length; kind++) {
            for (int i = 0; i < 3000; i++) {
                sink = invoke(kind, SMALL);
            }
            callers[kind] = TestCommonHashFallback.class.getMethod(names[kind], int.class);
            ids[kind] = compile(callers[kind], level);
        }
        for (int kind = 0; kind < names.length; kind++) {
            equal(invoke(kind, LARGE), expected(kind, LARGE));
            stable(callers[kind], ids[kind]);
            int small = expected(kind, SMALL);
            for (int i = 0; i < 3000; i++) {
                equal(invoke(kind, SMALL), small);
            }
            stable(callers[kind], ids[kind]);
        }
        for (Class<?> type : new Class<?>[] {int[].class, short[].class, char[].class, byte[].class}) {
            Method wrapper = ArraysSupport.class.getMethod("hashCode", type, int.class, int.class, int.class);
            equal(WB.getMethodTrapCount(wrapper, "intrinsic"), 0);
        }
        for (String name : new String[] {"hashCodeOfUnsigned", "hashCodeOfUTF16"}) {
            Method wrapper = ArraysSupport.class.getMethod(name, byte[].class, int.class, int.class, int.class);
            equal(WB.getMethodTrapCount(wrapper, "intrinsic"), 0);
        }
        Box witness = new Box();
        for (int i = 0; i < 3000; i++) {
            sink = hashLive(witness, INTS, SMALL, SEED);
        }
        Method live = TestCommonHashFallback.class.getMethod("hashLive", Box.class, int[].class, int.class, int.class);
        int liveId = compile(live, level);
        int count = witness.count;
        int keep = SEED * 17 + witness.data[1];
        equal(hashLive(witness, INTS, LARGE, SEED), (expected(0, LARGE) ^ keep) + witness.data[0]);
        equal(witness.count, ++count);
        stable(live, liveId);
        equal(hashLive(witness, null, SMALL, SEED), keep + 11 + witness.data[0]);
        equal(witness.count, ++count);
        equal(sink, keep ^ witness.data[0]);
        stable(live, liveId);
        checkDynamic(level);
        System.out.println("Typed hash fallbacks preserve C1 level " + level);
    }
}
