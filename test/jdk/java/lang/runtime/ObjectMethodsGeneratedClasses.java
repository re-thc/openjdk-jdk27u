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
 * @summary Check the classes that ObjectMethods.bootstrap generates for a record class:
 *          bootstraps for the same fields share one class, also with getters created
 *          again and when they race, the class is unloaded when no longer used, and
 *          more getters than a record can have use the combinators
 * @library /test/lib
 * @run main/othervm ObjectMethodsGeneratedClasses
 */

import java.lang.invoke.CallSite;
import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.ref.WeakReference;
import java.lang.runtime.ObjectMethods;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import jdk.test.lib.util.ForceGC;

public class ObjectMethodsGeneratedClasses {

    static final MethodHandles.Lookup LOOKUP = MethodHandles.lookup();
    static final MethodType HASH_CODE = MethodType.methodType(int.class, Rec.class);

    /** The generated class of the last call of a Probe method on this thread. */
    static final ThreadLocal<Class<?>> CALLER = new ThreadLocal<>();

    static final class Probe {
        @Override public int hashCode() {
            CALLER.set(StackWalker.getInstance(Set.of(StackWalker.Option.RETAIN_CLASS_REFERENCE,
                                                      StackWalker.Option.SHOW_HIDDEN_FRAMES))
                    .walk(s -> s.map(StackWalker.StackFrame::getDeclaringClass)
                                .filter(c -> c.isHidden() && c.getName().contains("Specializer"))
                                .findFirst().orElse(null)));
            return 1;
        }
    }

    record Rec(Probe p, int i) { }

    static final Rec REC = new Rec(new Probe(), 2);

    /** Getters created anew on each call, as different bootstraps may. */
    static MethodHandle[] getters() throws ReflectiveOperationException {
        return new MethodHandle[] { LOOKUP.findGetter(Rec.class, "p", Probe.class),
                                    LOOKUP.findGetter(Rec.class, "i", int.class) };
    }

    static MethodHandle hashCodeHandle() throws Throwable {
        return ((CallSite) ObjectMethods.bootstrap(LOOKUP, "hashCode", HASH_CODE, Rec.class, "p;i", getters()))
                .dynamicInvoker();
    }

    /** Returns the generated class that the method handle calls. */
    static Class<?> generatedClass(MethodHandle hashCode) throws Throwable {
        CALLER.remove();
        check(31 + 2, (int) hashCode.invokeExact(REC), "hashCode");
        Class<?> c = CALLER.get();
        CALLER.remove();
        if (c == null) {
            throw new AssertionError("no generated class called Probe.hashCode");
        }
        return c;
    }

    static void check(Object expected, Object actual, String what) {
        if (!expected.equals(actual)) {
            throw new AssertionError(what + ": expected " + expected + " but got " + actual);
        }
    }

    public static void main(String[] args) throws Throwable {
        // bootstraps with getters created again share the generated class
        List<MethodHandle> handles = new ArrayList<>();
        Set<Class<?>> classes = new HashSet<>();
        for (int i = 0; i < 100; i++) {
            MethodHandle mh = hashCodeHandle();
            handles.add(mh);
            classes.add(generatedClass(mh));
        }
        check(1, classes.size(), "generated classes of 100 bootstraps");

        // the generated class is unloaded when it is no longer used, and then generated again
        WeakReference<Class<?>> ref = new WeakReference<>(classes.iterator().next());
        handles.clear();
        classes.clear();
        if (!ForceGC.wait(() -> ref.refersTo(null))) {
            throw new AssertionError("the generated class was not unloaded");
        }
        check(true, generatedClass(hashCodeHandle()) != null, "generated again");

        // bootstraps that race for the same fields generate one class
        int threads = 16;
        CountDownLatch start = new CountDownLatch(1);
        List<Callable<MethodHandle>> tasks = new ArrayList<>();
        for (int i = 0; i < threads; i++) {
            tasks.add(() -> {
                start.await();
                try {
                    return hashCodeHandle();
                } catch (Throwable t) {
                    throw new Exception(t);
                }
            });
        }
        ExecutorService pool = Executors.newFixedThreadPool(threads);
        try {
            List<Future<MethodHandle>> futures = new ArrayList<>();
            for (Callable<MethodHandle> task : tasks) {
                futures.add(pool.submit(task));
            }
            start.countDown();
            Set<Class<?>> raced = new HashSet<>();
            for (Future<MethodHandle> f : futures) {
                raced.add(generatedClass(f.get()));
            }
            check(1, raced.size(), "generated classes of " + threads + " racing bootstraps");
        } finally {
            pool.shutdown();
        }

        // more getters than a record can have use the combinators, whose methods have no size limit
        MethodHandle i = LOOKUP.findGetter(Rec.class, "i", int.class);
        MethodHandle[] many = Collections.nCopies(6_000, i).toArray(new MethodHandle[0]);
        int expected = 0;
        for (int k = 0; k < many.length; k++) {
            expected = expected * 31 + 2;
        }
        check(expected, (int) ((CallSite) ObjectMethods.bootstrap(LOOKUP, "hashCode", HASH_CODE, Rec.class, "", many))
                .dynamicInvoker().invokeExact(REC), "hashCode of 6,000 getters");
        System.out.println("passed");
    }
}
