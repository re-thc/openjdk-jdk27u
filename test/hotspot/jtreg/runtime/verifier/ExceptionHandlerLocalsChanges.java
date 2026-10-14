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
 * @summary The stackmap frame of an exception handler must match the locals
 *          at every instruction of its try block, also after they were changed
 *          by stores of longs and doubles, by stackmap frames and by calls of
 *          constructors that initialize copies of an object.
 * @run main/othervm -Xverify:remote ExceptionHandlerLocalsChanges
 */

import java.lang.classfile.ClassBuilder;
import java.lang.classfile.ClassFile;
import java.lang.classfile.CodeBuilder;
import java.lang.classfile.Label;
import java.lang.classfile.attribute.StackMapFrameInfo;
import java.lang.classfile.attribute.StackMapFrameInfo.ObjectVerificationTypeInfo;
import java.lang.classfile.attribute.StackMapFrameInfo.SimpleVerificationTypeInfo;
import java.lang.classfile.attribute.StackMapFrameInfo.UninitializedVerificationTypeInfo;
import java.lang.classfile.attribute.StackMapFrameInfo.VerificationTypeInfo;
import java.lang.classfile.attribute.StackMapTableAttribute;
import java.lang.constant.ClassDesc;
import java.lang.constant.MethodTypeDesc;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import java.util.function.Supplier;

import static java.lang.classfile.ClassFile.ACC_PUBLIC;
import static java.lang.classfile.ClassFile.ACC_STATIC;
import static java.lang.constant.ConstantDescs.CD_Object;
import static java.lang.constant.ConstantDescs.CD_String;
import static java.lang.constant.ConstantDescs.CD_Throwable;
import static java.lang.constant.ConstantDescs.CD_double;
import static java.lang.constant.ConstantDescs.CD_int;
import static java.lang.constant.ConstantDescs.CD_long;
import static java.lang.constant.ConstantDescs.CD_void;
import static java.lang.constant.ConstantDescs.INIT_NAME;

/**
 * The classes under test have a try block and an exception handler with a
 * stackmap frame, which the locals of the verifier must match at every
 * instruction of the try block. In the classes that fail to verify, they match
 * at the first instructions. Then the locals change in a way that the verifier
 * has to notice, so that they do not match at the next instruction.
 */
public class ExceptionHandlerLocalsChanges {

    static final VerificationTypeInfo INT = SimpleVerificationTypeInfo.INTEGER;
    static final VerificationTypeInfo LONG = SimpleVerificationTypeInfo.LONG;
    static final VerificationTypeInfo DOUBLE = SimpleVerificationTypeInfo.DOUBLE;
    static final VerificationTypeInfo TOP = SimpleVerificationTypeInfo.TOP;
    static final VerificationTypeInfo UNINITIALIZED_THIS = SimpleVerificationTypeInfo.UNINITIALIZED_THIS;
    static final VerificationTypeInfo OBJECT = ObjectVerificationTypeInfo.of(CD_Object);
    static final VerificationTypeInfo STRING = ObjectVerificationTypeInfo.of(CD_String);

    static class Loader extends ClassLoader {
        Class<?> define(String name, byte[] bytes) {
            return defineClass(name, bytes, 0, bytes.length);
        }
    }

    // Emits instructions, and the stackmap frames for the ones that are
    // branch targets.
    interface Code {
        void emit(CodeBuilder cob, List<StackMapFrameInfo> frames);
    }

    static final Code NOTHING = (cob, frames) -> { };

    // A method of a class under test, which is the static method test() or the
    // constructor. It has the code
    //   before; try { body } catch (Throwable) { ... } after; return
    // where the handler returns, or throws in a constructor, which cannot
    // return before it called super().
    static class TestMethod {
        final boolean constructor;
        final MethodTypeDesc type;
        Supplier<List<VerificationTypeInfo>> handlerLocals = List::of;
        Code before = NOTHING;
        Code body = NOTHING;
        Code after = NOTHING;

