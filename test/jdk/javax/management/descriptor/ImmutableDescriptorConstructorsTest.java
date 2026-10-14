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
 * @summary Check the order of the fields, the detection of duplicate and
 *          illegal field names and the union of descriptors, for each way of
 *          constructing an ImmutableDescriptor
 * @run main ImmutableDescriptorConstructorsTest
 */

import java.util.AbstractMap;
import java.util.Arrays;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.TreeMap;
import javax.management.Descriptor;
import javax.management.ImmutableDescriptor;

public class ImmutableDescriptorConstructorsTest {

    public static void main(String[] args) {
        // Same fields in a different order, with different cases
        String[] names = {"zeta", "Alpha", "beta", "ALPHA2", "Gamma"};
        Object[] values = {1, "a", new int[] {3}, 4L, null};
        String[] expectedNames = {"Alpha", "ALPHA2", "beta", "Gamma", "zeta"};

        Map<String, Object> map = new LinkedHashMap<>();
        String[] strings = new String[names.length];
        for (int i = 0; i < names.length; i++) {
            map.put(names[i], values[i]);
            strings[i] = names[i] + "=" + (values[i] == null ? "" : "x");
        }
        Descriptor fromArrays = new ImmutableDescriptor(names, values);
        Descriptor fromMap = new ImmutableDescriptor(map);
        Descriptor fromTree = new ImmutableDescriptor(
                new TreeMap<>(Comparator.<String>reverseOrder()) {{ putAll(map); }});
        for (Descriptor d : new Descriptor[] {fromArrays, fromMap, fromTree})
            checkOrder(d, expectedNames);
        check(fromArrays.equals(fromMap), "arrays and map");
        check(fromArrays.equals(fromTree), "arrays and map in reverse order");
        check(fromArrays.getFieldValue("ALPHA") == "a", "case insensitive access");
        check(Arrays.equals((int[]) fromArrays.getFieldValue("BETA"), new int[] {3}),
              "array value");
        check(fromArrays.getFieldValue("gamma") == null, "null value");

        Descriptor fromStrings = new ImmutableDescriptor(strings);
        checkOrder(fromStrings, expectedNames);
        check(Arrays.toString(fromStrings.getFields()).equals(
                "[Alpha=x, ALPHA2=x, beta=x, Gamma=, zeta=x]"), "getFields "
              + Arrays.toString(fromStrings.getFields()));
        check(new ImmutableDescriptor("a=b=c").getFieldValue("a").equals("b=c"),
              "value with =");
        check(new ImmutableDescriptor().getFieldNames().length == 0,
              "no fields");
        check(new ImmutableDescriptor(new String[0], new Object[0])
              .getFieldNames().length == 0, "no fields in arrays");
        check(new ImmutableDescriptor(Map.of()).getFieldNames().length == 0,
              "no fields in map");

        // A Map whose size() lies: the fields must still all be added
        Map<String, Object> lying = new AbstractMap<>() {
            public Set<Map.Entry<String, Object>> entrySet() { return map.entrySet(); }
            public int size() { return 1; }
        };
        checkOrder(new ImmutableDescriptor(lying), expectedNames);
        Map<String, Object> noSize = new AbstractMap<>() {
            public Set<Map.Entry<String, Object>> entrySet() { return map.entrySet(); }
            public int size() { return 0; }
        };
        checkOrder(new ImmutableDescriptor(noSize), expectedNames);

        // Duplicate names are the same names ignoring case
        expectIAE("duplicate in arrays", () ->
                new ImmutableDescriptor(new String[] {"a", "b", "A"}, new Object[] {1, 2, 3}));
        expectIAE("duplicate in strings", () ->
                new ImmutableDescriptor("a=1", "b=2", "A=3"));
        expectIAE("duplicate in map", () ->
                new ImmutableDescriptor(new LinkedHashMap<>(
                        new TreeMap<String, Object>(String.CASE_INSENSITIVE_ORDER) {{
                            put("x", 1); }}) {{ put("X", 2); }}));

        // Illegal names and arguments
        expectIAE("null name in arrays", () ->
                new ImmutableDescriptor(new String[] {"a", null}, new Object[] {1, 2}));
        expectIAE("empty name in arrays", () ->
                new ImmutableDescriptor(new String[] {"a", ""}, new Object[] {1, 2}));
        expectIAE("empty name in strings", () ->
                new ImmutableDescriptor("a=1", "=2"));
        expectIAE("no = in strings", () ->
                new ImmutableDescriptor("a=1", "b"));
        expectIAE("no = after empty name", () ->
                new ImmutableDescriptor("=1", "b"));
        expectIAE("null name in map", () -> {
            Map<String, Object> m = new LinkedHashMap<>();
            m.put("a", 1);
            m.put(null, 2);
            return new ImmutableDescriptor(m);
        });
        expectIAE("empty name in map", () -> new ImmutableDescriptor(Map.of("", 1)));
        expectIAE("null names", () ->
                new ImmutableDescriptor((String[]) null, new Object[0]));
        expectIAE("null values", () ->
                new ImmutableDescriptor(new String[0], (Object[]) null));
        expectIAE("different sizes", () ->
                new ImmutableDescriptor(new String[] {"a"}, new Object[0]));
        expectIAE("null strings", () -> new ImmutableDescriptor((String[]) null));
        expectIAE("null map", () -> new ImmutableDescriptor((Map<String, ?>) null));

        // The constructors copy their arguments
        String[] n = {"b", "a"};
        Object[] v = {1, 2};
        Descriptor copy = new ImmutableDescriptor(n, v);
        n[0] = "c";
        v[1] = 3;
        check(copy.getFieldValue("a").equals(2) && copy.getFieldValue("b").equals(1),
              "arguments are copied");

        union();
        manyFields();

        if (failure != null)
            throw new AssertionError(failure);
        System.out.println("OK");
    }

