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
 */

/*
 * @test
 * @summary Small reference switches preserve selection and guards without a bootstrap
 * @enablePreview
 * @run main SmallReferenceSwitch
 */

import java.lang.classfile.ClassFile;
import java.lang.classfile.instruction.InvokeDynamicInstruction;
import java.lang.classfile.instruction.InvokeInstruction;
import java.util.List;
import java.util.Map;

public class SmallReferenceSwitch extends SwitchNameParent {
    private static int evaluations;
    private static int guards;
    private record Box(Object value) {}
    private enum E { A, B }

    public static void main(String... args) throws Exception {
        equal(-1, empty(null));
        equal(0, empty("x"));
        equal(1, single("x"));
        equal(0, single(1));
        equal(-1, single(null));
        equal(2, two("xx"));
        equal(7, two(7));
        equal(0, two(new Object()));
        equal(-1, two(null));
        equal(0, four("x"));
        equal(1, four(1));
        equal(2, four(new int[0]));
        equal(3, four(List.of()));
        equal(4, four(new Object()));
        equal(-1, four(null));
        for (boolean accept : new boolean[] {true, false}) {
            equal(accept ? 0 : 1, guarded("x", accept));
            equal(accept ? 0 : 2, guarded(new StringBuilder("x"), accept));
            equal(3, guarded(1, accept));
            equal(-1, guarded(null, accept));
            equal(accept ? 0 : 2, multi("x", accept));
            equal(accept ? 0 : 1, multi(1, accept));
            equal(1, multi(1L, accept));
            equal(2, multi(new Object(), accept));
        }
        equal(2, records(new Box("xx")));
        equal(9, records(new Box(9)));
        equal(0, records(new Box(new Object())));
        equal(0, records(new Box(null)));
        equal(0, records(new Object()));
        equal(1, local(true));
        equal(0, local(false));
        equal(2, localOther(true));
        equal(0, localOther(false));
        equal(1, arraysA(new String[0]));
        equal(2, arraysA(new Integer[0]));
        equal(3, arraysB(new Integer[0]));
        equal(4, arraysB(new String[0]));
        equal(2, UninitializedHost.Nested.select(new Object[0]));
        equal(0, Marker.class.getDeclaredMethods().length);
        equal(1, Marker.VALUE);
        equal(2, typed(1));
        equal(3, typed(1L));
        equal(0, typedObject("x"));
        equal(2, typedObject(1));
        equal(3, typedObject(1L));
        equal(3, once("xxx"));
        equal(1, evaluations);
        equal(1, guards);
        equal(4, once(4));
        equal(2, evaluations);
        equal(1, guards);
        try { once(null); throw new AssertionError("null selector accepted"); }
        catch (NullPointerException expected) {}
        equal(3, evaluations);
        equal(1, guards);
        equal(0, five("x"));
        equal(4, five(1.0f));
        equal(5, five(new Object()));
        equal(0, mixed("x"));
        equal(1, mixed("y"));
        equal(0, enumeration(E.A));
        equal(1, enumeration(E.B));
        equal(0, primitive(1));
        equal(1, primitive(1000));
        for (var method : SmallReferenceSwitch.class.getDeclaredMethods()) {
            if (method.isSynthetic() && method.getName().equals("typeSwitch$0")) {
                throw new AssertionError("generated name shadows inherited method");
            }
        }
        checkBytecode();
    }

    static int empty(Object value) {
        return switch (value) { case null -> -1; default -> 0; };
    }

    static int single(Object value) {
        return switch (value) { case null -> -1; case String _ -> 1; default -> 0; };
    }

    static int two(Object value) {
        return switch (value) {
            case null -> -1;
            case String s -> s.length();
            case Number n -> n.intValue();
            default -> 0;
        };
    }

    static int four(Object value) {
        return switch (value) {
            case null -> -1;
            case String _ -> 0;
            case Integer _ -> 1;
            case int[] _ -> 2;
            case List<?> _ -> 3;
            default -> 4;
        };
    }

    static int guarded(Object value, boolean accept) {
        return switch (value) {
            case null -> -1;
            case CharSequence _ when accept -> 0;
            case String _ -> 1;
            case CharSequence _ -> 2;
            default -> 3;
        };
    }

    static int multi(Object value, boolean accept) {
        return switch (value) {
            case String _, Integer _ when accept -> 0;
            case Number _ -> 1;
            default -> 2;
        };
    }

    static int records(Object value) {
        return switch (value) {
            case Box(String s) -> s.length();
            case Box(Number n) -> n.intValue();
            default -> 0;
        };
    }

    static int local(boolean match) {
        class Local {}
        Object value = match ? new Local() : new Object();
        return switch (value) { case Local _ -> 1; default -> 0; };
    }

