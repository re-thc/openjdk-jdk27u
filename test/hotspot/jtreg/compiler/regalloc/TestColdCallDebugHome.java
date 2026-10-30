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
 * @summary Keep forwarded cold-call debug homes live through GC and deoptimization
 * @requires vm.compiler2.enabled & vm.gc.G1 & (os.arch == "amd64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver compiler.regalloc.TestColdCallDebugHome
 */

package compiler.regalloc;

import java.io.InputStream;
import java.lang.classfile.ClassFile;
import java.lang.classfile.Instruction;
import java.lang.classfile.Opcode;
import java.lang.classfile.instruction.InvokeInstruction;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.SplittableRandom;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jdk.test.lib.Platform;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class TestColdCallDebugHome {
    private static WhiteBox wb;
    private static Method target;
    private static volatile int action;
    private static int gcEvents, deoptEvents, trapEvents;
    private static volatile long sink;

    private static int bootstrapC2(int value) {
        return value + 1;
    }

    private static void initializeC2() throws Exception {
        // C2 initializes on a compiler thread and checks UseCompiler while
        // generating its runtime stubs. Complete a blocking level-4 compile
        // before temporarily disabling compilation for interpreted profiling.
        Method bootstrap = TestColdCallDebugHome.class.getDeclaredMethod("bootstrapC2", int.class);
        if (!wb.enqueueMethodForCompilation(bootstrap, 4)
                || wb.getMethodCompilationLevel(bootstrap) != 4 || bootstrapC2(41) != 42) {
            throw new AssertionError("Missing normal C2 bootstrap compilation");
        }
    }

    private static byte[] helperArray(byte[] array) {
        return array;
    }

    private static void helperReturning(long value) {
        sink ^= value;
        int requested = action;
        action = 0;
        if ((requested & 1) != 0) {
            wb.fullGC();
            gcEvents++;
        }
        if ((requested & 2) != 0) {
            wb.deoptimizeMethod(target);
            deoptEvents++;
        }
    }

    private static void helperTrap(long value) {
        sink ^= value;
        trapEvents++;
        wb.fullGC();
        gcEvents++;
    }

    // All eight base oops and the scalar state are live at the unprofiled
    // branch. They must retain distinct valid Java debug values even when
    // their short DebugUse copies would compete for the same call register.
    // The opaque array return supplies a full oop with a machine definition;
    // loading an element of byte[][] can leave only a cold narrow debug value.
    // The next call clobbers the return register, so ordinary splitting creates
    // a DOWN home before the trap instead of relying on a loop Phi home.
    // The returning call also exercises that oop map while C2 is active.
    private static long testDebugHomes(byte[][] arrays, long[] values, int trapIndex, long seed) {
        byte[] s0 = arrays[0], s1 = arrays[1], s2 = arrays[2], s3 = arrays[3];
        byte[] s4 = arrays[4], s5 = arrays[5], s6 = arrays[6], s7 = arrays[7];
        long a0 = values[0], a1 = values[1], a2 = values[2], a3 = values[3];
        long a4 = values[4], a5 = values[5], a6 = values[6], a7 = values[7];
        long a8 = values[8], a9 = values[9], a10 = values[10], a11 = values[11];
        long a12 = values[12], a13 = values[13], a14 = values[14], a15 = values[15];
        long state = seed;
        // Exceed the ordinary high-frequency threshold of 375. At 256 trips,
        // only loop-header Phis may reach the outer-loop frequency threshold.
        for (int i = 0; i < 512; i++) {
            int index = (int) state & 63;
            long bytes = s0[index] + 3L * s1[index] + 5L * s2[index] + 7L * s3[index]
                    + 11L * s4[index] + 13L * s5[index] + 17L * s6[index] + 19L * s7[index];
            a0 += Long.rotateLeft(a1 ^ bytes, 3);
            a1 ^= Long.rotateLeft(a2 + state, 5);
            a2 += Long.rotateLeft(a3 ^ bytes, 7);
            a3 ^= Long.rotateLeft(a4 + state, 11);
            a4 += Long.rotateLeft(a5 ^ bytes, 13);
            a5 ^= Long.rotateLeft(a6 + state, 17);
            a6 += Long.rotateLeft(a7 ^ bytes, 19);
            a7 ^= Long.rotateLeft(a8 + state, 23);
            a8 += Long.rotateLeft(a9 ^ bytes, 29);
            a9 ^= Long.rotateLeft(a10 + state, 31);
            a10 += Long.rotateLeft(a11 ^ bytes, 37);
            a11 ^= Long.rotateLeft(a12 + state, 41);
            a12 += Long.rotateLeft(a13 ^ bytes, 43);
            a13 ^= Long.rotateLeft(a14 + state, 47);
            a14 += Long.rotateLeft(a15 ^ bytes, 53);
            a15 ^= Long.rotateLeft(a0 + state, 59);
            s0 = helperArray(s0);
            helperReturning(7);
            if (i == trapIndex) {
                helperTrap(11);
            }
            state = Long.rotateLeft(state ^ a0 ^ a5 ^ a10 ^ a15 ^ bytes, 9);
        }
        return state ^ a0 ^ a1 ^ a2 ^ a3 ^ a4 ^ a5 ^ a6 ^ a7
                ^ a8 ^ a9 ^ a10 ^ a11 ^ a12 ^ a13 ^ a14 ^ a15
                ^ s0[0] ^ s1[1] ^ s2[2] ^ s3[3] ^ s4[4] ^ s5[5] ^ s6[6] ^ s7[7];
    }

    private static void requireC2() {
        if (wb.getMethodCompilationLevel(target) != 4) {
            throw new AssertionError("Target is not executing normal C2 code");
        }
    }

    private static void compile(int ordinal) {
        wb.setBooleanVMFlag("UseCompiler", true);
        System.out.println("BEGIN_DEBUG_HOME_COMPILE " + ordinal);
        if (!wb.enqueueMethodForCompilation(target, 4) || wb.getMethodCompilationLevel(target) != 4) {
            throw new AssertionError("Missing normal C2 compilation");
        }
        System.out.println("END_DEBUG_HOME_COMPILE " + ordinal);
    }

    // Derive the branch BCI from this class, so a trace at an unrelated null
    // check or range check cannot satisfy the positive activation assertion.
    private static int trapBci() throws Exception {
        try (InputStream input = TestColdCallDebugHome.class.getResourceAsStream("TestColdCallDebugHome.class")) {
            var model = ClassFile.of().parse(input.readAllBytes());
            var method = model.methods().stream()
                    .filter(m -> m.methodName().equalsString("testDebugHomes")).findFirst().orElseThrow();
            int bci = 0;
            int branch = -1;
            int result = -1;
            for (var element : method.code().orElseThrow()) {
                if (element instanceof Instruction instruction) {
                    if (instruction.opcode() == Opcode.IF_ICMPNE) branch = bci;
                    if (instruction instanceof InvokeInstruction invoke && invoke.name().equalsString("helperTrap")) {
                        if (branch < 0 || result >= 0) throw new AssertionError("Ambiguous trap branch");
                        result = branch;
                    }
                    bci += instruction.sizeInBytes();
                }
            }
            if (result < 0) throw new AssertionError("Missing trap branch");
            return result;
        }
    }

    private static void child(boolean enabled) throws Exception {
        wb = WhiteBox.getWhiteBox();
        if (wb.getBooleanVMFlag("UseColdCallSpillDeferral") != enabled) {
            throw new AssertionError("Unexpected feature state");
        }
        target = TestColdCallDebugHome.class.getDeclaredMethod("testDebugHomes",
                byte[][].class, long[].class, int.class, long.class);
        byte[][] arrays = new byte[8][64];
        long[] values = new long[16];
        SplittableRandom random = new SplittableRandom(0x737755773791L);
        for (byte[] array : arrays) {
            for (int i = 0; i < array.length; i++) array[i] = (byte) random.nextInt();
        }
        for (int i = 0; i < values.length; i++) values[i] = random.nextLong();
        initializeC2();
        wb.setBooleanVMFlag("UseCompiler", false);
        wb.markMethodProfiled(target);
        long[] expected = new long[64];
        for (int i = 0; i < expected.length; i++) {
            expected[i] = testDebugHomes(arrays, values, -1, i + 1);
        }
        System.out.println("DEBUG_HOME_TRAP_BCI=" + trapBci());
        compile(1);
        for (int i = 0; i < expected.length; i++) {
            if (testDebugHomes(arrays, values, -1, i + 1) != expected[i]) {
                throw new AssertionError("Changed scalar or oop state at " + i);
            }
        }
        requireC2();
        int gc = gcEvents;
        action = 1;
        if (testDebugHomes(arrays, values, -1, 1) != expected[0] || gcEvents != gc + 1 || action != 0) {
            throw new AssertionError("GC lost a live debug oop");
        }
        requireC2();
        gc = gcEvents;
        action = 3;
        int deopts = deoptEvents;
        if (testDebugHomes(arrays, values, -1, 1) != expected[0] || gcEvents != gc + 1
                || deoptEvents != deopts + 1 || action != 0 || wb.isMethodCompiled(target)) {
            throw new AssertionError("Returning-call deoptimization lost Java state");
        }
        compile(2);
        requireC2();
        int traps = trapEvents;
        int unstableIf = wb.getMethodTrapCount(target, "unstable_if");
        gc = gcEvents;
        // The unprofiled branch reconstructs all live locals, then the
        // interpreter executes helperTrap and a GC before using those oops.
        if (testDebugHomes(arrays, values, 17, 1) != expected[0]
                || trapEvents != traps + 1 || gcEvents != gc + 1
                || wb.getMethodTrapCount(target, "unstable_if") != unstableIf + 1
                || wb.isMethodCompiled(target)) {
            throw new AssertionError("Uncommon trap lost the forwarded debug home");
        }
        System.out.println("DEBUG_HOME_CORRECTNESS_OK");
    }

    private static void run(Boolean enabled, boolean framePointer, boolean compressedOops,
                            boolean debug, boolean requireOopWitness) throws Exception {
        // This test requires amd64; automatic enablement is limited to Linux.
        boolean expectedEnabled = enabled != null ? enabled : Platform.isLinux();
        List<String> options = new ArrayList<>(List.of(
                "-Xbootclasspath/a:.", "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI",
                "-Xbatch", "-XX:-TieredCompilation", "-XX:-UseOnStackReplacement",
                "-XX:CompileThreshold=1000000", "-XX:-UseSuperWord", "-XX:LoopMaxUnroll=0",
                "-XX:LoopPeeling=0", "-XX:-PartialPeelLoop", "-XX:-LoopUnswitching",
                "-XX:+UseG1GC", "-Xms128m", "-Xmx128m",
                "-XX:" + (framePointer ? "+" : "-") + "PreserveFramePointer",
                "-XX:" + (compressedOops ? "+" : "-") + "UseCompressedOops",
                "-XX:CompileCommand=compileonly,compiler.regalloc.TestColdCallDebugHome::bootstrapC2",
                "-XX:CompileCommand=compileonly,compiler.regalloc.TestColdCallDebugHome::testDebugHomes",
                "-XX:CompileCommand=dontinline,compiler.regalloc.TestColdCallDebugHome::helper*",
                TestColdCallDebugHome.class.getName(), "child", Boolean.toString(expectedEnabled)));
        if (enabled != null) {
            options.add(2, "-XX:" + (enabled ? "+" : "-") + "UseColdCallSpillDeferral");
        }
        if (debug) {
            options.addAll(0, List.of("-XX:+UnlockDiagnosticVMOptions", "-XX:+TraceSpilling",
                    "-XX:+VerifyRegisterAllocator", "-XX:+VerifyOops", "-XX:+VerifyBeforeGC", "-XX:+VerifyAfterGC"));
        }
        OutputAnalyzer output = ProcessTools.executeTestJava(options.toArray(String[]::new));
        output.shouldHaveExitValue(0).shouldContain("DEBUG_HOME_CORRECTNESS_OK");
        String text = output.getOutput();
        int begin = text.indexOf("BEGIN_DEBUG_HOME_COMPILE 2");
        int end = text.indexOf("END_DEBUG_HOME_COMPILE 2", begin);
        if (begin < 0 || end < 0) throw new AssertionError("Missing compilation boundary");
        String compilation = text.substring(begin, end);
        if (!expectedEnabled && text.contains("CCDEBUG_HOME ")) {
            throw new AssertionError("Disabled feature forwarded a debug home");
        }
        if (requireOopWitness) {
            Matcher site = Pattern.compile("DEBUG_HOME_TRAP_BCI=(\\d+)").matcher(text);
            if (!site.find()) throw new AssertionError("Missing exercised trap BCI");
            Matcher calls = Pattern.compile("CCDEBUG_SITE call=N(\\d+) bci=" + site.group(1)
                    + " trap=unstable_if").matcher(compilation);
            Set<String> callIds = new HashSet<>();
            while (calls.find()) callIds.add(calls.group(1));
            if (callIds.size() != 1) {
                throw new AssertionError("Expected one machine trap at exercised BCI, found " + callIds);
            }
            Matcher witness = Pattern.compile("CCDEBUG_HOME copy=N(\\d+) home=N(\\d+) call=N(\\d+)"
                    + " B\\d+ input=\\d+ bci=" + site.group(1)
                    + " trap=unstable_if oop=([01]) narrow=([01])").matcher(compilation);
            boolean oop = false;
            while (witness.find()) {
                if (witness.group(1).equals(witness.group(2))) {
                    throw new AssertionError("Copy was its own home");
                }
                oop |= callIds.contains(witness.group(3))
                        && (witness.group(4).equals("1") || witness.group(5).equals("1"));
            }
            if (!oop) throw new AssertionError("No actual base-oop debug-home forwarding");
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
        OutputAnalyzer probe = ProcessTools.executeTestJava(TestColdCallDebugHome.class.getName(), "probe");
        probe.shouldHaveExitValue(0);
        boolean debug = probe.getOutput().contains("DEBUG_BUILD=true");
        run(null, false, true, debug, debug && Platform.isLinux());
        run(false, false, true, debug, false);
        run(true, false, true, debug, debug);
        run(true, true, false, debug, debug);
    }
}
