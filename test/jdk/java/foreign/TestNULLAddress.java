/*
 * Copyright (c) 2021, 2025, Oracle and/or its affiliates. All rights reserved.
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
 * @run testng/othervm/native
 *     --enable-native-access=ALL-UNNAMED
 *     TestNULLAddress
 */

import org.testng.annotations.Test;

import java.lang.foreign.Arena;
import java.lang.foreign.Linker;
import java.lang.foreign.FunctionDescriptor;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.SymbolLookup;
import java.lang.foreign.ValueLayout;
import java.lang.invoke.MethodHandle;
import java.util.concurrent.atomic.AtomicReference;

import static org.testng.Assert.*;

public class TestNULLAddress {

    static {
        System.loadLibrary("Null");
    }

    static final Linker LINKER = Linker.nativeLinker();

    @Test(expectedExceptions = IllegalArgumentException.class)
    public void testNULLLinking() {
        LINKER.downcallHandle(
                MemorySegment.NULL,
                FunctionDescriptor.ofVoid());
    }

    @Test(expectedExceptions = IllegalArgumentException.class)
    public void testNULLVirtual() throws Throwable {
        MethodHandle mh = LINKER.downcallHandle(
                FunctionDescriptor.ofVoid());
        mh.invokeExact(MemorySegment.NULL);
    }

    @Test
    public void testNULLViews() throws Throwable {
        MemorySegment zero = MemorySegment.ofAddress(0);
        assertNullSymbol(zero);
        assertNullSymbol(zero.reinterpret(16));
        assertNullSymbol(zero.reinterpret(16).asReadOnly());
        MemorySegment scoped;
        try (Arena arena = Arena.ofConfined()) {
            scoped = zero.reinterpret(16, arena, null);
            assertNullSymbol(scoped);
            AtomicReference<Throwable> failure = new AtomicReference<>();
            Thread thread = new Thread(() -> {
                try {
                    assertNullSymbol(scoped);
                } catch (Throwable ex) {
                    failure.set(ex);
                }
            });
            thread.start();
            thread.join();
            if (failure.get() != null) throw failure.get();
        }
        assertNullSymbol(scoped);
    }

    private static void assertNullSymbol(MemorySegment symbol) throws Throwable {
        String message = "Symbol is NULL: " + symbol;
        IllegalArgumentException bound = expectThrows(IllegalArgumentException.class,
                () -> LINKER.downcallHandle(symbol, FunctionDescriptor.ofVoid()));
        assertEquals(bound.getMessage(), message);
        MethodHandle unbound = LINKER.downcallHandle(FunctionDescriptor.ofVoid());
        IllegalArgumentException invocation = expectThrows(IllegalArgumentException.class,
                () -> { unbound.invokeExact(symbol); });
        assertEquals(invocation.getMessage(), message);
    }

    @Test
    public void testNullJavaReference() {
        MemorySegment symbol = null;
        expectThrows(NullPointerException.class,
                () -> LINKER.downcallHandle(symbol, FunctionDescriptor.ofVoid()));
        MethodHandle unbound = LINKER.downcallHandle(FunctionDescriptor.ofVoid());
        expectThrows(NullPointerException.class, () -> { unbound.invokeExact(symbol); });
    }

    @Test
    public void testZeroAddressHeapSymbol() {
        MemorySegment heap = MemorySegment.ofArray(new byte[0]);
        assertEquals(heap.address(), 0L);
        MethodHandle bound = LINKER.downcallHandle(heap, FunctionDescriptor.ofVoid());
        IllegalArgumentException invocation = expectThrows(IllegalArgumentException.class,
                () -> { bound.invokeExact(); });
        assertEquals(invocation.getMessage(), "Heap segment not allowed: " + heap);
    }

    @Test
    public void testNULLReturn_target() throws Throwable {
        MethodHandle mh = LINKER.downcallHandle(SymbolLookup.loaderLookup().find("get_null").get(),
                FunctionDescriptor.of(ValueLayout.ADDRESS.withTargetLayout(ValueLayout.JAVA_INT)));
        MemorySegment ret = (MemorySegment)mh.invokeExact();
        assertTrue(ret.equals(MemorySegment.NULL));
    }

    @Test
    public void testNULLReturn_plain() throws Throwable {
        MethodHandle mh = LINKER.downcallHandle(SymbolLookup.loaderLookup().find("get_null").get(),
                FunctionDescriptor.of(ValueLayout.ADDRESS));
        MemorySegment ret = (MemorySegment)mh.invokeExact();
        assertTrue(ret.equals(MemorySegment.NULL));
    }
}
