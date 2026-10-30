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
 * @summary Unary string concatenation does not initialize the hidden class generator
 * @modules java.base/jdk.internal.misc
 * @run main/othervm -Xverify:all UnaryConcatInitialization
 * @run main/othervm -Xverify:all -Xshare:off UnaryConcatInitialization check-init
 * @run main/othervm -Xverify:all -Xshare:off
 *                  -Djava.lang.invoke.StringConcat.cacheThreshold=0
 *                  -Djava.lang.invoke.StringConcat.inlineThreshold=0
 *                  UnaryConcatInitialization check-init
 */

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.invoke.StringConcatFactory;

import jdk.internal.misc.Unsafe;

public class UnaryConcatInitialization {
    private static final MethodHandles.Lookup LOOKUP = MethodHandles.lookup();

    public static void main(String[] args) throws Throwable {
        Class<?> generator = Class.forName(
                "java.lang.invoke.StringConcatFactory$InlineHiddenClassStrategy", false, null);
        boolean checkInit = args.length != 0;
        if (checkInit) {
            checkUninitialized(generator);
        }

        Object[][] cases = {
                { boolean.class, true, "true" },
                { byte.class, (byte) -128, "-128" },
                { short.class, (short) -32768, "-32768" },
                { char.class, '\u0100', "\u0100" },
                { int.class, Integer.MIN_VALUE, "-2147483648" },
                { long.class, Long.MIN_VALUE, "-9223372036854775808" },
                { float.class, -0.0f, "-0.0" },
                { float.class, Float.NaN, "NaN" },
                { float.class, Float.POSITIVE_INFINITY, "Infinity" },
                { double.class, -0.0d, "-0.0" },
                { double.class, Double.NaN, "NaN" },
                { double.class, Double.NEGATIVE_INFINITY, "-Infinity" },
                { String.class, "value", "value" },
                { CharSequence.class, new StringBuilder("\u0100"), "\u0100" },
                { Object.class, null, "null" },
                { String.class, null, "null" },
                { Value.class, new Value(), "value" },
                { NullValue.class, new NullValue(), "null" },
        };
        int[] array = { 1, 2 };
        check(int[].class, array, array.toString());
        for (Object[] c : cases) {
            check((Class<?>) c[0], c[1], (String) c[2]);
            if (checkInit) {
                checkUninitialized(generator);
            }
        }

        Value value = new Value();
        MethodHandle target = target(Value.class, "prefix", "suffix");
        assertEquals("prefixvaluesuffix", (String) target.invokeExact(value));
        if (value.calls != 1) {
            throw new AssertionError("Dynamic argument converted more than once");
        }

        RuntimeException failure = new RuntimeException("toString failure");
        Object throwing = new Object() {
            @Override
            public String toString() {
                throw failure;
            }
        };
        try {
            String unused = (String) target(Object.class, "prefix", "suffix").invokeExact(throwing);
            throw new AssertionError("Expected toString failure");
        } catch (RuntimeException actual) {
            if (actual != failure) {
                throw new AssertionError(actual);
            }
        }

        Value constant = new Value();
        MethodHandle constants = StringConcatFactory.makeConcatWithConstants(LOOKUP, "concat",
                MethodType.methodType(String.class, int.class), "\2\1\2", constant, constant).getTarget();
        if (constant.calls != 2) {
            throw new AssertionError("Constants must be converted at linkage");
        }
        assertEquals("value42value", (String) constants.invokeExact(42));
        if (constant.calls != 2) {
            throw new AssertionError("Constants converted again at invocation");
        }

        if (checkInit) {
            checkUninitialized(generator);
        }
        MethodHandle binary = StringConcatFactory.makeConcatWithConstants(LOOKUP, "concat",
                MethodType.methodType(String.class, int.class, long.class), "\1:\1").getTarget();
        assertEquals("42:43", (String) binary.invokeExact(42, 43L));
        if (Unsafe.getUnsafe().shouldBeInitialized(generator)) {
            throw new AssertionError("Generated concat did not initialize the generator");
        }
    }

    private static void check(Class<?> type, Object value, String text) throws Throwable {
        String[][] constants = { { "", "" }, { "prefix", "" }, { "", "suffix" },
                                 { "prefix", "suffix" }, { "\u0100", "\u20ac" } };
        for (String[] pair : constants) {
            MethodHandle target = target(type, pair[0], pair[1]);
            String actual = (String) target.invokeWithArguments(value);
            assertEquals(pair[0].concat(text).concat(pair[1]), actual);
            if (actual == value) {
                throw new AssertionError("Concatenation must create a new String");
            }
        }
    }

    private static MethodHandle target(Class<?> type, String prefix, String suffix) throws Exception {
        MethodType methodType = MethodType.methodType(String.class, type);
        MethodHandle target = StringConcatFactory.makeConcatWithConstants(LOOKUP, "concat",
                methodType, prefix.concat("\1").concat(suffix)).getTarget();
        if (!target.type().equals(methodType)) {
            throw new AssertionError(target.type());
        }
        return target;
    }

    private static void checkUninitialized(Class<?> generator) {
        if (!Unsafe.getUnsafe().shouldBeInitialized(generator)) {
            throw new AssertionError("Unary concat initialized the hidden class generator");
        }
    }

    private static void assertEquals(String expected, String actual) {
        if (!expected.equals(actual)) {
            throw new AssertionError(actual);
        }
    }

    private static class Value {
        int calls;

        @Override
        public String toString() {
            calls++;
            return "value";
        }
    }

    private static class NullValue {
        @Override
        public String toString() {
            return null;
        }
    }
}
