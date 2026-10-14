/*
 * Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
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

package jdk.internal.reflect;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodType;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

import jdk.internal.vm.annotation.Stable;

import static jdk.internal.reflect.MethodHandleAccessorFactory.LazyStaticHolder.JLIA;

abstract class MethodHandleFieldAccessorImpl extends FieldAccessorImpl {
    private static final int IS_READ_ONLY_BIT = 0x0001;
    private static final int IS_STATIC_BIT = 0x0002;
    private static final int NONZERO_BIT = 0x8000;

    private final int fieldFlags;
    protected final MethodHandle getter;
    // Created on first use as most fields are only ever read.  @Stable and not
    // volatile, so that the JIT folds it into the code for a constant accessor like
    // the final getter; a volatile read prevents that.  The race is benign: threads
    // may each create a setter, which are interchangeable, and a method handle is
    // safely published through its final fields (its LambdaForm is prepared by the
    // constructor), as with the accessors in Field.
    @Stable
    private MethodHandle setter;

    protected MethodHandleFieldAccessorImpl(Field field, MethodHandle getter, boolean isReadOnly, boolean isStatic) {
        super(field);
        this.fieldFlags = (isReadOnly ? IS_READ_ONLY_BIT : 0) |
                          (isStatic ? IS_STATIC_BIT : 0) |
                          NONZERO_BIT;
        this.getter = getter;
    }

    /**
     * Returns the setter, adapted to {@code (Object, T)void} for an instance field
     * or {@code (T)void} for a static field, where {@code T} is the field type for
     * a primitive field and {@code Object} otherwise.  Must not be called when
     * this accessor is read-only.
     */
    protected final MethodHandle setter() {
        MethodHandle mh = setter;
        if (mh == null) {
            // racing threads may each create a setter, which are interchangeable
            setter = mh = newSetter();
        }
        return mh;
    }

    private MethodHandle newSetter() {
        assert !isReadOnly();
        Class<?> type = field.getType();
        if (!type.isPrimitive()) {
            type = Object.class;
        }
        MethodType mtype = isStatic() ? MethodType.methodType(void.class, type)
                                      : MethodType.methodType(void.class, Object.class, type);
        try {
            return JLIA.unreflectField(field, true).asType(mtype);
        } catch (IllegalAccessException e) {
            throw new InternalError(e);
        }
    }

    protected final boolean isReadOnly() {
        return (fieldFlags & IS_READ_ONLY_BIT) == IS_READ_ONLY_BIT;
    }

    protected final boolean isStatic() {
        return (fieldFlags & IS_STATIC_BIT) == IS_STATIC_BIT;
    }

    protected final void ensureObj(Object o) {
        if (!isStatic()) {
            // for compatibility, check the receiver object first
            // throw NullPointerException if o is null
            if (!field.getDeclaringClass().isAssignableFrom(o.getClass())) {
                throwSetIllegalArgumentException(o);
            }
        }
    }

    private String getMessage(boolean getter, Class<?> type) {
        String err = "Can not " + (getter ? "get" : "set");
        if (Modifier.isStatic(field.getModifiers()))
            err += " static";
        if (Modifier.isFinal(field.getModifiers()))
            err += " final";
        err += " " + field.getType().getName() + " field " + getQualifiedFieldName();
        if (type != null) {
            err += " on " + type.getName();
        }
        return err;
    }

    /**
     * IllegalArgumentException because Field::get on the specified object, which
     * is not an instance of the class or interface declaring the underlying method
     */
    protected IllegalArgumentException newGetIllegalArgumentException(Object o) {
        return new IllegalArgumentException(getMessage(true, o != null ? o.getClass() : null));
    }

    /**
     * IllegalArgumentException because Field::set on the specified object, which
     * is not an instance of the class or interface declaring the underlying method
     */
    protected IllegalArgumentException newSetIllegalArgumentException(Object o) {
        return new IllegalArgumentException(getMessage(false, o != null ? o.getClass() : null));
    }
}