        TestMethod(boolean constructor, MethodTypeDesc type) {
            this.constructor = constructor;
            this.type = type;
        }

        // The locals in the stackmap frame of the exception handler
        TestMethod handler(VerificationTypeInfo... locals) {
            return handler(() -> List.of(locals));
        }

        // The same, if they depend on the code that is emitted
        TestMethod handler(Supplier<List<VerificationTypeInfo>> locals) {
            handlerLocals = locals;
            return this;
        }

        TestMethod before(Code code) {
            before = code;
            return this;
        }

        TestMethod before(Consumer<CodeBuilder> code) {
            return before((cob, frames) -> code.accept(cob));
        }

        TestMethod body(Code code) {
            body = code;
            return this;
        }

        TestMethod body(Consumer<CodeBuilder> code) {
            return body((cob, frames) -> code.accept(cob));
        }

        TestMethod after(Consumer<CodeBuilder> code) {
            after = (cob, frames) -> code.accept(cob);
            return this;
        }

        void emit(ClassBuilder cb, String name) {
            cb.withMethodBody(constructor ? INIT_NAME : name, type,
                constructor ? ACC_PUBLIC : ACC_PUBLIC | ACC_STATIC, cob -> {
                    List<StackMapFrameInfo> frames = new ArrayList<>();
                    Label start = cob.newLabel();
                    Label end = cob.newLabel();
                    Label handler = cob.newLabel();
                    before.emit(cob, frames);
                    cob.labelBinding(start);
                    body.emit(cob, frames);
                    cob.labelBinding(end);
                    after.emit(cob, frames);
                    cob.return_();
                    cob.labelBinding(handler);
                    frames.add(StackMapFrameInfo.of(handler, handlerLocals.get(),
                        List.of(ObjectVerificationTypeInfo.of(CD_Throwable))));
                    if (constructor) {
                        cob.athrow();
                    } else {
                        cob.pop().return_();
                    }
                    cob.exceptionCatchAll(start, end, handler);
                    cob.with(StackMapTableAttribute.of(frames));
                });
        }

        // The class with this method must verify.
        void accepted() throws Exception {
            verify(cb -> emit(cb, "test"), null);
        }

        // The class with this method must fail to verify because the frame of
        // the handler does not match the locals at an instruction of the try
        // block, with a message that contains the mismatch.
        void rejected(String mismatch) throws Exception {
            verify(cb -> emit(cb, "test"), mismatch);
        }
    }

    static int counter;

    static void verify(Consumer<ClassBuilder> methods, String mismatch) throws Exception {
        String name = "Test" + counter++;
        byte[] bytes = ClassFile.of(ClassFile.StackMapsOption.DROP_STACK_MAPS)
            .build(ClassDesc.of(name), methods);
        Loader loader = new Loader();
        loader.define(name, bytes);
        try {
            Class.forName(name, true, loader);
            if (mismatch != null) {
                throw new RuntimeException(name + " passed verification");
            }
        } catch (VerifyError e) {
            if (mismatch == null) {
                throw new RuntimeException(name + " failed verification", e);
            }
            if (!e.getMessage().contains("Stack map does not match the one at exception handler")
                    || !e.getMessage().contains(mismatch)) {
                throw new RuntimeException(name + " failed verification for another reason", e);
            }
            System.out.println("Expected: " + e.getMessage().lines().findFirst().get() + ", " + mismatch);
        }
    }

    static TestMethod method(ClassDesc... parameters) {
        return new TestMethod(false, MethodTypeDesc.of(CD_void, parameters));
    }

    static TestMethod constructor() {
        return new TestMethod(true, MethodTypeDesc.of(CD_void));
    }

    // The message about a local of the current frame that is not assignable to
    // the one in the frame of the handler.
    static String mismatch(String current, int local, String expected) {
        return (current == null ? "" : "Type " + current + " ") + "(current frame, locals[" + local
                + "]) is not assignable to " + expected + " (stack map, locals[" + local + "])";
    }

