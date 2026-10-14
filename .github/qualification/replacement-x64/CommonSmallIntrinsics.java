package org.openjdk.bench.vm.compiler;

import java.util.Arrays;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

@State(Scope.Thread)
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(3)
public class CommonSmallIntrinsics {
    @Param({"0", "1", "16", "31", "32", "64", "65537"})
    public int length;
    private byte[] bytes;
    private int[] ints;
    private long value = 0x9876543210fedcbaL;

    @Setup(Level.Trial)
    public void setup() {
        bytes = new byte[length];
        ints = new int[length];
        for (int i = 0; i < length; i++) {
            bytes[i] = (byte) (i * 31 + 1);
            ints[i] = i * 31 + 1;
        }
    }

    @Benchmark public int hashBytes() { return Arrays.hashCode(bytes); }
    @Benchmark public int hashInts() { return Arrays.hashCode(ints); }
    @Benchmark public int bitCount() { return Long.bitCount(value); }
}
