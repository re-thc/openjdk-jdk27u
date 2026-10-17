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
 * @summary Check that the initializer of an enum can read annotations whose
 *          values are constants of that enum: on its own thread while another
 *          thread, which parses the same annotations, waits for the enum to be
 *          initialized, and before the constants exist, when a value read too
 *          early must not be cached; and that a constant that doesn't exist is
 *          cached as before
 * @run main/othervm AnnotationsEnumInitialization
 */

import java.lang.annotation.Annotation;
import java.lang.classfile.AnnotationElement;
import java.lang.classfile.AnnotationValue;
import java.lang.classfile.ClassFile;
import java.lang.classfile.attribute.RuntimeVisibleAnnotationsAttribute;
import java.lang.classfile.attribute.RuntimeVisibleParameterAnnotationsAttribute;
import java.lang.constant.ClassDesc;
import java.lang.constant.ConstantDescs;
import java.lang.constant.MethodTypeDesc;
import java.lang.invoke.MethodHandles;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.lang.reflect.RecordComponent;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.function.Supplier;

public class AnnotationsEnumInitialization {

    // Each case uses a separate enum to isolate initialization.

    // An enum initializer reads annotations on its thread while another thread parses them
    enum PP { X; static { fromInitializer(); } }  // parameter annotations, both
    enum DP { X; static { fromInitializer(); } }  // declared annotations of a method, then parameter annotations
    enum PD { X; static { fromInitializer(); } }  // parameter annotations, then declared annotations of a method
    enum DD { X; static { fromInitializer(); } }  // declared annotations of a method, both
    enum FF { X; static { fromInitializer(); } }  // annotations of a field
    enum CC { X; static { fromInitializer(); } }  // annotations of a shared record component
    enum QQ { X; static { fromInitializer(); } }  // annotations of a shared Parameter object

    @Retention(RetentionPolicy.RUNTIME) @interface OnPP { PP value(); }
    @Retention(RetentionPolicy.RUNTIME) @interface OnDP { DP value(); }
    @Retention(RetentionPolicy.RUNTIME) @interface OnPD { PD value(); }
    @Retention(RetentionPolicy.RUNTIME) @interface OnDD { DD value(); }
    @Retention(RetentionPolicy.RUNTIME) @interface OnFF { FF value(); }
    @Retention(RetentionPolicy.RUNTIME) @interface OnCC { CC value(); }
    @Retention(RetentionPolicy.RUNTIME) @interface OnQQ { QQ value(); }

    static void pp(@OnPP(PP.X) int p) { }
    @OnDP(DP.X) static void dp(@OnDP(DP.X) int p) { }
    @OnPD(PD.X) static void pd(@OnPD(PD.X) int p) { }
    @OnDD(DD.X) static void dd() { }
    @OnFF(FF.X) static int ff;
    record CCRecord(@OnCC(CC.X) int c) { }
    static void qq(@OnQQ(QQ.X) int p) { }

    // An enum constructor reads annotations before the constants exist
    enum RP { X; RP() { fromConstructor(); } }    // parameter annotations
    enum RI { X; RI() { fromConstructor(); } }    // parameter annotations, whose parse initializes the enum
    enum RD { X; RD() { fromConstructor(); } }    // declared annotations of a method
    enum RM { X; RM() { fromConstructor(); } }    // parameter annotations, while the declared annotations
                                                  // of the method are parsed and initialize the enum
    enum RF { X; RF() { fromConstructor(); } }    // annotations of a field
    enum RC { X; RC() { fromConstructor(); } }    // annotations of a shared record component
    enum RQ { X; RQ() { fromConstructor(); } }    // annotations of a Parameter
    enum RK { X; RK() { fromConstructor(); } }    // annotations of a class
    enum RT { X; RT() { fromConstructor(); } }    // an annotation in the default of a member
    enum RE { X; RE() { fromConstructor(); } }    // the default of a member

