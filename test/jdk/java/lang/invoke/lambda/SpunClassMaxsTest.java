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
 * @summary Check that lambda proxy classes and dynamic proxy classes pass
 *          verification and run when they capture or take long and double
 *          values, take many arguments or convert their arguments, since
 *          the operand stack and local variable sizes of their methods
 *          are computed by the generators
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:+BytecodeVerificationLocal SpunClassMaxsTest
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:+BytecodeVerificationLocal
 *                   -Djdk.internal.lambda.disableEagerInitialization=true SpunClassMaxsTest
 * @run main/othervm -XX:+UnlockDiagnosticVMOptions -XX:+BytecodeVerificationLocal
 *                   -Xbootclasspath/a:${test.classes} SpunClassMaxsTest
 */

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.NotSerializableException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.lang.classfile.ClassFile;
import java.lang.classfile.TypeKind;
import java.lang.constant.ClassDesc;
import java.lang.constant.MethodTypeDesc;
import java.lang.invoke.CallSite;
import java.lang.invoke.LambdaMetafactory;
import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.lang.reflect.UndeclaredThrowableException;
import java.util.Arrays;
import java.util.function.DoubleBinaryOperator;
import java.util.function.DoubleSupplier;
import java.util.function.LongSupplier;
import java.util.function.LongBinaryOperator;
import java.util.function.Supplier;

import static java.lang.invoke.MethodType.methodType;

public class SpunClassMaxsTest {

    public interface Mixed {
        double m(int a, long b, Object c, double d, float e, char f, byte g, short h, boolean i);
    }

    public interface Widening {
        long m(byte a, short b, char c, int d);
    }

    public interface Unboxing {
        Object m(Object a, Object b, double c);
    }

    public interface Throwing {
        long m(long a, double b) throws IOException;
    }

    public interface References {
        String m(String a, int[] b, Object[] c);
    }

    public interface SerializableSam extends Serializable {
        long m(long a, double b);
    }

    static final MethodHandles.Lookup LOOKUP = MethodHandles.lookup();

    static double mixed(int a, long b, Object c, double d, float e, char f, byte g, short h, boolean i) {
        return a + b + c.hashCode() + d + e + f + g + h + (i ? 1 : 0);
    }

    static long widening(long captured, long a, long b, long c, long d) {
        return captured + a + b + c + d;
    }

    static long unboxing(long a, double b, double c) {
        return a + (long) b + (long) c;
    }

    static int intResult() {
        return 42;
    }

    static float floatResult() {
        return 2.5f;
    }

    static long longResult() {
        return 42L;
    }

    static long twoCaptured(long a, long b, long c, double d) {
        return a + b + c + (long) d;
    }

    static void check(boolean ok, String message) {
        if (!ok) {
            throw new AssertionError(message);
        }
    }

    static Class<?>[] types(Class<?> type, int count) {
        Class<?>[] types = new Class<?>[count];
        Arrays.fill(types, type);
        return types;
    }

    // Lambdas compiled by javac which capture long and double values
    static void javacLambdas() throws Exception {
        long cl = 7;
        double cd = 1.5;
        int ci = 3;
        Object co = "o";
        byte cb = 1;
        Mixed captured = (a, b, c, d, e, f, g, h, i) ->
                mixed(a, b, c, d, e, f, g, h, i) + cl + cd + ci + co.hashCode() + cb;
        check(captured.m(1, 2L, "c", 3.0, 4f, (char) 5, (byte) 6, (short) 7, true)
                == mixed(1, 2L, "c", 3.0, 4f, (char) 5, (byte) 6, (short) 7, true) + cl + cd + ci + co.hashCode() + cb,
              "captured lambda");

        // the results are widened to long and double, or dropped
        LongSupplier widenedInt = SpunClassMaxsTest::intResult;
        check(widenedInt.getAsLong() == 42L, "int to long");
        DoubleSupplier widenedFloat = SpunClassMaxsTest::floatResult;
        check(widenedFloat.getAsDouble() == 2.5, "float to double");
        Runnable dropped = SpunClassMaxsTest::longResult;
        dropped.run();

        Supplier<String> nonCapturing = (Supplier<String> & Serializable) () -> "s";
        check(serializeAndGet(nonCapturing).equals("s"), "non-capturing serializable lambda");

        // the captured long and double are boxed for serialization
        Supplier<Long> serializable = (Supplier<Long> & Serializable) () -> cl + (long) cd + ci;
        check(serializeAndGet(serializable).equals(cl + (long) cd + ci), "serializable lambda");
    }

