/*
 * Copyright (c) 2004, 2025, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
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

package javax.management;

import com.sun.jmx.mbeanserver.Util;
import java.io.InvalidObjectException;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Map;
import java.util.TreeMap;

/**
 * An immutable descriptor.
 * @since 1.6
 */
public class ImmutableDescriptor implements Descriptor {
    private static final long serialVersionUID = 8853308591080540165L;

    /**
     * @serial The names of the fields in this ImmutableDescriptor with their
     * original case.  The names must be in alphabetical order as determined
     * by {@link String#CASE_INSENSITIVE_ORDER}.
     */
    private final String[] names;
    /**
     * @serial The values of the fields in this ImmutableDescriptor.  The
     * elements in this array match the corresponding elements in the
     * {@code names} array.
     */
    @SuppressWarnings("serial") // Conditionally serializable
    private final Object[] values;

    private transient int hashCode = -1;

    /**
     * An empty descriptor.
     */
    public static final ImmutableDescriptor EMPTY_DESCRIPTOR =
            new ImmutableDescriptor();

    /**
     * Construct a descriptor containing the given fields and values.
     *
     * @param fieldNames the field names
     * @param fieldValues the field values
     * @throws IllegalArgumentException if either array is null, or
     * if the arrays have different sizes, or
     * if a field name is null or empty, or if the same field name
     * appears more than once.
     */
    public ImmutableDescriptor(String[] fieldNames, Object[] fieldValues) {
        if (fieldNames == null || fieldValues == null)
            throw new IllegalArgumentException("Null array parameter");
        if (fieldNames.length != fieldValues.length)
            throw new IllegalArgumentException("Different size arrays");
        Fields fields = sortFields(fieldNames, fieldValues, fieldNames.length, false);
        this.names = fields.names;
        this.values = fields.values;
    }

    /**
     * Construct a descriptor containing the given fields.  Each String
     * must be of the form {@code fieldName=fieldValue}.  The field name
     * ends at the first {@code =} character; for example if the String
     * is {@code a=b=c} then the field name is {@code a} and its value
     * is {@code b=c}.
     *
     * @param fields the field names
     * @throws IllegalArgumentException if the parameter is null, or
     * if a field name is empty, or if the same field name appears
     * more than once, or if one of the strings does not contain
     * an {@code =} character.
     */
    public ImmutableDescriptor(String... fields) {
        this(splitFields(fields));
    }

    private ImmutableDescriptor(String[][] namesAndValues) {
        this(namesAndValues[0], namesAndValues[1]);
    }

    /**
     * <p>Construct a descriptor where the names and values of the fields
     * are the keys and values of the given Map.</p>
     *
     * @param fields the field names and values
     * @throws IllegalArgumentException if the parameter is null, or
     * if a field name is null or empty, or if the same field name appears
     * more than once (which can happen because field names are not case
     * sensitive).
     */
    public ImmutableDescriptor(Map<String, ?> fields) {
        if (fields == null)
            throw new IllegalArgumentException("Null Map");
        // The map can change while it is read, so the arrays are grown if necessary.
        String[] names = new String[fields.size()];
        Object[] values = new Object[names.length];
        int size = 0;
        for (Map.Entry<String, ?> entry : fields.entrySet()) {
            if (size == names.length) {
                names = Arrays.copyOf(names, 2 * size + 1);
                values = Arrays.copyOf(values, names.length);
            }
            names[size] = entry.getKey();
            values[size] = entry.getValue();
            size++;
        }
        Fields sorted = sortFields(names, values, size, true);
        this.names = sorted.names;
        this.values = sorted.values;
    }

    private record Fields(String[] names, Object[] values) { }

    // Inputs up to this size are sorted by insertion, larger ones all at once.
    private static final int MAX_INSERTION_SORT = 16;

