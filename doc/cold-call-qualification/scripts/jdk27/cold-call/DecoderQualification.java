package dev.jzstd;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Bounded decoder correctness only. Uses the existing test corpus factories. */
public final class DecoderQualification {
    private record Frame(String name, byte[] source, byte[] frame, byte[] output) {}

    public static void main(String[] args) throws Exception {
        Path root = Path.of(args[1]);
        if (args[0].equals("prepare")) {
            Files.createDirectories(root);
            Map<String, byte[]> corpora = new LinkedHashMap<>();
            corpora.put("source", Files.readAllBytes(Path.of(args[2])));
            corpora.put("text", ComprehensiveRoundTripTest.textData(10000));
            corpora.put("json", ComprehensiveRoundTripTest.jsonData(20000));
            corpora.put("random", ComprehensiveRoundTripTest.randomData(50000, 12345));
            corpora.put("dna", ComprehensiveRoundTripTest.dnaSequence(30000));
            corpora.put("low4", ComprehensiveRoundTripTest.lowEntropy(40000, 4));
            corpora.put("low16", ComprehensiveRoundTripTest.lowEntropy(40000, 16));
            corpora.put("pat7", ComprehensiveRoundTripTest.repeatingPattern(50000, 7));
            corpora.put("pat256", ComprehensiveRoundTripTest.repeatingPattern(50000, 256));
            corpora.put("sparse", ComprehensiveRoundTripTest.sparseZeros(60000, 100));
            corpora.put("zeros", new byte[128 * 1024]);
            corpora.put("empty", new byte[0]);
            corpora.put("single", new byte[]{42});
            for (int n : new int[]{131071, 131072, 131073}) {
                corpora.put("boundary-text-" + n, ComprehensiveRoundTripTest.textData(n));
                corpora.put("boundary-random-" + n, ComprehensiveRoundTripTest.randomData(n, 12345));
            }
            for (var entry : corpora.entrySet()) {
                Files.write(root.resolve(entry.getKey() + ".bin"), entry.getValue());
            }
            System.out.println("Prepared " + corpora.size() + " fixed corpora");
            return;
        }
        if (!args[0].equals("check")) throw new IllegalArgumentException("prepare|check directory [source|rounds]");
        int rounds = Integer.parseInt(args[2]);
        List<Frame> frames = new ArrayList<>();
        for (String line : Files.readAllLines(root.resolve("frames.tsv"))) {
            String[] fields = line.split("\t");
            byte[] source = Files.readAllBytes(root.resolve(fields[0]));
            byte[] frame = Files.readAllBytes(root.resolve(fields[1]));
            frames.add(new Frame(fields[1], source, frame, new byte[source.length]));
        }
        long checksum = 0;
        for (int round = 0; round < rounds; round++) {
            for (Frame f : frames) {
                Arrays.fill(f.output, (byte) 0xa5);
                int n = Jzstd.decompress(f.frame, f.output);
                if (n != f.source.length || !Arrays.equals(f.source, f.output)) {
                    throw new AssertionError("reusable decode mismatch " + f.name + " round " + round);
                }
                // Also cover allocating output once for every frame.
                if (round == rounds - 1 && !Arrays.equals(f.source, Jzstd.decompress(f.frame))) {
                    throw new AssertionError("allocating decode mismatch " + f.name);
                }
                checksum += n + (n == 0 ? 0 : f.output[n / 2]);
            }
        }
        System.out.println("PASS frames=" + frames.size() + " rounds=" + rounds + " checksum=" + checksum);
    }
}
