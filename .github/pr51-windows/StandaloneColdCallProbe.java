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


import java.lang.management.ManagementFactory;
import java.lang.reflect.Method;
import java.util.SplittableRandom;
import java.util.Locale;
import jdk.test.whitebox.WhiteBox;

// Qualification-only extraction from PR51's TestColdCallSpillPlacement.
// The four method bodies below are unchanged. Helpers perform their ordinary
// action=0 behavior; no explicit GC/deoptimization/throw is requested here.
public class StandaloneColdCallProbe {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();
    private static final int COLD=0, HOT=1, TWO=2, MIXED=3, VOID=4, MAPS=5, EXCEPTION=6, ALIASES=7;
    private static final int ITERATIONS=256;
    private static volatile long sideEffect, sink;
    private static volatile int helperCalls;
    private static String selectedCase;
    private static final class Box { long value; Box(long value) { this.value=value; } }
    private static final class Signal extends RuntimeException { }
    private static long helperA(long value) { sideEffect ^= value; helperCalls++; return value+1; }
    private static long helperB(long value) { sideEffect ^= value; return value+3; }
    private static void helperVoid(long value) { sideEffect ^= value; }
    private static int testInitializeCompiler() { return 42; }

    private static long kernel(int kind, long[] table, long seed) {
        long bits = seed, total = 0;
        int state = (int) seed & 31;
        for (int i = 0; i < ITERATIONS; i++) {
            long a = table[state], b = table[(state + 1) & 31];
            long c = table[(state + 2) & 31], d = table[(state + 3) & 31];
            long e = table[(state + 4) & 31], f = table[(state + 5) & 31];
            long g = table[(state + 6) & 31], h = table[(state + 7) & 31];
            int wa = (int) (a >>> 32) & 31, wb = (int) (b >>> 32) & 31;
            int wc = (int) (c >>> 32) & 31, wd = (int) (d >>> 32) & 31;
            int we = (int) (e >>> 32) & 31, wf = (int) (f >>> 32) & 31;
            int wg = (int) (g >>> 32) & 31, wh = (int) (h >>> 32) & 31;
            if (kind == ALIASES) {
                // These bytecode locals need the same value when deoptimizing
                // at the call. Charging each occurrence would exceed 10%.
                long a0 = a, a1 = a, a2 = a, a3 = a, a4 = a, a5 = a, a6 = a, a7 = a;
                long a8 = a, a9 = a, a10 = a, a11 = a, a12 = a, a13 = a, a14 = a, a15 = a;
                if ((i & 63) == 0) helperA(7);
                a = a0 + a1 + a2 + a3 + a4 + a5 + a6 + a7
                        + a8 + a9 + a10 + a11 + a12 + a13 + a14 + a15;
            }
            if (kind == HOT || kind == MIXED) helperB(11);
            if (kind == TWO) {
                // Each site is below 10%, but together they exceed 10%.
                if ((i & 15) == 0) helperA(7);
                if ((i & 15) == 1) helperB(9);
            } else if ((i & 63) == 0) {
                if (kind == VOID) {
                    helperVoid(7);
                } else if (kind == EXCEPTION) {
                    try {
                        helperA(7);
                    } catch (Signal expected) {
                        total ^= a + c + e + g;
                    }
                } else if (kind != HOT && kind != ALIASES) {
                    helperA(7);
                }
            }
            long next = (a + (bits >>> wa)) ^ (b + (bits >>> wb));
            next += (c ^ (bits << wc)) + (d ^ (bits << wd));
            next ^= (e + (bits >>> we)) + (f + (bits >>> wf));
            next += (g ^ (bits << wg)) ^ (h ^ (bits << wh));
            total += next;
            bits = Long.rotateLeft(bits ^ next, wa + wc + we + wg);
            state = (int) ((a >>> 48) + (b >>> 48) + (c >>> 48) + bits) & 31;
        }
        return total ^ bits;
    }

