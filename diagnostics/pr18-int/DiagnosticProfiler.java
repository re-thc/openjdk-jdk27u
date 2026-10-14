/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * This diagnostic is distributed under the GNU General Public License version 2.
 */
package diagnostic;

import java.lang.management.ManagementFactory;
import java.lang.management.ThreadMXBean;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.openjdk.jmh.infra.BenchmarkParams;
import org.openjdk.jmh.infra.IterationParams;
import org.openjdk.jmh.profile.InternalProfiler;
import org.openjdk.jmh.results.IterationResult;
import org.openjdk.jmh.results.Result;
import jdk.test.whitebox.WhiteBox;
import sun.misc.Unsafe;

/** Read-only iteration observations; this profiler is used only in diagnostic replays. */
@SuppressWarnings("removal")
public final class DiagnosticProfiler implements InternalProfiler {
    private final ThreadMXBean threads = ManagementFactory.getThreadMXBean();
    private WhiteBox whiteBox;
    private final Path directory = System.getProperty("diagnostic.dir") == null ? null : Path.of(System.getProperty("diagnostic.dir"));
    private final long pid = ProcessHandle.current().pid();
    private Object state;
    private Thread worker;
    private Map<String, Object> before;
    private int sequence;
    private final List<String> threadNames = new ArrayList<>();
    private static volatile Object activeHandler;

    public static void registerHandler(Object handler) { activeHandler = handler; }

    public DiagnosticProfiler() {
        try {
            // JMH also constructs profilers in its outer driver to validate options.
            if (directory == null) return;
            Files.createDirectories(directory);
            if (threads.isThreadCpuTimeSupported() && !threads.isThreadCpuTimeEnabled()) {
                threads.setThreadCpuTimeEnabled(true);
            }
        } catch (Exception e) {
            throw new IllegalStateException("Cannot initialize diagnostic observations", e);
        }
    }

    @Override public String getDescription() { return "Iteration CPU, scheduling, layout and actual JMH C2 stub snapshots"; }

    @Override public void beforeIteration(BenchmarkParams benchmark, IterationParams iteration) {
        if (directory == null) throw new IllegalStateException("Diagnostic directory missing in fork");
        if (whiteBox == null) whiteBox = WhiteBox.getWhiteBox();
        before = snapshot("before");
    }

    @Override public Collection<? extends Result> afterIteration(BenchmarkParams benchmark, IterationParams iteration, IterationResult result) {
        Map<String, Object> after = snapshot("after");
        Map<String, Object> record = new LinkedHashMap<>();
        record.put("pid", pid);
        record.put("sequence", sequence++);
        record.put("type", iteration.getType().toString());
        record.put("before", before);
        record.put("after", after);
        record.put("measured_operations", result.getMetadata().getMeasuredOps());
        record.put("all_operations", result.getMetadata().getAllOps());
        record.put("score_ns_per_op", result.getPrimaryResult().getScore());
        record.put("jmh_elapsed_ns", result.getPrimaryResult().getScore() * result.getMetadata().getMeasuredOps());
        try {
            Files.writeString(directory.resolve("iteration-" + pid + "-" + record.get("sequence") + ".json"), json(record));
        } catch (Exception e) {
            throw new IllegalStateException("Cannot retain iteration diagnostic", e);
        }
        return List.of();
    }

