/*
 * Copyright (c) 2017, 2026, Oracle and/or its affiliates. All rights reserved.
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

package java.lang.runtime;

import java.lang.classfile.ClassBuilder;
import java.lang.classfile.ClassFile;
import java.lang.classfile.ClassHierarchyResolver;
import java.lang.classfile.CodeBuilder;
import java.lang.classfile.Label;
import java.lang.classfile.Opcode;
import java.lang.constant.ClassDesc;
import java.lang.constant.DirectMethodHandleDesc;
import java.lang.constant.DynamicCallSiteDesc;
import java.lang.constant.MethodHandleDesc;
import java.lang.constant.MethodTypeDesc;
import java.lang.invoke.ConstantCallSite;
import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandleInfo;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.invoke.StringConcatFactory;
import java.lang.invoke.TypeDescriptor;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import java.util.function.Consumer;

import jdk.internal.constant.ClassOrInterfaceDescImpl;
import jdk.internal.constant.ConstantUtils;
import jdk.internal.constant.MethodTypeDescImpl;
import sun.invoke.util.Wrapper;

import static java.lang.classfile.ClassFile.ACC_STATIC;
import static java.lang.constant.ConstantDescs.*;
import static java.util.Objects.requireNonNull;

/**
 * Bootstrap methods for state-driven implementations of core methods,
 * including {@link Object#equals(Object)}, {@link Object#hashCode()}, and
 * {@link Object#toString()}.  These methods may be used, for example, by
 * Java compiler implementations to implement the bodies of {@link Object}
 * methods for record classes.
 *
 * @since 16
 */
public final class ObjectMethods {

    private ObjectMethods() { }

    private static final int MAX_STRING_CONCAT_SLOTS = 20;

    private static final MethodType MT_OBJECT_BOOLEAN = MethodType.methodType(boolean.class, Object.class);
    private static final MethodType MT_INT = MethodType.methodType(int.class);
    private static final MethodTypeDesc MTD_OBJECT_BOOLEAN = MethodTypeDesc.of(CD_boolean, CD_Object);
    private static final MethodTypeDesc MTD_INT = MethodTypeDesc.of(CD_int);

    /**
     * The method handles used by the combinator based implementations.
     * They are created when the first record needs one of those.
     */
    private static final class Handles {
        static final MethodHandle FALSE = MethodHandles.zero(boolean.class);
        static final MethodHandle TRUE = MethodHandles.constant(boolean.class, true);
        static final MethodHandle ZERO = MethodHandles.zero(int.class);
        static final MethodHandle CLASS_IS_INSTANCE;
        static final MethodHandle IS_NULL;
        static final MethodHandle IS_ARG0_NULL;
        static final MethodHandle IS_ARG1_NULL;
        static final MethodHandle OBJECT_EQ;
        static final MethodHandle HASH_COMBINER;

        static final HashMap<Class<?>, MethodHandle> primitiveEquals = new HashMap<>();
        static final HashMap<Class<?>, MethodHandle> primitiveHashers = new HashMap<>();

