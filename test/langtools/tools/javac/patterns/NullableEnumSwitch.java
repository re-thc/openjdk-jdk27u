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
 * @summary Split small nullable enum expressions without changing rule evaluation or fallback lowering
 * @compile -g NullableEnumSwitch.java
 * @run main/othervm -Xverify:all NullableEnumSwitch
 * @run main/othervm -Xint NullableEnumSwitch
 */

import java.lang.classfile.ClassFile;
import java.lang.classfile.instruction.InvokeDynamicInstruction;
import java.nio.file.AccessMode;
import java.util.List;
import java.util.Map;

public class NullableEnumSwitch {
    enum E { A, B, C, D, F }
    enum Empty {}
    private enum PrivateE { A, B }
    enum Dormant {
        A;
        static {
            if (fail()) throw new AssertionError("unused enum initialized");
        }
        static boolean fail() { return true; }
    }

    static int selections;
    static int finalizers;
    static StringBuilder order = new StringBuilder();

    public static void main(String... args) throws Exception {
        equal(-1, simple(null));
        equal(1, simple(E.A));
        equal(3, simple(E.C));
        equal(3, simple(E.D));
        equal(9, simple(E.F));
        equal(5, selections);
        equal(-1, nullAfterConstant(null));
        equal(9, nullAfterConstant(E.B));
        equal(13, nested(null));
        equal(14, nested(E.A));
        equal(19, nested(E.B));
        equal(2, finalizers);
        equal(2, nestedReference(null, "xy"));
        equal(7, nestedReference(null, 7));
        equal(-2, nestedReference(null, new Object()));
        equal(12, nestedReference(E.A, "xy"));
        equal(-3, nestedReference(E.A, 7));
        equal(99, nestedReference(E.B, "xy"));
        order.setLength(0);
        equal(12, ordered(null));
        if (!order.toString().equals("PSN")) throw new AssertionError(order);
        order.setLength(0);
        equal(13, ordered(E.A));
        if (!order.toString().equals("PSA")) throw new AssertionError(order);
        int count = selections;
        try { failedSelector(); throw new AssertionError("selector did not throw"); }
        catch (IllegalArgumentException expected) {}
        equal(count + 1, selections);
        try { failedDefaultOnlySelector(); throw new AssertionError("default-only selector did not throw"); }
        catch (IllegalArgumentException expected) {}
        equal(count + 2, selections);
        equal(7, throwing(E.B));
        try { throwing(null); throw new AssertionError("null arm did not throw"); }
        catch (IllegalStateException expected) {}
        count = selections;
        equal(5, defaultOnly(null));
        equal(6, defaultOnly(E.F));
        equal(count + 2, selections);
        equal(8, empty(null));
        equal(0, external(AccessMode.READ));
        equal(1, external(AccessMode.WRITE));
        equal(9, external(AccessMode.EXECUTE));
        equal(-1, external(null));
        // Other maps in this caller must not initialize Dormant, nor may its null arm.
        equal(-1, dormant(null));
        equal(1, typedByte(null));
        equal('d', typedChar(E.B));
        if (!(boxed(null) instanceof Integer i) || i != 1) throw new AssertionError("boxing");
        if (!boxed(E.A).equals("x") || !generic(null, "g").equals("g")) throw new AssertionError("typing");
        if (!list(null).equals(List.of(1)) || !list(E.A).equals(List.of(2.0))) throw new AssertionError("poly");
        if (!conditional(null) || conditional(E.B)) throw new AssertionError("condition");
        equal(32L, wideResult(null));
        equal(34L, wideResult(E.A));
        equal(-1, local(false));
        equal(2, local(true));
        equal(-1, privateEnum(null));
        equal(2, privateEnum(PrivateE.B));
        equal(-1, colon(null));
        equal(-1, statement(null));
        equal(-2, combined(null));
        equal(2, guarded(E.B, true));
        equal(3, guarded(E.B, false));
        equal(5, many(E.F));
        checkBytecode();
    }

