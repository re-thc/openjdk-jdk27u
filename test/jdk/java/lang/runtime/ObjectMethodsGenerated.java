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
 * @summary Check toString, hashCode and equals of records for all kinds of components,
 *          with getters that read the fields and with getters that do not
 * @run main ObjectMethodsGenerated
 */

import java.lang.invoke.CallSite;
import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.reflect.RecordComponent;
import java.lang.runtime.ObjectMethods;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class ObjectMethodsGenerated {

    static final MethodHandles.Lookup LOOKUP = MethodHandles.lookup();

    interface I { }
    static final class F implements I {
        final int v;
        F(int v) { this.v = v; }
        @Override public boolean equals(Object o) { return o instanceof F f && f.v == v; }
        @Override public int hashCode() { return v * 7; }
        @Override public String toString() { return "F" + v; }
    }
    /** Equal to nothing, not even to itself. */
    static final class Never {
        @Override public boolean equals(Object o) { return false; }
        @Override public int hashCode() { return 42; }
        @Override public String toString() { return "Never"; }
    }
    /** Returns null from toString. */
    static final class NullString {
        @Override public String toString() { return null; }
    }

    record Prims(boolean z, byte b, short s, char c, int i, long l, float f, double d) { }
    record Floats(float f, double d) { }
    record Refs(String s, Object o, I i, List<String> list, Integer boxed, Never never) { }
    record ArrayHolder(int[] ints, String[] strings, char[] chars) { }
    record One(String name) { }
    // an accessor does not change the values that the methods use
    record Accessor(int x) { public int x() { return 42; } }
    record Nested(One one, Nested next) { }
    record Many(long a, String b, double c, int d, long e, String f, double g, int h, long i, String j,
                double k, int l, long m, String n, double o, int p, long q, String r, double s, int t,
                long u, String v, double w, int x, long y, String z) { }
    // 20 slots, which toString concatenates in one step, and 21
    record Twenty(long a, long b, long c, long d, long e, long f, long g, long h, long i, long j) { }
    record TwentyOne(long a, long b, long c, long d, long e, long f, long g, long h, long i, long j, int k) { }
    record Empty() { }

    static final List<String> LOG = new ArrayList<>();
    static final class Spy {
        final String name;
        Spy(String name) { this.name = name; }
        @Override public boolean equals(Object o) { LOG.add("equals " + name); return true; }
        @Override public int hashCode() { LOG.add("hashCode " + name); return 1; }
        @Override public String toString() { LOG.add("toString " + name); return name; }
    }
    record Spies(Spy a, Spy b, Spy c) { }

    /** The getters that read the fields of the record class. */
    static MethodHandle[] fieldGetters(Class<?> record) throws ReflectiveOperationException {
        RecordComponent[] components = record.getRecordComponents();
        MethodHandle[] getters = new MethodHandle[components.length];
        for (int i = 0; i < getters.length; i++) {
            getters[i] = LOOKUP.findGetter(record, components[i].getName(), components[i].getType());
        }
        return getters;
    }

    /** Getters that return the same values but are no direct method handles of the fields. */
    static MethodHandle[] otherGetters(MethodHandle[] getters) {
        MethodHandle[] others = new MethodHandle[getters.length];
        for (int i = 0; i < others.length; i++) {
            Class<?> type = getters[i].type().returnType();
            others[i] = MethodHandles.filterReturnValue(getters[i], MethodHandles.identity(type));
        }
        return others;
    }

    static MethodHandle bootstrap(Class<?> record, String name, MethodHandle[] getters) throws Throwable {
        return bootstrap(LOOKUP, record, name, getters);
    }

    static MethodHandle bootstrap(MethodHandles.Lookup lookup, Class<?> record, String name, MethodHandle[] getters) throws Throwable {
        StringBuilder names = new StringBuilder();
        for (RecordComponent c : record.getRecordComponents()) {
            names.append(names.isEmpty() ? "" : ";").append(c.getName());
        }
        MethodType type = switch (name) {
            case "toString" -> MethodType.methodType(String.class, record);
            case "hashCode" -> MethodType.methodType(int.class, record);
            default -> MethodType.methodType(boolean.class, record, Object.class);
        };
        return ((CallSite) ObjectMethods.bootstrap(lookup, name, type, record, names.toString(), getters)).dynamicInvoker();
    }

    static void check(Object expected, Object actual, String what) {
        if (!Objects.equals(expected, actual)) {
            throw new AssertionError(what + ": expected " + expected + " but got " + actual);
        }
    }

    /**
     * Checks the three methods for the given values of a record class, which have to be pairwise
     * different except for the ones that are listed as equal.
     */
    static void check(Class<?> record, String toString, int hashCode, boolean equal, Object a, Object b) throws Throwable {
        MethodHandle[] fields = fieldGetters(record);
        for (MethodHandle[] getters : new MethodHandle[][] { fields, otherGetters(fields) }) {
            String path = record.getSimpleName() + (getters == fields ? " (fields)" : " (other getters)");
            check(toString, ((String) bootstrap(record, "toString", getters).invoke(a)).replaceAll("@[0-9a-f]+", "@H"), path + " toString");
            if (hashCode != 0) {
                check(hashCode, (int) bootstrap(record, "hashCode", getters).invoke(a), path + " hashCode");
            }
            MethodHandle equals = bootstrap(record, "equals", getters);
            check(equal, (boolean) equals.invoke(a, b), path + " equals");
            check(equal, (boolean) equals.invoke(b, a), path + " equals, reversed");
            check(true, (boolean) equals.invoke(a, a), path + " equals itself");
            check(false, (boolean) equals.invoke(a, (Object) null), path + " equals null");
            check(false, (boolean) equals.invoke(a, new Object()), path + " equals an Object");
        }
    }

    static int hash(int... hashes) {
        int h = 0;
        for (int x : hashes) {
            h = 31 * h + x;
        }
        return h;
    }

    public static void main(String[] args) throws Throwable {
        check(Prims.class, "Prims[z=true, b=1, s=2, c=x, i=3, l=4, f=5.5, d=6.5]",
              hash(Boolean.hashCode(true), 1, 2, 'x', 3, Long.hashCode(4), Float.hashCode(5.5f), Double.hashCode(6.5)), true,
              new Prims(true, (byte) 1, (short) 2, 'x', 3, 4L, 5.5f, 6.5), new Prims(true, (byte) 1, (short) 2, 'x', 3, 4L, 5.5f, 6.5));
        check(Prims.class, "Prims[z=false, b=-128, s=-32768, c=\uffff, i=-2147483648, l=-9223372036854775808, f=-Infinity, d=NaN]",
              hash(Boolean.hashCode(false), -128, -32768, 0xffff, Integer.MIN_VALUE, Long.hashCode(Long.MIN_VALUE),
                   Float.hashCode(Float.NEGATIVE_INFINITY), Double.hashCode(Double.NaN)), false,
              new Prims(false, Byte.MIN_VALUE, Short.MIN_VALUE, '\uffff', Integer.MIN_VALUE, Long.MIN_VALUE, Float.NEGATIVE_INFINITY, Double.NaN),
              new Prims(true, Byte.MIN_VALUE, Short.MIN_VALUE, '\uffff', Integer.MIN_VALUE, Long.MIN_VALUE, Float.NEGATIVE_INFINITY, Double.NaN));
        Prims base = new Prims(true, (byte) 1, (short) 2, 'x', 3, 4L, 5.5f, 6.5);
        String baseString = "Prims[z=true, b=1, s=2, c=x, i=3, l=4, f=5.5, d=6.5]";
        int baseHash = hash(Boolean.hashCode(true), 1, 2, 'x', 3, Long.hashCode(4), Float.hashCode(5.5f), Double.hashCode(6.5));
        // a difference in any of the components
        for (var other : List.of(new Prims(false, (byte) 1, (short) 2, 'x', 3, 4L, 5.5f, 6.5), new Prims(true, (byte) 0, (short) 2, 'x', 3, 4L, 5.5f, 6.5),
                                 new Prims(true, (byte) 1, (short) 0, 'x', 3, 4L, 5.5f, 6.5), new Prims(true, (byte) 1, (short) 2, 'y', 3, 4L, 5.5f, 6.5),
                                 new Prims(true, (byte) 1, (short) 2, 'x', 0, 4L, 5.5f, 6.5), new Prims(true, (byte) 1, (short) 2, 'x', 3, 0L, 5.5f, 6.5),
                                 new Prims(true, (byte) 1, (short) 2, 'x', 3, 4L, 0f, 6.5), new Prims(true, (byte) 1, (short) 2, 'x', 3, 4L, 5.5f, 0),
                                 new Prims(true, (byte) 1, (short) 2, 'x', 3, 1L << 32 | 4L, 5.5f, 6.5))) {
            check(Prims.class, baseString, baseHash, false, base, other);
        }

        // the lookup of a class in another nest can't read the fields, the getters are used
        MethodHandle[] primGetters = fieldGetters(Prims.class);
        MethodHandles.Lookup other = OtherNest.lookup();
        check(baseString, (String) bootstrap(other, Prims.class, "toString", primGetters).invoke(base), "other nest toString");
        check(baseHash, (int) bootstrap(other, Prims.class, "hashCode", primGetters).invoke(base), "other nest hashCode");
        check(true, (boolean) bootstrap(other, Prims.class, "equals", primGetters).invoke(base, (Object) new Prims(true, (byte) 1, (short) 2, 'x', 3, 4L, 5.5f, 6.5)), "other nest equals");
        check(false, (boolean) bootstrap(other, Prims.class, "equals", primGetters).invoke(base, (Object) new Prims(true, (byte) 1, (short) 2, 'x', 3, 4L, 5.5f, 6.25)), "other nest equals");

        // NaN is equal to itself, and 0.0 is not equal to -0.0
        check(Floats.class, "Floats[f=NaN, d=NaN]", hash(Float.hashCode(Float.NaN), Double.hashCode(Double.NaN)), true,
              new Floats(Float.NaN, Double.NaN), new Floats(Float.intBitsToFloat(0x7fc00000), Double.longBitsToDouble(0x7ff8000000000000L)));
        check(Floats.class, "Floats[f=0.0, d=0.0]", hash(0, 0), false, new Floats(0f, 0d), new Floats(-0f, 0d));
        check(Floats.class, "Floats[f=0.0, d=0.0]", hash(0, 0), false, new Floats(0f, 0d), new Floats(0f, -0d));
        check(Floats.class, "Floats[f=-0.0, d=-0.0]", hash(Float.hashCode(-0f), Double.hashCode(-0d)), true, new Floats(-0f, -0d), new Floats(-0f, -0d));

        // null is only equal to null, and counts as 0 for the hash code
        check(Refs.class, "Refs[s=null, o=null, i=null, list=null, boxed=null, never=null]", 0, true,
              new Refs(null, null, null, null, null, null), new Refs(null, null, null, null, null, null));
        check(Refs.class, "Refs[s=null, o=null, i=null, list=null, boxed=null, never=null]", 0, false,
              new Refs(null, null, null, null, null, null), new Refs("", null, null, null, null, null));
        check(Refs.class, "Refs[s=null, o=null, i=null, list=null, boxed=null, never=null]", 0, false,
              new Refs(null, null, null, null, null, null), new Refs(null, null, null, null, null, new Never()));
        Never never = new Never();
        check(Refs.class, "Refs[s=a, o=b, i=F1, list=[c], boxed=5, never=Never]",
              hash("a".hashCode(), "b".hashCode(), 7, List.of("c").hashCode(), 5, 42), false,
              new Refs("a", "b", new F(1), List.of("c"), 5, never), new Refs("a", "b", new F(1), List.of("c"), 5, never));
        check(Refs.class, "Refs[s=a, o=b, i=F1, list=[c], boxed=5, never=Never]",
              hash("a".hashCode(), "b".hashCode(), 7, List.of("c").hashCode(), 5, 42), false,
              new Refs("a", "b", new F(1), List.of("c"), 5, never), new Refs("a", "b", new F(2), List.of("c"), 5, never));

        // arrays are compared by identity and converted by Object.toString
        int[] ints = { 1 };
        String[] strings = { "x" };
        char[] chars = { 'c' };
        check(ArrayHolder.class, "ArrayHolder[ints=[I@H, strings=[Ljava.lang.String;@H, chars=[C@H]", 0, true,
              new ArrayHolder(ints, strings, chars), new ArrayHolder(ints, strings, chars));
        check(ArrayHolder.class, "ArrayHolder[ints=[I@H, strings=[Ljava.lang.String;@H, chars=[C@H]", 0, false,
              new ArrayHolder(ints, strings, chars), new ArrayHolder(ints, strings, new char[] { 'c' }));
        check(ArrayHolder.class, "ArrayHolder[ints=null, strings=null, chars=null]", 0, true,
              new ArrayHolder(null, null, null), new ArrayHolder(null, null, null));

        // the values of the fields are used, not the ones of the accessor methods
        check(Accessor.class, "Accessor[x=1]", 1, true, new Accessor(1), new Accessor(1));
        check(One.class, "One[name=null]", 0, false, new One(null), new One("x"));
        check(Nested.class, "Nested[one=One[name=a], next=Nested[one=null, next=null]]",
              hash(hash("a".hashCode()), hash(0, 0)), true,
              new Nested(new One("a"), new Nested(null, null)), new Nested(new One("a"), new Nested(null, null)));

        // enough components that toString has to concatenate in several steps
        Many many = new Many(1, "b", 3.5, 4, 5, "f", 7.5, 8, 9, "j", 11.5, 12, 13, "n", 15.5, 16, 17, "r", 19.5, 20, 21, "v", 23.5, 24, 25, "z");
        check(Many.class, "Many[a=1, b=b, c=3.5, d=4, e=5, f=f, g=7.5, h=8, i=9, j=j, k=11.5, l=12, m=13, n=n, o=15.5, p=16, q=17, r=r, s=19.5, t=20, u=21, v=v, w=23.5, x=24, y=25, z=z]",
              0, true, many, new Many(1, "b", 3.5, 4, 5, "f", 7.5, 8, 9, "j", 11.5, 12, 13, "n", 15.5, 16, 17, "r", 19.5, 20, 21, "v", 23.5, 24, 25, "z"));
        check(Many.class, many.toString(), many.hashCode(), false, many,
              new Many(1, "b", 3.5, 4, 5, "f", 7.5, 8, 9, "j", 11.5, 12, 13, "n", 15.5, 16, 17, "r", 19.5, 20, 21, "v", 23.5, 24, 25, "Z"));
        check(Many.class, many.toString(), many.hashCode(), false, many,
              new Many(2, "b", 3.5, 4, 5, "f", 7.5, 8, 9, "j", 11.5, 12, 13, "n", 15.5, 16, 17, "r", 19.5, 20, 21, "v", 23.5, 24, 25, "z"));

        check(Twenty.class, "Twenty[a=1, b=2, c=3, d=4, e=5, f=6, g=7, h=8, i=9, j=10]", hash(1, 2, 3, 4, 5, 6, 7, 8, 9, 10), true,
              new Twenty(1, 2, 3, 4, 5, 6, 7, 8, 9, 10), new Twenty(1, 2, 3, 4, 5, 6, 7, 8, 9, 10));
        check(TwentyOne.class, "TwentyOne[a=1, b=2, c=3, d=4, e=5, f=6, g=7, h=8, i=9, j=10, k=11]", hash(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11), false,
              new TwentyOne(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11), new TwentyOne(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12));

        check(Empty.class, "Empty[]", 0, true, new Empty(), new Empty());

        // a null result of toString is converted like any other
        record Holder(Object o) { }
        NullString nullString = new NullString();
        check(Holder.class, "Holder[o=null]", 0, true, new Holder(nullString), new Holder(nullString));

        // the components are used in order, at most once each: toString and hashCode use all of them,
        // equals stops at the first components that differ
        for (MethodHandle[] getters : new MethodHandle[][] { fieldGetters(Spies.class), otherGetters(fieldGetters(Spies.class)) }) {
            Spies s = new Spies(new Spy("a"), new Spy("b"), new Spy("c"));
            LOG.clear();
            check("Spies[a=a, b=b, c=c]", (String) bootstrap(Spies.class, "toString", getters).invoke(s), "Spies toString");
            check(List.of("toString a", "toString b", "toString c"), List.copyOf(LOG), "toString order");
            LOG.clear();
            check(hash(1, 1, 1), (int) bootstrap(Spies.class, "hashCode", getters).invoke(s), "Spies hashCode");
            check(List.of("hashCode a", "hashCode b", "hashCode c"), List.copyOf(LOG), "hashCode order");
            LOG.clear();
            check(true, (boolean) bootstrap(Spies.class, "equals", getters).invoke(s, new Spies(new Spy("a"), new Spy("b"), new Spy("c"))), "Spies equals");
            check(3, LOG.size(), "equals calls");
        }
        System.out.println("passed");
    }
}

/** A class that is not in the nest of the test. */
class OtherNest {
    static MethodHandles.Lookup lookup() {
        return MethodHandles.lookup();
    }
}
