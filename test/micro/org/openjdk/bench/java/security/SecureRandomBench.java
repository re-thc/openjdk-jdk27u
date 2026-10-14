/*
 * Copyright Amazon.com Inc. or its affiliates. All Rights Reserved.
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
 *
 */

package org.openjdk.bench.java.security;

import org.openjdk.jmh.annotations.*;

import java.security.SecureRandom;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(value = 3)
@State(Scope.Thread)
public class SecureRandomBench {

    // The default algorithm on Linux and macOS is NativePRNG. Each thread has
    // a SecureRandom of its own, but they share the state of the NativePRNG.
    private SecureRandom random;
    private byte[] bytes16;
    private byte[] bytes1024;

    @Setup
    public void setup() {
        random = new SecureRandom();
        bytes16 = new byte[16];
        bytes1024 = new byte[1024];
    }

    @Benchmark
    public SecureRandom create() throws Exception {
        return new SecureRandom();
    }

    @Benchmark
    public byte[] nextBytes16() {
        random.nextBytes(bytes16);
        return bytes16;
    }

    @Benchmark
    public byte[] nextBytes1024() {
        random.nextBytes(bytes1024);
        return bytes1024;
    }

    @Benchmark
    public int nextInt() {
        return random.nextInt();
    }

    // A request now and then: each one comes after the bytes that NativePRNG
    // buffered for an earlier one have expired, which is after 100 ms.

    @State(Scope.Thread)
    public static class Idle {
        @Setup(Level.Invocation)
        public void idle() throws InterruptedException {
            Thread.sleep(110);
        }
    }

    @Benchmark
    @BenchmarkMode(Mode.SampleTime)
    @Warmup(iterations = 1, time = 4)
    @Measurement(iterations = 10, time = 4)
    public byte[] nextBytes16Sparse(Idle idle) {
        random.nextBytes(bytes16);
        return bytes16;
    }

    // The same with all the processors the JVM can use, to measure how
    // the threads wait for each other.

    @Benchmark
    @Threads(Threads.MAX)
    public byte[] nextBytes16Parallel() {
        random.nextBytes(bytes16);
        return bytes16;
    }

    @Benchmark
    @Threads(Threads.MAX)
    public byte[] nextBytes1024Parallel() {
        random.nextBytes(bytes1024);
        return bytes1024;
    }

    @Benchmark
    @Threads(Threads.MAX)
    public int nextIntParallel() {
        return random.nextInt();
    }
}
