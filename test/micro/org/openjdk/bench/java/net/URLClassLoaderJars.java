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
package org.openjdk.bench.java.net;

import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.BenchmarkMode;
import org.openjdk.jmh.annotations.Fork;
import org.openjdk.jmh.annotations.Level;
import org.openjdk.jmh.annotations.Measurement;
import org.openjdk.jmh.annotations.Mode;
import org.openjdk.jmh.annotations.OperationsPerInvocation;
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
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Comparator;
import java.util.concurrent.TimeUnit;
import java.util.jar.JarEntry;
import java.util.jar.JarOutputStream;
import java.util.stream.Stream;

/**
 * Measures finding resources and loading classes with a URLClassLoader over
 * many JAR files, as a Spring Boot or application server class path is. Each
 * JAR file has the classes of a package of its own, and the lookup of a name
 * has to find the right one, or to see that none has it.
 */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(value = 3)
public class URLClassLoaderJars {

    // The classes of each JAR file
    private static final int CLASSES = 50;

    // The classes that loadClasses loads, from JAR files all along the class path
    private static final int LOADED = 100;

    /**
     * The JAR files of the benchmarks. The states that extend it have
     * different lifetimes for the loaders.
     */
    @State(Scope.Thread)
    public abstract static class JarFiles {
        @Param({"10", "100", "400"})
        public int jars;

        Path dir;
        URL[] urls;
        // the name of a class file of each JAR file, and of one that it doesn't have
        String[] resourceNames;
        String[] missingNames;

        void createJars() throws IOException {
            dir = Files.createTempDirectory("URLClassLoaderJars");
            urls = new URL[jars];
            resourceNames = new String[jars];
            missingNames = new String[jars];
            for (int i = 0; i < jars; i++) {
                Path jar = dir.resolve("lib" + i + ".jar");
                try (OutputStream out = Files.newOutputStream(jar);
                     JarOutputStream jos = new JarOutputStream(out)) {
                    for (int j = 0; j < CLASSES; j++) {
                        jos.putNextEntry(new JarEntry("lib" + i + "/C" + j + ".class"));
                        jos.write(classBytes("lib" + i + ".C" + j));
                        jos.closeEntry();
                    }
                }
                urls[i] = jar.toUri().toURL();
                resourceNames[i] = "lib" + i + "/C" + (i % CLASSES) + ".class";
                missingNames[i] = "lib" + i + "/Missing.class";
            }
        }

        void deleteJars() throws IOException {
            try (Stream<Path> files = Files.walk(dir)) {
                files.sorted(Comparator.reverseOrder()).forEach(p -> p.toFile().delete());
            }
        }

        // opens the JAR files of the loader
        void openJars(URLClassLoader loader) {
            for (String name : resourceNames) {
                if (loader.findResource(name) == null) {
                    throw new IllegalStateException(name);
                }
            }
        }

        private static byte[] classBytes(String name) {
            return ClassFile.of().build(ClassDesc.of(name), clb -> clb
                    .withFlags(ClassFile.ACC_PUBLIC | ClassFile.ACC_SUPER)
                    .withMethodBody(ConstantDescs.INIT_NAME, ConstantDescs.MTD_void,
                            ClassFile.ACC_PUBLIC, cob -> cob
                                    .aload(0)
                                    .invokespecial(ConstantDescs.CD_Object,
                                            ConstantDescs.INIT_NAME, ConstantDescs.MTD_void)
                                    .return_()));
        }
    }

    /** A loader that the lookups use over and over, with its JAR files open. */
    @State(Scope.Thread)
    public static class Lookup extends JarFiles {
        URLClassLoader loader;
        int next;

        @Setup(Level.Trial)
        public void setup() throws IOException {
            createJars();
            loader = new URLClassLoader(urls, null);
            openJars(loader);
        }

        @TearDown(Level.Trial)
        public void tearDown() throws IOException {
            loader.close();
            deleteJars();
        }

        int nextJar() {
            if (++next == jars) {
                next = 0;
            }
            return next;
        }
    }

    /**
     * A loader for each invocation, as a class can only be loaded once. Its
     * JAR files are open, so that what is measured are the lookups and
     * defining the classes.
     */
    @State(Scope.Thread)
    public static class FreshLoader extends JarFiles {
        URLClassLoader loader;

        @Setup(Level.Trial)
        public void setup() throws IOException {
            createJars();
        }

        @TearDown(Level.Trial)
        public void tearDown() throws IOException {
            deleteJars();
        }

        @Setup(Level.Invocation)
        public void openLoader() {
            loader = new URLClassLoader(urls, null);
            openJars(loader);
        }

        @TearDown(Level.Invocation)
        public void closeLoader() throws IOException {
            loader.close();
        }
    }

    /** Finds a resource in one of the JAR files after the other, in turn. */
    @Benchmark
    public URL findResourceHit(Lookup state) {
        return state.loader.findResource(state.resourceNames[state.nextJar()]);
    }

    /** Looks for a resource that no JAR file has, which tries them all. */
    @Benchmark
    public URL findResourceMiss(Lookup state) {
        return state.loader.findResource("other/Missing.class");
    }

    /** Looks for a resource that is not in the directory of one of the JAR files, in turn. */
    @Benchmark
    public URL findResourceMissInPackage(Lookup state) {
        return state.loader.findResource(state.missingNames[state.nextJar()]);
    }

    /**
     * Loads classes from JAR files all along the class path, in the order
     * of the class path. This measures a single invocation, which loads
     * the classes with the lookups, defining and sharing the code source.
     */
    @Benchmark
    @BenchmarkMode(Mode.SingleShotTime)
    @OutputTimeUnit(TimeUnit.MICROSECONDS)
    @Warmup(iterations = 20)
    @Measurement(iterations = 30)
    @OperationsPerInvocation(LOADED)
    public void loadClasses(FreshLoader state, Blackhole bh) throws ClassNotFoundException {
        int jars = state.jars;
        for (int i = 0; i < LOADED; i++) {
            bh.consume(state.loader.loadClass("lib" + (i * jars / LOADED) + ".C" + (i % CLASSES)));
        }
    }
}
