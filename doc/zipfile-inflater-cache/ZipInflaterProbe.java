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

import java.io.*;
import java.lang.reflect.*;
import java.nio.file.*;
import java.util.*;
import java.util.zip.*;

public class ZipInflaterProbe {
    static final Field INF, ZSREF, ADDRESS;
    // Preserve last observed per-client cumulative calls after native end.
    static final Map<Inflater, Long> LAST_CALLS = new IdentityHashMap<>();
    static {
        try {
            INF = InflaterInputStream.class.getDeclaredField("inf");
            ZSREF = Inflater.class.getDeclaredField("zsRef");
            ADDRESS = Class.forName("java.util.zip.Inflater$InflaterZStreamRef").getDeclaredField("address");
            for (var f : List.of(INF, ZSREF, ADDRESS)) f.setAccessible(true);
        } catch (Exception e) { throw new ExceptionInInitializerError(e); }
        if (Boolean.getBoolean("measure")) System.load(System.getProperty("allocator"));
    }
    static native long[] measure(long address);
    static long address(Inflater inf) throws Exception { return ADDRESS.getLong(ZSREF.get(inf)); }
    static byte[] data(int size) {
        byte[] b = new byte[size];
        new Random(42).nextBytes(b);
        // Realistic compressible data with repeated and distinct blocks.
        for (int p = 4096; p + 4096 <= size; p += 8192) System.arraycopy(b, 0, b, p, 4096);
        return b;
    }
    public static void main(String[] args) throws Exception {
        int width = Integer.parseInt(args[0]);
        int size = Integer.parseInt(args[1]);
        int read = Integer.parseInt(args[2]);
        int bursts = Integer.parseInt(args[3]);
        Path jar = Files.createTempFile("zip-inflater-burst-", ".jar");
        try {
            try (var out = new ZipOutputStream(Files.newOutputStream(jar))) {
                out.putNextEntry(new ZipEntry("entry"));
                out.write(data(size));
            }
            try (var zip = new ZipFile(jar.toFile())) {
                var entry = zip.getEntry("entry");
                InputStream[] streams = new InputStream[width];
                Inflater[] infs = new Inflater[width];
                byte[] buf = new byte[read];
                long checksum = 0, created = 0;
                Set<Inflater> previous = Collections.newSetFromMap(new IdentityHashMap<>());
                // Report native allocation before and after reading the first burst.
                for (int i = 0; i < width; i++) {
                    streams[i] = zip.getInputStream(entry);
                    infs[i] = (Inflater) INF.get(streams[i]);
                }
                report("unread", infs);
                for (var s : streams) { int n = s.readNBytes(buf, 0, buf.length); checksum += n + (buf.length == 0 ? 0 : buf[0]); }
                report("read", infs);
                for (var s : streams) s.close();
                report("idle", infs);
                for (var inf : infs) if (address(inf) != 0) previous.add(inf);
                for (int b = 0; b < bursts; b++) {
                    Set<Inflater> next = Collections.newSetFromMap(new IdentityHashMap<>());
                    for (int i = 0; i < width; i++) {
                        streams[i] = zip.getInputStream(entry);
                        var inf = (Inflater) INF.get(streams[i]);
                        if (!previous.contains(inf)) created++;
                        next.add(inf);
                        int n = streams[i].readNBytes(buf, 0, buf.length);
                        checksum += n + (buf.length == 0 ? 0 : buf[0]);
                    }
                    for (var s : streams) s.close();
                    previous = next;
                }
                System.out.printf("width=%d size=%d read=%d bursts=%d created=%d checksum=%d%n", width, size, read, bursts, created, checksum);
                if (created != 0) throw new AssertionError("Cached inflater was replaced");
                report("repeated-idle", previous.toArray(Inflater[]::new));
                zip.close();
                report("zip-closed", infs);
                for (var inf : infs) {
                    if (address(inf) != 0) throw new AssertionError("Inflater survived ZIP close");
                }
            }
        } finally { Files.delete(jar); }
    }
    static void report(String label, Inflater[] infs) throws Exception {
        long open = 0, bytes = 0, usable = 0, allocations = 0, calls = 0;
        for (var inf : infs) {
            long address = address(inf);
            if (address != 0) {
                open++;
                if (Boolean.getBoolean("measure")) {
                    long[] a = measure(address);
                    bytes += a[0]; usable += a[1]; allocations += a[2];
                    LAST_CALLS.put(inf, a[3]);
                }
            }
            calls += LAST_CALLS.getOrDefault(inf, 0L);
        }
        if (Boolean.getBoolean("measure"))
            System.out.printf("%s open=%d native-requested=%d diagnostic-usable=%d allocations=%d observed-zalloc-calls=%d%n", label, open, bytes, usable, allocations, calls);
        else
            System.out.printf("%s open=%d%n", label, open);
    }
}
