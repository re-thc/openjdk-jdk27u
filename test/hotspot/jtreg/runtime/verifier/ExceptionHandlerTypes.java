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
 * @summary The stackmap frame of each exception handler of a try block must
 *          match the locals at every instruction that the handler covers, also
 *          if another handler of a different catch type, whose frame matches,
 *          covers the same instructions or is checked first.
 * @run main/othervm -Xverify:remote ExceptionHandlerTypes
 */

import java.lang.classfile.Attributes;
import java.lang.classfile.ClassFile;
import java.lang.classfile.ClassModel;
import java.lang.classfile.Label;
import java.lang.classfile.MethodModel;
import java.lang.classfile.attribute.CodeAttribute;
import java.lang.classfile.attribute.StackMapFrameInfo;
import java.lang.classfile.attribute.StackMapFrameInfo.ObjectVerificationTypeInfo;
import java.lang.classfile.attribute.StackMapFrameInfo.SimpleVerificationTypeInfo;
import java.lang.classfile.attribute.StackMapFrameInfo.VerificationTypeInfo;
import java.lang.classfile.attribute.StackMapTableAttribute;
import java.lang.classfile.instruction.ExceptionCatch;
import java.lang.constant.ClassDesc;
import java.lang.constant.MethodTypeDesc;
import java.util.ArrayList;
import java.util.List;

import static java.lang.classfile.ClassFile.ACC_PUBLIC;
import static java.lang.classfile.ClassFile.ACC_STATIC;
import static java.lang.constant.ConstantDescs.CD_String;
import static java.lang.constant.ConstantDescs.CD_int;
import static java.lang.constant.ConstantDescs.CD_void;

/**
 * Two handlers cover identical, overlapping or disjoint ranges. Each handler
 * must validate its own frame, even when the other handler has already matched
 * the same locals.
 */
public class ExceptionHandlerTypes {

    static final VerificationTypeInfo INT = SimpleVerificationTypeInfo.INTEGER;
    static final VerificationTypeInfo TOP = SimpleVerificationTypeInfo.TOP;
    static final VerificationTypeInfo STRING = ObjectVerificationTypeInfo.of(CD_String);
    static final ClassDesc CD_RuntimeException = ClassDesc.of("java.lang.RuntimeException");
    static final ClassDesc CD_Error = ClassDesc.of("java.lang.Error");

    enum At { A, C, D }

    // local is the expected type of local 1 in the handler frame.
    record Handler(At start, At end, ClassDesc catchType, VerificationTypeInfo local) { }

    static class Loader extends ClassLoader {
        Class<?> define(String name, byte[] bytes) {
            return defineClass(name, bytes, 0, bytes.length);
        }
    }

    static int counter;

    static byte[] generate(String name, boolean changeLocals, Handler first, Handler second) {
        return ClassFile.of(ClassFile.StackMapsOption.DROP_STACK_MAPS).build(ClassDesc.of(name), cb -> cb
            .withFlags(ACC_PUBLIC)
            .withMethodBody("test", MethodTypeDesc.of(CD_void, CD_int), ACC_PUBLIC | ACC_STATIC, cob -> {
                Label a = cob.newLabel();
                Label c = cob.newLabel();
                Label d = cob.newLabel();
                cob.iconst_0().istore(1);
                cob.labelBinding(a);
                cob.nop();
                if (changeLocals) {
                    cob.ldc("text").astore(1);
                }
                cob.labelBinding(c);
                cob.nop();
                cob.labelBinding(d);
                cob.return_();
                List<StackMapFrameInfo> frames = new ArrayList<>();
                for (Handler h : List.of(first, second)) {
                    Label handler = cob.newLabel();
                    cob.labelBinding(handler);
                    frames.add(StackMapFrameInfo.of(handler, List.of(INT, h.local()),
                        List.of(ObjectVerificationTypeInfo.of(h.catchType()))));
                    cob.pop().return_();
                    cob.exceptionCatch(label(h.start(), a, c, d), label(h.end(), a, c, d), handler, h.catchType());
                }
                cob.with(StackMapTableAttribute.of(frames));
            }));
    }

    static Label label(At at, Label a, Label c, Label d) {
        return switch (at) {
            case A -> a;
            case C -> c;
            case D -> d;
        };
    }

    static int secondHandlerPc(byte[] bytes) {
        ClassModel cm = ClassFile.of().parse(bytes);
        for (MethodModel mm : cm.methods()) {
            if (mm.methodName().equalsString("test")) {
                CodeAttribute code = mm.findAttribute(Attributes.code()).orElseThrow();
                ExceptionCatch second = code.exceptionHandlers().get(1);
                return code.labelToBci(second.handler());
            }
        }
        throw new RuntimeException("no test method");
    }

    static void accepted(boolean changeLocals, Handler first, Handler second) throws Exception {
        String name = "Test" + counter++;
        byte[] bytes = generate(name, changeLocals, first, second);
        Class<?> c = new Loader().define(name, bytes);
        c.getMethod("test", int.class).invoke(null, 0);
    }

    static void rejected(boolean changeLocals, Handler first, Handler second) throws Exception {
        String name = "Test" + counter++;
        byte[] bytes = generate(name, changeLocals, first, second);
        String expected = "Stack map does not match the one at exception handler " + secondHandlerPc(bytes);
        try {
            Loader loader = new Loader();
            loader.define(name, bytes);
            Class.forName(name, true, loader);
            throw new RuntimeException(name + " passed verification");
        } catch (VerifyError e) {
            if (!e.getMessage().contains(expected)) {
                throw new RuntimeException(name + " failed verification for another reason, expected: " + expected, e);
            }
            System.out.println("Expected: " + e.getMessage().lines().findFirst().get());
        }
    }

    public static void main(String[] args) throws Exception {
        // Identical protected ranges.
        accepted(false, new Handler(At.A, At.D, CD_RuntimeException, INT),
                        new Handler(At.A, At.D, CD_Error, INT));
        accepted(false, new Handler(At.A, At.D, CD_RuntimeException, INT),
                        new Handler(At.A, At.D, CD_Error, TOP));
        rejected(false, new Handler(At.A, At.D, CD_RuntimeException, INT),
                        new Handler(At.A, At.D, CD_Error, STRING));
        rejected(false, new Handler(At.A, At.D, CD_RuntimeException, TOP),
                        new Handler(At.A, At.D, CD_Error, STRING));

        // Disjoint ranges with unchanged locals.
        accepted(false, new Handler(At.A, At.C, CD_RuntimeException, INT),
                        new Handler(At.C, At.D, CD_Error, INT));
        rejected(false, new Handler(At.A, At.C, CD_RuntimeException, INT),
                        new Handler(At.C, At.D, CD_Error, STRING));

        // The second handler starts after local 1 changes from int to String.
        accepted(true, new Handler(At.A, At.D, CD_RuntimeException, TOP),
                       new Handler(At.C, At.D, CD_Error, STRING));
        rejected(true, new Handler(At.A, At.D, CD_RuntimeException, TOP),
                       new Handler(At.C, At.D, CD_Error, INT));

        // Both handlers span the change in local 1.
        accepted(true, new Handler(At.A, At.D, CD_RuntimeException, TOP),
                       new Handler(At.A, At.D, CD_Error, TOP));
        rejected(true, new Handler(At.A, At.D, CD_RuntimeException, TOP),
                       new Handler(At.A, At.D, CD_Error, INT));
    }
}
