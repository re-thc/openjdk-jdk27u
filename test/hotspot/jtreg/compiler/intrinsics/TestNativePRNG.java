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
 * @test id=c1
 * @summary Test the NativePRNG.getRandomBytes0 intrinsic of C1
 * @requires os.family == "linux" | os.family == "mac"
 * @requires vm.compiler1.enabled & vm.gc.Serial & vm.gc.G1
 * @library /test/lib
 * @modules java.base/sun.security.provider:open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *                   -Xcomp -XX:TieredStopAtLevel=1 -XX:+UseSerialGC
 *                   -XX:CompileCommand=compileonly,sun.security.provider.NativePRNG*::*
 *                   -XX:CompileCommand=compileonly,${test.main.class}::fill*
 *                   ${test.main.class} 1
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *                   -Xcomp -XX:TieredStopAtLevel=1 -XX:+UseG1GC
 *                   -XX:CompileCommand=compileonly,sun.security.provider.NativePRNG*::*
 *                   -XX:CompileCommand=compileonly,${test.main.class}::fill*
 *                   ${test.main.class} 1
 */

/*
 * @test id=c1-z
 * @summary Test the NativePRNG.getRandomBytes0 intrinsic of C1 with ZGC
 * @requires os.family == "linux" | os.family == "mac"
 * @requires vm.compiler1.enabled & vm.gc.Z
 * @library /test/lib
 * @modules java.base/sun.security.provider:open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *                   -Xcomp -XX:TieredStopAtLevel=1 -XX:+UseZGC
 *                   -XX:CompileCommand=compileonly,sun.security.provider.NativePRNG*::*
 *                   -XX:CompileCommand=compileonly,${test.main.class}::fill*
 *                   ${test.main.class} 1
 */

/*
 * @test id=c2
 * @summary Test the NativePRNG.getRandomBytes0 intrinsic of C2
 * @requires os.family == "linux" | os.family == "mac"
 * @requires vm.compiler2.enabled & vm.gc.Serial & vm.gc.G1
 * @library /test/lib
 * @modules java.base/sun.security.provider:open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *                   -Xcomp -XX:-TieredCompilation -XX:+UseSerialGC
 *                   -XX:CompileCommand=compileonly,sun.security.provider.NativePRNG*::*
 *                   -XX:CompileCommand=compileonly,${test.main.class}::fill*
 *                   ${test.main.class} 4
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *                   -Xcomp -XX:-TieredCompilation -XX:+UseG1GC
 *                   -XX:CompileCommand=compileonly,sun.security.provider.NativePRNG*::*
 *                   -XX:CompileCommand=compileonly,${test.main.class}::fill*
 *                   ${test.main.class} 4
 */

/*
 * @test id=c2-z
 * @summary Test the NativePRNG.getRandomBytes0 intrinsic of C2 with ZGC
 * @requires os.family == "linux" | os.family == "mac"
 * @requires vm.compiler2.enabled & vm.gc.Z
 * @library /test/lib
 * @modules java.base/sun.security.provider:open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *                   -Xcomp -XX:-TieredCompilation -XX:+UseZGC
 *                   -XX:CompileCommand=compileonly,sun.security.provider.NativePRNG*::*
 *                   -XX:CompileCommand=compileonly,${test.main.class}::fill*
 *                   ${test.main.class} 4
 */

/*
 * @test id=fallback
 * @summary Test NativePRNG without the getRandomBytes0 intrinsic
 * @requires os.family == "linux" | os.family == "mac"
 * @library /test/lib
 * @modules java.base/sun.security.provider:open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *                   -Xint ${test.main.class} 0
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *                   -Xcomp -XX:DisableIntrinsic=_nativePRNG_getRandomBytes
 *                   -XX:CompileCommand=compileonly,sun.security.provider.NativePRNG*::*
 *                   -XX:CompileCommand=compileonly,${test.main.class}::fill*
 *                   ${test.main.class} 0
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *                   -Xcomp -XX:-InlineNatives
 *                   -XX:CompileCommand=compileonly,sun.security.provider.NativePRNG*::*
 *                   -XX:CompileCommand=compileonly,${test.main.class}::fill*
 *                   ${test.main.class} 0
 */

