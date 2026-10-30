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
 * @summary Compare five-pointer FFM leases and failure cleanup with checked JNI
 * @requires jdk.foreign.linker != "FALLBACK" & jdk.foreign.linker != "UNSUPPORTED"
 * @modules java.base/jdk.internal.foreign java.base/jdk.internal.foreign.abi
 * @run main/othervm/native --enable-native-access=ALL-UNNAMED
 *      -Djdk.internal.foreign.DowncallLinker.USE_SPEC=true
 *      -Djdk.internal.foreign.abi.Specializer.SCOPE_DEDUP_DEPTH=2
 *      --add-opens=java.base/jdk.internal.foreign=ALL-UNNAMED TestSharedArenaReuse
 * @run main/othervm/native -Xint --enable-native-access=ALL-UNNAMED
 *      -Djdk.internal.foreign.DowncallLinker.USE_SPEC=true
 *      -Djdk.internal.foreign.abi.Specializer.SCOPE_DEDUP_DEPTH=2
 *      --add-opens=java.base/jdk.internal.foreign=ALL-UNNAMED TestSharedArenaReuse
 * @run main/othervm/native -XX:TieredStopAtLevel=1 --enable-native-access=ALL-UNNAMED
 *      -Djdk.internal.foreign.DowncallLinker.USE_SPEC=true
 *      -Djdk.internal.foreign.abi.Specializer.SCOPE_DEDUP_DEPTH=2
 *      --add-opens=java.base/jdk.internal.foreign=ALL-UNNAMED TestSharedArenaReuse
 */

import java.lang.foreign.*;
import java.lang.invoke.*;
import java.lang.ref.Reference;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicReference;
import jdk.internal.foreign.AbstractMemorySegmentImpl;
import jdk.internal.foreign.MemorySessionImpl;
import jdk.internal.foreign.abi.SharedUtils;

public class TestSharedArenaReuse {
    static { System.loadLibrary("SharedArenaReuse"); }
    static native void reset(boolean block);
    static native boolean entered();
    static native void unblock();
    static native int calls();
    static native long jniFive(long symbol, long a, long b, long c, long d, long e);
    static final FunctionDescriptor FD = FunctionDescriptor.of(ValueLayout.JAVA_LONG,
            ValueLayout.ADDRESS, ValueLayout.ADDRESS, ValueLayout.ADDRESS,
            ValueLayout.ADDRESS, ValueLayout.ADDRESS);
    static final MethodHandle FFM = Linker.nativeLinker().downcallHandle(FD);
    static final VarHandle COUNT;
    static int checks;
    static boolean baseline;
    static {
        try {
            COUNT = MethodHandles.privateLookupIn(MemorySessionImpl.class, MethodHandles.lookup())
                    .findVarHandle(MemorySessionImpl.class, "acquireCount", int.class);
        } catch (ReflectiveOperationException ex) { throw new ExceptionInInitializerError(ex); }
    }
    interface Action { void run() throws Throwable; }
    static void check(boolean test, String text) { checks++; if (!test) throw new AssertionError(text); }
    static void expect(Class<? extends Throwable> type, Action action) throws Throwable {
        try { action.run(); }
        catch (Throwable ex) { check(type.isInstance(ex), "Expected " + type + ", got " + ex); return; }
        throw new AssertionError("Missing " + type);
    }
    static int count(Arena arena) { return (int) COUNT.getVolatile((MemorySessionImpl) arena.scope()); }

