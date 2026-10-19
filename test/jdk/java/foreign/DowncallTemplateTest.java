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
 * @test id=fallback
 * @summary Verify exact downcall-template selection, fallback, class data, and scope handling
 * @modules java.base/jdk.internal.foreign.abi java.base/jdk.internal.misc
 * @compile --patch-module java.base=${test.src} DowncallTemplateTest.java
 * @run main/othervm --patch-module java.base=${test.classes} jdk.internal.foreign.abi.DowncallTemplateTest default
 * @run main/othervm --patch-module java.base=${test.classes}
 *      -Djdk.internal.foreign.abi.Specializer.PERFORM_VERIFICATION=true
 *      jdk.internal.foreign.abi.DowncallTemplateTest fallback
 */

/*
 * @test id=templates-required
 * @summary Require template payload coverage on supported native images
 * @modules java.base/jdk.internal.foreign.abi java.base/jdk.internal.misc
 * @compile --patch-module java.base=${test.src} DowncallTemplateTest.java
 * @run main/othervm --patch-module java.base=${test.classes} jdk.internal.foreign.abi.DowncallTemplateTest required
 */

/*
 * @test id=unsupported-first
 * @summary Verify unsupported downcall shape initializes emitter constants only on fallback
 * @modules java.base/jdk.internal.foreign.abi java.base/jdk.internal.misc
 * @compile --patch-module java.base=${test.src} DowncallTemplateTest.java
 * @run main/othervm --patch-module java.base=${test.classes}
 *      jdk.internal.foreign.abi.DowncallTemplateTest unsupported-first
 */

/*
 * @test id=upcall-first
 * @summary Verify first upcall specialization initializes emitter constants
 * @modules java.base/jdk.internal.foreign.abi java.base/jdk.internal.misc
 * @compile --patch-module java.base=${test.src} DowncallTemplateTest.java
 * @run main/othervm --patch-module java.base=${test.classes} jdk.internal.foreign.abi.DowncallTemplateTest upcall-first
 */

package jdk.internal.foreign.abi;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.lang.foreign.Arena;
import java.lang.foreign.FunctionDescriptor;
import java.lang.foreign.Linker;
import java.lang.foreign.MemorySegment;
import java.lang.foreign.SegmentAllocator;
import java.lang.foreign.ValueLayout;
import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.reflect.ClassFileFormatVersion;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;

import jdk.internal.foreign.CABI;
import jdk.internal.misc.Unsafe;
import jdk.internal.util.OperatingSystem;
import jdk.internal.util.StaticProperty;

/** Exercises the real template selector and emitted wrapper without a native call. */
public class DowncallTemplateTest {
    private static final FunctionDescriptor DESCRIPTOR =
            FunctionDescriptor.of(ValueLayout.JAVA_INT, ValueLayout.JAVA_INT);
    private static final MethodType CARRIER_TYPE = MethodType.methodType(int.class, int.class);
    private static final MethodType LEAF_TYPE = MethodType.methodType(int.class, long.class, int.class);
    private static final String X64 = "linux-x64-sysv";
    private static final String AARCH64 = "linux-aarch64";
    private static int checks;
    private static final RuntimeException LEAF_FAILURE = new RuntimeException("leaf failure");

    private record Recipe(String platform, ABIDescriptor abi, CallingSequence sequence) { }

    private static String nativeTemplatePlatform() {
        if (!OperatingSystem.isLinux() || ByteOrder.nativeOrder() != ByteOrder.LITTLE_ENDIAN
                || ValueLayout.ADDRESS.byteSize() != 8) {
            return null;
        }
        String arch = StaticProperty.osArch();
        if ((arch.equals("amd64") || arch.equals("x86_64")) && CABI.current() == CABI.SYS_V) {
            return X64;
        }
        if (arch.equals("aarch64") && CABI.current() == CABI.LINUX_AARCH_64) {
            return AARCH64;
        }
        return null;
    }

    private static void check(boolean condition, String message) {
        checks++;
        if (!condition) {
            throw new AssertionError(message);
        }
    }

    private static Object staticField(Class<?> type, String name) throws ReflectiveOperationException {
        Field field = type.getDeclaredField(name);
        field.setAccessible(true);
        return field.get(null);
    }

