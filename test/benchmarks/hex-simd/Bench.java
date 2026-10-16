/* Copyright (c) 2026, Harry Chan. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0 */
import java.lang.management.ManagementFactory;
import java.util.*;
import java.util.function.Supplier;
import com.sun.management.ThreadMXBean;
import jdk.internal.util.HexFormatSupport;

/** Bounded screening harness. All results escape; allocations are measured. */
public class Bench {
    private static volatile Object sink;
    private static final ThreadMXBean MX = (ThreadMXBean)ManagementFactory.getThreadMXBean();
    private static final long TID = Thread.currentThread().threadId();
    private static long run(Supplier<?> f, int n) {
        long start = System.nanoTime();
        for (int i = 0; i < n; i++) sink = f.get();
        return System.nanoTime() - start;
    }
    private static void measure(int size, String[] names, Supplier<?>[] fs) {
        int[] batch = new int[fs.length];
        // Calibrate batches and give every method a bounded individual warmup.
        for (int k = 0; k < fs.length; k++) {
            int n = 16;
            long elapsed;
            do { elapsed = run(fs[k], n); if (elapsed < 2_000_000) n *= 2; }
            while (elapsed < 2_000_000 && n < 1_048_576);
            batch[k] = n;
            long end = System.nanoTime() + 180_000_000L;
            do { run(fs[k], n); } while (System.nanoTime() < end);
        }
        // Alternate method order in each sample to expose drift. No aggregate
        // speedup hides allocation or native transitions. Print all observations.
        for (int sample = 0; sample < 5; sample++) {
            for (int j = 0; j < fs.length; j++) {
                int k = sample % 2 == 0 ? j : fs.length - 1 - j;
                long alloc = MX.getThreadAllocatedBytes(TID), time = 0, count = 0;
                do { time += run(fs[k], batch[k]); count += batch[k]; } while (time < 25_000_000);
                alloc = MX.getThreadAllocatedBytes(TID) - alloc;
                System.out.printf(Locale.ROOT, "%d,%s,%d,%.3f,%.1f,%d%n", size, names[k], sample, (double)time/count, (double)alloc/count, count);
            }
        }
    }
    public static void main(String[] args) {
        System.out.println("# " + System.getProperty("java.runtime.version") + "; " + System.getProperty("os.arch") +
                "; gc=" + ManagementFactory.getGarbageCollectorMXBeans().stream().map(x -> x.getName()).toList() +
                "; encodeMin=" + HexFormatSupport.ENCODE_MIN + "; decodeMin=" + HexFormatSupport.DECODE_MIN);
        System.out.println("bytes,operation,sample,ns_per_call,java_bytes_per_call,calls");
        String expected = System.getProperty("hexsimd.expectNative");
        boolean available = HexFormatSupport.isAvailable();
        System.out.println("# nativeAvailable=" + available);
        if (expected != null && available != Boolean.parseBoolean(expected)) throw new AssertionError("wrong native route");
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
