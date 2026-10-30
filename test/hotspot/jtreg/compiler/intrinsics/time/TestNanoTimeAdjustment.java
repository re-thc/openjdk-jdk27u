/*
 * Copyright (c) 2026. All rights reserved.
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
 *
 */

/*
 * @test
 * @summary Check nano time adjustment clock contracts and compiler controls
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @library /test/lib
 * @modules java.base/jdk.internal.misc
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xint -XX:-InlineNanoTimeAdjustment compiler.intrinsics.time.TestNanoTimeAdjustment cold
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xint -XX:+InlineNanoTimeAdjustment compiler.intrinsics.time.TestNanoTimeAdjustment interpreter
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xmixed -Xbatch -XX:TieredStopAtLevel=1 -XX:+InlineNanoTimeAdjustment compiler.intrinsics.time.TestNanoTimeAdjustment c1
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xmixed -Xbatch -XX:-TieredCompilation -XX:-InlineNanoTimeAdjustment compiler.intrinsics.time.TestNanoTimeAdjustment off
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xmixed -Xbatch -XX:-TieredCompilation compiler.intrinsics.time.TestNanoTimeAdjustment default
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xmixed -Xbatch -XX:-TieredCompilation -XX:+InlineNanoTimeAdjustment compiler.intrinsics.time.TestNanoTimeAdjustment on
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xmixed -Xbatch -XX:-TieredCompilation -XX:+InlineNanoTimeAdjustment -XX:DisableIntrinsic=_getNanoTimeAdjustment compiler.intrinsics.time.TestNanoTimeAdjustment disabled
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xmixed -Xbatch -XX:-TieredCompilation -XX:+InlineNanoTimeAdjustment -XX:-InlineNatives compiler.intrinsics.time.TestNanoTimeAdjustment disabled
 */

package compiler.intrinsics.time;

import java.math.BigInteger;
import java.lang.reflect.Method;
import jdk.internal.misc.VM;
import jdk.test.whitebox.WhiteBox;

public class TestNanoTimeAdjustment {
    static final WhiteBox WB = WhiteBox.getWhiteBox();
    static final long LIMIT = 1L << 32;
    static final BigInteger BILLION = BigInteger.valueOf(1_000_000_000L);
    static volatile long sink;
    static int checks, ambiguous, finallyCount;

    public static long call(long offset) { return VM.getNanoTimeAdjustment(offset); }

    static void validate(long offset) {
        long before = System.currentTimeMillis();
        long adjustment = call(offset);
        long after = System.currentTimeMillis();
        if (after < before) {
            ambiguous++;
            return; // report observed realtime reversal rather than assume monotonic UTC
        }
        BigInteger low = BigInteger.valueOf(Math.floorDiv(before, 1000)).subtract(BigInteger.valueOf(offset));
        BigInteger high = BigInteger.valueOf(Math.floorDiv(after, 1000)).subtract(BigInteger.valueOf(offset));
        BigInteger max = BigInteger.valueOf(LIMIT);
        boolean outside = low.compareTo(max) >= 0 || high.compareTo(max.negate()) <= 0;
        if (outside) {
            if (adjustment != -1) throw new AssertionError("sentinel offset=" + offset + " value=" + adjustment);
        } else if (adjustment == -1) {
            boolean interior = low.compareTo(max.negate()) > 0 && high.compareTo(max) < 0;
            // -1 can also be an actual adjustment one nanosecond before offset.
            BigInteger epochMinusOne = BigInteger.valueOf(offset).multiply(BILLION).subtract(BigInteger.ONE);
            BigInteger minEpoch = BigInteger.valueOf(before).multiply(BigInteger.valueOf(1_000_000));
            BigInteger maxEpoch = BigInteger.valueOf(after).add(BigInteger.ONE).multiply(BigInteger.valueOf(1_000_000));
            if (interior && (epochMinusOne.compareTo(minEpoch) < 0 || epochMinusOne.compareTo(maxEpoch) >= 0))
                throw new AssertionError("unexpected sentinel offset=" + offset);
            ambiguous++;
        } else {
            BigInteger epoch = BigInteger.valueOf(offset).multiply(BILLION).add(BigInteger.valueOf(adjustment));
            BigInteger minEpoch = BigInteger.valueOf(before).multiply(BigInteger.valueOf(1_000_000));
            BigInteger maxEpoch = BigInteger.valueOf(after).add(BigInteger.ONE).multiply(BigInteger.valueOf(1_000_000));
            if (epoch.compareTo(minEpoch) < 0 || epoch.compareTo(maxEpoch) >= 0)
                throw new AssertionError("ordering/range offset=" + offset + " adjustment=" + adjustment + " bracket=" + before + ":" + after);
        }
        checks++;
    }

