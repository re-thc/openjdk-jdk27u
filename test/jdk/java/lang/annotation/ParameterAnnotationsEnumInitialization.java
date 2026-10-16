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
 * @summary Check that the initializer of an enum can read parameter annotations
 *          whose values are constants of that enum: on its own thread while
 *          another thread that parses the same annotations waits for the enum
 *          to be initialized, and before the constants exist
 * @run main/othervm ParameterAnnotationsEnumInitialization
 */

import java.lang.annotation.Annotation;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public class ParameterAnnotationsEnumInitialization {

    @Retention(RetentionPolicy.RUNTIME) @interface OfE { E value(); }
    @Retention(RetentionPolicy.RUNTIME) @interface OfF { F value(); }
    @Retention(RetentionPolicy.RUNTIME) @interface OfG { G value(); }

    static void e(@OfE(E.X) int p) { }
    static void f(@OfF(F.Y) int p) { }
    static void g(@OfG(G.Z) int p) { }

    /** The parameter annotations of a new Method object for the method. */
    static Annotation[][] parameterAnnotations(String method) {
        try {
            return ParameterAnnotationsEnumInitialization.class
                    .getDeclaredMethod(method, int.class).getParameterAnnotations();
        } catch (NoSuchMethodException e) {
            throw new AssertionError(e);
        }
    }

    // E is initialized on one thread while another parses the annotations of e
    static final CountDownLatch E_INITIALIZING = new CountDownLatch(1);
    static volatile Thread parser;
    static volatile Annotation[][] fromEInitializer;

    enum E {
        X;
        static {
            E_INITIALIZING.countDown();
            awaitParserWaitingForE();
            fromEInitializer = parameterAnnotations("e");
        }
    }

    // F's constructor reads the annotations of f before the constants of F exist
    static volatile Annotation[][] fromFConstructor;

    enum F {
        Y;
        F() {
            fromFConstructor = parameterAnnotations("f");
        }
    }

    // As F, but G is initialized by parsing the annotations of g
    static volatile Annotation[][] fromGConstructor;

    enum G {
        Z;
        G() {
            fromGConstructor = parameterAnnotations("g");
        }
    }

    /**
     * Waits until the parser thread parses the value E.X of the annotation of e,
     * for which it waits for the initialization of E.  (The thread state of a
     * thread that waits for the initialization of a class is not specified.)
     */
    static void awaitParserWaitingForE() {
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(30);
        while (System.nanoTime() < deadline) {
            Thread t = parser;
            if (t != null) {
                for (StackTraceElement frame : t.getStackTrace()) {
                    if (frame.getClassName().equals("sun.reflect.annotation.AnnotationParser")
                            && frame.getMethodName().equals("parseEnumValue")) {
                        return;
                    }
                }
            }
            try {
                Thread.sleep(10);
            } catch (InterruptedException e) {
                throw new AssertionError(e);
            }
        }
        throw new AssertionError("the parser thread did not parse E.X");
    }

    static Object value(Annotation a) {
        return switch (a) {
            case OfE o -> o.value();
            case OfF o -> o.value();
            case OfG o -> o.value();
            default -> throw new AssertionError(a);
        };
    }

    static void checkValue(Object expected, Annotation[][] annotations, String what) {
        Object actual = value(annotations[0][0]);
        if (actual != expected) {
            throw new AssertionError(what + ": " + actual + ", expected " + expected);
        }
    }

    static void checkUnresolved(Annotation[][] annotations, String what) {
        try {
            throw new AssertionError(what + ": " + value(annotations[0][0]) + ", expected it to throw");
        } catch (EnumConstantNotPresentException expected) {
        }
    }

    static void checkSame(Annotation[][] a, Annotation[][] b, String what) {
        if (a[0][0] != b[0][0]) {
            throw new AssertionError(what + ": different annotation instances");
        }
    }

    /** Runs the action on a daemon thread, which a deadlock leaves behind. */
    static Thread thread(String name, Runnable action, Throwable[] failure) {
        Thread t = new Thread(() -> {
            try {
                action.run();
            } catch (Throwable e) {
                failure[0] = e;
            }
        }, name);
        t.setDaemon(true);
        return t;
    }

    static void join(Thread t, Throwable[] failure) throws Throwable {
        t.join(TimeUnit.SECONDS.toMillis(60));
        if (t.isAlive()) {
            StringBuilder sb = new StringBuilder(t.getName() + " did not finish:");
            for (StackTraceElement frame : t.getStackTrace()) {
                sb.append("\n\tat ").append(frame);
            }
            throw new AssertionError(sb);
        }
        if (failure[0] != null) {
            throw failure[0];
        }
    }

    public static void main(String[] args) throws Throwable {
        // The parser waits for the initialization of E on another thread, whose
        // initializer of E reads the same annotations
        Throwable[] initializerFailure = new Throwable[1];
        Throwable[] parserFailure = new Throwable[1];
        Annotation[][][] fromParser = new Annotation[1][][];
        Thread initializer = thread("initializer", () -> E.X.name(), initializerFailure);
        initializer.start();
        if (!E_INITIALIZING.await(30, TimeUnit.SECONDS)) {
            throw new AssertionError("E is not initialized");
        }
        Thread p = thread("parser", () -> fromParser[0] = parameterAnnotations("e"), parserFailure);
        parser = p;
        p.start();
        join(initializer, initializerFailure);
        join(p, parserFailure);
        checkValue(E.X, fromEInitializer, "e, from the initializer of E");
        checkValue(E.X, fromParser[0], "e, from the parser");
        checkSame(fromEInitializer, fromParser[0], "e, from the initializer and the parser");
        checkSame(fromParser[0], parameterAnnotations("e"), "e, from the parser and later");

        // The constructor of F can't resolve F.Y, but it is resolved once F is initialized
        F.Y.name();
        checkUnresolved(fromFConstructor, "f, from the constructor of F");
        Annotation[][] fAfter = parameterAnnotations("f");
        checkValue(F.Y, fAfter, "f, after the initialization of F");
        checkSame(fAfter, parameterAnnotations("f"), "f, after the initialization of F");

        // Parsing g initializes G, whose constructor can't resolve G.Z, but the parse can
        Annotation[][] g = parameterAnnotations("g");
        checkUnresolved(fromGConstructor, "g, from the constructor of G");
        checkValue(G.Z, g, "g, which initialized G");
        checkSame(g, parameterAnnotations("g"), "g, which initialized G, and later");
    }
}
