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
 * @summary C1 preserves original Unicode profiles and Java routes while admitting ready work at independent bounds
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.compiler1.enabled & vm.flagless
 * @library /test/lib
 * @modules java.base/java.lang:+open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingC1Admission encode root cold 1
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingC1Admission encode root ready 1
 * @run main/othervm/native -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED compiler.intrinsics.tmfy.TestStringCodingC1Admission encode root rebind 1
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingC1Admission encode inline cold 1
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingC1Admission encode inline ready 1
 * @run main/othervm/native -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED compiler.intrinsics.tmfy.TestStringCodingC1Admission encode inline rebind 1
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingC1Admission decode root cold 1
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingC1Admission decode root ready 1
 * @run main/othervm/native -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED compiler.intrinsics.tmfy.TestStringCodingC1Admission decode root rebind 1
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingC1Admission decode inline cold 1
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingC1Admission decode inline ready 1
 * @run main/othervm/native -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED compiler.intrinsics.tmfy.TestStringCodingC1Admission decode inline rebind 1
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingC1Admission encode root ready 3
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingC1Admission encode inline ready 3
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingC1Admission decode root cold 3
 * @run main/othervm -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=3 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingC1Admission decode inline cold 3
 */
/*
 * @test id=cds
 * @summary C1 origin admission reads live readiness for archived String and StringCoding classes
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.compiler1.enabled & vm.cds & vm.flagless
 * @library /test/lib
 * @modules java.base/java.lang:+open
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xshare:on -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingC1Admission encode root cold 1 cds
 * @run main/othervm -Xshare:on -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingC1Admission encode root ready 1 cds
 * @run main/othervm -Xshare:on -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingC1Admission decode root cold 1 cds
 * @run main/othervm -Xshare:on -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters compiler.intrinsics.tmfy.TestStringCodingC1Admission decode root ready 1 cds
 */
package compiler.intrinsics.tmfy;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import jdk.test.lib.util.StringCodingAccess;
import jdk.test.whitebox.WhiteBox;
import jdk.test.whitebox.code.NMethod;

public class TestStringCodingC1Admission {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();
    private static native int rebindBridge(Class<?> holder);
    private static native long bridgeCalls();
    private static volatile Object sink;

    // Inputs and expected results are constructed without the conversions under
    // test. No private String helper is invoked with a fabricated contract.
    private record Input(String text, byte[] bytes) { }

    private static Input encodeInput(int units) {
        char[] chars = new char[units];
        Arrays.fill(chars, 'a');
        chars[units - 1] = '\u4e2d';
        byte[] bytes = new byte[units + 2];
        Arrays.fill(bytes, 0, units - 1, (byte) 'a');
        bytes[units - 1] = (byte) 0xe4;
        bytes[units] = (byte) 0xb8;
        bytes[units + 1] = (byte) 0xad;
        return new Input(new String(chars), bytes);
    }

    private static Input decodeInput(int bytes) {
        byte[] data = new byte[bytes];
        char[] chars = new char[bytes / 3 + bytes % 3];
        int in = 0, out = 0;
        while (in + 2 < bytes) {
            data[in++] = (byte) 0xe4;
            data[in++] = (byte) 0xb8;
            data[in++] = (byte) 0xad;
            chars[out++] = '\u4e2d';
        }
        while (in < bytes) { data[in++] = 'a'; chars[out++] = 'a'; }
        return new Input(new String(chars), data);
    }

    private static void convert(boolean encode, Input input) {
        if (encode) {
            byte[] result = input.text().getBytes(StandardCharsets.UTF_8);
            check(Arrays.equals(result, input.bytes()), "encode mismatch");
            sink = result;
        } else {
            String result = new String(input.bytes(), StandardCharsets.UTF_8);
            check(result.equals(input.text()), "decode mismatch");
            sink = result;
        }
    }

