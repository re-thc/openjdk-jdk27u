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
 * @summary AVX-512 common shifts and Keccak agree with Java for tails and aliases
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires os.simpleArch == "x64"
 * @requires vm.cpu.features ~= ".*avx512_vbmi2.*"
 * @modules java.base/sun.security.provider
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox compiler.intrinsics.common.TestCommonBigIntegerShifts
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:UseAVX=3 -XX:+UseSHA3Intrinsics -XX:+UseCommonIntrinsics -Xint --add-opens=java.base/sun.security.provider=ALL-UNNAMED --add-opens=java.base/java.math=ALL-UNNAMED compiler.intrinsics.common.TestCommonAVX512Intrinsics
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:UseAVX=3 -XX:+UseSHA3Intrinsics -XX:+UseCommonIntrinsics -Xbatch -XX:TieredStopAtLevel=1 --add-opens=java.base/sun.security.provider=ALL-UNNAMED --add-opens=java.base/java.math=ALL-UNNAMED compiler.intrinsics.common.TestCommonAVX512Intrinsics
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:UseAVX=3 -XX:+UseSHA3Intrinsics -XX:+UseCommonIntrinsics -Xbatch -XX:TieredStopAtLevel=3 --add-opens=java.base/sun.security.provider=ALL-UNNAMED --add-opens=java.base/java.math=ALL-UNNAMED compiler.intrinsics.common.TestCommonAVX512Intrinsics
 */

package compiler.intrinsics.common;

import java.lang.reflect.Field;
import java.math.BigInteger;
import java.util.Arrays;
import java.util.Random;
import jdk.test.whitebox.WhiteBox;
import sun.security.provider.SHA3;
import sun.security.provider.SHA3Parallel;

public class TestCommonAVX512Intrinsics {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();
    private static final Field STATES;
    private static final SHA3Parallel PERMUTATION;

    static {
        try {
            STATES = SHA3Parallel.class.getDeclaredField("lanesArr");
            STATES.setAccessible(true);
            PERMUTATION = new SHA3Parallel.Shake128Parallel(new byte[4][168]);
        } catch (ReflectiveOperationException | java.security.InvalidAlgorithmParameterException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private static int check(long[][] input, boolean quad) throws Throwable {
        long[][] actual = new long[4][];
        long[][] expected = new long[4][];
        for (int i = 0; i < 4; i++) {
            int alias = -1;
            for (int j = 0; j < i; j++) {
                if (input[i] == input[j]) {
                    alias = j;
                    break;
                }
            }
            actual[i] = alias < 0 ? input[i].clone() : actual[alias];
            expected[i] = alias < 0 ? input[i].clone() : expected[alias];
        }
        for (int i = 0; i < (quad ? 4 : 2); i++) {
            SHA3.keccak(expected[i]);
        }
        STATES.set(PERMUTATION, actual);
        int result = PERMUTATION.squeezeBlock(quad ? 4 : 2);
        // The native implementation returns 0; the Java fallback returns 1.
        if (result != 0 && result != 1) {
            throw new AssertionError("Keccak return value: " + result);
        }
        for (int i = 0; i < 4; i++) {
            if (!Arrays.equals(actual[i], expected[i])) {
                throw new AssertionError("Keccak state " + i + ", quad=" + quad);
            }
        }
        return result;
    }

    public static void main(String[] args) throws Throwable {
        if (WB.getIntVMFlag("UseAVX") != 3 || !Boolean.TRUE.equals(WB.getBooleanVMFlag("UseSHA3Intrinsics"))) {
            throw new AssertionError("AVX-512 SHA-3 execution is required");
        }
        if (Boolean.TRUE.equals(WB.getBooleanVMFlag("UseCompiler"))) {
            Class<?> holder = Class.forName("sun.security.provider.SHA3Parallel");
            if (!WB.isIntrinsicAvailable(holder.getDeclaredMethod("quadKeccak",
                    long[].class, long[].class, long[].class, long[].class), 1)) {
                throw new AssertionError("quad Keccak common backend is unavailable");
            }
            for (String name : new String[] {"shiftLeftImplWorker", "shiftRightImplWorker"}) {
                if (!WB.isIntrinsicAvailable(BigInteger.class.getDeclaredMethod(name,
                        int[].class, int[].class, int.class, int.class, int.class), 1)) {
                    throw new AssertionError("AVX-512 shift backend is unavailable: " + name);
                }
            }
        }
        Random random = new Random(42);
        long[][] states = new long[4][];
        for (int iteration = 0; iteration < 20_000; iteration++) {
            for (int i = 0; i < states.length; i++) {
                states[i] = random.longs(25 + iteration % 3).toArray();
            }
            if (check(states, false) != 0 || check(states, true) != 0) {
                throw new AssertionError("native AVX-512 Keccak path was not executed");
            }
        }
        for (int iteration = 0; iteration < 100; iteration++) {
            for (int i = 1; i < 4; i++) {
                for (int j = 0; j < i; j++) {
                    long[][] aliased = states.clone();
                    aliased[i] = aliased[j];
                    check(aliased, false);
                    check(aliased, true);
                }
            }
            long[][] aliased = {states[0], states[0], states[0], states[0]};
            check(aliased, false);
            check(aliased, true);
        }
        TestCommonBigIntegerShifts.main(args);
    }
}
