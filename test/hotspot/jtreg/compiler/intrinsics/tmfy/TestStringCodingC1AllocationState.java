/*
 * Copyright (c) 2026, OpenJDK contributors. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */

/*
 * @test
 * @summary Allocation-triggered active C1 deoptimization preserves public UTF-8 caller state
 * @requires vm.debug == true & os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.compiler1.enabled & vm.flagless
 * @library /test/lib
 * @modules java.base/java.lang:+open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver compiler.intrinsics.tmfy.TestStringCodingC1AllocationState
 */
package compiler.intrinsics.tmfy;

import java.lang.classfile.ClassFile;
import java.lang.classfile.Instruction;
import java.lang.classfile.Opcode;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.regex.Pattern;
import jdk.test.lib.process.ProcessTools;
import jdk.test.lib.util.StringCodingAccess;
import jdk.test.whitebox.WhiteBox;
import jdk.test.whitebox.code.NMethod;

public class TestStringCodingC1AllocationState {
    private static volatile Object innerMarker, outerMarker;
    private static volatile long innerLong, outerLong;
    private static volatile int innerInt, outerInt, visits;
    private static volatile double innerDouble, outerDouble;
    private static volatile byte[] sink;

    private static byte[] inner(String input, byte[] marker, long token, int seed, double fraction) {
        byte[] bytes = input.getBytes(StandardCharsets.UTF_8);
        innerMarker = marker;
        innerLong = token;
        innerInt = seed;
        innerDouble = fraction;
        ++visits;
        return bytes;
    }

    private static byte[] outer(String input, byte[] marker, long token, int seed, double fraction) {
        byte[] bytes = inner(input, marker, token ^ 0x70f8e6d4c2b09183L, seed + 19, fraction + 0.25);
        outerMarker = marker;
        outerLong = token;
        outerInt = seed;
        outerDouble = fraction;
        ++visits;
        return bytes;
    }

    private static void check(String input, byte[] expected, int index) {
        byte[] marker = {(byte)(index + 7)};
        long token = 0x8172635445362718L + index;
        int seed = 0x67230100 + index;
        double fraction = 3.5 + index;
        visits = 0;
        byte[] actual = outer(input, marker, token, seed, fraction);
        if (!Arrays.equals(actual, expected) || innerMarker != marker || outerMarker != marker ||
                innerLong != (token ^ 0x70f8e6d4c2b09183L) || outerLong != token ||
                innerInt != seed + 19 || outerInt != seed ||
                innerDouble != fraction + 0.25 || outerDouble != fraction || visits != 2 ||
                marker[0] != (byte)(index + 7)) {
            throw new AssertionError("allocation deopt lost output, caller state, or exactly-once effects");
        }
        sink = actual;
    }

    private static void child(int level) throws Exception {
        WhiteBox WB = WhiteBox.getWhiteBox();
        if (!Boolean.TRUE.equals(WB.getBooleanVMFlag("DeoptimizeALot")) ||
                !Boolean.FALSE.equals(WB.getBooleanVMFlag("UseFastNewTypeArray"))) {
            throw new AssertionError("allocation stress flags missing");
        }
        // Force inlining only in this state fixture, so the deopt metadata must
        // contain the public String API and both live caller scopes.
        for (Method method : String.class.getDeclaredMethods()) {
            if (method.getName().equals("encodeUTF8") || method.getName().equals("encodeUTF8_UTF16") ||
                    (method.getName().equals("encode") && Arrays.equals(method.getParameterTypes(),
                            new Class<?>[] {java.nio.charset.Charset.class, byte.class, byte[].class})) ||
                    (method.getName().equals("getBytes") && Arrays.equals(method.getParameterTypes(),
                            new Class<?>[] {java.nio.charset.Charset.class}))) {
                WB.testSetForceInlineMethod(method, true);
            }
        }
        WB.testSetForceInlineMethod(Class.forName("java.lang.StringUTF16")
                .getDeclaredMethod("newBytesFor", int.class), true);
        Class<?>[] signature = {String.class, byte[].class, long.class, int.class, double.class};
        Method inner = TestStringCodingC1AllocationState.class.getDeclaredMethod("inner", signature);
        Method outer = TestStringCodingC1AllocationState.class.getDeclaredMethod("outer", signature);
        WB.testSetForceInlineMethod(inner, true);
        WB.testSetDontInlineMethod(outer, true);
        if (!StringCodingAccess.ready()) throw new AssertionError("native setup failed");
        String[] inputs = {"a".repeat(7) + "\u00e9".repeat(8193), "a".repeat(63) + "\u4e2d"};
        byte[][] expected = {new byte[7 + 8193 * 2], new byte[66]};
        Arrays.fill(expected[0], 0, 7, (byte)'a');
        for (int i = 7; i < expected[0].length; i += 2) {
            expected[0][i] = (byte)0xc3;
            expected[0][i + 1] = (byte)0xa9;
        }
        Arrays.fill(expected[1], 0, 63, (byte)'a');
        expected[1][63] = (byte)0xe4;
        expected[1][64] = (byte)0xb8;
        expected[1][65] = (byte)0xad;
        for (int i = 0; i < 100; ++i) for (int j = 0; j < inputs.length; ++j) check(inputs[j], expected[j], j);
        WB.deoptimizeMethod(outer);
        if (!WB.enqueueMethodForCompilation(outer, level)) throw new AssertionError("C1 compilation rejected");
        NMethod compiled = NMethod.get(outer, false);
        if (compiled == null || compiled.comp_level != level) throw new AssertionError("C1 caller missing");
        System.out.println("ALLOCATION_COMPILE_ID=" + compiled.compile_id);
        for (int j = 0; j < inputs.length; ++j) {
            int before = WB.getDeoptCount("constraint", "none");
            check(inputs[j], expected[j], j + 10);
            if (WB.getDeoptCount("constraint", "none") <= before) {
                throw new AssertionError("allocation did not deoptimize an active frame");
            }
        }
        System.out.println("ALLOCATION_PASS level=" + level);
    }