    static Object serializeAndGet(Supplier<?> supplier) throws Exception {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (ObjectOutputStream out = new ObjectOutputStream(bytes)) {
            out.writeObject(supplier);
        }
        try (ObjectInputStream in = new ObjectInputStream(new ByteArrayInputStream(bytes.toByteArray()))) {
            return ((Supplier<?>) in.readObject()).get();
        }
    }

    static void convertingLambdas() throws Throwable {
        MethodHandle impl = LOOKUP.findStatic(SpunClassMaxsTest.class, "widening",
                methodType(long.class, long.class, long.class, long.class, long.class, long.class));
        CallSite widening = LambdaMetafactory.metafactory(LOOKUP, "m", methodType(Widening.class, long.class),
                methodType(long.class, byte.class, short.class, char.class, int.class), impl,
                methodType(long.class, byte.class, short.class, char.class, int.class));
        Widening w = (Widening) widening.getTarget().invoke(10L);
        check(w.m((byte) 1, (short) 2, (char) 3, 4) == 10 + 1 + 2 + 3 + 4, "widening lambda");

        MethodHandle unboxImpl = LOOKUP.findStatic(SpunClassMaxsTest.class, "unboxing",
                methodType(long.class, long.class, double.class, double.class));
        CallSite unboxing = LambdaMetafactory.metafactory(LOOKUP, "m", methodType(Unboxing.class),
                methodType(Object.class, Object.class, Object.class, double.class), unboxImpl,
                methodType(Long.class, Long.class, Double.class, double.class));
        Unboxing u = (Unboxing) unboxing.getTarget().invoke();
        check(u.m(1L, 2.0, 3.0).equals(6L), "unboxing lambda");

        // a lambda class which is Serializable without being created as serializable
        MethodHandle hostileImpl = LOOKUP.findStatic(SpunClassMaxsTest.class, "twoCaptured",
                methodType(long.class, long.class, long.class, long.class, double.class));
        CallSite hostile = LambdaMetafactory.metafactory(LOOKUP, "m",
                methodType(SerializableSam.class, long.class, long.class),
                methodType(long.class, long.class, double.class), hostileImpl,
                methodType(long.class, long.class, double.class));
        Object lambda = hostile.getTarget().invoke(1L, 2L);
        check(((SerializableSam) lambda).m(3L, 4.0) == 1 + 2 + 3 + 4, "hostile lambda");
        try (ObjectOutputStream out = new ObjectOutputStream(new ByteArrayOutputStream())) {
            out.writeObject(lambda);
            throw new AssertionError("Lambda was serialized");
        } catch (NotSerializableException expected) {
        }
    }

    static Class<?> defineInterface(String name, Class<?> type, int count) throws Exception {
        ClassDesc desc = type.describeConstable().orElseThrow();
        ClassDesc[] params = new ClassDesc[count];
        Arrays.fill(params, desc);
        byte[] bytes = ClassFile.of().build(ClassDesc.of(name), cb -> cb
                .withFlags(ClassFile.ACC_PUBLIC | ClassFile.ACC_INTERFACE | ClassFile.ACC_ABSTRACT)
                .withMethod("m", MethodTypeDesc.of(desc, params), ClassFile.ACC_PUBLIC | ClassFile.ACC_ABSTRACT, mb -> { }));
        return LOOKUP.defineClass(bytes);
    }

    static Class<?> defineAdder(String name, Class<?> type, int count) throws Exception {
        ClassDesc desc = type.describeConstable().orElseThrow();
        ClassDesc[] params = new ClassDesc[count];
        Arrays.fill(params, desc);
        boolean wide = type == long.class;
        TypeKind kind = TypeKind.from(type);
        byte[] bytes = ClassFile.of().build(ClassDesc.of(name), cb -> cb
                .withFlags(ClassFile.ACC_PUBLIC | ClassFile.ACC_FINAL)
                .withMethodBody("sum", MethodTypeDesc.of(desc, params), ClassFile.ACC_PUBLIC | ClassFile.ACC_STATIC, cob -> {
                    cob.loadLocal(kind, 0);
                    for (int i = 1; i < count; i++) {
                        cob.loadLocal(kind, wide ? 2 * i : i);
                        if (wide) {
                            cob.ladd();
                        } else {
                            cob.iadd();
                        }
                    }
                    cob.return_(kind);
                }));
        return LOOKUP.defineClass(bytes);
    }

    static Object[] arguments(Class<?> type, int count) {
        Object[] args = new Object[count];
        for (int i = 0; i < count; i++) {
            args[i] = type == long.class ? (Object) (long) (i + 1) : (Object) (i + 1);
        }
        return args;
    }

