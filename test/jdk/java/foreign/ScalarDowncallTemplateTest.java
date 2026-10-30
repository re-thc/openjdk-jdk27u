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
 * @summary Verify exact long/double templates, native calls, fallback and hidden-class lifetime
 * @modules java.base/jdk.internal.foreign.abi java.base/jdk.internal.misc
 * @compile --patch-module java.base=${test.src} ScalarDowncallTemplateTest.java
 * @run main/othervm/native --enable-native-access=java.base --patch-module java.base=${test.classes} jdk.internal.foreign.abi.ScalarDowncallTemplateTest long
 * @run main/othervm/native --enable-native-access=java.base --patch-module java.base=${test.classes} jdk.internal.foreign.abi.ScalarDowncallTemplateTest double
 * @run main/othervm/native --enable-native-access=java.base --patch-module java.base=${test.classes} jdk.internal.foreign.abi.ScalarDowncallTemplateTest long int-first
 * @run main/othervm/native --enable-native-access=java.base --patch-module java.base=${test.classes} jdk.internal.foreign.abi.ScalarDowncallTemplateTest double int-first
 * @run main/othervm -Xmx128m -XX:+UseSerialGC -XX:+ClassUnloading -XX:-DisableExplicitGC --patch-module java.base=${test.classes} jdk.internal.foreign.abi.ScalarDowncallTemplateTest unloading
 */
package jdk.internal.foreign.abi;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.lang.reflect.ClassFileFormatVersion;
import java.lang.foreign.*;
import java.lang.invoke.*;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.nio.ByteOrder;
import java.nio.file.Path;
import java.util.*;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.atomic.AtomicInteger;
import jdk.internal.misc.Unsafe;
import jdk.internal.vm.annotation.DontInline;