    private static long testCold(long[] table, long seed, Box anchor) { return kernel(COLD, table, seed); }

    private static long testJoins(long[] table, long seed, Box anchor) {
        long bits = seed, total = 0;
        for (int i = 0; i < 1024; i++) {
            // Every p value is needed for the load index and again after the
            // loads. This makes pressure high at exactly three packed loads,
            // without introducing more array values as possible witnesses.
            long p0 = Long.rotateLeft(bits * 3L, 3);
            long p1 = Long.rotateLeft(bits * 5L, 7);
            long p2 = Long.rotateLeft(bits * 7L, 11);
            long p3 = Long.rotateLeft(bits * 11L, 17);
            long p4 = Long.rotateLeft(bits * 13L, 23);
            long p5 = Long.rotateLeft(bits * 17L, 29);
            long p6 = Long.rotateLeft(bits * 19L, 31);
            long p7 = Long.rotateLeft(bits * 23L, 37);
            long p8 = Long.rotateLeft(bits * 29L, 41);
            long p9 = Long.rotateLeft(bits * 31L, 43);
            long p10 = Long.rotateLeft(bits * 37L, 47);
            long p11 = Long.rotateLeft(bits * 41L, 53);
            int index = (int) (p0 ^ p1 ^ p2 ^ p3 ^ p4 ^ p5 ^ p6 ^ p7 ^ p8 ^ p9 ^ p10 ^ p11) & 31;
            long a = table[index];
            long b = table[(index + 1) & 31];
            long c = table[(index + 2) & 31];
            long mix = a ^ b ^ c;
            long token = Long.rotateLeft(p0 + mix, 3) + Long.rotateLeft(p1 ^ mix, 7)
                    + Long.rotateLeft(p2 + mix, 11) + Long.rotateLeft(p3 ^ mix, 17)
                    + Long.rotateLeft(p4 + mix, 23) + Long.rotateLeft(p5 ^ mix, 29)
                    + Long.rotateLeft(p6 + mix, 31) + Long.rotateLeft(p7 ^ mix, 37)
                    + Long.rotateLeft(p8 + mix, 41) + Long.rotateLeft(p9 ^ mix, 43)
                    + Long.rotateLeft(p10 + mix, 47) + Long.rotateLeft(p11 ^ mix, 53);
            // All p temporaries die before the first returning-call join.
            if ((i & 255) == 0) token += helperA(7);

            // The returned value anchors this pressure burst after the first
            // join. All q values contribute to the shift, then remain needed
            // individually. The packed entries stay live across the peak.
            long q0 = Long.rotateLeft(token * 3L, 3);
            long q1 = Long.rotateLeft(token * 5L, 7);
            long q2 = Long.rotateLeft(token * 7L, 11);
            long q3 = Long.rotateLeft(token * 11L, 17);
            long q4 = Long.rotateLeft(token * 13L, 23);
            long q5 = Long.rotateLeft(token * 17L, 29);
            long q6 = Long.rotateLeft(token * 19L, 31);
            long q7 = Long.rotateLeft(token * 23L, 37);
            long q8 = Long.rotateLeft(token * 29L, 41);
            long q9 = Long.rotateLeft(token * 31L, 43);
            long q10 = Long.rotateLeft(token * 37L, 47);
            long q11 = Long.rotateLeft(token * 41L, 53);
            int qShift = (int) (q0 ^ q1 ^ q2 ^ q3 ^ q4 ^ q5 ^ q6 ^ q7 ^ q8 ^ q9 ^ q10 ^ q11) & 63;
            token += (q0 >>> qShift) + (q1 << (qShift + 3)) + (q2 >>> (qShift + 7)) + (q3 << (qShift + 11))
                    + (q4 >>> (qShift + 17)) + (q5 << (qShift + 23)) + (q6 >>> (qShift + 29)) + (q7 << (qShift + 31))
                    + (q8 >>> (qShift + 37)) + (q9 << (qShift + 41)) + (q10 >>> (qShift + 43)) + (q11 << (qShift + 47));
            // The q values die before a distinct second returning-call join.
            if ((i & 511) == 1) token ^= helperB(9);

            long r0 = Long.rotateLeft(token * 3L, 3);
            long r1 = Long.rotateLeft(token * 5L, 7);
            long r2 = Long.rotateLeft(token * 7L, 11);
            long r3 = Long.rotateLeft(token * 11L, 17);
            long r4 = Long.rotateLeft(token * 13L, 23);
            long r5 = Long.rotateLeft(token * 17L, 29);
            long r6 = Long.rotateLeft(token * 19L, 31);
            long r7 = Long.rotateLeft(token * 23L, 37);
            long r8 = Long.rotateLeft(token * 29L, 41);
            long r9 = Long.rotateLeft(token * 31L, 43);
            long r10 = Long.rotateLeft(token * 37L, 47);
            long r11 = Long.rotateLeft(token * 41L, 53);
            int rShift = (int) (r0 ^ r1 ^ r2 ^ r3 ^ r4 ^ r5 ^ r6 ^ r7 ^ r8 ^ r9 ^ r10 ^ r11) & 63;
            long fanout = (r0 >>> rShift) + (r1 << (rShift + 3)) + (r2 >>> (rShift + 7)) + (r3 << (rShift + 11))
                    + (r4 >>> (rShift + 17)) + (r5 << (rShift + 23)) + (r6 >>> (rShift + 29)) + (r7 << (rShift + 31))
                    + (r8 >>> (rShift + 37)) + (r9 << (rShift + 41)) + (r10 >>> (rShift + 43)) + (r11 << (rShift + 47));
            // Raw packed values cannot die until after the final pressure
            // burst: their shifts depend on its complete result.
            long next = (a >>> (int) fanout) ^ (b << (int) (fanout >>> 8)) ^ (c >>> (int) (fanout >>> 16));
            total += next ^ fanout;
            bits = Long.rotateLeft(bits ^ next ^ token, 17);
        }
        return total ^ bits;
    }