    private static Recipe recipe(String platform) throws Throwable {
        return recipe(platform, CARRIER_TYPE, DESCRIPTOR, false, LinkerOptions.empty());
    }

    private static Recipe recipe(String platform, MethodType carrierType, FunctionDescriptor descriptor,
                                 boolean forUpcall, LinkerOptions options) throws Throwable {
        Object arranger;
        ABIDescriptor abi;
        if (platform.equals(X64)) {
            Class<?> type = Class.forName("jdk.internal.foreign.abi.x64.sysv.CallArranger");
            arranger = null;
            abi = (ABIDescriptor) staticField(type, "CSysV");
        } else {
            Class<?> type = Class.forName("jdk.internal.foreign.abi.aarch64.CallArranger");
            arranger = staticField(type, "LINUX");
            Method abiMethod = Class.forName("jdk.internal.foreign.abi.aarch64.CallArranger")
                    .getDeclaredMethod("abiDescriptor");
            abiMethod.setAccessible(true);
            abi = (ABIDescriptor) abiMethod.invoke(arranger);
        }

        Class<?> arrangerType = platform.equals(X64)
                ? Class.forName("jdk.internal.foreign.abi.x64.sysv.CallArranger")
                : Class.forName("jdk.internal.foreign.abi.aarch64.CallArranger");
        Method getBindings = arrangerType.getMethod("getBindings", MethodType.class,
                FunctionDescriptor.class, boolean.class, LinkerOptions.class);
        Object bindings = getBindings.invoke(arranger, carrierType, descriptor, forUpcall, options);
        CallingSequence sequence = (CallingSequence) bindings.getClass().getMethod("callingSequence").invoke(bindings);
        return new Recipe(platform, abi, sequence);
    }

    private static MethodType callerType(CallingSequence sequence) {
        return sequence.callerMethodType().insertParameterTypes(0, SegmentAllocator.class);
    }

    private static DowncallTemplates.Entry entry(String platform) {
        return Arrays.stream(GeneratedDowncallTemplateData.ENTRIES)
                .filter(candidate -> candidate.platform().equals(platform))
                .findFirst().orElseThrow(() -> new AssertionError("Missing generated entry: " + platform));
    }

    private static CallingSequence sequence(Recipe recipe, Linker.Option option) throws Throwable {
        Class<?> arrangerType = recipe.platform().equals(X64)
                ? Class.forName("jdk.internal.foreign.abi.x64.sysv.CallArranger")
                : Class.forName("jdk.internal.foreign.abi.aarch64.CallArranger");
        Object arranger = recipe.platform().equals(X64) ? null
                : staticField(Class.forName("jdk.internal.foreign.abi.aarch64.CallArranger"), "LINUX");
        Method getBindings = arrangerType.getMethod("getBindings", MethodType.class,
                FunctionDescriptor.class, boolean.class, LinkerOptions.class);
        LinkerOptions options = LinkerOptions.forDowncall(DESCRIPTOR, option);
        Object bindings = getBindings.invoke(arranger, CARRIER_TYPE, DESCRIPTOR, false, options);
        return (CallingSequence) bindings.getClass().getMethod("callingSequence").invoke(bindings);
    }

    private static CallingSequence copySequence(CallingSequence sequence, List<List<Binding>> arguments,
                                                LinkerOptions options) {
        return new CallingSequence(sequence.forUpcall(), sequence.callerMethodType(), sequence.calleeMethodType(),
                sequence.functionDesc(), sequence.needsReturnBuffer(), sequence.returnBufferSize(),
                sequence.allocationSize(), arguments, sequence.returnBindings(), options);
    }

    private static List<List<Binding>> copyArguments(CallingSequence sequence) {
        List<List<Binding>> arguments = new ArrayList<>();
        for (int i = 0; i < sequence.argumentBindingsCount(); i++) {
            arguments.add(new ArrayList<>(sequence.argumentBindings(i)));
        }
        return arguments;
    }

    private static ABIDescriptor withStackAlignment(ABIDescriptor abi, int stackAlignment) {
        return new ABIDescriptor(abi.arch, abi.inputStorage, abi.outputStorage, abi.volatileStorage,
                stackAlignment, abi.shadowSpace, abi.scratch1, abi.scratch2, abi.targetAddrStorage,
                abi.retBufAddrStorage, abi.capturedStateStorage);
    }

