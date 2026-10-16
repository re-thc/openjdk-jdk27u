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

/*
 * @test
 * @summary Check compact ZipFile inflater caching, reuse and native cleanup
 * @modules java.base/java.util.zip:open
 * @run main InflaterCache
 */

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
import java.util.zip.Inflater;
import java.util.zip.InflaterInputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

public class InflaterCache {
    private static final int STREAMS = 32;
    private static final byte[] CONTENT = new byte[64 * 1024];
    private static final Field INF;
    private static final Field CLEANABLE;
    private static final Field RESOURCE;
    private static final Field CACHE;
    private static final Object CLOSED;

    static {
        new Random(42).nextBytes(CONTENT);
        try {
            INF = InflaterInputStream.class.getDeclaredField("inf");
            CLEANABLE = Class.forName("java.util.zip.ZipFile$ZipFileInflaterInputStream")
                    .getDeclaredField("cleanable");
            INF.setAccessible(true);
            CLEANABLE.setAccessible(true);
            RESOURCE = ZipFile.class.getDeclaredField("res");
            CACHE = RESOURCE.getType().getDeclaredField("inflaterCache");
            Field closed = RESOURCE.getType().getDeclaredField("CLOSED");
            RESOURCE.setAccessible(true);
            CACHE.setAccessible(true);
            closed.setAccessible(true);
            CLOSED = closed.get(null);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    public static void main(String[] args) throws Exception {
        Path path = Files.createTempFile("inflater-cache-", ".jar");
        try {
            try (var out = new ZipOutputStream(Files.newOutputStream(path))) {
                out.putNextEntry(new ZipEntry("bad"));
                out.write(CONTENT);
                out.putNextEntry(new ZipEntry("good"));
                out.write(CONTENT);
            }
            // Give the first entry an invalid DEFLATE block type.
            byte[] bytes = Files.readAllBytes(path);
            int nameLength = (bytes[26] & 0xff) | (bytes[27] & 0xff) << 8;
            int extraLength = (bytes[28] & 0xff) | (bytes[29] & 0xff) << 8;
            bytes[30 + nameLength + extraLength] = 7;
            Files.write(path, bytes);

            cacheTransitions(path);
            closeWithActiveStream(path);
            burstAndReuse(path);
            reuseAfterError(path);
            concurrentReads(path);
            closeRaces(path);
        } finally {
            Files.delete(path);
        }
    }

    private static Inflater inflater(InputStream stream) throws Exception {
        return (Inflater) INF.get(stream);
    }

    private static Object cache(ZipFile zip) throws Exception {
        return CACHE.get(RESOURCE.get(zip));
    }

    private static void cacheTransitions(Path path) throws Exception {
        try (var zip = new ZipFile(path.toFile())) {
            if (cache(zip) != null) throw new AssertionError("Unused cache allocated");
            zip.close();
            if (cache(zip) != CLOSED) throw new AssertionError("Empty cache not closed");
        }
        try (var zip = new ZipFile(path.toFile())) {
            Inflater singleton = null;
            for (int i = 0; i < 20; i++) {
                try (var stream = zip.getInputStream(zip.getEntry("good"))) {
                    Inflater inf = inflater(stream);
                    if (singleton != null && singleton != inf) {
                        throw new AssertionError("Singleton not reused");
                    }
                    singleton = inf;
                    if (cache(zip) != null) throw new AssertionError("Borrowed cache not empty");
                    checkContent(stream);
                }
                if (cache(zip) != singleton) throw new AssertionError("Singleton not stored directly");
            }
            var first = zip.getInputStream(zip.getEntry("good"));
            var second = zip.getInputStream(zip.getEntry("good"));
            Inflater other = inflater(second);
            first.close();
            second.close();
            Object promoted = cache(zip);
            if (!(promoted instanceof List<?> list) || list.size() != 2) {
                throw new AssertionError("Cache not promoted");
            }
            try (var last = zip.getInputStream(zip.getEntry("good"));
                 var previous = zip.getInputStream(zip.getEntry("good"))) {
                if (inflater(last) != other || inflater(previous) != singleton) {
                    throw new AssertionError("LIFO order changed");
                }
                if (cache(zip) != promoted || !((List<?>) promoted).isEmpty()) {
                    throw new AssertionError("Drained cache was demoted");
                }
                checkContent(last);
                checkContent(previous);
            }
            if (cache(zip) != promoted) throw new AssertionError("Refilled cache replaced");
            zip.close();
            checkOpen(List.of(singleton, other), 0);
        }
    }

    private static void closeWithActiveStream(Path path) throws Exception {
        for (boolean idleSingleton : new boolean[] { false, true }) {
            try (var zip = new ZipFile(path.toFile())) {
                var active = zip.getInputStream(zip.getEntry("good"));
                List<Inflater> inflaters = new ArrayList<>();
                inflaters.add(inflater(active));
                active.readNBytes(1024);
                if (idleSingleton) {
                    var idle = zip.getInputStream(zip.getEntry("good"));
                    inflaters.add(inflater(idle));
                    idle.close();
                }
                zip.close();
                checkOpen(inflaters, 0);
                if (cache(zip) != CLOSED) throw new AssertionError("Active stream reopened cache");
                active.close();
            }
        }
    }

    private static boolean isOpen(Inflater inflater) {
        try {
            inflater.getBytesRead();
            return true;
        } catch (IllegalStateException expected) {
            return false;
        }
    }

    private static void checkOpen(List<Inflater> inflaters, long expected) {
        long open = inflaters.stream().filter(InflaterCache::isOpen).count();
        if (open != expected) {
            throw new AssertionError("Expected " + expected + " open inflaters, got " + open);
        }
    }

    private static List<InputStream> openStreams(ZipFile zip) throws Exception {
        return openStreams(zip, STREAMS);
    }

    private static List<InputStream> openStreams(ZipFile zip, int count) throws Exception {
        List<InputStream> streams = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            streams.add(zip.getInputStream(zip.getEntry("good")));
        }
        return streams;
    }

    private static List<Inflater> inflaters(List<InputStream> streams) throws Exception {
        List<Inflater> inflaters = new ArrayList<>();
        for (var stream : streams) {
            inflaters.add(inflater(stream));
        }
        if (inflaters.stream().distinct().count() != streams.size()) {
            throw new AssertionError("Inflater shared by open streams");
        }
        return inflaters;
    }

    private static void burstAndReuse(Path path) throws Exception {
        List<Inflater> all = new ArrayList<>();
        try (var zip = new ZipFile(path.toFile())) {
            for (boolean read : new boolean[] { false, true }) {
                var streams = openStreams(zip);
                var inflaters = inflaters(streams);
                if (!all.isEmpty() && !all.containsAll(inflaters)) {
                    throw new AssertionError("Burst discarded cached inflaters");
                }
                all.addAll(inflaters);
                for (var stream : streams) {
                    if (read && !Arrays.equals(stream.readNBytes(1024),
                                              Arrays.copyOf(CONTENT, 1024))) {
                        throw new AssertionError("Partial read differs");
                    }
                }
                for (var stream : streams) {
                    stream.close();
                    stream.close(); // must not return the same inflater twice
                }
                checkOpen(inflaters, STREAMS);
                for (var inf : inflaters) {
                    if (isOpen(inf) && (inf.getBytesRead() != 0 || inf.getBytesWritten() != 0)) {
                        throw new AssertionError("Cached inflater was not reset");
                    }
                }
                // Single-stream use should continue reusing the same cached inflater.
                Inflater previous = null;
                for (int i = 0; i < 20; i++) {
                    try (var stream = zip.getInputStream(zip.getEntry("good"))) {
                        Inflater current = inflater(stream);
                        if (previous != null && previous != current) {
                            throw new AssertionError("Sequential use did not reuse inflater");
                        }
                        previous = current;
                        checkContent(stream);
                    }
                }
                checkOpen(inflaters, STREAMS);
            }
        }
        checkOpen(all, 0);
    }

    private static void reuseAfterError(Path path) throws Exception {
        try (var zip = new ZipFile(path.toFile())) {
            Inflater failed;
            try (var stream = zip.getInputStream(zip.getEntry("bad"))) {
                failed = inflater(stream);
                try {
                    stream.readAllBytes();
                    throw new AssertionError("Invalid block accepted");
                } catch (ZipException expected) {
                }
            }
            try (var stream = zip.getInputStream(zip.getEntry("good"))) {
                if (failed != inflater(stream)) {
                    throw new AssertionError("Failed inflater was not reused");
                }
                checkContent(stream);
            }
        }
    }

    private static void checkContent(InputStream stream) throws Exception {
        if (!Arrays.equals(stream.readAllBytes(), CONTENT)) {
            throw new AssertionError("Decompressed content differs");
        }
    }

    private static void concurrentReads(Path path) throws Exception {
        List<Inflater> inflaters;
        try (var zip = new ZipFile(path.toFile());
             var executor = Executors.newFixedThreadPool(4)) {
            var streams = openStreams(zip);
            inflaters = inflaters(streams);
            var tasks = streams.stream().<java.util.concurrent.Callable<Void>>map(stream -> () -> {
                try (stream) {
                    checkContent(stream);
                }
                // Acquire while other workers return inflaters to the same cache.
                for (int i = 0; i < 10; i++) {
                    try (var next = zip.getInputStream(zip.getEntry("good"))) {
                        checkContent(next);
                    }
                }
                return null;
            }).toList();
            for (var future : executor.invokeAll(tasks)) {
                future.get();
            }
            checkOpen(inflaters, STREAMS);
        }
        checkOpen(inflaters, 0);
    }

    private static void closeRaces(Path path) throws Exception {
        try (var executor = Executors.newFixedThreadPool(3)) {
            for (int round = 0; round < 60; round++) {
                try (var zip = new ZipFile(path.toFile())) {
                    int count = switch (round % 3) {
                        case 0 -> 1;
                        case 1 -> 2;
                        default -> STREAMS;
                    };
                    var streams = openStreams(zip, count);
                    var inflaters = inflaters(streams);
                    for (var stream : streams) {
                        stream.readNBytes(1024);
                    }
                    CountDownLatch ready = new CountDownLatch(3);
                    CountDownLatch start = new CountDownLatch(1);
                    var closeStreams = executor.submit(() -> {
                        ready.countDown();
                        start.await();
                        for (var stream : streams) stream.close();
                        return null;
                    });
                    var cleanStreams = executor.submit(() -> {
                        ready.countDown();
                        start.await();
                        for (var stream : streams) {
                            ((Cleanable) CLEANABLE.get(stream)).clean();
                        }
                        return null;
                    });
                    var closeZip = executor.submit(() -> {
                        ready.countDown();
                        start.await();
                        zip.close();
                        return null;
                    });
                    ready.await();
                    start.countDown();
                    closeStreams.get();
                    cleanStreams.get();
                    closeZip.get();
                    checkOpen(inflaters, 0);
                }
            }
        }
    }
}