    static E select(E e) { selections++; return e; }
    static int simple(E e) {
        return switch (select(e)) {
            case null -> -1;
            case A -> 1;
            case C, D -> 3;
            default -> 9;
        };
    }
    static int nullAfterConstant(E e) {
        return switch (e) { case A -> 1; case null -> -1; default -> 9; };
    }
    static int nested(E e) {
        return 10 + switch (e) {
            case null -> {
                try {
                    yield switch (e) { case null -> 3; default -> 7; };
                } finally { finalizers++; }
            }
            case A -> { try { yield 4; } finally { finalizers++; } }
            default -> 9;
        };
    }
    static int prefix() { order.append('P'); return 10; }
    static int nestedReference(E e, Object value) {
        return switch (e) {
            case null -> switch (value) {
                case String s -> s.length();
                case Integer i -> i.intValue();
                default -> -2;
            };
            case A -> switch (value) { case String s -> s.length() + 10; default -> -3; };
            default -> 99;
        };
    }
    static E orderedSelect(E e) { order.append('S'); return select(e); }
    static int ordered(E e) {
        return prefix() + switch (orderedSelect(e)) {
            case null -> { order.append('N'); yield 2; }
            case A -> { order.append('A'); yield 3; }
            default -> 9;
        };
    }
    static E failSelector() { selections++; throw new IllegalArgumentException("selector"); }
    static int failedSelector() {
        return switch (failSelector()) { case null -> 0; case A -> 1; default -> 2; };
    }
    static int failedDefaultOnlySelector() {
        return switch (failSelector()) { case null -> 0; default -> 2; };
    }
    static int throwing(E e) {
        return switch (e) { case null -> throw new IllegalStateException("null arm"); default -> 7; };
    }
    static int defaultOnly(E e) {
        return switch (select(e)) { case null -> 5; default -> 6; };
    }
    static int empty(Empty e) {
        return switch (e) { case null -> 8; default -> 9; };
    }
    static int external(AccessMode e) {
        return switch (e) { case null -> -1; case READ -> 0; case WRITE -> 1; default -> 9; };
    }
    static int dormant(Dormant e) {
        return switch (e) { case null -> -1; case A -> 1; };
    }
    static byte typedByte(E e) {
        return switch (e) { case null -> 1; default -> 2; };
    }
    static char typedChar(E e) {
        return switch (e) { case null -> 'n'; default -> 'd'; };
    }
    static Object boxed(E e) {
        return switch (e) { case null -> 1; default -> "x"; };
    }
    static <T> T generic(E e, T value) {
        return switch (e) { case null -> value; default -> value; };
    }
    static List<? extends Number> list(E e) {
        return switch (e) { case null -> List.of(1); default -> List.of(2.0); };
    }
    static boolean conditional(E e) {
        return (switch (e) {
            case null -> { try { yield true; } finally { finalizers++; } }
            default -> false;
        }) && true;
    }
    static long wideResult(E e) {
        return switch (e) {
            case null -> { try { yield 32L; } catch (RuntimeException ex) { yield 33L; } }
            case A -> 34L;
            default -> 35L;
        };
    }
    static int local(boolean nonNull) {
        enum Local { A, B }
        Local value = nonNull ? Local.B : null;
        return switch (value) { case null -> -1; case A -> 1; case B -> 2; };
    }
    static int privateEnum(PrivateE e) {
        return switch (e) { case null -> -1; case A -> 1; case B -> 2; };
    }

    static int colon(E e) {
        return switch (e) { case null: yield -1; case A: yield 1; default: yield 9; };
    }
    static int statement(E e) {
        switch (e) { case null: return -1; case A: return 1; default: return 9; }
    }
    static int combined(E e) {
        return switch (e) { case A -> 1; case null, default -> -2; };
    }
    static int guarded(E e, boolean accept) {
        return switch (e) { case null -> -1; case A -> 1; case E v when accept -> 2; default -> 3; };
    }
    static int many(E e) {
        return switch (e) { case null -> -1; case A -> 1; case B -> 2; case C -> 3; case D -> 4; case F -> 5; };
    }

    static void checkBytecode() throws Exception {
        var expected = Map.ofEntries(
                Map.entry("simple", false), Map.entry("nullAfterConstant", false), Map.entry("nested", false),
                Map.entry("ordered", false), Map.entry("throwing", false), Map.entry("defaultOnly", false),
                Map.entry("empty", false), Map.entry("external", false), Map.entry("dormant", false),
                Map.entry("boxed", false), Map.entry("generic", false), Map.entry("list", false),
                Map.entry("conditional", false), Map.entry("wideResult", false),
                Map.entry("nestedReference", false),
                Map.entry("local", false), Map.entry("privateEnum", false),
                Map.entry("colon", true), Map.entry("statement", true), Map.entry("combined", true),
                Map.entry("guarded", true), Map.entry("many", true));
        byte[] bytes;
        try (var in = NullableEnumSwitch.class.getResourceAsStream("NullableEnumSwitch.class")) {
            bytes = in.readAllBytes();
        }
        int checked = 0;
        for (var method : ClassFile.of().parse(bytes).methods()) {
            String name = method.methodName().stringValue();
            if (!expected.containsKey(name)) continue;
            checked++;
            boolean bootstrap = method.code().orElseThrow().elementStream()
                    .filter(InvokeDynamicInstruction.class::isInstance)
                    .map(InvokeDynamicInstruction.class::cast)
                    .anyMatch(i -> i.bootstrapMethod().owner().descriptorString()
                            .equals("Ljava/lang/runtime/SwitchBootstraps;"));
            if (bootstrap != expected.get(name)) throw new AssertionError(name + ": bootstrap=" + bootstrap);
        }
        equal(expected.size(), checked);
    }
    static void equal(long expected, long actual) {
        if (expected != actual) throw new AssertionError(expected + " != " + actual);
    }
}