    // Longs and doubles occupy two locals. Storing something over one of them
    // changes the other one too.
    static void longsAndDoubles() throws Exception {
        // A long or double replaces ints that the handler expects.
        method(CD_int, CD_int, CD_int).handler(INT, INT, INT)
            .body(cob -> cob.nop().lconst_0().lstore(1).nop())
            .rejected(mismatch("long", 1, "integer"));
        method(CD_int, CD_int, CD_int).handler(INT, INT, INT)
            .body(cob -> cob.nop().lconst_0().lstore(2).nop())
            .rejected(mismatch("long", 2, "integer"));
        method(CD_int, CD_int, CD_int).handler(INT, INT, INT)
            .body(cob -> cob.nop().dconst_0().dstore(1).nop())
            .rejected(mismatch("double", 1, "integer"));
        method(CD_int, CD_int, CD_int).handler(INT, INT, INT)
            .body(cob -> cob.nop().dconst_0().dstore(2).nop())
            .rejected(mismatch("double", 2, "integer"));
        method(CD_int, CD_int, CD_long).handler(INT, INT, LONG)
            .body(cob -> cob.nop().lconst_0().lstore(1).nop())
            .rejected(mismatch("long", 1, "integer"));
        method(CD_int, CD_int, CD_long).handler(INT, INT, LONG)
            .body(cob -> cob.nop().dconst_0().dstore(1).nop())
            .rejected(mismatch("double", 1, "integer"));

        // A store over the second half of a long or double invalidates the
        // first half.
        method(CD_int, CD_long).handler(INT, LONG)
            .body(cob -> cob.nop().iconst_0().istore(2).nop())
            .rejected(mismatch("top", 1, "long"));
        method(CD_int, CD_long).handler(INT, LONG)
            .body(cob -> cob.nop().lconst_0().lstore(2).nop())
            .rejected(mismatch("top", 1, "long"));
        method(CD_int, CD_double).handler(INT, DOUBLE)
            .body(cob -> cob.nop().iconst_0().istore(2).nop())
            .rejected(mismatch("top", 1, "double"));
        method(CD_int, CD_double).handler(INT, DOUBLE)
            .body(cob -> cob.nop().dconst_0().dstore(2).nop())
            .rejected(mismatch("top", 1, "double"));
        method(CD_int, CD_int, CD_long).handler(INT, INT, LONG)
            .body(cob -> cob.nop().iconst_0().istore(3).nop())
            .rejected(mismatch("top", 2, "long"));

        // A store over the first half of a long or double replaces the value.
        method(CD_int, CD_long).handler(INT, LONG)
            .body(cob -> cob.nop().iconst_0().istore(1).nop())
            .rejected(mismatch("integer", 1, "long"));
        method(CD_int, CD_int, CD_long).handler(INT, INT, LONG)
            .body(cob -> cob.nop().iconst_0().istore(2).nop())
            .rejected(mismatch("integer", 2, "long"));

        // The handler only expects the first local, whatever is stored over
        // the others.
        method(CD_int, CD_long).handler(INT).body(cob -> cob
            .nop().lconst_0().lstore(1).nop().iconst_0().istore(2).nop().dconst_0().dstore(2).nop()
            .fconst_0().fstore(1).nop().lconst_0().lstore(2).nop())
            .accepted();
        // The long or double that is stored is the one it expects.
        method(CD_int, CD_long).handler(INT, LONG)
            .body(cob -> cob.nop().lconst_0().lstore(1).nop().nop())
            .accepted();
        method(CD_int, CD_double).handler(INT, DOUBLE)
            .body(cob -> cob.nop().dconst_0().dstore(1).nop().nop())
            .accepted();
    }

    // Binds the label to the next instruction, which is given a stackmap frame
    // with the locals.
    static void frame(CodeBuilder cob, List<StackMapFrameInfo> frames, Label label,
                      VerificationTypeInfo... locals) {
        cob.labelBinding(label);
        frames.add(StackMapFrameInfo.of(label, List.of(locals), List.of()));
    }

