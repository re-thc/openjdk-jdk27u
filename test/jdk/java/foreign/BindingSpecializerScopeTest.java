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
 * @summary Check bounded symbol/argument scope deduplication and cleanup with a Java leaf
 * @modules java.base/jdk.internal.foreign.abi java.base/jdk.internal.foreign
 * @compile --patch-module java.base=${test.src} BindingSpecializerScopeTest.java
 * @run main/othervm --patch-module java.base=${test.classes} jdk.internal.foreign.abi.BindingSpecializerScopeTest
 * @run main/othervm -Xint --patch-module java.base=${test.classes} jdk.internal.foreign.abi.BindingSpecializerScopeTest
 * @run main/othervm --patch-module java.base=${test.classes}
 *      -Djdk.internal.foreign.abi.Specializer.SCOPE_DEDUP_DEPTH=-1
 *      jdk.internal.foreign.abi.BindingSpecializerScopeTest
 * @run main/othervm --patch-module java.base=${test.classes}
 *      -Djdk.internal.foreign.abi.Specializer.SCOPE_DEDUP_DEPTH=0
 *      jdk.internal.foreign.abi.BindingSpecializerScopeTest
 * @run main/othervm --patch-module java.base=${test.classes}
 *      -Djdk.internal.foreign.abi.Specializer.SCOPE_DEDUP_DEPTH=1
 *      jdk.internal.foreign.abi.BindingSpecializerScopeTest
 * @run main/othervm --patch-module java.base=${test.classes}
 *      -Djdk.internal.foreign.abi.Specializer.SCOPE_DEDUP_DEPTH=3
 *      jdk.internal.foreign.abi.BindingSpecializerScopeTest
 * @run main/othervm --patch-module java.base=${test.classes}
 *      -Djdk.internal.foreign.abi.Specializer.PERFORM_VERIFICATION=true
 *      jdk.internal.foreign.abi.BindingSpecializerScopeTest
 */

package jdk.internal.foreign.abi;

import java.lang.foreign.Arena;
import java.lang.foreign.FunctionDescriptor;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.SegmentAllocator;
import java.lang.foreign.ValueLayout;
import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.reflect.Field;
import java.util.concurrent.atomic.AtomicReference;

import jdk.internal.foreign.AbstractMemorySegmentImpl;
import jdk.internal.foreign.MemorySessionImpl;
import jdk.internal.foreign.abi.x64.sysv.CallArranger;

public class BindingSpecializerScopeTest {
    private static final int DEPTH = Integer.getInteger(
            "jdk.internal.foreign.abi.Specializer.SCOPE_DEDUP_DEPTH", 2);
    private static final RuntimeException LEAF_FAILURE = new RuntimeException("leaf failure");
    private static final Field ACQUIRE_COUNT;
    private static final MethodHandle LEAF;
    private static final CallingSequence SEQUENCE;
    private static final ABIDescriptor ABI;
    private static int checks;