        static {
            try {
                Class<ObjectMethods> OBJECT_METHODS_CLASS = ObjectMethods.class;
                MethodHandles.Lookup publicLookup = MethodHandles.publicLookup();
                MethodHandles.Lookup lookup = MethodHandles.lookup();

                CLASS_IS_INSTANCE = publicLookup.findVirtual(Class.class, "isInstance",
                                                             MethodType.methodType(boolean.class, Object.class));

                var objectsIsNull = publicLookup.findStatic(Objects.class, "isNull",
                                                            MethodType.methodType(boolean.class, Object.class));
                IS_NULL = objectsIsNull;
                IS_ARG0_NULL = MethodHandles.dropArguments(objectsIsNull, 1, Object.class);
                IS_ARG1_NULL = MethodHandles.dropArguments(objectsIsNull, 0, Object.class);

                OBJECT_EQ = lookup.findStatic(OBJECT_METHODS_CLASS, "eq",
                                              MethodType.methodType(boolean.class, Object.class, Object.class));
                HASH_COMBINER = lookup.findStatic(OBJECT_METHODS_CLASS, "hashCombiner",
                                                  MethodType.methodType(int.class, int.class, int.class));

                primitiveEquals.put(byte.class, lookup.findStatic(OBJECT_METHODS_CLASS, "eq",
                                                                  MethodType.methodType(boolean.class, byte.class, byte.class)));
                primitiveEquals.put(short.class, lookup.findStatic(OBJECT_METHODS_CLASS, "eq",
                                                                   MethodType.methodType(boolean.class, short.class, short.class)));
                primitiveEquals.put(char.class, lookup.findStatic(OBJECT_METHODS_CLASS, "eq",
                                                                  MethodType.methodType(boolean.class, char.class, char.class)));
                primitiveEquals.put(int.class, lookup.findStatic(OBJECT_METHODS_CLASS, "eq",
                                                                 MethodType.methodType(boolean.class, int.class, int.class)));
                primitiveEquals.put(long.class, lookup.findStatic(OBJECT_METHODS_CLASS, "eq",
                                                                  MethodType.methodType(boolean.class, long.class, long.class)));
                primitiveEquals.put(float.class, lookup.findStatic(OBJECT_METHODS_CLASS, "eq",
                                                                   MethodType.methodType(boolean.class, float.class, float.class)));
                primitiveEquals.put(double.class, lookup.findStatic(OBJECT_METHODS_CLASS, "eq",
                                                                    MethodType.methodType(boolean.class, double.class, double.class)));
                primitiveEquals.put(boolean.class, lookup.findStatic(OBJECT_METHODS_CLASS, "eq",
                                                                     MethodType.methodType(boolean.class, boolean.class, boolean.class)));

                primitiveHashers.put(byte.class, lookup.findStatic(Byte.class, "hashCode",
                                                                   MethodType.methodType(int.class, byte.class)));
                primitiveHashers.put(short.class, lookup.findStatic(Short.class, "hashCode",
                                                                    MethodType.methodType(int.class, short.class)));
                primitiveHashers.put(char.class, lookup.findStatic(Character.class, "hashCode",
                                                                   MethodType.methodType(int.class, char.class)));
                primitiveHashers.put(int.class, lookup.findStatic(Integer.class, "hashCode",
                                                                  MethodType.methodType(int.class, int.class)));
                primitiveHashers.put(long.class, lookup.findStatic(Long.class, "hashCode",
                                                                   MethodType.methodType(int.class, long.class)));
                primitiveHashers.put(float.class, lookup.findStatic(Float.class, "hashCode",
                                                                    MethodType.methodType(int.class, float.class)));
                primitiveHashers.put(double.class, lookup.findStatic(Double.class, "hashCode",
                                                                     MethodType.methodType(int.class, double.class)));
                primitiveHashers.put(boolean.class, lookup.findStatic(Boolean.class, "hashCode",
                                                                      MethodType.methodType(int.class, boolean.class)));
            }
            catch (ReflectiveOperationException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private static int hashCombiner(int x, int y) {
        return x*31 + y;
    }

    private static boolean eq(Object a, Object b) { return a == b; }
    private static boolean eq(byte a, byte b) { return a == b; }
    private static boolean eq(short a, short b) { return a == b; }
    private static boolean eq(char a, char b) { return a == b; }
    private static boolean eq(int a, int b) { return a == b; }
    private static boolean eq(long a, long b) { return a == b; }
    private static boolean eq(float a, float b) { return Float.compare(a, b) == 0; }
    private static boolean eq(double a, double b) { return Double.compare(a, b) == 0; }
    private static boolean eq(boolean a, boolean b) { return a == b; }

    /** Get the method handle for combining two values of a given type */
    private static MethodHandle equalator(MethodHandles.Lookup lookup, Class<?> clazz) throws Throwable {
        if (clazz.isPrimitive())
            return Handles.primitiveEquals.get(clazz);
        MethodType mt = MethodType.methodType(boolean.class, clazz, clazz);
        return MethodHandles.guardWithTest(Handles.IS_ARG0_NULL.asType(mt),
                                           Handles.IS_ARG1_NULL.asType(mt),
                                           lookup.findVirtual(clazz, "equals", MT_OBJECT_BOOLEAN).asType(mt));
    }

    /** Get the hasher for a value of a given type */
    private static MethodHandle hasher(MethodHandles.Lookup lookup, Class<?> clazz) throws Throwable {
        if (clazz.isPrimitive())
            return Handles.primitiveHashers.get(clazz);
        MethodType mt = MethodType.methodType(int.class, clazz);
        return MethodHandles.guardWithTest(Handles.IS_NULL.asType(MethodType.methodType(boolean.class, clazz)),
                                           MethodHandles.dropArguments(MethodHandles.zero(int.class), 0, clazz),
                                           lookup.findVirtual(clazz, "hashCode", MT_INT).asType(mt));
    }

    // If this type must be a monomorphic receiver, that is, one that has no
    // subtypes in the JVM.  For example, Object-typed fields may have a more
    // specific one type at runtime and thus need optimizations.
    private static boolean isMonomorphic(Class<?> type) {
        // Includes primitives and final classes, but not arrays.
        // All array classes are reported to be final, but Object[] can have subtypes like String[]
        return Modifier.isFinal(type.getModifiers()) && !type.isArray();
    }

    private static String specializerClassName(Class<?> targetClass, String kind) {
        String name = targetClass.getName();
        if (targetClass.isHidden()) {
            // use the original class name
            name = name.replace('/', '_');
        }
        return name + "$$" + kind + "Specializer";
    }

    /**
     * Generates a method handle for the {@code equals} method for a given data class
     * @param receiverClass   the data class
     * @param getters         the list of getters
     * @return the method handle
     */
    private static MethodHandle makeEquals(MethodHandles.Lookup lookup, Class<?> receiverClass,
                                           List<MethodHandle> getters) throws Throwable {
        MethodType rr = MethodType.methodType(boolean.class, receiverClass, receiverClass);
        MethodType ro = MethodType.methodType(boolean.class, receiverClass, Object.class);
        MethodHandle instanceFalse = MethodHandles.dropArguments(Handles.FALSE, 0, receiverClass, Object.class); // (RO)Z
        MethodHandle instanceTrue = MethodHandles.dropArguments(Handles.TRUE, 0, receiverClass, Object.class); // (RO)Z
        MethodHandle isSameObject = Handles.OBJECT_EQ.asType(ro); // (RO)Z
        MethodHandle isInstance = MethodHandles.dropArguments(Handles.CLASS_IS_INSTANCE.bindTo(receiverClass), 0, receiverClass); // (RO)Z
        MethodHandle accumulator = MethodHandles.dropArguments(Handles.TRUE, 0, receiverClass, receiverClass); // (RR)Z

        int size = getters.size();
        MethodHandle[] equalators = new MethodHandle[size];
        boolean hasPolymorphism = false;
        for (int i = 0; i < size; i++) {
            var getter = getters.get(i);
            var type = getter.type().returnType();
            if (isMonomorphic(type)) {
                equalators[i] = equalator(lookup, type);
            } else {
                hasPolymorphism = true;
            }
        }

        // Currently, hotspot does not support polymorphic inlining.
        // As a result, if we have a MethodHandle to Object.equals,
        // it does not enjoy separate profiles like individual invokevirtuals,
        // and we must spin bytecode to accomplish separate profiling.
        if (hasPolymorphism) {
            String[] names = new String[size];

            var classFileContext = ClassFile.of(ClassFile.ClassHierarchyResolverOption.of(ClassHierarchyResolver.ofClassLoading(lookup)));
            var bytes = classFileContext.build(ClassDesc.of(specializerClassName(lookup.lookupClass(), "Equalator")), clb -> {
                for (int i = 0; i < size; i++) {
                    if (equalators[i] == null) {
                        var name = "equalator".concat(Integer.toString(i));
                        names[i] = name;
                        var type = getters.get(i).type().returnType();
                        boolean isInterface = type.isInterface();
                        var typeDesc = type.describeConstable().orElseThrow();
                        clb.withMethodBody(name, MethodTypeDesc.of(CD_boolean, typeDesc, typeDesc), ACC_STATIC, cob -> {
                            var nonNullPath = cob.newLabel();
                            var fail = cob.newLabel();
                            cob.aload(0)
                               .ifnonnull(nonNullPath)
                               .aload(1)
                               .ifnonnull(fail)
                               .iconst_1() // arg0 null, arg1 null
                               .ireturn()
                               .labelBinding(fail)
                               .iconst_0() // arg0 null, arg1 non-null
                               .ireturn()
                               .labelBinding(nonNullPath)
                               .aload(0) // arg0.equals(arg1) - bytecode subject to customized profiling
                               .aload(1)
                               .invoke(isInterface ? Opcode.INVOKEINTERFACE : Opcode.INVOKEVIRTUAL, typeDesc, "equals", MTD_OBJECT_BOOLEAN, isInterface)
                               .ireturn();
                        });
                    }
                }
            });

            var specializerLookup = lookup.defineHiddenClass(bytes, true, MethodHandles.Lookup.ClassOption.STRONG);

            for (int i = 0; i < size; i++) {
                if (equalators[i] == null) {
                    var type = getters.get(i).type().returnType();
                    equalators[i] = specializerLookup.findStatic(specializerLookup.lookupClass(), names[i], MethodType.methodType(boolean.class, type, type));
                }
            }
        }

        for (int i = 0; i < size; i++) {
            var getter = getters.get(i);
            MethodHandle equalator = equalators[i]; // (TT)Z
            MethodHandle thisFieldEqual = MethodHandles.filterArguments(equalator, 0, getter, getter); // (RR)Z
            accumulator = MethodHandles.guardWithTest(thisFieldEqual, accumulator, instanceFalse.asType(rr));
        }

        return MethodHandles.guardWithTest(isSameObject,
                                           instanceTrue,
                                           MethodHandles.guardWithTest(isInstance, accumulator.asType(ro), instanceFalse));
    }

    /**
     * Generates a method handle for the {@code hashCode} method for a given data class
     * @param receiverClass   the data class
     * @param getters         the list of getters
     * @return the method handle
     */
    private static MethodHandle makeHashCode(MethodHandles.Lookup lookup, Class<?> receiverClass,
                                             List<MethodHandle> getters) throws Throwable {
        MethodHandle accumulator = MethodHandles.dropArguments(Handles.ZERO, 0, receiverClass); // (R)I

        int size = getters.size();
        MethodHandle[] hashers = new MethodHandle[size];
        boolean hasPolymorphism = false;
        for (int i = 0; i < size; i++) {
            var getter = getters.get(i);
            var type = getter.type().returnType();
            if (isMonomorphic(type)) {
                hashers[i] = hasher(lookup, type);
            } else {
                hasPolymorphism = true;
            }
        }

        // Currently, hotspot does not support polymorphic inlining.
        // As a result, if we have a MethodHandle to Object.hashCode,
        // it does not enjoy separate profiles like individual invokevirtuals,
        // and we must spin bytecode to accomplish separate profiling.
        if (hasPolymorphism) {
            String[] names = new String[size];

            var classFileContext = ClassFile.of(ClassFile.ClassHierarchyResolverOption.of(ClassHierarchyResolver.ofClassLoading(lookup)));
            var bytes = classFileContext.build(ClassDesc.of(specializerClassName(lookup.lookupClass(), "Hasher")), clb -> {
                for (int i = 0; i < size; i++) {
                    if (hashers[i] == null) {
                        var name = "hasher".concat(Integer.toString(i));
                        names[i] = name;
                        var type = getters.get(i).type().returnType();
                        boolean isInterface = type.isInterface();
                        var typeDesc = type.describeConstable().orElseThrow();
                        clb.withMethodBody(name, MethodTypeDesc.of(CD_int, typeDesc), ACC_STATIC, cob -> {
                            var nonNullPath = cob.newLabel();
                            cob.aload(0)
                               .ifnonnull(nonNullPath)
                               .iconst_0() // null hash is 0
                               .ireturn()
                               .labelBinding(nonNullPath)
                               .aload(0) // arg0.hashCode() - bytecode subject to customized profiling
                               .invoke(isInterface ? Opcode.INVOKEINTERFACE : Opcode.INVOKEVIRTUAL, typeDesc, "hashCode", MTD_INT, isInterface)
                               .ireturn();
                        });
                    }
                }
            });

            var specializerLookup = lookup.defineHiddenClass(bytes, true, MethodHandles.Lookup.ClassOption.STRONG);

            for (int i = 0; i < size; i++) {
                if (hashers[i] == null) {
                    var type = getters.get(i).type().returnType();
                    hashers[i] = specializerLookup.findStatic(specializerLookup.lookupClass(), names[i], MethodType.methodType(int.class, type));
                }
            }
        }

        // @@@ Use loop combinator instead?
        for (int i = 0; i < size; i++) {
            var getter = getters.get(i);
            MethodHandle hasher = hashers[i]; // (T)I
            MethodHandle hashThisField = MethodHandles.filterArguments(hasher, 0, getter);    // (R)I
            MethodHandle combineHashes = MethodHandles.filterArguments(Handles.HASH_COMBINER, 0, accumulator, hashThisField); // (RR)I
            accumulator = MethodHandles.permuteArguments(combineHashes, accumulator.type(), 0, 0); // adapt (R)I to (RR)I
        }

        return accumulator;
    }

    /**
     * Generates a method handle for the {@code toString} method for a given data class
     * @param receiverClass   the data class
     * @param getters         the list of getters
     * @param names           the names
     * @return the method handle
     */
    private static MethodHandle makeToString(MethodHandles.Lookup lookup,
                                             Class<?> receiverClass,
                                             MethodHandle[] getters,
                                             List<String> names) {
        assert getters.length == names.size();
        if (getters.length == 0) {
            // special case
            MethodHandle emptyRecordCase = MethodHandles.constant(String.class, receiverClass.getSimpleName() + "[]");
            emptyRecordCase = MethodHandles.dropArguments(emptyRecordCase, 0, receiverClass); // (R)S
            return emptyRecordCase;
        }

        boolean firstTime = true;
        MethodHandle[] mhs;
        List<List<MethodHandle>> splits;
        MethodHandle[] toSplit = getters;
        int namesIndex = 0;
        do {
            /* StringConcatFactory::makeConcatWithConstants can only deal with 200 slots, longs and double occupy two
             * the rest 1 slot, we need to chop the current `getters` into chunks, it could be that for records with
             * a lot of components that we need to do a couple of iterations. The main difference between the first
             * iteration and the rest would be on the recipe
             */
            splits = split(toSplit);
            mhs = new MethodHandle[splits.size()];
            for (int splitIndex = 0; splitIndex < splits.size(); splitIndex++) {
                String recipe = "";
                if (firstTime && splitIndex == 0) {
                    recipe = receiverClass.getSimpleName() + "[";
                }
                for (int i = 0; i < splits.get(splitIndex).size(); i++) {
                    recipe += firstTime ? names.get(namesIndex) + "=" + "\1" : "\1";
                    if (firstTime && namesIndex != names.size() - 1) {
                        recipe += ", ";
                    }
                    namesIndex++;
                }
                if (firstTime && splitIndex == splits.size() - 1) {
                    recipe += "]";
                }
                Class<?>[] concatTypeArgs = new Class<?>[splits.get(splitIndex).size()];
                // special case: no need to create another getters if there is only one split
                MethodHandle[] currentSplitGetters = new MethodHandle[splits.get(splitIndex).size()];
                for (int j = 0; j < splits.get(splitIndex).size(); j++) {
                    concatTypeArgs[j] = splits.get(splitIndex).get(j).type().returnType();
                    currentSplitGetters[j] = splits.get(splitIndex).get(j);
                }
                MethodType concatMT = MethodType.methodType(String.class, concatTypeArgs);
                try {
                    mhs[splitIndex] = StringConcatFactory.makeConcatWithConstants(
                            lookup, "",
                            concatMT,
                            recipe,
                            new Object[0]
                    ).getTarget();
                    mhs[splitIndex] = MethodHandles.filterArguments(mhs[splitIndex], 0, currentSplitGetters);
                    // this will spread the receiver class across all the getters
                    mhs[splitIndex] = MethodHandles.permuteArguments(
                            mhs[splitIndex],
                            MethodType.methodType(String.class, receiverClass),
                            new int[splits.get(splitIndex).size()]
                    );
                } catch (Throwable t) {
                    throw new RuntimeException(t);
                }
            }
            toSplit = mhs;
            firstTime = false;
        } while (splits.size() > 1);
        return mhs[0];
    }

    /**
     * Chops the getters into smaller chunks according to the maximum number of slots
     * StringConcatFactory::makeConcatWithConstants can chew
     * @param getters the current getters
     * @return chunks that won't surpass the maximum number of slots StringConcatFactory::makeConcatWithConstants can chew
     */
    private static List<List<MethodHandle>> split(MethodHandle[] getters) {
        List<List<MethodHandle>> splits = new ArrayList<>();

        int slots = 0;

        // Need to peel, so that neither call has more than acceptable number
        // of slots for the arguments.
        List<MethodHandle> cArgs = new ArrayList<>();
        for (MethodHandle methodHandle : getters) {
            Class<?> returnType = methodHandle.type().returnType();
            int needSlots = (returnType == long.class || returnType == double.class) ? 2 : 1;
            if (slots + needSlots > MAX_STRING_CONCAT_SLOTS) {
                splits.add(cArgs);
                cArgs = new ArrayList<>();
                slots = 0;
            }
            cArgs.add(methodHandle);
            slots += needSlots;
        }

        // Flush the tail slice
        if (!cArgs.isEmpty()) {
            splits.add(cArgs);
        }

        return splits;
    }

    /**
     * Returns the names of the fields that the getters read, or null if the methods
     * cannot be generated as bytecode that reads the fields itself.  That requires
     * every getter to read a field declared by the record class, and a class defined
     * as a nestmate of the lookup class to be able to access the record class.
     */
    private static String[] fieldNames(MethodHandles.Lookup lookup, Class<?> recordClass,
                                       List<MethodHandle> getters) {
        if (getters.isEmpty() || recordClass.isHidden()
                || recordClass.getNestHost() != lookup.lookupClass().getNestHost()) {
            return null;
        }
        String[] names = new String[getters.size()];
        for (int i = 0; i < names.length; i++) {
            Class<?> type = getters.get(i).type().returnType();
            while (type.isArray()) {
                type = type.componentType();
            }
            if (type.isHidden()) {
                return null;
            }
            MethodHandleInfo info;
            try {
                info = lookup.revealDirect(getters.get(i));
            } catch (IllegalArgumentException e) {
                return null;  // not a direct method handle, or not one that this lookup could create
            }
            if (info.getReferenceKind() != MethodHandleInfo.REF_getField
                    || info.getDeclaringClass() != recordClass) {
                return null;
            }
            names[i] = info.getName();
        }
        return names;
    }

    /** The number of slots of the arguments of a concatenation of the values of the getters. */
    private static int slots(List<MethodHandle> getters) {
        int slots = 0;
        for (MethodHandle getter : getters) {
            Class<?> type = getter.type().returnType();
            slots += (type == long.class || type == double.class) ? 2 : 1;
        }
        return slots;
    }

    /**
     * A hidden class generated by {@link #makeStraightLine}, with the getters and
     * names that it was generated for.
     */
    private static final class GeneratedMethods {
        final MethodHandles.Lookup lookup;
        final List<MethodHandle> getters;
        final List<String> names; // null if the class has no toString method

        GeneratedMethods(MethodHandles.Lookup lookup, List<MethodHandle> getters, List<String> names) {
            this.lookup = lookup;
            this.getters = getters;
            this.names = names;
        }
    }

    /**
     * The hidden class last generated for each record class.  The bootstraps of
     * equals, hashCode and toString usually get the same getters, and the same
     * names, so they share one class.  Racing bootstraps may each generate one.
     */
    private static final ClassValue<GeneratedMethods[]> GENERATED_METHODS = new ClassValue<>() {
        @Override
        protected GeneratedMethods[] computeValue(Class<?> type) {
            return new GeneratedMethods[1];
        }
    };

    /**
     * Returns a method handle for {@code equals}, {@code hashCode} or {@code toString}
     * that is a static method of a hidden class that reads the fields of the record
     * class.  Unlike a tree of method handle combinators, this does not spin
     * LambdaForms for each shape of record.  The hidden class has all three methods,
     * except toString if the names don't match the getters or need more slots than
     * a concatenation takes, and is shared by the bootstraps of the record class.
     */
    private static MethodHandle makeStraightLine(MethodHandles.Lookup lookup, Class<?> receiverClass,
                                                 String methodName, String[] fields, List<String> names,
                                                 List<MethodHandle> getters) throws Throwable {
        GeneratedMethods[] cache = GENERATED_METHODS.get(receiverClass);
        GeneratedMethods generated = cache[0];
        if (generated == null || !generated.getters.equals(getters)
                || (methodName.equals("toString") && !names.equals(generated.names))) {
            if (names.size() != getters.size() || slots(getters) > MAX_STRING_CONCAT_SLOTS) {
                names = null;
            }
            cache[0] = generated = generateMethods(lookup, receiverClass, fields, names, getters);
        }
        MethodType type = switch (methodName) {
            case "equals"   -> MethodType.methodType(boolean.class, receiverClass, Object.class);
            case "hashCode" -> MethodType.methodType(int.class, receiverClass);
            default         -> MethodType.methodType(String.class, receiverClass);
        };
        return generated.lookup.findStatic(generated.lookup.lookupClass(), methodName, type);
    }

    private static GeneratedMethods generateMethods(MethodHandles.Lookup lookup, Class<?> receiverClass,
                                                    String[] fields, List<String> names,
                                                    List<MethodHandle> getters) throws Throwable {
        Class<?>[] types = new Class<?>[fields.length];
        for (int i = 0; i < types.length; i++) {
            types[i] = getters.get(i).type().returnType();
        }
        ClassDesc receiverDesc = ConstantUtils.classDesc(receiverClass);
        var classFileContext = ClassFile.of(ClassFile.ClassHierarchyResolverOption.of(ClassHierarchyResolver.ofClassLoading(lookup)));
        var bytes = classFileContext.build(ClassDesc.of(specializerClassName(lookup.lookupClass(), "Methods")),
                new Consumer<ClassBuilder>() {
                    @Override
                    public void accept(ClassBuilder clb) {
                        clb.withMethodBody("equals", MethodTypeDescImpl.ofValidated(CD_boolean, receiverDesc, CD_Object),
                                           ACC_STATIC, new Body("equals", receiverClass, fields, null, types));
                        clb.withMethodBody("hashCode", MethodTypeDescImpl.ofValidated(CD_int, receiverDesc),
                                           ACC_STATIC, new Body("hashCode", receiverClass, fields, null, types));
                        if (names != null) {
                            clb.withMethodBody("toString", MethodTypeDescImpl.ofValidated(CD_String, receiverDesc),
                                               ACC_STATIC, new Body("toString", receiverClass, fields, names, types));
                        }
                    }
                });
        var specializerLookup = lookup.defineHiddenClass(bytes, true,
                MethodHandles.Lookup.ClassOption.NESTMATE, MethodHandles.Lookup.ClassOption.STRONG);
        return new GeneratedMethods(specializerLookup, getters, names);
    }

    /**
     * The code of a method generated by {@link #makeStraightLine}.
     */
    private static final class Body implements Consumer<CodeBuilder> {
        private final String methodName;
        private final Class<?> receiverClass;
        private final ClassDesc owner;
        private final String[] fields;
        private final List<String> names;
        private final Class<?>[] types;
        private final ClassDesc[] descs;

        Body(String methodName, Class<?> receiverClass, String[] fields, List<String> names, Class<?>[] types) {
            this.methodName = methodName;
            this.receiverClass = receiverClass;
            this.owner = ConstantUtils.classDesc(receiverClass);
            this.fields = fields;
            this.names = names;
            this.types = types;
            this.descs = new ClassDesc[types.length];
            for (int i = 0; i < types.length; i++) {
                descs[i] = ConstantUtils.classDesc(types[i]);
            }
        }

        @Override
        public void accept(CodeBuilder cob) {
            switch (methodName) {
                case "equals"   -> equals(cob);
                case "hashCode" -> hashCode(cob);
                default         -> toString(cob);
            }
        }

        /** Pushes the value of the field of the record in the given local variable. */
        private void getField(CodeBuilder cob, int slot, int i) {
            cob.aload(slot)
               .getfield(owner, fields[i], descs[i]);
        }

        private static Opcode invokeOpcode(Class<?> type) {
            return type.isInterface() ? Opcode.INVOKEINTERFACE : Opcode.INVOKEVIRTUAL;
        }

        // The components are compared from the last to the first, like the combinator based version does
        private void equals(CodeBuilder cob) {
            Label notSame = cob.newLabel();
            Label isInstance = cob.newLabel();
            Label notEqual = cob.newLabel();
            cob.aload(0)
               .aload(1)
               .if_acmpne(notSame)
               .iconst_1()
               .ireturn()
               .labelBinding(notSame)
               .aload(1)
               .instanceOf(owner)
               .ifne(isInstance)
               .iconst_0()
               .ireturn()
               .labelBinding(isInstance)
               .aload(1)
               .checkcast(owner)
               .astore(2);
            for (int i = fields.length - 1; i >= 0; i--) {
                Class<?> type = types[i];
                getField(cob, 0, i);
                if (type == long.class) {
                    getField(cob, 2, i);
                    cob.lcmp()
                       .ifne(notEqual);
                } else if (type == float.class || type == double.class) {
                    // Float.compare and Double.compare: NaN equals NaN, but 0.0 differs from -0.0
                    getField(cob, 2, i);
                    cob.invokestatic(ConstantUtils.classDesc(Wrapper.forPrimitiveType(type).wrapperType()), "compare",
                                     MethodTypeDescImpl.ofValidated(CD_int, descs[i], descs[i]))
                       .ifne(notEqual);
                } else if (type.isPrimitive()) {
                    getField(cob, 2, i);
                    cob.if_icmpne(notEqual);
                } else {
                    // null is only equal to null, otherwise a.equals(b).  The call is made in
                    // the generated code, not in a shared helper, to have its own type profile.
                    Label aIsNull = cob.newLabel();
                    Label next = cob.newLabel();
                    cob.dup()
                       .ifnull(aIsNull);
                    getField(cob, 2, i);
                    cob.invoke(invokeOpcode(type), descs[i], "equals", MTD_OBJECT_BOOLEAN, type.isInterface())
                       .ifeq(notEqual)
                       .goto_(next)
                       .labelBinding(aIsNull)
                       .pop();
                    getField(cob, 2, i);
                    cob.ifnonnull(notEqual)
                       .labelBinding(next);
                }
            }
            cob.iconst_1()
               .ireturn()
               .labelBinding(notEqual)
               .iconst_0()
               .ireturn();
        }

        // hash = 31 * hash + hash(component), starting with 0
        private void hashCode(CodeBuilder cob) {
            for (int i = 0; i < fields.length; i++) {
                Class<?> type = types[i];
                if (i > 0) {
                    cob.bipush(31)
                       .imul();
                }
                getField(cob, 0, i);
                if (type.isPrimitive()) {
                    // for byte, short, char and int the hash code is the value
                    if (type != int.class && type != byte.class && type != short.class && type != char.class) {
                        cob.invokestatic(ConstantUtils.classDesc(Wrapper.forPrimitiveType(type).wrapperType()), "hashCode",
                                         MethodTypeDescImpl.ofValidated(CD_int, descs[i]));
                    }
                } else {
                    // null has hash code 0.  The call is made in the generated code, not in
                    // a shared helper, to have its own type profile.
                    Label isNull = cob.newLabel();
                    Label done = cob.newLabel();
                    cob.dup()
                       .ifnull(isNull)
                       .invoke(invokeOpcode(type), descs[i], "hashCode", MTD_INT, type.isInterface())
                       .goto_(done)
                       .labelBinding(isNull)
                       .pop()
                       .iconst_0()
                       .labelBinding(done);
                }
                if (i > 0) {
                    cob.iadd();
                }
            }
            cob.ireturn();
        }

        // The same concatenation, with the same recipe, as in makeToString
        private void toString(CodeBuilder cob) {
            StringBuilder recipe = new StringBuilder(receiverClass.getSimpleName()).append('[');
            for (int i = 0; i < fields.length; i++) {
                getField(cob, 0, i);
                recipe.append(names.get(i)).append("=\1");
                if (i < fields.length - 1) {
                    recipe.append(", ");
                }
            }
            recipe.append(']');
            DirectMethodHandleDesc bootstrap = MethodHandleDesc.ofMethod(DirectMethodHandleDesc.Kind.STATIC,
                    ClassOrInterfaceDescImpl.ofValidated("Ljava/lang/invoke/StringConcatFactory;"), "makeConcatWithConstants",
                    MethodTypeDescImpl.ofValidated(CD_CallSite, CD_MethodHandles_Lookup, CD_String, CD_MethodType, CD_String, CD_Object.arrayType()));
            cob.invokedynamic(DynamicCallSiteDesc.of(bootstrap, "toString", MethodTypeDescImpl.ofValidated(CD_String, descs), recipe.toString()))
               .areturn();
        }
    }

    private static List<String> nameList(String names) {
        return names.isEmpty() ? List.of() : List.of(names.split(";"));
    }

    /**
     * Bootstrap method to generate the {@link Object#equals(Object)},
     * {@link Object#hashCode()}, and {@link Object#toString()} methods, based
     * on a description of the component names and accessor methods, for either
     * {@code invokedynamic} call sites or dynamic constant pool entries.
     *
     * For more detail on the semantics of the generated methods see the specification
     * of {@link java.lang.Record#equals(Object)}, {@link java.lang.Record#hashCode()} and
     * {@link java.lang.Record#toString()}.
     *
     *
     * @param lookup       the full-privilege lookup context of the caller
     * @param methodName   the name of the method to generate, which must be one of
     *                     {@code "equals"}, {@code "hashCode"}, or {@code "toString"}
     * @param type         a {@link MethodType} corresponding the descriptor type
     *                     for the method, which must correspond to the descriptor
     *                     for the corresponding {@link Object} method, if linking
     *                     an {@code invokedynamic} call site, or the
     *                     constant {@code MethodHandle.class}, if linking a
     *                     dynamic constant
     * @param recordClass  the record class hosting the record components
     * @param names        the list of component names, joined into a string
     *                     separated by ";", or the empty string if there are no
     *                     components. This parameter is ignored if the {@code methodName}
     *                     parameter is {@code "equals"} or {@code "hashCode"}
     * @param getters      method handles for the accessor methods for the components
     * @return             a call site if invoked by indy, or a method handle
     *                     if invoked by a condy
     * @throws IllegalArgumentException if the bootstrap arguments are invalid
     *                                  or inconsistent
     * @throws Throwable if any exception is thrown during call site construction
     */
    public static Object bootstrap(MethodHandles.Lookup lookup, String methodName, TypeDescriptor type,
                                   Class<?> recordClass,
                                   String names,
                                   MethodHandle... getters) throws Throwable {
        requireNonNull(lookup);
        requireNonNull(methodName);
        requireNonNull(type);
        requireNonNull(recordClass);
        requireNonNull(names);
        List<MethodHandle> getterList = List.of(getters); // deep null check

        if (!lookup.hasFullPrivilegeAccess())
            throw new IllegalArgumentException("Unprivileged lookup ".concat(lookup.toString()));

        MethodType methodType;
        if (type instanceof MethodType mt)
            methodType = mt;
        else {
            methodType = null;
            if (!MethodHandle.class.equals(type))
                throw new IllegalArgumentException(type.toString());
        }

        for (MethodHandle getter : getterList) {
            var getterType = getter.type();
            if (getterType.parameterCount() != 1 || getterType.returnType() == void.class || getterType.parameterType(0) != recordClass) {
                throw new IllegalArgumentException("Illegal getter type %s for recordClass %s".formatted(getterType, recordClass.getTypeName()));
            }
        }

        MethodHandle handle = switch (methodName) {
            case "equals"   -> {
                if (methodType != null && !methodType.equals(MethodType.methodType(boolean.class, recordClass, Object.class)))
                    throw new IllegalArgumentException("Bad method type: " + methodType);
                String[] fields = fieldNames(lookup, recordClass, getterList);
                yield fields != null ? makeStraightLine(lookup, recordClass, methodName, fields, nameList(names), getterList)
                                     : makeEquals(lookup, recordClass, getterList);
            }
            case "hashCode" -> {
                if (methodType != null && !methodType.equals(MethodType.methodType(int.class, recordClass)))
                    throw new IllegalArgumentException("Bad method type: " + methodType);
                String[] fields = fieldNames(lookup, recordClass, getterList);
                yield fields != null ? makeStraightLine(lookup, recordClass, methodName, fields, nameList(names), getterList)
                                     : makeHashCode(lookup, recordClass, getterList);
            }
            case "toString" -> {
                if (methodType != null && !methodType.equals(MethodType.methodType(String.class, recordClass)))
                    throw new IllegalArgumentException("Bad method type: " + methodType);
                List<String> nameList = nameList(names);
                if (nameList.size() != getterList.size())
                    throw new IllegalArgumentException("Name list and accessor list do not match");
                String[] fields = fieldNames(lookup, recordClass, getterList);
                yield fields != null && slots(getterList) <= MAX_STRING_CONCAT_SLOTS
                        ? makeStraightLine(lookup, recordClass, methodName, fields, nameList, getterList)
                        : makeToString(lookup, recordClass, getters, nameList);
            }
            default -> throw new IllegalArgumentException(methodName);
        };
        return methodType != null ? new ConstantCallSite(handle) : handle;
    }
}
