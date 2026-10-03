/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

/*
 * @test
 * @summary Transformed Charset policy/helper and native-prefix wrapper retain Java/JNI semantics
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.jvmti & vm.compiler1.enabled & vm.compiler2.enabled & vm.flagless
 * @library /test/lib
 * @modules java.base/sun.nio.cs:+open java.base/java.lang:+open
 * @build compiler.intrinsics.tmfy.CharsetEncoderTestSupport jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm/native compiler.intrinsics.tmfy.TestCharsetEncoderTransform
 */
package compiler.intrinsics.tmfy;

import java.lang.classfile.ClassBuilder;
import java.lang.classfile.ClassElement;
import java.lang.classfile.ClassFile;
import java.lang.classfile.ClassTransform;
import java.lang.classfile.CodeBuilder;
import java.lang.classfile.CodeElement;
import java.lang.classfile.CodeTransform;
import java.lang.classfile.MethodModel;
import java.lang.classfile.attribute.RuntimeVisibleAnnotationsAttribute;
import java.lang.constant.ClassDesc;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import jdk.test.lib.Platform;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;
import jdk.test.whitebox.code.NMethod;

import static java.lang.classfile.ClassFile.ACC_NATIVE;
import static java.lang.classfile.ClassFile.ACC_STATIC;
import static java.lang.classfile.ClassFile.ACC_VOLATILE;
import static java.lang.constant.ConstantDescs.CD_int;
import static compiler.intrinsics.tmfy.CharsetEncoderTestSupport.*;

public class TestCharsetEncoderTransform {
    private static final String PREFIX = "tmfy_charset_prefix_";
    private static final String COUNT = "tmfyCharsetTransformCalls";
    private static native int transformed();

    public static void main(String[] args) throws Throwable {
        if (args.length != 0) {
            runChild(args[0], Integer.parseInt(args[1]));
            return;
        }
        byte[] original;
        try (var stream = Object.class.getResourceAsStream("/sun/nio/cs/UTF_8$Encoder.class")) {
            check(stream != null, "missing Charset holder resource");
            original = stream.readAllBytes();
        }
        Path agent = Path.of(System.getProperty("test.nativepath"),
                System.mapLibraryName("CharsetEncoderTransform")).toAbsolutePath();
        for (String mode : List.of("predicate", "helper", "prefix")) {
            Path replacement = Path.of("CharsetEncoder-" + mode + ".class").toAbsolutePath();
            Files.write(replacement, transform(original, mode));
            // Predicate code executes in all tiers. Helper identity and prefix
            // registration use one interpreted and one optimizing-compiler case.
            for (int level : mode.equals("predicate") ? new int[] {0, 1, 4} : new int[] {0, 4}) {
                List<String> options = new ArrayList<>(List.of(
                        "-Xshare:off", "-Xbootclasspath/a:.", "-XX:+UseG1GC",
                        "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI", "-XX:+TmfyStringCodingCounters",
                        "--add-opens=java.base/sun.nio.cs=ALL-UNNAMED",
                        "--add-opens=java.base/java.lang=ALL-UNNAMED", "--enable-native-access=ALL-UNNAMED",
                        "-Djava.library.path=" + System.getProperty("test.nativepath"),
                        "-agentpath:" + agent + "=" + replacement));
                if (Platform.isDebugBuild() && mode.equals("prefix")) options.add("-XX:-CheckIntrinsics");
                if (level == 0) options.add("-Xint");
                else {
                    options.add("-Xbatch");
                    options.add(level == 1 ? "-XX:TieredStopAtLevel=1" : "-XX:-TieredCompilation");
                }
                options.add(TestCharsetEncoderTransform.class.getName());
                options.add(mode);
                options.add(Integer.toString(level));
                ProcessTools.executeTestJava(options.toArray(String[]::new)).shouldHaveExitValue(0)
                        .shouldContain("CHARSET_ENCODER_TRANSFORM_OK " + mode + " level=" + level);
            }
        }
    }