    /**
     * Returns the first {@code n} fields sorted by name, with the result and
     * the exception of adding them to a {@code TreeMap} ordered by
     * {@link String#CASE_INSENSITIVE_ORDER} in turn. If {@code fromMap} is
     * true, any repeated name is a duplicate, otherwise only a name whose
     * value so far is not null. A TreeMap costs much more, and descriptors
     * are made for every feature of an MBean that is introspected.
     */
    private static Fields sortFields(String[] names, Object[] values, int n,
                                     boolean fromMap) {
        if (n <= MAX_INSERTION_SORT) {
            String[] sortedNames = new String[n];
            Object[] sortedValues = new Object[n];
            int size = 0;
            for (int i = 0; i < n; i++) {
                String name = names[i];
                if (name == null || name.isEmpty())
                    throw new IllegalArgumentException("Empty or null field name");
                int index = Arrays.binarySearch(sortedNames, 0, size, name,
                                                String.CASE_INSENSITIVE_ORDER);
                if (index >= 0) {
                    if (fromMap || sortedValues[index] != null)
                        throw duplicateName(name, fromMap);
                    sortedValues[index] = values[i];
                } else {
                    index = -index - 1;
                    System.arraycopy(sortedNames, index, sortedNames, index + 1, size - index);
                    System.arraycopy(sortedValues, index, sortedValues, index + 1, size - index);
                    sortedNames[index] = name;
                    sortedValues[index] = values[i];
                    size++;
                }
            }
            return trimmed(sortedNames, sortedValues, size);
        }

        // Adding in turn would fail at the first bad name, or before it at
        // the first duplicate, which can only be among the names before it.
        int bad = 0;
        while (bad < n && names[bad] != null && !names[bad].isEmpty()) {
            bad++;
        }
        // A stable sort keeps the fields of a name in the order they are added.
        int[] order = new int[bad];
        for (int i = 0; i < bad; i++) {
            order[i] = i;
        }
        mergeSort(order.clone(), order, 0, bad, names);
        String[] sortedNames = new String[bad];
        Object[] sortedValues = new Object[bad];
        int size = 0;
        int duplicate = bad;
        for (int k = 0; k < bad; size++) {
            int first = order[k++];
            Object value = values[first];
            while (k < bad && compare(names, order[k], first) == 0) {
                int i = order[k++];
                if (fromMap || value != null) {
                    duplicate = Math.min(duplicate, i);
                } else {
                    value = values[i];
                }
            }
            sortedNames[size] = names[first];
            sortedValues[size] = value;
        }
        if (duplicate < bad)
            throw duplicateName(names[duplicate], fromMap);
        if (bad < n)
            throw new IllegalArgumentException("Empty or null field name");
        return trimmed(sortedNames, sortedValues, size);
    }

    // Sorts the positions in dest[low, high) by name, stably, using src,
    // which holds the same positions, as scratch space.
    private static void mergeSort(int[] src, int[] dest, int low, int high,
                                  String[] names) {
        if (high - low < 8) {
            for (int i = low + 1; i < high; i++) {
                int pos = dest[i];
                int j = i;
                for (; j > low && compare(names, dest[j - 1], pos) > 0; j--) {
                    dest[j] = dest[j - 1];
                }
                dest[j] = pos;
            }
            return;
        }
        int mid = (low + high) >>> 1;
        mergeSort(dest, src, low, mid, names);
        mergeSort(dest, src, mid, high, names);
        if (compare(names, src[mid - 1], src[mid]) <= 0) {
            System.arraycopy(src, low, dest, low, high - low);
            return;
        }
        for (int i = low, p = low, q = mid; i < high; i++) {
            if (q >= high || p < mid && compare(names, src[p], src[q]) <= 0) {
                dest[i] = src[p++];
            } else {
                dest[i] = src[q++];
            }
        }
    }

    private static int compare(String[] names, int i, int j) {
        return String.CASE_INSENSITIVE_ORDER.compare(names[i], names[j]);
    }

    private static IllegalArgumentException duplicateName(String name, boolean fromMap) {
        return new IllegalArgumentException(
                (fromMap ? "Duplicate name: " : "Duplicate field name: ") + name);
    }