    private static void checkRejectedRecipes(Recipe recipe, DowncallTemplates.Entry entry,
                                             MethodHandle target) throws Throwable {
        CallingSequence sequence = recipe.sequence();
        check(!DowncallTemplates.matches(entry, recipe.platform(),
                withStackAlignment(recipe.abi(), recipe.abi().stackAlignment + 1), sequence,
                target.type(), callerType(sequence)), "ABI stack-alignment mismatch rejected " + recipe.platform());

        List<List<Binding>> heapArguments = copyArguments(sequence);
        heapArguments.get(0).set(0, new Binding.SegmentOffset(true));
        CallingSequence heapSymbol = copySequence(sequence, heapArguments, LinkerOptions.empty());
        check(!DowncallTemplates.matches(entry, recipe.platform(), recipe.abi(), heapSymbol,
                target.type(), callerType(heapSymbol)), "heap-capable symbol binding rejected " + recipe.platform());

        List<List<Binding>> storageArguments = copyArguments(sequence);
        Binding.VMStore originalStore = (Binding.VMStore) storageArguments.get(1).get(0);
        VMStorage originalStorage = originalStore.storage();
        VMStorage wrongStorage = new VMStorage(originalStorage.type(), originalStorage.segmentMaskOrSize(),
                originalStorage.indexOrOffset() + 1, originalStorage.debugName());
        storageArguments.get(1).set(0, new Binding.VMStore(wrongStorage, originalStore.type()));
        CallingSequence wrongStorageSequence = copySequence(sequence, storageArguments, LinkerOptions.empty());
        check(!DowncallTemplates.matches(entry, recipe.platform(), recipe.abi(), wrongStorageSequence,
                target.type(), callerType(wrongStorageSequence)),
                "binding storage mismatch rejected " + recipe.platform());

        CallingSequence captured = sequence(recipe, Linker.Option.captureCallState("errno"));
        check(captured.capturedStateMask() != 0 && !DowncallTemplates.matches(entry, recipe.platform(),
                recipe.abi(), captured, target.type(), callerType(captured)),
                "captureCallState recipe rejected " + recipe.platform());
    }

    private static byte[] emittedBytes(Recipe recipe, MethodType caller, MethodHandle leaf) throws Throwable {
        Method emitter = BindingSpecializer.class.getDeclaredMethod("specializeHelper", MethodType.class,
                MethodType.class, CallingSequence.class, ABIDescriptor.class);
        emitter.setAccessible(true);
        try {
            return (byte[]) emitter.invoke(null, leaf.type(), caller, recipe.sequence(), recipe.abi());
        } catch (java.lang.reflect.InvocationTargetException ex) {
            throw ex.getCause();
        }
    }

    public static int plus(long address, int value) {
        return value + 17;
    }

    public static int plusTwo(long address, int first, int second) {
        return first + second + 9;
    }

    public static int unary(int value) {
        return value + 9;
    }

    public static int xor(long address, int value) {
        return value ^ 0x55;
    }

    public static int fail(long address, int value) {
        throw LEAF_FAILURE;
    }

    private static MethodHandle leaf(String name) throws ReflectiveOperationException {
        return MethodHandles.lookup().findStatic(DowncallTemplateTest.class, name, LEAF_TYPE);
    }

    private static MethodHandle specialize(Recipe recipe, MethodHandle target) {
        return BindingSpecializer.specializeDowncall(target, recipe.sequence(), recipe.abi());
    }

    private static Class<?> emissionConstantsClass() throws ClassNotFoundException {
        return Class.forName(BindingSpecializer.class.getName() + "$EmissionConstants", false,
                BindingSpecializer.class.getClassLoader());
    }

    private static int invoke(MethodHandle handle, MemorySegment symbol, int value) throws Throwable {
        return (int) handle.invokeExact((SegmentAllocator) Arena.global(), symbol, value);
    }

    private static int invokeTwo(MethodHandle handle, MemorySegment symbol, int first, int second) throws Throwable {
        return (int) handle.invokeExact((SegmentAllocator) Arena.global(), symbol, first, second);
    }