    private static byte[] transform(byte[] original, String mode) {
        var model = ClassFile.of().parse(original);
        ClassDesc holder = model.thisClass().asSymbol();
        if (!mode.equals("prefix")) {
            String target = mode.equals("predicate") ? "useNativeEncoder" : "utf8Ready";
            check(model.methods().stream().filter(m -> m.methodName().equalsString(target)).count() == 1,
                    "expected one transformed helper");
            return ClassFile.of().transformClass(model,
                    ClassTransform.transformingMethodBodies(m -> m.methodName().equalsString(target),
                            new CodeTransform() {
                                @Override
                                public void atStart(CodeBuilder builder) {
                                    increment(builder, holder);
                                }
                                @Override
                                public void accept(CodeBuilder builder, CodeElement element) {
                                    builder.with(element);
                                }
                            }).andThen(ClassTransform.endHandler(builder ->
                                    builder.withField(COUNT, CD_int, ACC_STATIC | ACC_VOLATILE))));
        }
        return ClassFile.of().transformClass(model, new ClassTransform() {
            private int wrapped;
            @Override
            public void accept(ClassBuilder builder, ClassElement element) {
                if (element instanceof MethodModel method && method.methodName().equalsString(NATIVE_NAME)) {
                    check(method.methodType().equalsString(NATIVE_TYPE) &&
                            (method.flags().flagsMask() & (ACC_STATIC | ACC_NATIVE)) == (ACC_STATIC | ACC_NATIVE),
                            "unexpected typed native declaration");
                    builder.withMethod(PREFIX + NATIVE_NAME, method.methodTypeSymbol(),
                            method.flags().flagsMask(), mb -> method.forEach(attribute -> {
                                if (attribute instanceof RuntimeVisibleAnnotationsAttribute annotations) {
                                    mb.with(RuntimeVisibleAnnotationsAttribute.of(annotations.annotations().stream()
                                            .filter(a -> !a.className().equalsString(
                                                    "Ljdk/internal/vm/annotation/IntrinsicCandidate;")).toList()));
                                } else {
                                    mb.with(attribute);
                                }
                            }));
                    builder.withMethod(NATIVE_NAME, method.methodTypeSymbol(),
                            method.flags().flagsMask() & ~ACC_NATIVE, mb -> mb.withCode(code -> {
                                increment(code, holder);
                                code.aload(0).iload(1).iload(2).aload(3).iload(4).iload(5)
                                        .invokestatic(holder, PREFIX + NATIVE_NAME, method.methodTypeSymbol()).ireturn();
                            }));
                    wrapped++;
                } else {
                    builder.with(element);
                }
            }
            @Override
            public void atEnd(ClassBuilder builder) {
                check(wrapped == 1, "expected one typed native wrapper");
                builder.withField(COUNT, CD_int, ACC_STATIC | ACC_VOLATILE);
            }
        });
    }

    private static void increment(CodeBuilder builder, ClassDesc holder) {
        builder.getstatic(holder, COUNT, CD_int).iconst_1().iadd().putstatic(holder, COUNT, CD_int);
    }

    private static void runChild(String mode, int level) throws Throwable {
        System.loadLibrary("CharsetEncoderTransform");
        // Initialize the holder before checking that the load hook ran.
        Field counter = TYPE.getDeclaredField(COUNT);
        counter.setAccessible(true);
        check(transformed() == 1, "Charset holder was not transformed exactly once");
        if (mode.equals("prefix")) {
            check(!Modifier.isNative(NATIVE.getModifiers()), "native prefix wrapper missing");
            check(Modifier.isNative(TYPE.getDeclaredMethod(PREFIX + NATIVE_NAME,
                    NATIVE.getParameterTypes()).getModifiers()), "prefixed native missing");
        }
        WhiteBox wb = WhiteBox.getWhiteBox();
        wb.testSetDontInlineMethod(ORIGIN, true);
        PublicCall call = new PublicCall();
        for (int i = 0; i < (level == 0 ? 1 : 300); i++) call.run();
        NMethod compiled = null;
        if (level != 0) {
            wb.deoptimizeMethod(ORIGIN);
            check(wb.enqueueMethodForCompilation(ORIGIN, level), "transformed origin compilation rejected");
            compiled = NMethod.get(ORIGIN, false);
            check(compiled != null && compiled.comp_level == level, "transformed origin nmethod missing");
        }
        int count = counter.getInt(null);
        long[] before = counters();
        for (int i = 0; i < 100; i++) call.run();
        route(before, 0, 0, "transformed public route");
        if (level != 0) {
            NMethod after = NMethod.get(ORIGIN, false);
            check(after != null && after.compile_id == compiled.compile_id && after.comp_level == level,
                    "transformed public calls did not retain the recorded origin nmethod");
        }
        check(counter.getInt(null) - count == (mode.equals("predicate") ? 100 : 0),
                "public conversion ignored transformed predicate or unexpectedly called helper/wrapper");
        semantics();
        if (mode.equals("helper")) {
            count = counter.getInt(null);
            check(ready(), "transformed readiness helper failed");
            check(counter.getInt(null) == count + 1, "transformed helper side effect lost");
        }
        // Prefix-aware RegisterNatives must still bind the renamed native.
        // Public fallback does not prove ordinary JNI registration parity.
        // Deliberately repeat the bridge to revoke raw bypasses: transforming
        // only the Java policy can leave the typed native's identity intact.
        // This comes after public measurements, so it cannot mask admission.
        register();
        register();
        count = counter.getInt(null);
        before = counters();
        char[] input = input();
        byte[] output = new byte[3 * input.length];
        check(raw(input, output) == ((input.length << 13) | output.length), "typed JNI packed progress");
        for (int i = 0; i < output.length; i++) {
            byte expected = (byte) switch (i % 3) { case 0 -> 0xe4; case 1 -> 0xb8; default -> 0xad; };
            check(output[i] == expected, "typed JNI output byte");
        }
        route(before, 0, 1, "transformed explicit JNI route");
        check(counter.getInt(null) - count == (mode.equals("prefix") ? 1 : 0), "native wrapper bypassed");
        System.out.println("CHARSET_ENCODER_TRANSFORM_OK " + mode + " level=" + level);
    }
}
