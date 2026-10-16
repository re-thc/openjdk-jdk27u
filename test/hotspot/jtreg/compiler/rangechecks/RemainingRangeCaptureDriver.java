/*
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 */
package compiler.rangechecks;

import java.lang.reflect.Method;
import jdk.test.whitebox.WhiteBox;

// Later finite diagnostic stage only, after review of the lookup64 pair.
// Calls the original fixed functional sweep but explicitly compiles ONLY the
// selected target. Never invokes TestFramework or its multi-test compiler.
public final class RemainingRangeCaptureDriver {
    private static Method target(String selected) throws Exception {
        Class<?> holder;
        Class<?>[] parameters;
        if (selected.equals("testLookup131")) {
            holder = Class.forName("compiler.rangechecks.TestDominatingSignedRangeChecks");
            parameters = new Class<?>[] {int.class};
        } else {
            holder = Class.forName("compiler.rangechecks.TestDominatingSignedRangeDependencies");
            parameters = switch (selected) {
                case "testAliasedReadBeforeWrite" -> new Class<?>[] {int.class, int.class, boolean.class};
                case "testDuplicateUpperGuard", "testDuplicateLowerGuard" -> new Class<?>[] {int.class};
                case "testDiamondIndex" -> new Class<?>[] {int.class, boolean.class, boolean.class};
                case "testInvariantLoop" -> new Class<?>[] {int.class, int.class, boolean.class, boolean.class};
                case "testGuardBeforeLoop" -> new Class<?>[] {int.class, int.class, int.class};
                default -> throw new IllegalArgumentException("not a fixed capture target: " + selected);
            };
        }
        return holder.getDeclaredMethod(selected, parameters);
    }

    private static void sweep(boolean core) {
        if (core) {
            TestDominatingSignedRangeChecks.check();
        } else {
            TestDominatingSignedRangeDependencies.check();
        }
    }

    private static void require(boolean condition, String message) {
        if (!condition) {
            throw new AssertionError(message);
        }
    }

    private static void interpreted(WhiteBox wb, Method target) {
        require(!wb.isMethodCompiled(target, false) && !wb.isMethodCompiled(target, true)
                && !wb.isMethodQueuedForCompilation(target), "early/queued target compilation");
    }

    private static void normalC2(WhiteBox wb, Method target) {
        require(wb.isMethodCompiled(target, false)
                && wb.getMethodCompilationLevel(target, false) == 4
                && !wb.isMethodCompiled(target, true)
                && !wb.isMethodQueuedForCompilation(target), "target not stable normal C2");
    }

    public static void main(String[] args) throws Exception {
        require(args.length == 1, "one fixed target required");
        Method method = target(args[0]);
        boolean core = args[0].equals("testLookup131");
        WhiteBox wb = WhiteBox.getWhiteBox();
        interpreted(wb, method);
        wb.markMethodProfiled(method);
        wb.clearMethodState(method);
        require(wb.getMethodData(method) != 0, "interpreter MDO missing");
        interpreted(wb, method);
        for (int i = 0; i < 2000; i++) {
            sweep(core);
        }
        interpreted(wb, method);
        require(wb.enqueueMethodForCompilation(method, 4, -1), "single normal C2 enqueue failed");
        normalC2(wb, method);
        sweep(core);
        normalC2(wb, method);
        System.out.println("target=" + args[0] + " training-full-sweeps=2000 compiled-full-sweeps=1"
                + " enqueue-count=1 normal-level=4 osr=false");
    }
}