    @Retention(RetentionPolicy.RUNTIME) @interface OnRP { RP value(); }
    @Retention(RetentionPolicy.RUNTIME) @interface OnRI { RI value(); }
    @Retention(RetentionPolicy.RUNTIME) @interface OnRD { RD value(); }
    @Retention(RetentionPolicy.RUNTIME) @interface OnRM { RM value(); }
    @Retention(RetentionPolicy.RUNTIME) @interface OnRF { RF value(); }
    @Retention(RetentionPolicy.RUNTIME) @interface OnRC { RC value(); }
    @Retention(RetentionPolicy.RUNTIME) @interface OnRQ { RQ value(); }
    @Retention(RetentionPolicy.RUNTIME) @interface OnRK { RK value(); }
    @Retention(RetentionPolicy.RUNTIME) @interface OnRT { RT value(); }
    @Retention(RetentionPolicy.RUNTIME) @interface WithDefault { OnRT inner() default @OnRT(RT.X); }
    @Retention(RetentionPolicy.RUNTIME) @interface OnRE { RE value() default RE.X; }

    static void rp(@OnRP(RP.X) int p) { }
    static void ri(@OnRI(RI.X) int p) { }
    @OnRD(RD.X) static void rd() { }
    @OnRM(RM.X) static void rm(@OnRM(RM.X) int p) { }
    @OnRF(RF.X) static int rf;
    record RCRecord(@OnRC(RC.X) int c) { }
    static void rq(@OnRQ(RQ.X) int p) { }
    @OnRK(RK.X) static class RKClass { }
    @WithDefault static void rt() { }
    @OnRE static void re() { }

    // A constant that doesn't exist in an initialized enum: the annotations are cached
    enum Gone { A }
    @Retention(RetentionPolicy.RUNTIME) @interface OnGone { Gone value(); }

    static Method method(String name) {
        for (Method m : AnnotationsEnumInitialization.class.getDeclaredMethods()) {
            if (m.getName().equals(name)) {
                return m;
            }
        }
        throw new AssertionError(name);
    }

    static Annotation declared(String method) {
        return method(method).getDeclaredAnnotations()[0];
    }

    static Annotation parameter(String method) {
        return method(method).getParameterAnnotations()[0][0];
    }

    static Annotation field(String name) {
        try {
            return AnnotationsEnumInitialization.class.getDeclaredField(name).getDeclaredAnnotations()[0];
        } catch (NoSuchFieldException e) {
            throw new AssertionError(e);
        }
    }

    // RecordComponent annotation caches are not shared across getRecordComponents calls.
    static RecordComponent component(Class<?> record) {
        return record.getRecordComponents()[0];
    }

    static Object value(Annotation a) throws Throwable {
        try {
            if (a instanceof WithDefault w) {
                a = w.inner();
            }
            return a.annotationType().getMethod("value").invoke(a);
        } catch (InvocationTargetException e) {
            throw e.getCause();
        }
    }

    static void checkValue(Object expected, Annotation a, String what) throws Throwable {
        Object actual = value(a);
        if (actual != expected) {
            throw new AssertionError(what + ": " + actual + ", expected " + expected);
        }
    }

    static void checkUnresolved(Annotation a, String what) throws Throwable {
        try {
            throw new AssertionError(what + ": " + value(a) + ", expected it to throw");
        } catch (EnumConstantNotPresentException expected) {
        }
    }

    static void checkSame(Annotation a, Annotation b, String what) {
        if (a != b) {
            throw new AssertionError(what + ": different annotation instances");
        }
    }

    static volatile Supplier<Annotation> initializerRead;
    static volatile CountDownLatch initializing;
    static volatile Thread parser;
    static volatile Annotation fromInitializer;

    static void fromInitializer() {
        initializing.countDown();
        awaitParserParsingEnumValue();
        fromInitializer = initializerRead.get();
    }

    /**
     * Wait for enum resolution; class-initialization waits have no specified Thread.State.
     */
    static void awaitParserParsingEnumValue() {
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
        throw new AssertionError("the parser thread did not parse an enum value");
    }

    // Daemon threads let the test VM exit even if a regression deadlocks.
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

