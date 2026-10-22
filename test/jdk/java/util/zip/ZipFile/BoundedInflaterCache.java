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

/*
 * @test
 * @summary Bound idle inflater retention while preserving active streams and cleanup
 * @modules java.base/java.util.zip:open
 * @library /test/lib
 * @run main/othervm BoundedInflaterCache
 * @run main/othervm BoundedInflaterCache cleaner
 */

import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.Cleaner.Cleanable;
import java.lang.reflect.Field;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.zip.CRC32;
import java.util.zip.Inflater;
import java.util.zip.InflaterInputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

import jdk.test.lib.util.ForceGC;

public class BoundedInflaterCache {
    private static final int LIMIT = Integer.getInteger("test.cache.limit", 8);
    private static final int BURST = 128;
    private static final byte[] DATA = new byte[65536];

    public static void main(String[] args) throws Exception {
        new Random(8321).nextBytes(DATA);
        Path zip = Files.createTempFile("bounded-inflaters", ".zip");
        Path corrupt = Files.createTempFile("bounded-inflaters-corrupt", ".zip");
        try {
            try (var out = new ZipOutputStream(Files.newOutputStream(zip))) {
                out.putNextEntry(new ZipEntry("deflated"));
                out.write(DATA);
                out.closeEntry();
                ZipEntry stored = new ZipEntry("stored");
                stored.setMethod(ZipEntry.STORED);
                stored.setSize(DATA.length);
                CRC32 crc = new CRC32();
                crc.update(DATA);
                stored.setCrc(crc.getValue());
                out.putNextEntry(stored);
                out.write(DATA);
                out.closeEntry();
                out.putNextEntry(new ZipEntry("valid"));
                out.write(DATA);
                out.closeEntry();
            }
            byte[] damaged = Files.readAllBytes(zip);
            // First local header, no extra field: force reserved DEFLATE block type.
            int nameLength = (damaged[26] & 255) | ((damaged[27] & 255) << 8);
            int extraLength = (damaged[28] & 255) | ((damaged[29] & 255) << 8);
            damaged[30 + nameLength + extraLength] = 7;
            Files.write(corrupt, damaged);
            if (args.length > 0 && args[0].equals("cleaner")) {
                unreachableStreams(zip);
            } else {
                retainedAndActive(zip);
                cleanerReturns(zip);
                zipCleanup(zip);
                corruptAndReuse(corrupt);
                closeRaces(zip);
            }
        } finally {
            Files.deleteIfExists(corrupt);
            Files.deleteIfExists(zip);
        }
    }

    private static Object field(Object object, String name) throws Exception {
        Field f = object.getClass().getDeclaredField(name);
        f.setAccessible(true);
        return f.get(object);
    }

    private static Inflater inflater(InputStream stream) throws Exception {
        Field f = InflaterInputStream.class.getDeclaredField("inf");
        f.setAccessible(true);
        return (Inflater) f.get(stream);
    }

    private static long address(Inflater inf) throws Exception {
        Object ref = field(inf, "zsRef");
        synchronized (ref) {
            return (long) field(ref, "address");
        }
    }

    private static int cacheSize(ZipFile zip) throws Exception {
        Object cache = field(field(zip, "res"), "inflaterCache");
        if (cache == null) {
            return -1;
        }
        synchronized (cache) {
            return ((List<?>) cache).size();
        }
    }

    private static void check(boolean condition, String message) {
        if (!condition) {
            throw new AssertionError(message);
        }
    }

    private static void read(InputStream in, int offset, int length) throws IOException {
        byte[] bytes = in.readNBytes(length);
        check(Arrays.equals(bytes, Arrays.copyOfRange(DATA, offset, offset + length)),
                "Incorrect content at " + offset);
    }

    private static void ended(List<Inflater> inflaters) throws Exception {
        for (Inflater inf : inflaters) {
            check(address(inf) == 0, "Native state survives archive close");
        }
    }

