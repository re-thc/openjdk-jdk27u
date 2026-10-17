/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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

import java.io.InputStream;
import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.lang.constant.ConstantDescs;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.ServiceLoader;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.jar.JarEntry;
import java.util.jar.JarOutputStream;
import java.util.zip.CRC32;
import java.util.zip.ZipFile;

// Prepared qualification source; not compiled/executed as part of the source audit.
// Fixtures are generated once outside every measured process.
public class ZipCacheQualification {
    static final int ENTRIES = 128, SIZE = 4096, JARS = 32;
    static final byte[][] DATA = new byte[ENTRIES][];
    static final long[] CRC = new long[ENTRIES], PREFIX = new long[ENTRIES];
    static {
        for (int i = 0; i < ENTRIES; i++) {
            DATA[i] = new byte[SIZE];
            new Random(42L + i).nextBytes(DATA[i]);
            System.arraycopy(DATA[i], 0, DATA[i], 2048, 2048);
            CRC32 crc = new CRC32();
            crc.update(DATA[i]); CRC[i] = crc.getValue();
            crc.reset(); crc.update(DATA[i], 0, 1024); PREFIX[i] = crc.getValue();
        }
    }
    static void put(JarOutputStream out, String name, byte[] bytes, boolean stored)
            throws Exception {
        JarEntry entry = new JarEntry(name);
        entry.setTime(0);
        if (stored) {
            CRC32 crc = new CRC32(); crc.update(bytes);
            entry.setMethod(JarEntry.STORED);
            entry.setSize(bytes.length); entry.setCrc(crc.getValue());
        }
        out.putNextEntry(entry); out.write(bytes); out.closeEntry();
    }
    static void prepare(Path dir) throws Exception {
        Files.createDirectories(dir);
        try (var out = new JarOutputStream(Files.newOutputStream(dir.resolve("data.jar")))) {
            for (int i = 0; i < ENTRIES; i++) put(out, "entry" + i, DATA[i], false);
        }
        for (int jar = 0; jar < JARS; jar++) {
            try (var out = new JarOutputStream(Files.newOutputStream(dir.resolve("lib" + jar + ".jar")))) {
                boolean stored = jar % 4 == 0;
                for (int k = 0; k < 4; k++) {
                    String name = "lib" + jar + ".C" + k;
                    byte[] bytes = ClassFile.of().build(ClassDesc.of(name), clb -> clb
                            .withFlags(ClassFile.ACC_PUBLIC | ClassFile.ACC_SUPER)
                            .withInterfaceSymbols(ClassDesc.of("java.lang.Runnable"))
                            .withMethodBody(ConstantDescs.INIT_NAME, ConstantDescs.MTD_void,
                                    ClassFile.ACC_PUBLIC, code -> code.aload(0)
                                            .invokespecial(ConstantDescs.CD_Object,
                                                    ConstantDescs.INIT_NAME, ConstantDescs.MTD_void)
                                            .return_())
                            .withMethodBody("run", ConstantDescs.MTD_void,
                                    ClassFile.ACC_PUBLIC, code -> code.return_()));
                    put(out, name.replace('.', '/') + ".class", bytes, stored);
                }
                put(out, "lib" + jar + "/data", DATA[jar], stored);
                put(out, "META-INF/services/java.lang.Runnable",
                        ("lib" + jar + ".C0\n").getBytes(StandardCharsets.UTF_8), stored);
            }
        }
        System.out.println("prepared");
    }
    static long consume(InputStream in, int index, boolean partial) throws Exception {
        byte[] bytes = partial ? in.readNBytes(1024) : in.readAllBytes();
        CRC32 crc = new CRC32(); crc.update(bytes);
        if (bytes.length != (partial ? 1024 : SIZE)
                || crc.getValue() != (partial ? PREFIX[index] : CRC[index])) {
            throw new AssertionError("Content differs: " + index);
        }
        return crc.getValue() + bytes.length;
    }
    static long serial(ZipFile zip, int count, boolean partial) throws Exception {
        long sum = 0;
        for (int i = 0; i < count; i++) {
            int index = i % ENTRIES;
            try (var in = zip.getInputStream(zip.getEntry("entry" + index))) {
                sum += consume(in, index, partial);
            }
        }
        return sum;
    }
    static long burst(ZipFile zip, int width) throws Exception {
        List<InputStream> streams = new ArrayList<>();
        try {
            for (int i = 0; i < width; i++) {
                streams.add(zip.getInputStream(zip.getEntry("entry" + i)));
            }
            long sum = 0;
            for (int i = 0; i < width; i++) sum += consume(streams.get(i), i, true);
            return sum;
        } finally {
            for (var in : streams) in.close();
        }
    }
    static long parallel(ZipFile zip, ExecutorService executor) throws Exception {
        CountDownLatch start = new CountDownLatch(1);
        List<Future<Long>> futures = new ArrayList<>();
        for (int worker = 0; worker < 4; worker++) {
            futures.add(executor.submit(() -> {
                start.await();
                return serial(zip, 1024, false);
            }));
        }
        start.countDown();
        long sum = 0;
        for (var future : futures) sum += future.get(); // propagate every worker failure
        return sum;
    }
    static long load(Path dir) throws Exception {
        URL[] urls = new URL[JARS];
        for (int i = 0; i < JARS; i++) urls[i] = dir.resolve("lib" + i + ".jar").toUri().toURL();
        long sum = 0;
        try (var loader = new URLClassLoader(urls, ClassLoader.getPlatformClassLoader())) {
            for (int i = 0; i < JARS; i++) {
                for (int k = 0; k < 4; k++) {
                    String name = "lib" + i + ".C" + k;
                    Class<?> type = loader.loadClass(name);
                    if (type.getClassLoader() != loader || !Runnable.class.isAssignableFrom(type)) {
                        throw new AssertionError("Wrong class: " + name);
                    }
                    ((Runnable) type.getDeclaredConstructor().newInstance()).run();
                    sum += name.hashCode();
                }
                try (var in = loader.getResourceAsStream("lib" + i + "/data")) {
                    if (in == null) throw new AssertionError("Missing resource");
                    sum += consume(in, i, false);
                }
            }
            var providers = new HashSet<String>();
            for (Runnable service : ServiceLoader.load(Runnable.class, loader)) {
                if (service.getClass().getClassLoader() != loader) throw new AssertionError("Wrong provider");
                service.run();
                if (!providers.add(service.getClass().getName())) throw new AssertionError("Duplicate provider");
            }
            if (providers.size() != JARS) throw new AssertionError("Wrong provider count");
            for (int i = 0; i < JARS; i++) {
                if (!providers.contains("lib" + i + ".C0")) throw new AssertionError("Missing provider");
            }
            return sum + providers.size();
        }
    }
    static void lifecycle(Path dir) throws Exception {
        Path copy = dir.resolve("close-check.jar");
        Files.copy(dir.resolve("lib1.jar"), copy); // compressed archive
        try (var loader = new URLClassLoader(new URL[] {copy.toUri().toURL()}, null)) {
            try (var active = loader.getResourceAsStream("lib1/data");
                 var idle = loader.getResourceAsStream("lib1/data")) {
                if (active == null || idle == null) throw new AssertionError("Missing close fixture");
                consume(active, 1, true);
                idle.close(); // one cached inflater while the other remains active
                loader.close();
                try {
                    active.read();
                    throw new AssertionError("Resource survived loader close");
                } catch (java.io.IOException expected) {
                }
            }
        }
        Files.delete(copy);
        Files.copy(dir.resolve("lib1.jar"), copy);
        try (var zip = new ZipFile(copy.toFile());
             var in = zip.getInputStream(zip.getEntry("lib1/data"))) {
            consume(in, 1, false);
        } finally {
            Files.delete(copy);
        }
        System.out.println("lifecycle passed");
    }
    static long execute(String mode, Path dir, ExecutorService executor) throws Exception {
        Path jar = dir.resolve("data.jar");
        long sum = 0;
        switch (mode) {
            case "metadata" -> {
                for (int i = 0; i < 2048; i++) try (var zip = new ZipFile(jar.toFile())) {
                    if (zip.size() != ENTRIES) throw new AssertionError("Wrong entry count");
                    sum += zip.size();
                }
            }
            case "serial-full", "serial-partial", "parallel4", "promoted32" -> {
                try (var zip = new ZipFile(jar.toFile())) {
                    if (mode.equals("serial-full")) sum = serial(zip, 4096, false);
                    else if (mode.equals("serial-partial")) sum = serial(zip, 4096, true);
                    else if (mode.equals("parallel4")) sum = parallel(zip, executor);
                    else {
                        for (int i = 0; i < 256; i++) sum += burst(zip, 32);
                        sum += serial(zip, 1024, true);
                    }
                }
            }
            case "promote2" -> {
                for (int i = 0; i < 512; i++) try (var zip = new ZipFile(jar.toFile())) {
                    sum += burst(zip, 2) + serial(zip, 4, true);
                }
            }
            case "loader" -> { for (int i = 0; i < 8; i++) sum += load(dir); }
            default -> throw new IllegalArgumentException(mode);
        }
        return sum;
    }
    public static void main(String[] args) throws Exception {
        String command = args[0];
        Path dir = Path.of(args[1]);
        if (command.equals("prepare")) { prepare(dir); return; }
        if (command.equals("lifecycle")) { lifecycle(dir); return; }
        if (command.equals("startup")) {
            System.out.println("startup checksum=" + load(dir)); return;
        }
        if (!command.equals("batch")) throw new IllegalArgumentException(command);
        try (var executor = Executors.newFixedThreadPool(4)) {
            for (String mode : List.of("metadata", "serial-full", "serial-partial",
                    "parallel4", "promoted32", "promote2", "loader")) {
                Long expected = null;
                for (int round = 0; round < 8; round++) {
                    long start = System.nanoTime();
                    long checksum = execute(mode, dir, executor);
                    long nanos = System.nanoTime() - start;
                    if (expected != null && expected != checksum) throw new AssertionError("Unstable checksum");
                    expected = checksum;
                    System.out.printf("mode=%s round=%d ns=%d checksum=%d%n", mode, round, nanos, checksum);
                }
            }
        }
    }
}
