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
 * @summary Constant String origins retain cold/ready C1 admission through compilation and invalidation
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.compiler1.enabled & vm.flagless
 * @library /test/lib
 * @modules java.base/java.lang:+open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingC1ConstantAdmission cold 1
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingC1ConstantAdmission ready 1
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingC1ConstantAdmission cold 3
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingC1ConstantAdmission ready 3
 */
package compiler.intrinsics.tmfy;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.test.lib.util.StringCodingAccess;
import jdk.test.whitebox.WhiteBox;
import jdk.test.whitebox.code.NMethod;

public class TestStringCodingC1ConstantAdmission {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();
    private static final String S16 = "aaaaaaaaaaaaaaa\u4e2d";
    private static final String S63 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\u4e2d";
    private static final String S64 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\u4e2d";
    private static final String S65 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\u4e2d";
    private static volatile Object sink;
    private static byte[] c16() { return S16.getBytes(StandardCharsets.UTF_8); }
    private static byte[] c63() { return S63.getBytes(StandardCharsets.UTF_8); }
    private static byte[] c64() { return S64.getBytes(StandardCharsets.UTF_8); }
    private static byte[] c65() { return S65.getBytes(StandardCharsets.UTF_8); }

    private static byte[] expected(String input) {
        byte[] result = new byte[input.length() + 2];
        Arrays.fill(result, 0, input.length() - 1, (byte)'a');
        int end = input.length() - 1;
        result[end] = (byte)0xe4;
        result[end + 1] = (byte)0xb8;
        result[end + 2] = (byte)0xad;
        return result;
    }

    private static void check(Method method, byte[] expected) throws Exception {
        byte[] actual = (byte[])method.invoke(null);
        if (!Arrays.equals(actual, expected)) throw new AssertionError("constant conversion mismatch");
        sink = actual;
    }

    public static void main(String[] args) throws Exception {
        boolean ready = args[0].equals("ready");
        int level = Integer.parseInt(args[1]);
        Class<?> holder = Class.forName("java.lang.StringCoding");
        Field initialized = holder.getDeclaredField("utf8Ready");
        initialized.setAccessible(true);
        if (initialized.getBoolean(null)) throw new AssertionError("unexpected early Unicode setup");
        // This fixture deliberately inlines only to exercise constant-folded
        // original guards with caller frames. Production inlining is unchanged.
        for (Method method : String.class.getDeclaredMethods()) {
            if (method.getName().equals("encodeUTF8") || method.getName().equals("encodeUTF8_UTF16") ||
                    (method.getName().equals("encode") && Arrays.equals(method.getParameterTypes(),
                            new Class<?>[] {java.nio.charset.Charset.class, byte.class, byte[].class})) ||
                    (method.getName().equals("getBytes") && Arrays.equals(method.getParameterTypes(),
                            new Class<?>[] {java.nio.charset.Charset.class}))) {
                WB.testSetForceInlineMethod(method, true);
            }
        }
        if (ready && !StringCodingAccess.ready()) throw new AssertionError("early setup failed");
        String[] names = {"c16", "c63", "c64", "c65"};
        String[] inputs = {S16, S63, S64, S65};
        Method[] methods = new Method[names.length];
        byte[][] expected = new byte[names.length][];
        int[] ids = new int[names.length];
        for (int i = 0; i < names.length; ++i) {
            methods[i] = TestStringCodingC1ConstantAdmission.class.getDeclaredMethod(names[i]);
            // Reflection adapters may otherwise inline these tiny wrappers in
            // a later compilation and make a new readiness decision. Exercise
            // the exact nmethod whose compile id is captured below.
            WB.testSetDontInlineMethod(methods[i], true);
            expected[i] = expected(inputs[i]);
            for (int j = 0; j < 100; ++j) check(methods[i], expected[i]);
            WB.deoptimizeMethod(methods[i]);
            if (!WB.enqueueMethodForCompilation(methods[i], level)) throw new AssertionError("compilation rejected");
            NMethod compiled = NMethod.get(methods[i], false);
            if (compiled == null || compiled.comp_level != level) throw new AssertionError("C1 nmethod missing");
            ids[i] = compiled.compile_id;
        }
        if (initialized.getBoolean(null) != ready) throw new AssertionError("warmup changed readiness");
        if (!StringCodingAccess.ready()) throw new AssertionError("late setup failed");
        // The observer intentionally runs only after explicit late setup.
        long[] before = StringCodingAccess.counters0();
        for (int n = 0; n < 1000; ++n) for (int i = 0; i < names.length; ++i) check(methods[i], expected[i]);
        long[] after = StringCodingAccess.counters0();
        long leaves = after[0] - before[0];
        if (leaves != (ready ? 2000 : 0) || after[1] != before[1] || after[2] != before[2]) {
            throw new AssertionError("constant admission route: " + leaves);
        }
        for (int i = 0; i < methods.length; ++i) {
            NMethod compiled = NMethod.get(methods[i], false);
            if (compiled == null || compiled.compile_id != ids[i]) throw new AssertionError("unexpected recompile");
            WB.deoptimizeMethod(methods[i]);
            check(methods[i], expected[i]);
            if (!WB.enqueueMethodForCompilation(methods[i], level)) throw new AssertionError("recompilation rejected");
            check(methods[i], expected[i]);
        }
    }
}
