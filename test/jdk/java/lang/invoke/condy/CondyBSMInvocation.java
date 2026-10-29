/*
 * Copyright (c) 2017, 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @bug 8186046 8199875
 * @summary Test basic invocation of bootstrap methods
 * @modules java.base/java.lang.invoke:open
 * @library /java/lang/invoke/common
 * @build test.java.lang.invoke.lib.InstructionHelper
 * @run junit CondyBSMInvocation
 * @run junit/othervm -XX:+UnlockDiagnosticVMOptions -XX:UseBootstrapCallInfo=3 CondyBSMInvocation
 */

import test.java.lang.invoke.lib.InstructionHelper;

import java.lang.constant.ConstantDesc;
import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.invoke.WrongMethodTypeException;
import java.util.Arrays;
import java.util.Collections;
import java.util.stream.IntStream;
import java.util.stream.Stream;

import static java.lang.invoke.MethodType.methodType;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class CondyBSMInvocation {
    static final MethodHandles.Lookup L = MethodHandles.lookup();

    private static int exactCalls;

    public static Object exact_bsm(MethodHandles.Lookup caller, String name, Class<?> type) throws Exception {
        assertTrue(caller.hasFullPrivilegeAccess());
        assertTrue((caller.lookupModes() & MethodHandles.Lookup.ORIGINAL) != 0);
        exactCalls++;
        return switch (name) {
            case "value" -> type == String.class ? "value" : Integer.valueOf(42);
            case "nil" -> null;
            case "wrong" -> new Object();
            case "checked" -> throw new Exception("checked");
            case "error" -> throw new LinkageError("error");
            default -> throw new AssertionError(name);
        };
    }

    @Test
    public void testExactNoArgsBootstrap() throws Throwable {
        MethodType bsmType = methodType(Object.class, MethodHandles.Lookup.class, String.class, Class.class);
        for (Class<?> type : new Class<?>[] {Object.class, String.class, int.class, long.class}) {
            MethodHandle mh = InstructionHelper.ldcDynamicConstant(L, "value", type, "exact_bsm", bsmType);
            int before = exactCalls;
            Object expected = Integer.valueOf(42);
            if (type == String.class) expected = "value";
            if (type == long.class) expected = Long.valueOf(42);
            assertEquals(expected, mh.invoke());
            assertEquals(expected, mh.invoke());
            assertEquals(before + 1, exactCalls);
        }
        MethodHandle nil = InstructionHelper.ldcDynamicConstant(L, "nil", Object.class, "exact_bsm", bsmType);
        assertNull(nil.invoke());
        MethodHandle wrong = InstructionHelper.ldcDynamicConstant(L, "wrong", String.class, "exact_bsm", bsmType);
        assertInstanceOf(ClassCastException.class, assertThrows(BootstrapMethodError.class, wrong::invoke).getCause());
        MethodHandle checked = InstructionHelper.ldcDynamicConstant(L, "checked", Object.class, "exact_bsm", bsmType);
        Throwable cause = assertThrows(BootstrapMethodError.class, checked::invoke).getCause();
        assertEquals(Exception.class, cause.getClass());
        assertEquals("checked", cause.getMessage());
        MethodHandle error = InstructionHelper.ldcDynamicConstant(L, "error", Object.class, "exact_bsm", bsmType);
        assertEquals("error", assertThrows(LinkageError.class, error::invoke).getMessage());
    }

    public static Object sameResult(Object value) {
        return value;
    }

    @Test
    public void testExactBootstrapEntryPoints() throws Throwable {
        // The VM may represent zero static arguments by null or an empty array.
        // Call both entries explicitly, including an exact-typed combinator BSM.
        var invoke = Class.forName("java.lang.invoke.BootstrapMethodInvoker").getDeclaredMethod("invoke",
                Class.class, MethodHandle.class, String.class, Object.class, Object.class, Class.class);
        invoke.setAccessible(true);
        MethodType type = methodType(Object.class, MethodHandles.Lookup.class, String.class, Class.class);
        MethodHandle direct = L.findStatic(CondyBSMInvocation.class, "exact_bsm", type);
        MethodHandle adapted = MethodHandles.filterReturnValue(direct,
                L.findStatic(CondyBSMInvocation.class, "sameResult", methodType(Object.class, Object.class)));
        for (MethodHandle bsm : new MethodHandle[] {direct, adapted}) {
            for (Object info : new Object[] {null, new Object[0]}) {
                int before = exactCalls;
                assertEquals(42, invoke.invoke(null, Object.class, bsm, "value", Object.class, info, CondyBSMInvocation.class));
                assertEquals(before + 1, exactCalls);
            }
        }
    }


    @Test
    public void testNonexistent() throws Throwable {
        MethodHandle mh = InstructionHelper.ldcDynamicConstant(
                L, "name", Object.class,
                "bsm", methodType(Object.class)
        );

        assertThrows(NoSuchMethodError.class, mh::invoke);
    }

    static MethodHandle[] bsms(String bsmName) {
        return Stream.of(CondyBSMInvocation.class.getDeclaredMethods()).
                filter(m -> m.getName().equals(bsmName)).
                map(m -> {
                    try {
                        return MethodHandles.lookup().unreflect(m);
                    } catch (IllegalAccessException e) {
                        throw new RuntimeException();
                    }
                }).toArray(MethodHandle[]::new);
    }

    public static Object shape_bsm() {
        return "0";
    }

    public static Object shape_bsm(Object a1) {
        return "0";
    }

    public static Object shape_bsm(Object... args) {
        return "0";
    }

    public static Object shape_bsm(Object a1, Object a2) {
        return "0";
    }

    public static Object shape_bsm(Object a1, Object... args) {
        return "0";
    }

    public static Object shape_bsm(Object a1, Object a2, Object a3) {
        return "0";
    }

    public static Object shape_bsm(MethodHandles.Lookup a1) {
        return "0";
    }

    @Test
    public void testWrongShape() throws Throwable {
        for (MethodHandle bsm : bsms("shape_bsm")) {
            MethodHandle mh = InstructionHelper.ldcDynamicConstant(
                    L, "name", Object.class,
                    "shape_bsm", bsm.type()
            );

            assertThrows(BootstrapMethodError.class, mh::invoke);
        }
    }


    public static Object sig_bsm(MethodHandles.Lookup a1, String[] a2) {
        return "0";
    }

    public static Object sig_bsm(MethodHandles.Lookup a1, String a2, String a3) {
        return "0";
    }

    @Test
    public void testWrongSignature() throws Throwable {
        for (MethodHandle bsm : bsms("sig_bsm")) {
            MethodHandle mh = InstructionHelper.ldcDynamicConstant(
                    L, "name", Object.class,
                    "sig_bsm", bsm.type()
            );

            assertThrows(BootstrapMethodError.class, mh::invoke);
        }
    }


    public static Object bsm(MethodHandles.Lookup l, String name, Class<?> type) {
        return "0";
    }

    public static Object bsm(MethodHandles.Lookup l, String name, Class<?> type,
                             Object a1) {
        assertAll(a1);
        return "1";
    }

    public static Object bsm(MethodHandles.Lookup l, String name, Class<?> type,
                             Object a1, Object a2) {
        assertAll(a1, a2);
        return "2";
    }

    public static Object bsm(MethodHandles.Lookup l, String name, Class<?> type,
                             Object a1, Object a2, Object a3) {
        assertAll(a1, a2, a3);
        return "3";
    }

    public static Object bsm(MethodHandles.Lookup l, String name, Class<?> type,
                             Object a1, Object a2, Object a3, Object a4) {
        assertAll(a1, a2, a3, a4);
        return "4";
    }

    public static Object bsm(MethodHandles.Lookup l, String name, Class<?> type,
                             Object a1, Object a2, Object a3, Object a4, Object a5) {
        assertAll(a1, a2, a3, a4, a5);
        return "5";
    }

    public static Object bsm(MethodHandles.Lookup l, String name, Class<?> type,
                             Object a1, Object a2, Object a3, Object a4, Object a5, Object a6) {
        assertAll(a1, a2, a3, a4, a5, a6);
        return "6";
    }

    public static Object bsm(MethodHandles.Lookup l, String name, Class<?> type,
                             Object a1, Object a2, Object a3, Object a4, Object a5, Object a6, Object a7) {
        assertAll(a1, a2, a3, a4, a5, a6, a7);
        return "7";
    }

    public static Object bsm(MethodHandles.Lookup l, Object... args) {
        Object[] staticArgs = Arrays.copyOfRange(args, 2, args.length);
        assertAll(staticArgs);
        return Integer.toString(staticArgs.length);
    }

    static void assertAll(Object... as) {
        for (int i = 0; i < as.length; i++) {
            assertEquals(i, as[i]);
        }
    }

    @Test
    public void testArity() throws Throwable {
        for (int i = 0; i < 8; i++) {
            final int n = i;
            MethodType mt = methodType(Object.class, MethodHandles.Lookup.class, String.class, Class.class)
                    .appendParameterTypes(Collections.nCopies(n, Object.class));
            MethodHandle mh = InstructionHelper.ldcDynamicConstant(
                    L, "name", Object.class,
                    "bsm", mt,
                    IntStream.range(0, n).boxed().toArray(ConstantDesc[]::new)
            );

            Object r = mh.invoke();
            assertEquals(Integer.toString(n), r);
        }

        {
            MethodType mt = methodType(Object.class, MethodHandles.Lookup.class, Object[].class);
            MethodHandle mh = InstructionHelper.ldcDynamicConstant(
                    L, "name", Object.class,
                    "bsm", mt,
                    IntStream.range(0, 9).boxed().toArray(ConstantDesc[]::new)
            );

            Object r = mh.invoke();
            assertEquals(Integer.toString(9), r);

        }
    }

    @Test
    public void testWrongNumberOfStaticArguments() throws Throwable {
        for (int i = 1; i < 8; i++) {
            final int n = i;
            MethodType mt = methodType(Object.class, MethodHandles.Lookup.class, String.class, Class.class)
                    .appendParameterTypes(Collections.nCopies(n, Object.class));
            MethodHandle mh = InstructionHelper.ldcDynamicConstant(
                    L, "name", Object.class,
                    "bsm", mt,
                    IntStream.range(0, n - 1).boxed().toArray(ConstantDesc[]::new)
            );

            var e = assertThrows(BootstrapMethodError.class, mh::invoke);
            assertInstanceOf(WrongMethodTypeException.class, e.getCause());
        }
    }
}
