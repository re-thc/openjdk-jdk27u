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
 * @summary The locals at every instruction of a try block must match the
 *          stackmap frame of its exception handler, also after they changed.
 * @run main/othervm -Xverify:remote ExceptionHandlerLocals
 */

import java.lang.classfile.ClassFile;
import java.lang.classfile.CodeBuilder;
import java.lang.classfile.Label;
import java.lang.classfile.attribute.StackMapFrameInfo;
import java.lang.classfile.attribute.StackMapTableAttribute;
import java.lang.constant.ClassDesc;
import java.lang.constant.MethodTypeDesc;
import java.util.List;
import java.util.function.Consumer;

import static java.lang.classfile.ClassFile.ACC_PUBLIC;
import static java.lang.classfile.ClassFile.ACC_STATIC;
import static java.lang.constant.ConstantDescs.CD_Object;
import static java.lang.constant.ConstantDescs.CD_String;
import static java.lang.constant.ConstantDescs.CD_Throwable;
import static java.lang.constant.ConstantDescs.CD_int;
import static java.lang.constant.ConstantDescs.CD_void;

public class ExceptionHandlerLocals {

    static class Loader extends ClassLoader {
        Class<?> define(String name, byte[] bytes) {
            return defineClass(name, bytes, 0, bytes.length);
        }
    }

    // Builds a class with the static method
    //   void test(int, Object) { try { <body> } catch (Throwable) { } }
    // where the handler's frame expects local 1 to be of type handlerLocal1.
    static byte[] build(String name, ClassDesc handlerLocal1, Consumer<CodeBuilder> body) {
        return ClassFile.of(ClassFile.StackMapsOption.DROP_STACK_MAPS)
            .build(ClassDesc.of(name), cb -> cb.withMethodBody("test",
                MethodTypeDesc.of(CD_void, CD_int, handlerLocal1), ACC_PUBLIC | ACC_STATIC, cob -> {
                    Label start = cob.newLabel();
                    Label end = cob.newLabel();
                    Label handler = cob.newLabel();
                    cob.labelBinding(start);
                    body.accept(cob);
                    cob.labelBinding(end);
                    cob.return_();
                    cob.labelBinding(handler);
                    cob.pop();
                    cob.return_();
                    cob.exceptionCatchAll(start, end, handler);
                    cob.with(StackMapTableAttribute.of(List.of(
                        StackMapFrameInfo.of(handler,
                            List.of(StackMapFrameInfo.SimpleVerificationTypeInfo.INTEGER,
                                    typeInfo(handlerLocal1)),
                            List.of(StackMapFrameInfo.ObjectVerificationTypeInfo.of(CD_Throwable))))));
                }));
    }

    static StackMapFrameInfo.VerificationTypeInfo typeInfo(ClassDesc desc) {
        return desc == CD_int ? StackMapFrameInfo.SimpleVerificationTypeInfo.INTEGER
                              : StackMapFrameInfo.ObjectVerificationTypeInfo.of(desc);
    }

    static int counter;

    static void test(boolean valid, ClassDesc handlerLocal1, Consumer<CodeBuilder> body) throws Exception {
        String name = "Test" + counter++;
        Class<?> c = new Loader().define(name, build(name, handlerLocal1, body));
        try {
            Class.forName(name, true, c.getClassLoader());
            if (!valid) {
                throw new RuntimeException(name + " passed verification");
            }
        } catch (VerifyError e) {
            if (valid) {
                throw new RuntimeException(name + " failed verification", e);
            }
            if (!e.getMessage().contains("Stack map does not match the one at exception handler")) {
                throw new RuntimeException(name + " failed verification for another reason", e);
            }
            System.out.println("Expected: " + e.getMessage().lines().findFirst().get());
        }
    }

    public static void main(String[] args) throws Exception {
        // The type of local 1 stays the same.
        test(true, CD_int, cob -> cob.nop().iconst_1().istore(1).nop().iload(1).pop().nop());

        // Local 1 turns into a reference in the middle of the try block, after
        // the exception handler was matched several times.
        test(false, CD_int, cob -> cob.nop().nop().iconst_1().istore(1).nop().aconst_null().astore(1).nop());
        test(false, CD_int, cob -> cob.nop().nop().aconst_null().astore(1).nop().nop());
        test(false, CD_int, cob -> cob.nop().ldc("s").astore(1).nop());

        // The type of local 1 is assignable to the one in the handler's frame.
        test(true, CD_Object, cob -> cob.nop().ldc("s").astore(1).nop().aload(1).pop().nop());
        test(true, CD_Object, cob -> cob.nop().aconst_null().astore(1).nop().nop());
        test(true, CD_String, cob -> cob.nop().ldc("s").astore(1).nop().nop());

        // It is not assignable, or no longer is after it was changed.
        test(false, CD_Object, cob -> cob.nop().nop().iconst_1().istore(1).nop().nop());
        test(false, CD_String, cob -> cob.nop().ldc("s").astore(1).nop().iload(0).pop().nop()
                                         .new_(CD_Object).dup().invokespecial(CD_Object, "<init>", MethodTypeDesc.of(CD_void))
                                         .astore(1).nop());
    }
}
