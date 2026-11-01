/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

package org.openjdk.bench.vm.compiler;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import javax.crypto.Cipher;
import javax.crypto.spec.ChaCha20ParameterSpec;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.BenchmarkMode;
import org.openjdk.jmh.annotations.Fork;
import org.openjdk.jmh.annotations.Level;
import org.openjdk.jmh.annotations.Measurement;
import org.openjdk.jmh.annotations.Mode;
import org.openjdk.jmh.annotations.OutputTimeUnit;
import org.openjdk.jmh.annotations.Param;
import org.openjdk.jmh.annotations.Scope;
import org.openjdk.jmh.annotations.Setup;
import org.openjdk.jmh.annotations.State;
import org.openjdk.jmh.annotations.Warmup;

@State(Scope.Thread)
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(3)
public class CommonIntrinsics {
    @Param({"64", "4096"})
    public int length;

    private byte[] input;
    private byte[] output;
    private int[] integers;
    private MessageDigest sha256;
    private MessageDigest sha3;
    private Cipher aes;
    private Cipher chacha;
    private BigInteger x;
    private BigInteger y;
    private BigInteger modulus;
    private final BigInteger exponent = BigInteger.valueOf(65537);

    @Setup(Level.Trial)
    public void setup() throws Exception {
        Random random = new Random(42);
        input = new byte[length];
        output = new byte[length];
        random.nextBytes(input);
        integers = new int[length / 4];
        for (int i = 0; i < integers.length; i++) {
            integers[i] = random.nextInt();
        }
        sha256 = MessageDigest.getInstance("SHA-256");
        sha3 = MessageDigest.getInstance("SHA3-256");
        aes = Cipher.getInstance("AES/CTR/NoPadding");
        aes.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(new byte[32], "AES"),
                 new IvParameterSpec(new byte[16]));
        chacha = Cipher.getInstance("ChaCha20");
        chacha.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(new byte[32], "ChaCha20"),
                    new ChaCha20ParameterSpec(new byte[12], 1));
        int bits = Math.min(length * 8, 4096);
        x = new BigInteger(bits, random).setBit(bits - 1);
        y = new BigInteger(bits, random).setBit(bits - 1);
        modulus = new BigInteger(bits, random).setBit(bits - 1).setBit(0);
    }

    @Benchmark
    public byte[] sha256() {
        return sha256.digest(input);
    }

    @Benchmark
    public byte[] sha3() {
        return sha3.digest(input);
    }

    @Benchmark
    public int aesCtr() throws Exception {
        return aes.update(input, 0, input.length, output, 0);
    }

    @Benchmark
    public int chacha20() throws Exception {
        return chacha.update(input, 0, input.length, output, 0);
    }

    @Benchmark
    public BigInteger multiply() {
        return x.multiply(y);
    }

    @Benchmark
    public BigInteger modPow() {
        return x.modPow(exponent, modulus);
    }

    @Benchmark
    public int hashBytes() {
        return Arrays.hashCode(input);
    }

    @Benchmark
    public int hashInts() {
        return Arrays.hashCode(integers);
    }
}
