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
import java.lang.instrument.Instrumentation;
import java.lang.reflect.Field;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.zip.Inflater;
import java.util.zip.InflaterInputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

// Diagnostic agent, not a timing benchmark. Counts cache container objects only:
// exclude shared empty arrays, inflater objects, native memory and other ZIP state.
public class ZipCacheFootprint {
    private static Instrumentation instrumentation;
    private static final Field RESOURCE = field(ZipFile.class, "res");
    private static final Field CACHE = field(RESOURCE.getType(), "inflaterCache");
    private static final Field ELEMENTS = field(ArrayList.class, "elementData");
    private static final Field INFLATER = field(InflaterInputStream.class, "inf");
    private static final int FILES = 32;

    public static void premain(String args, Instrumentation value) {
        instrumentation = value;
    }

    private static Field field(Class<?> type, String name) {
        try {
            Field field = type.getDeclaredField(name);
            field.setAccessible(true);
            return field;
        } catch (ReflectiveOperationException exception) {
            throw new ExceptionInInitializerError(exception);
        }
    }

    private static <T> Set<T> identities() {
        return Collections.newSetFromMap(new IdentityHashMap<>());
    }

    private static void addIdentity(List<Object> objects, Object object) {
        // Do not hash measured objects: this fork can expand hashed four-byte
        // headers during GC, changing the size being measured.
        for (Object previous : objects) {
            if (previous == object) return;
        }
        objects.add(object);
    }

    private static void observe(ZipFile zip, List<Object> containers) throws Exception {
        Object cache = CACHE.get(RESOURCE.get(zip));
        if (cache instanceof ArrayList<?> list) {
            addIdentity(containers, list);
            Object[] elements = (Object[]) ELEMENTS.get(list);
            if (elements.length != 0) addIdentity(containers, elements);
        }
    }

    private static void run(Path path, String mode, int width, int rounds) throws Exception {
        List<ZipFile> files = new ArrayList<>();
        List<Object> observedContainers = new ArrayList<>();
        Set<Inflater> inflaters = identities();
        try {
            for (int i = 0; i < FILES; i++) {
                ZipFile zip = new ZipFile(path.toFile());
                files.add(zip);
                observe(zip, observedContainers);
                for (int round = 0; round < rounds; round++) {
                    List<InputStream> streams = new ArrayList<>();
                    for (int j = 0; j < width; j++) {
                        InputStream stream = zip.getInputStream(zip.getEntry("entry"));
                        streams.add(stream);
                        inflaters.add((Inflater) INFLATER.get(stream));
                        if (stream.readNBytes(1024).length != 1024) {
                            throw new AssertionError("Short entry");
                        }
                        observe(zip, observedContainers);
                    }
                    // Return order exercises the LIFO pool without dropping demand.
                    for (InputStream stream : streams) {
                        stream.close();
                        observe(zip, observedContainers);
                    }
                }
            }
            List<Object> retainedContainers = new ArrayList<>();
            long resourceBytes = 0;
            int idle = 0;
            for (ZipFile zip : files) {
                resourceBytes += instrumentation.getObjectSize(RESOURCE.get(zip));
                observe(zip, retainedContainers);
                Object cache = CACHE.get(RESOURCE.get(zip));
                if (cache instanceof List<?> list) idle += list.size();
                else if (cache instanceof Inflater) idle++;
            }
            long containerBytes = retainedContainers.stream()
                    .mapToLong(instrumentation::getObjectSize).sum();
            int expected = FILES * width;
            if (inflaters.size() != expected || idle != expected) {
                throw new AssertionError("Unexpected inflater construction/reuse count");
            }
            System.out.printf("{\"case\":\"%s\",\"files\":%d,\"rounds\":%d,"
                    + "\"resourceBytes\":%d,\"retainedContainers\":%d,"
                    + "\"retainedContainerBytes\":%d,\"observedContainers\":%d,"
                    + "\"inflaters\":%d,\"idle\":%d}%n", mode, FILES, rounds,
                    resourceBytes, retainedContainers.size(), containerBytes,
                    observedContainers.size(), inflaters.size(), idle);
        } finally {
            for (ZipFile zip : files) zip.close();
        }
        for (Inflater inflater : inflaters) {
            try {
                inflater.getBytesRead();
                throw new AssertionError("Inflater survived file close");
            } catch (IllegalStateException expected) {
            }
        }
    }

    public static void main(String[] args) throws Exception {
        if (instrumentation == null) throw new AssertionError("Use -javaagent");
        Path path = Files.createTempFile("zip-cache-footprint-", ".zip");
        try {
            byte[] content = new byte[64 * 1024];
            new Random(42).nextBytes(content);
            try (var output = new ZipOutputStream(Files.newOutputStream(path))) {
                output.putNextEntry(new ZipEntry("entry"));
                output.write(content);
            }
            run(path, "unused", 0, 0);
            run(path, "serial", 1, 20);
            run(path, "overlap8", 8, 20);
        } finally {
            Files.delete(path);
        }
    }
}