    private Map<String, Object> snapshot(String phase) {
        Map<String, Object> out = new LinkedHashMap<>();
        out.put("nano_time", System.nanoTime());
        out.put("uptime_ms", ManagementFactory.getRuntimeMXBean().getUptime());
        try {
            locateWorkerState();
            out.put("threads_seen", List.copyOf(threadNames));
            if (worker != null) {
                out.put("worker_name", worker.getName());
                out.put("java_thread_id", worker.threadId());
                out.put("worker_cpu_ns", threads.getThreadCpuTime(worker.threadId()));
                List<Path> matching = new ArrayList<>();
                try (var tasks = Files.list(Path.of("/proc/self/task"))) {
                    for (Path task : tasks.toList()) {
                        String name = Files.readString(task.resolve("comm")).trim();
                        String full = worker.getName();
                        // Match os::set_native_thread_name's middle truncation in the frozen JDK.
                        String nativeName = full.length() < 16 ? full : full.substring(0, 7) + ".." + full.substring(full.length() - 6);
                        if (name.equals(nativeName)) {
                            matching.add(task);
                        }
                    }
                }
                if (matching.size() == 1) {
                    Path task = matching.getFirst();
                    out.put("linux_tid", task.getFileName().toString());
                    out.put("schedstat", Files.readString(task.resolve("schedstat")).trim());
                    out.put("task_stat", Files.readString(task.resolve("stat")).trim());
                    out.put("task_status", Files.readString(task.resolve("status")));
                } else {
                    out.put("linux_tid_error", "Expected one matching worker task, found " + matching.size());
                }
            }
            if (state != null) {
                Map<String, Object> arrays = new LinkedHashMap<>();
                Class<?> owner = Class.forName("bench.MultiplyBench");
                for (String name : List.of("ints", "otherInts", "resultInts", "secondInts")) {
                    Field field = owner.getDeclaredField(name);
                    field.setAccessible(true);
                    Object array = field.get(state);
                    long address = whiteBox.getObjectAddress(array);
                    arrays.put(name, Map.of("object_address", address, "data_address", address + Unsafe.ARRAY_INT_BASE_OFFSET,
                                           "data_mod16", (address + Unsafe.ARRAY_INT_BASE_OFFSET) & 15,
                                           "data_mod64", (address + Unsafe.ARRAY_INT_BASE_OFFSET) & 63));
                }
                out.put("arrays", arrays);
            }
            Class<?> test = Class.forName("bench.jmh_generated.MultiplyBench_intBroadcast_jmhTest");
            Method method = null;
            for (Method m : test.getDeclaredMethods()) if (m.getName().equals("intBroadcast_avgt_jmhStub")) method = m;
            if (method == null) throw new IllegalStateException("Actual timed JMH stub not found");
            Map<String, Object> nmethods = new LinkedHashMap<>();
            for (boolean osr : new boolean[] {false, true}) {
                Object[] code = whiteBox.getNMethod(method, osr);
                if (code == null) { nmethods.put(osr ? "osr" : "normal", null); continue; }
                byte[] instructions = (byte[]) code[2];
                String stem = "stub-" + pid + "-" + sequence + "-" + phase + "-" + (osr ? "osr" : "normal");
                Files.write(directory.resolve(stem + ".bin"), instructions);
                Object[] blob = (Object[]) code[0];
                nmethods.put(osr ? "osr" : "normal", Map.of("level", code[1], "compile_id", code[3], "entry_address", code[4],
                        "code_begin", blob[4], "bytes", instructions.length, "sha256", hex(MessageDigest.getInstance("SHA-256").digest(instructions)), "file", stem + ".bin"));
            }
            out.put("timed_stub", nmethods);
            out.put("cgroup_cpu", readOptional(Path.of("/sys/fs/cgroup/cpu.stat")));
            out.put("proc_stat", Files.readString(Path.of("/proc/stat")));
        } catch (Exception e) {
            out.put("error", e.toString());
        }
        return out;
    }

    private void locateWorkerState() throws Exception {
        if (state != null && worker != null) return;
        Object handler = activeHandler;
        if (handler == null) throw new IllegalStateException("Diagnostic handler registration missing");
        Field dataField = handler.getClass().getDeclaredField("workerData");
        dataField.setAccessible(true);
        Map<?, ?> workers = (Map<?, ?>) dataField.get(handler);
        threadNames.clear();
        for (var entry : workers.entrySet()) {
            worker = (Thread) entry.getKey();
            threadNames.add(worker.getName());
            Object data = entry.getValue();
            Field instance = data.getClass().getDeclaredField("instance");
            instance.setAccessible(true);
            Object test = instance.get(data);
            Field benchmarkState = test.getClass().getDeclaredField("f_multiplybench0_0");
            benchmarkState.setAccessible(true);
            state = benchmarkState.get(test);
        }
    }

    private static String readOptional(Path path) throws Exception { return Files.exists(path) ? Files.readString(path) : "unavailable"; }
    private static String hex(byte[] bytes) { return java.util.HexFormat.of().formatHex(bytes); }
    private static String json(Object value) {
        if (value == null) return "null";
        if (value instanceof Number || value instanceof Boolean) return value.toString();
        if (value instanceof Map<?, ?> map) {
            List<String> entries = new ArrayList<>();
            for (var entry : map.entrySet()) entries.add(json(entry.getKey().toString()) + ":" + json(entry.getValue()));
            return "{" + String.join(",", entries) + "}";
        }
        if (value instanceof Collection<?> collection) {
            return "[" + String.join(",", collection.stream().map(DiagnosticProfiler::json).toList()) + "]";
        }
        String text = value.toString().replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r").replace("\t", "\\t");
        return "\"" + text + "\"";
    }
}
