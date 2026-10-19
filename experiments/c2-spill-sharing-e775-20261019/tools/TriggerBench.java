package experiment;

import java.util.Random;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

@BenchmarkMode(Mode.Throughput)
@OutputTimeUnit(TimeUnit.SECONDS)
@State(Scope.Thread)
public class TriggerBench {
    long[] values = new long[24];
    int[] a = new int[1024], b = new int[1024], c = new int[1024], d = new int[1024];
    long expected;

    @Setup(Level.Trial)
    public void setup() {
        Random random = new Random(812341);
        for (int i = 0; i < 1024; i++) {
            a[i] = random.nextInt(); b[i] = random.nextInt();
            c[i] = random.nextInt(); d[i] = random.nextInt();
        }
        for (int i = 0; i < values.length; i++) values[i] = random.nextLong();
        expected = TestSharedSpillSharingTrigger.reference(values, a, b, c, d);
        checkOutput();
    }

    @TearDown(Level.Trial)
    public void checkOutput() {
        if (TestSharedSpillSharingTrigger.kernel(values, a, b, c, d) != expected) {
            throw new AssertionError("trigger output");
        }
    }

    @Benchmark public long kernel() {
        return TestSharedSpillSharingTrigger.kernel(values, a, b, c, d);
    }
}
