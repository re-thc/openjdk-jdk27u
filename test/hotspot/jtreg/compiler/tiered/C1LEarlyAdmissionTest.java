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
 * @summary Loop and monitor roots retain early C1L admission regardless of prior backedge work
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & vm.compMode == "Xmixed"
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver compiler.tiered.C1LEarlyAdmissionTest
 */

package compiler.tiered;

import java.io.InputStream;
import java.lang.classfile.Attributes;
import java.lang.classfile.ClassFile;
import java.lang.classfile.Instruction;
import java.lang.classfile.MethodModel;
import java.lang.classfile.attribute.CodeAttribute;
import java.lang.classfile.instruction.BranchInstruction;
import java.lang.classfile.instruction.LookupSwitchInstruction;
import java.lang.classfile.instruction.MonitorInstruction;
import java.lang.classfile.instruction.TableSwitchInstruction;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class C1LEarlyAdmissionTest {
    private static final int SHORT_LIMIT = 12;

    public static void main(String[] args) throws Exception {
        if (args.length == 0) {
            runChild("transitions");
            runChild("without-c1l");
            runChild("inlining");
            return;
        }
        if (args[0].equals("transitions")) {
            Work.runTransitions(true);
        } else if (args[0].equals("without-c1l")) {
            Work.runTransitions(false);
        } else if (args[0].equals("inlining")) {
            Work.runInlining();
        } else {
            throw new IllegalArgumentException(args[0]);
        }
    }

    private static void runChild(String mode) throws Exception {
        List<String> flags = new ArrayList<>(List.of(
            "-Xbootclasspath/a:." + java.io.File.pathSeparator + System.getProperty("test.classes"),
            "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI", "-Xbatch",
            "-XX:CompileThresholdScaling=1",
            "-XX:Tier0InvokeNotifyFreqLog=7",
            "-XX:Tier2InvokeNotifyFreqLog=7",
            "-XX:Tier3InvokeNotifyFreqLog=7",
            "-XX:Tier3InvocationThreshold=1200",
            "-XX:Tier3MinInvocationThreshold=600",
            "-XX:Tier3CompileThreshold=1200",
            "-XX:Tier4InvocationThreshold=3000",
            "-XX:Tier4MinInvocationThreshold=600",
            "-XX:Tier4CompileThreshold=3000",
            "-XX:+PrintInlining"));
        if (mode.equals("without-c1l")) {
            flags.add("-XX:-UseC1L");
        }
        if (!mode.equals("inlining")) {
            // Keep the driver interpreted so target calls cannot disappear into it.
            for (String name : List.of("atLimit", "aboveLimit", "longStraightline", "forwardBranch",
                                       "switchOnly", "shortLoop", "sustainedLoop", "backedgeNeverTaken",
                                       "shortSynchronized", "synchronizedShortLoop", "shortStaticCall",
                                       "shortVirtualCall", "shortArray", "shortVolatile", "getValue",
                                       "getConstant")) {
                flags.add("-XX:CompileCommand=compileonly," + Work.class.getName() + "::" + name);
            }
        } else {
            flags.add("-XX:+UseC1L");
            flags.add("-XX:CompileCommand=compileonly," + Work.class.getName() + "::inlineCaller");
        }
        flags.add(Work.class.getName());
        flags.add(mode);
        OutputAnalyzer out = ProcessTools.executeTestJava(flags.toArray(String[]::new));
        out.shouldHaveExitValue(0);
        if (mode.equals("inlining")) {
            out.shouldMatch("(?m)^.*C1LEarlyAdmissionTest\\$Work::inlineCallee \\(\\d+ bytes\\)\\s+inline(?:\\s+\\(.*\\))?\\s*$");
        }
    }

    public static class Work {
        private static final WhiteBox WB = WhiteBox.getWhiteBox();
        private static final Work INSTANCE = new Work();
        private static final Worker WORKER = new Worker();
        private static final int[] ARRAY = { 4, 9, 12 };
        private static volatile int VOLATILE_VALUE = 19;
        private final int value = 17;

        // Twelve bytes of nontrivial, straight-line bytecode.
        static int atLimit(int x) {
            return x * 3 + x * 2 + x + 1;
        }

        // Thirteen bytes; non-loop and non-monitor roots use ordinary thresholds.
        static int aboveLimit(int x) {
            int y = x * 3 + x + x;
            y++;
            return y;
        }

        // A larger straight-line non-loop/non-monitor root also uses ordinary thresholds.
        static int longStraightline(int x) {
            int y = x;
            y = y * 3 + 2;
            y = y * 5 + 4;
            y = y * 7 + 6;
            y = y * 11 + 8;
            y = y * 13 + 10;
            y = y * 17 + 12;
            y = y * 19 + 14;
            return y + staticHelper(x);
        }

        // A forward conditional branch is not a loop and does not qualify for early C1L.
        static int forwardBranch(int x) {
            if (x >= 0) {
                return x * 3 + 1;
            }
            return x * 5 - 2;
        }

        // Switch dispatch without a backward edge also uses ordinary thresholds.
        static int switchOnly(int x) {
            return switch (x) {
                case 1 -> x * 3 + 7;
                case 2 -> x * 5 + 13;
                case 3 -> x * 7 + 17;
                default -> x + 11;
            };
        }

        // One taken backedge per call retains the loop root's early compiled entry point.
        static int shortLoop(int x) {
            do {
                x--;
            } while (x > 0);
            return x;
        }

        // Repeated calls execute several counted backedges per invocation.
        static int sustainedLoop(int x) {
            int sum = 0;
            do {
                sum += x;
                x--;
            } while (x > 0);
            return sum;
        }

        // The bytecode has a backward branch, but this input never takes it.
        static int backedgeNeverTaken(int bound) {
            int sum = 0;
            for (int i = 1; i < bound; i++) {
                sum += i;
            }
            return sum;
        }

        // Implicit monitor operations make even a short synchronized root costly in the interpreter.
        static synchronized int shortSynchronized(int x) {
            return x * 3 + 1;
        }

        // A monitor remains sufficient for early admission even with only one backedge per call.
        static synchronized int synchronizedShortLoop(int x) {
            do {
                x--;
            } while (x > 0);
            return x;
        }

        // These non-loop/non-monitor roots use ordinary thresholds regardless of size.
        static int shortStaticCall(int x) {
            return staticHelper(x) + 1;
        }

        static int staticHelper(int x) {
            return x * 2;
        }

        static int shortVirtualCall(int x) {
            return WORKER.apply(x) + 1;
        }

        static int shortArray(int index) {
            return ARRAY[index] + 1;
        }

        static int shortVolatile(int x) {
            return VOLATILE_VALUE + x;
        }

        private static class Worker {
            int apply(int x) {
                return x * 2;
            }
        }

        int getValue() {
            return value;
        }

        static int getConstant() {
            return 7;
        }

        static int inlineCallee(int x) {
            return x * 3 + 1;
        }

        static synchronized int inlineCaller(int x) {
            return inlineCallee(x) + x * 5 + x * 7 + x;
        }

        public static void main(String[] args) throws Exception {
            if (args[0].equals("transitions")) {
                runTransitions(true);
            } else if (args[0].equals("without-c1l")) {
                runTransitions(false);
            } else if (args[0].equals("inlining")) {
                runInlining();
            }
        }

        static void runTransitions(boolean c1lEnabled) throws Exception {
            check(codeLength("atLimit") == SHORT_LIMIT, "atLimit bytecode length changed");
            check(codeLength("aboveLimit") == SHORT_LIMIT + 1, "aboveLimit bytecode length changed");
            check(codeLength("longStraightline") > SHORT_LIMIT,
                  "longStraightline must exceed the former bytecode-size cutoff");
            check(codeLength("forwardBranch") > SHORT_LIMIT, "forwardBranch must exceed the former cutoff");
            check(codeLength("switchOnly") > SHORT_LIMIT, "switchOnly must exceed the former cutoff");
            check(hasControlFlow("shortLoop"), "shortLoop must retain its branch");
            check(hasBackwardBranch("shortLoop"), "shortLoop must retain a backward branch");
            check(hasBackwardBranch("sustainedLoop"), "sustainedLoop must retain a backward branch");
            check(hasBackwardBranch("backedgeNeverTaken"),
                  "backedgeNeverTaken must retain a backward branch in its bytecode");
            check(isSynchronized("shortSynchronized"), "shortSynchronized must retain its monitor property");
            check(isSynchronized("synchronizedShortLoop"),
                  "synchronizedShortLoop must retain its monitor property");
            check(hasBackwardBranch("synchronizedShortLoop"),
                  "synchronizedShortLoop must retain its backward branch");
            check(hasBranch("forwardBranch"), "forwardBranch must retain its conditional branch");
            check(!hasSwitch("forwardBranch"), "forwardBranch should not use switch dispatch");
            check(hasSwitch("switchOnly"), "switchOnly must retain its switch instruction");
            for (String name : List.of("atLimit", "aboveLimit", "longStraightline", "shortStaticCall",
                                       "shortVirtualCall", "shortArray", "shortVolatile")) {
                check(!hasControlFlow(name), name + " must be a non-loop root");
                check(!hasMonitorOperations(name), name + " must be a non-monitor root");
            }
            for (String name : List.of("forwardBranch", "switchOnly")) {
                check(hasControlFlow(name), name + " must exercise control flow without a loop");
                check(!hasMonitorOperations(name), name + " must be a non-monitor root");
            }

            assertTransition("atLimit", 3, true);
            assertTransition("aboveLimit", 3, true);
            assertTransition("longStraightline", 3, true);
            assertTransition("forwardBranch", 3, true);
            assertTransition("switchOnly", 3, true);
            assertTransition("shortLoop", 3, true, c1lEnabled);
            assertTransition("sustainedLoop", 3, true, c1lEnabled);
            assertTransition("backedgeNeverTaken", 3, true, c1lEnabled);
            assertTransition("shortSynchronized", 3, true, c1lEnabled);
            assertTransition("synchronizedShortLoop", 3, true, c1lEnabled);
            assertTransition("shortStaticCall", 3, true);
            assertTransition("shortVirtualCall", 3, true);
            assertTransition("shortArray", 3, true);
            assertTransition("shortVolatile", 3, true);
            assertTrivial("getValue", true);
            assertTrivial("getConstant", false);
            System.out.println("EARLY_ADMISSION_TRANSITIONS_OK");
        }

        private static void assertTransition(String name, int expectedFirstLevel,
                                             boolean expectLevel3) throws Exception {
            assertTransition(name, expectedFirstLevel, expectLevel3, false);
        }

        private static void assertTransition(String name, int expectedFirstLevel,
                                             boolean expectLevel3, boolean early) throws Exception {
            Method method = Work.class.getDeclaredMethod(name, int.class);
            int previous = 0;
            int first = 0;
            boolean sawLevel3 = false;
            boolean sawLevel4 = false;
            for (int i = 1; i <= 20_000; i++) {
                int x = (i & 7) + 1;
                int result = invoke(name, x);
                int expected = expectedResult(name, x);
                check(result == expected, name + " result changed");
                int level = WB.getMethodCompilationLevel(method);
                if (level != previous) {
                    System.out.println(name + ": " + previous + " -> " + level + " at call " + i);
                    if (first == 0) {
                        first = level;
                        check(first == expectedFirstLevel,
                              name + " first tier " + first + " expected " + expectedFirstLevel);
                        if ((name.equals("shortLoop") || name.equals("backedgeNeverTaken") ||
                             name.equals("shortSynchronized") ||
                             name.equals("synchronizedShortLoop")) &&
                            early) {
                            check(i < 1200, name + " did not use early C1L admission");
                        }
                        if (name.equals("sustainedLoop") && early) {
                            check(i < 600, name + " did not precede ordinary tier-3 invocation admission");
                        }
                        if (name.equals("shortLoop") && expectedFirstLevel == 3 && !early) {
                            check(i >= 600, name + " bypassed the ordinary combined tier-3 threshold");
                        }
                        if ((name.equals("aboveLimit") || name.equals("longStraightline") ||
                             name.equals("forwardBranch") || name.equals("switchOnly") ||
                             name.equals("backedgeNeverTaken")) &&
                            expectedFirstLevel == 3 && !early) {
                            check(i >= 1200, name + " bypassed the normal tier-3 threshold");
                        }
                    }
                    sawLevel3 |= level == 3;
                    sawLevel4 |= level == 4;
                    previous = level;
                    if (level == 4) break;
                }
            }
            check(first == expectedFirstLevel, name + " did not compile");
            check(!expectLevel3 || sawLevel3, name + " missed level 3");
            check(sawLevel4, name + " missed level 4");
            long methodData = WB.getMethodData(method);
            check(methodData != 0, name + " did not retain its MethodData");
            WB.deoptimizeMethod(method);
            check(WB.getMethodData(method) == methodData, name + " lost MethodData after deoptimization");
            int probe = 3;
            check(invoke(name, probe) == expectedResult(name, probe),
                  name + " result changed after deoptimization");
        }

        private static int invoke(String name, int x) {
            return switch (name) {
                case "atLimit" -> atLimit(x);
                case "aboveLimit" -> aboveLimit(x);
                case "longStraightline" -> longStraightline(x);
                case "forwardBranch" -> forwardBranch((x & 1) == 0 ? -x : x);
                case "switchOnly" -> switchOnly(x);
                case "shortLoop" -> shortLoop(2);
                case "sustainedLoop" -> sustainedLoop(8);
                case "backedgeNeverTaken" -> backedgeNeverTaken(0);
                case "shortSynchronized" -> shortSynchronized(x);
                case "synchronizedShortLoop" -> synchronizedShortLoop(2);
                case "shortStaticCall" -> shortStaticCall(x);
                case "shortVirtualCall" -> shortVirtualCall(x);
                case "shortArray" -> shortArray(x % ARRAY.length);
                case "shortVolatile" -> shortVolatile(x);
                default -> throw new IllegalArgumentException(name);
            };
        }

        private static int expectedResult(String name, int x) {
            return switch (name) {
                case "atLimit" -> 6 * x + 1;
                case "aboveLimit" -> 5 * x + 1;
                case "longStraightline" -> 4_849_847 * x + 4_840_720;
                case "forwardBranch" -> {
                    int input = (x & 1) == 0 ? -x : x;
                    yield input >= 0 ? input * 3 + 1 : input * 5 - 2;
                }
                case "switchOnly" -> switch (x) {
                    case 1 -> x * 3 + 7;
                    case 2 -> x * 5 + 13;
                    case 3 -> x * 7 + 17;
                    default -> x + 11;
                };
                case "shortLoop" -> 0;
                case "sustainedLoop" -> 36;
                case "backedgeNeverTaken" -> 0;
                case "shortSynchronized" -> 3 * x + 1;
                case "synchronizedShortLoop" -> 0;
                case "shortStaticCall", "shortVirtualCall" -> 2 * x + 1;
                case "shortArray" -> ARRAY[x % ARRAY.length] + 1;
                case "shortVolatile" -> VOLATILE_VALUE + x;
                default -> throw new IllegalArgumentException(name);
            };
        }

        private static void assertTrivial(String name, boolean instanceMethod) throws Exception {
            Method method = Work.class.getDeclaredMethod(name);
            for (int i = 0; i < 2_000; i++) {
                int result = instanceMethod ? INSTANCE.getValue() : getConstant();
                check(result == (instanceMethod ? 17 : 7), name + " result changed");
            }
            check(WB.getMethodCompilationLevel(method) == 1,
                  name + " must retain the existing level-1 trivial-method path");
        }

        private static int codeLength(String name) throws Exception {
            return codeAttribute(name).codeLength();
        }

        private static CodeAttribute codeAttribute(String name) throws Exception {
            String resource = "C1LEarlyAdmissionTest$Work.class";
            try (InputStream in = Work.class.getResourceAsStream(resource)) {
                check(in != null, "missing class resource " + resource);
                var classModel = ClassFile.of().parse(in.readAllBytes());
                MethodModel method = classModel.methods().stream()
                    .filter(m -> m.methodName().stringValue().equals(name))
                    .findFirst().orElseThrow(() -> new AssertionError("missing method " + name));
                return method.findAttribute(Attributes.code()).orElseThrow();
            }
        }

        private static boolean hasControlFlow(String name) throws Exception {
            return codeAttribute(name).elementStream().anyMatch(element ->
                element instanceof BranchInstruction || element instanceof LookupSwitchInstruction ||
                element instanceof TableSwitchInstruction);
        }

        private static boolean hasBranch(String name) throws Exception {
            return codeAttribute(name).elementStream().anyMatch(BranchInstruction.class::isInstance);
        }

        private static boolean hasBackwardBranch(String name) throws Exception {
            CodeAttribute code = codeAttribute(name);
            int bci = 0;
            var elements = code.elementStream().iterator();
            while (elements.hasNext()) {
                var element = elements.next();
                if (element instanceof BranchInstruction branch &&
                    code.labelToBci(branch.target()) < bci) {
                    return true;
                }
                if (element instanceof Instruction instruction) {
                    bci += instruction.sizeInBytes();
                }
            }
            return false;
        }

        private static boolean hasSwitch(String name) throws Exception {
            return codeAttribute(name).elementStream().anyMatch(element ->
                element instanceof LookupSwitchInstruction || element instanceof TableSwitchInstruction);
        }

        private static boolean hasMonitorOperations(String name) throws Exception {
            return codeAttribute(name).elementStream().anyMatch(MonitorInstruction.class::isInstance) ||
                   isSynchronized(name);
        }

        private static boolean isSynchronized(String name) throws Exception {
            return Modifier.isSynchronized(Work.class.getDeclaredMethod(name, int.class).getModifiers());
        }

        static void runInlining() throws Exception {
            check(isSynchronized("inlineCaller"), "inlineCaller must remain an early-admission monitor root");
            check(!hasControlFlow("inlineCaller"), "inlineCaller should not rely on loop admission");
            Method caller = Work.class.getDeclaredMethod("inlineCaller", int.class);
            int previous = 0;
            int first = 0;
            boolean sawC2 = false;
            for (int i = 1; i <= 10_000; i++) {
                int x = (i & 7) + 1;
                int expected = inlineCallee(x) + x * 5 + x * 7 + x;
                check(inlineCaller(x) == expected, "inlineCaller result changed");
                int level = WB.getMethodCompilationLevel(caller);
                if (level != previous) {
                    if (first == 0) {
                        first = level;
                        check(first == 3, "inline caller should use early full-profile C1, got " + first);
                        check(i < 1200, "eligible inline caller did not compile before the normal threshold");
                    }
                    sawC2 |= level == 4;
                    previous = level;
                    if (level == 4) break;
                }
            }
            check(first == 3 && sawC2, "inline caller missed early C1L or C2 promotion");
            System.out.println("EARLY_ADMISSION_INLINING_OK");
        }

        private static void check(boolean condition, String message) {
            if (!condition) throw new AssertionError(message);
        }
    }
}
