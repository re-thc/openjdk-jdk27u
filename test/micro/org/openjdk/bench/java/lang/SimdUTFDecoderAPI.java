package org.openjdk.bench.java.lang;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;
import jdk.internal.access.JavaLangAccess;
import jdk.internal.access.SharedSecrets;
import org.openjdk.jmh.annotations.*;
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@State(Scope.Thread)
public class SimdUTFDecoderAPI {
    private static final JavaLangAccess JLA = SharedSecrets.getJavaLangAccess();
    @Param({"31", "128", "255", "4096"}) public int size;
    @Param({"ascii", "bmp", "malformed"}) public String kind;
    private byte[] input;
    private char[] output;
    private int count;
    @Setup public void setup() {
        int capacity = size;
        switch (kind) {
            case "ascii" -> input = "a".repeat(size).getBytes(StandardCharsets.UTF_8);
            case "bmp" -> {
                String text = "漢".repeat(size / 3) + "a".repeat(size % 3);
                input = text.getBytes(StandardCharsets.UTF_8);
                capacity = text.length();
            }
            case "malformed" -> {
                input = new byte[size];
                Arrays.fill(input, (byte)0x80);
            }
            default -> throw new AssertionError(kind);
        }
        output = new char[capacity];
        count = Math.min(input.length, output.length);
        int result = JLA.decodeASCII(input, 0, output, 0, count);
        if (result != (kind.equals("ascii") ? size : 0)) throw new AssertionError(result);
    }
    @Benchmark public int asciiPrefix() {
        return JLA.decodeASCII(input, 0, output, 0, count);
    }
}