    private static String nativePlatformOrX64() {
        String platform = DowncallTemplates.platform();
        return platform.equals(X64) || platform.equals(AARCH64) ? platform : X64;
    }

    private static void checkUnsupportedFirst() throws Throwable {
        FunctionDescriptor descriptor = FunctionDescriptor.of(ValueLayout.JAVA_INT,
                ValueLayout.JAVA_INT, ValueLayout.JAVA_INT);
        Recipe recipe = recipe(nativePlatformOrX64(), descriptor.toMethodType(), descriptor,
                false, LinkerOptions.empty());
        MethodHandle leaf = MethodHandles.lookup().findStatic(DowncallTemplateTest.class, "plusTwo",
                MethodType.methodType(int.class, long.class, int.class, int.class));
        Class<?> holder = emissionConstantsClass();
        check(Unsafe.getUnsafe().shouldBeInitialized(holder),
                "unsupported-shape emitter constants start uninitialized");
        check(DowncallTemplates.lookup(DowncallTemplateVersion.ID, ClassFileFormatVersion.latest().major(),
                true, recipe.abi(), recipe.sequence(), leaf.type(), callerType(recipe.sequence())) == null,
                "two-argument shape does not select a template");
        MethodHandle specialized = specialize(recipe, leaf);
        check(!Unsafe.getUnsafe().shouldBeInitialized(holder),
                "unsupported-shape fallback initializes emitter constants");
        check(invokeTwo(specialized, MemorySegment.ofAddress(0x1234), 4, 7) == 20,
                "unsupported-shape fallback invokes its leaf");
    }

    private static void checkUpcallFirst() throws Throwable {
        FunctionDescriptor descriptor = FunctionDescriptor.of(ValueLayout.JAVA_INT, ValueLayout.JAVA_INT);
        MethodType targetType = MethodType.methodType(int.class, int.class);
        Recipe recipe = recipe(nativePlatformOrX64(), targetType, descriptor, true, LinkerOptions.empty());
        Class<?> holder = emissionConstantsClass();
        check(Unsafe.getUnsafe().shouldBeInitialized(holder), "upcall emitter constants start uninitialized");
        MethodHandle specialized = BindingSpecializer.specializeUpcall(targetType, recipe.sequence(), recipe.abi());
        check(!Unsafe.getUnsafe().shouldBeInitialized(holder), "upcall specialization initializes emitter constants");
        MethodHandle target = MethodHandles.lookup().findStatic(DowncallTemplateTest.class, "unary", targetType);
        int result = (int) specialized.invokeExact(target, 7);
        check(result == 16, "upcall specialization invokes its target");
    }

    private static void checkScopes(Recipe recipe, MethodHandle handle) throws Throwable {
        try {
            invoke(handle, MemorySegment.ofArray(new byte[8]), 1);
            throw new AssertionError("Heap symbol was accepted");
        } catch (IllegalArgumentException expected) {
            check(true, "heap symbol rejected");
        }

        MemorySegment closed;
        try (Arena arena = Arena.ofConfined()) {
            closed = arena.allocate(8);
        }
        try {
            invoke(handle, closed, 1);
            throw new AssertionError("Closed symbol scope was accepted");
        } catch (IllegalStateException expected) {
            check(true, "closed symbol scope rejected");
        }

        try (Arena confined = Arena.ofConfined()) {
            MemorySegment symbol = confined.allocate(8);
            AtomicReference<Throwable> result = new AtomicReference<>();
            Thread thread = new Thread(() -> {
                try {
                    invoke(handle, symbol, 1);
                    result.set(new AssertionError("Wrong-thread symbol scope was accepted"));
                } catch (Throwable ex) {
                    result.set(ex);
                }
            });
            thread.start();
            thread.join();
            check(result.get() instanceof WrongThreadException, "wrong-thread symbol scope rejected");
        }

        Arena shared = Arena.ofShared();
        MemorySegment symbol = shared.allocate(8);
        try {
            invoke(specialize(recipe, leaf("fail")), symbol, 1);
            throw new AssertionError("Leaf exception was not propagated");
        } catch (RuntimeException ex) {
            check(ex == LEAF_FAILURE, "leaf exception identity preserved");
        }
        AtomicReference<Throwable> closeFailure = new AtomicReference<>();
        Thread closer = new Thread(() -> {
            try {
                shared.close();
            } catch (Throwable ex) {
                closeFailure.set(ex);
            }
        });
        closer.setDaemon(true);
        closer.start();
        closer.join(5000);
        check(!closer.isAlive(), "scope released after leaf exception");
        check(closeFailure.get() == null, "shared scope closed cleanly");
    }

