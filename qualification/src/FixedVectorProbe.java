/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */
import java.lang.management.ManagementFactory;
import java.lang.reflect.Method;
import com.sun.management.ThreadMXBean;
import jdk.test.whitebox.WhiteBox;

/** Scalar-only controller: no Vector API use before the measured holder setup. */
public final class FixedVectorProbe {
    static final ThreadMXBean bean = (ThreadMXBean) ManagementFactory.getThreadMXBean();
    static final java.lang.management.CompilationMXBean compilationBean = ManagementFactory.getCompilationMXBean();
    static final java.lang.management.RuntimeMXBean runtimeBean = ManagementFactory.getRuntimeMXBean();
    static final long tid = Thread.currentThread().threadId();
    static final boolean observed = Boolean.getBoolean("observeCompilation");
    static final WhiteBox wb = observed ? WhiteBox.getWhiteBox() : null;
    static volatile Object calibration;
    static volatile long sink;
    static Method method;
    static String kernel;
    static long expected;
    static boolean checking;
    static String mode;
    static long lastElapsed;

    static long invoke(int count) {
        return switch (kernel) {
            case "conversion" -> PhaseVectorKernels.conversion(count);
            case "rawBits" -> PhaseVectorKernels.rawBits(count);
            case "directBits" -> PhaseVectorKernels.directBits(count);
            case "arithmetic" -> PhaseVectorKernels.arithmetic(count);
            case "osrAccumulator" -> PhaseVectorKernels.osrAccumulator(count);
            case "osrTransient" -> PhaseVectorKernels.osrTransient(count);
            case "osrArray" -> PhaseVectorKernels.osrArray(count);
            case "osrScalar" -> PhaseVectorKernels.osrScalar(count);
            case "signatureArgs" -> PhaseVectorKernels.signatureArgs(count);
            case "signatureReturn" -> PhaseVectorKernels.signatureReturn(count);
            case "signatureArray" -> PhaseVectorKernels.signatureArray(count);
            case "signatureArrayReturn" -> PhaseVectorKernels.signatureArrayReturn(count);
            default -> throw new IllegalArgumentException(kernel);
        };
    }
    static int level(boolean osr) {
        return observed && method != null ? wb.getMethodCompilationLevel(method, osr) : -1;
    }
    static long compilation() {
        var compiler = compilationBean;
        return compiler == null ? -1 : compiler.getTotalCompilationTime();
    }
    static void emit(String phase, int calls, int count, long start, long elapsed,
                     long bytes, long compileMs, long result, int before, int beforeOsr) {
        System.out.printf("%s,%s,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d%n", kernel, phase,
            calls, count, start, elapsed, bytes, compileMs, result, before, beforeOsr,
            level(false), level(true));
    }
    static void window(String phase, int calls, int count) {
        int before = level(false), beforeOsr = level(true);
        if (observed && phase.startsWith("measure")) {
            int required = mode.equals("c1") ? 1 : mode.equals("int") ? 0 : 4;
            if (before != required) throw new AssertionError("Steady window starts at level " + before + ", expected " + required);
        }
        long c = compilation(), startUptime = runtimeBean.getUptime();
        long a = bean.getThreadAllocatedBytes(tid), start = System.nanoTime();
        long result = 0;
        for (int i = 0; i < calls; i++) result += invoke(count);
        long elapsed = System.nanoTime() - start, bytes = bean.getThreadAllocatedBytes(tid) - a;
        lastElapsed = elapsed;
        long compileMs = c < 0 ? -1 : compilation() - c;
        sink = result;
        if (checking && result != expected * calls) {
            throw new AssertionError(kernel + "/" + phase + ": " + result + " != " + expected * calls);
        }
        emit(phase, calls, count, startUptime, elapsed, bytes, compileMs, result, before, beforeOsr);
        if (observed && phase.startsWith("measure") && level(false) != before) {
            throw new AssertionError("Compilation state changed during steady window");
        }
    }
    static void setup(boolean initialize) throws Exception {
        long c = compilation(), startUptime = runtimeBean.getUptime();
        long a = bean.getThreadAllocatedBytes(tid), start = System.nanoTime();
        Class.forName("PhaseVectorKernels", initialize, FixedVectorProbe.class.getClassLoader());
        long elapsed = System.nanoTime() - start, bytes = bean.getThreadAllocatedBytes(tid) - a;
        emit(initialize ? "class_init" : "class_load", 1, 0, startUptime, elapsed,
             bytes, c < 0 ? -1 : compilation() - c, 0, -1, -1);
    }
    public static void main(String[] args) throws Exception {
        kernel = args[0];
        mode = args[1];
        bean.setThreadAllocatedMemoryEnabled(true);
        // Prime management/clock/output machinery without referencing Kernels.
        compilation(); runtimeBean.getUptime();
        System.out.println("kernel,phase,calls,count,start_uptime_ms,nanoseconds,allocated_bytes,compilation_ms,checksum,normal_before,osr_installed_before,normal_after,osr_installed_after");
        System.out.printf("# pid=%d,vm=%s,mode=%s,observer=%s%n", ProcessHandle.current().pid(),
                          System.getProperty("java.vm.info"), mode, observed);
        long a = bean.getThreadAllocatedBytes(tid);
        calibration = new byte[4096];
        if (bean.getThreadAllocatedBytes(tid) - a < 4096) throw new AssertionError("Allocation counter calibration");
        setup(false); setup(true);
        if (observed) method = Class.forName("PhaseVectorKernels").getDeclaredMethod(kernel, int.class);
        int count = kernel.startsWith("osr") ? Integer.getInteger("osrIterations", 2_000_000) : 0;
        window("first", 1, count);
        // Scalar oracle runs after first use, outside timing/allocation windows.
        expected = PhaseVectorKernels.expected(kernel, count);
        if (sink != expected) throw new AssertionError("First result mismatch");
        checking = true;
        if (mode.equals("osr")) {
            for (int i = 1; i < 8; i++) window("call" + i, 1, count);
            return;
        }
        if (mode.equals("cold")) {
            window("primed", 1, count);
            for (int i = 0; i < 5; i++) window("early" + i, 20, count);
            return;
        }
        if (mode.equals("int")) {
            window("warmup", 4, count);
            for (int i = 0; i < 5; i++) window("measure" + i, 10, count);
            return;
        }
        // Identical fixed histories across image pairs; no WhiteBox enqueue.
        window("warmup", 10000, count);
        if (observed && level(false) != (mode.equals("c1") ? 1 : 4)) {
            throw new AssertionError("Fixed warmup did not reach required ordinary entry before measurement");
        }
        window("calibration", 1000, count);
        int calls = Integer.getInteger("measureCalls", (int) Math.max(1,
            Math.min(2_000_000, 50_000_000.0 * 1000 / lastElapsed)));
        for (int i = 0; i < 5; i++) window("measure" + i, calls, count);
        if (observed && mode.equals("c1") && level(false) != 1) {
            throw new AssertionError("Expected actual C1 level 1, got " + level(false));
        }
        if (observed && mode.equals("c2") && level(false) != 4) {
            throw new AssertionError("Expected ordinary C2 level 4, got " + level(false));
        }
    }
}
