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
 * @summary Native-prefix wrappers around StringCoding remain observable through public Unicode conversion
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.jvmti
 * @requires vm.compiler1.enabled & vm.compiler2.enabled & vm.flagless
 * @library /test/lib
 * @modules java.base/java.lang:+open
 * @build compiler.intrinsics.tmfy.TestStringCodingNativePrefix jdk.test.lib.util.StringCodingAccess
 * @run main/othervm/native compiler.intrinsics.tmfy.TestStringCodingNativePrefix
 */
package compiler.intrinsics.tmfy;

import java.lang.classfile.ClassBuilder;
import java.lang.classfile.ClassElement;
import java.lang.classfile.ClassFile;
import java.lang.classfile.ClassTransform;
import java.lang.classfile.MethodModel;
import java.lang.classfile.attribute.RuntimeVisibleAnnotationsAttribute;
import java.lang.constant.ClassDesc;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import jdk.test.lib.Platform;
import jdk.test.lib.process.ProcessTools;
import jdk.test.lib.util.StringCodingAccess;

import static java.lang.classfile.ClassFile.ACC_NATIVE;
import static java.lang.classfile.ClassFile.ACC_STATIC;
import static java.lang.classfile.ClassFile.ACC_VOLATILE;
import static java.lang.constant.ConstantDescs.CD_int;

public class TestStringCodingNativePrefix {
    private static final String PREFIX = "tmfy_prefix_";
    private static final String ENCODE_COUNT = "tmfyPrefixEncodeCalls";
    private static final String DECODE_COUNT = "tmfyPrefixDecodeCalls";