    private static void checkConcurrentSpecializations(Recipe recipe) throws InterruptedException {
        int count = 4;
        CountDownLatch ready = new CountDownLatch(count);
        CountDownLatch start = new CountDownLatch(1);
        AtomicReference<Throwable> failure = new AtomicReference<>();
        int[] results = new int[count];
        int[] inputs = {-17, 0, 23, 0x12345678};
        Thread[] threads = new Thread[count];
        for (int i = 0; i < count; i++) {
            final int index = i;
            threads[i] = new Thread(() -> {
                ready.countDown();
                try {
                    start.await();
                    boolean usePlus = (index & 1) == 0;
                    MethodHandle handle = specialize(recipe, leaf(usePlus ? "plus" : "xor"));
                    results[index] = invoke(handle, MemorySegment.ofAddress(0x1234), inputs[index]);
                    int expected = usePlus ? inputs[index] + 17 : inputs[index] ^ 0x55;
                    if (results[index] != expected) {
                        throw new AssertionError("Concurrent specialization returned " + results[index]
                                + ", expected " + expected);
                    }
                } catch (Throwable ex) {
                    failure.compareAndSet(null, ex);
                }
            });
            threads[i].setDaemon(true);
            threads[i].start();
        }
        ready.await();
        start.countDown();
        for (Thread thread : threads) {
            thread.join(10_000);
            check(!thread.isAlive(), "concurrent specialization completed");
        }
        check(failure.get() == null, "concurrent independent specializations succeeded: " + failure.get());
    }

    private static Recipe currentRecipe;

    private static void checkTruncatedHeader(byte[] bundle, String sourceId, int major, int length) {
        try {
            check(DowncallTemplates.decode(new ByteArrayInputStream(Arrays.copyOf(bundle, length)),
                    sourceId, major, GeneratedDowncallTemplateData.length(),
                    GeneratedDowncallTemplateData.crc()) == null, "truncated header rejected at " + length);
        } catch (IOException expected) {
            // lookup() treats decoder I/O rejection as normal-generation fallback.
            check(true, "truncated header rejected at " + length);
        }
    }

