/* Copyright (c) 2026, Harry Chan. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0 */
import java.util.HexFormat;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

/** Cold calls have no helper lookup, reference patch or warmup; race is a separate check. */
public class FirstUse {
    private static volatile Object sessionSink;

    private static void race() throws Exception {
        CountDownLatch ready = new CountDownLatch(4), go = new CountDownLatch(1);
        AtomicReference<Throwable> failure = new AtomicReference<>();
        Thread[] threads = new Thread[4];
        for (int i = 0; i < threads.length; i++) {
            threads[i] = new Thread(() -> {
                try {
                    byte[] bytes = new byte[1024];
                    String text = "ab".repeat(128);
                    ready.countDown();
                    if (!go.await(10, TimeUnit.SECONDS)) throw new AssertionError("first-use gate timeout");
                    if (!HexFormat.of().formatHex(bytes).equals("00".repeat(bytes.length)))
                        throw new AssertionError("first-use encode");
                    byte[] decoded = HexFormat.of().parseHex(text);
                    if (decoded.length != 128) throw new AssertionError("first-use decode length");
                    for (byte b : decoded) if (b != (byte)0xab) throw new AssertionError("first-use decode");
                } catch (Throwable t) {
                    failure.compareAndSet(null, t);
                }
            }, "hex-first-use-" + i);
            threads[i].setDaemon(true);
            threads[i].start();
        }
        if (!ready.await(10, TimeUnit.SECONDS)) throw new AssertionError("first-use ready timeout");
        go.countDown();
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(10);
        for (Thread thread : threads) {
            long remaining = deadline - System.nanoTime();
            if (remaining <= 0) throw new AssertionError("concurrent first-use timeout");
            thread.join(Math.max(1, TimeUnit.NANOSECONDS.toMillis(remaining)));
            if (thread.isAlive()) throw new AssertionError("concurrent first-use timeout");
        }
        if (failure.get() != null) throw new AssertionError("concurrent first use", failure.get());
        String expected = System.getProperty("hexsimd.expectNative");
        if (expected == null) throw new AssertionError("missing expected native availability");
        boolean available = false;
        try {
            available = (boolean)Class.forName("jdk.internal.util.HexFormatSupport")
                    .getMethod("isAvailable").invoke(null);
        } catch (ClassNotFoundException baseline) { }
        if (available != Boolean.parseBoolean(expected)) throw new AssertionError("wrong native availability");
        System.out.println("PASS concurrent first use; nativeAvailable=" + available);
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 1) throw new IllegalArgumentException("empty | tiny | encode | decode | bulk-session | race");
        if (args[0].equals("race")) {
            race();
            return;
        }
        int size = switch (args[0]) {
            case "empty" -> 0;
            case "tiny" -> 32;
            case "encode" -> 1024;
            case "decode" -> 128;
            case "bulk-session" -> 65536;
            default -> throw new IllegalArgumentException(args[0]);
        };
        byte[] bytes = new byte[size];
        String text = "ab".repeat(size);
        long start = System.nanoTime();
        Object result;
        if (args[0].equals("bulk-session")) {
            // One fixed session of 128 pairs, 8 MiB in each direction, including
            // first loading/dispatch and all 256 public-call allocations. This
            // single session size does not measure an amortization crossover.
            for (int i = 0; i < 128; i++) {
                sessionSink = HexFormat.of().formatHex(bytes);
                sessionSink = HexFormat.of().parseHex(text);
            }
            result = sessionSink;
        } else {
            result = args[0].equals("decode")
                    ? HexFormat.of().parseHex(text) : HexFormat.of().formatHex(bytes);
        }
        long elapsed = System.nanoTime() - start;
        int length = result instanceof String s ? s.length() : ((byte[])result).length;
        if (length != (args[0].equals("decode") || args[0].equals("bulk-session") ? size : size * 2))
            throw new AssertionError("wrong result length");
        System.out.println(args[0] + "," + elapsed + "," + length);
    }
}