    // A stackmap frame inside the try block replaces the locals.
    static void stackMapFrames() throws Exception {
        // The frame removes a local that the handler expects (as a chop frame),
        // or makes its type less specific (as a full frame), when it is reached
        // by falling through...
        method(CD_int, CD_int).handler(INT, INT).body((cob, frames) -> {
            cob.nop().nop();
            frame(cob, frames, cob.newLabel(), INT);
            cob.nop().nop();
        }).rejected(mismatch("top", 1, "integer"));
        method(CD_int, CD_int).handler(INT, INT).body((cob, frames) -> {
            cob.nop().nop();
            frame(cob, frames, cob.newLabel(), INT, TOP);
            cob.nop().nop();
        }).rejected(mismatch("top", 1, "integer"));
        method(CD_int, CD_String).handler(INT, STRING).body((cob, frames) -> {
            cob.nop().nop();
            frame(cob, frames, cob.newLabel(), INT, OBJECT);
            cob.nop().nop();
        }).rejected(mismatch("'java/lang/Object'", 1, "'java/lang/String'"));

        // ... and when it follows a goto, so that the locals are taken from it
        // without being matched.
        method(CD_int, CD_int).handler(INT, INT).body((cob, frames) -> {
            Label target = cob.newLabel();
            cob.nop().nop().goto_(target);
            frame(cob, frames, target, INT);
            cob.nop().nop();
        }).rejected(mismatch("top", 1, "integer"));
        method(CD_int, CD_String).handler(INT, STRING).body((cob, frames) -> {
            Label target = cob.newLabel();
            cob.nop().nop().goto_(target);
            frame(cob, frames, target, INT, OBJECT);
            cob.nop().nop();
        }).rejected(mismatch("'java/lang/Object'", 1, "'java/lang/String'"));

        // The frame keeps the locals that the handler expects, also if it adds
        // one (as an append frame).
        method(CD_int, CD_int).handler(INT).body((cob, frames) -> {
            cob.nop().nop();
            frame(cob, frames, cob.newLabel(), INT);
            cob.nop().nop();
        }).accepted();
        method(CD_int, CD_int).handler(INT, INT).body((cob, frames) -> {
            cob.nop().nop();
            frame(cob, frames, cob.newLabel(), INT, INT);
            cob.nop().nop();
        }).accepted();
        method(CD_int, CD_String).handler(INT, OBJECT).body((cob, frames) -> {
            cob.nop().nop();
            frame(cob, frames, cob.newLabel(), INT, OBJECT);
            cob.nop().nop();
        }).accepted();
        method(CD_int, CD_int).handler(INT, INT).body((cob, frames) -> {
            cob.nop().iconst_0().istore(2);
            frame(cob, frames, cob.newLabel(), INT, INT, INT);
            cob.nop().nop();
        }).accepted();
    }

    static final String FLAGS = "Current frame's flags are not assignable to stack map frame's.";

    static void callSuper(CodeBuilder cob) {
        cob.aload(0).invokespecial(CD_Object, INIT_NAME, MethodTypeDesc.of(CD_void));
    }

