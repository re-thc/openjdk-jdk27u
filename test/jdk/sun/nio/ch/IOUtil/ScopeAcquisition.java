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
 * @test id=real
 * @summary Scope acquisition rolls back every earlier acquisition when a later buffer fails
 * @library /test/lib
 * @modules java.base/jdk.internal.access java.base/sun.nio.ch:open
 * @run main/othervm ScopeAcquisition real
 */

/*
 * @test id=faults
 * @summary Scope acquisition preserves the original failure when rollback cleanup fails
 * @library /test/lib
 * @modules java.base/jdk.internal.access java.base/sun.nio.ch:open
 * @run main/othervm ScopeAcquisition faults
 */

import java.lang.foreign.Arena;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import jdk.internal.access.JavaNioAccess;
import jdk.internal.access.SharedSecrets;
import jtreg.SkippedException;

public class ScopeAcquisition {
    private static Method acquireScopes;

    public static void main(String[] args) throws Throwable {
        if (args.length != 1) {
            throw new IllegalArgumentException("Expected real or faults");
        }
        switch (args[0]) {
            case "real" -> {
                initializeIOUtil();
                testRejectedBuffers();
                testSuccessfulAcquisition();
                System.out.println("Verified 6 failed-acquisition and 3 successful-acquisition cases");
            }
            case "faults" -> testFaultHandling();
            default -> throw new IllegalArgumentException(args[0]);
        }
    }

    private static Class<?> initializeIOUtil() throws ReflectiveOperationException {
        Class<?> ioUtil = Class.forName("sun.nio.ch.IOUtil");
        acquireScopes = ioUtil.getDeclaredMethod(
                "acquireScopes", ByteBuffer.class, ByteBuffer[].class);
        acquireScopes.setAccessible(true);
        return ioUtil;
    }

    private static void testFaultHandling() throws Throwable {
        // Initialize JavaNioAccess before replacing it. IOUtil captures this
        // delegating access object when it is initialized below.
        ByteBuffer.allocate(1);
        JavaNioAccess original = SharedSecrets.getJavaNioAccess();
        Faults faults = new Faults(original);
        JavaNioAccess access = (JavaNioAccess) Proxy.newProxyInstance(
                JavaNioAccess.class.getClassLoader(),
                new Class<?>[] { JavaNioAccess.class }, faults);
        SharedSecrets.setJavaNioAccess(access);
        try {
            Class<?> ioUtil = initializeIOUtil();
            Field accessField = ioUtil.getDeclaredField("NIO_ACCESS");
            accessField.setAccessible(true);
            if (accessField.get(null) != access) {
                throw new SkippedException("Cleanup-fault cases require IOUtil to initialize after "
                        + "fault injection; this VM initialized IOUtil before test execution "
                        + "(as occurs during exploded-image module discovery). "
                        + "Run the faults test with a packaged JDK image.");
            }
            testCleanupFailures(faults, new IllegalStateException("acquisition failed"));
            testCleanupFailures(faults, new AssertionError("acquisition failed"));
            testSelfSuppression(faults);
            System.out.println("Verified 3 rollback cleanup-fault cases");
        } finally {
            faults.reset();
            SharedSecrets.setJavaNioAccess(original);
        }
    }

    private static Runnable acquire(ByteBuffer buffer, ByteBuffer[] buffers) throws Throwable {
        try {
            return (Runnable) acquireScopes.invoke(null, buffer, buffers);
        } catch (InvocationTargetException e) {
            throw e.getCause();
        }
    }

    private static Throwable acquisitionFailure(ByteBuffer[] buffers) throws Throwable {
        try {
            acquire(null, buffers);
        } catch (Throwable failure) {
            return failure;
        }
        throw new AssertionError("Scope acquisition unexpectedly succeeded");
    }

    private static void testRejectedBuffers() throws Throwable {
        for (String kind : List.of("null", "closed", "confined")) {
            for (boolean duplicate : List.of(false, true)) {
                try (Arena firstArena = Arena.ofShared();
                     Arena secondArena = Arena.ofShared();
                     Arena confinedArena = Arena.ofConfined()) {
                    Arena closedArena = Arena.ofShared();
                    ByteBuffer closed = closedArena.allocate(8).asByteBuffer();
                    closedArena.close();
                    ByteBuffer first = firstArena.allocate(8).asByteBuffer();
                    ByteBuffer second = secondArena.allocate(8).asByteBuffer();
                    ByteBuffer invalid = switch (kind) {
                        case "null" -> null;
                        case "closed" -> closed;
                        case "confined" -> confinedArena.allocate(8).asByteBuffer();
                        default -> throw new AssertionError(kind);
                    };
                    ByteBuffer[] buffers = duplicate
                            ? new ByteBuffer[] { first, second, first, first, invalid }
                            : new ByteBuffer[] { first, second, invalid };
                    Throwable failure = acquisitionFailure(buffers);
                    Class<? extends Throwable> expected = switch (kind) {
                        case "null" -> NullPointerException.class;
                        case "closed" -> IllegalStateException.class;
                        case "confined" -> IllegalArgumentException.class;
                        default -> throw new AssertionError(kind);
                    };
                    if (!expected.isInstance(failure)) {
                        throw new AssertionError("Unexpected " + kind + " buffer failure", failure);
                    }
                    // Closing both shared arenas checks that all earlier
                    // acquisitions were released, including repeated buffers.
                }
            }
        }
    }