    private static void union() {
        Descriptor d1 = new ImmutableDescriptor("c=1", "A=2", "e=3");
        Descriptor d2 = new ImmutableDescriptor("b=4", "a=2", "E=3", "d=5");
        Descriptor u = ImmutableDescriptor.union(d1, null, d2);
        checkOrder(u, new String[] {"A", "b", "c", "d", "e"});
        check(Arrays.toString(u.getFields()).equals("[A=2, b=4, c=1, d=5, e=3]"),
              "union fields " + Arrays.toString(u.getFields()));
        check(ImmutableDescriptor.union() == ImmutableDescriptor.EMPTY_DESCRIPTOR,
              "empty union");
        check(ImmutableDescriptor.union(d1, ImmutableDescriptor.EMPTY_DESCRIPTOR).equals(d1),
              "union with the empty descriptor");
        check(ImmutableDescriptor.union(d1, d1).equals(d1), "union with itself");

        // Equal values, also for arrays and null values
        Descriptor a1 = new ImmutableDescriptor(new String[] {"x", "y", "z"},
                new Object[] {new int[] {1}, new String[] {"s"}, null});
        Descriptor a2 = new ImmutableDescriptor(new String[] {"X", "Y", "Z", "w"},
                new Object[] {new int[] {1}, new String[] {"s"}, null, 5});
        Descriptor au = ImmutableDescriptor.union(a1, a2);
        // The spelling of the names is that of one of the descriptors
        check(au.equals(new ImmutableDescriptor(
                      new String[] {"w", "x", "y", "z"},
                      new Object[] {5, new int[] {1}, new String[] {"s"}, null})),
              "union of arrays " + au);
        check(au.getFieldNames().length == 4, "union of arrays has 4 fields");

        expectIAE("inconsistent values", () ->
                ImmutableDescriptor.union(d1, new ImmutableDescriptor("C=2")));
        expectIAE("inconsistent array values", () ->
                ImmutableDescriptor.union(a1, new ImmutableDescriptor(
                        new String[] {"X"}, new Object[] {new int[] {2}})));
    }

    // Larger inputs are sorted differently from small ones, with the same result
    // as adding the fields in turn to a TreeMap, including which name is reported
    private static void manyFields() {
        Random random = new Random(4711);
        for (int n : new int[] {31, 32, 33, 40, 1000}) {
            for (int round = 0; round < 60; round++) {
                String[] names = new String[n];
                Object[] values = new Object[n];
                for (int i = 0; i < n; i++) {
                    String name = "f" + random.nextInt(round % 2 == 0 ? n : 4 * n);
                    names[i] = random.nextBoolean() ? name : name.toUpperCase(Locale.ROOT);
                    values[i] = random.nextInt(4) == 0 ? null : i;
                }
                if (round % 5 == 0)
                    names[random.nextInt(n)] = random.nextBoolean() ? null : "";
                if (round % 3 == 0)
                    Arrays.sort(names, Comparator.nullsFirst(String.CASE_INSENSITIVE_ORDER.reversed()));
                String expected = addInTurn(names, values, false);
                String actual = fields(() -> new ImmutableDescriptor(names, values));
                check(actual.equals(expected), n + " fields from arrays: " + actual
                      + " expected " + expected);

                Map<String, Object> map = new LinkedHashMap<>();
                for (int i = 0; i < n; i++)
                    map.put(names[i], values[i]);
                expected = addInTurn(map.keySet().toArray(new String[0]), map.values().toArray(), true);
                actual = fields(() -> new ImmutableDescriptor(map));
                check(actual.equals(expected), n + " fields from a map: " + actual
                      + " expected " + expected);
            }
        }
    }

    // The fields or the exception message of adding the fields to a TreeMap in turn
    private static String addInTurn(String[] names, Object[] values, boolean fromMap) {
        TreeMap<String, Object> map = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
        for (int i = 0; i < names.length; i++) {
            if (names[i] == null || names[i].isEmpty())
                return "Empty or null field name";
            if (fromMap && map.containsKey(names[i]))
                return "Duplicate name: " + names[i];
            if (map.put(names[i], values[i]) != null)
                return "Duplicate field name: " + names[i];
        }
        return map.toString();
    }

    private static String fields(Construction c) {
        try {
            Descriptor d = (Descriptor) c.run();
            TreeMap<String, Object> map = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
            for (String name : d.getFieldNames())
                map.put(name, d.getFieldValue(name));
            return map.toString();
        } catch (IllegalArgumentException e) {
            return e.getMessage();
        }
    }

    private static void checkOrder(Descriptor d, String[] expected) {
        check(Arrays.equals(d.getFieldNames(), expected),
              "names " + Arrays.toString(d.getFieldNames()) + " expected "
              + Arrays.toString(expected));
    }

    interface Construction {
        Object run();
    }

    private static void expectIAE(String what, Construction c) {
        try {
            c.run();
            fail(what + ": no exception");
        } catch (IllegalArgumentException e) {
            // expected
        } catch (RuntimeException e) {
            fail(what + ": " + e);
        }
    }

    private static void check(boolean condition, String what) {
        if (!condition)
            fail(what);
    }

    private static String failure;

    private static void fail(String what) {
        System.out.println("FAILED: " + what);
        if (failure == null)
            failure = what;
    }
}
