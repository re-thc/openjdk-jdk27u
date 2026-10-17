/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 */
package qualification;

import dev.jzstd.Jzstd;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.lang.management.ManagementFactory;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.HexFormat;
import java.util.Objects;
import java.util.Properties;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import jdk.incubator.vector.ByteVector;
import jdk.incubator.vector.VectorOperators;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.BenchmarkParams;

/** Separate qualification harness; never modifies the codec or its tuning. */
@BenchmarkMode(Mode.Throughput)
@OutputTimeUnit(TimeUnit.SECONDS)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(1)
public class BoundsQualification {
    static final String[] KINDS = {"source", "periodic", "lowAlphabet", "random"};
    static final int[] SIZES = {65536, 1048576};

    static String sha(byte[] bytes) throws Exception {
        return HexFormat.of().formatHex(MessageDigest.getInstance("SHA-256").digest(bytes));
    }

    static byte[] input(String kind, int size) {
        byte[] result = new byte[size];
        switch (kind) {
            case "source" -> {
                byte[] line = ("public static int decode(byte[] source, int offset) { "
                        + "return source[offset] & 0xff; }\n").getBytes(StandardCharsets.UTF_8);
                for (int i = 0; i < size; i += line.length)
                    System.arraycopy(line, 0, result, i, Math.min(line.length, size - i));
            }
            case "periodic" -> {
                new Random(0x5A17).nextBytes(result);
                for (int i = 65536; i < size; i += 65536)
                    System.arraycopy(result, 0, result, i, Math.min(65536, size - i));
            }
            case "lowAlphabet" -> {
                Random random = new Random(0x10A1FA8E7L);
                for (int i = 0; i < size; i++) result[i] = (byte) ('a' + random.nextInt(8));
            }
            case "random" -> new Random(0xC0FFEE).nextBytes(result);
            default -> throw new IllegalArgumentException(kind);
        }
        return result;
    }

    @State(Scope.Thread)
    public static class Codec {
        @Param({"source", "periodic", "lowAlphabet", "random"}) public String kind;
        @Param({"65536", "1048576"}) public int size;
        byte[] input, frame, output, compressed, allocated;
        int compressedSize, decodedSize = -1, iteration;

        @Setup(Level.Iteration) public void iterationStart() {
            System.out.println("qualification-iteration=" + (++iteration) + " uptime-ms="
                    + ManagementFactory.getRuntimeMXBean().getUptime());
        }

        @Setup(Level.Trial)
        public void setup() throws Exception {
            Path root = Path.of(System.getProperty("qualification.corpus"));
            Properties hashes = new Properties();
            try (var in = Files.newInputStream(root.resolve("manifest.properties"))) { hashes.load(in); }
            String stem = kind + "-" + size;
            input = Files.readAllBytes(root.resolve(stem + ".input"));
            frame = Files.readAllBytes(root.resolve(stem + ".zst"));
            require(input.length == size && sha(input).equals(hashes.getProperty(stem + ".input")));
            require(sha(frame).equals(hashes.getProperty(stem + ".zst")));
            output = new byte[size];
            compressed = new byte[Jzstd.compressBound(size)];
            require(Arrays.equals(input, Jzstd.decompress(frame)));
        }

        @TearDown(Level.Trial) public void jmhCheck(BenchmarkParams params) {
            String method = params.getBenchmark();
            if (method.endsWith(".decompressDirect")) require(decodedSize == size);
            if (method.endsWith(".decompressAllocated")) require(Arrays.equals(input, allocated));
            if (method.endsWith(".compressControl")) require(compressedSize > 0);
            check();
        }

        public void check() {
            // Validate outside timing, including the last direct decode result.
            if (decodedSize >= 0) require(decodedSize == size && Arrays.equals(input, output));
            require(Jzstd.decompress(frame, output) == size && Arrays.equals(input, output));
            if (compressedSize != 0)
                require(Arrays.equals(input, Jzstd.decompress(compressed, 0, compressedSize)));
            Jzstd.releaseCachedResources();
        }
    }

    @Benchmark public int decompressDirect(Codec c) { return c.decodedSize = Jzstd.decompress(c.frame, c.output); }
    @Benchmark public byte[] decompressAllocated(Codec c) { return c.allocated = Jzstd.decompress(c.frame); }
    @Benchmark public int compressControl(Codec c) {
        return c.compressedSize = Jzstd.compress(c.input, 0, c.size, c.compressed, 0, c.compressed.length, 3, false);
    }

    @State(Scope.Thread)
    public static class Buffers {
        @Param({"4096", "65536"}) public int size;
        byte[] source, target;
        long[] packed;
        int index = 17;
        int marker;
        int iteration;
        int result;