    private static void retainedAndActive(Path path) throws Exception {
        List<Inflater> inflaters = new ArrayList<>();
        try (ZipFile zip = new ZipFile(path.toFile())) {
            var streams = new ArrayList<InputStream>();
            for (int i = 0; i < BURST; i++) {
                InputStream in = zip.getInputStream(zip.getEntry("deflated"));
                streams.add(in);
                inflaters.add(inflater(in));
                read(in, 0, DATA.length / 2);
            }
            // Fill and overflow the cache while leaving many streams active.
            for (int i = 0; i < BURST / 2; i++) {
                streams.get(i).close();
                streams.get(i).close();
            }
            check(cacheSize(zip) == LIMIT, "Idle cache is not bounded");
            for (int i = 0; i < BURST / 2; i++) {
                Inflater inf = inflaters.get(i);
                check((address(inf) != 0) == (i < LIMIT), "Incorrect eviction");
                if (i < LIMIT) {
                    check(inf.getBytesRead() == 0 && inf.getBytesWritten() == 0,
                            "Cached inflater was not reset");
                }
            }
            for (int i = BURST / 2; i < BURST; i++) {
                check(address(inflaters.get(i)) != 0, "Active inflater was ended");
                read(streams.get(i), DATA.length / 2, DATA.length / 2);
                check(streams.get(i).read() == -1, "Missing EOF");
                streams.get(i).close();
            }
            // Reuse after a partial read must start with clean decompression state.
            for (int i = 0; i < 32; i++) {
                try (InputStream in = zip.getInputStream(zip.getEntry("deflated"))) {
                    read(in, 0, DATA.length);
                    check(in.read() == -1, "Missing EOF after reuse");
                }
            }
            try (InputStream in = zip.getInputStream(zip.getEntry("stored"))) {
                read(in, 0, DATA.length);
                check(in.read() == -1, "Missing STORED EOF");
            }
            check(cacheSize(zip) == LIMIT, "STORED entry changed inflater cache");
        }
        ended(inflaters);
    }

    private static void cleanerReturns(Path path) throws Exception {
        List<Inflater> inflaters = new ArrayList<>();
        try (ZipFile zip = new ZipFile(path.toFile())) {
            var streams = new ArrayList<InputStream>();
            for (int i = 0; i < BURST; i++) {
                InputStream in = zip.getInputStream(zip.getEntry("deflated"));
                streams.add(in);
                inflaters.add(inflater(in));
                read(in, 0, 1);
            }
            for (InputStream in : streams) {
                // Exercise the registered Cleaner action deterministically.
                // Do not read a stream after invoking its cleanup.
                Cleanable cleanable = (Cleanable) field(in, "cleanable");
                cleanable.clean();
                cleanable.clean();
                in.close();
            }
            check(cacheSize(zip) == LIMIT, "Cleaner returns bypass cache limit");
            long live = 0;
            for (Inflater inf : inflaters) {
                if (address(inf) != 0) {
                    live++;
                }
            }
            check(live == LIMIT, "Cleaner did not end rejected inflaters");
        }
        ended(inflaters);
    }

    private static void zipCleanup(Path path) throws Exception {
        List<Inflater> inflaters = new ArrayList<>();
        ZipFile zip = new ZipFile(path.toFile());
        var streams = new ArrayList<InputStream>();
        for (int i = 0; i < BURST; i++) {
            InputStream in = zip.getInputStream(zip.getEntry("deflated"));
            streams.add(in);
            inflaters.add(inflater(in));
            read(in, 0, 1);
        }
        // Exercise ZipFile's own registered Cleaner, with active and idle inflaters.
        for (int i = 0; i < LIMIT; i++) {
            streams.get(i).close();
        }
        ((Cleanable) field(field(zip, "res"), "cleanable")).clean();
        ended(inflaters);
        check(cacheSize(zip) == -1, "Archive cleanup did not close cache");
        zip.close();
        zip.close();
        for (InputStream in : streams) {
            in.close();
        }
    }

