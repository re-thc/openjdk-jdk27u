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
 * @summary Charset registration reentry, binding changes, late tooling, and observable predicate events
 * @requires os.family == "linux" & os.arch == "amd64" & vm.gc.G1 & vm.jvmti & vm.compiler1.enabled & vm.compiler2.enabled
 * @library /test/lib
 * @modules java.base/sun.nio.cs:+open java.base/java.lang:+open
 * @build compiler.intrinsics.tmfy.CharsetEncoderTestSupport jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm/native -Xbootclasspath/a:. -Xint -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED -agentlib:CharsetEncoderBindings=reentry compiler.intrinsics.tmfy.TestCharsetEncoderBindings reentry 0
 * @run main/othervm/native -Xbootclasspath/a:. -Xint -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED -agentlib:CharsetEncoderBindings=events compiler.intrinsics.tmfy.TestCharsetEncoderBindings events 0
 * @run main/othervm/native -Xbootclasspath/a:. -Xint -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED -agentlib:CharsetEncoderBindings compiler.intrinsics.tmfy.TestCharsetEncoderBindings charset-first 0
 * @run main/othervm/native -Xbootclasspath/a:. -Xint -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED -agentlib:CharsetEncoderBindings compiler.intrinsics.tmfy.TestCharsetEncoderBindings string-first 0
 * @run main/othervm/native -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED -agentlib:CharsetEncoderBindings compiler.intrinsics.tmfy.TestCharsetEncoderBindings rebind 1
 * @run main/othervm/native -Xbootclasspath/a:. -Xbatch -XX:-TieredCompilation -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED -agentlib:CharsetEncoderBindings compiler.intrinsics.tmfy.TestCharsetEncoderBindings unregister 4
 * @run main/othervm/native -Xbootclasspath/a:. -Xbatch -XX:TieredStopAtLevel=1 -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED -agentlib:CharsetEncoderBindings compiler.intrinsics.tmfy.TestCharsetEncoderBindings late 1
 * @run main/othervm/native -Xbootclasspath/a:. -Xbatch -XX:-TieredCompilation -XX:+UseG1GC -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -XX:+TmfyStringCodingCounters --enable-native-access=ALL-UNNAMED -agentlib:CharsetEncoderBindings compiler.intrinsics.tmfy.TestCharsetEncoderBindings late 4
 */
package compiler.intrinsics.tmfy;

import java.util.Arrays;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import jdk.test.whitebox.WhiteBox;
import jdk.test.whitebox.code.NMethod;

import static compiler.intrinsics.tmfy.CharsetEncoderTestSupport.*;

public class TestCharsetEncoderBindings {
    static { System.loadLibrary("CharsetEncoderBindings"); }
    private static final WhiteBox WB = WhiteBox.getWhiteBox();
    private static final AtomicInteger READINESS_REJECTIONS = new AtomicInteger();
    private static native void arm(Class<?> fixture);
    private static native int[] status();
    private static native int acquire();
    private static native int rebind(Class<?> holder);
    private static native int unregister(Class<?> holder);
    private static native long replacementCalls();
    private static native int events(Class<?> holder, boolean enable);

    // Called for both the bridge's initial native resolution and the typed
    // method's RegisterNatives event. Direct readiness calls are essential:
    // NativeMethodBind capability already suppresses public native dispatch.
    public static void reenter() throws Throwable {
        check(!ready(), "same-thread readiness recursively registered");
        READINESS_REJECTIONS.incrementAndGet();
        new PublicCall().run();
        AtomicReference<Throwable> failure = new AtomicReference<>();
        Thread worker = new Thread(() -> {
            try {
                check(!ready(), "cross-thread readiness waited/reentered registration");
                READINESS_REJECTIONS.incrementAndGet();
                new PublicCall().run();
            } catch (Throwable t) {
                failure.set(t);
            }
        });
        worker.setDaemon(true);
        worker.start();
        worker.join(10_000);
        check(!worker.isAlive(), "registration held the holder monitor across NativeMethodBind");
        if (failure.get() != null) throw new AssertionError("cross-thread registration callback", failure.get());
    }

    private static void reentry() throws Throwable {
        arm(TestCharsetEncoderBindings.class);
        check(ready(), "initial Charset readiness failed");
        int[] counts = status();
        check(counts[0] == 1 && counts[1] == 1 && counts[2] == 0,
                "bridge/typed bind callback counts: " + Arrays.toString(counts));
        check(READINESS_REJECTIONS.get() == 4, "both callback threads must directly reject readiness");
        long[] before = counters();
        new PublicCall().run();
        semantics();
        route(before, 0, 0, "public fallback under NativeMethodBind capability");
        check(ready(), "readiness was not published after callbacks");
    }

