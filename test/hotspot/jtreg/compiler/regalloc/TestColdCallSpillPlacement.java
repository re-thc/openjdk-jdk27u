/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @summary Check initial spill deferral selection and Java state across returning calls
 * @requires vm.compiler2.enabled & (os.arch == "amd64")
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

    private static void child(boolean enabled) throws Exception {
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
        String[] names = { "testCold", "testHot", "testTwo", "testMixed", "testVoid", "testMaps", "testException", "testAtomic", "testAliases" };
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

    private static void run(Boolean enabled, boolean framePointer, boolean selection, boolean stress, boolean debug, boolean legacyShifts) throws Exception {
        List<String> options = new ArrayList<>(List.of(
                "-Xbootclasspath/a:.", "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI",
                "-XX:-TieredCompilation", "-Xbatch", "-XX:CompileThreshold=1000000",
                "-XX:-UseOnStackReplacement", "-XX:-UseSuperWord", "-XX:LoopMaxUnroll=0",
                "-XX:" + (stress ? "+" : "-") + "UseFPUForSpilling", "-XX:+UseSerialGC", "-Xmx128m",
                "-XX:" + (framePointer ? "+" : "-") + "PreserveFramePointer",
                "-XX:CompileCommand=compileonly,compiler.regalloc.TestColdCallSpillPlacement::test*",
                "-XX:CompileCommand=inline,compiler.regalloc.TestColdCallSpillPlacement::kernel",
                "-XX:CompileCommand=dontinline,compiler.regalloc.TestColdCallSpillPlacement::helper*",
                TestColdCallSpillPlacement.class.getName(), "child", Boolean.toString(Boolean.TRUE.equals(enabled))));
        if (enabled != null) {
            options.add(options.indexOf("-XX:+WhiteBoxAPI") + 1,
                    "-XX:" + (enabled ? "+" : "-") + "UseColdCallSpillDeferral");
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
        for (String name : new String[] { "testCold", "testHot", "testTwo", "testMixed", "testVoid", "testMaps", "testException", "testAtomic", "testAliases", "testFloating", "testOops" }) {
            int begin = text.indexOf("BEGIN_COMPILE " + name);
            int end = text.indexOf("END_COMPILE " + name, begin);
            if (begin < 0 || end < 0) throw new AssertionError("Missing compilation boundary: " + name);
            boolean deferred = text.substring(begin, end).contains("CCDEFER ");
            String compilation = text.substring(begin, end);
            if (!Boolean.TRUE.equals(enabled) && deferred) throw new AssertionError("Disabled feature selected " + name);
            if (selection) {
                boolean expected = name.equals("testCold") || name.equals("testVoid") || name.equals("testMaps")
                        || name.equals("testException") || name.equals("testAtomic") || name.equals("testAliases");
                if (deferred != expected) throw new AssertionError("Unexpected selection for " + name + ": " + deferred);
                if (name.equals("testAliases")) checkDuplicateDebugUses(compilation);
            }
            if (legacyShifts && name.equals("testCold")) checkFixedShiftCounts(compilation);
        }
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            if (args[0].equals("probe")) {
                System.out.println("DEBUG_BUILD=" + Platform.isDebugBuild());
            } else {
                child(Boolean.parseBoolean(args[1]));
            }
            return;
        }
        // Driver actions can use a different VM from child actions (notably with
        // -XXaltjvm). Query the actual test VM before enabling debug-only checks.
        OutputAnalyzer probe = ProcessTools.executeTestJava(TestColdCallSpillPlacement.class.getName(), "probe");
        probe.shouldHaveExitValue(0);
        boolean debug = probe.getOutput().contains("DEBUG_BUILD=true");
        // Default and explicit-off runs also guard the opt-in compatibility promise.
        run(null, false, false, false, debug, false);
        run(false, false, false, false, debug, false);
        run(true, false, debug, false, debug, false);
        run(true, true, false, false, debug, false);
        if (debug) {
            run(true, false, false, true, true, false);
            run(true, false, true, false, true, true);
        }
    }
}
