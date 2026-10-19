import dev.jzstd.Jzstd;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;

// Check the identical fixed frames and reusable/allocating APIs used on Linux.
public class DecoderCheck {
    record Frame(String name, byte[] source, byte[] frame, byte[] output) {}
    public static void main(String[] args) throws Exception {
        Path root = Path.of(args[0]);
        int rounds = Integer.parseInt(args[1]);
        var frames = new ArrayList<Frame>();
        for (String line : Files.readAllLines(root.resolve("frames.tsv"))) {
            String[] fields = line.split("\t");
            byte[] source = Files.readAllBytes(root.resolve(fields[0]));
            frames.add(new Frame(fields[1], source, Files.readAllBytes(root.resolve(fields[1])),
                                 new byte[source.length]));
        }
        long checksum = 0;
        for (int round = 0; round < rounds; round++) {
            for (Frame f : frames) {
                Arrays.fill(f.output, (byte) 0xa5);
                int count = Jzstd.decompress(f.frame, f.output);
                if (count != f.source.length || !Arrays.equals(f.source, f.output)) {
                    throw new AssertionError("reusable decode mismatch " + f.name + " round " + round);
                }
                if (round == rounds - 1 && !Arrays.equals(f.source, Jzstd.decompress(f.frame))) {
                    throw new AssertionError("allocating decode mismatch " + f.name);
                }
                checksum += count + (count == 0 ? 0 : f.output[count / 2]);
            }
        }
        System.out.println("PASS frames=" + frames.size() + " rounds=" + rounds + " checksum=" + checksum);
    }
}
