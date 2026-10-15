/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only.
 * This code is distributed without any warranty; see the LICENSE file.
 */
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HexFormat;
import java.util.List;
import jdk.test.whitebox.WhiteBox;

/** Observed causal diagnostic, never a replacement for clean timing qualification. */
public class MethodOnlyUnrollDiagnostic {
    static final WhiteBox WB = WhiteBox.getWhiteBox();
    record Code(String label, int level, int id, long start, long entry, byte[] bytes) { }
    static final List<Code> codes = new ArrayList<>();
    static Code capture(String label, Method method) {
        Object[] n = WB.getNMethod(method, false);
        if (n == null || ((Integer)n[1]) != 4) throw new AssertionError("ordinary C2 missing: " + label);
        Object[] blob = (Object[])n[0];
        Code c = new Code(label, (Integer)n[1], (Integer)n[3], (Long)blob[4], (Long)n[4], (byte[])n[2]);
        codes.add(c);
        return c;
    }
    static void ensureC2(Method m) {
        if (!WB.enqueueMethodForCompilation(m, 4) || WB.getMethodCompilationLevel(m, false) != 4)
            throw new AssertionError("C2 enqueue failed: " + m);
    }
    public static void main(String[] args) throws Exception {
        int requested = Integer.parseInt(args[0]);
        if (requested != 2 && requested != 16) throw new IllegalArgumentException("diagnostic cap2 or16 only");
        Path out = Path.of(args[1]); Files.createDirectories(out);
        long original = WB.getIntxVMFlag("LoopMaxUnroll");
        if (original != 16) throw new AssertionError("pair-common default16 required");
        int calls = Integer.getInteger("measureCalls", 100000);
        System.out.println("DIAGNOSTIC_SCOPE=observed method-only intervention; not clean timing qualification");
        System.setProperty("measureCalls", "10000");
        FixedVectorProbe.main(new String[]{"conversion", "c2"});
        for (int i = 0; i < 1000; i++) FixedVectorProbe.window("controller_prime", 0, 0);
        Method kernel = PhaseVectorKernels.class.getDeclaredMethod("conversion", int.class);
        Method invoke = FixedVectorProbe.class.getDeclaredMethod("invoke", int.class);
        Method window = FixedVectorProbe.class.getDeclaredMethod("window", String.class, int.class, int.class);
        // Both controllers compile under the original global default in both arms.
        ensureC2(invoke); ensureC2(window);
        Code invokeBefore = capture("invoke-before", invoke);
        Code windowBefore = capture("window-before", window);
        Code primed = capture("kernel-primed", kernel);
        try {
            WB.deoptimizeMethod(kernel, false);
            WB.setIntxVMFlag("LoopMaxUnroll", requested);
            if (WB.getIntxVMFlag("LoopMaxUnroll") != requested) throw new AssertionError("flag set failed");
            ensureC2(kernel);
        } finally {
            WB.setIntxVMFlag("LoopMaxUnroll", original);
        }
        if (WB.getIntxVMFlag("LoopMaxUnroll") != original) throw new AssertionError("flag restore failed");
        Code before = capture("kernel-before-measured-pass", kernel);
        if (before.id == primed.id) throw new AssertionError("kernel was not recompiled");
        if (capture("invoke-after-recompile", invoke).id != invokeBefore.id
                || capture("window-after-recompile", window).id != windowBefore.id)
            throw new AssertionError("controller recompiled during kernel intervention");
        System.setProperty("measureCalls", Integer.toString(calls));
        System.out.println("METHOD_ONLY_MEASURED_PASS_BEGIN");
        FixedVectorProbe.main(new String[]{"conversion", "c2"});
        Code after = capture("kernel-after-measured-pass", kernel);
        if (after.id != before.id || !java.util.Arrays.equals(before.bytes, after.bytes))
            throw new AssertionError("kernel code changed during measured pass");
        if (capture("invoke-after", invoke).id != invokeBefore.id
                || capture("window-after", window).id != windowBefore.id)
            throw new AssertionError("controller recompiled during measured pass");
        // Serialize only after every measured window has completed.
        for (Code c : codes) {
            Files.write(out.resolve(c.label + ".bin"), c.bytes);
            String hex = HexFormat.of().formatHex(c.bytes);
            String sha = HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(c.bytes));
            System.out.println("METHOD_ONLY_CODE_JSON={\"label\":\"" + c.label + "\",\"level\":" + c.level
                + ",\"compile_id\":" + c.id + ",\"code_start\":" + c.start + ",\"entry\":" + c.entry
                + ",\"bytes\":" + c.bytes.length + ",\"sha256\":\"" + sha + "\",\"hex\":\"" + hex + "\"}");
        }
        System.out.println("METHOD_ONLY_PASS requested_kernel_cap=" + requested + " global_restored=" + original
            + " invoke_id=" + invokeBefore.id + " window_id=" + windowBefore.id + " kernel_id=" + after.id);
    }
}