    private static native int transformed0();

    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            runChild(args[0]);
            return;
        }
        Path replacement = Path.of("StringCoding-native-prefix.class").toAbsolutePath();
        byte[] original;
        try (var in = String.class.getResourceAsStream("/java/lang/StringCoding.class")) {
            if (in == null) throw new AssertionError("missing StringCoding class resource");
            original = in.readAllBytes();
        }
        Files.write(replacement, wrapNatives(original));
        Path agent = Path.of(System.getProperty("test.nativepath"),
                System.mapLibraryName("StringCodingNativePrefix")).toAbsolutePath();
        for (String mode : List.of("interpreter", "c1", "c2")) {
            List<String> options = new ArrayList<>(List.of(
                    "-Xmx128m", "-XX:+UseG1GC", "-XX:+UnlockDiagnosticVMOptions",
                    "-Djava.library.path=" + System.getProperty("test.nativepath"),
                    "-XX:+TmfyStringCodingCounters", "--add-opens=java.base/java.lang=ALL-UNNAMED",
                    "--enable-native-access=ALL-UNNAMED", "-agentpath:" + agent + "=" + replacement));
            if (Platform.isDebugBuild()) {
                // The upstream ASSERT-only orphan catalogue check is incompatible
                // with intentionally removed intrinsic identities. This diagnostic
                // switch does not disable the runtime intrinsic admission checks.
                options.add("-XX:-CheckIntrinsics");
            }
            options.addAll(switch (mode) {
                case "interpreter" -> List.of("-Xint");
                case "c1" -> List.of("-Xbatch", "-XX:TieredStopAtLevel=1");
                case "c2" -> List.of("-Xbatch", "-XX:-TieredCompilation", "-XX:CompileThreshold=100");
                default -> throw new AssertionError(mode);
            });
            options.add(TestStringCodingNativePrefix.class.getName());
            options.add(mode);
            ProcessTools.executeTestJava(options.toArray(String[]::new))
                    .shouldHaveExitValue(0).shouldContain("STRING_CODING_NATIVE_PREFIX_OK " + mode);
        }
    }

    private static byte[] wrapNatives(byte[] original) {
        var model = ClassFile.of().parse(original);
        ClassDesc holder = model.thisClass().asSymbol();
        return ClassFile.of().transformClass(model, new ClassTransform() {
            private int wrapped;

            @Override
            public void accept(ClassBuilder builder, ClassElement element) {
                if (element instanceof MethodModel method &&
                        (method.methodName().equalsString("encodeUtf16Utf80") ||
                         method.methodName().equalsString("decodeUtf8Utf160"))) {
                    if ((method.flags().flagsMask() & (ACC_STATIC | ACC_NATIVE)) != (ACC_STATIC | ACC_NATIVE) ||
                            !method.methodType().equalsString("([BII[BII)I")) {
                        throw new AssertionError("unexpected native declaration");
                    }
                    String name = method.methodName().stringValue();
                    String counter = name.equals("encodeUtf16Utf80") ? ENCODE_COUNT : DECODE_COUNT;
                    // Neither the wrapper nor renamed native is the original
                    // intrinsic candidate. Retain the native's other attributes.
                    builder.withMethod(PREFIX + name, method.methodTypeSymbol(),
                            method.flags().flagsMask(), mb -> method.forEach(attribute -> {
                                if (attribute instanceof RuntimeVisibleAnnotationsAttribute annotations) {
                                    mb.with(RuntimeVisibleAnnotationsAttribute.of(annotations.annotations().stream()
                                            .filter(a -> !a.className().equalsString(
                                                    "Ljdk/internal/vm/annotation/IntrinsicCandidate;"))
                                            .toList()));
                                } else {
                                    mb.with(attribute);
                                }
                            }));
                    builder.withMethod(name, method.methodTypeSymbol(),
                            method.flags().flagsMask() & ~ACC_NATIVE, mb -> mb.withCode(code -> code
                                    .getstatic(holder, counter, CD_int).iconst_1().iadd()
                                    .putstatic(holder, counter, CD_int)
                                    .aload(0).iload(1).iload(2).aload(3).iload(4).iload(5)
                                    .invokestatic(holder, PREFIX + name, method.methodTypeSymbol()).ireturn()));
                    wrapped++;
                } else {
                    builder.with(element);
                }
            }

            @Override
            public void atEnd(ClassBuilder builder) {
                if (wrapped != 2) throw new AssertionError("expected two native declarations, found " + wrapped);
                builder.withField(ENCODE_COUNT, CD_int, ACC_STATIC | ACC_VOLATILE);
                builder.withField(DECODE_COUNT, CD_int, ACC_STATIC | ACC_VOLATILE);
            }
        });
    }

    private static void publicConversion(String text, byte[] expected) {
        if (!Arrays.equals(expected, text.getBytes(StandardCharsets.UTF_8)) ||
                !text.equals(new String(expected, StandardCharsets.UTF_8))) {
            throw new AssertionError("public Unicode conversion output");
        }
    }

    private static void latin1(byte[] input, byte[] output) {
        if (StringCodingAccess.encodeLatin1Utf80(input, 0, input.length, output, 0, output.length)
                != output.length) throw new AssertionError("unwrapped Latin1 native result");
        for (int i = 0; i < output.length; i += 2) {
            if (output[i] != (byte) 0xc3 || output[i + 1] != (byte) 0xa9) {
                throw new AssertionError("unwrapped Latin1 native output");
            }
        }
    }

    private static void runChild(String mode) throws Exception {
        System.loadLibrary("StringCodingNativePrefix");
        if (transformed0() != 1) throw new AssertionError("StringCoding was not transformed exactly once");
        Class<?> holder = Class.forName("java.lang.StringCoding");
        Field encodes = holder.getDeclaredField(ENCODE_COUNT);
        Field decodes = holder.getDeclaredField(DECODE_COUNT);
        encodes.setAccessible(true);
        decodes.setAccessible(true);
        var parameters = new Class<?>[] {byte[].class, int.class, int.class, byte[].class, int.class, int.class};
        for (String name : List.of("encodeUtf16Utf80", "decodeUtf8Utf160")) {
            if (Modifier.isNative(holder.getDeclaredMethod(name, parameters).getModifiers()) ||
                    !Modifier.isNative(holder.getDeclaredMethod(PREFIX + name, parameters).getModifiers())) {
                throw new AssertionError("missing native-prefix wrapper for " + name);
            }
        }
        String text = "\u4e2d\u20ac".repeat(256); // 1024 UTF16 input bytes: cold admission qualifies.
        byte[] unit = {(byte) 0xe4, (byte) 0xb8, (byte) 0xad, (byte) 0xe2, (byte) 0x82, (byte) 0xac};
        byte[] expected = new byte[unit.length * 256];
        for (int i = 0; i < expected.length; i++) expected[i] = unit[i % unit.length];

        int initialEncodes = encodes.getInt(null), initialDecodes = decodes.getInt(null);
        // A public conversion must reach the wrapper before any explicit test
        // facade readiness/counter access. Skipping RegisterNatives leaves both
        // counts unchanged and must fail here, rather than silently staying Java.
        publicConversion(text, expected);
        if (encodes.getInt(null) != initialEncodes + 1 || decodes.getInt(null) != initialDecodes + 1) {
            throw new AssertionError("public conversion bypassed native-prefix wrappers");
        }
        byte[] latin1 = new byte[32], output = new byte[64];
        Arrays.fill(latin1, (byte) 0xe9);
        for (int i = 0; i < (mode.equals("interpreter") ? 100 : 20_000); i++) {
            publicConversion(text, expected);
            latin1(latin1, output);
        }
        long[] before = StringCodingAccess.counters0();
        int beforeEncodes = encodes.getInt(null), beforeDecodes = decodes.getInt(null);
        int iterations = 100;
        for (int i = 0; i < iterations; i++) {
            publicConversion(text, expected);
            // This native remains unwrapped and intrinsic-eligible by identity.
            // It must also use JNI after the catalogue mismatch revoked leaves.
            latin1(latin1, output);
        }
        long[] after = StringCodingAccess.counters0();
        if (encodes.getInt(null) - beforeEncodes != iterations ||
                decodes.getInt(null) - beforeDecodes != iterations ||
                after[0] != before[0] || after[1] - before[1] != 3L * iterations ||
                after[2] != before[2]) {
            throw new AssertionError("wrapper/JNI/revocation counts: wrappers=" +
                    (encodes.getInt(null) - beforeEncodes) + "," + (decodes.getInt(null) - beforeDecodes) +
                    " native=" + Arrays.toString(before) + " -> " + Arrays.toString(after));
        }
        System.out.println("STRING_CODING_NATIVE_PREFIX_OK " + mode);
    }
}
