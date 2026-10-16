/*
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 */

package compiler.rangechecks;

import java.lang.reflect.Method;
import jdk.test.whitebox.WhiteBox;

// Isolated diagnostic driver. The original test class and method are unchanged.
// This driver does not invoke its IR-framework main or shared @Run method.
public final class Lookup64CaptureDriver {
    private static final int[] INPUTS = {
        Integer.MIN_VALUE, Integer.MIN_VALUE + 1, -132, -131, -65, -64, -1,
        0, 1, 2, 62, 63, 64, 65, 129, 130, 131, 132,
        Integer.MAX_VALUE - 1, Integer.MAX_VALUE
    };
    private static volatile long sink;

    private static void require(boolean condition, String message) {
        if (!condition) {
            throw new AssertionError(message);
        }
    }

    private static int check(int index) {
        int expected = index > 0 && index < 64
                ? (37 * index + 11) & 0xff : Math.max(0, index);
        int actual = TestDominatingSignedRangeChecks.testLookup64(index);
        require(actual == expected, "lookup64 index=" + index
                + " expected=" + expected + " actual=" + actual);
        return actual;
    }

    private static void requireInterpreted(WhiteBox wb, Method target, String phase) {
        require(!wb.isMethodCompiled(target, false), phase + ": early normal compilation");
        require(!wb.isMethodCompiled(target, true), phase + ": early OSR compilation");
        require(!wb.isMethodQueuedForCompilation(target), phase + ": queued compilation");
    }

    private static void requireNormalC2(WhiteBox wb, Method target, String phase) {
        require(wb.isMethodCompiled(target, false), phase + ": no normal compilation");
        require(wb.getMethodCompilationLevel(target, false) == 4, phase + ": not C2");
        require(!wb.isMethodCompiled(target, true), phase + ": unexpected OSR compilation");
        require(!wb.isMethodQueuedForCompilation(target), phase + ": queued compilation");
    }

    public static void main(String[] args) throws Exception {
        require(args.length == 0, "no configurable inputs or training count");
        Class<?> holder = Class.forName("compiler.rangechecks.TestDominatingSignedRangeChecks");
        Method target = holder.getDeclaredMethod("testLookup64", int.class);
        WhiteBox wb = WhiteBox.getWhiteBox();
        requireInterpreted(wb, target, "initial");

        // Allocate an interpreter MDO before training. Clear the synthetic hot
        // counters from markMethodProfiled; never reset real profiles afterward.
        wb.markMethodProfiled(target);
        wb.clearMethodState(target);
        require(wb.getMethodData(target) != 0, "interpreter MDO missing");
        requireInterpreted(wb, target, "profile allocated");

        long checksum = 0;
        for (int sweep = 0; sweep < 2000; sweep++) {
            for (int index : INPUTS) {
                checksum += check(index);
            }
        }
        sink = checksum;
        requireInterpreted(wb, target, "after 40000 training calls");
        System.out.println("lookup64 training-calls=40000 inputs-per-sweep=20 checksum=" + sink);

        // BackgroundCompilation is false in both invocations: one blocking
        // request, normal entry BCI -1, no polling, retry or deoptimization.
        require(wb.enqueueMethodForCompilation(target, 4, -1), "C2 enqueue failed");
        requireNormalC2(wb, target, "after single enqueue");
        checksum = 0;
        for (int index : INPUTS) {
            checksum += check(index);
        }
        sink = checksum;
        requireNormalC2(wb, target, "after 20 compiled checks");
        System.out.println("lookup64 normal-level=4 osr=false enqueue-count=1 compiled-calls=20 checksum=" + sink);
        System.out.println("java.vm.name=" + System.getProperty("java.vm.name"));
        System.out.println("java.vm.version=" + System.getProperty("java.vm.version"));
        System.out.println("java.vm.info=" + System.getProperty("java.vm.info"));
        System.out.println("java.home=" + System.getProperty("java.home"));
    }
}
