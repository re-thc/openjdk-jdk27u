package org.openjdk.bench.vm.compiler;
import java.math.BigInteger;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;
@State(Scope.Thread)
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
public class CommonBigIntegerCalls {
    @Param({"512", "4096"}) public int bits;
    private BigInteger x, y, modulus;
    private BigInteger exponent = BigInteger.valueOf(65537);
    @Setup public void setup() {
        Random random = new Random(42);
        x = new BigInteger(bits, random).setBit(bits-1);
        y = new BigInteger(bits, random).setBit(bits-1);
        modulus = new BigInteger(bits, random).setBit(bits-1).setBit(0);
    }
    @Benchmark public BigInteger multiply() { return x.multiply(y); }
    @Benchmark public BigInteger modPow() { return x.modPow(exponent, modulus); }
}