public class ScalarDowncallTemplateTest {
    private static final AtomicInteger checks = new AtomicInteger();
    private static final long[] LONGS = {0, 1, -1, Long.MIN_VALUE, Long.MAX_VALUE,
            Long.MIN_VALUE + 1, Long.MAX_VALUE - 1, 0xffff_ffffL, 0x1_0000_0000L, -0x1_0000_0000L};
    private static final long[] DOUBLE_BITS = {0, Long.MIN_VALUE, 1, 0x0010_0000_0000_0000L,
            0x7fef_ffff_ffff_ffffL, 0x3ff0_0000_0000_0000L, 0xbff0_0000_0000_0000L,
            0x7ff0_0000_0000_0000L, 0xfff0_0000_0000_0000L, 0x7ff8_0000_0000_0042L,
            0xfff8_0000_0000_0055L, 0x7ff0_0000_0000_0001L};
    private record Recipe(String platform, ABIDescriptor abi, CallingSequence sequence) {}

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
        checks.incrementAndGet();
    }

    private static Object field(Class<?> type, String name) throws Exception {
        var f = type.getDeclaredField(name); f.setAccessible(true); return f.get(null);
    }

    private static ValueLayout layout(int kind) {
        return kind == 1 ? ValueLayout.JAVA_LONG : ValueLayout.JAVA_DOUBLE;
    }

    private static Recipe recipe(String platform, int kind) throws Exception {
        var fd = FunctionDescriptor.of(layout(kind), layout(kind));
        Class<?> arranger = Class.forName("jdk.internal.foreign.abi." +
                (platform.equals("linux-x64-sysv") ? "x64.sysv" : "aarch64") + ".CallArranger");
        Object receiver = platform.equals("linux-x64-sysv") ? null : field(arranger, "LINUX");
        ABIDescriptor abi;
        if (receiver == null) abi = (ABIDescriptor) field(arranger, "CSysV");
        else {
            Method method = arranger.getDeclaredMethod("abiDescriptor"); method.setAccessible(true);
            abi = (ABIDescriptor) method.invoke(receiver);
        }
        Object bindings = arranger.getMethod("getBindings", MethodType.class, FunctionDescriptor.class,
                boolean.class, LinkerOptions.class).invoke(receiver, fd.toMethodType(), fd, false, LinkerOptions.empty());
        CallingSequence cs = (CallingSequence) bindings.getClass().getMethod("callingSequence").invoke(bindings);
        return new Recipe(platform, abi, cs);
    }

    private static MethodType caller(CallingSequence cs) {
        return cs.callerMethodType().insertParameterTypes(0, SegmentAllocator.class);
    }

    private static List<List<Binding>> arguments(CallingSequence cs) {
        List<List<Binding>> args = new ArrayList<>();
        for (int i = 0; i < cs.argumentBindingsCount(); i++) args.add(new ArrayList<>(cs.argumentBindings(i)));
        return args;
    }

    private static CallingSequence copy(CallingSequence cs, FunctionDescriptor fd,
                                        List<List<Binding>> args, List<Binding> result, LinkerOptions options) {
        return new CallingSequence(cs.forUpcall(), cs.callerMethodType(), cs.calleeMethodType(), fd,
                cs.needsReturnBuffer(), cs.returnBufferSize(), cs.allocationSize(), args, result, options);
    }

    private static boolean matches(DowncallTemplates.Entry e, Recipe r, CallingSequence cs) {
        return DowncallTemplates.matches(e, r.platform(), r.abi(), cs, cs.calleeMethodType(), caller(cs));
    }

    private static void checkGuards(int kind) throws Exception {
        for (String platform : List.of("linux-x64-sysv", "linux-aarch64")) {
            Recipe r = recipe(platform, kind); CallingSequence cs = r.sequence();
            DowncallTemplates.Entry entry = Arrays.stream(GeneratedDowncallTemplateData.ENTRIES)
                    .filter(e -> e.platform().equals(platform)).findFirst().orElse(null);
            if (entry == null) continue;
            check(matches(entry, r, cs), "exact scalar recipe " + platform + '/' + kind);
            ValueLayout scalar = layout(kind);
            for (ValueLayout bad : new ValueLayout[]{scalar.withByteAlignment(1),
                    scalar.withOrder(ByteOrder.nativeOrder() == ByteOrder.LITTLE_ENDIAN
                            ? ByteOrder.BIG_ENDIAN : ByteOrder.LITTLE_ENDIAN)}) {
                CallingSequence near = copy(cs, FunctionDescriptor.of(bad, ValueLayout.ADDRESS, scalar),
                        arguments(cs), cs.returnBindings(), LinkerOptions.empty());
                check(!matches(entry, r, near), "layout near miss");
            }
            for (Linker.Option option : new Linker.Option[]{Linker.Option.critical(false),
                    Linker.Option.critical(true), Linker.Option.firstVariadicArg(1),
                    Linker.Option.captureCallState("errno")}) {
                LinkerOptions options = LinkerOptions.forDowncall(FunctionDescriptor.of(scalar, scalar), option);
                check(!matches(entry, r, copy(cs, cs.functionDesc(), arguments(cs), cs.returnBindings(), options)),
                        "nonempty option rejected " + option);
            }
            check(!DowncallTemplates.matches(entry, platform, r.abi(), cs,
                    cs.calleeMethodType().changeReturnType(kind == 1 ? double.class : long.class), caller(cs)),
                    "wrong carrier rejected");
            List<List<Binding>> changed = arguments(cs);
            Binding.VMStore store = (Binding.VMStore) changed.get(1).get(0);
            VMStorage st = store.storage();
            changed.get(1).set(0, new Binding.VMStore(new VMStorage(st.type(), st.segmentMaskOrSize(),
                    st.indexOrOffset() + 1, st.debugName()), store.type()));
            check(!matches(entry, r, copy(cs, cs.functionDesc(), changed, cs.returnBindings(), LinkerOptions.empty())),
                    "wrong argument storage rejected");
            Binding.VMLoad load = (Binding.VMLoad) cs.returnBindings().get(0); st = load.storage();
            List<Binding> result = List.of(new Binding.VMLoad(new VMStorage(st.type(), st.segmentMaskOrSize(),
                    st.indexOrOffset() + 1, st.debugName()), load.type()));
            check(!matches(entry, r, copy(cs, cs.functionDesc(), arguments(cs), result, LinkerOptions.empty())),
                    "wrong return storage rejected");
            ABIDescriptor abi = r.abi();
            ABIDescriptor wrong = new ABIDescriptor(abi.arch, abi.inputStorage, abi.outputStorage, abi.volatileStorage,
                    abi.stackAlignment + 1, abi.shadowSpace, abi.scratch1, abi.scratch2, abi.targetAddrStorage,
                    abi.retBufAddrStorage, abi.capturedStateStorage);
            check(!DowncallTemplates.matches(entry, platform, wrong, cs, cs.calleeMethodType(), caller(cs)),
                    "wrong ABI rejected");
        }
        if (GeneratedDowncallTemplateData.length(kind) == 0) return;
        int major = ClassFileFormatVersion.latest().major();
        String id = DowncallTemplateVersion.ID;
        byte[] bundle = GeneratedDowncallTemplateData.open(kind).readAllBytes();
        check(DowncallTemplates.decode(new ByteArrayInputStream(bundle), id, major,
                GeneratedDowncallTemplateData.length(kind), GeneratedDowncallTemplateData.crc(kind)) != null,
                "valid scalar payload");
        check(DowncallTemplates.decode(new ByteArrayInputStream(bundle), id + "stale", major,
                GeneratedDowncallTemplateData.length(kind), GeneratedDowncallTemplateData.crc(kind)) == null,
                "stale source rejected");
        check(DowncallTemplates.decode(new ByteArrayInputStream(bundle), id, major + 1,
                GeneratedDowncallTemplateData.length(kind), GeneratedDowncallTemplateData.crc(kind)) == null,
                "wrong classfile version rejected");
        check(DowncallTemplates.decode(new ByteArrayInputStream(bundle), id, major,
                GeneratedDowncallTemplateData.length(3 - kind), GeneratedDowncallTemplateData.crc(3 - kind)) == null,
                "swapped long/double payload rejected");
        byte[] malformed = bundle.clone(); malformed[0] ^= 1;
        check(DowncallTemplates.decode(new ByteArrayInputStream(malformed), id, major,
                GeneratedDowncallTemplateData.length(kind), GeneratedDowncallTemplateData.crc(kind)) == null,
                "malformed header rejected");
        malformed = bundle.clone(); malformed[malformed.length - 1] ^= 1;
        check(DowncallTemplates.decode(new ByteArrayInputStream(malformed), id, major,
                GeneratedDowncallTemplateData.length(kind), GeneratedDowncallTemplateData.crc(kind)) == null,
                "bad checksum rejected");
        for (int length : new int[]{0, 3, 13, bundle.length - 1}) {
            try {
                check(DowncallTemplates.decode(new ByteArrayInputStream(Arrays.copyOf(bundle, length)), id, major,
                        GeneratedDowncallTemplateData.length(kind), GeneratedDowncallTemplateData.crc(kind)) == null,
                        "truncated payload rejected");
            } catch (IOException expected) { checks.incrementAndGet(); }
        }
    }

    private static long callLong(MethodHandle h, MemorySegment symbol, long value) throws Throwable {
        return (long) h.invokeExact(symbol, value);
    }
    private static double callDouble(MethodHandle h, MemorySegment symbol, double value) throws Throwable {
        return (double) h.invokeExact(symbol, value);
    }
    private static void sameDouble(double actual, long expected) {
        check(Double.isNaN(Double.longBitsToDouble(expected)) ? Double.isNaN(actual)
                : Double.doubleToRawLongBits(actual) == expected, "double identity bits");
    }

    private static void nativeCalls(int kind, boolean intFirst) throws Throwable {
        Linker linker = Linker.nativeLinker();
        Path lib = Path.of(System.getProperty("test.nativepath"), System.mapLibraryName("ScalarDowncallTemplates"));
        FunctionDescriptor fd = FunctionDescriptor.of(layout(kind), layout(kind));
        Arena first = Arena.ofConfined();
        try (Arena second = Arena.ofShared()) {
            SymbolLookup a = SymbolLookup.libraryLookup(lib, first), b = SymbolLookup.libraryLookup(lib, second);
            if (intFirst) {
                MethodHandle ih = linker.downcallHandle(a.find("scalar_int").orElseThrow(),
                        FunctionDescriptor.of(ValueLayout.JAVA_INT, ValueLayout.JAVA_INT));
                check((int) ih.invokeExact(17) == 17, "int first");
            }
            MethodHandle h = linker.downcallHandle(fd);
            MemorySegment symbol = a.find(kind == 1 ? "scalar_long" : "scalar_double").orElseThrow();
            MemorySegment signed = kind == 1 ? a.find("scalar_long_signed").orElseThrow() : null;
            MemorySegment other = b.find(kind == 1 ? "scalar_long_xor" : "scalar_double_flip").orElseThrow();
            Class<?> constants = Class.forName("jdk.internal.foreign.abi.BindingSpecializer$EmissionConstants", false, null);
            if (!DowncallTemplates.platform().equals("unsupported")) {
                check(Unsafe.getUnsafe().shouldBeInitialized(constants), "new scalar uses template before int/fallback emission");
            }
            for (int repeat = 0; repeat < 20000; repeat++) {
                if (kind == 1) for (long value : LONGS) {
                    check(callLong(h, symbol, value) == value, "unsigned long bits");
                    check(callLong(h, signed, value) == value, "signed long bits");
                    check(callLong(h, other, value) == (value ^ 0x55), "independent long symbol");
                } else for (long bits : DOUBLE_BITS) {
                    double value = Double.longBitsToDouble(bits);
                    sameDouble(callDouble(h, symbol, value), bits);
                    sameDouble(callDouble(h, other, value), bits ^ Long.MIN_VALUE);
                }
            }
            MethodHandle critical = linker.downcallHandle(fd, Linker.Option.critical(false));
            if (kind == 1) check(callLong(critical, symbol, Long.MIN_VALUE) == Long.MIN_VALUE, "critical fallback");
            else sameDouble(callDouble(critical, symbol, -0.0), Long.MIN_VALUE);
            AtomicReference<Throwable> failure = new AtomicReference<>();
            Thread thread = new Thread(() -> {
                try {
                    try {
                        if (kind == 1) callLong(h, symbol, 1); else callDouble(h, symbol, 1);
                        throw new AssertionError("wrong-thread symbol accepted");
                    } catch (WrongThreadException expected) {}
                    MethodHandle independent = linker.downcallHandle(fd);
                    if (kind == 1) check(callLong(independent, other, 7) == (7 ^ 0x55), "shared arena thread");
                    else sameDouble(callDouble(independent, other, 1), Double.doubleToRawLongBits(-1));
                } catch (Throwable ex) { failure.set(ex); }
            });
            thread.start(); thread.join(); if (failure.get() != null) throw failure.get();
            first.close();
            try {
                if (kind == 1) callLong(h, symbol, 1); else callDouble(h, symbol, 1);
                throw new AssertionError("closed symbol accepted");
            } catch (IllegalStateException expected) {}
            if (kind == 1) check(callLong(h, other, 7) == (7 ^ 0x55), "independent arena survives close");
            else sameDouble(callDouble(h, other, 1), Double.doubleToRawLongBits(-1));
        } finally {
            if (first.scope().isAlive()) first.close();
        }
    }

    public static long javaLong(long address, long value) { return value; }
    public static long javaLongOther(long address, long value) { return value + 17; }
    public static double javaDoubleOther(long address, double value) { return value + 17; }
    private static final RuntimeException FAILURE = new RuntimeException("leaf failure");
    public static long javaLongFailure(long address, long value) { throw FAILURE; }
    public static double javaDoubleFailure(long address, double value) { throw FAILURE; }
    public static double javaDouble(long address, double value) { return value; }

    private static void concurrent(int kind) throws Throwable {
        if (DowncallTemplates.platform().equals("unsupported")) return;
        Recipe recipe = recipe(DowncallTemplates.platform(), kind);
        AtomicReference<Throwable> failure = new AtomicReference<>();
        List<Thread> threads = new ArrayList<>();
        CountDownLatch ready = new CountDownLatch(4), start = new CountDownLatch(1);
        for (int i = 0; i < 4; i++) {
            Thread t = new Thread(() -> {
                ready.countDown();
                try {
                    start.await();
                } catch (InterruptedException ex) {
                    failure.compareAndSet(null, ex); return;
                }
                try (Arena arena = Arena.ofConfined()) {
                    MemorySegment symbol = MemorySegment.ofAddress(0x1234).reinterpret(8, arena, null);
                    String name = kind == 1 ? "javaLong" : "javaDouble";
                    MethodHandle leaf = MethodHandles.lookup().findStatic(ScalarDowncallTemplateTest.class,
                            name, recipe.sequence().calleeMethodType());
                    MethodHandle other = MethodHandles.lookup().findStatic(ScalarDowncallTemplateTest.class,
                            name + "Other", recipe.sequence().calleeMethodType());
                    MethodHandle bad = MethodHandles.lookup().findStatic(ScalarDowncallTemplateTest.class,
                            name + "Failure", recipe.sequence().calleeMethodType());
                    MethodHandle a = BindingSpecializer.specializeDowncall(leaf, recipe.sequence(), recipe.abi());
                    MethodHandle b = BindingSpecializer.specializeDowncall(other, recipe.sequence(), recipe.abi());
                    MethodHandle c = BindingSpecializer.specializeDowncall(bad, recipe.sequence(), recipe.abi());
                    if (kind == 1) {
                        check((long) a.invokeExact((SegmentAllocator) arena, symbol, 7L) == 7, "long leaf data");
                        check((long) b.invokeExact((SegmentAllocator) arena, symbol, 7L) == 24, "independent long leaf");
                    } else {
                        check((double) a.invokeExact((SegmentAllocator) arena, symbol, 7.0) == 7, "double leaf data");
                        check((double) b.invokeExact((SegmentAllocator) arena, symbol, 7.0) == 24, "independent double leaf");
                    }
                    try {
                        if (kind == 1) { long unused = (long) c.invokeExact((SegmentAllocator) arena, symbol, 7L); }
                        else { double unused = (double) c.invokeExact((SegmentAllocator) arena, symbol, 7.0); }
                        throw new AssertionError("leaf exception lost");
                    } catch (RuntimeException expected) { check(expected == FAILURE, "leaf exception preserved"); }
                } catch (Throwable ex) { failure.compareAndSet(null, ex); }
            });
            threads.add(t); t.start();
        }
        ready.await(); start.countDown();
        for (Thread thread : threads) thread.join();
        if (failure.get() != null) throw failure.get();
    }

    @DontInline
    private static WeakReference<Class<?>> disposable(int kind) throws Throwable {
        Recipe r = recipe(DowncallTemplates.platform(), kind);
        MethodHandle leaf = MethodHandles.lookup().findStatic(ScalarDowncallTemplateTest.class,
                kind == 1 ? "javaLong" : "javaDouble", r.sequence().calleeMethodType());
        MethodHandle h = BindingSpecializer.specializeDowncall(leaf, r.sequence(), r.abi());
        return new WeakReference<>(MethodHandles.lookup().revealDirect(h).getDeclaringClass());
    }

    private static void unloading() throws Throwable {
        if (DowncallTemplates.platform().equals("unsupported")) return;
        WeakReference<?> a = disposable(1), b = disposable(2);
        for (int i = 0; i < 20 && (!a.refersTo(null) || !b.refersTo(null)); i++) {
            System.gc(); Thread.sleep(10);
        }
        check(a.refersTo(null) && b.refersTo(null), "uncached hidden wrappers unload");
    }

    public static void main(String[] args) throws Throwable {
        if (args[0].equals("unloading")) unloading();
        else {
            int kind = args[0].equals("long") ? 1 : 2;
            nativeCalls(kind, args.length > 1);
            checkGuards(kind);
            concurrent(kind);
        }
        System.out.println("SCALAR_TEMPLATE_PASS checks=" + checks.get());
    }
}
