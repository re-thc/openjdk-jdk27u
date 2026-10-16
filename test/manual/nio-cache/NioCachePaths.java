/* Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only */
package org.openjdk.bench.nioqual;

import java.lang.management.CompilationMXBean;
import java.lang.management.GarbageCollectorMXBean;
import java.lang.management.ManagementFactory;
import java.lang.management.RuntimeMXBean;
import java.nio.ByteBuffer;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.BenchmarkParams;
import sun.nio.ch.DirectBuffer;
import sun.nio.ch.Util;

// Revised protocol nio-jmh-cache-paths-v1; source only, no measurements.
@State(Scope.Thread)
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 5, time = 1, timeUnit = TimeUnit.SECONDS)
@Measurement(iterations = 7, time = 1, timeUnit = TimeUnit.SECONDS)
@Fork(1)
@Threads(1)
public class NioCachePaths {
    static final int SIZE = 65536;
    static volatile long exitSink;
    final AtomicReference<Throwable> failure = new AtomicReference<>();
    final long[][] windows = new long[12][8];
    RuntimeMXBean runtime;
    CompilationMXBean compiler;
    List<GarbageCollectorMXBean> collectors;
    String benchmark;
    int iteration;
    int value;

    @Setup(Level.Trial)
    public void initialize(BenchmarkParams params) {
        benchmark = params.getBenchmark();
        boolean miss = benchmark.endsWith(".noCacheMiss");
        String cacheLimit = System.getProperty("jdk.nio.maxCachedBufferSize");
        if (miss ? !"0".equals(cacheLimit) : cacheLimit != null)
            throw new AssertionError("wrong cache setting");
        runtime = ManagementFactory.getRuntimeMXBean();
        compiler = ManagementFactory.getCompilationMXBean();
        collectors = ManagementFactory.getGarbageCollectorMXBeans();
        if (compiler == null || !compiler.isCompilationTimeMonitoringSupported())
            throw new AssertionError("compilation readiness unavailable");
        // Prime observer calls before JMH warmup. They never occur per operation.
        runtime.getUptime(); compiler.getTotalCompilationTime(); collections();
        if (benchmark.endsWith(".alignedHit")) {
            ByteBuffer seed = Util.getTemporaryDirectBuffer(SIZE + 7);
            boolean aligned = (((DirectBuffer) seed).address() & 7) == 0;
            Util.releaseTemporaryDirectBuffer(seed);
            if (!aligned) throw new AssertionError("natural alignment unavailable");
        }
    }

    long collections() {
        long sum = 0;
        for (GarbageCollectorMXBean gc : collectors) {
            long count = gc.getCollectionCount();
            if (count < 0) throw new AssertionError("GC counter unavailable");
            sum += count;
        }
        return sum;
    }

    @Setup(Level.Iteration)
    public void beginIteration() {
        if (iteration >= windows.length) throw new AssertionError("iteration limit");
        long[] row = windows[iteration];
        row[0] = runtime.getUptime();
        row[1] = System.nanoTime();
        row[2] = compiler.getTotalCompilationTime();
        row[3] = collections();
    }

    @TearDown(Level.Iteration)
    public void endIteration() {
        long[] row = windows[iteration++];
        row[4] = System.nanoTime();
        row[5] = runtime.getUptime();
        row[6] = compiler.getTotalCompilationTime();
        row[7] = collections();
    }

    @TearDown(Level.Trial)
    public void reportWindows() {
        if (iteration != 12) throw new AssertionError("wrong iteration count");
        // Printing, formatting and observer initialization are outside all
        // benchmark windows; JMH handles its own iteration reporting.
        // Terminate any partial JMH iteration prefix before our strict frame.
        System.out.println("\nNIO_WINDOWS_BEGIN benchmark=" + benchmark + " count=12");
        for (int i = 0; i < iteration; i++) {
            long[] r = windows[i];
            System.out.println("NIO_WINDOW benchmark=" + benchmark + " iteration=" + i
                    + " uptime_before_ms=" + r[0] + " nano_before=" + r[1]
                    + " compiler_before_ms=" + r[2] + " gc_before=" + r[3]
                    + " nano_after=" + r[4] + " uptime_after_ms=" + r[5]
                    + " compiler_after_ms=" + r[6] + " gc_after=" + r[7]);
        }
        System.out.println("NIO_WINDOWS_END benchmark=" + benchmark + " count=12");
    }

