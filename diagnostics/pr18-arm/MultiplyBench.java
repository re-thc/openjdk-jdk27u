package bench;

import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

@State(Scope.Thread)
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 3, time = 500, timeUnit = TimeUnit.MILLISECONDS)
@Measurement(iterations = 5, time = 500, timeUnit = TimeUnit.MILLISECONDS)
@Fork(1)
public class MultiplyBench {
    @Param({"17", "65", "1024", "4099"}) public int length;
    @Param({"0", "1"}) public int offset;
    private long[] longs, otherLongs, resultLongs;
    private int[] ints, otherInts, resultInts, secondInts;
    private byte[] bytes, otherBytes, resultBytes, secondBytes;
    private short[] shorts, otherShorts, resultShorts, secondShorts;
    private int factor = -104729;

    @Setup public void setup() {
        int size = length + offset;
        longs = new long[size]; otherLongs = new long[size]; resultLongs = new long[size];
        ints = new int[size]; otherInts = new int[size]; resultInts = new int[size]; secondInts = new int[size];
        bytes = new byte[size]; otherBytes = new byte[size]; resultBytes = new byte[size]; secondBytes = new byte[size];
        shorts = new short[size]; otherShorts = new short[size]; resultShorts = new short[size]; secondShorts = new short[size];
        for (int i = 0; i < size; i++) {
            longs[i] = i * 0x1234_5678_9abcl + 0x1020_3040_5060_7080L;
            otherLongs[i] = i * -0x3344_5566_7788L + 0x7fff_0000_1234_5678L;
            ints[i] = i * 0x12345 - 0x5678_9abc; otherInts[i] = 0x1357_2468 - i * 0x54321;
            bytes[i] = (byte) ints[i]; otherBytes[i] = (byte) otherInts[i];
            shorts[i] = (short) ints[i]; otherShorts[i] = (short) otherInts[i];
        }
    }

    @Benchmark public long fourLongs() {
        for (int i = offset; i < offset + length; i++) {
            long x = longs[i]; resultLongs[i] = x * x * x * x;
        }
        return resultLongs[offset + length - 1];
    }

    @Benchmark public long differentLongs() {
        for (int i = offset; i < offset + length; i++) {
            long x = longs[i]; resultLongs[i] = x * x * x * otherLongs[i];
        }
        return resultLongs[offset + length - 1];
    }

    @Benchmark public int intBroadcast() {
        for (int i = offset; i < offset + length; i++) {
            resultInts[i] = factor * ints[i]; secondInts[i] = factor * otherInts[i];
        }
        return resultInts[offset + length - 1] + secondInts[offset + length - 1];
    }

    @Benchmark public int byteBroadcast() {
        for (int i = offset; i < offset + length; i++) {
            resultBytes[i] = (byte) (factor * bytes[i]); secondBytes[i] = (byte) (factor * otherBytes[i]);
        }
        return resultBytes[offset + length - 1] + secondBytes[offset + length - 1];
    }

    @Benchmark public int shortBroadcast() {
        for (int i = offset; i < offset + length; i++) {
            resultShorts[i] = (short) (factor * shorts[i]); secondShorts[i] = (short) (factor * otherShorts[i]);
        }
        return resultShorts[offset + length - 1] + secondShorts[offset + length - 1];
    }
}