    public static void main(String[] args) throws Throwable {
        if (args.length == 1 && args[0].equals("unsupported-first")) {
            checkUnsupportedFirst();
            System.out.println("DOWNCALL_TEMPLATE_UNSUPPORTED_FIRST_PASS");
            return;
        }
        if (args.length == 1 && args[0].equals("upcall-first")) {
            checkUpcallFirst();
            System.out.println("DOWNCALL_TEMPLATE_UPCALL_FIRST_PASS");
            return;
        }
        if (args.length != 1 || !(args[0].equals("default") || args[0].equals("fallback")
                || args[0].equals("required"))) {
            throw new AssertionError("Expected default, fallback, or required mode");
        }
        boolean forcedFallback = args[0].equals("fallback");
        boolean templatesRequired = args[0].equals("required");
        String runtimePlatform = DowncallTemplates.platform();
        String nativePlatform = nativeTemplatePlatform();
        boolean supportedRuntime = nativePlatform != null;
        if (templatesRequired && supportedRuntime) {
            check(runtimePlatform.equals(nativePlatform),
                    "native platform classifier expected " + nativePlatform + ", got " + runtimePlatform);
        }
        int major = ClassFileFormatVersion.latest().major();
        String sourceId = DowncallTemplateVersion.ID;

        Set<String> platforms = new HashSet<>();
        for (DowncallTemplates.Entry entry : GeneratedDowncallTemplateData.ENTRIES) {
            platforms.add(entry.platform());
        }
        check(platforms.isEmpty() || platforms.equals(Set.of(X64, AARCH64)),
                "generated metadata is empty or covers x86_64 and AArch64: " + platforms);
        if (templatesRequired && supportedRuntime) {
            check(GeneratedDowncallTemplateData.ENTRIES.length == 2
                    && platforms.equals(Set.of(X64, AARCH64)),
                    "templates-required mode needs both generated ABI entries: " + platforms);
        } else if (templatesRequired) {
            System.out.println("DOWNCALL_TEMPLATE_REQUIRED_MODE_UNSUPPORTED_HOST_FALLBACK platform="
                    + runtimePlatform);
        }

        Recipe x64 = recipe(X64);
        Recipe aarch64 = recipe(AARCH64);
        MethodHandle plus = leaf("plus");
        byte[] template = null;
        if (!platforms.isEmpty()) {
            byte[] bundle;
            try (var input = GeneratedDowncallTemplateData.open()) {
                bundle = input.readAllBytes();
            }
            template = DowncallTemplates.decode(new ByteArrayInputStream(bundle), sourceId, major,
                    GeneratedDowncallTemplateData.length(), GeneratedDowncallTemplateData.crc());
            check(template != null, "generated bundle is valid");
            check(DowncallTemplates.decode(new ByteArrayInputStream(bundle), sourceId + "-stale", major,
                    GeneratedDowncallTemplateData.length(), GeneratedDowncallTemplateData.crc()) == null,
                    "stale source identity rejected");
            check(DowncallTemplates.decode(new ByteArrayInputStream(bundle), sourceId, major + 1,
                    GeneratedDowncallTemplateData.length(), GeneratedDowncallTemplateData.crc()) == null,
                    "wrong classfile version rejected");
            byte[] corrupt = bundle.clone();
            corrupt[corrupt.length - 1] ^= 1;
            check(DowncallTemplates.decode(new ByteArrayInputStream(corrupt), sourceId, major,
                    GeneratedDowncallTemplateData.length(), GeneratedDowncallTemplateData.crc()) == null,
                    "corrupt classfile rejected");
            check(DowncallTemplates.decode(new ByteArrayInputStream(Arrays.copyOf(bundle, bundle.length + 1)),
                    sourceId, major, GeneratedDowncallTemplateData.length(),
                    GeneratedDowncallTemplateData.crc()) == null, "trailing bundle data rejected");
            check(DowncallTemplates.decode(new ByteArrayInputStream(Arrays.copyOf(bundle, bundle.length - 1)),
                    sourceId, major, GeneratedDowncallTemplateData.length(),
                    GeneratedDowncallTemplateData.crc()) == null, "truncated bundle rejected");
            byte[] malformed = bundle.clone();
            malformed[0] ^= 1;
            check(DowncallTemplates.decode(new ByteArrayInputStream(malformed), sourceId, major,
                    GeneratedDowncallTemplateData.length(), GeneratedDowncallTemplateData.crc()) == null,
                    "malformed bundle header rejected");
            for (int length : new int[]{0, 3, 12, 13}) {
                checkTruncatedHeader(bundle, sourceId, major, length);
            }
        }
        for (Recipe recipe : new Recipe[]{x64, aarch64}) {
            if (!platforms.isEmpty()) {
                DowncallTemplates.Entry entry = entry(recipe.platform());
                check(DowncallTemplates.matches(entry, recipe.platform(), recipe.abi(), recipe.sequence(),
                        plus.type(), callerType(recipe.sequence())), "exact recipe matches " + recipe.platform());
                check(!DowncallTemplates.matches(entry, "unsupported", recipe.abi(), recipe.sequence(),
                        plus.type(), callerType(recipe.sequence())),
                        "unsupported platform rejected " + recipe.platform());
                checkRejectedRecipes(recipe, entry, plus);
                for (Linker.Option option : new Linker.Option[]{Linker.Option.critical(false),
                        Linker.Option.critical(true), Linker.Option.firstVariadicArg(0),
                        Linker.Option.firstVariadicArg(1)}) {
                    CallingSequence optionSequence = sequence(recipe, option);
                    check(!DowncallTemplates.matches(entry, recipe.platform(), recipe.abi(), optionSequence,
                            plus.type(), callerType(optionSequence)), "scalar option rejected " + option);
                }
            }
        }

        // A shape miss must not inspect ABI/storage data; null is deliberate here.
        FunctionDescriptor unsupportedDescriptor =
                FunctionDescriptor.of(ValueLayout.JAVA_INT, ValueLayout.JAVA_INT, ValueLayout.JAVA_INT);
        MethodType unsupportedType = unsupportedDescriptor.toMethodType();
        Method bindingMethod = Class.forName("jdk.internal.foreign.abi.x64.sysv.CallArranger")
                .getMethod("getBindings", MethodType.class, FunctionDescriptor.class,
                        boolean.class, LinkerOptions.class);
        Object unsupportedBindings = bindingMethod.invoke(null, unsupportedType, unsupportedDescriptor,
                false, LinkerOptions.empty());
        CallingSequence unsupportedSequence = (CallingSequence) unsupportedBindings.getClass()
                .getMethod("callingSequence").invoke(unsupportedBindings);
        byte[] rejected = DowncallTemplates.lookup(sourceId, major, true, null, unsupportedSequence,
                plus.type(), callerType(unsupportedSequence));
        check(rejected == null, "unsupported scalar shape falls back before ABI access");

        currentRecipe = runtimePlatform.equals(X64) ? x64 : runtimePlatform.equals(AARCH64) ? aarch64 : null;
        boolean defaultConfiguration = System.getProperty("jdk.internal.foreign.abi.Specializer.DUMP_CLASSES_DIR") == null
                && !Boolean.getBoolean("jdk.internal.foreign.abi.Specializer.PERFORM_VERIFICATION")
                && Integer.getInteger("jdk.internal.foreign.abi.Specializer.SCOPE_DEDUP_DEPTH", 2) == 2;
        boolean expectedTemplate = currentRecipe != null && platforms.contains(runtimePlatform)
                && defaultConfiguration && !forcedFallback;
        if (templatesRequired && supportedRuntime) {
            check(defaultConfiguration, "templates-required mode needs default specialization configuration");
            expectedTemplate = true;
        }
        Recipe selectionRecipe = currentRecipe == null ? x64 : currentRecipe;
        byte[] selected = DowncallTemplates.lookup(sourceId, major, defaultConfiguration,
                selectionRecipe.abi(), selectionRecipe.sequence(), plus.type(),
                callerType(selectionRecipe.sequence()));
        check((selected != null) == expectedTemplate,
                "current platform selection expected " + expectedTemplate + " for " + runtimePlatform
                        + (platforms.isEmpty() ? " (empty generated image metadata)" : ""));

        Recipe executionRecipe = currentRecipe == null ? x64 : currentRecipe;
        Class<?> emissionConstants = emissionConstantsClass();
        check(Unsafe.getUnsafe().shouldBeInitialized(emissionConstants),
                "emission constants start uninitialized");
        MethodHandle specialized = specialize(executionRecipe, plus);
        String initializationPath = selected != null ? "template hit"
                : forcedFallback ? "forced verification fallback"
                : currentRecipe == null ? "unsupported platform fallback" : "normal generation fallback";
        check(Unsafe.getUnsafe().shouldBeInitialized(emissionConstants) == (selected != null),
                initializationPath + (selected != null ? " leaves" : " initializes")
                        + " fallback emission constants");
        if (selected != null) {
            check(Arrays.equals(selected, template), "selected bytes match validated bundle");
        }
        if (template != null && !forcedFallback) {
            for (Recipe recipe : new Recipe[]{x64, aarch64}) {
                check(Arrays.equals(template, emittedBytes(recipe, callerType(recipe.sequence()), plus)),
                        "template equals production emitter for " + recipe.platform());
            }
        }
        MethodHandle independent = specialize(executionRecipe, leaf("xor"));
        MemorySegment symbol = MemorySegment.ofAddress(0x1234);
        for (int value : new int[]{Integer.MIN_VALUE, -7, 0, 1, Integer.MAX_VALUE}) {
            check(invoke(specialized, symbol, value) == value + 17, "specialized leaf result");
            check(invoke(independent, symbol, value) == (value ^ 0x55), "independent leaf class data");
        }
        checkScopes(executionRecipe, specialized);
        checkConcurrentSpecializations(executionRecipe);
        System.out.println("DOWNCALL_TEMPLATE_PASS checks=" + checks + " selected=" + (selected != null)
                + " platform=" + runtimePlatform);
    }
}