    // Fixed-size scratch is prepared before invocation. The JNI path supports arbitrary
    // sessions and inputs; it does not assume the test's alias pattern or bypass checks.
    static final class CheckedJNI {
        final MemorySegment[] args;
        final MemorySessionImpl[] owners = new MemorySessionImpl[6];
        final long[] addresses = new long[6];
        CheckedJNI(MemorySegment symbol, MemorySegment[] data) {
            args = new MemorySegment[]{symbol, data[0], data[1], data[2], data[3], data[4]};
        }
        long invoke() {
            SharedUtils.checkSymbol(args[0]);
            int acquired = 0;
            try {
                for (int i = 0; i < args.length; i++) {
                    MemorySessionImpl session = ((AbstractMemorySegmentImpl) args[i]).sessionImpl();
                    boolean held = false;
                    for (int j = 0; j < acquired; j++) held |= owners[j] == session;
                    if (!held) { session.acquire0(); owners[acquired++] = session; }
                    SharedUtils.checkNative(args[i]);
                    addresses[i] = args[i].address();
                }
                return jniFive(addresses[0], addresses[1], addresses[2], addresses[3], addresses[4], addresses[5]);
            } finally {
                for (int i = 0; i < acquired; i++) { owners[i].release0(); owners[i] = null; }
                Reference.reachabilityFence(args);
            }
        }
    }
    static long invoke(boolean jni, MemorySegment symbol, MemorySegment[] data) throws Throwable {
        if (jni) return new CheckedJNI(symbol, data).invoke();
        return (long) FFM.invokeExact(symbol, data[0], data[1], data[2], data[3], data[4]);
    }
    static void inFlight(boolean jni, MemorySegment symbol, int tag, Arena[] arenas,
                         MemorySegment[] pool, int[] pattern, int[] expected) throws Throwable {
        MemorySegment[] args = Arrays.stream(pattern).mapToObj(i -> pool[i]).toArray(MemorySegment[]::new);
        long sum = tag;
        for (MemorySegment arg : args) sum += arg.get(ValueLayout.JAVA_LONG, 0);
        final long wanted = sum;
        CheckedJNI checked = new CheckedJNI(symbol, args);
        AtomicReference<Throwable> failure = new AtomicReference<>();
        reset(true);
        Thread worker = Thread.ofPlatform().start(() -> {
            try {
                long actual = jni ? checked.invoke() : (long) FFM.invokeExact(symbol, args[0], args[1], args[2], args[3], args[4]);
                if (actual != wanted) throw new AssertionError("Wrong target/result " + actual + "/" + wanted);
            } catch (Throwable ex) { failure.set(ex); }
        });
        try {
            long deadline = System.nanoTime() + 10_000_000_000L;
            while (!entered() && worker.isAlive() && System.nanoTime() < deadline) Thread.yield();
            check(entered(), "Native call did not enter: " + failure.get());
            for (int i = 0; i < arenas.length; i++) {
                check(count(arenas[i]) == expected[i], "Lease count arena " + i + ": " + count(arenas[i]) + " expected " + expected[i]);
                if (expected[i] > 0) expect(IllegalStateException.class, arenas[i]::close);
            }
            System.out.println("LEASE_COUNTS mode=" + (jni ? "JNI" : "FFM")
                    + " target=" + tag + " pattern=" + Arrays.toString(pattern)
                    + " actual=" + Arrays.toString(Arrays.stream(arenas).mapToInt(TestSharedArenaReuse::count).toArray()));
        } finally { unblock(); worker.join(10000); }
        check(!worker.isAlive(), "Native worker did not return");
        if (failure.get() != null) throw failure.get();
        check(calls() == 1, "Native target call count");
        for (Arena arena : arenas) check(count(arena) == 0, "Lease leaked after return");
    }
    static void failures(boolean jni, MemorySegment symbol, Arena[] arenas, MemorySegment[] data) throws Throwable {
        MemorySegment closed;
        try (Arena dead = Arena.ofShared()) { closed = dead.allocate(8); }
        MemorySegment b = data[1], c = data[2];
        reset(false);
        expect(IllegalStateException.class, () -> invoke(jni, symbol, new MemorySegment[]{b,b,c,closed,null}));
        expect(NullPointerException.class, () -> invoke(jni, symbol, new MemorySegment[]{b,b,c,null,closed}));
        expect(IllegalArgumentException.class, () -> invoke(jni, symbol, new MemorySegment[]{b,b,c,MemorySegment.ofArray(new byte[8]),null}));
        expect(NullPointerException.class, () -> invoke(jni, null, new MemorySegment[]{closed,b,c,c,c}));
        expect(IllegalArgumentException.class, () -> invoke(jni, MemorySegment.NULL, new MemorySegment[]{closed,b,c,c,c}));
        expect(IllegalStateException.class, () -> invoke(jni, symbol, new MemorySegment[]{b,b,closed,null,c}));
        expect(NullPointerException.class, () -> invoke(jni, symbol, new MemorySegment[]{b,b,null,closed,c}));
        expect(IllegalStateException.class, () -> invoke(jni, symbol, new MemorySegment[]{b,b,c,c,closed}));
        expect(NullPointerException.class, () -> invoke(jni, symbol, new MemorySegment[]{b,b,c,c,null}));
        expect(IllegalArgumentException.class, () -> invoke(jni, symbol, new MemorySegment[]{b,b,c,c,MemorySegment.ofArray(new byte[8])}));
        // NULL and heap arrays share the global session. A cache hit must
        // still execute the heap argument's native-address validation.
        expect(IllegalArgumentException.class, () -> invoke(jni, symbol,
                new MemorySegment[]{b,b,c,MemorySegment.NULL,MemorySegment.ofArray(new byte[8])}));
        MemorySessionImpl overflow = (MemorySessionImpl) arenas[3].scope();
        COUNT.setVolatile(overflow, Integer.MAX_VALUE);
        try {
            expect(IllegalStateException.class, () -> invoke(jni, symbol, new MemorySegment[]{b,b,c,data[3],null}));
            check((int) COUNT.getVolatile(overflow) == Integer.MAX_VALUE, "Failed acquire was released");
        } finally { COUNT.setVolatile(overflow, 0); }
        check(calls() == 0, "Invalid call entered native code");
        for (Arena arena : arenas) check(count(arena) == 0, "Partial-acquisition leak");
        try (Arena confined = Arena.ofConfined()) {
            MemorySegment wrong = confined.allocate(8);
            AtomicReference<Throwable> failure = new AtomicReference<>();
            Thread worker = Thread.ofPlatform().start(() -> {
                try { expect(WrongThreadException.class, () -> invoke(jni, symbol, new MemorySegment[]{b,b,c,wrong,null})); }
                catch (Throwable ex) { failure.set(ex); }
            });
            worker.join(); if (failure.get() != null) throw failure.get();
            check(calls() == 0, "Wrong-thread call entered native code");
            for (Arena arena : arenas) check(count(arena) == 0, "Wrong-thread cleanup leak");
        }
        long actual = invoke(jni, symbol, new MemorySegment[]{b,b,c,MemorySegment.NULL,c});
        check(actual == 1000 + 2*22 + 2*33, "Data NULL must remain valid");
    }
    static void optionShape(boolean pair, SymbolLookup lookup, Arena[] arenas, MemorySegment[] data) throws Throwable {
        MemoryLayout resultLayout = MemoryLayout.structLayout(ValueLayout.JAVA_LONG, ValueLayout.JAVA_LONG);
        FunctionDescriptor descriptor = pair ? FunctionDescriptor.of(resultLayout,
                ValueLayout.ADDRESS, ValueLayout.ADDRESS, ValueLayout.ADDRESS,
                ValueLayout.ADDRESS, ValueLayout.ADDRESS) : FD;
        MethodHandle handle = pair ? Linker.nativeLinker().downcallHandle(descriptor)
                : Linker.nativeLinker().downcallHandle(descriptor, Linker.Option.captureCallState("errno"));
        MemorySegment symbol = lookup.find(pair ? "shared_reuse_pair" : "shared_reuse_five").orElseThrow();
        try (Arena extra = Arena.ofShared()) {
            MemorySegment capture = extra.allocate(Linker.Option.captureStateLayout());
            AtomicReference<Throwable> failure = new AtomicReference<>();
            reset(true);
            Thread worker = Thread.ofPlatform().start(() -> {
                try {
                    if (pair) {
                        MemorySegment result = (MemorySegment) handle.invokeExact(symbol, (SegmentAllocator) extra,
                                data[1], data[1], data[2], data[2], data[2]);
                        if (result.get(ValueLayout.JAVA_LONG,0) != 1143 || result.get(ValueLayout.JAVA_LONG,8) != 1144)
                            throw new AssertionError("Return-buffer result");
                    } else {
                        long result = (long) handle.invokeExact(symbol, capture,
                                data[1], data[1], data[2], data[2], data[2]);
                        if (result != 1143) throw new AssertionError("Capture result " + result);
                    }
                } catch (Throwable ex) { failure.set(ex); }
            });
            try {
                long deadline = System.nanoTime() + 10_000_000_000L;
                while (!entered() && worker.isAlive() && System.nanoTime() < deadline) Thread.yield();
                check(entered(), "Option native call did not enter: " + failure.get());
                check(count(arenas[0]) == 1 && count(arenas[1]) == 1
                        && count(arenas[2]) == (baseline ? 3 : 1), "Option scope ownership");
                for (int i=0;i<3;i++) expect(IllegalStateException.class,arenas[i]::close);
                if (!pair) {
                    check(count(extra)==1,"Capture segment must be leased");
                    expect(IllegalStateException.class,extra::close);
                }
            } finally { unblock(); worker.join(10000); }
            check(!worker.isAlive(),"Option worker did not return");
            if (failure.get()!=null) throw failure.get();
            check(calls()==1,"Option native target count");
            for (Arena arena:arenas) check(count(arena)==0,"Option scope leak");
            check(count(extra)==0,"Option extra arena leak");
        }
    }

