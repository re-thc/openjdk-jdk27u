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
 * @summary Mapped-status admission must retain mapping safety without allocating proxies
 * @requires (os.family == "linux")
 * @modules jdk.management/com.sun.management
 *          java.base/jdk.internal.access java.base/jdk.internal.access.foreign
 *          java.base/sun.nio.cs:open
 * @run main/othervm --enable-native-access=ALL-UNNAMED MappedAdmission
 * @run main/othervm -Xint --enable-native-access=ALL-UNNAMED MappedAdmission
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 --enable-native-access=ALL-UNNAMED MappedAdmission
 * @run main/othervm -Xbatch -XX:-TieredCompilation --enable-native-access=ALL-UNNAMED MappedAdmission
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics --enable-native-access=ALL-UNNAMED MappedAdmission
 */
import java.lang.foreign.Arena;
import java.lang.invoke.*;
import java.lang.management.ManagementFactory;
import java.lang.ref.Reference;
import java.nio.*;
import java.nio.channels.FileChannel;
import java.nio.file.*;
import com.sun.management.ThreadMXBean;
import jdk.internal.access.SharedSecrets;

public class MappedAdmission {
    static final MethodHandle ACCESSIBLE;
    static volatile Buffer input;
    static volatile int sink;
    static {
        try {
            Class<?> c = Class.forName("sun.nio.cs.BufferStorage");
            ACCESSIBLE = MethodHandles.privateLookupIn(c, MethodHandles.lookup())
                    .findStatic(c, "accessible", MethodType.methodType(boolean.class,
                                Buffer.class, boolean.class));
        } catch (ReflectiveOperationException e) { throw new ExceptionInInitializerError(e); }
    }
    static boolean accessible(Buffer b) throws Throwable {
        return (boolean) ACCESSIBLE.invokeExact(b, false);
    }
    static int batch(int count) throws Throwable {
        int result = 0;
        for (int i = 0; i < count; i++) if (accessible(input)) result++;
        return result;
    }
    static void check(Buffer b, boolean expected) throws Throwable {
        if (accessible(b) != expected) throw new AssertionError("admission: " + b);
    }
    public static void main(String[] args) throws Throwable {
        Path file = Files.createTempFile("mapped-admission", ".bin");
        try (FileChannel fc = FileChannel.open(file, StandardOpenOption.READ,
                                               StandardOpenOption.WRITE);
             Arena arena = Arena.ofConfined()) {
            fc.position(8191); fc.write(ByteBuffer.wrap(new byte[1]));
            MappedByteBuffer mapped = fc.map(FileChannel.MapMode.READ_WRITE, 0, 8192);
            ByteBuffer[] rejected = { mapped, mapped.asReadOnlyBuffer(), mapped.slice() };
            var nio = SharedSecrets.getJavaNioAccess();
            // The real proxy remains available and usable; don't unmap a live buffer.
            var proxy = nio.unmapper(mapped);
            if (proxy == null || proxy.address() == 0 || proxy.fileDescriptor() == null
                    || proxy.isSync()) throw new AssertionError("real unmapper changed");
            MethodHandle predicate = null;
            try {
                predicate = MethodHandles.lookup().findVirtual(
                    jdk.internal.access.JavaNioAccess.class, "isMappedStorage",
                    MethodType.methodType(boolean.class, Buffer.class));
            } catch (NoSuchMethodException e) {
                if (args.length == 0 || !args[0].equals("legacy-control")) throw e;
            }
            for (ByteBuffer b : rejected) {
                check(b, false);
                if (predicate != null && !(boolean) predicate.invokeExact(nio, (Buffer) b))
                    throw new AssertionError("mapped predicate");
                check(b.order(ByteOrder.nativeOrder()).asCharBuffer().slice(), false);
            }
            ByteBuffer ordinary = ByteBuffer.allocateDirect(8192);
            ByteBuffer heap = ByteBuffer.allocate(8192);
            for (ByteBuffer b : new ByteBuffer[] { ordinary, heap }) {
                check(b, true);
                if (nio.unmapper(b) != null || (predicate != null
                        && (boolean) predicate.invokeExact(nio, (Buffer) b)))
                    throw new AssertionError("ordinary buffer reported mapped");
            }
            // Foreign mappings need the segment check, independent of the legacy fd predicate.
            ByteBuffer foreign = fc.map(FileChannel.MapMode.READ_WRITE, 0, 8192, arena).asByteBuffer();
            check(foreign, false);
            check(foreign.order(ByteOrder.nativeOrder()).asCharBuffer().slice(), false);
            if (predicate != null && !(boolean) predicate.invokeExact(nio, (Buffer) foreign))
                throw new AssertionError("foreign mapped storage not detected");
            // The storage query covers this buffer only, not its parent chain.
            // accessible() must still reject mapped char views by walking parents.
            Buffer view = mapped.order(ByteOrder.nativeOrder()).asCharBuffer().slice();
            check(view, false);
            // Metadata checks do not acquire/check scopes. Actual reads still must.
            ByteBuffer confined = arena.allocate(64).asByteBuffer();
            check(confined, true);
            if (predicate != null && (boolean) predicate.invokeExact(nio, (Buffer) confined))
                throw new AssertionError("native allocation reported mapped");
            final Throwable[] failure = new Throwable[1];
            final MethodHandle query = predicate;
            Thread other = new Thread(() -> {
                try {
                    check(confined, true);
                    check(foreign, false);
                    if (query != null && (!(boolean) query.invokeExact(nio, (Buffer) foreign)
                            || (boolean) query.invokeExact(nio, (Buffer) confined)))
                        throw new AssertionError("wrong-thread metadata changed");
                    try { confined.get(0); throw new AssertionError("missing owner check"); }
                    catch (WrongThreadException expected) { }
                } catch (Throwable t) { failure[0] = t; }
            });
            other.start(); other.join();
            if (failure[0] != null) throw new AssertionError("metadata thread", failure[0]);
            Arena closedArena = Arena.ofConfined();
            ByteBuffer closedNative = closedArena.allocate(64).asByteBuffer();
            ByteBuffer closedMapped = fc.map(FileChannel.MapMode.READ_WRITE, 0, 8192,
                                            closedArena).asByteBuffer();
            closedArena.close();
            check(closedNative, true);
            check(closedMapped, false);
            if (predicate != null && (!(boolean) predicate.invokeExact(nio, (Buffer) closedMapped)
                    || (boolean) predicate.invokeExact(nio, (Buffer) closedNative)))
                throw new AssertionError("closed-scope metadata changed");
            try { closedNative.get(0); throw new AssertionError("missing closed check"); }
            catch (IllegalStateException expected) { }
            ThreadMXBean bean = (ThreadMXBean) ManagementFactory.getThreadMXBean();
            if (!bean.isThreadAllocatedMemorySupported()) {
                System.out.println("Allocation counters unsupported; semantic checks passed"); return;
            }
            bean.setThreadAllocatedMemoryEnabled(true);
            long tid = Thread.currentThread().threadId();
            for (Buffer b : new Buffer[] { mapped, mapped.asReadOnlyBuffer(), mapped.slice(), ordinary, heap }) {
                input = b;
                for (int i = 0; i < 5; i++) sink = batch(20000);
                for (int i = 0; i < 5; i++) bean.getThreadAllocatedBytes(tid);
                long best = Long.MAX_VALUE;
                for (int sample = 0; sample < 3; sample++) {
                    long before = bean.getThreadAllocatedBytes(tid);
                    sink = batch(200000);
                    long bytes = bean.getThreadAllocatedBytes(tid) - before;
                    best = Math.min(best, bytes);
                    System.out.println("ALLOCATION " + b.getClass().getName() + " " + bytes);
                }
                // Allow incidental setup, but reject a proxy allocation per call (3.2 MB).
                if (best > 4096) throw new AssertionError("per-call allocation: " + best);
            }
            Reference.reachabilityFence(mapped);
            System.out.println("PASS admission, predicate, proxy and allocation");
        } finally { input = null; Files.deleteIfExists(file); }
    }
}
