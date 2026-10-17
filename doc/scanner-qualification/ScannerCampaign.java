// Bounded, paired Scanner campaign; no dependencies beyond a JDK.
// See README.md for fixed gates and the repository LICENSE.
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;

public class ScannerCampaign {
    record Row(String window, long ops, long ns, long bytes, long checksum) { }
    record Run(List<Row> rows, long ready, long total) { }

    public static void main(String[] args) throws Exception {
        if (args.length != 6) throw new IllegalArgumentException("stage baseJdk candidateJdk outputDir collector platform");
        String stage = args[0], gc = args[4], platform = args[5];
        if (!List.of("G1", "Serial", "Z").contains(gc)) throw new IllegalArgumentException(gc);
        String[] modes = switch (stage) {
            case "cold" -> new String[] {"empty", "line", "next", "tokens", "boolean", "integer", "double", "host-line"};
            case "allocation" -> new String[] {"empty", "line", "integer"};
            case "legacy" -> new String[] {"integer-short", "double-short", "scan-integer-short",
                    "integer-long", "double-long", "scan-integer-long"};
            case "phases" -> new String[] {"integer", "double", "scan-int", "mixed", "invalid", "radix",
                    "big-int", "big-decimal", "german", "arabic", "locale", "debug", "spi-text", "host-text",
                    "line", "tokens", "large-line"};
            default -> throw new IllegalArgumentException(stage);
        };
        int pairs = stage.equals("cold") ? 20 : stage.equals("allocation") ? 5 : 8;
        int warmups = stage.equals("cold") ? 2 : 0;
        Path output = Path.of(args[3]).toAbsolutePath();
        Files.createDirectory(output); // Never overwrite or silently append to a campaign.
        try (var raw = new PrintWriter(Files.newBufferedWriter(output.resolve("raw.csv")));
             var summary = new PrintWriter(Files.newBufferedWriter(output.resolve("summary.csv")))) {
            raw.println("platform,gc,stage,mode,pair,image,order,window,ops,ns,bytes,checksum,ready_ns,total_ns");
            summary.println("platform,gc,stage,mode,window,metric,pairs,paired_median,bootstrap_upper95");
            for (String mode : modes) {
                Map<String, List<double[]>> ratios = new LinkedHashMap<>();
                for (int pair = -warmups; pair < pairs; pair++) {
                    Run[] runs = new Run[2];
                    for (int order = 0; order < 2; order++) {
                        int image = Math.floorMod(pair + order, 2);
                        List<String> command = new ArrayList<>();
                        boolean windows = System.getProperty("os.name").startsWith("Windows");
                        command.add(Path.of(args[1 + image], "bin", windows ? "java.exe" : "java").toString());
                        command.addAll(List.of("-Xms32m", "-Xmx128m", "-XX:+Use" + gc + "GC"));
                        boolean host = mode.startsWith("host-");
                        command.add("-Djava.locale.providers=" + (host ? "HOST,CLDR" : mode.equals("spi-text") ? "SPI,CLDR" : "CLDR"));
                        if (!host) command.addAll(List.of("-Duser.language=en", "-Duser.country=US"));
                        if (stage.equals("phases")) {
                            String modules = System.getProperty("scanner.modules");
                            if (modules == null) throw new IllegalArgumentException("set -Dscanner.modules to the compiled provider module directory");
                            command.addAll(List.of("--module-path", modules, "--add-modules", "provider"));
                        }
                        command.addAll(List.of("-cp", System.getProperty("java.class.path"),
                                stage.equals("legacy") ? "ScannerSteady" : stage.equals("phases") ? "ScannerPhases" : "ScannerCold"));
                        if (stage.equals("legacy")) {
                            int[] counts = legacyCounts(mode);
                            command.addAll(List.of(mode.substring(0, mode.lastIndexOf('-')), "" + counts[0], "" + counts[1]));
                        } else {
                            if (!stage.equals("phases")) command.add(stage);
                            command.add(mode);
                        }
                        Path errors = output.resolve(mode + "-" + pair + "-" + image + ".stderr");
                        ProcessBuilder builder = new ProcessBuilder(command).redirectError(errors.toFile());
                        for (String name : List.of("JAVA_TOOL_OPTIONS", "JDK_JAVA_OPTIONS", "_JAVA_OPTIONS")) builder.environment().remove(name);
                        Files.writeString(output.resolve(mode + "-" + pair + "-" + image + ".command"),
                                String.join("\n", command) + "\n");
                        long start = System.nanoTime();
                        Process child = builder.start();
                        var captured = new FutureTask<Run>(() -> {
                            long ready = -1;
                            List<Row> rows = new ArrayList<>();
                            try (var lines = new BufferedReader(new InputStreamReader(child.getInputStream()))) {
                                for (String line; (line = lines.readLine()) != null;) {
                                    if (line.equals("READY")) {
                                        ready = System.nanoTime() - start;
                                        child.getOutputStream().write(1);
                                        child.getOutputStream().flush();
                                    }
                                    else if (stage.equals("legacy")) {
                                        String[] fields = line.trim().split("\\s+");
                                        if (fields.length != 2) throw new IllegalStateException(line);
                                        double ns = Double.parseDouble(fields[0]), bytes = Double.parseDouble(fields[1]);
                                        if (!Double.isFinite(ns) || !Double.isFinite(bytes) || ns <= 0 || bytes <= 0)
                                            throw new IllegalStateException("invalid legacy counters");
                                        long operations = (long) legacyCounts(mode)[1] * (mode.startsWith("scan-") ? 2_000 : 1);
                                        rows.add(new Row(mode.endsWith("-short") ? "short" : "long", operations,
                                                Math.round(ns * operations), Math.round(bytes * operations), -1));
                                    } else {
                                        String[] fields = line.split(",");
                                        if (fields.length != 6 || !fields[0].equals("ROW")) throw new IllegalStateException(line);
                                        rows.add(new Row(fields[1], Long.parseLong(fields[2]), Long.parseLong(fields[3]),
                                                Long.parseLong(fields[4]), Long.parseLong(fields[5])));
                                    }
                                }
                            }
                            return new Run(rows, ready, 0);
                        });
                        Thread reader = Thread.ofPlatform().daemon(true).start(captured);
                        try {
                            if (!child.waitFor(120, TimeUnit.SECONDS)) {
                                throw new IllegalStateException("120s child deadline: " + errors);
                            }
                            long total = System.nanoTime() - start;
                            if (child.exitValue() != 0) throw new IllegalStateException("child exit " + child.exitValue() + ": " + errors);
                            Run capturedRun = captured.get(5, TimeUnit.SECONDS);
                            validate(stage, mode, capturedRun);
                            runs[image] = new Run(capturedRun.rows, capturedRun.ready, total);
                            if (pair >= 0) for (Row row : runs[image].rows) {
                                raw.println(String.join(",", platform, gc, stage, mode, "" + pair, image == 0 ? "base" : "candidate",
                                        "" + order, row.window, "" + row.ops, "" + row.ns, "" + row.bytes, "" + row.checksum,
                                        "" + capturedRun.ready, "" + total));
                            }
                            raw.flush();
                        } finally {
                            if (child.isAlive()) {
                                child.descendants().forEach(ProcessHandle::destroyForcibly);
                                child.destroyForcibly();
                                child.waitFor(10, TimeUnit.SECONDS);
                            }
                            captured.cancel(true);
                            Thread closer = Thread.ofPlatform().daemon(true).start(() -> {
                                try {
                                    child.getInputStream().close();
                                    child.getErrorStream().close();
                                    child.getOutputStream().close();
                                } catch (java.io.IOException ignored) { }
                            });
                            closer.join(5_000);
                            reader.join(5_000);
                            if (child.isAlive() || closer.isAlive() || reader.isAlive())
                                throw new IllegalStateException("bounded child cleanup failed; stop campaign");
                        }
                    }
                    if (pair < 0) continue;
                    if (runs[0].rows.size() != runs[1].rows.size()) throw new AssertionError("window mismatch");
                    for (int i = 0; i < runs[0].rows.size(); i++) {
                        Row base = runs[0].rows.get(i), candidate = runs[1].rows.get(i);
                        if (!base.window.equals(candidate.window) || base.ops != candidate.ops || base.checksum != candidate.checksum)
                            throw new AssertionError("work mismatch");
                        ratios.computeIfAbsent(base.window, unused -> new ArrayList<>()).add(new double[] {
                                (double) candidate.ns / base.ns,
                                base.bytes > 0 ? (double) candidate.bytes / base.bytes : Double.NaN,
                                runs[0].ready > 0 ? (double) runs[1].ready / runs[0].ready : Double.NaN,
                                (double) runs[1].total / runs[0].total,
                                (base.ns - candidate.ns) / (double) base.ops});
                    }
                }
                for (var entry : ratios.entrySet()) {
                    String[] metrics = {"ns/op ratio", "bytes/op ratio", "ready ratio", "total ratio", "saved ns/op"};
                    for (int metric = 0; metric < metrics.length; metric++) {
                        if ((stage.equals("phases") || stage.equals("legacy")) && (metric == 2 || metric == 3)) continue;
                        int index = metric;
                        double[] values = entry.getValue().stream().mapToDouble(row -> row[index]).toArray();
                        if (Arrays.stream(values).anyMatch(value -> !Double.isFinite(value))) continue;
                        summary.println(String.join(",", platform, gc, stage, mode, entry.getKey(), metrics[metric], "" + values.length,
                                "" + median(values), "" + upper95(values)));
                    }
                }
                summary.flush();
            }
            if (raw.checkError() || summary.checkError()) throw new IllegalStateException("result write failed");
        }
    }

