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
 * @summary Check definition/Phi spill deferral costs and Java state across returning calls
 * @requires vm.compiler2.enabled & vm.gc.Serial & (os.arch == "amd64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver compiler.regalloc.TestColdCallSpillPlacement
 */

package compiler.regalloc;

import java.lang.invoke.MethodHandles;
import java.lang.invoke.VarHandle;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.SplittableRandom;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jdk.test.lib.Platform;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class TestColdCallSpillPlacement {
    private static WhiteBox WB;
    private static final int COLD = 0, HOT = 1, TWO = 2, MIXED = 3, VOID = 4, MAPS = 5, EXCEPTION = 6, ALIASES = 7;
    private static final int GC = 1, DEOPT = 2, THROW = 4;
    private static final int ITERATIONS = 256;
    private static final int PROFILE_INVOCATIONS = 64;
    private static volatile long sideEffect;
    private static volatile int action;
    private static volatile int helperCalls, gcEvents, deoptEvents, throwEvents;
    private static Method deoptTarget;
    private static final Object LOCK = new Object();
    private static final Signal SIGNAL = new Signal();
    private static final Object FIRST = new Object(), SECOND = new Object();
    private static final AtomicHolder ATOMIC = new AtomicHolder();
    private static final VarHandle REFERENCE;
    static {
        try {
            REFERENCE = MethodHandles.lookup().findVarHandle(AtomicHolder.class, "reference", Object.class);
        } catch (ReflectiveOperationException error) {
            throw new ExceptionInInitializerError(error);
        }
    }
    private static final class AtomicHolder { volatile Object reference = FIRST; }

    private static final class Box {
        long value;
        Box(long value) { this.value = value; }
    }
    private static final class Signal extends RuntimeException { }

    // Returning helpers stay out of line. Their arguments are constants so a
    // freshly computed argument/result is not an independent selection candidate.
    private static long helperA(long value) {
        sideEffect ^= value;
        helperCalls++;
        int requested = action;
        if (requested != 0) {
            action = 0;
            if ((requested & GC) != 0) { WB.fullGC(); gcEvents++; }
            if ((requested & DEOPT) != 0) { WB.deoptimizeMethod(deoptTarget); deoptEvents++; }
            if ((requested & THROW) != 0) { throwEvents++; throw SIGNAL; }
        }
        return value + 1;
    }
    private static long helperB(long value) {
        sideEffect ^= value;
        return value + 3;
    }
    private static void helperVoid(long value) { sideEffect ^= value; }

    // Force-inline into each test so its constant kind removes other call sites.
    // All eight entries and widths are defined before and consumed after every
    // selected call. Loads are mutable, so none can be rematerialized as a constant.
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

    private static int testInitializeCompiler() { return 42; }

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
    private static long testTwo(long[] table, long seed, Box anchor) { return kernel(TWO, table, seed); }
    private static long testMixed(long[] table, long seed, Box anchor) { return kernel(MIXED, table, seed); }
    private static long testVoid(long[] table, long seed, Box anchor) { return kernel(VOID, table, seed); }
    private static long testAliases(long[] table, long seed, Box anchor) { return kernel(ALIASES, table, seed); }
    private static long testException(long[] table, long seed, Box anchor) { return kernel(EXCEPTION, table, seed); }
    private static long testMaps(long[] table, long seed, Box anchor) {
        Box scalar = new Box(seed + 17);
        double fp = seed * 0.25;
        synchronized (LOCK) {
            return kernel(MAPS, table, seed) ^ scalar.value ^ anchor.value ^ Double.doubleToRawLongBits(fp);
        }
    }

    private static long testAtomic(long[] table, long seed, Box anchor) {
        Object before = ATOMIC.reference;
        Object after = before == FIRST ? SECOND : FIRST;
        Object expected = (seed & 1) == 0 ? before : after;
        boolean success = REFERENCE.compareAndSet(ATOMIC, expected, after);
        return kernel(COLD, table, seed) ^ (success ? 1 : 2);
    }

    // No primitive variable is live across these calls except rematerializable
    // constants. These check candidate type exclusions rather than call result types.
    private static double testFloating(double[] values, boolean cold) {
        double a = values[0], b = values[1], c = values[2], d = values[3];
        double e = values[4], f = values[5], g = values[6], h = values[7];
        if (cold) helperA(7);
        return a + b * c + d * e + f * g + h;
    }
    private static long testOops(Box[] values, boolean cold) {
        Box a = values[0], b = values[1], c = values[2], d = values[3];
        Box e = values[4], f = values[5], g = values[6], h = values[7];
        if (cold) helperA(7);
        return a.value ^ b.value ^ c.value ^ d.value ^ e.value ^ f.value ^ g.value ^ h.value;
    }

    private static long invoke(String name, long[] table, long seed, Box anchor) {
        return switch (name) {
            case "testCold" -> testCold(table, seed, anchor);
            case "testJoins" -> testJoins(table, seed, anchor);
            case "testHot" -> testHot(table, seed, anchor);
            case "testTwo" -> testTwo(table, seed, anchor);
            case "testMixed" -> testMixed(table, seed, anchor);
            case "testVoid" -> testVoid(table, seed, anchor);
            case "testAliases" -> testAliases(table, seed, anchor);
            case "testMaps" -> testMaps(table, seed, anchor);
            case "testAtomic" -> testAtomic(table, seed, anchor);
            case "testException" -> testException(table, seed, anchor);
            default -> throw new AssertionError(name);
        };
    }

    private static void compile(Method method) {
        WB.setBooleanVMFlag("UseCompiler", true);
        System.out.println("BEGIN_COMPILE " + method.getName());
        if (!WB.enqueueMethodForCompilation(method, 4) || WB.getMethodCompilationLevel(method) != 4) {
            throw new AssertionError("C2 compilation failed: " + method);
        }
        System.out.println("END_COMPILE " + method.getName());
    }

    private static void child(boolean enabled, boolean joinsOnly) throws Exception {
        WB = WhiteBox.getWhiteBox();
        if (WB.getBooleanVMFlag("UseColdCallSpillDeferral") != enabled) {
            throw new AssertionError("Unexpected spill-deferral flag value");
        }
        // Complete C2 startup before temporarily disabling compilation for profiling.
        compile(TestColdCallSpillPlacement.class.getDeclaredMethod("testInitializeCompiler"));
        long[] table = new long[32];
        SplittableRandom random = new SplittableRandom(0x663618688L);
        for (int i = 0; i < table.length; i++) table[i] = random.nextLong();
        Box anchor = new Box(random.nextLong());
        Method kernel = TestColdCallSpillPlacement.class.getDeclaredMethod("kernel", int.class, long[].class, long.class);
        String[] names = joinsOnly ? new String[] { "testJoins" }
                : new String[] { "testCold", "testJoins", "testHot", "testTwo", "testMixed", "testVoid", "testMaps", "testException", "testAtomic", "testAliases" };
        for (String name : names) {
            Method method = TestColdCallSpillPlacement.class.getDeclaredMethod(name, long[].class, long.class, Box.class);
            WB.setBooleanVMFlag("UseCompiler", false);
            WB.markMethodProfiled(method);
            WB.markMethodProfiled(kernel);
            if (name.equals("testException")) {
                action = THROW;
                int previousThrows = throwEvents;
                invoke(name, table, 1, anchor);
                if (throwEvents != previousThrows + 1) throw new AssertionError("Handler warmup did not throw");
            }
            long[] expected = new long[PROFILE_INVOCATIONS];
            for (int i = 0; i < expected.length; i++) expected[i] = invoke(name, table, i + 1, anchor);
            if (WB.isMethodCompiled(method)) throw new AssertionError("Unexpected automatic compilation: " + name);
            compile(method);
            for (int i = 0; i < expected.length; i++) {
                Object previousReference = ATOMIC.reference;
                long actual = invoke(name, table, i + 1, anchor);
                if (name.equals("testAtomic")) {
                    boolean changed = ATOMIC.reference != previousReference;
                    if (changed != (((i + 1) & 1) == 0)) {
                        throw new AssertionError("Unexpected successful/failed reference CAS result");
                    }
                }
                if (actual != expected[i]) throw new AssertionError(name + " changed result at " + i);
            }
            if (name.equals("testMaps")) {
                deoptTarget = method;
                int previousCalls = helperCalls, previousGc = gcEvents, previousDeopt = deoptEvents;
                action = GC | DEOPT;
                if (invoke(name, table, 1, anchor) != expected[0]) throw new AssertionError("GC/deoptimization lost state");
                if (action != 0 || WB.isMethodCompiled(method) || helperCalls <= previousCalls
                        || gcEvents != previousGc + 1 || deoptEvents != previousDeopt + 1) {
                    throw new AssertionError("GC/deoptimization hook not executed exactly once");
                }
            }
            if (name.equals("testException")) {
                // The throw occurs at i=0, so its handler contributes these four entries.
                int previousThrows = throwEvents;
                action = THROW;
                long actual = invoke(name, table, 1, anchor);
                if (throwEvents != previousThrows + 1 || WB.getMethodCompilationLevel(method) != 4) {
                    throw new AssertionError("Compiled handler was not retained after the throw");
                }
                long expectedThrow = referenceException(table, 1);
                if (actual != expectedThrow || action != 0) throw new AssertionError("Exception lost live state");
            }
        }
        if (joinsOnly) {
            System.out.println("CORRECTNESS_OK");
            return;
        }
        double[] doubles = { 0.25, 1.5, 2.75, 3.0, 4.125, 5.25, 6.5, 7.75 };
        Box[] boxes = new Box[8];
        for (int i = 0; i < boxes.length; i++) boxes[i] = new Box(random.nextLong());
        Method floating = TestColdCallSpillPlacement.class.getDeclaredMethod("testFloating", double[].class, boolean.class);
        Method oops = TestColdCallSpillPlacement.class.getDeclaredMethod("testOops", Box[].class, boolean.class);
        for (Method method : new Method[] { floating, oops }) {
            WB.setBooleanVMFlag("UseCompiler", false);
            WB.markMethodProfiled(method);
            for (int i = 0; i < PROFILE_INVOCATIONS; i++) {
                testFloating(doubles, (i & 63) == 0);
                testOops(boxes, (i & 63) == 0);
            }
            compile(method);
        }
        double expectedFp = doubles[0] + doubles[1] * doubles[2] + doubles[3] * doubles[4]
                + doubles[5] * doubles[6] + doubles[7];
        if (testFloating(doubles, true) != expectedFp) throw new AssertionError("Floating state lost");
        long expectedOops = 0;
        for (Box box : boxes) expectedOops ^= box.value;
        int previousGc = gcEvents;
        action = GC;
        if (testOops(boxes, true) != expectedOops || action != 0 || gcEvents != previousGc + 1) {
            throw new AssertionError("Oop state lost across GC");
        }
        System.out.println("CORRECTNESS_OK");
    }

    private static long referenceException(long[] table, long seed) {
        // An interpreted instance of the same kernel with a single handler contribution.
        // It is not eligible for standalone compilation by the compile-only directive.
        action = THROW;
        return kernel(EXCEPTION, table, seed);
    }

    private static Set<Integer> deferredRanges(String text) {
        Set<Integer> ranges = new HashSet<>();
        Matcher matcher = Pattern.compile("CCDEFER def=N\\d+ L(\\d+) ").matcher(text);
        while (matcher.find()) ranges.add(Integer.parseInt(matcher.group(1)));
        return ranges;
    }

    private static double traceFrequency(String value) {
        double frequency = Double.parseDouble(value);
        if (!Double.isFinite(frequency) || frequency < 0.0) {
            throw new AssertionError("Invalid spill-placement frequency: " + value);
        }
        return frequency;
    }

    private static boolean roundedEqual(double left, double right) {
        // TraceSpilling prints six significant digits. The native policy test
        // checks strict threshold equality using the unrounded production API.
        return Double.isFinite(left) && Double.isFinite(right)
                && Math.abs(left - right) <= 1e-4 * Math.max(left, right);
    }

    private static boolean loggedAboveMargin(double left, double right) {
        return left > right || (left > 0.0 && roundedEqual(left, right));
    }

    private static final class PhiPlacement {
        final int node, range, block, expectedInputs;
        final boolean pressureDown;
        final double upFrequency, downFrequency;
        final Set<Integer> upDefinitions = new HashSet<>();
        int actualInputs;
        double observedUp, observedDown;

        PhiPlacement(int node, int range, int block, int expectedInputs, boolean pressureDown,
                     double upFrequency, double downFrequency) {
            this.node = node;
            this.range = range;
            this.block = block;
            this.expectedInputs = expectedInputs;
            this.pressureDown = pressureDown;
            this.upFrequency = upFrequency;
            this.downFrequency = downFrequency;
        }
    }

    private static final class PlacementTrace {
        final Map<Integer, Integer> markedNodes = new HashMap<>();
        final Set<Integer> loadDefinitions = new HashSet<>();
        final List<PhiPlacement> phis = new ArrayList<>();
        final Set<NodeLocation> keptBoundaries = new HashSet<>();
    }

    private record JoinPair(int first, int second) { }
    private record NodeLocation(int node, int block) { }

    private static PlacementTrace checkPlacementTrace(String text) {
        Pattern definition = Pattern.compile("CCDEFER def=N(\\d+) L(\\d+) B\\d+ freq=(\\S+) constraint_freq=(\\S+) loadL=([01])");
        Pattern phi = Pattern.compile("CCPHI def=N(\\d+) L(\\d+) B(\\d+) freq=(\\S+) up_freq=(\\S+)"
                + " down_freq=(\\S+) constraint_freq=(\\S+) inputs=(\\d+) pressure_down=([01])");
        Pattern input = Pattern.compile("CCPHI_INPUT phi=N(\\d+) L(\\d+) B(\\d+) pred=B(\\d+) def=N(\\d+)"
                + " up=([01]) deferred=([01]) freq=(\\S+)");
        Pattern boundary = Pattern.compile("CCHRP def=N(\\d+) L(\\d+) B(\\d+) keep=([01]) freq=(\\S+) constraint_freq=(\\S+)");
        Set<Integer> deferred = new HashSet<>();
        Map<Integer, Double> constraintsByRange = new HashMap<>();
        PlacementTrace trace = new PlacementTrace();
        PhiPlacement pending = null;
        for (String line : text.split("\\R")) {
            if (pending != null && line.startsWith("CC") && !line.startsWith("CCPHI_INPUT ")) {
                throw new AssertionError("Missing Phi input records before: " + line);
            }
            if (line.startsWith("CCDEFER ")) {
                Matcher matcher = definition.matcher(line);
                if (!matcher.matches()) throw new AssertionError("Malformed definition trace: " + line);
                int node = Integer.parseInt(matcher.group(1)), range = Integer.parseInt(matcher.group(2));
                double frequency = traceFrequency(matcher.group(3));
                double constraints = traceFrequency(matcher.group(4));
                Double originalConstraints = constraintsByRange.putIfAbsent(range, constraints);
                if (originalConstraints != null && !roundedEqual(originalConstraints, constraints)) {
                    throw new AssertionError("Live-range constraint total changed: " + line);
                }
                if (!loggedAboveMargin(frequency, 10.0 * constraints)) {
                    throw new AssertionError("Definition did not meet the cold-constraint margin: " + line);
                }
                deferred.add(range);
                trace.markedNodes.put(node, range);
                if (matcher.group(5).equals("1")) trace.loadDefinitions.add(node);
            } else if (line.startsWith("CCPHI ")) {
                Matcher matcher = phi.matcher(line);
                if (!matcher.matches()) throw new AssertionError("Malformed Phi trace: " + line);
                int node = Integer.parseInt(matcher.group(1)), range = Integer.parseInt(matcher.group(2));
                int block = Integer.parseInt(matcher.group(3));
                double frequency = traceFrequency(matcher.group(4));
                double up = traceFrequency(matcher.group(5)), down = traceFrequency(matcher.group(6));
                double constraints = traceFrequency(matcher.group(7));
                int inputs = Integer.parseInt(matcher.group(8));
                Double originalConstraints = constraintsByRange.get(range);
                if (!deferred.contains(range) || originalConstraints == null || !roundedEqual(originalConstraints, constraints)
                        || inputs == 0 || !loggedAboveMargin(frequency, 10.0 * constraints)
                        || !loggedAboveMargin(up, 10.0 * (2.0 * down + 3.0 * constraints))) {
                    throw new AssertionError("Phi lost deferred provenance or weighted cost margin: " + line);
                }
                pending = new PhiPlacement(node, range, block, inputs, matcher.group(9).equals("1"), up, down);
            } else if (line.startsWith("CCPHI_INPUT ")) {
                Matcher matcher = input.matcher(line);
                if (!matcher.matches()) throw new AssertionError("Malformed Phi input trace: " + line);
                int node = Integer.parseInt(matcher.group(5));
                boolean up = matcher.group(6).equals("1"), marked = matcher.group(7).equals("1");
                double frequency = traceFrequency(matcher.group(8));
                if (pending == null || pending.node != Integer.parseInt(matcher.group(1))
                        || pending.range != Integer.parseInt(matcher.group(2))
                        || pending.block != Integer.parseInt(matcher.group(3))) {
                    throw new AssertionError("Phi input does not belong to the pending decision: " + line);
                }
                if (up) {
                    Integer range = trace.markedNodes.get(node);
                    if (!marked || range == null || range.intValue() != pending.range) {
                        throw new AssertionError("UP input lacks exact deferred-node provenance: " + line);
                    }
                    pending.upDefinitions.add(node);
                    pending.observedUp += frequency;
                } else {
                    pending.observedDown += frequency;
                }
                if (++pending.actualInputs == pending.expectedInputs) {
                    if (!roundedEqual(pending.observedUp, pending.upFrequency)
                            || !roundedEqual(pending.observedDown, pending.downFrequency)) {
                        throw new AssertionError("Phi input frequency sums disagree with its costs: " + line);
                    }
                    trace.markedNodes.put(pending.node, pending.range);
                    trace.phis.add(pending);
                    pending = null;
                }
            } else if (line.startsWith("CCHRP ")) {
                Matcher matcher = boundary.matcher(line);
                if (!matcher.matches()) throw new AssertionError("Malformed pressure-boundary trace: " + line);
                int node = Integer.parseInt(matcher.group(1)), range = Integer.parseInt(matcher.group(2));
                int block = Integer.parseInt(matcher.group(3));
                boolean keep = matcher.group(4).equals("1");
                double frequency = traceFrequency(matcher.group(5));
                double constraints = traceFrequency(matcher.group(6));
                Integer markedRange = trace.markedNodes.get(node);
                Double originalConstraints = constraintsByRange.get(range);
                if (markedRange == null || markedRange.intValue() != range || originalConstraints == null
                        || !roundedEqual(originalConstraints, constraints)
                        || (keep && !loggedAboveMargin(frequency, 10.0 * constraints))
                        || (!keep && frequency > 10.0 * constraints && !roundedEqual(frequency, 10.0 * constraints))) {
                    throw new AssertionError("Pressure boundary lost provenance or cold-constraint decision: " + line);
                }
                if (keep) trace.keptBoundaries.add(new NodeLocation(node, block));
            }
        }
        if (pending != null) throw new AssertionError("Incomplete input records for Phi N" + pending.node);
        return trace;
    }

    private static void checkJoinChains(PlacementTrace trace) {
        if (trace.loadDefinitions.size() != 3) {
            throw new AssertionError("Expected exactly three deferred packed loads: " + trace.loadDefinitions);
        }
        Set<Integer> ranges = new HashSet<>();
        Map<JoinPair, Map<Integer, JoinPair>> groups = new HashMap<>();
        for (int load : trace.loadDefinitions) {
            int range = trace.markedNodes.get(load);
            if (!ranges.add(range)) throw new AssertionError("Packed loads share a coalesced range: L" + range);
            for (PhiPlacement first : trace.phis) {
                if (first.range != range || !first.pressureDown || !first.upDefinitions.contains(load)
                        || !trace.keptBoundaries.contains(new NodeLocation(first.node, first.block))) continue;
                for (PhiPlacement second : trace.phis) {
                    if (second.range != range || !second.pressureDown || second.block == first.block
                            || !second.upDefinitions.contains(first.node)
                            || !trace.keptBoundaries.contains(new NodeLocation(second.node, second.block))) continue;
                    groups.computeIfAbsent(new JoinPair(first.block, second.block), ignored -> new HashMap<>())
                            .put(load, new JoinPair(first.node, second.node));
                }
            }
        }
        for (Map<Integer, JoinPair> chains : groups.values()) {
            if (chains.size() != 3) continue;
            Set<Integer> nodes = new HashSet<>();
            for (JoinPair chain : chains.values()) {
                nodes.add(chain.first());
                nodes.add(chain.second());
            }
            if (nodes.size() == 6) return;
        }
        throw new AssertionError("Missing three load-to-two-Phi chains with actual DOWN overrides and kept HRP boundaries");
    }

    private static String syntheticJoinTrace() {
        StringBuilder text = new StringBuilder();
        for (int i = 0; i < 3; i++) {
            text.append("CCDEFER def=N").append(100 + i).append(" L").append(200 + i)
                    .append(" B10 freq=1024 constraint_freq=6 loadL=1\n");
        }
        for (int i = 0; i < 3; i++) {
            text.append("CCPHI def=N").append(300 + i).append(" L").append(200 + i)
                    .append(" B20 freq=1024 up_freq=1020 down_freq=4 constraint_freq=6 inputs=2 pressure_down=1\n")
                    .append("CCPHI_INPUT phi=N").append(300 + i).append(" L").append(200 + i)
                    .append(" B20 pred=B11 def=N").append(100 + i).append(" up=1 deferred=1 freq=1020\n")
                    .append("CCPHI_INPUT phi=N").append(300 + i).append(" L").append(200 + i)
                    .append(" B20 pred=B12 def=N").append(500 + i).append(" up=0 deferred=0 freq=4\n");
        }
        for (int i = 0; i < 3; i++) {
            text.append("CCPHI def=N").append(400 + i).append(" L").append(200 + i)
                    .append(" B30 freq=1024 up_freq=1022 down_freq=2 constraint_freq=6 inputs=2 pressure_down=1\n")
                    .append("CCPHI_INPUT phi=N").append(400 + i).append(" L").append(200 + i)
                    .append(" B30 pred=B21 def=N").append(300 + i).append(" up=1 deferred=1 freq=1022\n")
                    .append("CCPHI_INPUT phi=N").append(400 + i).append(" L").append(200 + i)
                    .append(" B30 pred=B22 def=N").append(600 + i).append(" up=0 deferred=0 freq=2\n");
        }
        for (int i = 0; i < 3; i++) {
            text.append("CCHRP def=N").append(300 + i).append(" L").append(200 + i)
                    .append(" B20 keep=1 freq=1024 constraint_freq=6\n")
                    .append("CCHRP def=N").append(400 + i).append(" L").append(200 + i)
                    .append(" B30 keep=1 freq=1024 constraint_freq=6\n");
        }
        return text.toString();
    }

    private static void expectInvalidJoinTrace(String text) {
        try {
            checkJoinChains(checkPlacementTrace(text));
        } catch (AssertionError expected) {
            return;
        }
        throw new AssertionError("Incomplete or unrelated placement trace satisfied the join oracle");
    }

    private static void checkTraceOracle() {
        if (loggedAboveMargin(1.0, 10.0 * Double.MAX_VALUE)) {
            throw new AssertionError("Overflowed comparison met the logged margin");
        }
        String valid = syntheticJoinTrace();
        checkJoinChains(checkPlacementTrace(valid));
        String firstInput = "CCPHI_INPUT phi=N300 L200 B20 pred=B11 def=N100 up=1 deferred=1 freq=1020\n";
        String secondInput = "CCPHI_INPUT phi=N400 L200 B30 pred=B21 def=N300 up=1 deferred=1 freq=1022\n";
        expectInvalidJoinTrace(valid.replace(firstInput, ""));
        expectInvalidJoinTrace(valid.replace(secondInput, ""));
        expectInvalidJoinTrace(valid.replace("CCDEFER def=N100 L200 B10 freq=1024 constraint_freq=6 loadL=1\n", ""));
        expectInvalidJoinTrace(valid.replace("CCHRP def=N400 L200 B30 keep=1 freq=1024 constraint_freq=6\n", ""));
        expectInvalidJoinTrace(valid.replace("CCHRP def=N300 L200 B20 keep=1 freq=1024 constraint_freq=6\n", ""));
        expectInvalidJoinTrace(valid.replace("CCHRP def=N300 L200 B20", "CCHRP def=N300 L200 B999"));
        expectInvalidJoinTrace(valid.replace("CCHRP def=N400 L200 B30", "CCHRP def=N400 L200 B999"));
        expectInvalidJoinTrace(valid.replace(
                "CCPHI def=N300 L200 B20 freq=1024 up_freq=1020 down_freq=4 constraint_freq=6",
                "CCPHI def=N300 L200 B20 freq=1024 up_freq=1020 down_freq=4 constraint_freq=5"));
        expectInvalidJoinTrace(valid.replace(
                "CCHRP def=N300 L200 B20 keep=1 freq=1024 constraint_freq=6",
                "CCHRP def=N300 L200 B20 keep=1 freq=1024 constraint_freq=5"));
        expectInvalidJoinTrace(valid + "CCDEFER def=N999 L200 B40 freq=1024 constraint_freq=5 loadL=0\n");
        // An incidental sibling Phi is marked and has the right LRG, but it
        // does not extend the first Phi's reaching definition through join two.
        expectInvalidJoinTrace(valid.replace(secondInput, secondInput.replace("def=N300", "def=N100")));
        expectInvalidJoinTrace(valid.replace(firstInput, firstInput.replace("def=N100", "def=N999")));
        expectInvalidJoinTrace(valid.replace(firstInput, firstInput.replace("deferred=1", "deferred=0")));
        expectInvalidJoinTrace(valid.replace("CCPHI_INPUT phi=N300 L200 B20 pred=B12 def=N500 up=0 deferred=0 freq=4\n", ""));
        expectInvalidJoinTrace(valid.replace(
                "CCPHI def=N300 L200 B20 freq=1024 up_freq=1020 down_freq=4 constraint_freq=6 inputs=2 pressure_down=1",
                "CCPHI def=N300 L200 B20 freq=1024 up_freq=1020 down_freq=4 constraint_freq=6 inputs=2 pressure_down=0"));
        expectInvalidJoinTrace(valid.replace(
                "CCPHI def=N400 L200 B30 freq=1024 up_freq=1022 down_freq=2 constraint_freq=6 inputs=2 pressure_down=1",
                "CCPHI def=N400 L200 B30 freq=1024 up_freq=1022 down_freq=2 constraint_freq=6 inputs=2 pressure_down=0"));
        expectInvalidJoinTrace(valid.replace("up_freq=1020", "up_freq=1019"));
    }

    private static void checkFixedShiftCounts(String text) {
        Set<Integer> counts = new HashSet<>();
        // Use actual matched input masks, avoiding assumptions about node IDs
        // or an optimizer's chosen number of shifts.
        Matcher matcher = Pattern.compile("(?m)^L\\d+\\[[^\\r\\n]*?/N\\d+\\s+(?:sal|shr)L_rReg_CL ===[^\\r\\n]* L(\\d+)\\[RCX\\]/N\\d+").matcher(text);
        while (matcher.find()) counts.add(Integer.parseInt(matcher.group(1)));
        if (counts.isEmpty()) throw new AssertionError("No actual CL-count shift masks");
        counts.retainAll(deferredRanges(text));
        if (!counts.isEmpty()) throw new AssertionError("Deferred hot fixed-register shift counts: " + counts);
    }

    private static void checkDuplicateDebugUses(String text) {
        Set<Integer> duplicated = new HashSet<>();
        Pattern debugInput = Pattern.compile(" L(\\d+)\\[RBP(?:,|\\])");
        for (String line : text.split("\\R")) {
            if (!line.startsWith("L") || !line.contains("CallStaticJavaDirect") || !line.contains("::helperA")) continue;
            Map<Integer, Integer> occurrences = new HashMap<>();
            Matcher matcher = debugInput.matcher(line);
            while (matcher.find()) occurrences.merge(Integer.parseInt(matcher.group(1)), 1, Integer::sum);
            occurrences.forEach((range, count) -> {
                if (count >= 12) duplicated.add(range);
            });
        }
        if (duplicated.isEmpty()) throw new AssertionError("No repeated debug value at returning call");
        duplicated.retainAll(deferredRanges(text));
        if (duplicated.isEmpty()) throw new AssertionError("Repeated debug value was not deferred");
    }

    private static void run(Boolean enabled, boolean framePointer, boolean selection, boolean stress,
                            boolean debug, boolean legacyShifts, boolean joinsOnly) throws Exception {
        // This test requires amd64; automatic enablement is limited to Linux.
        boolean expectedEnabled = enabled != null ? enabled : Platform.isLinux();
        List<String> options = new ArrayList<>(List.of(
                "-Xbootclasspath/a:.", "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI",
                "-XX:-TieredCompilation", "-Xbatch", "-XX:CompileThreshold=1000000",
                "-XX:-UseOnStackReplacement", "-XX:-UseSuperWord", "-XX:LoopMaxUnroll=0",
                "-XX:" + (stress ? "+" : "-") + "UseFPUForSpilling", "-XX:+UseSerialGC", "-Xmx128m",
                "-XX:" + (framePointer ? "+" : "-") + "PreserveFramePointer",
                "-XX:CompileCommand=compileonly,compiler.regalloc.TestColdCallSpillPlacement::test*",
                "-XX:CompileCommand=inline,compiler.regalloc.TestColdCallSpillPlacement::kernel",
                "-XX:CompileCommand=dontinline,compiler.regalloc.TestColdCallSpillPlacement::helper*",
                TestColdCallSpillPlacement.class.getName(), "child", Boolean.toString(expectedEnabled),
                Boolean.toString(joinsOnly)));
        if (enabled != null) {
            options.add(options.indexOf("-XX:+WhiteBoxAPI") + 1,
                    "-XX:" + (enabled ? "+" : "-") + "UseColdCallSpillDeferral");
        }
        if (joinsOnly) {
            // Keep exactly three load roots in the dedicated structural case.
            // Other correctness/selection children retain their peeling flags.
            options.addAll(options.indexOf("-XX:+WhiteBoxAPI") + 1,
                    List.of("-XX:-PartialPeelLoop", "-XX:LoopPeeling=0"));
        }
        if (debug) {
            options.addAll(0, List.of("-XX:+UnlockDiagnosticVMOptions", "-XX:+VerifyRegisterAllocator", "-XX:+TraceSpilling",
                    "-XX:+VerifyOops", "-XX:+VerifyBeforeGC", "-XX:+VerifyAfterGC"));
            if (stress) options.addAll(0, List.of("-XX:+UnlockDiagnosticVMOptions", "-XX:+StressGCM", "-XX:+StressLCM", "-XX:StressSeed=42"));
        }
        if (legacyShifts) options.add(0, "-XX:-UseBMI2Instructions");
        OutputAnalyzer output = ProcessTools.executeTestJava(options.toArray(String[]::new));
        output.shouldHaveExitValue(0).shouldContain("CORRECTNESS_OK");
        String text = output.getOutput();
        String[] names = joinsOnly ? new String[] { "testJoins" }
                : new String[] { "testCold", "testJoins", "testHot", "testTwo", "testMixed", "testVoid", "testMaps", "testException", "testAtomic", "testAliases", "testFloating", "testOops" };
        for (String name : names) {
            int begin = text.indexOf("BEGIN_COMPILE " + name);
            int end = text.indexOf("END_COMPILE " + name, begin);
            if (begin < 0 || end < 0) throw new AssertionError("Missing compilation boundary: " + name);
            boolean deferred = text.substring(begin, end).contains("CCDEFER ");
            String compilation = text.substring(begin, end);
            boolean placement = deferred || compilation.contains("CCPHI ") || compilation.contains("CCPHI_INPUT ") || compilation.contains("CCHRP ");
            if (!expectedEnabled && placement) throw new AssertionError("Disabled feature selected " + name);
            PlacementTrace trace = debug ? checkPlacementTrace(compilation) : null;
            if (selection) {
                boolean expected = name.equals("testCold") || name.equals("testJoins") || name.equals("testVoid") || name.equals("testMaps")
                        || name.equals("testException") || name.equals("testAtomic") || name.equals("testAliases");
                if (deferred != expected) throw new AssertionError("Unexpected selection for " + name + ": " + deferred);
                if (name.equals("testAliases")) checkDuplicateDebugUses(compilation);
                if (joinsOnly) checkJoinChains(trace);
            }
            if (legacyShifts && name.equals("testCold")) checkFixedShiftCounts(compilation);
        }
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            if (args[0].equals("probe")) {
                System.out.println("DEBUG_BUILD=" + Platform.isDebugBuild());
            } else {
                child(Boolean.parseBoolean(args[1]), Boolean.parseBoolean(args[2]));
            }
            return;
        }
        checkTraceOracle();
        // Driver actions can use a different VM from child actions (notably with
        // -XXaltjvm). Query the actual test VM before enabling debug-only checks.
        OutputAnalyzer probe = ProcessTools.executeTestJava(TestColdCallSpillPlacement.class.getName(), "probe");
        probe.shouldHaveExitValue(0);
        boolean debug = probe.getOutput().contains("DEBUG_BUILD=true");
        // Check Linux amd64 automatic activation and the explicit opt-out.
        run(null, false, debug && Platform.isLinux(), false, debug, false, false);
        run(false, false, false, false, debug, false, false);
        run(true, false, debug, false, debug, false, false);
        run(true, true, false, false, debug, false, false);
        if (debug) {
            run(true, false, true, false, true, false, true);
            run(true, false, false, true, true, false, false);
            run(true, false, true, false, true, true, false);
        }
    }
}