    static {
        try {
            ACQUIRE_COUNT = MemorySessionImpl.class.getDeclaredField("acquireCount");
            ACQUIRE_COUNT.setAccessible(true);
            LEAF = MethodHandles.lookup().findStatic(BindingSpecializerScopeTest.class, "leaf",
                    MethodType.methodType(long.class, Runnable.class,
                            long.class, long.class, long.class, long.class));
            // No native call is made: the x64 recipe also works on other platforms.
            SEQUENCE = CallArranger.getBindings(MethodType.methodType(long.class,
                    MemorySegment.class, MemorySegment.class, MemorySegment.class),
                    FunctionDescriptor.of(ValueLayout.JAVA_LONG,
                            ValueLayout.ADDRESS, ValueLayout.ADDRESS, ValueLayout.ADDRESS), false)
                    .callingSequence();
            Field abi = CallArranger.class.getDeclaredField("CSysV");
            abi.setAccessible(true);
            ABI = (ABIDescriptor) abi.get(null);
        } catch (ReflectiveOperationException ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static long leaf(Runnable action, long symbol, long first, long second, long third) {
        action.run();
        return first + second + third;
    }

    private static void check(boolean condition, String message) {
        checks++;
        if (!condition) {
            throw new AssertionError(message);
        }
    }

    private static void checkCount(MemorySegment segment, int expected) {
        try {
            int actual = ACQUIRE_COUNT.getInt(((AbstractMemorySegmentImpl) segment).sessionImpl());
            check(actual == expected, "Expected " + expected + " acquisitions, got " + actual);
        } catch (IllegalAccessException ex) {
            throw new AssertionError(ex);
        }
    }

    private static MethodHandle specialize(Runnable action) {
        return BindingSpecializer.specializeDowncall(MethodHandles.insertArguments(LEAF, 0, action),
                SEQUENCE, ABI);
    }

    private static long invoke(MethodHandle handle, MemorySegment symbol, MemorySegment first,
                               MemorySegment second, MemorySegment third) throws Throwable {
        return (long) handle.invokeExact((SegmentAllocator) Arena.global(), symbol, first, second, third);
    }

    @FunctionalInterface
    private interface ThrowingAction {
        void run() throws Throwable;
    }

    private static void expect(Class<? extends Throwable> type, ThrowingAction action) throws Throwable {
        try {
            action.run();
        } catch (Throwable ex) {
            check(type.isInstance(ex), "Expected " + type.getName() + ", got " + ex);
            return;
        }
        throw new AssertionError("Expected " + type.getName());
    }

    private static void checkSameArena(Arena arena) throws Throwable {
        try (arena) {
            MemorySegment symbol = arena.allocate(8);
            MemorySegment first = arena.allocate(8);
            MemorySegment second = arena.allocate(8);
            MethodHandle handle = specialize(() -> {
                checkCount(symbol, DEPTH > 0 ? 1 : 4);
                try {
                    expect(IllegalStateException.class, arena::close);
                } catch (Throwable ex) {
                    throw new AssertionError(ex);
                }
                check(arena.scope().isAlive(), "Failed in-flight close leaves arena alive");
            });
            check(invoke(handle, symbol, first, second, first.asSlice(0, 4))
                    == first.address() * 2 + second.address(), "Leaf result preserved");
            checkCount(symbol, 0);
            MethodHandle throwing = specialize(() -> { throw LEAF_FAILURE; });
            try {
                invoke(throwing, symbol, first, second, first);
                throw new AssertionError("Leaf did not throw");
            } catch (RuntimeException ex) {
                check(ex == LEAF_FAILURE, "Leaf failure identity preserved");
            }
            checkCount(symbol, 0);
        }
        check(!arena.scope().isAlive(), "Close succeeds after calls return");
    }

    private static void checkBoundedSlots() throws Throwable {
        try (Arena symbols = Arena.ofShared(); Arena firstArena = Arena.ofShared();
             Arena secondArena = Arena.ofShared()) {
            MemorySegment symbol = symbols.allocate(8);
            MemorySegment first = firstArena.allocate(8);
            MemorySegment second = secondArena.allocate(8);
            invoke(specialize(() -> {
                checkCount(symbol, 1);
                checkCount(first, 1);
                // Symbol comparison must retain the original argument-slot budget.
                checkCount(second, DEPTH >= 2 ? 1 : 2);
            }), symbol, first, second, second);
            checkCount(symbol, 0);
            checkCount(first, 0);
            checkCount(second, 0);
            invoke(specialize(() -> checkCount(first, DEPTH >= 1 ? 1 : 3)),
                    symbol, first, first, first);
            checkCount(first, 0);
        }
    }

    private static void checkFailures() throws Throwable {
        MethodHandle handle = specialize(() -> { throw new AssertionError("Leaf must not run"); });
        try (Arena arena = Arena.ofShared()) {
            MemorySegment live = arena.allocate(8);
            MemorySegment closed;
            try (Arena closedArena = Arena.ofShared()) {
                closed = closedArena.allocate(8);
            }
            expect(NullPointerException.class, () -> invoke(handle, null, live, live, live));
            expect(IllegalStateException.class, () -> invoke(handle, closed, null, live, live));
            expect(IllegalArgumentException.class, () -> invoke(handle,
                    MemorySegment.ofArray(new byte[8]), closed, live, live));
            // Failure at a later argument must release the symbol and earlier arguments.
            expect(NullPointerException.class, () -> invoke(handle, live, live, null, closed));
            checkCount(live, 0);
            expect(IllegalStateException.class, () -> invoke(handle, live, live, closed, null));
            checkCount(live, 0);
            expect(IllegalArgumentException.class, () -> invoke(handle, live, live,
                    MemorySegment.ofArray(new byte[8]), null));
            checkCount(live, 0);
        }
    }

    private static void checkSkippedFirstSlot() throws Throwable {
        try (Arena symbols = Arena.ofShared(); Arena arguments = Arena.ofShared()) {
            MemorySegment symbol = symbols.allocate(8);
            MemorySegment argument = arguments.allocate(8);
            Runnable counts = () -> {
                checkCount(symbol, DEPTH > 0 ? 1 : 2);
                // Slot 1 is null when the first argument shares the symbol.
                // Slot 2 must still be examined at the default depth of 2.
                checkCount(argument, DEPTH >= 2 ? 1 : 2);
            };
            invoke(specialize(counts), symbol, symbol, argument, argument);
            checkCount(symbol, 0);
            checkCount(argument, 0);
            try {
                invoke(specialize(() -> { counts.run(); throw LEAF_FAILURE; }),
                        symbol, symbol, argument, argument);
                throw new AssertionError("Leaf did not throw");
            } catch (RuntimeException ex) {
                check(ex == LEAF_FAILURE, "Leaf failure after skipped slot preserved");
            }
            checkCount(symbol, 0);
            checkCount(argument, 0);
        }
    }

    private static void checkWrongThread() throws Throwable {
        try (Arena confined = Arena.ofConfined(); Arena shared = Arena.ofShared()) {
            MemorySegment owned = confined.allocate(8);
            MemorySegment live = shared.allocate(8);
            MethodHandle handle = specialize(() -> { throw new AssertionError("Leaf must not run"); });
            AtomicReference<Throwable> failure = new AtomicReference<>();
            Thread thread = new Thread(() -> {
                try {
                    expect(WrongThreadException.class, () -> invoke(handle, owned, null, live, live));
                    expect(WrongThreadException.class, () -> invoke(handle, live, live, owned, null));
                } catch (Throwable ex) {
                    failure.set(ex);
                }
            });
            thread.start();
            thread.join();
            if (failure.get() != null) {
                throw failure.get();
            }
            checkCount(live, 0);
            checkCount(owned, 0);
        }
    }

    private static void checkGlobalAndNullAddress() throws Throwable {
        MemorySegment global = MemorySegment.ofAddress(42);
        long result = invoke(specialize(() -> checkCount(global, 0)),
                global, MemorySegment.NULL, global, MemorySegment.NULL);
        check(result == 42, "NULL address is accepted independently of Java null");
    }

    public static void main(String[] args) throws Throwable {
        checkSameArena(Arena.ofShared());
        checkSameArena(Arena.ofConfined());
        checkBoundedSlots();
        checkSkippedFirstSlot();
        checkFailures();
        checkWrongThread();
        checkGlobalAndNullAddress();
        System.out.println("BINDING_SPECIALIZER_SCOPE_PASS depth=" + DEPTH + " checks=" + checks);
    }
}