package compiler.intrinsics;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.reflect.Method;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicBoolean;

import jdk.test.whitebox.WhiteBox;

public class TestNativePRNG {

    private static final WhiteBox WB = WhiteBox.getWhiteBox();

    // The most bytes that NativePRNG gets from the OS in one call
    private static final int MAX_CHUNK = 4096;

    private static final Method GET_RANDOM_BYTES0;
    private static final Method GET_BLOCKING_RANDOM_BYTES0;
    private static final MethodHandle GET_RANDOM_BYTES0_MH;

    static {
        try {
            Class<?> c = Class.forName("sun.security.provider.NativePRNG");
            GET_RANDOM_BYTES0 = c.getDeclaredMethod("getRandomBytes0",
                                                    byte[].class, int.class, int.class);
            GET_RANDOM_BYTES0.setAccessible(true);
            GET_BLOCKING_RANDOM_BYTES0 = c.getDeclaredMethod("getBlockingRandomBytes0",
                                                             byte[].class);
            GET_BLOCKING_RANDOM_BYTES0.setAccessible(true);
            GET_RANDOM_BYTES0_MH = MethodHandles.lookup().unreflect(GET_RANDOM_BYTES0);
        } catch (ReflectiveOperationException e) {
            throw new RuntimeException(e);
        }
    }

    // The test methods are compiled with the invocation of getRandomBytes0
    // inlined.
    static int fill(byte[] b, int off, int len) throws Throwable {
        return (int) GET_RANDOM_BYTES0_MH.invokeExact(b, off, len);
    }

    static int fillAll(byte[] b) throws Throwable {
        return (int) GET_RANDOM_BYTES0_MH.invokeExact(b, 0, b.length);
    }

    static int fillConstants(byte[] b) throws Throwable {
        return (int) GET_RANDOM_BYTES0_MH.invokeExact(b, 5, 100);
    }

    static int fillConstantOffset(byte[] b, int len) throws Throwable {
        return (int) GET_RANDOM_BYTES0_MH.invokeExact(b, 3, len);
    }

    static int fillConstantLength(byte[] b, int off) throws Throwable {
        return (int) GET_RANDOM_BYTES0_MH.invokeExact(b, off, 19);
    }

    public static void main(String[] args) throws Throwable {
        int level = Integer.parseInt(args[0]);

        checkIntrinsic(level);
        testRanges();
        testConstants();
        testBlocking();
        testApi();
        testWithGC();
        checkCompiled(level);
        System.out.println("PASSED");
    }

    // The compiler that the test runs for must have the intrinsic, and no
    // compiler must have it when level is 0.
    private static void checkIntrinsic(int level) {
        if (level != 0) {
            if (!WB.isIntrinsicAvailable(GET_RANDOM_BYTES0, level)) {
                throw new RuntimeException("No intrinsic at level " + level);
            }
        } else if (WB.getBooleanVMFlag("UseCompiler")) {
            for (int l : new int[] {1, 4}) {
                if (WB.isIntrinsicAvailable(GET_RANDOM_BYTES0, l)) {
                    throw new RuntimeException("Intrinsic at level " + l);
                }
            }
        }
    }

    // The test methods are compiled by their first call because of -Xcomp
    private static void checkCompiled(int level) throws Exception {
        if (level == 0 && !WB.getBooleanVMFlag("UseCompiler")) {
            return;
        }
        for (Method m : TestNativePRNG.class.getDeclaredMethods()) {
            if (!m.getName().startsWith("fill")) {
                continue;
            }
            int actual = WB.getMethodCompilationLevel(m);
            if (level != 0 && actual != level) {
                throw new RuntimeException(m + " is compiled at level " + actual
                                           + ", expected " + level);
            }
            if (level == 0 && actual == 0) {
                throw new RuntimeException(m + " is not compiled");
            }
        }
    }