    static int localOther(boolean match) {
        class Local {}
        Object value = match ? new Local() : new Object();
        return switch (value) { case Local _ -> 2; default -> 0; };
    }

    static int arraysA(Object value) {
        return switch (value) { case String[] _ -> 1; case Object[] _ -> 2; default -> 0; };
    }

    static int arraysB(Object value) {
        return switch (value) { case Integer[] _ -> 3; case Object[] _ -> 4; default -> 0; };
    }

    static int typed(Number value) {
        return switch (value) { case Integer _ -> 2; case Number _ -> 3; };
    }

    static int typedObject(Object value) {
        return switch (value) { case Integer _ -> 2; case Number _ -> 3; default -> 0; };
    }

    interface Marker extends java.io.Serializable {
        int VALUE = switch ((Object) "x") { case String _ -> 1; default -> 0; };
    }

    // Generated names must avoid both declared and inherited methods.
    private static int typeSwitch$1(Object value, int restart) { return -100; }

    static class UninitializedHost {
        static final int FAIL = fail();
        static int fail() { throw new AssertionError("outer class initialized"); }
        static int select(Object value) {
            return switch (value) { case Cloneable _ -> 2; case java.io.Serializable _ -> 3; default -> 0; };
        }
        static class Nested {
            static int select(Object value) {
                return switch (value) { case Cloneable _ -> 2; case java.io.Serializable _ -> 3; default -> 0; };
            }
        }
    }

    static Object select(Object value) { evaluations++; return value; }
    static boolean guard() { guards++; return true; }

    static int once(Object value) {
        return switch (select(value)) {
            case String s when guard() -> s.length();
            case Number n -> n.intValue();
            default -> 0;
        };
    }

    static int five(Object value) {
        return switch (value) {
            case String _ -> 0;
            case Integer _ -> 1;
            case Long _ -> 2;
            case Double _ -> 3;
            case Float _ -> 4;
            default -> 5;
        };
    }

    static int mixed(String value) {
        return switch (value) { case "x" -> 0; case String _ -> 1; };
    }

    static int enumeration(E value) {
        return switch (value) { case A -> 0; case E _ -> 1; };
    }

    static int primitive(int value) {
        return switch (value) { case byte _ -> 0; default -> 1; };
    }

    static void checkBytecode() throws Exception {
        var expected = Map.ofEntries(
                Map.entry("empty", false), Map.entry("single", false),
                Map.entry("two", false), Map.entry("four", false),
                Map.entry("guarded", false), Map.entry("multi", false),
                Map.entry("records", false), Map.entry("local", false), Map.entry("once", false),
                Map.entry("localOther", false), Map.entry("arraysA", false), Map.entry("arraysB", false),
                Map.entry("typed", false),
                Map.entry("typedObject", false),
                Map.entry("five", true), Map.entry("mixed", true),
                Map.entry("enumeration", true), Map.entry("primitive", true));
        byte[] bytes;
        try (var input = SmallReferenceSwitch.class.getResourceAsStream("SmallReferenceSwitch.class")) {
            bytes = input.readAllBytes();
        }
        int checked = 0;
        String twoClassifier = null;
        String onceClassifier = null;
        for (var method : ClassFile.of().parse(bytes).methods()) {
            String name = method.methodName().stringValue();
            if (!expected.containsKey(name)) continue;
            checked++;
            boolean bootstrap = method.code().orElseThrow().elementStream()
                    .filter(e -> e instanceof InvokeDynamicInstruction)
                    .map(e -> ((InvokeDynamicInstruction) e).bootstrapMethod())
                    .anyMatch(bsm -> bsm.owner().descriptorString().equals("Ljava/lang/runtime/SwitchBootstraps;"));
            if (bootstrap != expected.get(name)) throw new AssertionError(name + ": bootstrap=" + bootstrap);
            if (name.equals("two") || name.equals("once")) {
                String classifier = method.code().orElseThrow().elementStream()
                        .filter(e -> e instanceof InvokeInstruction i &&
                                i.owner().asSymbol().descriptorString().equals("LSmallReferenceSwitch;") &&
                                i.typeSymbol().descriptorString().equals("(Ljava/lang/Object;I)I"))
                        .map(e -> ((InvokeInstruction) e).name().stringValue()).findFirst().orElseThrow();
                if (name.equals("two")) twoClassifier = classifier;
                else onceClassifier = classifier;
            }
        }
        equal(expected.size(), checked);
        if (!twoClassifier.equals(onceClassifier)) throw new AssertionError("identical labels not shared");
    }

    static void equal(int expected, int actual) {
        if (expected != actual) throw new AssertionError(expected + " != " + actual);
    }
}

class SwitchNameParent {
    protected final int typeSwitch$0(Object value, int restart) { return -100; }
}