    private static void testSuccessfulAcquisition() throws Throwable {
        try (Arena arena = Arena.ofShared()) {
            ByteBuffer buffer = arena.allocate(8).asByteBuffer();
            acquire(buffer, null).run();
        }
        try (Arena firstArena = Arena.ofShared(); Arena secondArena = Arena.ofShared()) {
            ByteBuffer first = firstArena.allocate(8).asByteBuffer();
            ByteBuffer second = secondArena.allocate(8).asByteBuffer();
            acquire(null, new ByteBuffer[] {
                    first, second, first, ByteBuffer.allocate(8), ByteBuffer.allocateDirect(8)
            }).run();
        }
        if (acquire(null, new ByteBuffer[0]) != null) {
            throw new AssertionError("Empty buffer array acquired a scope");
        }
    }

    private static void testCleanupFailures(Faults faults, Throwable original) throws Throwable {
        try (Arena firstArena = Arena.ofShared(); Arena secondArena = Arena.ofShared()) {
            ByteBuffer first = firstArena.allocate(8).asByteBuffer();
            ByteBuffer second = secondArena.allocate(8).asByteBuffer();
            ByteBuffer rejected = ByteBuffer.allocate(8);
            Throwable[] cleanup = {
                    new AssertionError("first cleanup failed"),
                    new AssertionError("second cleanup failed"),
                    new AssertionError("third cleanup failed")
            };
            faults.configure(rejected, original, cleanup);
            try {
                Throwable failure = acquisitionFailure(
                        new ByteBuffer[] { first, first, second, rejected });
                if (failure != original) {
                    throw new AssertionError("Original acquisition exception was replaced", failure);
                }
                assertSameElements(List.of(first, first, second, rejected), faults.acquired,
                        "acquisition order");
                assertSameElements(List.of(second, first, first), faults.released,
                        "reverse cleanup order");
                assertSameElements(Arrays.asList(cleanup), Arrays.asList(failure.getSuppressed()),
                        "suppressed cleanup failures");
            } finally {
                faults.reset();
            }
        }
    }

    private static void testSelfSuppression(Faults faults) throws Throwable {
        try (Arena arena = Arena.ofShared()) {
            ByteBuffer first = arena.allocate(8).asByteBuffer();
            ByteBuffer rejected = ByteBuffer.allocate(8);
            AssertionError original = new AssertionError("shared acquisition and cleanup failure");
            faults.configure(rejected, original, new Throwable[] { original });
            try {
                Throwable failure = acquisitionFailure(new ByteBuffer[] { first, rejected });
                if (failure != original || failure.getSuppressed().length != 0) {
                    throw new AssertionError("Self suppression replaced the original failure", failure);
                }
                assertSameElements(List.of(first), faults.released, "self suppression cleanup");
            } finally {
                faults.reset();
            }
        }
    }

    private static void assertSameElements(List<?> expected, List<?> actual, String what) {
        if (expected.size() != actual.size()) {
            throw new AssertionError(what + ": expected " + expected.size()
                    + " elements, found " + actual.size());
        }
        for (int i = 0; i < expected.size(); i++) {
            if (expected.get(i) != actual.get(i)) {
                throw new AssertionError(what + ": unexpected element at " + i);
            }
        }
    }

    private static final class Faults implements InvocationHandler {
        private final JavaNioAccess original;
        private final List<ByteBuffer> acquired = new ArrayList<>();
        private final List<ByteBuffer> released = new ArrayList<>();
        private ByteBuffer rejected;
        private Throwable acquisitionFailure;
        private Throwable[] cleanupFailures;

        Faults(JavaNioAccess original) {
            this.original = original;
        }

        void configure(ByteBuffer rejected, Throwable failure, Throwable[] cleanup) {
            reset();
            this.rejected = rejected;
            acquisitionFailure = failure;
            cleanupFailures = cleanup;
        }

        void reset() {
            rejected = null;
            acquisitionFailure = null;
            cleanupFailures = null;
            acquired.clear();
            released.clear();
        }

        @Override
        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
            boolean acquiring = method.getName().equals("acquireSession");
            boolean releasing = method.getName().equals("releaseSession");
            int releaseIndex = -1;
            if (acquisitionFailure != null) {
                if (acquiring) {
                    ByteBuffer buffer = (ByteBuffer) args[0];
                    acquired.add(buffer);
                    if (buffer == rejected) {
                        throw acquisitionFailure;
                    }
                } else if (releasing) {
                    releaseIndex = released.size();
                    released.add((ByteBuffer) args[0]);
                }
            }
            Object result;
            try {
                result = method.invoke(original, args);
            } catch (InvocationTargetException e) {
                throw e.getCause();
            }
            // Release the real lease before injecting a cleanup failure, so
            // arena closure independently checks every successful acquisition.
            if (releaseIndex >= 0 && releaseIndex < cleanupFailures.length) {
                throw cleanupFailures[releaseIndex];
            }
            return result;
        }
    }
}