    private static int allocationBci(String owner, String name, String descriptor) throws Exception {
        Class<?> type = Class.forName(owner);
        try (var stream = type.getResourceAsStream(type.getSimpleName() + ".class")) {
            var method = ClassFile.of().parse(stream.readAllBytes()).methods().stream()
                    .filter(m -> m.methodName().equalsString(name) && m.methodType().equalsString(descriptor))
                    .findFirst().orElseThrow();
            int bci = 0;
            for (var element : method.code().orElseThrow()) if (element instanceof Instruction instruction) {
                if (instruction.opcode() == Opcode.NEWARRAY) return bci;
                bci += instruction.sizeInBytes();
            }
        }
        throw new AssertionError("allocation bytecode missing");
    }

    private static void checkLog(String log, int id) throws Exception {
        boolean latin1 = false, utf16 = false;
        var blocks = Pattern.compile("<deoptimized ([^>]*)>(.*?)</deoptimized>", Pattern.DOTALL).matcher(log);
        while (blocks.find()) {
            if (!blocks.group(1).contains("compile_id='" + id + "'") ||
                    !blocks.group(1).contains("reason='constraint'")) continue;
            String frames = blocks.group(2);
            if (!frames.contains("TestStringCodingC1AllocationState outer ") ||
                    !frames.contains("TestStringCodingC1AllocationState inner ") ||
                    !frames.contains("java.lang.String getBytes ")) continue;
            latin1 |= frames.contains("<jvms bci='" + allocationBci("java.lang.StringUTF16", "newBytesFor", "(I)[B") +
                    "' method='java.lang.StringUTF16 newBytesFor (I)[B'");
            utf16 |= frames.contains("<jvms bci='" + allocationBci("java.lang.String", "encodeUTF8_UTF16", "([BLjava/lang/Class;)[B") +
                    "' method='java.lang.String encodeUTF8_UTF16 ([BLjava/lang/Class;)[B'");
        }
        if (!latin1 || !utf16) throw new AssertionError("allocation deopt log lacks original allocation and caller scopes");
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 0) { child(Integer.parseInt(args[0])); return; }
        for (int level : new int[] {1, 3}) {
            Path log = Path.of("c1-allocation-state-" + level + ".xml").toAbsolutePath();
            var result = ProcessTools.executeTestJava("-Xbootclasspath/a:.", "-Xbatch", "-Xshare:off",
                    "-XX:+UseG1GC", "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI",
                    "-XX:+UseTmfyStringCoding", "--add-opens=java.base/java.lang=ALL-UNNAMED",
                    "-XX:TieredStopAtLevel=" + level, "-XX:-UseFastNewTypeArray", "-XX:+DeoptimizeALot",
                    "-XX:+CheckUnhandledOops",
                    // Suppress unrelated periodic whole-VM deopts. The explicit
                    // Runtime1::new_type_array deopt_caller remains unconditional.
                    "-XX:DeoptimizeALotInterval=2147483647", "-XX:-DeoptimizeRandom",
                    "-XX:Tier3InvocationThreshold=2147483647", "-XX:Tier3MinInvocationThreshold=2147483647",
                    "-XX:Tier3CompileThreshold=2147483647", "-XX:Tier3BackEdgeThreshold=2147483647",
                    "-Xms32m", "-Xmx256m", "-XX:+LogCompilation", "-XX:LogFile=" + log,
                    TestStringCodingC1AllocationState.class.getName(), Integer.toString(level))
                    .shouldHaveExitValue(0).shouldContain("ALLOCATION_PASS level=" + level);
            var id = Pattern.compile("ALLOCATION_COMPILE_ID=(\\d+)").matcher(result.getOutput());
            if (!id.find()) throw new AssertionError("compile identity missing");
            checkLog(Files.readString(log), Integer.parseInt(id.group(1)));
        }
        // This proves allocation state and caller reconstruction. The forced
        // deopt precedes native admission; it does not cover synthetic BCI 44.
    }
}
