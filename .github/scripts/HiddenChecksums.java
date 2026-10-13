package work.checksums;

import java.util.Random;
import java.util.concurrent.TimeUnit;
import java.util.zip.CRC32;
import org.openjdk.jmh.annotations.*;
import sun.security.krb5.internal.crypto.crc32;

@State(Scope.Thread)
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
public class HiddenChecksums {
    @Param({"16", "32", "64", "1024", "65536"})
    public int size;
    private byte[] input;
    private final PNGTableCRC oldPNG = new PNGTableCRC();
    private final CRC32 newPNG = new CRC32();
    private int seed;

    @Setup
    public void setup() {
        input = new byte[size];
        Random random = new Random(12345);
        random.nextBytes(input);
        seed = random.nextInt();
    }

    @Benchmark
    public long pngOld() {
        oldPNG.reset();
        oldPNG.update(input, 0, input.length);
        return oldPNG.getValue() & 0xffffffffL;
    }

    @Benchmark
    public long pngNew() {
        newPNG.reset();
        newPNG.update(input, 0, input.length);
        return newPNG.getValue();
    }

    @Benchmark
    public int rawOld() {
        return PNGTableCRC.raw(seed, input, input.length);
    }

    @Benchmark
    public int rawNew() {
        return crc32.byte2crc32sum(seed, input, input.length);
    }

    @Benchmark
    public long pngScalarOld() {
        oldPNG.reset();
        oldPNG.update(0x93);
        return oldPNG.getValue() & 0xffffffffL;
    }

    @Benchmark
    public long pngScalarNew() {
        newPNG.reset();
        newPNG.update(0x93);
        return newPNG.getValue();
    }
}

final class PNGTableCRC {

    private static final int[] crcTable = new int[256];
    private int crc = 0xffffffff;

    static {
        // Initialize CRC table
        for (int n = 0; n < 256; n++) {
            int c = n;
            for (int k = 0; k < 8; k++) {
                if ((c & 1) == 1) {
                    c = 0xedb88320 ^ (c >>> 1);
                } else {
                    c >>>= 1;
                }

                crcTable[n] = c;
            }
        }
    }

    PNGTableCRC() {}

    void reset() {
        crc = 0xffffffff;
    }

    void update(byte[] data, int off, int len) {
        int c = crc;
        for (int n = 0; n < len; n++) {
            c = crcTable[(c ^ data[off + n]) & 0xff] ^ (c >>> 8);
        }
        crc = c;
    }

    void update(int data) {
        crc = crcTable[(crc ^ data) & 0xff] ^ (crc >>> 8);
    }

    static int raw(int seed, byte[] data, int size) {
        for (int i = 0; i < size; i++) {
            seed = (seed >>> 8) ^ crcTable[(seed ^ data[i]) & 255];
        }
        return seed;
    }

    int getValue() {
        return crc ^ 0xffffffff;
    }
}