    private static NMethod compileOrigin(int level) {
        if (level == 0) return null;
        WB.deoptimizeMethod(ORIGIN);
        check(WB.enqueueMethodForCompilation(ORIGIN, level), "origin compilation rejected");
        NMethod result = NMethod.get(ORIGIN, false);
        check(result != null && result.comp_level == level &&
                WB.getMethodCompilationLevel(ORIGIN) == level, "exact Charset origin nmethod missing");
        return result;
    }

    private static void unchanged(NMethod expected, int level) {
        if (level == 0) return;
        NMethod actual = NMethod.get(ORIGIN, false);
        check(actual != null && actual.compile_id == expected.compile_id && actual.comp_level == level,
                "public route did not execute with the recorded origin nmethod");
    }

    private static void positiveThenChange(String mode, int level) throws Throwable {
        WB.testSetDontInlineMethod(ORIGIN, true);
        // The two first-registration orders exercise independent per-holder
        // bootstrap exemptions. In charset-first, diagnostics register String
        // only after actual public Charset initialization and warmup.
        if (mode.endsWith("-first")) {
            check(!initialized(TYPE), "Charset registered before order fixture");
            check(!initialized(Class.forName("java.lang.StringCoding")), "String registered before order fixture");
        }
        if (mode.equals("string-first")) counters();
        PublicCall call = new PublicCall();
        for (int i = 0; i < (level == 0 ? 1 : 300); i++) call.run();
        check(initialized(TYPE), "public Charset route did not initialize its own holder");
        NMethod compiled = compileOrigin(level);
        long[] before = counters();
        for (int i = 0; i < 100; i++) call.run();
        route(before, 100, 0, "proven public Charset leaf before " + mode);
        unchanged(compiled, level);
        if (mode.endsWith("-first")) return;

        if (mode.equals("late")) {
            check(acquire() == 0, "late NativeMethodBind capability acquisition failed");
        } else if (mode.equals("rebind")) {
            check(rebind(TYPE) == 0, "RegisterNatives replacement failed");
        } else if (mode.equals("unregister")) {
            check(unregister(TYPE) == 0, "UnregisterNatives failed");
        } else {
            throw new AssertionError(mode);
        }
        // No public conversion has run since the mutation. This identifies the
        // exact method invalidated; warmup or a counter from String is no proof.
        check(NMethod.get(ORIGIN, false) == null,
                "mutation retained Charset origin compile_id=" + compiled.compile_id);
        long[] afterMutation = counters();
        long replacements = replacementCalls();
        for (int i = 0; i < 100; i++) call.run();
        semantics();
        route(afterMutation, 0, 0, "public route after " + mode);
        check(replacementCalls() == replacements, "public route dispatched to replacement JNI");

        char[] input = input();
        byte[] output = new byte[3 * input.length];
        if (mode.equals("unregister")) {
            try {
                raw(input, output);
                throw new AssertionError("unregistered typed native silently bypassed JNI resolution");
            } catch (UnsatisfiedLinkError expected) { }
            // Ordinary JNI can be restored explicitly; the monotonic public
            // readiness flag must not quietly restore a missing native binding.
            register();
        }
        if (mode.equals("rebind")) {
            int progress = raw(input, output);
            check(progress == ((input.length << 13) | input.length), "replacement packed progress");
            for (int i = 0; i < input.length; i++) check(output[i] == '#', "replacement byte");
            check(replacementCalls() == replacements + 1, "private call ignored replacement binding");
        } else {
            // Explicit bridge invocation is deliberately a repeat registration
            // here, after revocation. It must preserve the ordinary JNI path.
            if (mode.equals("late")) register();
            before = counters();
            check(raw(input, output) == ((input.length << 13) | (input.length * 3)), "raw JNI progress");
            route(before, 0, 1, "ordinary typed JNI after " + mode);
        }
    }

    private static void observableEvents() throws Throwable {
        // Entry/exit capabilities are OnLoad-only in this VM. This checks
        // startup-capability observability, not a late specialized-entry
        // transition. The separate late mode tests a live binding capability.
        check(events(TYPE, true) == 0, "enable predicate method events");
        long[] before = counters();
        new PublicCall().run();
        check(!(boolean) invoke(POLICY), "ordinary predicate body was not false");
        check(events(TYPE, false) == 0, "disable predicate method events");
        int[] counts = status();
        check(counts[3] >= 2 && counts[4] == counts[3],
                "predicate Java method entry/exit missing: " + Arrays.toString(counts));
        route(before, 0, 0, "event-observable predicate");
        semantics();
    }

    public static void main(String[] args) throws Throwable {
        String mode = args[0];
        int level = Integer.parseInt(args[1]);
        switch (mode) {
            case "reentry" -> reentry();
            case "events" -> observableEvents();
            default -> positiveThenChange(mode, level);
        }
        System.out.println("CHARSET_ENCODER_BINDINGS_OK " + mode + " level=" + level);
    }
}
