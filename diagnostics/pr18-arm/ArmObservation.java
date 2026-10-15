/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * This diagnostic is distributed under the GNU General Public License version 2.
 */
package arm;

import java.lang.management.ManagementFactory;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.util.*;
import org.openjdk.jmh.infra.BenchmarkParams;
import org.openjdk.jmh.infra.IterationParams;
import org.openjdk.jmh.profile.InternalProfiler;
import org.openjdk.jmh.results.IterationResult;
import org.openjdk.jmh.results.Result;
import jdk.test.whitebox.WhiteBox;

/** Read-only observations outside timed iterations, identical in both arms. */
public final class ArmObservation implements InternalProfiler {
    private final com.sun.management.ThreadMXBean threads = (com.sun.management.ThreadMXBean) ManagementFactory.getThreadMXBean();
    private final Path directory = System.getProperty("arm.dir") == null ? null : Path.of(System.getProperty("arm.dir"));
    private WhiteBox whiteBox;
    private Map<String, Object> before;
    private int sequence;

    @Override public String getDescription() { return "Actual timed C2 code, worker CPU and allocations"; }
    @Override public void beforeIteration(BenchmarkParams benchmark, IterationParams iteration) {
        if (directory == null) throw new IllegalStateException("Missing fork evidence directory");
        if (whiteBox == null) {
            whiteBox = WhiteBox.getWhiteBox();
            threads.setThreadCpuTimeEnabled(true);
            threads.setThreadAllocatedMemoryEnabled(true);
        }
        before = snapshot(benchmark);
    }
    @Override public Collection<? extends Result> afterIteration(BenchmarkParams benchmark, IterationParams iteration, IterationResult result) {
        Map<String, Object> record = new LinkedHashMap<>();
        record.put("sequence", sequence++);
        record.put("type", iteration.getType().toString());
        record.put("before", before);
        record.put("after", snapshot(benchmark));
        record.put("measured_operations", result.getMetadata().getMeasuredOps());
        record.put("score_ns_per_op", result.getPrimaryResult().getScore());
        try { Files.writeString(directory.resolve("iteration-" + record.get("sequence") + ".json"), json(record)); }
        catch (Exception e) { throw new IllegalStateException(e); }
        return List.of();
    }
    private Map<String, Object> snapshot(BenchmarkParams benchmark) {
        Map<String, Object> out = new LinkedHashMap<>();
        out.put("uptime_ms", ManagementFactory.getRuntimeMXBean().getUptime());
        try {
            long[] ids = threads.getAllThreadIds();
            List<Long> workers = new ArrayList<>();
            for (long id : ids) {
                var info = threads.getThreadInfo(id);
                if (info != null && info.getThreadName().endsWith("jmh-worker-1")) workers.add(id);
            }
            if (workers.size() == 1) {
                long id = workers.getFirst();
                out.put("worker_id", id);
                out.put("worker_cpu_ns", threads.getThreadCpuTime(id));
                out.put("worker_allocated_bytes", threads.getThreadAllocatedBytes(id));
            } else { out.put("worker_error", workers.toString()); }
            String name = benchmark.getBenchmark().substring(benchmark.getBenchmark().lastIndexOf('.') + 1);
            Class<?> generated = Class.forName("bench.jmh_generated.MultiplyBench_" + name + "_jmhTest");
            Method stub = Arrays.stream(generated.getDeclaredMethods()).filter(m -> m.getName().equals(name + "_avgt_jmhStub")).findFirst().orElseThrow();
            Method kernel = Class.forName("bench.MultiplyBench").getDeclaredMethod(name);
            out.put("timed_stub", code(stub));
            out.put("kernel", code(kernel));
            out.put("cgroup_cpu", Files.readString(Path.of("/sys/fs/cgroup/cpu.stat")));
        } catch (Exception e) { out.put("error", e.toString()); }
        return out;
    }
    private Map<String, Object> code(Method method) throws Exception {
        Map<String, Object> result = new LinkedHashMap<>();
        for (boolean osr : new boolean[] {false, true}) {
            Object[] nmethod = whiteBox.getNMethod(method, osr);
            if (nmethod == null) { result.put(osr ? "osr" : "normal", null); continue; }
            byte[] bytes = (byte[]) nmethod[2];
            String sha = HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(bytes));
            Path file = directory.resolve(sha + ".bin");
            if (!Files.exists(file)) Files.write(file, bytes);
            Object[] blob = (Object[]) nmethod[0];
            result.put(osr ? "osr" : "normal", Map.of("level", nmethod[1], "compile_id", nmethod[3],
                "entry_address", nmethod[4], "code_begin", blob[4], "bytes", bytes.length, "sha256", sha, "file", file.getFileName().toString()));
        }
        return result;
    }
    private static String json(Object value) {
        if (value == null) return "null";
        if (value instanceof Number || value instanceof Boolean) return value.toString();
        if (value instanceof Map<?, ?> map) {
            List<String> entries = new ArrayList<>();
            for (var entry : map.entrySet()) entries.add(json(entry.getKey().toString()) + ":" + json(entry.getValue()));
            return "{" + String.join(",", entries) + "}";
        }
        if (value instanceof Collection<?> collection) return "[" + String.join(",", collection.stream().map(ArmObservation::json).toList()) + "]";
        return "\"" + value.toString().replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r").replace("\t", "\\t") + "\"";
    }
}