    int touchAndRelease(ByteBuffer b) {
        try {
            byte expected = (byte) value++;
            b.put(0, expected);
            int actual = b.get(0) & 255;
            if (actual != (expected & 255)) throw new AssertionError("contents");
            return actual; // JMH consumes the return value.
        } finally { Util.releaseTemporaryDirectBuffer(b); }
    }

    @Benchmark @OperationsPerInvocation(1024)
    @CompilerControl(CompilerControl.Mode.DONT_INLINE)
    public long ordinaryHit() {
        long sum = 0;
        for (int i = 0; i < 1024; i++)
            sum += touchAndRelease(Util.getTemporaryDirectBuffer(SIZE));
        return sum;
    }

    int alignedOperation(int alignment) {
        ByteBuffer b = Util.getTemporaryAlignedDirectBuffer(SIZE, alignment);
        if (b.alignmentOffset(0, alignment) != 0) throw new AssertionError("alignment");
        return touchAndRelease(b);
    }

    @Benchmark @OperationsPerInvocation(1024)
    @CompilerControl(CompilerControl.Mode.DONT_INLINE)
    public long alignedHit() {
        long sum = 0;
        for (int i = 0; i < 1024; i++) sum += alignedOperation(8);
        return sum;
    }

    @Benchmark @OperationsPerInvocation(16)
    @CompilerControl(CompilerControl.Mode.DONT_INLINE)
    public long noCacheMiss() {
        long sum = 0;
        for (int i = 0; i < 16; i++) sum += alignedOperation(4096);
        return sum;
    }

    void worker(int mode) throws Exception {
        Thread thread = new Thread(() -> {
            try {
                if (mode == 0) return;
                if (mode == 1) {
                    exitSink = touchAndRelease(Util.getTemporaryDirectBuffer(SIZE));
                    return;
                }
                long sum = 0;
                for (int i = 0; i < 32; i++) {
                    ByteBuffer ordinary = Util.getTemporaryDirectBuffer(SIZE);
                    boolean misaligned = (((DirectBuffer) ordinary).address() & 4095) != 0;
                    Util.releaseTemporaryDirectBuffer(ordinary);
                    if (!misaligned) throw new AssertionError("replacement path unavailable");
                    sum += alignedOperation(4096);
                }
                exitSink = sum;
            } catch (Throwable t) { failure.compareAndSet(null, t); }
        }, "nio-jmh-exit");
        thread.start(); thread.join();
        if (failure.get() != null) throw new AssertionError(failure.get());
    }

    // Exactly one lifecycle per iteration. Time-based exit loops would make
    // the baseline leak unbounded; single-shot counts include all warmup work.
    @Benchmark @BenchmarkMode(Mode.SingleShotTime)
    @Warmup(iterations = 4, batchSize = 1)
    @Measurement(iterations = 8, batchSize = 1)
    public void exitEmpty() throws Exception { worker(0); }

    @Benchmark @BenchmarkMode(Mode.SingleShotTime)
    @Warmup(iterations = 4, batchSize = 1)
    @Measurement(iterations = 8, batchSize = 1)
    public void exitCached() throws Exception { worker(1); }

    @Benchmark @BenchmarkMode(Mode.SingleShotTime)
    @Warmup(iterations = 4, batchSize = 1)
    @Measurement(iterations = 8, batchSize = 1)
    public void exitReplacement() throws Exception { worker(2); }
}
