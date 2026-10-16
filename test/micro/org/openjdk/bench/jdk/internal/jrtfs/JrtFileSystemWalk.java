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
package org.openjdk.bench.jdk.internal.jrtfs;

import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.BenchmarkMode;
import org.openjdk.jmh.annotations.Fork;
import org.openjdk.jmh.annotations.Measurement;
import org.openjdk.jmh.annotations.Mode;
import org.openjdk.jmh.annotations.OutputTimeUnit;
import org.openjdk.jmh.annotations.Scope;
import org.openjdk.jmh.annotations.Setup;
import org.openjdk.jmh.annotations.State;
import org.openjdk.jmh.annotations.Warmup;

import java.io.IOException;
import java.net.URI;
import java.nio.file.DirectoryStream;
import java.nio.file.FileSystem;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.concurrent.TimeUnit;
import java.util.stream.Stream;

/**
 * Lists and walks jrt module and package directories.
 * Warm benchmarks reuse image nodes; cold benchmarks walk once in a fresh JVM.
 */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.MICROSECONDS)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(value = 3)
@State(Scope.Benchmark)
public class JrtFileSystemWalk {

    private FileSystem jrt;

    @Setup
    public void setup() {
        jrt = FileSystems.getFileSystem(URI.create("jrt:/"));
    }

    private long list(String dir) throws IOException {
        long count = 0;
        try (DirectoryStream<Path> children = Files.newDirectoryStream(jrt.getPath(dir))) {
            for (Path child : children) {
                count++;
            }
        }
        return count;
    }

    private long walk(String dir, int depth) throws IOException {
        try (Stream<Path> paths = Files.walk(jrt.getPath(dir), depth)) {
            return paths.count();
        }
    }

    @Benchmark
    public long listPackages() throws IOException {
        return list("/packages");
    }

    @Benchmark
    public long listModules() throws IOException {
        return list("/modules");
    }

    @Benchmark
    public long walkPackages() throws IOException {
        return walk("/packages", Integer.MAX_VALUE);
    }

    @Benchmark
    public long walkModules() throws IOException {
        return walk("/modules", 2);
    }

    @Benchmark
    @BenchmarkMode(Mode.SingleShotTime)
    @Warmup(iterations = 0)
    @Measurement(iterations = 1)
    @Fork(value = 20)
    public long coldWalkPackages() throws IOException {
        return walk("/packages", Integer.MAX_VALUE);
    }

    @Benchmark
    @BenchmarkMode(Mode.SingleShotTime)
    @Warmup(iterations = 0)
    @Measurement(iterations = 1)
    @Fork(value = 20)
    public long coldWalkModules() throws IOException {
        return walk("/modules", 2);
    }
}
