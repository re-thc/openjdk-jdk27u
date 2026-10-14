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
package org.openjdk.bench.java.util;

import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.BenchmarkMode;
import org.openjdk.jmh.annotations.Fork;
import org.openjdk.jmh.annotations.Measurement;
import org.openjdk.jmh.annotations.Mode;
import org.openjdk.jmh.annotations.OutputTimeUnit;
import org.openjdk.jmh.annotations.Param;
import org.openjdk.jmh.annotations.Scope;
import org.openjdk.jmh.annotations.Setup;
import org.openjdk.jmh.annotations.State;
import org.openjdk.jmh.annotations.TearDown;
import org.openjdk.jmh.annotations.Warmup;
import org.openjdk.jmh.infra.Blackhole;

import java.io.IOException;
import java.io.OutputStream;
import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.lang.constant.ConstantDescs;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.spi.FileSystemProvider;
import java.util.Comparator;
import java.util.ServiceLoader;
import java.util.concurrent.TimeUnit;
import java.util.jar.JarEntry;
import java.util.jar.JarOutputStream;
import java.util.spi.ToolProvider;
import java.util.stream.Stream;

/**
 * Measures looking up the providers of a service, which the JDK and
 * frameworks do every time that they need one, for services with providers
 * in JAR files on a class path, in system modules, and without providers.
 *
 * <p>The cold benchmarks make the first lookup in a JVM, in a new fork each
 * time, as most programs only look up the providers of a service once.
 */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.MICROSECONDS)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(value = 3)
public class ServiceLoaderBench {

    /** A service that has providers in JAR files */
    public interface Service {
    }

    /** A service that has no providers anywhere */
    public interface Absent {
    }

    /// The providers of Service in JAR files of a URLClassLoader, one in each
    /// JAR file with its provider-configuration file.
    @State(Scope.Thread)
    public static class JarProviders {
        @Param({"5", "50"})
        public int jars;

        private Path dir;
        URLClassLoader loader;

        @Setup
        public void setup() throws IOException {
            dir = Files.createTempDirectory("ServiceLoaderBench");
            URL[] urls = new URL[jars];
            for (int i = 0; i < jars; i++) {
                Path jar = dir.resolve("provider" + i + ".jar");
                String name = "provider" + i + ".Provider";
                try (OutputStream out = Files.newOutputStream(jar);
                     JarOutputStream jos = new JarOutputStream(out)) {
                    jos.putNextEntry(new JarEntry("META-INF/services/" + Service.class.getName()));
                    jos.write(("# the provider of the JAR file " + i + "\n" + name + "\n")
                            .getBytes(StandardCharsets.UTF_8));
                    jos.closeEntry();
                    jos.putNextEntry(new JarEntry(name.replace('.', '/') + ".class"));
                    jos.write(providerBytes(name));
                    jos.closeEntry();
                }
                urls[i] = jar.toUri().toURL();
            }
            loader = new URLClassLoader(urls, ServiceLoaderBench.class.getClassLoader());
        }

        @TearDown
        public void tearDown() throws IOException {
            loader.close();
            try (Stream<Path> files = Files.walk(dir)) {
                files.sorted(Comparator.reverseOrder()).forEach(p -> p.toFile().delete());
            }
        }

        private static byte[] providerBytes(String name) {
            return ClassFile.of().build(ClassDesc.of(name), clb -> clb
                    .withFlags(ClassFile.ACC_PUBLIC | ClassFile.ACC_SUPER)
                    .withInterfaceSymbols(ClassDesc.of(Service.class.getName()))
                    .withMethodBody(ConstantDescs.INIT_NAME, ConstantDescs.MTD_void,
                            ClassFile.ACC_PUBLIC, cob -> cob
                                    .aload(0)
                                    .invokespecial(ConstantDescs.CD_Object,
                                            ConstantDescs.INIT_NAME, ConstantDescs.MTD_void)
                                    .return_()));
        }
    }

    /** Finds and creates the providers in the JAR files. */
    @Benchmark
    public void jarProviders(JarProviders state, Blackhole bh) {
        for (Service service : ServiceLoader.load(Service.class, state.loader)) {
            bh.consume(service);
        }
    }

    /**
     * Finds and creates the providers of ToolProvider, which are in system
     * modules, with the system class loader.
     */
    @Benchmark
    public void systemModuleProviders(Blackhole bh) {
        for (ToolProvider provider : ServiceLoader.load(ToolProvider.class,
                ClassLoader.getSystemClassLoader())) {
            bh.consume(provider);
        }
    }

    /**
     * Finds and creates the providers of FileSystemProvider, which are in
     * system modules, and in a provider-configuration file of java.base.
     */
    @Benchmark
    public void fileSystemProviders(Blackhole bh) {
        for (FileSystemProvider provider : ServiceLoader.load(FileSystemProvider.class,
                ClassLoader.getSystemClassLoader())) {
            bh.consume(provider);
        }
    }

    /** Looks for the providers of a service that has none, with the system class loader. */
    @Benchmark
    public boolean noProviders() {
        return ServiceLoader.load(Absent.class, ClassLoader.getSystemClassLoader())
                .iterator().hasNext();
    }

    @Benchmark
    @BenchmarkMode(Mode.SingleShotTime)
    @Warmup(iterations = 0)
    @Measurement(iterations = 1)
    @Fork(value = 20)
    public void coldFileSystemProviders(Blackhole bh) {
        fileSystemProviders(bh);
    }

    @Benchmark
    @BenchmarkMode(Mode.SingleShotTime)
    @Warmup(iterations = 0)
    @Measurement(iterations = 1)
    @Fork(value = 20)
    public boolean coldNoProviders() {
        return noProviders();
    }

    @Benchmark
    @BenchmarkMode(Mode.SingleShotTime)
    @Warmup(iterations = 0)
    @Measurement(iterations = 1)
    @Fork(value = 20)
    public void coldJarProviders(JarProviders state, Blackhole bh) {
        jarProviders(state, bh);
    }
}