    private static long testHot(long[] table, long seed, Box anchor) { return kernel(HOT, table, seed); }

    private static long invoke(long[] table, long seed, Box anchor) {
        return switch (selectedCase) {
            case "cold" -> testCold(table,seed,anchor);
            case "joins" -> testJoins(table,seed,anchor);
            case "hot" -> testHot(table,seed,anchor);
            default -> throw new AssertionError(selectedCase);
        };
    }
    private record Sample(long count, long elapsed, long checksum) { }
    private static Sample sample(long[] table, Box anchor, long nanos) {
        long start=System.nanoTime(), count=0, checksum=0;
        do {
            checksum ^= invoke(table,(count & 63)+1,anchor);
            count++;
        } while (System.nanoTime()-start < nanos);
        long elapsed=System.nanoTime()-start;
        sink=checksum;
        return new Sample(count,elapsed,checksum);
    }
    private static void check(Sample sample,long[] expected) {
        long checksum=0;
        if (((sample.count()/64)&1)!=0) for (long value:expected) checksum ^= value;
        for (int i=0;i<(sample.count()%64);i++) checksum ^= expected[i];
        if (sample.checksum()!=checksum) throw new AssertionError("Measured checksum mismatch");
    }
    private static void compile(Method method) {
        WB.setBooleanVMFlag("UseCompiler",true);
        System.out.println("BEGIN_COMPILE "+method.getName());
        if (!WB.enqueueMethodForCompilation(method,4) || WB.getMethodCompilationLevel(method)!=4)
            throw new AssertionError("Missing normal C2 compilation: "+method);
        System.out.println("END_COMPILE "+method.getName());
    }
    private static void requireC2(Method method) {
        if (WB.getMethodCompilationLevel(method)!=4 || WB.isMethodCompiled(method,true))
            throw new AssertionError("Target lost normal C2 residency");
    }
    public static void main(String[] args) throws Exception {
        if (args.length!=3) throw new IllegalArgumentException("cold|joins|hot baseline|off|on activation|timing");
        selectedCase=args[0];
        String methodName=switch(selectedCase) {case "cold"->"testCold";case "joins"->"testJoins";case "hot"->"testHot";default->throw new AssertionError(selectedCase);};
        if (!args[1].equals("baseline")) {
            boolean expected=args[1].equals("on");
            if (WB.getBooleanVMFlag("UseColdCallSpillDeferral")!=expected)
                throw new AssertionError("Wrong feature flag");
        }
        boolean timing=args[2].equals("timing");
        if (!timing && !args[2].equals("activation")) throw new AssertionError(args[2]);
        var compiler=ManagementFactory.getCompilationMXBean();
        var runtime=ManagementFactory.getRuntimeMXBean();
        if (!compiler.isCompilationTimeMonitoringSupported()) throw new AssertionError("Compiler monitoring unavailable");
        compiler.getTotalCompilationTime(); runtime.getUptime();
        Method target=StandaloneColdCallProbe.class.getDeclaredMethod(methodName,long[].class,long.class,Box.class);
        Method kernel=StandaloneColdCallProbe.class.getDeclaredMethod("kernel",int.class,long[].class,long.class);
        Method dispatch=StandaloneColdCallProbe.class.getDeclaredMethod("invoke",long[].class,long.class,Box.class);
        Method sampler=StandaloneColdCallProbe.class.getDeclaredMethod("sample",long[].class,Box.class,long.class);
        compile(StandaloneColdCallProbe.class.getDeclaredMethod("testInitializeCompiler"));
        long[] table=new long[32];
        var random=new SplittableRandom(0x663618688L);
        for (int i=0;i<table.length;i++) table[i]=random.nextLong();
        Box anchor=new Box(random.nextLong());
        WB.setBooleanVMFlag("UseCompiler",false);
        WB.markMethodProfiled(target); WB.markMethodProfiled(kernel); WB.markMethodProfiled(dispatch);
        long[] expected=new long[64];
        for (int i=0;i<expected.length;i++) expected[i]=invoke(table,i+1,anchor);
        if (WB.isMethodCompiled(target)) throw new AssertionError("Reference was not interpreted");
        for (String helper:new String[]{"helperA","helperB","helperVoid"})
            compile(StandaloneColdCallProbe.class.getDeclaredMethod(helper,long.class));
        compile(target);
        for (int i=0;i<expected.length;i++) if (invoke(table,i+1,anchor)!=expected[i])
            throw new AssertionError("C2 result mismatch at "+i);
        requireC2(target);
        compile(dispatch);
        WB.markMethodProfiled(sampler);
        check(sample(table,anchor,20_000_000L),expected);
        compile(sampler);
        check(sample(table,anchor,timing ? 6_000_000_000L : 20_000_000L),expected);
        requireC2(target);
        if (!timing) {
            System.out.printf("ACTIVATION_OK case=%s target=%s normal_c2=true%n",selectedCase,methodName);
            return;
        }
        long boundary=runtime.getUptime(), before=compiler.getTotalCompilationTime();
        for (int i=0;i<5;i++) {
            Sample sample=sample(table,anchor,700_000_000L);
            check(sample,expected);
            System.out.printf(Locale.ROOT,"SAMPLE count=%d elapsed_ns=%d checksum=%d ns_per_op=%.6f%n",
                sample.count(),sample.elapsed(),sample.checksum(),sample.elapsed()/(double)sample.count());
        }
        long end=runtime.getUptime(), measured=compiler.getTotalCompilationTime()-before;
        requireC2(target);
        System.out.printf("TIMING_OK case=%s target=%s normal_c2=true boundary_uptime_ms=%d end_uptime_ms=%d compiler_before_ms=%d compiler_measured_ms=%d%n",
                selectedCase,methodName,boundary,end,before,measured);
    }
}
