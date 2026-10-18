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
 * @summary Preserve derived/base oop-map pairs next to deferred scalar spills
 * @requires vm.compiler2.enabled & vm.gc.Serial & (os.arch == "amd64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver compiler.regalloc.TestColdCallDerivedPointers
 */

package compiler.regalloc;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.SplittableRandom;
import jdk.test.lib.Platform;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class TestColdCallDerivedPointers {
    private static WhiteBox WB;
    private static final int ITERATIONS = 256, PROFILE_INVOCATIONS = 64;
    private static final int START = 9, LENGTH = 128, CHANGED = 17;
    private static final int MOVE = 1, MUTATE = 2;
    private static final long STAMP = 0x4711_6636_1868_8L;
    private static final long[] TABLE = new long[32];
    private static volatile int action, gcEvents, mutationEvents;
    private static volatile long sideEffect;
    private static long[] movingSource, movingTarget;
    private static long sourceBefore, sourceAfter, targetBefore, targetAfter;

    static {
        SplittableRandom random = new SplittableRandom(0x663618688L);
        for (int i = 0; i < TABLE.length; i++) TABLE[i] = random.nextLong();
    }

    private static void helper() {
        sideEffect++;
        int requested = action;
        if (requested == 0) return;
        action = 0;
        if ((requested & MOVE) != 0) {
            sourceBefore = WB.getObjectAddress(movingSource);
            targetBefore = WB.getObjectAddress(movingTarget);
            WB.youngGC();
            sourceAfter = WB.getObjectAddress(movingSource);
            targetAfter = WB.getObjectAddress(movingTarget);
            gcEvents++;
        }
        if ((requested & MUTATE) != 0) {
            // Change the relocated source after GC. An intrinsic using its old
            // interior pointer would still read zeros and miss this mismatch.
            movingSource[START + CHANGED] = STAMP;
            mutationEvents++;
        }
    }

    // Forced-inlined mismatch wrappers expose shared AddP inputs of native leaf
    // calls. Unlike ordinary array loads, these are not cloned into memory
    // addressing modes, so both interior pointers cross the Java helper.
    private static long testDerivedOnly(long[] source, int start, long seed) {
        long[] target = new long[source.length];
        movingTarget = target;
        int first = Arrays.mismatch(source, start, start + LENGTH, target, start, start + LENGTH);
        helper();
        return seed + first + Arrays.mismatch(source, start, start + LENGTH, target, start, start + LENGTH);
    }

    private static long testDerived(long[] source, int start, long seed) {
        long[] target = new long[source.length];
        movingTarget = target;
        long bits = seed, total = 0;
        int state = (int) seed & 31;
        for (int i = 0; i < ITERATIONS; i++) {
            int first = Arrays.mismatch(source, start, start + LENGTH, target, start, start + LENGTH);
            long a = TABLE[state], b = TABLE[(state + 1) & 31];
            long c = TABLE[(state + 2) & 31], d = TABLE[(state + 3) & 31];
            long e = TABLE[(state + 4) & 31], f = TABLE[(state + 5) & 31];
            long g = TABLE[(state + 6) & 31], h = TABLE[(state + 7) & 31];
            int wa = (int) (a >>> 32) & 31, wb = (int) (b >>> 32) & 31;
            int wc = (int) (c >>> 32) & 31, wd = (int) (d >>> 32) & 31;
            int we = (int) (e >>> 32) & 31, wf = (int) (f >>> 32) & 31;
            int wg = (int) (g >>> 32) & 31, wh = (int) (h >>> 32) & 31;
            if ((i & 63) == 37) helper();
            long next = (a + (bits >>> wa)) ^ (b + (bits >>> wb));
            next += (c ^ (bits << wc)) + (d ^ (bits << wd));
            next ^= (e + (bits >>> we)) + (f + (bits >>> wf));
            next += (g ^ (bits << wg)) ^ (h ^ (bits << wh));
            total += next + first;
            bits = Long.rotateLeft(bits ^ next, wa + wc + we + wg);
            state = (int) ((a >>> 48) + (b >>> 48) + (c >>> 48) + bits) & 31;
            // The scalar entries die before this hot leaf call. Counting every
            // crossed call must retain this distinction from a hot scalar call.
            total += Arrays.mismatch(source, start, start + LENGTH, target, start, start + LENGTH);
        }
        return bits ^ total;
    }

    private static int testInitializeCompiler() { return 42; }

    private static long invoke(String name, long seed) {
        return name.equals("testDerived") ? testDerived(movingSource, START, seed)
                                          : testDerivedOnly(movingSource, START, seed);
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
        compile(TestColdCallDerivedPointers.class.getDeclaredMethod("testInitializeCompiler"));
        for (String name : new String[] { "testDerivedOnly", "testDerived" }) {
            Method method = TestColdCallDerivedPointers.class.getDeclaredMethod(name, long[].class, int.class, long.class);
            WB.setBooleanVMFlag("UseCompiler", false);
            WB.markMethodProfiled(method);
            for (int i = 0; i < PROFILE_INVOCATIONS; i++) {
                movingSource = new long[1024];
                invoke(name, i + 1);
            }
            // Produce an interpreted oracle with the identical single mutation.
            movingSource = new long[1024];
            action = MUTATE;
            long expected = invoke(name, 7);
            if (action != 0) throw new AssertionError("Reference helper not reached");
            compile(method);
            movingSource = new long[1024];
            int oldGc = gcEvents, oldMutations = mutationEvents;
            action = MOVE | MUTATE;
            System.out.println("BEGIN_GC " + name);
            long actual = invoke(name, 7);
            System.out.println("END_GC " + name);
            if (actual != expected || action != 0 || gcEvents != oldGc + 1
                    || mutationEvents != oldMutations + 1 || WB.getMethodCompilationLevel(method) != 4) {
                throw new AssertionError("Lost compiled scalar/derived state: " + name);
            }
            if (sourceBefore == sourceAfter || targetBefore == targetAfter) {
                throw new AssertionError("Young GC did not move both array bases: " + name);
            }
            if (movingSource[START + CHANGED] != STAMP || movingTarget[START + CHANGED] != 0) {
                throw new AssertionError("Post-GC source/target contents changed");
            }
            System.out.println("MOVED_BASES " + name);
        }
        System.out.println("DERIVED_CORRECTNESS_OK");
    }

    private static int occurrences(String text, String needle) {
        int count = 0;
        for (int at = 0; (at = text.indexOf(needle, at)) >= 0; at += needle.length()) count++;
        return count;
    }

    private static void run(boolean enabled, boolean debug) throws Exception {
        List<String> options = new ArrayList<>(List.of(
                "-Xbootclasspath/a:.", "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI",
                "-XX:-TieredCompilation", "-Xbatch", "-XX:CompileThreshold=1000000",
                "-XX:-UseOnStackReplacement", "-XX:-UseSuperWord", "-XX:LoopMaxUnroll=0",
                "-XX:+UseSerialGC", "-Xms64m", "-Xmx64m", "-XX:NewSize=16m", "-XX:MaxNewSize=16m",
                "-XX:" + (enabled ? "+" : "-") + "UseColdCallSpillDeferral",
                "-XX:CompileCommand=compileonly,compiler.regalloc.TestColdCallDerivedPointers::test*",
                "-XX:CompileCommand=dontinline,compiler.regalloc.TestColdCallDerivedPointers::helper",
                "-XX:CompileCommand=inline,java.util.Arrays::mismatch",
                "-XX:CompileCommand=inline,jdk.internal.util.ArraysSupport::mismatch",
                "-XX:CompileCommand=PrintAssembly,compiler.regalloc.TestColdCallDerivedPointers::testDerived*",
                TestColdCallDerivedPointers.class.getName(), "child", Boolean.toString(enabled)));
        if (debug) {
            options.addAll(0, List.of("-XX:+UnlockDiagnosticVMOptions", "-XX:+VerifyRegisterAllocator",
                    "-XX:+TraceSpilling", "-XX:+TraceDerivedPointers", "-XX:+VerifyBeforeGC", "-XX:+VerifyAfterGC"));
        }
        OutputAnalyzer output = ProcessTools.executeTestJava(options.toArray(String[]::new));
        output.shouldHaveExitValue(0).shouldContain("DERIVED_CORRECTNESS_OK");
        String text = output.getOutput();
        for (String name : new String[] { "testDerivedOnly", "testDerived" }) {
            int begin = text.indexOf("BEGIN_COMPILE " + name + System.lineSeparator());
            int end = text.indexOf("END_COMPILE " + name + System.lineSeparator(), begin);
            if (begin < 0 || end < 0) throw new AssertionError("Missing compilation: " + name);
            String compilation = text.substring(begin, end);
            if (compilation.lines().noneMatch(line -> occurrences(line, "Derived_oop_") >= 2)) {
                throw new AssertionError("Missing both derived/base pairs at one oop map: " + name);
            }
            if (debug && compilation.contains("CCDEFER ") != (enabled && name.equals("testDerived"))) {
                throw new AssertionError("Unexpected scalar deferral selection: " + name);
            }
            begin = text.indexOf("BEGIN_GC " + name + System.lineSeparator());
            end = text.indexOf("END_GC " + name + System.lineSeparator(), begin);
            if (begin < 0 || end < 0) throw new AssertionError("Missing GC boundary: " + name);
            String collection = text.substring(begin, end);
            if (debug && (occurrences(collection, "Add derived pointer@") < 2
                    || occurrences(collection, "Updating derived pointer@") < 2)) {
                throw new AssertionError("GC did not process the actual derived pointers: " + name);
            }
            output.shouldContain("MOVED_BASES " + name);
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
        OutputAnalyzer probe = ProcessTools.executeTestJava(TestColdCallDerivedPointers.class.getName(), "probe");
        probe.shouldHaveExitValue(0);
        boolean debug = probe.getOutput().contains("DEBUG_BUILD=true");
        run(false, debug);
        run(true, debug);
    }
}
