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
 */

/*
 * @test
 * @summary Preserve caller roots, integer state and deoptimization state through GC in a C2 callee.
 * @requires vm.debug == true & vm.compiler2.enabled
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:-TieredCompilation
 *      -XX:-UseOnStackReplacement -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -XX:+VerifyRegisterAllocator -XX:+VerifyOops -XX:+VerifyBeforeGC -XX:+VerifyAfterGC
 *      -XX:CompileCommand=compileonly,TestSharedSpillGC::outer
 *      -XX:CompileCommand=compileonly,TestSharedSpillGC::caller
 *      -XX:CompileCommand=dontinline,TestSharedSpillGC::outer
 *      -XX:CompileCommand=dontinline,TestSharedSpillGC::leaf
 *      TestSharedSpillGC
 */
import java.lang.reflect.Method;
import java.util.Random;
import jdk.test.whitebox.WhiteBox;

public class TestSharedSpillGC {
    static final WhiteBox WB = WhiteBox.getWhiteBox();
    static final Method OUTER;
    static final Method CALLER;
    static volatile int mode;
    static volatile int gcCalls;
    static volatile int deoptCalls;
    static volatile long sink;
    static {
        try {
            OUTER = TestSharedSpillGC.class.getDeclaredMethod("outer", Box.class, Box.class, Box.class, long[].class, int.class);
            CALLER = TestSharedSpillGC.class.getDeclaredMethod("caller", Box[].class, long[].class, int.class);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }
    static final class Box {
        final long bits;
        final byte[] payload = new byte[257];
        Box(long value) { bits = value; payload[13] = (byte)value; }
        long check() {
            if (payload[13] != (byte)bits) throw new AssertionError("damaged root");
            return bits;
        }
    }
    static long leaf(int i, Box a, Box b, Box c) {
        if (i == 3 && mode != 0) {
            WB.fullGC();
            gcCalls++;
            if (mode == 2) {
                WB.deoptimizeMethod(OUTER);
                deoptCalls++;
            } else if (mode == 3) {
                WB.deoptimizeFrames(true);
                deoptCalls++;
            }
        }
        return a.check() + b.check() - c.check() + i;
    }
    static long outer(Box a, Box b, Box c, long[] seeds, int count) {
        long x0 = seeds[0];
        long x1 = seeds[1];
        long x2 = seeds[2];
        long x3 = seeds[3];
        long x4 = seeds[4];
        long x5 = seeds[5];
        long x6 = seeds[6];
        long x7 = seeds[7];
        long x8 = seeds[8];
        long x9 = seeds[9];
        long x10 = seeds[10];
        long x11 = seeds[11];
        for (int i = 0; i < count; i++) {
            long mix = (x0 ^ x4) + Long.rotateRight(x8, 7);
            long call = leaf(i, a, b, c);
            x0 = Long.rotateLeft(x0 + mix + call, 1);
            x1 = Long.rotateLeft(x1 + mix + call, 2);
            x2 = Long.rotateLeft(x2 + mix + call, 3);
            x3 = Long.rotateLeft(x3 + mix + call, 4);
            x4 = Long.rotateLeft(x4 + mix + call, 5);
            x5 = Long.rotateLeft(x5 + mix + call, 6);
            x6 = Long.rotateLeft(x6 + mix + call, 7);
            x7 = Long.rotateLeft(x7 + mix + call, 8);
            x8 = Long.rotateLeft(x8 + mix + call, 9);
            x9 = Long.rotateLeft(x9 + mix + call, 10);
            x10 = Long.rotateLeft(x10 + mix + call, 11);
            x11 = Long.rotateLeft(x11 + mix + call, 12);
        }
        return x0 + x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10 + x11;
    }
    static long caller(Box[] roots, long[] seeds, int count) {
        Box a = roots[0], b = roots[1], c = roots[2];
        long value = outer(a, b, c, seeds, count);
        if (a != roots[0] || b != roots[1] || c != roots[2]) throw new AssertionError("root identity");
        return value ^ a.check() ^ b.check() ^ c.check();
    }
    static long reference(Box[] roots, long[] seeds, int count) {
        long[] state = seeds.clone();
        for (int i = 0; i < count; i++) {
            long mix = (state[0] ^ state[4]) + ((state[8] >>> 7) | (state[8] << 57));
            long call = roots[0].bits + roots[1].bits - roots[2].bits + i;
            for (int j = 0; j < state.length; j++) {
                long v = state[j] + mix + call;
                state[j] = (v << (j + 1)) | (v >>> (63 - j));
            }
        }
        long sum = 0;
        for (long value : state) sum += value;
        return sum ^ roots[0].bits ^ roots[1].bits ^ roots[2].bits;
    }
    static void compileC2(Method method) {
        if (!WB.enqueueMethodForCompilation(method, 4) || WB.getMethodCompilationLevel(method) != 4) {
            throw new AssertionError("C2 compilation missing: " + method);
        }
    }
    public static void main(String[] args) {
        Random random = new Random(0x534f454d41504cL);
        long[] seeds = new long[12];
        for (int i = 0; i < seeds.length; i++) seeds[i] = random.nextLong();
        Box[] roots = {new Box(random.nextLong()), new Box(random.nextLong()), new Box(random.nextLong())};
        for (int i = 0; i < 3000; i++) sink = caller(roots, seeds, 8);
        for (int action = 0; action < 4; action++) {
            mode = 0;
            compileC2(OUTER);
            compileC2(CALLER);
            mode = action;
            long expected = reference(roots, seeds, 16);
            long actual = caller(roots, seeds, 16);
            if (actual != expected) throw new AssertionError("mode " + action);
            if (action >= 2 && WB.getMethodCompilationLevel(OUTER) != 0) {
                throw new AssertionError("outer was not deoptimized");
            }
        }
        if (gcCalls != 3 || deoptCalls != 2) throw new AssertionError("hook counts");
        System.out.println("GC/deoptimization state checks=4 forcedGC=3 activeDeopt=2");
    }
}