    // A constructor that has copies of the uninitialized this in locals 1 and
    // 2. Calling super() initializes all of them, and clears flagThisUninit.
    static void uninitializedThis() throws Exception {
        Consumer<CodeBuilder> copy = cob -> cob.aload(0).astore(1).aload(0).astore(2);

        // The try block calls super(). The handler, which expects the copies
        // not to be initialized, matches the locals before the call but not
        // the ones after it, with or without another instruction after it.
        for (boolean last : new boolean[] {false, true}) {
            Consumer<CodeBuilder> body = cob -> {
                cob.nop();
                callSuper(cob);
                if (last) {
                    cob.nop();
                }
            };
            constructor().handler(UNINITIALIZED_THIS, UNINITIALIZED_THIS, UNINITIALIZED_THIS)
                .before(copy).body(body)
                .rejected(mismatch(null, 0, "uninitializedThis"));
            constructor().handler(TOP, UNINITIALIZED_THIS, TOP)
                .before(copy).body(body)
                .rejected(mismatch(null, 1, "uninitializedThis"));
        }
        // The frame of the handler has no flagThisUninit, which it only has with
        // an uninitializedThis in its locals, but the locals before the call do.
        constructor().handler()
            .before(copy).body(cob -> cob.nop().nop())
            .rejected(FLAGS);

        // The try block ends before super() is called, also if it makes the
        // copies.
        constructor().handler(UNINITIALIZED_THIS, UNINITIALIZED_THIS, UNINITIALIZED_THIS)
            .before(copy).body(cob -> cob.nop().nop()).after(ExceptionHandlerLocalsChanges::callSuper)
            .accepted();
        constructor().handler(UNINITIALIZED_THIS)
            .body(cob -> cob.nop().aload(0).astore(1).nop().aload(0).astore(2).nop())
            .after(ExceptionHandlerLocalsChanges::callSuper)
            .accepted();
        // The try block starts after super() was called. All of the copies are
        // initialized and the flag is cleared.
        constructor().handler(OBJECT, OBJECT, OBJECT)
            .before(cob -> { copy.accept(cob); callSuper(cob); }).body(cob -> cob.nop().nop())
            .accepted();
    }

    // The code of a static method that creates an object and keeps it in
    // locals 0 and 1. The handler can expect them to be uninitialized, which is
    // the type of the object that the labeled new instruction creates.
    static class NewObject implements Code {
        Label label;

        @Override
        public void emit(CodeBuilder cob, List<StackMapFrameInfo> frames) {
            label = cob.newLabel();
            cob.labelBinding(label);
            cob.new_(CD_Object).dup().astore(0).dup().astore(1);
        }

        VerificationTypeInfo uninitialized() {
            return UninitializedVerificationTypeInfo.of(label);
        }
    }

    static void callConstructor(CodeBuilder cob) {
        cob.invokespecial(CD_Object, INIT_NAME, MethodTypeDesc.of(CD_void));
    }

    // Calling the constructor initializes all of the copies of the new object.
    static void uninitializedObject() throws Exception {
        // The try block calls the constructor. The handler, which expects the
        // copies not to be initialized, matches the locals before the call but
        // not the ones after it.
        NewObject first = new NewObject();
        method().handler(() -> List.of(first.uninitialized(), first.uninitialized()))
            .before(first).body(cob -> { cob.nop(); callConstructor(cob); cob.nop(); })
            .rejected(mismatch("'java/lang/Object'", 0, "uninitialized 0"));
        NewObject second = new NewObject();
        method().handler(() -> List.of(TOP, second.uninitialized()))
            .before(second).body(cob -> { cob.nop(); callConstructor(cob); cob.nop(); })
            .rejected(mismatch("'java/lang/Object'", 1, "uninitialized 0"));
        // The handler does not expect the copies.
        method().handler(TOP, TOP)
            .before(new NewObject()).body(cob -> { cob.nop(); callConstructor(cob); cob.nop(); })
            .accepted();
        // The try block starts after the constructor was called.
        method().handler(OBJECT, OBJECT)
            .before((cob, frames) -> { new NewObject().emit(cob, frames); callConstructor(cob); })
            .body(cob -> cob.nop().nop())
            .accepted();
    }

    // What matched in one method says nothing about the other methods of the
    // class, which are verified in no particular order.
    static void severalMethods() throws Exception {
        TestMethod valid = method(CD_int, CD_int).handler(INT, INT).body(cob -> cob.nop().nop());
        TestMethod invalid = method(CD_int, CD_int).handler(INT, STRING).body(cob -> cob.nop().nop());
        verify(cb -> {
            for (int i = 0; i < 5; i++) {
                valid.emit(cb, "valid" + i);
                invalid.emit(cb, "invalid" + i);
            }
        }, mismatch("integer", 1, "'java/lang/String'"));
    }

    public static void main(String[] args) throws Exception {
        longsAndDoubles();
        stackMapFrames();
        uninitializedThis();
        uninitializedObject();
        severalMethods();
    }
}