    static void validate(String stage, String mode, Run run) {
        if (stage.equals("legacy")) {
            if (run.rows.size() != 1) throw new AssertionError("legacy protocol");
            Row row = run.rows.getFirst();
            long operations = (long) legacyCounts(mode)[1] * (mode.startsWith("scan-") ? 2_000 : 1);
            if (!row.window.equals(mode.endsWith("-short") ? "short" : "long") || row.ops != operations
                    || row.ns <= 0 || row.bytes <= 0 || row.checksum != -1) throw new AssertionError("legacy row");
            return;
        }
        if (!stage.equals("phases")) {
            if (run.ready <= 0 || run.rows.size() != 1) throw new AssertionError("cold protocol");
            Row row = run.rows.getFirst();
            if (!row.window.equals("cold") || row.ops != 1 || row.ns <= 0 || row.checksum != 1)
                throw new AssertionError("cold row");
            if (stage.equals("allocation") ? row.bytes < 0 || (!mode.equals("empty") && row.bytes == 0) : row.bytes != -1)
                throw new AssertionError("cold allocation counter");
            return;
        }
        int[] counts = switch (mode) {
            case "integer", "double" -> new int[] {1_000, 9_000, 20_000, 170_000, 100_000};
            case "scan-int" -> new int[] {100, 200, 700, 2_000};
            case "large-line" -> new int[] {10, 90, 200};
            default -> new int[] {1_000, 9_000, 20_000};
        };
        if (run.rows.size() != counts.length) throw new AssertionError("missing phase");
        for (int i = 0; i < counts.length; i++) {
            Row row = run.rows.get(i);
            long operations = (long) counts[i] * (mode.equals("scan-int") ? 2_000 : 1);
            if (!row.window.equals("" + i) || row.ops != operations || row.ns <= 0 || row.bytes <= 0 || row.checksum != counts[i])
                throw new AssertionError("phase row " + i);
        }
    }

    static int[] legacyCounts(String mode) {
        boolean scanning = mode.startsWith("scan-"), longer = mode.endsWith("-long");
        return scanning ? (longer ? new int[] {1_000, 2_000} : new int[] {100, 200})
                : (longer ? new int[] {200_000, 100_000} : new int[] {10_000, 20_000});
    }

    static double median(double[] input) {
        double[] copy = input.clone();
        Arrays.sort(copy);
        int middle = copy.length / 2;
        return copy.length % 2 == 0 ? (copy[middle - 1] + copy[middle]) / 2 : copy[middle];
    }

    static double upper95(double[] values) {
        Random random = new Random(89885);
        double[] estimates = new double[10_000], sample = new double[values.length];
        for (int i = 0; i < estimates.length; i++) {
            for (int j = 0; j < sample.length; j++) sample[j] = values[random.nextInt(values.length)];
            estimates[i] = median(sample);
        }
        Arrays.sort(estimates);
        return estimates[9_499];
    }
}
