import dev.jzstd.Jzstd;
import java.nio.file.*;
import java.time.Duration;
import java.util.*;
import java.lang.management.CompilationMXBean;
import java.lang.management.ManagementFactory;
import jdk.jfr.Recording;

/** Dependency-free steady-state probe; compile alongside src/main/java. */
public class CodecProbe {
    static volatile long sink;
    public static void main(String[] args) throws Exception {
        if (args.length != 4 || !(args[0].equals("encode") || args[0].equals("decode"))) {
            throw new IllegalArgumentException("encode|decode source level frame");
        }
        String mode = args[0];
        CompilationMXBean compiler = Boolean.getBoolean("probe.compilerStats")
                ? ManagementFactory.getCompilationMXBean() : null;
        var runtime = compiler == null ? null : ManagementFactory.getRuntimeMXBean();
        if (compiler != null && !compiler.isCompilationTimeMonitoringSupported()) {
            throw new IllegalStateException("Compilation time monitoring unavailable");
        }
        if (compiler != null) {
            compiler.getTotalCompilationTime();
            runtime.getUptime();
        }
        byte[] source = Files.readAllBytes(Path.of(args[1]));
        int level = Integer.parseInt(args[2]);
        byte[] frame = mode.equals("decode") ? Files.readAllBytes(Path.of(args[3]))
                : Jzstd.compress(source, level, false);
        byte[] destination = new byte[mode.equals("encode")
                ? Jzstd.compressBound(source.length) : source.length];
        if (!Arrays.equals(source, Jzstd.decompress(frame))) throw new AssertionError("round trip");
        if (mode.equals("encode")) Files.write(Path.of(args[3]), frame);
        Runnable operation = mode.equals("encode")
                ? () -> sink = Jzstd.compress(source, 0, source.length,
                    destination, 0, destination.length, level, false)
                : () -> sink = Jzstd.decompress(frame, destination);
        long warmup = System.nanoTime() + (long)(Double.parseDouble(
                System.getProperty("probe.warmup", "2")) * 1e9);
        do { operation.run(); } while (System.nanoTime() < warmup);
        long boundaryUptime = runtime == null ? 0 : runtime.getUptime();
        long compiledAtWarmup = compiler == null ? 0 : compiler.getTotalCompilationTime();
        Recording recording = null;
        String jfr = System.getProperty("probe.jfr");
        if (jfr != null) {
            recording = new Recording();
            recording.enable("jdk.ExecutionSample").withPeriod(Duration.ofMillis(2));
            recording.enable("jdk.Compilation");
            recording.start();
        }
        double[] rates = new double[5];
        for (int sample = 0; sample < rates.length; sample++) {
            long start = System.nanoTime(), stop = start + 700_000_000L;
            int count = 0;
            do { operation.run(); count++; } while (System.nanoTime() < stop);
            rates[sample] = source.length * (double)count * 1e3 / (System.nanoTime() - start);
        }
        long compiledAfterMeasurement = compiler == null ? 0 : compiler.getTotalCompilationTime();
        if (recording != null) { recording.stop(); recording.dump(Path.of(jfr)); recording.close(); }
        if (mode.equals("decode") && !Arrays.equals(source, destination)) throw new AssertionError("direct output");
        int frameSize = frame.length;
        if (mode.equals("encode")) {
            byte[] timedFrame = Arrays.copyOf(destination, (int)sink);
            if (!Arrays.equals(source, Jzstd.decompress(timedFrame))) throw new AssertionError("timed output");
            Files.write(Path.of(args[3]), timedFrame);
            frameSize = timedFrame.length;
        }
        double[] sorted = rates.clone();
        Arrays.sort(sorted);
        System.out.printf(Locale.ROOT, "%s L%d input=%d frame=%d median=%.1f MB/s samples=%s%n",
                mode, level, source.length, frameSize, sorted[2], Arrays.toString(rates));
        if (compiler != null) {
            System.out.printf(Locale.ROOT, "COMPILER warmup_ms=%d measured_ms=%d boundary_uptime_ms=%d%n",
                    compiledAtWarmup, compiledAfterMeasurement - compiledAtWarmup, boundaryUptime);
        }
    }
}