    private static Fields trimmed(String[] names, Object[] values, int size) {
        return size == names.length
                ? new Fields(names, values)
                : new Fields(Arrays.copyOf(names, size), Arrays.copyOf(values, size));
    }

    /**
     * This method can replace a deserialized instance of this
     * class with another instance.  For example, it might replace
     * a deserialized empty ImmutableDescriptor with
     * {@link #EMPTY_DESCRIPTOR}.
     *
     * @return the replacement object, which may be {@code this}.
     *
     * @throws InvalidObjectException if the read object has invalid fields.
     */
    private Object readResolve() throws InvalidObjectException {

        boolean bad = false;
        if (names == null || values == null || names.length != values.length)
            bad = true;
        if (!bad) {
            hashCode = -1; // Force recalculation
            if (names.length == 0 && getClass() == ImmutableDescriptor.class)
                return EMPTY_DESCRIPTOR;
            final Comparator<String> compare = String.CASE_INSENSITIVE_ORDER;
            String lastName = ""; // also catches illegal null name
            for (int i = 0; i < names.length; i++) {
                if (names[i] == null ||
                        compare.compare(lastName, names[i]) >= 0) {
                    bad = true;
                    break;
                }
                lastName = names[i];
            }
        }
        if (bad)
            throw new InvalidObjectException("Bad names or values");

        return this;
    }

    private static String[][] splitFields(String[] fields) {
        if (fields == null)
            throw new IllegalArgumentException("Null fields parameter");
        String[] fieldNames = new String[fields.length];
        String[] fieldValues = new String[fields.length];
        for (int i = 0; i < fields.length; i++) {
            String field = fields[i];
            int eq = field.indexOf('=');
            if (eq < 0) {
                throw new IllegalArgumentException("Missing = character: " +
                                                   field);
            }
            fieldNames[i] = field.substring(0, eq);
            // the constructor will catch the case where the name is empty
            fieldValues[i] = field.substring(eq + 1);
        }
        return new String[][] {fieldNames, fieldValues};
    }

    /**
     * <p>Return an {@code ImmutableDescriptor} whose contents are the union of
     * the given descriptors.  Every field name that appears in any of
     * the descriptors will appear in the result with the
     * value that it has when the method is called.  Subsequent changes
     * to any of the descriptors do not affect the ImmutableDescriptor
     * returned here.</p>
     *
     * <p>In the simplest case, there is only one descriptor and the
     * returned {@code ImmutableDescriptor} is a copy of its fields at the
     * time this method is called:</p>
     *
     * <pre>
     * Descriptor d = something();
     * ImmutableDescriptor copy = ImmutableDescriptor.union(d);
     * </pre>
     *
     * @param descriptors the descriptors to be combined.  Any of the
     * descriptors can be null, in which case it is skipped.
     *
     * @return an {@code ImmutableDescriptor} that is the union of the given
     * descriptors.  The returned object may be identical to one of the
     * input descriptors if it is an ImmutableDescriptor that contains all of
     * the required fields.
     *
     * @throws IllegalArgumentException if two Descriptors contain the
     * same field name with different associated values.  Primitive array
     * values are considered the same if they are of the same type with
     * the same elements.  Object array values are considered the same if
     * {@link Arrays#deepEquals(Object[],Object[])} returns true.
     */
    public static ImmutableDescriptor union(Descriptor... descriptors) {
        // Optimize the case where exactly one Descriptor is non-Empty
        // and it is immutable - we can just return it.
        int index = findNonEmpty(descriptors, 0);
        if (index < 0)
            return EMPTY_DESCRIPTOR;
        if (descriptors[index] instanceof ImmutableDescriptor
                && findNonEmpty(descriptors, index + 1) < 0)
            return (ImmutableDescriptor) descriptors[index];

        Map<String, Object> map = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
        ImmutableDescriptor biggestImmutable = EMPTY_DESCRIPTOR;
        for (Descriptor d : descriptors) {
            if (d != null) {
                String[] names;
                if (d instanceof ImmutableDescriptor) {
                    ImmutableDescriptor id = (ImmutableDescriptor) d;
                    names = id.names;
                    if (id.getClass() == ImmutableDescriptor.class
                            && names.length > biggestImmutable.names.length)
                        biggestImmutable = id;
                } else
                    names = d.getFieldNames();
                for (String n : names) {
                    Object v = d.getFieldValue(n);
                    Object old = map.put(n, v);
                    if (old != null) {
                        boolean equal;
                        if (old.getClass().isArray()) {
                            equal = Arrays.deepEquals(new Object[] {old},
                                                      new Object[] {v});
                        } else
                            equal = old.equals(v);
                        if (!equal) {
                            final String msg =
                                "Inconsistent values for descriptor field " +
                                n + ": " + old + " :: " + v;
                            throw new IllegalArgumentException(msg);
                        }
                    }
                }
            }
        }
        if (biggestImmutable.names.length == map.size())
            return biggestImmutable;
        return new ImmutableDescriptor(map);
    }