    // Checks that 8 bytes at a time are not all zero. The chance of a
    // failure by good random bytes is 2^-64 per block.
    private static void checkRandom(byte[] b, int off, int len, String what) {
        for (int i = off; i + 8 <= off + len; i += 8) {
            long v = 0;
            for (int j = 0; j < 8; j++) {
                v |= b[i + j];
            }
            if (v == 0) {
                throw new RuntimeException(what + ": bytes " + i + ".." + (i + 7)
                                           + " are zero, len " + len);
            }
        }
    }

    // Calls fill() on many ranges. A byte outside of the range must stay 0,
    // and each byte in it must get a value other than 0 in some of the calls
    // (the chance of a failure is 2^-128 per byte).
    private static void testRanges() throws Throwable {
        int[] offs = {0, 1, 2, 3, 7, 8, 9, 15, 16, 17, 31, 63, 64, MAX_CHUNK - 1, MAX_CHUNK};
        int[] lens = {0, 1, 2, 3, 4, 7, 8, 9, 15, 16, 17, 31, 32, 33, 63, 64, 65, 255, 256, 257,
                      1023, 1024, 1025, MAX_CHUNK - 1, MAX_CHUNK, MAX_CHUNK + 1,
                      2 * MAX_CHUNK - 1, 2 * MAX_CHUNK, 2 * MAX_CHUNK + 1, (1 << 20) + 5};
        for (int off : offs) {
            for (int len : lens) {
                if (len > (1 << 16) && off > 3) {
                    continue;
                }
                testRange(off, len);
            }
        }
    }

    private static void testRange(int off, int len) throws Throwable {
        int tail = 9;
        byte[] b = new byte[off + len + tail];
        byte[] seen = new byte[len];
        for (int rep = 0; rep < 16; rep++) {
            int err = fill(b, off, len);
            if (err != 0) {
                throw new RuntimeException("getRandomBytes0 returned " + err);
            }
            for (int i = 0; i < len; i++) {
                seen[i] |= b[off + i];
            }
        }
        for (int i = 0; i < off; i++) {
            if (b[i] != 0) {
                throw new RuntimeException("Byte " + i + " before range " + off + "+" + len + " was written");
            }
        }
        for (int i = off + len; i < b.length; i++) {
            if (b[i] != 0) {
                throw new RuntimeException("Byte " + i + " after range " + off + "+" + len + " was written");
            }
        }
        for (int i = 0; i < len; i++) {
            if (seen[i] == 0) {
                throw new RuntimeException("Byte " + (off + i) + " of range " + off + "+" + len + " is zero");
            }
        }
    }

    // The same with arguments that are constants in the compiled code
    private static void testConstants() throws Throwable {
        byte[] b = new byte[105];
        byte[] seen = new byte[105];
        for (int rep = 0; rep < 16; rep++) {
            if (fillConstants(b) != 0) {
                throw new RuntimeException("fillConstants failed");
            }
            for (int i = 0; i < b.length; i++) {
                seen[i] |= b[i];
            }
        }
        for (int i = 0; i < 5; i++) {
            if (b[i] != 0) {
                throw new RuntimeException("fillConstants wrote byte " + i);
            }
        }
        for (int i = 5; i < 105; i++) {
            if (seen[i] == 0) {
                throw new RuntimeException("fillConstants did not write byte " + i);
            }
        }

        for (int len : new int[] {0, 1, 5, 64, 1000, MAX_CHUNK + 1}) {
            b = new byte[3 + len];
            fillConstantOffset(b, len);
            checkRandom(b, 3, len, "constant offset");
            if (b[0] != 0 || b[1] != 0 || b[2] != 0) {
                throw new RuntimeException("fillConstantOffset wrote before the range");
            }
        }

        for (int off : new int[] {0, 1, 5, 64, 1000, MAX_CHUNK + 1}) {
            b = new byte[off + 19];
            fillConstantLength(b, off);
            if (!Arrays.equals(b, 0, off, new byte[off], 0, off)) {
                throw new RuntimeException("fillConstantLength wrote before the range");
            }
            checkRandom(b, off, 16, "constant length");
        }

        b = new byte[1000];
        fillAll(b);
        checkRandom(b, 0, b.length, "fillAll");
    }

