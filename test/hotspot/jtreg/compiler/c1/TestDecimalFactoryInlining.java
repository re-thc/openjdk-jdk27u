/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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
 * @summary Java-only decimal factories obey C1 budgets without changing other tiers or directives
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & vm.bits == "64"
 * @library /test/lib
 * @modules java.base/jdk.internal.math:+open
 *          java.base/jdk.internal.misc
 *          java.base/jdk.internal.vm.annotation
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver/timeout=600 compiler.c1.TestDecimalFactoryInlining
 */

package compiler.c1;

import java.io.File;
import java.io.InputStream;
import java.lang.classfile.Annotation;
import java.lang.classfile.ClassFile;
import java.lang.classfile.ClassTransform;
import java.lang.classfile.attribute.RuntimeVisibleAnnotationsAttribute;
import java.lang.constant.ClassDesc;
import java.lang.constant.MethodTypeDesc;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.nio.ByteOrder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import jdk.internal.math.FormattedFPDecimal;
import jdk.internal.misc.Unsafe;
import jdk.internal.vm.annotation.ForceInline;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class TestDecimalFactoryInlining {
    private static final String BIG = "java.math.BigDecimal::valueOf (53 bytes)";
    private static final String FD = "jdk.internal.math.FormattedFPDecimal::valueForDoubleToString (147 bytes)";
    private static final String BIG_PATTERN = "java/math/BigDecimal.valueOf(D)Ljava/math/BigDecimal;";
    private static final String FD_PATTERN = "jdk/internal/math/FormattedFPDecimal.valueForDoubleToString(D)Ljdk/internal/math/FormattedFPDecimal;";

    public static void main(String[] args) throws Exception {
        int cases = 0;
        for (int level : new int[] {1, 2, 3}) {
            for (String route : List.of("off", "on", "jni")) {
                for (String order : List.of("caller-first", "helper-first")) {
                    for (String policy : List.of("default", "size-only", "large", "inline", "dontinline")) {
                        check(level, route, order, policy);
                        cases++;
                    }
                }
                run(level, route, "caller-first", "init").shouldContain("INITIALIZATION_PASS");
                cases++;
            }
        }
        for (String route : List.of("off", "on", "jni")) {
            for (String order : List.of("caller-first", "helper-first")) {
                check(4, route, order, "default");
                cases++;
            }
        }
        prepareOverload();
        prepareInstance();
        for (int level : new int[] {1, 2, 3}) {
            OutputAnalyzer out = run(level, "off", "caller-first", "overload");
            checkReason(out.getOutput(), "overload", "jdk.internal.math.FormattedFPDecimal::valueForDoubleToString", "force inline by annotation");
            cases++;
            out = run(level, "off", "caller-first", "platform");
            checkReason(out.getOutput(), "platform", "jdk.internal.math.FormattedFPDecimal::valueForDoubleToString", "force inline by annotation");
            cases++;
            out = run(level, "off", "caller-first", "instance");
            checkReason(out.getOutput(), "instance", "jdk.internal.math.FormattedFPDecimal::valueForDoubleToString", "force inline by annotation");
            cases++;
        }
        System.out.println("POLICY_CASES_PASS " + cases);
    }

    private static OutputAnalyzer run(int level, String route, String order, String policy) throws Exception {
        String tag = level + "-" + route + "-" + order + "-" + policy;
        boolean fixture = policy.equals("overload") || policy.equals("instance");
        String bootPath = System.getProperty("test.classes") + File.pathSeparator + ".";
        if (fixture) bootPath = Path.of(policy + "-caller").toAbsolutePath() + File.pathSeparator + bootPath;
        List<String> command = new ArrayList<>(List.of(
                "-Xms64m", "-Xmx256m", "-Xshare:off", "-XX:ActiveProcessorCount=2",
                "-XX:+UnlockExperimentalVMOptions", "-XX:+UseFourByteObjectHeaders",
                "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI", "-Xbatch",
                "-XX:CompileThresholdScaling=1000", "-XX:+PrintInlining",
                "-Xbootclasspath/a:" + bootPath,
                "--add-exports=java.base/jdk.internal.math=ALL-UNNAMED",
                "--add-opens=java.base/jdk.internal.math=ALL-UNNAMED",
                "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED",
                "-XX:" + (route.equals("off") ? "-" : "+") + "UseZmijIntrinsics"));
        command.add(level == 4 ? "-XX:-TieredCompilation" : "-XX:TieredStopAtLevel=3");
        if (route.equals("jni")) {
            command.add("-XX:DisableIntrinsic=_decimalZmij,_formatZmij");
        }
        if (policy.equals("size-only") || policy.equals("large")) {
            command.add("-XX:C1MaxInlineSize=512");
        }
        if (policy.equals("large")) {
            command.add("-XX:C1InlineStackLimit=64");
        }
        if (policy.equals("inline") || policy.equals("dontinline")) {
            command.add("-XX:CompileCommand=" + policy + "," + BIG_PATTERN);
            command.add("-XX:CompileCommand=" + policy + "," + FD_PATTERN);
        }
        if (fixture) {
            command.add("--patch-module=java.base=" + Path.of(policy + "-patch").toAbsolutePath());
        }
        command.add(Probe.class.getName());
        command.addAll(List.of(Integer.toString(level), order, policy));
        OutputAnalyzer out = ProcessTools.executeProcess(ProcessTools.createLimitedTestJavaProcessBuilder(command));
        Files.writeString(Path.of(tag + ".log"), out.getOutput());
        out.shouldHaveExitValue(0).shouldContain("PROBE_PASS");
        System.out.println("PROCESS_PASS " + tag);
        return out;
    }

    private static void check(int level, String route, String order, String policy) throws Exception {
        OutputAnalyzer out = run(level, route, order, policy);
        boolean enabled = out.getOutput().contains("BACKEND_ENABLED true");
        String big, fd;
        if (policy.equals("dontinline")) {
            big = fd = "disallowed by CompileCommand";
        } else if (policy.equals("inline")) {
            big = fd = "force inline by CompileCommand";
        } else if (enabled || level == 4) {
            big = fd = "force inline by annotation";
        } else if (policy.equals("large")) {
            big = fd = "inline";
        } else if (policy.equals("size-only")) {
            big = "inline";
            fd = "callee uses too much stack";
        } else {
            big = fd = "callee is too large";
        }
        for (String phase : order.equals("caller-first") ? List.of("first", "again") : List.of("first")) {
            checkReason(out.getOutput(), "big-" + phase, BIG, big);
            checkReason(out.getOutput(), "fd-" + phase, FD, fd);
            checkReason(out.getOutput(), "other-" + phase, "TestDecimalFactoryInlining$Other::valueOf", "force inline by annotation");
        }
    }

    private static void checkReason(String output, String phase, String method, String expected) {
        output = output.replace("\r\n", "\n");
        int start = output.indexOf("BEGIN " + phase + "\n");
        int end = output.indexOf("END " + phase + "\n", start);
        if (start < 0 || end < 0) throw new AssertionError("Missing compilation phase " + phase);
        String block = output.substring(start, end);
        for (String line : block.split("\n")) {
            int at = line.indexOf(method);
            if (at < 0) continue;
            int close = line.indexOf(" bytes)", at);
            if (close < 0) continue;
            String reason = line.substring(close + " bytes)".length()).trim();
            reason = reason.replaceFirst("^failed to inline: ", "");
            if (!reason.equals(expected)) throw new AssertionError(phase + ": expected " + expected + ", got " + line);
            return;
        }
        throw new AssertionError("Missing target " + method + " in " + block);
    }

    // Add a test-only annotated overload to the real bootstrap holder. Production
    // Java sources and existing method bytecodes are not changed by this fixture.
    private static void prepareOverload() throws Exception {
        ClassFile classFile = ClassFile.of();
        ClassDesc holder = FormattedFPDecimal.class.describeConstable().orElseThrow();
        MethodTypeDesc doubleFactory = MethodTypeDesc.of(holder, ClassDesc.ofDescriptor("D"));
        MethodTypeDesc longFactory = MethodTypeDesc.of(holder, ClassDesc.ofDescriptor("J"));
        byte[] patched;
        try (InputStream in = FormattedFPDecimal.class.getResourceAsStream("FormattedFPDecimal.class")) {
            patched = classFile.transformClass(classFile.parse(in.readAllBytes()),
                    ClassTransform.endHandler(builder -> builder.withMethod("valueForDoubleToString", longFactory,
                            ClassFile.ACC_PUBLIC | ClassFile.ACC_STATIC, method -> method
                                    .with(RuntimeVisibleAnnotationsAttribute.of(Annotation.of(
                                            ClassDesc.of("jdk.internal.vm.annotation.ForceInline"))))
                                    .withCode(code -> {
                                        code.lload(0);
                                        for (int i = 0; i < 20; i++) code.lconst_1().ladd();
                                        code.l2d().invokestatic(holder, "valueForDoubleToString", doubleFactory).areturn();
                                    }))));
        }
        Path target = Path.of("overload-patch", "jdk/internal/math/FormattedFPDecimal.class");
        Files.createDirectories(target.getParent());
        Files.write(target, patched);
        byte[] caller = classFile.build(ClassDesc.of("DecimalOverloadCaller"), builder -> builder
                .withMethodBody("call", MethodTypeDesc.of(ClassDesc.of("java.lang.Object"), ClassDesc.ofDescriptor("J")),
                        ClassFile.ACC_PUBLIC | ClassFile.ACC_STATIC,
                        code -> code.lload(0).invokestatic(holder, "valueForDoubleToString", longFactory).areturn()));
        Files.createDirectories(Path.of("overload-caller"));
        Files.write(Path.of("overload-caller", "DecimalOverloadCaller.class"), caller);
    }

    private static void prepareInstance() throws Exception {
        ClassFile cf = ClassFile.of();
        ClassDesc holder = ClassDesc.of("jdk.internal.math.FormattedFPDecimal");
        ClassDesc object = ClassDesc.of("java.lang.Object");
        ClassDesc number = ClassDesc.ofDescriptor("D");
        MethodTypeDesc factory = MethodTypeDesc.of(holder, number);
        byte[] bytes = cf.build(holder, builder -> builder
                .withFlags(ClassFile.ACC_PUBLIC | ClassFile.ACC_SUPER)
                .withMethodBody("<init>", MethodTypeDesc.ofDescriptor("()V"), ClassFile.ACC_PUBLIC,
                        code -> code.aload(0).invokespecial(object, "<init>", MethodTypeDesc.ofDescriptor("()V")).return_())
                .withMethod("valueForDoubleToString", factory, ClassFile.ACC_PUBLIC,
                        method -> method.with(RuntimeVisibleAnnotationsAttribute.of(Annotation.of(
                                ClassDesc.of("jdk.internal.vm.annotation.ForceInline"))))
                                .withCode(code -> {
                                    code.dload(1);
                                    for (int i = 0; i < 20; i++) code.dconst_1().dadd();
                                    code.pop2().aload(0).areturn();
                                })));
        Path target = Path.of("instance-patch", "jdk/internal/math/FormattedFPDecimal.class");
        Files.createDirectories(target.getParent());
        Files.write(target, bytes);
        bytes = cf.build(ClassDesc.of("InstanceDecimalCaller"), builder -> builder
                .withFlags(ClassFile.ACC_PUBLIC | ClassFile.ACC_SUPER)
                .withMethodBody("call", MethodTypeDesc.of(object, holder, number),
                        ClassFile.ACC_PUBLIC | ClassFile.ACC_STATIC,
                        code -> code.aload(0).dload(1).invokevirtual(holder, "valueForDoubleToString", factory).areturn()));
        Files.createDirectories(Path.of("instance-caller"));
        Files.write(Path.of("instance-caller", "InstanceDecimalCaller.class"), bytes);
    }

    public static class Other {
        @ForceInline
        public static BigDecimal valueOf(double v) {
            v = Math.abs(v) + 1;
            v = Math.sqrt(v) + 1;
            v = Math.sqrt(v) + 1;
            v = Math.sqrt(v) + 1;
            v = Math.sqrt(v) + 1;
            return BigDecimal.valueOf(v);
        }
    }

    public static class Probe {
        private static final WhiteBox WB = WhiteBox.getWhiteBox();
        private static volatile Object sink;
        public static BigDecimal callBig(double v) { return BigDecimal.valueOf(v); }
        public static FormattedFPDecimal callFD(double v) { return FormattedFPDecimal.valueForDoubleToString(v); }
        public static BigDecimal callOther(double v) { return Other.valueOf(v); }

        private static void compile(String phase, Method method, int level) {
            WB.deoptimizeMethod(method);
            System.out.println("BEGIN " + phase);
            if (!WB.enqueueMethodForCompilation(method, level)) {
                throw new AssertionError("Compilation did not install level " + level + ": " + method);
            }
            int installed = WB.getMethodCompilationLevel(method);
            if (installed != level) throw new AssertionError("Expected level " + level + ", got " + installed);
            System.out.println("INSTALLED " + phase + " LEVEL " + installed);
            System.out.println("END " + phase);
        }

        private static void callers(String phase, int level) throws Exception {
            compile("big-" + phase, Probe.class.getDeclaredMethod("callBig", double.class), level);
            compile("fd-" + phase, Probe.class.getDeclaredMethod("callFD", double.class), level);
            compile("other-" + phase, Probe.class.getDeclaredMethod("callOther", double.class), level);
        }

        private static void smoke() {
            double[] values = {0.0, -0.0, 1, 42, 42.125, 1e7, 1e-4, Double.MIN_VALUE, Double.MIN_NORMAL, Double.MAX_VALUE};
            String[] expected = {"0.0", "0.0", "1.0", "42.0", "42.125", "1.0E7", "1.0E-4", "4.9E-324", "2.2250738585072014E-308", "1.7976931348623157E308"};
            for (int i = 0; i < values.length; i++) {
                BigDecimal want = new BigDecimal(expected[i]);
                if (!callBig(values[i]).equals(want)) throw new AssertionError("BigDecimal case " + i);
                FormattedFPDecimal fd = callFD(Math.abs(values[i]));
                BigDecimal actual = new BigDecimal(BigInteger.valueOf(fd.getSignificand()), -fd.getExp());
                if (!actual.equals(want)) throw new AssertionError("FD case " + i);
            }
        }

        // The platform loader honors VM annotations, but is not the bootstrap
        // loader. This same-name fixture detects an overly broad holder match.
        private static void platformControl(int level) throws Exception {
            ClassFile cf = ClassFile.of();
            ClassDesc holder = ClassDesc.of("jdk.internal.math.FormattedFPDecimal");
            MethodTypeDesc factory = MethodTypeDesc.of(holder, ClassDesc.ofDescriptor("D"));
            byte[] bytes = cf.build(holder, builder -> builder
                    .withFlags(ClassFile.ACC_PUBLIC | ClassFile.ACC_SUPER)
                    .withMethod("valueForDoubleToString", factory, ClassFile.ACC_PUBLIC | ClassFile.ACC_STATIC,
                            method -> method.with(RuntimeVisibleAnnotationsAttribute.of(Annotation.of(
                                    ClassDesc.of("jdk.internal.vm.annotation.ForceInline"))))
                                    .withCode(code -> {
                                        code.dload(0);
                                        for (int i = 0; i < 20; i++) code.dconst_1().dadd();
                                        code.pop2().aconst_null().areturn();
                                    })));
            ClassLoader loader = ClassLoader.getPlatformClassLoader();
            Class<?> fake = Unsafe.getUnsafe().defineClass("jdk.internal.math.FormattedFPDecimal", bytes, 0, bytes.length, loader, null);
            if (fake.getClassLoader() != loader) throw new AssertionError("Wrong fixture loader");
            bytes = cf.build(ClassDesc.of("PlatformDecimalCaller"), builder -> builder
                    .withFlags(ClassFile.ACC_PUBLIC | ClassFile.ACC_SUPER)
                    .withMethodBody("call", MethodTypeDesc.of(ClassDesc.of("java.lang.Object"), ClassDesc.ofDescriptor("D")),
                            ClassFile.ACC_PUBLIC | ClassFile.ACC_STATIC,
                            code -> code.dload(0).invokestatic(holder, "valueForDoubleToString", factory).areturn()));
            Class<?> callerClass = Unsafe.getUnsafe().defineClass("PlatformDecimalCaller", bytes, 0, bytes.length, loader, null);
            Method caller = callerClass.getDeclaredMethod("call", double.class);
            if (caller.invoke(null, 42.0) != null) throw new AssertionError("Fixture result");
            compile("platform", caller, level);
            if (caller.invoke(null, 42.0) != null) throw new AssertionError("Compiled fixture result");
        }

        public static void main(String[] args) throws Exception {
            int level = Integer.parseInt(args[0]);
            String order = args[1], policy = args[2];
            if (policy.equals("init")) {
                Class<?> holder = Class.forName("jdk.internal.math.FormattedFPDecimal", false, null);
                if (!Unsafe.getUnsafe().shouldBeInitialized(holder)) throw new AssertionError("Holder already initialized");
                compile("before-init", Probe.class.getDeclaredMethod("callBig", double.class), level);
                compile("fd-before-init", Probe.class.getDeclaredMethod("callFD", double.class), level);
                if (!Unsafe.getUnsafe().shouldBeInitialized(holder)) throw new AssertionError("Compiler initialized holder");
                for (double value : new double[] {Double.NaN, Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY}) {
                    try { callBig(value); throw new AssertionError("Expected NumberFormatException"); }
                    catch (NumberFormatException expected) { }
                }
                if (!Unsafe.getUnsafe().shouldBeInitialized(holder)) throw new AssertionError("Nonfinite initialized holder");
                if (!callBig(42.125).equals(new BigDecimal("42.125"))) throw new AssertionError();
                if (Unsafe.getUnsafe().shouldBeInitialized(holder)) throw new AssertionError("Finite did not initialize holder");
                System.out.println("INITIALIZATION_PASS\nPROBE_PASS");
                return;
            }
            Method gate = Class.forName("jdk.internal.math.Zmij").getDeclaredMethod("isEnabled");
            gate.setAccessible(true);
            boolean enabled = (boolean) gate.invoke(null);
            boolean supported = ByteOrder.nativeOrder() == ByteOrder.LITTLE_ENDIAN
                    && List.of("amd64", "x86_64", "aarch64", "arm64").contains(System.getProperty("os.arch"));
            boolean expected = supported && WB.getBooleanVMFlag("UseZmijIntrinsics");
            if (enabled != expected) throw new AssertionError("Backend predicate differs from startup flag/platform");
            System.out.println("BACKEND_ENABLED " + enabled);
            if (policy.equals("platform")) {
                platformControl(level);
                System.out.println("PROBE_PASS");
                return;
            }
            if (policy.equals("instance")) {
                Class<?> holder = Class.forName("jdk.internal.math.FormattedFPDecimal");
                Object receiver = holder.getConstructor().newInstance();
                Method caller = Class.forName("InstanceDecimalCaller").getDeclaredMethod("call", holder, double.class);
                if (caller.invoke(null, receiver, 42.0) != receiver) throw new AssertionError("Instance fixture result");
                compile("instance", caller, level);
                if (caller.invoke(null, receiver, 42.0) != receiver) throw new AssertionError("Compiled instance result");
                System.out.println("PROBE_PASS");
                return;
            }
            if (policy.equals("overload")) {
                Method caller = Class.forName("DecimalOverloadCaller").getDeclaredMethod("call", long.class);
                sink = caller.invoke(null, 30L);
                compile("overload", caller, level);
                sink = caller.invoke(null, 30L);
                System.out.println("PROBE_PASS");
                return;
            }
            Method big = BigDecimal.class.getDeclaredMethod("valueOf", double.class);
            Method fd = FormattedFPDecimal.class.getDeclaredMethod("valueForDoubleToString", double.class);
            for (int i = 0; i < 256; i++) {
                double v = 42.125 + i;
                sink = callBig(v);
                sink = callFD(v);
                sink = callOther(v);
            }
            if (WB.getMethodCompilationLevel(big) != 0 || WB.getMethodCompilationLevel(fd) != 0) {
                throw new AssertionError("Factory compiled before fixed order");
            }
            for (String name : List.of("callBig", "callFD", "callOther")) {
                if (WB.getMethodCompilationLevel(Probe.class.getDeclaredMethod(name, double.class)) != 0) {
                    throw new AssertionError("Caller compiled before fixed order: " + name);
                }
            }
            System.out.println("ORDER_READY CALLERS_AND_FACTORIES_LEVEL_0");
            if (order.equals("helper-first")) {
                compile("fd-helper", fd, level);
                compile("big-helper", big, level);
                callers("first", level);
            } else {
                callers("first", level);
                if (WB.getMethodCompilationLevel(big) != 0 || WB.getMethodCompilationLevel(fd) != 0) {
                    throw new AssertionError("Caller-first order lost");
                }
                compile("fd-helper", fd, level);
                compile("big-helper", big, level);
                callers("again", level);
            }
            smoke();
            if (enabled != (boolean) gate.invoke(null)) throw new AssertionError("Enablement changed");
            System.out.println("PROBE_PASS");
        }
    }
}
