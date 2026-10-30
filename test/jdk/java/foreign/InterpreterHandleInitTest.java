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
 * @summary Initialize interpreter-only downcall handles only when their path is selected
 * @modules java.base/jdk.internal.foreign java.base/jdk.internal.misc
 * @run main/othervm --enable-native-access=ALL-UNNAMED -Djdk.internal.foreign.DowncallLinker.USE_SPEC=true InterpreterHandleInitTest specialized
 * @run main/othervm --enable-native-access=ALL-UNNAMED -Djdk.internal.foreign.DowncallLinker.USE_SPEC=false InterpreterHandleInitTest interpreted
 */

import java.lang.foreign.*;
import java.lang.invoke.*;
import java.util.Arrays;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import jdk.internal.foreign.CABI;
import jdk.internal.misc.Unsafe;

public class InterpreterHandleInitTest {
    public static void main(String[] args) throws Throwable {
        if (CABI.current() == CABI.FALLBACK || CABI.current() == CABI.UNSUPPORTED) {
            System.out.println("DowncallLinker native path unavailable");
            return;
        }
        Linker linker = Linker.nativeLinker();
        CountDownLatch ready = new CountDownLatch(8);
        CountDownLatch start = new CountDownLatch(1);
        ConcurrentLinkedQueue<Throwable> failures = new ConcurrentLinkedQueue<>();
        Thread[] workers = new Thread[8];
        for (int arity = 0; arity < workers.length; arity++) {
            final int count = arity;
            workers[arity] = Thread.ofPlatform().start(() -> {
                ready.countDown();
                try {
                    start.await();
                    MemoryLayout[] layouts = new MemoryLayout[count];
                    Arrays.fill(layouts, ValueLayout.JAVA_LONG);
                    FunctionDescriptor descriptor = FunctionDescriptor.of(ValueLayout.JAVA_LONG, layouts);
                    MethodHandle handle = linker.downcallHandle(descriptor);
                    MethodType expected = descriptor.toMethodType().insertParameterTypes(0, MemorySegment.class);
                    if (!handle.type().equals(expected)) {
                        throw new AssertionError(handle.type() + " != " + expected);
                    }
                } catch (Throwable failure) {
                    failures.add(failure);
                }
            });
        }
        boolean allReady = ready.await(10, TimeUnit.SECONDS);
        start.countDown();
        if (!allReady) throw new AssertionError("Workers did not start");
        for (Thread worker : workers) {
            worker.join(10_000);
            if (worker.isAlive()) throw new AssertionError("Worker did not finish");
        }
        if (!failures.isEmpty()) throw new AssertionError("Factory failed", failures.peek());
        Class<?> holder = Class.forName("jdk.internal.foreign.abi.DowncallLinker$InterpreterHandles", false, null);
        boolean specialized = args[0].equals("specialized");
        if (Unsafe.getUnsafe().shouldBeInitialized(holder) != specialized) {
            throw new AssertionError("Unexpected interpreter-holder initialization");
        }
        System.out.println("INTERPRETER_HANDLE_INITIALIZATION_PASS signatures=8");
    }
}