    private static boolean isEmpty(Descriptor d) {
        if (d == null)
            return true;
        else if (d instanceof ImmutableDescriptor)
            return ((ImmutableDescriptor) d).names.length == 0;
        else
            return (d.getFieldNames().length == 0);
    }

    private static int findNonEmpty(Descriptor[] ds, int start) {
        for (int i = start; i < ds.length; i++) {
            if (!isEmpty(ds[i]))
                return i;
        }
        return -1;
    }

    private int fieldIndex(String name) {
        return Arrays.binarySearch(names, name, String.CASE_INSENSITIVE_ORDER);
    }

    public final Object getFieldValue(String fieldName) {
        checkIllegalFieldName(fieldName);
        int i = fieldIndex(fieldName);
        if (i < 0)
            return null;
        Object v = values[i];
        if (v == null || !v.getClass().isArray())
            return v;
        if (v instanceof Object[])
            return ((Object[]) v).clone();
        // clone the primitive array, could use an 8-way if/else here
        int len = Array.getLength(v);
        Object a = Array.newInstance(v.getClass().getComponentType(), len);
        System.arraycopy(v, 0, a, 0, len);
        return a;
    }

    public final String[] getFields() {
        String[] result = new String[names.length];
        for (int i = 0; i < result.length; i++) {
            Object value = values[i];
            if (value == null)
                value = "";
            else if (!(value instanceof String))
                value = "(" + value + ")";
            result[i] = names[i] + "=" + value;
        }
        return result;
    }

    public final Object[] getFieldValues(String... fieldNames) {
        if (fieldNames == null)
            return values.clone();
        Object[] result = new Object[fieldNames.length];
        for (int i = 0; i < fieldNames.length; i++) {
            String name = fieldNames[i];
            if (name != null && !name.isEmpty())
                result[i] = getFieldValue(name);
        }
        return result;
    }