    /**
     * Reads on the initializing and waiting threads must finish, resolve the
     * constant and share annotation instances with subsequent reads.
     */
    static void crossThread(String what, Runnable initialize, Class<? extends Enum<?>> enumClass,
                            Supplier<Annotation> parserRead, Supplier<Annotation> initializerRead)
            throws Throwable {
        AnnotationsEnumInitialization.initializerRead = initializerRead;
        initializing = new CountDownLatch(1);
        parser = null;
        fromInitializer = null;
        Throwable[] initializerFailure = new Throwable[1];
        Throwable[] parserFailure = new Throwable[1];
        Annotation[] fromParser = new Annotation[1];
        Thread initializer = thread(what + ": initializer", initialize, initializerFailure);
        initializer.start();
        if (!initializing.await(30, TimeUnit.SECONDS)) {
            throw new AssertionError(what + ": the enum is not initialized");
        }
        Thread p = thread(what + ": parser", () -> fromParser[0] = parserRead.get(), parserFailure);
        parser = p;
        p.start();
        join(initializer, initializerFailure);
        join(p, parserFailure);
        Object constant = enumClass.getEnumConstants()[0];
        checkValue(constant, fromInitializer, what + ", from the initializer");
        checkValue(constant, fromParser[0], what + ", from the parser");
        checkSame(fromInitializer, initializerRead.get(), what + ", from the initializer and later");
        checkSame(fromParser[0], parserRead.get(), what + ", from the parser and later");
    }

    static volatile Supplier<Annotation> constructorRead;
    static volatile Annotation fromConstructor;

    static void fromConstructor() {
        fromConstructor = constructorRead.get();
    }

    /**
     * An early unresolved read must not prevent later reads from resolving the
     * constant and sharing their cached annotation instances.
     */
    static void tooEarly(String what, Runnable initialize, Supplier<Object> constant,
                         Supplier<Annotation> read, Supplier<Annotation> readAgain)
            throws Throwable {
        constructorRead = read;
        fromConstructor = null;
        initialize.run();
        checkUnresolved(fromConstructor, what + ", from the constructor");
        Annotation after = read.get();
        checkValue(constant.get(), after, what + ", after the initialization");
        checkSame(after, read.get(), what + ", after the initialization, read again");
        Annotation again = readAgain.get();
        checkValue(constant.get(), again, what + ", read again after the initialization");
        checkSame(again, readAgain.get(), what + ", read again after the initialization, twice");
    }

