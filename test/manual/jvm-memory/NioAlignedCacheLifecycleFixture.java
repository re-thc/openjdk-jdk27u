/* Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved. SPDX-License-Identifier: GPL-2.0-only */
import java.io.InputStream;
import java.io.PrintStream;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.atomic.AtomicReference;
import sun.nio.ch.DirectBuffer;
import sun.nio.ch.Util;

// Experiment nio-aligned-cache-initial-exit-v1; source-only, not yet qualified.
public final class NioAlignedCacheLifecycleFixture {
    private static final int SIZE = 65536;
    private static final int ALIGNMENT = 4096;
    private static final int ITERATIONS = 32;
    private static final AtomicReference<Throwable> FAILURE = new AtomicReference<>();

    private static void waitForCoordinator(InputStream input) throws Exception {
        int value;
        do {
            value = input.read();
            if (value < 0) throw new AssertionError("Coordinator closed stdin");
        } while (value != '\n');
    }

    private static final class Warmup implements Runnable {
        @Override
        public void run() {
            try {
                ByteBuffer buffer = Util.getTemporaryAlignedDirectBuffer(SIZE, ALIGNMENT);
                Util.releaseTemporaryDirectBuffer(buffer);
            } catch (Throwable failure) {
                FAILURE.set(failure);
            }
        }
    }

    private static final class Measurement implements Runnable {
        private final String mode;
        private final int[] misaligned;

        Measurement(String mode, int[] misaligned) {
            this.mode = mode;
            this.misaligned = misaligned;
        }

        @Override
        public void run() {
            try {
                for (int round = 0; round < ITERATIONS; round++) {
                    ByteBuffer ordinary = Util.getTemporaryDirectBuffer(SIZE);
                    boolean unaligned = (((DirectBuffer) ordinary).address() & (ALIGNMENT - 1)) != 0;
                    Util.releaseTemporaryDirectBuffer(ordinary);
                    if (unaligned) misaligned[0]++;
                    if (mode.equals("leak") && !unaligned) {
                        throw new AssertionError("Misaligned cached-buffer path not exercised");
                    }
                    ByteBuffer aligned = Util.getTemporaryAlignedDirectBuffer(SIZE, ALIGNMENT);
                    try {
                        if (aligned.alignmentOffset(0, ALIGNMENT) != 0 || aligned.limit() != SIZE) {
                            throw new AssertionError("Alignment or limit");
                        }
                        for (int i = 0; i < SIZE; i++) aligned.put(i, (byte) (i + round));
                        for (int i = 0; i < SIZE; i++) {
                            if (aligned.get(i) != (byte) (i + round)) throw new AssertionError("Contents");
                        }
                    } finally {
                        Util.releaseTemporaryDirectBuffer(aligned);
                    }
                }
            } catch (Throwable failure) {
                FAILURE.set(failure);
            }
        }
    }

    private static final class Coordinator implements Runnable {
        private final Thread initial;
        private final Thread warm;
        private final Thread worker;
        private final int[] misaligned;
        private final byte[] readyLine;
        private final byte[][] postLines;
        private final InputStream input;
        private final PrintStream output;

        Coordinator(Thread initial, Thread warm, Thread worker, int[] misaligned,
                    byte[] readyLine, byte[][] postLines, InputStream input, PrintStream output) {
            this.initial = initial;
            this.warm = warm;
            this.worker = worker;
            this.misaligned = misaligned;
            this.readyLine = readyLine;
            this.postLines = postLines;
            this.input = input;
            this.output = output;
        }

        private void emit(byte[] line) {
            output.write(line, 0, line.length);
            output.flush();
        }

        @Override
        public void run() {
            try {
                // Main must return; join observes the initial thread's full exit.
                initial.join();
                warm.start();
                warm.join();
                if (FAILURE.get() != null) throw new AssertionError("Warmup failed", FAILURE.get());
                emit(readyLine);
                waitForCoordinator(input);

                worker.start();
                worker.join();
                if (FAILURE.get() != null) throw new AssertionError("Worker failed", FAILURE.get());
                emit(postLines[misaligned[0]]);
                waitForCoordinator(input);
            } catch (Throwable failure) {
                // An uncaught exception on this last non-daemon thread would
                // otherwise permit a zero process exit despite fixture failure.
                failure.printStackTrace();
                System.exit(1);
            }
        }
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 1 || !(args[0].equals("leak") || args[0].equals("control"))) {
            throw new IllegalArgumentException("leak or control required");
        }
        // Resolve the coordinator's descriptor-I/O classes on this initial
        // thread. Do not open paths or load helper classes on the coordinator.
        for (String name : new String[] {
                "java.io.PrintStream", "java.io.BufferedInputStream",
                "java.io.FileInputStream", "java.io.FileOutputStream",
                "jdk.internal.event.FileReadEvent", "jdk.internal.event.FileWriteEvent" }) {
            Class.forName(name, true, null);
        }
        byte[] readyLine = "NIO READY iterations=32 size=65536 alignment=4096\n"
                .getBytes(StandardCharsets.US_ASCII);
        byte[][] postLines = new byte[ITERATIONS + 1][];
        for (int i = 0; i <= ITERATIONS; i++) {
            postLines[i] = ("NIO POST_EXIT completed=32 misaligned=" + i + "\n")
                    .getBytes(StandardCharsets.US_ASCII);
        }
        int[] misaligned = {0};
        Thread initial = Thread.currentThread();
        // Construct every application helper and worker on the initial thread;
        // no lambda linkage or helper construction is deferred to the coordinator.
        Thread warm = new Thread(new Warmup(), "nio-warmup");
        Thread worker = new Thread(new Measurement(args[0], misaligned), "nio-measurement");
        Thread coordinator = new Thread(new Coordinator(initial, warm, worker, misaligned,
                readyLine, postLines, System.in, System.out), "nio-coordinator");
        coordinator.setDaemon(false);
        coordinator.start();
        // Do not join coordinator: it must observe this initial thread terminate.
    }
}
