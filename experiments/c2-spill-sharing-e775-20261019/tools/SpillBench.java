package experiment;

import java.util.Arrays;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

@BenchmarkMode(Mode.Throughput)
@OutputTimeUnit(TimeUnit.SECONDS)
@State(Scope.Thread)
public class SpillBench {
    long[] table = new long[256], seeds = new long[8], destination = new long[512];
    byte[] data = new byte[7];
    long expected;

    @Setup(Level.Trial)
    public void setup() {
        Random random = new Random(987654321);
        random.nextBytes(data);
        for (int i = 0; i < table.length; i++) table[i] = random.nextLong();
        for (int i = 0; i < seeds.length; i++) seeds[i] = random.nextLong();
        long[] oracle = new long[512];
        expected = TestSharedSpillLoads.reference(4, table, seeds, data, oracle, 512);
        if (TestSharedSpillLoads.kernel4(table, seeds, data, destination, 512) != expected ||
            !Arrays.equals(oracle, destination)) throw new AssertionError("kernel4 output");
    }

    @Benchmark public long kernel4() {
        return TestSharedSpillLoads.kernel4(table, seeds, data, destination, 512);
    }
}