    public static void main(String[] args) throws Exception {
        boolean encode = args[0].equals("encode");
        boolean inline = args[1].equals("inline");
        boolean readyFirst = args[2].equals("ready");
        boolean rebind = args[2].equals("rebind");
        int level = Integer.parseInt(args[3]);
        if (rebind) System.loadLibrary("StringCodingRebind");
        Class<?> holder = Class.forName("java.lang.StringCoding");
        if (args.length == 5) {
            check(WB.isSharedClass(String.class) && WB.isSharedClass(holder), "classes were not archived");
        }
        Field readiness = holder.getDeclaredField("utf8Ready");
        readiness.setAccessible(true);
        check(!readiness.getBoolean(null), "unexpected early setup");
        Method origin = encode
                ? String.class.getDeclaredMethod("encodeUTF8_UTF16", byte[].class, Class.class)
                : String.class.getDeclaredMethod("decodeUTF8_UTF16Stable", byte[].class, int.class,
                        int.class, byte[].class, int.class);
        // Isolate the immediate real caller for inline tests. Public getBytes
        // and String constructors still perform every conversion. Forcing one
        // origin edge avoids claiming an unverified multi-level wrapper inline.
        Method caller = encode
                ? String.class.getDeclaredMethod("encodeUTF8", byte.class, byte[].class, Class.class)
                : String.class.getDeclaredMethod("utf8", byte[].class, int.class, int.class);
        Method compiled = inline ? caller : origin;
        WB.testSetDontInlineMethod(caller, true);
        WB.testSetDontInlineMethod(origin, !inline);
        WB.testSetForceInlineMethod(origin, inline);
        if (readyFirst) check(StringCodingAccess.ready(), "early setup failed");
        Input tiny = encode ? encodeInput(16) : decodeInput(255);
        Input small = encode ? encodeInput(64) : decodeInput(256);
        Input large = encode ? encodeInput(1024) : decodeInput(3072);
        // Warm the below-admission route before an unseen larger input. For
        // ready encode this includes 16..63, whose original minimum branch is
        // false even though C1's separate unprofiled policy rejects the work.
        for (int i = 0; i < 30_000; ++i) convert(encode, readyFirst ? tiny : small);
        check(readiness.getBoolean(null) == readyFirst, "small warmup changed readiness");
        if (WB.getMethodCompilationLevel(compiled) != level) {
            check(WB.enqueueMethodForCompilation(compiled, level), "C1 compilation rejected");
        }
        NMethod code = NMethod.get(compiled, false);
        check(code != null && code.comp_level == level, "C1 nmethod missing");
        int traps = WB.getMethodTrapCount(origin);
        int decompiles = WB.getMethodDecompileCount(compiled);
        if (readyFirst) {
            Input below = encode ? encodeInput(63) : tiny;
            Input maximum = encode ? encodeInput(2048) : decodeInput(4096);
            Input oversized = encode ? encodeInput(2049) : decodeInput(4097);
            long[] before = StringCodingAccess.counters0();
            for (int i = 0; i < 100; ++i) {
                convert(encode, tiny);
                convert(encode, below);
                convert(encode, small);
                convert(encode, maximum);
                convert(encode, oversized);
                convert(encode, tiny);
            }
            delta(before, 200);
            unchanged(compiled, origin, code, traps, decompiles);
        } else {
            // counters0() deliberately initializes its native test bridge via
            // ready(). Do not let the observer initialize the converter during
            // this cold transition. Readiness itself proves that the unbound
            // converter was not called; sample exact counters after explicit
            // setup below, when observing them cannot change the state.
            for (int i = 0; i < 100; ++i) {
                convert(encode, large);
                convert(encode, small);
            }
            check(!readiness.getBoolean(null), "compiled origin performed late setup");
            unchanged(compiled, origin, code, traps, decompiles);
            if (rebind) {
                check(rebindBridge(holder) == 0, "bridge rebind failed");
                check(NMethod.get(compiled, false) == null, "bridge rebind retained admission nmethod");
                long calls = bridgeCalls();
                convert(encode, large);
                check(bridgeCalls() == calls + 1, "replacement bridge not observed");
                check(!readiness.getBoolean(null), "false bridge published readiness");
            } else {
                check(StringCodingAccess.ready(), "explicit late setup failed");
                long[] before = StringCodingAccess.counters0();
                for (int i = 0; i < 100; ++i) {
                    convert(encode, large);
                    convert(encode, small);
                }
                delta(before, 0);
                unchanged(compiled, origin, code, traps, decompiles);
            }
        }
        System.out.println("STRING_CODING_C1_ADMISSION_OK " + String.join(" ", args));
    }

    private static void delta(long[] before, long leaves) {
        long[] after = StringCodingAccess.counters0();
        check(after[0] - before[0] == leaves && after[1] == before[1] && after[2] == before[2],
                "route delta " + Arrays.toString(new long[] {
                        after[0] - before[0], after[1] - before[1], after[2] - before[2]}));
    }

    private static void unchanged(Method compiled, Method origin, NMethod code, int traps, int decompiles) {
        NMethod after = NMethod.get(compiled, false);
        check(after != null && after.compile_id == code.compile_id, "admission nmethod changed");
        check(WB.getMethodTrapCount(origin) == traps, "origin trapped on size transition");
        check(WB.getMethodDecompileCount(compiled) == decompiles, "origin decompiled on size transition");
    }

    private static void check(boolean ok, String message) {
        if (!ok) throw new AssertionError(message);
    }
}
