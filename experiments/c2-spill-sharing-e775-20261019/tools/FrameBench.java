package experiment;

import dev.jzstd.Jzstd;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

@BenchmarkMode(Mode.Throughput)
@OutputTimeUnit(TimeUnit.SECONDS)
@State(Scope.Thread)
public class FrameBench {
    @Param({"source", "repetitive", "dense", "long-offset", "random"})
    public String corpus;
    byte[] source, frame, destination;

    @Setup(Level.Trial)
    public void setup() throws Exception {
        Path directory = Path.of("/workspace/work/spill-sharing/corpus");
        source = Files.readAllBytes(directory.resolve(corpus + ".bin"));
        frame = Files.readAllBytes(directory.resolve(corpus + ".zst"));
        destination = new byte[source.length];
        if (!Arrays.equals(source, Jzstd.decompress(frame))) throw new AssertionError("allocating output");
        if (Jzstd.decompress(frame, destination) != source.length || !Arrays.equals(source, destination)) {
            throw new AssertionError("direct output");
        }
    }

    @TearDown(Level.Trial)
    public void checkOutput() {
        if (!Arrays.equals(source, destination)) throw new AssertionError("timed output");
    }

    @Benchmark public int direct() { return Jzstd.decompress(frame, destination); }
    @Benchmark public byte[] allocating() { return Jzstd.decompress(frame); }
    @Benchmark public int copyControl() {
        System.arraycopy(source, 0, destination, 0, source.length);
        return destination.length;
    }
}