    public static void main(String[] args) throws Throwable {
        baseline = args.length != 0 && args[0].equals("baseline");
        Arena[] arenas = new Arena[6]; MemorySegment[] data = new MemorySegment[6];
        try {
            for (int i = 0; i < arenas.length; i++) {
                arenas[i] = Arena.ofShared(); data[i] = arenas[i].allocate(ValueLayout.JAVA_LONG);
                data[i].set(ValueLayout.JAVA_LONG, 0, 11L*(i+1));
            }
            Path library = Path.of(System.getProperty("test.nativepath"), System.mapLibraryName("SharedArenaReuse"));
            SymbolLookup lookup = SymbolLookup.libraryLookup(library, arenas[0]);
            MemorySegment symbol = lookup.find("shared_reuse_five").orElseThrow();
            MemorySegment alternate = lookup.find("shared_reuse_five_alt").orElseThrow();
            int[][] patterns={{1,1,2,2,2},{1,2,3,4,5},{1,1,2,3,2},{1,1,2,1,2},{0,1,2,2,2}};
            int[][] expected={{1,1,baseline?3:1,0,0,0},{1,1,1,1,1,1},{1,1,2,1,0,0},{1,1,baseline?2:1,0,0,0},{1,1,baseline?3:1,0,0,0}};
            for (int i = 0; i < patterns.length; i++) {
                inFlight(false,symbol,1000,arenas,data,patterns[i],expected[i]);
                int[] unique = new int[6]; unique[0]=1; for (int x:patterns[i]) unique[x]=1;
                inFlight(true,symbol,1000,arenas,data,patterns[i],unique);
            }
            inFlight(false,alternate,2000,arenas,data,patterns[0],expected[0]);
            inFlight(true,alternate,2000,arenas,data,patterns[0],new int[]{1,1,1,0,0,0});
            failures(false,symbol,arenas,data); failures(true,symbol,arenas,data);
            optionShape(false,lookup,arenas,data); optionShape(true,lookup,arenas,data);
            arenas[0].close();
            expect(IllegalStateException.class, () -> invoke(false,symbol,new MemorySegment[]{data[1],data[1],data[2],data[2],data[2]}));
            expect(IllegalStateException.class, () -> invoke(true,symbol,new MemorySegment[]{data[1],data[1],data[2],data[2],data[2]}));
            // Reuse the descriptor's unbound handle with an independently scoped
            // library after the original library arena has already closed.
            try (Arena secondSymbols = Arena.ofShared()) {
                SymbolLookup second = SymbolLookup.libraryLookup(library,secondSymbols);
                MemorySegment target = second.find("shared_reuse_five_alt").orElseThrow();
                Arena[] otherArenas = arenas.clone(); otherArenas[0]=secondSymbols;
                MemorySegment[] otherData = data.clone(); otherData[0]=secondSymbols.allocate(ValueLayout.JAVA_LONG);
                otherData[0].set(ValueLayout.JAVA_LONG,0,11);
                inFlight(false,target,2000,otherArenas,otherData,patterns[0],expected[0]);
                inFlight(true,target,2000,otherArenas,otherData,patterns[0],new int[]{1,1,1,0,0,0});
                check(!arenas[0].scope().isAlive(),"New symbol reused closed library arena");
            }
        } finally {
            unblock(); for (Arena arena:arenas) if (arena != null && arena.scope().isAlive()) arena.close();
        }
        System.out.println("SHARED_ARENA_REUSE_NATIVE_PASS baseline="+baseline+" checks="+checks);
    }
}
