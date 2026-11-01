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

package jdk.internal.util;

import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.lang.constant.MethodTypeDesc;
import java.lang.invoke.MethodHandles;

import static java.lang.classfile.ClassFile.*;
import static java.lang.constant.ConstantDescs.*;

public final class HashPrivateProbe {
    public static Class<?> make() throws Exception {
        var type = MethodTypeDesc.of(CD_int, CD_Object, CD_int, CD_int, CD_int, CD_int);
        byte[] bytes = ClassFile.of().build(ClassDesc.of("jdk.internal.util.HashDynamicNestmate"),
                builder -> builder.withFlags(ACC_PUBLIC | ACC_FINAL | ACC_SUPER)
                        .withMethodBody("call", type, ACC_PUBLIC | ACC_STATIC,
                                code -> code.aload(0).iload(1).iload(2).iload(3).iload(4)
                                        .invokestatic(ClassDesc.of("jdk.internal.util.ArraysSupport"),
                                                "vectorizedHashCode", type)
                                        .ireturn()));
        return MethodHandles.privateLookupIn(ArraysSupport.class, MethodHandles.lookup())
                .defineHiddenClass(bytes, true, MethodHandles.Lookup.ClassOption.NESTMATE).lookupClass();
    }
}