        @Setup(Level.Iteration) public void iterationStart() {
            System.out.println("qualification-iteration=" + (++iteration) + " uptime-ms="
                    + ManagementFactory.getRuntimeMXBean().getUptime());
        }

        @Setup public void setup() {
            source = new byte[size];
            target = new byte[size];
            new Random(0x12345678).nextBytes(source);
            packed = new long[size / 32];
            for (int i = 0; i < packed.length; i++) packed[i] = i % 17;
        }

        @TearDown public void check(BenchmarkParams params) {
            String operation = params.getBenchmark().substring(params.getBenchmark().lastIndexOf('.') + 1);
            switch (operation) {
                case "vectorCursor" -> {
                    byte[] expected = new byte[size];
                    int literal = 0;
                    for (int i = 0; i < packed.length; i++) {
                        System.arraycopy(source, literal, expected, i & 15, 16);
                        literal += (int) packed[i];
                    }
                    require(result == literal && Arrays.equals(expected, target));
                }
                case "scalarSubrange" -> {
                    int expected = 0;
                    for (long index : packed) expected += source[(int) index];
                    require(result == expected);
                }
                case "invariantVector" -> {
                    byte sum = 0;
                    for (int i = 0; i < 16; i++) sum += source[index + i];
                    require(result == sum * packed.length);
                }
                case "scalarMap" -> {
                    for (int i = 0; i < size - 15; i++) require(target[i] == (byte) (source[i] + 1));
                }
                case "nearMiss" -> {
                    for (int i = 0; i < 16; i++) require(target[i] == source[index + i]);
                }
                case "arrayCopyControl" -> require(Arrays.equals(source, target));
                default -> throw new AssertionError(operation);
            }
        }
    }

    // Direct duplicate target, with a running cursor and repeated vector copies.
    @Benchmark public int vectorCursor(Buffers b) {
        int literal = 0;
        byte[] source = b.source, target = b.target;
        int wild = source.length - 32;
        for (int i = 0; i < b.packed.length; i++) {
            int ll = (int) b.packed[i] & 0x1ffff;
            if (literal + ll <= wild && ll <= 16) {
                int bound = source.length - 15;
                if (bound < 0 || Integer.compareUnsigned(literal, bound) >= 0) throw new AssertionError();
                ByteVector.fromArray(ByteVector.SPECIES_128, source, literal).intoArray(target, i & 15);
            }
            literal += ll;
        }
        return b.result = literal;
    }

    // The matcher also accepts scalar subranges. Its actual hit must be checked.
    @Benchmark public int scalarSubrange(Buffers b) {
        int sum = 0, bound = b.source.length - 15;
        for (int i = 0; i < b.packed.length; i++) {
            int index = (int) b.packed[i];
            if (bound < 0 || Integer.compareUnsigned(index, bound) >= 0) throw new AssertionError();
            sum += b.source[Objects.checkIndex(index, bound)];
        }
        return b.result = sum;
    }

    // Repeated invariant load; an observable independent store lies between guards.
    @Benchmark public int invariantVector(Buffers b) {
        int sum = 0, bound = b.source.length - 15, index = b.index;
        for (int i = 0; i < b.packed.length; i++) {
            if (Integer.compareUnsigned(index, bound) >= 0) return -1;
            b.marker += i & 1;
            if (bound < 0) return -2;
            sum += ByteVector.fromArray(ByteVector.SPECIES_128, b.source, index)
                    .reduceLanes(VectorOperators.ADD);
        }
        return b.result = sum;
    }

    // Scalar loop suitable for predication, RCE, and automatic vectorization.
    @Benchmark public byte scalarMap(Buffers b) {
        byte[] source = b.source, target = b.target;
        int bound = source.length - 15;
        for (int i = 0; i < bound; i++) {
            if (Integer.compareUnsigned(i, bound) >= 0) throw new AssertionError();
            target[i] = (byte) (source[Objects.checkIndex(i, bound)] + 1);
        }
        return target[bound - 1];
    }

    @Benchmark public byte nearMiss(Buffers b) {
        int bound = b.source.length - 14;
        int index = b.index;
        if (bound < 0 || Integer.compareUnsigned(index, bound) >= 0) throw new AssertionError();
        ByteVector.fromArray(ByteVector.SPECIES_128, b.source, index).intoArray(b.target, 0);
        return b.target[0];
    }

    @Benchmark public byte arrayCopyControl(Buffers b) {
        System.arraycopy(b.source, 0, b.target, 0, b.source.length);
        return b.target[b.source.length - 1];
    }

