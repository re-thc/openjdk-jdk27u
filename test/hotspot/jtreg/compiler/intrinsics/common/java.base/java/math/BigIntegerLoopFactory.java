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

package java.math;

import java.lang.classfile.ClassFile;
import java.lang.classfile.ClassTransform;
import java.lang.classfile.instruction.InvokeInstruction;
import java.lang.constant.ClassDesc;
import java.lang.invoke.MethodHandles;

public class BigIntegerLoopFactory {
    public static MethodHandles.Lookup create() throws Exception {
        byte[] bytes;
        try (var in = BigIntegerLoopTemplate.class.getResourceAsStream("BigIntegerLoopTemplate.class")) {
            bytes = in.readAllBytes();
        }
        bytes = ClassFile.of().transformClass(ClassFile.of().parse(bytes),
                ClassTransform.transformingMethodBodies((builder, element) -> {
                    if (element instanceof InvokeInstruction call && call.name().equalsString("mul")) {
                        builder.invokestatic(ClassDesc.of("java.math.BigInteger"), "implMulAdd", call.typeSymbol());
                    } else {
                        builder.with(element);
                    }
                }));
        return MethodHandles.privateLookupIn(BigInteger.class, MethodHandles.lookup())
                .defineHiddenClass(bytes, true, MethodHandles.Lookup.ClassOption.NESTMATE);
    }
}