    static long sum(Object... values) {
        long sum = 0;
        for (Object o : values) {
            sum += ((Number) o).longValue();
        }
        return sum;
    }

    // Lambdas and proxies at the JVM argument-slot limit.
    static void manyArguments(Class<?> type, int count, String suffix) throws Throwable {
        Class<?> adder = defineAdder("Adder" + suffix, type, count);
        MethodHandle impl = LOOKUP.findStatic(adder, "sum", methodType(type, types(type, count)));
        Object[] args = arguments(type, count);
        for (int captured : new int[]{0, 1, count / 2, Math.min(count - 1, 100)}) {
            int arity = count - captured;
            Class<?> sam = defineInterface("Many" + suffix + captured, type, arity);
            Method m = sam.getMethod("m", types(type, arity));
            Object[] samArgs = Arrays.copyOfRange(args, captured, count);
            MethodType samType = methodType(type, types(type, arity));
            CallSite site = LambdaMetafactory.metafactory(LOOKUP, "m", methodType(sam, types(type, captured)),
                                                          samType, impl, samType);
            Object lambda = site.dynamicInvoker().invokeWithArguments(Arrays.copyOf(args, captured));
            check(sum(m.invoke(lambda, samArgs)) == sum(args), "lambda " + suffix + " capturing " + captured);

            InvocationHandler handler = (proxy, method, a) -> {
                check(a.length == arity, "proxy arguments");
                long sum = sum(a);
                return type == long.class ? (Object) sum : (Object) (int) sum;
            };
            Object proxy = Proxy.newProxyInstance(sam.getClassLoader(), new Class<?>[]{sam}, handler);
            check(sum(m.invoke(proxy, samArgs)) == sum(samArgs), "proxy " + suffix + " " + arity);
        }
    }

    static void proxies() throws Throwable {
        InvocationHandler longAndDouble = (proxy, method, args) -> switch (method.getName()) {
            case "applyAsLong" -> (long) args[0] + (long) args[1];
            case "applyAsDouble" -> (double) args[0] + (double) args[1];
            default -> throw new AssertionError(method);
        };
        // proxies of interfaces in the boot loader are only verified with BytecodeVerificationLocal
        for (ClassLoader loader : new ClassLoader[]{SpunClassMaxsTest.class.getClassLoader(), null}) {
            var longs = (LongBinaryOperator) Proxy.newProxyInstance(loader, new Class<?>[]{LongBinaryOperator.class}, longAndDouble);
            check(longs.applyAsLong(1L, 2L) == 3L, "long proxy");
            var doubles = (DoubleBinaryOperator) Proxy.newProxyInstance(loader, new Class<?>[]{DoubleBinaryOperator.class}, longAndDouble);
            check(doubles.applyAsDouble(1.5, 2.5) == 4.0, "double proxy");
        }

        // Exercise class-name lookup for reference and array parameters.
        InvocationHandler referencesHandler = (proxy, method, args) -> (String) args[0] + ((int[]) args[1]).length + ((Object[]) args[2]).length;
        References references = (References) Proxy.newProxyInstance(References.class.getClassLoader(),
                new Class<?>[]{References.class}, referencesHandler);
        check(references.m("s", new int[2], new Object[3]).equals("s23"), "references proxy");

        InvocationHandler mixedHandler = (proxy, method, args) ->
                (double) (int) args[0] + (long) args[1] + (double) args[3] + (float) args[4];
        Mixed mixed = (Mixed) Proxy.newProxyInstance(Mixed.class.getClassLoader(), new Class<?>[]{Mixed.class}, mixedHandler);
        check(mixed.m(1, 2L, "c", 3.0, 4f, (char) 5, (byte) 6, (short) 7, true) == 1 + 2 + 3.0 + 4f, "mixed proxy");

        InvocationHandler thrower = (proxy, method, args) -> {
            throw (long) args[0] == 0 ? new IOException("declared") : new Exception("undeclared");
        };
        Throwing throwing = (Throwing) Proxy.newProxyInstance(Throwing.class.getClassLoader(), new Class<?>[]{Throwing.class}, thrower);
        try {
            throwing.m(0L, 1.0);
            throw new AssertionError("No exception");
        } catch (IOException expected) {
        }
        try {
            throwing.m(1L, 1.0);
            throw new AssertionError("No exception");
        } catch (UndeclaredThrowableException expected) {
        }
    }

    public static void main(String[] args) throws Throwable {
        javacLambdas();
        convertingLambdas();
        manyArguments(long.class, 127, "Longs");
        manyArguments(int.class, 254, "Ints");
        proxies();
    }
}
