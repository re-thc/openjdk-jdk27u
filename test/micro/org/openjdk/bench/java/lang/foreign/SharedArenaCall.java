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

package org.openjdk.bench.java.lang.foreign;

import java.lang.foreign.Arena;
import java.lang.foreign.FunctionDescriptor;
import java.lang.foreign.Linker;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.SymbolLookup;
import java.lang.foreign.ValueLayout;
import java.lang.invoke.MethodHandle;
import java.lang.ref.Reference;
import java.nio.file.Path;
import java.util.concurrent.TimeUnit;

import jdk.internal.foreign.AbstractMemorySegmentImpl;
import jdk.internal.foreign.MemorySessionImpl;
import org.openjdk.jmh.annotations.*;

@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 5, time = 500, timeUnit = TimeUnit.MILLISECONDS)
@Measurement(iterations = 5, time = 500, timeUnit = TimeUnit.MILLISECONDS)
@Fork(value = 3, jvmArgs = {
        "--enable-native-access=ALL-UNNAMED",
        "--add-exports=java.base/jdk.internal.foreign=ALL-UNNAMED",
        "-Djava.library.path=micro/native"})
@State(Scope.Thread)
public class SharedArenaCall {
    static {
        System.loadLibrary("SharedArenaCall");
    }

    private static final MethodHandle FIVE = Linker.nativeLinker().downcallHandle(
            FunctionDescriptor.of(ValueLayout.JAVA_LONG, ValueLayout.ADDRESS,
                    ValueLayout.ADDRESS, ValueLayout.ADDRESS, ValueLayout.ADDRESS,
                    ValueLayout.ADDRESS));

    @Param({"shared", "confined", "global"})
    public String lifetime;

    @Param({"shared", "global"})
    public String symbolLifetime;

    // Letters identify arenas, not just equal addresses. S is the symbol arena.
    @Param({"AAAAA", "AABBB", "AABAB", "ABCBC", "AABCB", "ABCDE", "SABBB", "slices"})
    public String pattern;

    private Arena symbols;
    private Arena[] arenas;
    private MemorySegment symbol, a, b, c, d, e;

    private static Arena arena(String lifetime) {
        return switch (lifetime) {
            case "shared" -> Arena.ofShared();
            case "confined" -> Arena.ofConfined();
            case "global" -> Arena.global();
            default -> throw new IllegalArgumentException(lifetime);
        };
    }

    @Setup
    public void setup() throws Throwable {
        symbols = arena(symbolLifetime);
        arenas = new Arena[5];
        MemorySegment[] data = new MemorySegment[5];
        for (int i = 0; i < arenas.length; i++) {
            arenas[i] = arena(lifetime);
            data[i] = arenas[i].allocate(24, 8);
            for (int j = 0; j < 3; j++) {
                data[i].set(ValueLayout.JAVA_LONG, j * 8L, 10L * (i + 1) + j);
            }
        }
        Path library = Path.of(System.getProperty("java.library.path"),
                System.mapLibraryName("SharedArenaCall"));
        symbol = SymbolLookup.libraryLookup(library, symbols).findOrThrow("shared_arena_five");
        MemorySegment[] args = new MemorySegment[5];
        if (pattern.equals("slices")) {
            args = new MemorySegment[]{data[0], data[0].asSlice(8),
                    data[1], data[1].asSlice(8), data[1].asSlice(16)};
        } else {
            MemorySegment inSymbols = symbols.allocate(ValueLayout.JAVA_LONG);
            inSymbols.set(ValueLayout.JAVA_LONG, 0, 7L);
            for (int i = 0; i < args.length; i++) {
                char letter = pattern.charAt(i);
                args[i] = letter == 'S' ? inSymbols : data[letter - 'A'];
            }
        }
        a = args[0]; b = args[1]; c = args[2]; d = args[3]; e = args[4];
        long expected = 1000;
        for (MemorySegment arg : args) {
            expected += arg.get(ValueLayout.JAVA_LONG, 0);
        }
        if (ffm() != expected || checkedJNI() != expected) {
            throw new AssertionError("Different native target or result");
        }
    }

    @TearDown
    public void tearDown() {
        for (Arena arena : arenas) {
            if (arena != Arena.global()) arena.close();
        }
        if (symbols != Arena.global()) symbols.close();
    }

    @Benchmark
    public long ffm() throws Throwable {
        return (long) FIVE.invokeExact(symbol, a, b, c, d, e);
    }

    @Benchmark
    public long checkedJNI() {
        return checkedFive(symbol, a, b, c, d, e);
    }

    private static native long jniFive(long target, long a, long b, long c, long d, long e);

    private static MemorySessionImpl session(MemorySegment segment) {
        return ((AbstractMemorySegmentImpl) segment).sessionImpl();
    }

    // Same per-segment native-address validation as SharedUtils.unboxSegment.
    private static long unbox(MemorySegment segment) {
        if (!segment.isNative()) {
            throw new IllegalArgumentException("Heap segment not allowed: " + segment);
        }
        return segment.address();
    }

    // Fixed-arity checked JNI control: no allocation, precomputed addresses,
    // pattern assumptions, or weaker lifetime checks. Retain a successfully
    // acquired session once and release it even if a later argument is invalid.
    // Compare all held sessions; FFM intentionally uses a bounded cache.
    static long checkedFive(MemorySegment symbol, MemorySegment a, MemorySegment b,
                            MemorySegment c, MemorySegment d, MemorySegment e) {
        if (symbol.isNative() && symbol.address() == 0) {
            throw new IllegalArgumentException("Symbol is NULL: " + symbol);
        }
        MemorySessionImpl s0 = null, s1 = null, s2 = null, s3 = null, s4 = null, s5 = null;
        try {
            MemorySessionImpl next = session(symbol);
            next.acquire0();
            s0 = next;
            long target = unbox(symbol);
            next = session(a);
            if (next != s0) {
                next.acquire0();
                s1 = next;
            }
            long p1 = unbox(a);
            next = session(b);
            if (next != s0 && next != s1) {
                next.acquire0();
                s2 = next;
            }
            long p2 = unbox(b);
            next = session(c);
            if (next != s0 && next != s1 && next != s2) {
                next.acquire0();
                s3 = next;
            }
            long p3 = unbox(c);
            next = session(d);
            if (next != s0 && next != s1 && next != s2 && next != s3) {
                next.acquire0();
                s4 = next;
            }
            long p4 = unbox(d);
            next = session(e);
            if (next != s0 && next != s1 && next != s2 && next != s3 && next != s4) {
                next.acquire0();
                s5 = next;
            }
            long p5 = unbox(e);
            return jniFive(target, p1, p2, p3, p4, p5);
        } finally {
            if (s0 != null) s0.release0();
            if (s1 != null) s1.release0();
            if (s2 != null) s2.release0();
            if (s3 != null) s3.release0();
            if (s4 != null) s4.release0();
            if (s5 != null) s5.release0();
            Reference.reachabilityFence(symbol);
            Reference.reachabilityFence(a);
            Reference.reachabilityFence(b);
            Reference.reachabilityFence(c);
            Reference.reachabilityFence(d);
            Reference.reachabilityFence(e);
        }
    }
}