    public static long exceptionalCall(long offset, int selector, RuntimeException expected) {
        try {
            long value = VM.getNanoTimeAdjustment(offset);
            sink ^= value;
            if (selector % 3 == 0) throw expected;
            return value;
        } finally {
            finallyCount++;
        }
    }

    static void exceptionControl(long offset) {
        RuntimeException expected = new RuntimeException("deliberate caller exception");
        int caught = 0, normal = 0, outerFinally = 0;
        finallyCount = 0;
        for (int i = 0; i < 12_000; i++) {
            boolean shouldThrow = i % 3 == 0;
            try {
                long value = exceptionalCall((i & 1) == 0 ? offset : Long.MIN_VALUE, i, expected);
                sink ^= value;
                if (shouldThrow) throw new AssertionError("caller exception missing");
                normal++;
            } catch (RuntimeException actual) {
                if (!shouldThrow || actual != expected) throw new AssertionError("caller exception identity/control", actual);
                caught++;
            } finally {
                outerFinally++;
            }
        }
        if (caught != 4_000 || normal != 8_000 || finallyCount != 12_000 || outerFinally != 12_000)
            throw new AssertionError("caller catch/finally counts");
        System.out.println("EXCEPTION_CONTROL caught=" + caught + " normal=" + normal
            + " innerFinally=" + finallyCount + " outerFinally=" + outerFinally);
    }


    private static void compile(Method method, int level) throws Exception {
        if (!WB.enqueueMethodForCompilation(method, level)) throw new AssertionError("Compilation rejected: " + method);
        for (int i = 0; i < 500 && WB.getMethodCompilationLevel(method) != level; i++) Thread.sleep(10);
        if (!WB.isMethodCompiled(method) || WB.getMethodCompilationLevel(method) != level)
            throw new AssertionError("Expected normal-entry compilation level " + level + ": " + method);
    }

    public static void main(String[] args) throws Exception {
        String mode = args[0];
        Method method = TestNanoTimeAdjustment.class.getDeclaredMethod("call", long.class);
        Method exceptional = TestNanoTimeAdjustment.class.getDeclaredMethod("exceptionalCall", long.class, int.class, RuntimeException.class);
        Method nativeMethod = VM.class.getDeclaredMethod("getNanoTimeAdjustment", long.class);
        long current = System.currentTimeMillis() / 1000;
        if (WB.isMethodCompiled(method)) throw new AssertionError("First explicit test invocation already compiled");
        validate(current - 1024); // Before test warmup; bootstrap may already have bound this VM native.
        if (!mode.equals("cold") && !mode.equals("interpreter")) {
            RuntimeException profile = new RuntimeException("profile both caller paths");
            for (int i = 0; i < 100; i++) {
                try { sink ^= exceptionalCall(current - 1024, i, profile); }
                catch (RuntimeException actual) { if (actual != profile) throw new AssertionError(actual); }
            }
        }
        if (mode.equals("default") || mode.equals("on") || mode.equals("off") || mode.equals("disabled")) {
            boolean available = WB.isIntrinsicAvailable(nativeMethod, 4);
            if (available != (mode.equals("default") || mode.equals("on"))) throw new AssertionError("C2 availability mismatch: " + mode);
            compile(method, 4);
            compile(exceptional, 4);
        } else if (mode.equals("c1")) {
            if (WB.isIntrinsicAvailable(nativeMethod, 1)) throw new AssertionError("Unexpected C1 intrinsic");
            compile(method, 1);
            compile(exceptional, 1);
        } else if (!mode.equals("cold") && !mode.equals("interpreter")) {
            throw new AssertionError("Unknown mode " + mode);
        }
        long[] offsets = {Long.MIN_VALUE, Long.MAX_VALUE, 0, -1, current, current - 1024,
            current + 1024, current - LIMIT - 1, current - LIMIT, current - LIMIT + 1,
            current + LIMIT - 1, current + LIMIT, current + LIMIT + 1};
        int rounds = mode.equals("cold") ? 1 : 100;
        for (int i = 0; i < rounds; i++) for (long value : offsets) validate(value);
        if (!mode.equals("cold")) exceptionControl(current - 1024);
        if ((mode.equals("cold") || mode.equals("interpreter")) && WB.isMethodCompiled(method))
            throw new AssertionError("Unexpected compiled fallback mode " + mode);
        int expectedLevel = mode.equals("c1") ? 1 : mode.equals("cold") || mode.equals("interpreter") ? 0 : 4;
        if (WB.getMethodCompilationLevel(method) != expectedLevel ||
            (expectedLevel != 0 && WB.getMethodCompilationLevel(exceptional) != expectedLevel))
            throw new AssertionError("Compilation level changed during correctness checks");
        System.out.println("PASS mode=" + mode + " checks=" + checks + " ambiguous=" + ambiguous + " level=" + WB.getMethodCompilationLevel(method));
    }
}