    public static void main(String[] args) throws Throwable {
        crossThread("parameter annotations", () -> PP.X.name(), PP.class,
                    () -> parameter("pp"), () -> parameter("pp"));
        crossThread("declared, then parameter annotations", () -> DP.X.name(), DP.class,
                    () -> declared("dp"), () -> parameter("dp"));
        crossThread("parameter, then declared annotations", () -> PD.X.name(), PD.class,
                    () -> parameter("pd"), () -> declared("pd"));
        crossThread("declared annotations of a method", () -> DD.X.name(), DD.class,
                    () -> declared("dd"), () -> declared("dd"));
        crossThread("annotations of a field", () -> FF.X.name(), FF.class,
                    () -> field("ff"), () -> field("ff"));
        RecordComponent ccComponent = component(CCRecord.class);
        crossThread("annotations of a shared record component", () -> CC.X.name(), CC.class,
                    () -> ccComponent.getDeclaredAnnotations()[0], () -> ccComponent.getDeclaredAnnotations()[0]);
        Parameter shared = method("qq").getParameters()[0];
        crossThread("annotations of a shared Parameter", () -> QQ.X.name(), QQ.class,
                    () -> shared.getAnnotation(OnQQ.class), () -> shared.getAnnotation(OnQQ.class));

        tooEarly("parameter annotations", () -> RP.X.name(), () -> RP.X,
                 () -> parameter("rp"), () -> parameter("rp"));
        tooEarly("parameter annotations, whose parse initializes the enum",
                 () -> checkResolved(RI.class, parameter("ri")), () -> RI.X,
                 () -> parameter("ri"), () -> parameter("ri"));
        tooEarly("declared annotations of a method", () -> RD.X.name(), () -> RD.X,
                 () -> declared("rd"), () -> declared("rd"));
        tooEarly("parameter annotations, while declared annotations of the method initialize the enum",
                 () -> checkResolved(RM.class, declared("rm")), () -> RM.X,
                 () -> parameter("rm"), () -> declared("rm"));
        tooEarly("annotations of a field", () -> RF.X.name(), () -> RF.X,
                 () -> field("rf"), () -> field("rf"));
        RecordComponent rcComponent = component(RCRecord.class);
        tooEarly("annotations of a shared record component", () -> RC.X.name(), () -> RC.X,
                 () -> rcComponent.getDeclaredAnnotations()[0], () -> rcComponent.getAnnotation(OnRC.class));
        Parameter rqParameter = method("rq").getParameters()[0];
        tooEarly("annotations of a shared Parameter", () -> RQ.X.name(), () -> RQ.X,
                 () -> rqParameter.getAnnotation(OnRQ.class), () -> parameter("rq"));
        tooEarly("annotations of a class", () -> RK.X.name(), () -> RK.X,
                 () -> RKClass.class.getDeclaredAnnotations()[0], () -> RKClass.class.getAnnotation(OnRK.class));
        tooEarly("an annotation in the default of a member", () -> RT.X.name(), () -> RT.X,
                 () -> declared("rt"), () -> method("rt").getAnnotation(WithDefault.class));
        tooEarly("the default of a member", () -> RE.X.name(), () -> RE.X,
                 () -> declared("re"), () -> method("re").getAnnotation(OnRE.class));

        permanentlyUnresolved();
    }

    /**
     * Generate @OnGone(Gone.MISSING), which javac rejects, and verify that its
     * cached annotation instances continue to throw.
     */
    static void permanentlyUnresolved() throws Throwable {
        java.lang.classfile.Annotation annotation = java.lang.classfile.Annotation.of(
                OnGone.class.describeConstable().orElseThrow(),
                AnnotationElement.of("value", AnnotationValue.ofEnum(
                        Gone.class.describeConstable().orElseThrow(), "MISSING")));
        byte[] bytes = ClassFile.of().build(ClassDesc.of("PermanentlyUnresolved"), clb ->
                clb.withMethod("m", MethodTypeDesc.of(ConstantDescs.CD_void, ConstantDescs.CD_int),
                               ClassFile.ACC_STATIC, mb -> mb
                        .withCode(cob -> cob.return_())
                        .with(RuntimeVisibleAnnotationsAttribute.of(annotation))
                        .with(RuntimeVisibleParameterAnnotationsAttribute.of(List.of(List.of(annotation))))));
        Class<?> c = MethodHandles.lookup().defineClass(bytes);
        Gone.A.name();
        Annotation declared = c.getDeclaredMethod("m", int.class).getDeclaredAnnotations()[0];
        Annotation parameter = c.getDeclaredMethod("m", int.class).getParameterAnnotations()[0][0];
        checkUnresolved(declared, "a constant that doesn't exist, declared annotation");
        checkUnresolved(parameter, "a constant that doesn't exist, parameter annotation");
        checkSame(declared, c.getDeclaredMethod("m", int.class).getDeclaredAnnotations()[0],
                  "a constant that doesn't exist, declared annotation, read again");
        checkSame(parameter, c.getDeclaredMethod("m", int.class).getParameterAnnotations()[0][0],
                  "a constant that doesn't exist, parameter annotation, read again");
    }

    // The initiating read must not reuse its recursive unresolved result.
    static void checkResolved(Class<? extends Enum<?>> enumClass, Annotation read) {
        try {
            checkValue(enumClass.getEnumConstants()[0], read, enumClass.getSimpleName() + ", the read that initialized it");
        } catch (Throwable e) {
            throw new AssertionError(e);
        }
    }
}