    // The method that blocks is called through JNI, whatever the compiler
    private static void testBlocking() throws Throwable {
        for (int len : new int[] {0, 1, 7, 8, 16, 100, 8191, 8192, 8193, 100_000}) {
            byte[] b = new byte[len];
            GET_BLOCKING_RANDOM_BYTES0.invoke(null, (Object) b);
            checkRandom(b, 0, len, "getBlockingRandomBytes0");
        }
    }

    // The sizes around the chunks that NativePRNG gets in one call
    private static void testApi() throws Exception {
        int[] sizes = {0, 1, 2, 15, 16, 17, 100, MAX_CHUNK - 1, MAX_CHUNK, MAX_CHUNK + 1,
                       2 * MAX_CHUNK - 1, 2 * MAX_CHUNK, 2 * MAX_CHUNK + 1, 3 * MAX_CHUNK + 7,
                       (1 << 16) + 1, (1 << 20) + 3};
        for (String alg : new String[] {"NativePRNG", "NativePRNGBlocking", "NativePRNGNonBlocking"}) {
            SecureRandom sr = SecureRandom.getInstance(alg);
            for (int size : sizes) {
                byte[] b = new byte[size];
                sr.nextBytes(b);
                checkRandom(b, 0, size, alg + ".nextBytes");
                byte[] seed = sr.generateSeed(size);
                if (seed.length != size) {
                    throw new RuntimeException(alg + ".generateSeed returned " + seed.length + " bytes");
                }
                checkRandom(seed, 0, size, alg + ".generateSeed");
                if (size >= 16) {
                    byte[] c = new byte[size];
                    sr.nextBytes(c);
                    if (Arrays.equals(b, c)) {
                        throw new RuntimeException(alg + ".nextBytes returned the same bytes twice");
                    }
                }
            }
        }

        // the bytes are mixed with those of a SHA1PRNG once there is a seed
        SecureRandom sr = SecureRandom.getInstance("NativePRNG");
        sr.setSeed(new byte[] {1, 2, 3});
        for (int size : sizes) {
            byte[] b = new byte[size];
            sr.nextBytes(b);
            checkRandom(b, 0, size, "mixed nextBytes");
        }
    }

    // The GC must not move or free the array while the intrinsic writes to
    // it, and no write may get lost by a concurrent GC.
    private static void testWithGC() throws Throwable {
        AtomicBoolean stop = new AtomicBoolean();
        Thread garbage = new Thread(() -> {
            byte[][] keep = new byte[64][];
            for (int i = 0; !stop.get(); i++) {
                keep[i % keep.length] = new byte[1024 + (int) ((i * 7919L) % (64 * 1024))];
            }
        });
        garbage.start();
        try {
            long end = System.nanoTime() + 2_000_000_000L;
            for (int i = 0; i < 20_000 && System.nanoTime() < end; i++) {
                byte[] b = new byte[(1 << 16) + (i % 1024)];
                int err = fillAll(b);
                if (err != 0) {
                    throw new RuntimeException("getRandomBytes0 returned " + err);
                }
                checkRandom(b, 0, b.length, "with GC");
                if (i % 1000 == 999) {
                    System.gc();
                }
            }
        } finally {
            stop.set(true);
            garbage.join();
        }
    }
}