    static void require(boolean ok) { if (!ok) throw new AssertionError(); }
    static void rejects(String label, Runnable action) {
        try { action.run(); } catch (RuntimeException expected) {
            System.out.println("qualification-rejection=" + label + ":" + expected.getClass().getName());
            return;
        }
        throw new AssertionError("malformed input accepted");
    }

    static void verify(Codec c) {
        require(Jzstd.decompress(c.frame, c.output) == c.size && Arrays.equals(c.input, c.output));
        require(Arrays.equals(c.input, Jzstd.decompress(c.frame)));
        byte[] canary = new byte[c.size + 64];
        Arrays.fill(canary, (byte) 0x5a);
        require(Jzstd.decompress(c.frame, 0, c.frame.length, canary, 32, c.size) == c.size);
        require(Arrays.equals(c.input, Arrays.copyOfRange(canary, 32, 32 + c.size)));
        for (int i = 0; i < 32; i++) require(canary[i] == 0x5a && canary[32 + c.size + i] == 0x5a);
        rejects("truncated", () -> Jzstd.decompress(Arrays.copyOf(c.frame, c.frame.length - 1)));
        rejects("short-output", () -> Jzstd.decompress(c.frame, new byte[c.size - 1]));
        byte[] badMagic = c.frame.clone(); badMagic[0] ^= 1;
        rejects("bad-magic", () -> Jzstd.decompress(badMagic));
        rejects("overlap", () -> Jzstd.decompress(c.frame, c.frame)); // Public API rejects overlapping ranges.
        require(Arrays.equals(c.input, Jzstd.decompress(Jzstd.compress(c.input, 3, false))));
    }

    public static void main(String[] args) throws Exception {
        String action = args[0];
        Path root = Path.of(args[1]);
        System.setProperty("qualification.corpus", root.toAbsolutePath().toString());
        if (action.equals("prepare")) {
            Files.createDirectory(root); // One creation; never regenerate candidate frames.
            Properties hashes = new Properties();
            for (String kind : KINDS) for (int size : SIZES) {
                byte[] data = input(kind, size), frame = Jzstd.compress(data, 3, false);
                require(Arrays.equals(data, Jzstd.decompress(frame)));
                String stem = kind + "-" + size;
                Files.write(root.resolve(stem + ".input"), data);
                Files.write(root.resolve(stem + ".zst"), frame);
                hashes.setProperty(stem + ".input", sha(data));
                hashes.setProperty(stem + ".zst", sha(frame));
            }
            try (var out = Files.newOutputStream(root.resolve("manifest.properties"))) {
                hashes.store(out, "Pinned codec, level 3, checksum false; baseline generated");
            }
        } else if (action.equals("verify")) {
            for (String kind : KINDS) for (int size : SIZES) {
                Codec c = new Codec(); c.kind = kind; c.size = size; c.setup(); verify(c); c.check();
            }
            BoundsQualification q = new BoundsQualification();
            for (int size : new int[] {4096, 65536}) {
                Buffers b = new Buffers(); b.size = size; b.setup();
                byte[] expected = b.target.clone();
                int literal = 0, scalar = 0;
                for (int i = 0; i < b.packed.length; i++) {
                    System.arraycopy(b.source, literal, expected, i & 15, 16);
                    scalar += b.source[(int) b.packed[i]];
                    literal += (int) b.packed[i];
                }
                require(q.vectorCursor(b) == literal && Arrays.equals(expected, b.target));
                require(q.scalarSubrange(b) == scalar);
                byte sum = 0;
                for (int i = 0; i < 16; i++) sum += b.source[b.index + i];
                require(q.invariantVector(b) == sum * b.packed.length);
                q.scalarMap(b);
                for (int i = 0; i < size - 15; i++) require(b.target[i] == (byte) (b.source[i] + 1));
                q.nearMiss(b);
                for (int i = 0; i < 16; i++) require(b.target[i] == b.source[b.index + i]);
                q.arrayCopyControl(b); require(Arrays.equals(b.source, b.target));
            }
        } else if (action.equals("diagnostic")) {
            // Invocation count is fixed. Caller must impose the documented wall limit.
            Codec c = new Codec(); c.kind = args[2]; c.size = Integer.parseInt(args[3]); c.setup();
            BoundsQualification q = new BoundsQualification();
            Buffers b = new Buffers(); b.size = 4096; b.setup();
            long result = 0;
            for (int i = 0; i < 20000; i++) {
                result += q.decompressDirect(c) + q.vectorCursor(b) + q.scalarSubrange(b)
                        + q.invariantVector(b) + q.scalarMap(b) + q.nearMiss(b);
            }
            verify(c); c.check(); System.out.println("qualification-checksum=" + result);
        } else throw new IllegalArgumentException(action);
        System.out.println("qualification-" + action + "-ok");
    }
}