    private static List<Inflater> abandonStreams(ZipFile zip) throws Exception {
        var streams = new ArrayList<InputStream>();
        var inflaters = new ArrayList<Inflater>();
        for (int i = 0; i < BURST; i++) {
            InputStream in = zip.getInputStream(zip.getEntry("deflated"));
            streams.add(in);
            inflaters.add(inflater(in));
            read(in, 0, 1);
        }
        java.lang.ref.Reference.reachabilityFence(streams);
        return inflaters;
    }

    private static void unreachableStreams(Path path) throws Exception {
        List<Inflater> inflaters;
        try (ZipFile zip = new ZipFile(path.toFile())) {
            inflaters = abandonStreams(zip);
            // Only this separate run uses GC to exercise reachability-driven cleanup.
            check(ForceGC.waitFor(() -> {
                try {
                    int live = 0;
                    for (Inflater inf : inflaters) {
                        if (address(inf) != 0) {
                            live++;
                        }
                    }
                    return cacheSize(zip) == LIMIT && live == LIMIT;
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            }, 10_000), "Unreachable streams were not cleaned up");
        }
        ended(inflaters);
    }

    private static void corruptAndReuse(Path path) throws Exception {
        List<Inflater> inflaters = new ArrayList<>();
        try (ZipFile zip = new ZipFile(path.toFile())) {
            var streams = new ArrayList<InputStream>();
            for (int i = 0; i < BURST; i++) {
                InputStream in = zip.getInputStream(zip.getEntry("deflated"));
                streams.add(in);
                inflaters.add(inflater(in));
                try {
                    in.readAllBytes();
                    throw new AssertionError("Corrupt data was accepted");
                } catch (IOException expected) {
                }
            }
            for (InputStream in : streams) {
                in.close();
                in.close();
            }
            check(cacheSize(zip) == LIMIT, "Exceptional streams bypass limit");
            try (InputStream in = zip.getInputStream(zip.getEntry("valid"))) {
                read(in, 0, DATA.length);
                check(in.read() == -1, "Missing EOF after exceptional reuse");
            }
            try (InputStream in = zip.getInputStream(zip.getEntry("stored"))) {
                read(in, 0, DATA.length);
            }
        }
        ended(inflaters);
    }

    private static void closeRaces(Path path) throws Exception {
        for (int round = 0; round < 40; round++) {
            ZipFile zip = new ZipFile(path.toFile());
            var streams = new ArrayList<InputStream>();
            var inflaters = java.util.Collections.synchronizedList(new ArrayList<Inflater>());
            for (int i = 0; i < BURST; i++) {
                InputStream in = zip.getInputStream(zip.getEntry("deflated"));
                streams.add(in);
                inflaters.add(inflater(in));
                read(in, 0, 32);
            }
            CountDownLatch start = new CountDownLatch(1);
            try (var pool = Executors.newFixedThreadPool(6)) {
                var tasks = new ArrayList<java.util.concurrent.Future<?>>();
                for (int worker = 0; worker < 4; worker++) {
                    final int first = worker;
                    tasks.add(pool.submit(() -> {
                        start.await();
                        for (int i = first; i < streams.size(); i += 4) {
                            streams.get(i).close();
                            streams.get(i).close();
                        }
                        return null;
                    }));
                }
                tasks.add(pool.submit(() -> {
                    start.await();
                    for (int i = 0; i < BURST; i++) {
                        try (InputStream in = zip.getInputStream(new ZipEntry("deflated"))) {
                            inflaters.add(inflater(in));
                            read(in, 0, 1);
                        } catch (IOException | IllegalStateException expectedOnClose) {
                            break;
                        }
                    }
                    return null;
                }));
                tasks.add(pool.submit(() -> {
                    start.await();
                    zip.close();
                    zip.close();
                    return null;
                }));
                start.countDown();
                try {
                    for (var task : tasks) {
                        task.get(30, TimeUnit.SECONDS);
                    }
                } finally {
                    pool.shutdownNow();
                }
            } finally {
                zip.close();
            }
            ended(inflaters);
            check(cacheSize(zip) == -1, "Racing close did not close cache");
        }
    }
}

