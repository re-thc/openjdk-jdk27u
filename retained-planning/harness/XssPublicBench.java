/*
 * Task-local public-API whole-sort benchmark fixture for the proposed A/E/U
 * comparison. This source is not compiled or executed during harness prep.
 * Reset and independent oracle validation are outside the sort timer.
 */
import java.io.BufferedWriter;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.lang.management.ManagementFactory;
import java.util.Arrays;

public final class XssPublicBench {
    private static final int LOW = 17;
    private static final int WARMUPS = 20;
    private static final int CONDITIONING = 8;
    private static final int MEASURED = 16;
    private static final long RANDOM_SEED = 20261023L;
    private static final int[][] ORIGINAL = {
        {8192,0},{8192,1},{8192,2},{8192,3},{8192,4},{8192,5},
        {65536,0},{65536,1},{65536,2},{65536,3},{65536,4},{65536,5},
        {1048576,0},{1048576,1},{1048576,2},{1048576,3},{1048576,4},{1048576,5}
    };
    private static final String[] PATTERN = {
        "random", "equal", "sorted", "reverse", "runs", "skew",
        "sparseSorted", "singleNegative", "organPipe"
    };
    private static volatile long sink;
    private static com.sun.management.ThreadMXBean memory;

    private record SortCase(int id, int history, int size, String pattern,
                            long[] source, long[] work, long[] expected) { }

    private static long mix(long x) {
        x = (x ^ (x >>> 30)) * 0xbf58476d1ce4e5b9L;
        x = (x ^ (x >>> 27)) * 0x94d049bb133111ebL;
        return x ^ (x >>> 31);
    }

    private static long inputValue(int i, int n, String pattern, long seed) {
        long r = mix(seed + i * 0x9e3779b97f4a7c15L + n);
        return switch (pattern) {
            case "equal" -> -17L;
            case "sorted", "sparseSorted" -> (long) i - n / 2;
            case "reverse" -> (long) n / 2 - i;
            case "runs" -> (i / 257 % 2 == 0 ? i % 257 : 256 - i % 257)
                    + (long) (i / 257) * 13L;
            case "skew" -> (r & 127) == 0 ? r : 0L;
            case "singleNegative" -> i == n / 8 ? -1L : 0L;
            case "organPipe" -> (long) Math.min(i, n - i) - n / 4;
            default -> r;
        };
    }

    private static long[] makeInput(int n, String pattern, long seed) {
        long[] a = new long[n + LOW + 19];
        for (int i = 0; i < a.length; i++) a[i] = mix(seed + i);
        for (int i = 0; i < n; i++) a[LOW + i] = inputValue(i, n, pattern, seed);
        if (pattern.equals("sparseSorted")) {
            for (int i = 4095; i + 1 < n; i += 4096) {
                long t = a[LOW + i];
                a[LOW + i] = a[LOW + i + 1];
                a[LOW + i + 1] = t;
            }
        }
        return a;
    }

    // Independent signed LSD radix oracle. It never calls Arrays.sort.
    private static long[] oracle(long[] input, int size) {
        long[] keys = Arrays.copyOfRange(input, LOW, LOW + size);
        long[] tmp = new long[size];
        for (int pass = 0; pass < Long.BYTES; pass++) {
            int[] counts = new int[256];
            int shift = pass * Byte.SIZE;
            for (long x : keys) counts[(int) (x >>> shift) & 255]++;
            int sum = 0;
            for (int b = 0; b < 256; b++) {
                int k = pass == Long.BYTES - 1 ? b ^ 128 : b;
                int count = counts[k];
                counts[k] = sum;
                sum += count;
            }
            for (long x : keys) tmp[counts[(int) (x >>> shift) & 255]++] = x;
            long[] swap = keys; keys = tmp; tmp = swap;
        }
        long[] expected = input.clone();
        System.arraycopy(keys, 0, expected, LOW, size);
        return expected;
    }

    private static SortCase makeCase(int id, int history, int size, String pattern) {
        long seed = RANDOM_SEED ^ ((long) size << 17) ^ pattern.hashCode();
        long[] source = makeInput(size, pattern, seed);
        return new SortCase(id, history, size, pattern, source, source.clone(), oracle(source, size));
    }

