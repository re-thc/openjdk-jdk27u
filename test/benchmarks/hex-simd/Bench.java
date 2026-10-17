/* Copyright (c) 2026, Harry Chan. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0 */
import java.lang.management.ManagementFactory;
import java.util.*;
import java.util.function.Supplier;
import com.sun.management.ThreadMXBean;

/** Bounded screening harness. All results escape; allocations are measured. */
public class Bench {
    private static volatile Object sink;
    private static final ThreadMXBean MX = (ThreadMXBean)ManagementFactory.getThreadMXBean();
    private static final long TID = Thread.currentThread().threadId();
    private static final int WARMUP_MS = bounded("hexsimd.warmupMs", 180, 1, 2000);
    private static final int SAMPLE_MS = bounded("hexsimd.sampleMs", 25, 1, 250);
    private static final int SAMPLES = bounded("hexsimd.samples", 5, 3, 7);

    private static int bounded(String name, int fallback, int min, int max) {
        int value = Integer.getInteger(name, fallback);
        if (value < min || value > max) throw new IllegalArgumentException(name + " outside " + min + ".." + max);
        return value;
    }

    private static void requireAllocationAccounting() {
        if (!MX.isThreadAllocatedMemorySupported())
            throw new IllegalStateException("Thread allocation accounting is unavailable");
        if (!MX.isThreadAllocatedMemoryEnabled()) MX.setThreadAllocatedMemoryEnabled(true);
        if (MX.getThreadAllocatedBytes(TID) < 0)
            throw new IllegalStateException("Thread allocation accounting returned no measurement");
    }

    private static boolean nativeAvailability() throws ReflectiveOperationException {
        try {
            // Allow this same harness and reference patch to run on the exact
            // baseline JDK, where the optional support class does not exist.
            Class<?> support = Class.forName("jdk.internal.util.HexFormatSupport");
            System.out.println("# encodeMin=" + support.getField("ENCODE_MIN").getInt(null) +
                    "; decodeMin=" + support.getField("DECODE_MIN").getInt(null));
            return (boolean)support.getMethod("isAvailable").invoke(null);
        } catch (ClassNotFoundException baseline) {
            System.out.println("# optional support absent (baseline JDK)");
            return false;
        }
    }
    private static long run(Supplier<?> f, int n) {
        long start = System.nanoTime();
        for (int i = 0; i < n; i++) sink = f.get();
        return System.nanoTime() - start;
    }
    static void measure(int size, String[] names, Supplier<?>[] fs) {
        int[] batch = new int[fs.length];
        // Calibrate batches and give every method a bounded individual warmup.
        for (int k = 0; k < fs.length; k++) {
            int n = 16;
            long elapsed;
            do { elapsed = run(fs[k], n); if (elapsed < 2_000_000) n *= 2; }
            while (elapsed < 2_000_000 && n < 1_048_576);
            batch[k] = n;
            long end = System.nanoTime() + WARMUP_MS * 1_000_000L;
            do { run(fs[k], n); } while (System.nanoTime() < end);
        }
        // Alternate method order in each sample to expose drift. No aggregate
        // speedup hides allocation or native transitions. Print all observations.
        for (int sample = 0; sample < SAMPLES; sample++) {
            for (int j = 0; j < fs.length; j++) {
                int k = sample % 2 == 0 ? j : fs.length - 1 - j;
                long alloc = MX.getThreadAllocatedBytes(TID), time = 0, count = 0;
                do { time += run(fs[k], batch[k]); count += batch[k]; } while (time < SAMPLE_MS * 1_000_000L);
                alloc = MX.getThreadAllocatedBytes(TID) - alloc;
                System.out.printf(Locale.ROOT, "%d,%s,%d,%.3f,%.1f,%d%n", size, names[k], sample, (double)time/count, (double)alloc/count, count);
            }
        }
    }
    public static void main(String[] args) throws Exception {
        requireAllocationAccounting();
        System.out.println("# " + System.getProperty("java.runtime.version") + "; " + System.getProperty("os.arch") +
                "; gc=" + ManagementFactory.getGarbageCollectorMXBeans().stream().map(x -> x.getName()).toList() +
                "; warmupMs=" + WARMUP_MS + "; sampleMs=" + SAMPLE_MS + "; samples=" + SAMPLES);
        System.out.println("bytes,operation,sample,ns_per_call,java_bytes_per_call,calls");
        String expected = System.getProperty("hexsimd.expectNative");
        boolean available = nativeAvailability();
        System.out.println("# nativeAvailable=" + available);
        if (expected != null && available != Boolean.parseBoolean(expected)) throw new AssertionError("wrong native availability");
        if (args.length == 1 && args[0].equals("protected")) {
            Protected.run();
            return;
        }
        int[] sizes = args.length == 0 ? new int[]{0,1,8,16,32,64,128,256,512,1024,4096,16384,65536,1048576} :
                Arrays.stream(args).mapToInt(Integer::parseInt).toArray();
        HexFormat h = HexFormat.of(); HexFormatReference r = HexFormatReference.of();
        Random random = new Random(42);
        for (int size : sizes) {
            byte[][] inputs = new byte[16][]; String[] strings = new String[16];
            for (int i = 0; i < inputs.length; i++) {
                inputs[i] = new byte[size]; random.nextBytes(inputs[i]); strings[i] = r.formatHex(inputs[i]);
            }
            int[] index = new int[4];
            measure(size, new String[]{"encode-jdk", "encode-native", "decode-jdk", "decode-native"},
                    new Supplier<?>[]{() -> r.formatHex(inputs[index[0]++ & 15]), () -> h.formatHex(inputs[index[1]++ & 15]),
                            () -> r.parseHex(strings[index[2]++ & 15]), () -> h.parseHex(strings[index[3]++ & 15])});
        }
    }
}