    public final String[] getFieldNames() {
        return names.clone();
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Descriptor))
            return false;
        String[] onames;
        if (o instanceof ImmutableDescriptor) {
            onames = ((ImmutableDescriptor) o).names;
        } else {
            onames = ((Descriptor) o).getFieldNames();
            Arrays.sort(onames, String.CASE_INSENSITIVE_ORDER);
        }
        if (names.length != onames.length)
            return false;
        for (int i = 0; i < names.length; i++) {
            if (!names[i].equalsIgnoreCase(onames[i]))
                return false;
        }
        Object[] ovalues;
        if (o instanceof ImmutableDescriptor)
            ovalues = ((ImmutableDescriptor) o).values;
        else
            ovalues = ((Descriptor) o).getFieldValues(onames);
        return Arrays.deepEquals(values, ovalues);
    }

    @Override
    public int hashCode() {
        if (hashCode == -1) {
            hashCode = Util.hashCode(names, values);
        }
        return hashCode;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder("{");
        for (int i = 0; i < names.length; i++) {
            if (i > 0)
                sb.append(", ");
            sb.append(names[i]).append("=");
            Object v = values[i];
            if (v != null && v.getClass().isArray()) {
                String s = Arrays.deepToString(new Object[] {v});
                s = s.substring(1, s.length() - 1); // remove [...]
                v = s;
            }
            sb.append(String.valueOf(v));
        }
        return sb.append("}").toString();
    }

    /**
     * Returns true if all of the fields have legal values given their
     * names.  This method always returns true, but a subclass can
     * override it to return false when appropriate.
     *
     * @return true if the values are legal.
     *
     * @exception RuntimeOperationsException if the validity checking fails.
     * The method returns false if the descriptor is not valid, but throws
     * this exception if the attempt to determine validity fails.
     */
    public boolean isValid() {
        return true;
    }

    /**
     * <p>Returns a descriptor which is equal to this descriptor.
     * Changes to the returned descriptor will have no effect on this
     * descriptor, and vice versa.</p>
     *
     * <p>This method returns the object on which it is called.
     * A subclass can override it
     * to return another object provided the contract is respected.
     *
     * @exception RuntimeOperationsException for illegal value for field Names
     * or field Values.
     * If the descriptor construction fails for any reason, this exception will
     * be thrown.
     */
    @Override
    public Descriptor clone() {
        return this;
    }

    /**
     * This operation is unsupported since this class is immutable.  If
     * this call would change a mutable descriptor with the same contents,
     * then a {@link RuntimeOperationsException} wrapping an
     * {@link UnsupportedOperationException} is thrown.  Otherwise,
     * the behavior is the same as it would be for a mutable descriptor:
     * either an exception is thrown because of illegal parameters, or
     * there is no effect.
     */
    public final void setFields(String[] fieldNames, Object[] fieldValues)
        throws RuntimeOperationsException {

        if (fieldNames == null || fieldValues == null)
            illegal("Null argument");
        if (fieldNames.length != fieldValues.length)
            illegal("Different array sizes");
        for (int i = 0; i < fieldNames.length; i++)
            checkIllegalFieldName(fieldNames[i]);
        hashCode = -1; // Force recalculation
        for (int i = 0; i < fieldNames.length; i++)
            setField(fieldNames[i], fieldValues[i]);
    }

    /**
     * This operation is unsupported since this class is immutable.  If
     * this call would change a mutable descriptor with the same contents,
     * then a {@link RuntimeOperationsException} wrapping an
     * {@link UnsupportedOperationException} is thrown.  Otherwise,
     * the behavior is the same as it would be for a mutable descriptor:
     * either an exception is thrown because of illegal parameters, or
     * there is no effect.
     */
    public final void setField(String fieldName, Object fieldValue)
        throws RuntimeOperationsException {

        checkIllegalFieldName(fieldName);
        int i = fieldIndex(fieldName);
        if (i < 0)
            unsupported();
        hashCode = -1; // Force recalculation
        Object value = values[i];
        if ((value == null) ?
                (fieldValue != null) :
                !value.equals(fieldValue))
            unsupported();
    }

    /**
     * Removes a field from the descriptor.
     *
     * @param fieldName String name of the field to be removed.
     * If the field name is illegal or the field is not found,
     * no exception is thrown.
     *
     * @exception RuntimeOperationsException if a field of the given name
     * exists and the descriptor is immutable.  The wrapped exception will
     * be an {@link UnsupportedOperationException}.
     */
    public final void removeField(String fieldName) {
        hashCode = -1; // Force recalculation
        if (fieldName != null && fieldIndex(fieldName) >= 0)
            unsupported();
    }

    static Descriptor nonNullDescriptor(Descriptor d) {
        if (d == null)
            return EMPTY_DESCRIPTOR;
        else
            return d;
    }

    private static void checkIllegalFieldName(String name) {
        if (name == null || name.isEmpty())
            illegal("Null or empty field name");
    }

    private static void unsupported() {
        UnsupportedOperationException uoe =
            new UnsupportedOperationException("Descriptor is read-only");
        throw new RuntimeOperationsException(uoe);
    }

    private static void illegal(String message) {
        IllegalArgumentException iae = new IllegalArgumentException(message);
        throw new RuntimeOperationsException(iae);
    }
}