    private static void sort(long[] a, int size) {
        Arrays.sort(a, LOW, LOW + size);
    }

    private static long allocated() {
        return memory.getThreadAllocatedBytes(Thread.currentThread().threadId());
    }

    private static void one(SortCase c, int phase, int ordinal, BufferedWriter out)
            throws Exception {
        long a0 = allocated();
        System.arraycopy(c.source(), 0, c.work(), 0, c.source().length);
        long resetBytes = allocated() - a0;
        long t0 = System.nanoTime();
        sort(c.work(), c.size());
        long t1 = System.nanoTime();
        long sortBytes = allocated() - a0 - resetBytes;
        long elapsed = t1 - t0;
        long v0 = allocated();
        if (!Arrays.equals(c.work(), c.expected())) {
            throw new AssertionError("output/guard mismatch case=" + c.id() + " phase=" + phase
                    + " ordinal=" + ordinal);
        }
        long validationBytes = allocated() - v0;
        sink ^= c.work()[LOW + c.size() / 2];
        out.write("SORT," + phase + "," + c.history() + "," + c.id() + "," + c.size()
                + "," + c.pattern() + "," + ordinal + "," + elapsed + "," + resetBytes
                + "," + sortBytes + "," + validationBytes + "\n");
    }

    private static int[][] cases(int history) {
        int[][] all = new int[32][2];
        for (int i = 0; i < ORIGINAL.length; i++) {
            all[i] = ORIGINAL[(i + 3 * history) % ORIGINAL.length].clone();
        }
        int k = 18;
        for (int n : new int[]{8192, 65536, 1048576}) {
            all[k++] = new int[]{n, 6};
            all[k++] = new int[]{n, 7};
        }
        for (int n : new int[]{512, 1024, 2048, 4096}) all[k++] = new int[]{n, 0};
        for (int n : new int[]{512, 8192, 65536, 1048576}) all[k++] = new int[]{n, 8};
        if (k != 32) throw new AssertionError("case count=" + k);
        return all;
    }

    private static void protocol(String stage) throws Exception {
        System.out.println(stage + " " + ProcessHandle.current().pid() + " "
                + Thread.currentThread().threadId());
        System.out.flush();
        if (System.in.read() != '\n') throw new AssertionError("missing " + stage + " handshake");
    }

    private static void run(int history, Path dataPath) throws Exception {
        memory = (com.sun.management.ThreadMXBean) ManagementFactory.getThreadMXBean();
        if (!memory.isThreadAllocatedMemorySupported()) throw new AssertionError("allocation counter unavailable");
        memory.setThreadAllocatedMemoryEnabled(true);
        Thread.currentThread().setName("xss-sorter");
        protocol("BOOT");
        protocol("READY");
        try (BufferedWriter out = Files.newBufferedWriter(dataPath, StandardCharsets.UTF_8)) {
            out.write("kind,phase,history,case_id,size,pattern,ordinal,sort_ns,reset_alloc_bytes,sort_alloc_bytes,validation_alloc_bytes\n");
            SortCase warm = makeCase(-1, history, 1048576, "random");
            for (int i = 0; i < WARMUPS; i++) one(warm, 0, i, out);
            out.flush();
            int[][] schedule = cases(history);
            for (int id = 0; id < schedule.length; id++) {
                int size = schedule[id][0];
                String pattern = PATTERN[schedule[id][1]];
                SortCase c = makeCase(id, history, size, pattern);
                for (int i = 0; i < CONDITIONING; i++) one(c, 1, i, out);
                for (int i = 0; i < MEASURED; i++) one(c, 2, i, out);
                out.flush();
            }
        }
        protocol("DONE");
        System.out.println("COMPLETE sink=" + sink);
        System.out.flush();
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 2) throw new IllegalArgumentException("history data.csv");
        int history = Integer.parseInt(args[0]);
        if (history != 0 && history != 3 && history != 4 && history != 5)
            throw new IllegalArgumentException("unknown history " + history);
        run(history, Path.of(args[1]));
    }
}
