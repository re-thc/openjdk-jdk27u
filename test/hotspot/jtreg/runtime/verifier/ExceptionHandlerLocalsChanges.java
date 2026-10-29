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
 * Successful handler matches must be invalidated when stores, stack-map
 * frames or object initialization change the locals.
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

    interface Code {
        void emit(CodeBuilder cob, List<StackMapFrameInfo> frames);
    }

    static final Code NOTHING = (cob, frames) -> { };

    // Emits before; try { body } catch (Throwable) { ... } after; return.
    // Constructor handlers rethrow because super() may not have been called.
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

        TestMethod handler(VerificationTypeInfo... locals) {
            return handler(() -> List.of(locals));
        }

        // Deferred locals may refer to labels bound while emitting code.
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

        void accepted() throws Exception {
            verify(cb -> emit(cb, "test"), null);
        }

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

    static String mismatch(String current, int local, String expected) {
        return (current == null ? "" : "Type " + current + " ") + "(current frame, locals[" + local
                + "]) is not assignable to " + expected + " (stack map, locals[" + local + "])";
    }

    // Stores into either slot of a long or double can invalidate the other slot.
    static void longsAndDoubles() throws Exception {
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

        // Overwriting the second slot invalidates the first.
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

        // Overwriting the first slot replaces the value.
        method(CD_int, CD_long).handler(INT, LONG)
            .body(cob -> cob.nop().iconst_0().istore(1).nop())
            .rejected(mismatch("integer", 1, "long"));
        method(CD_int, CD_int, CD_long).handler(INT, INT, LONG)
            .body(cob -> cob.nop().iconst_0().istore(2).nop())
            .rejected(mismatch("integer", 2, "long"));

        // Locals not required by the handler may change freely.
        method(CD_int, CD_long).handler(INT).body(cob -> cob
            .nop().lconst_0().lstore(1).nop().iconst_0().istore(2).nop().dconst_0().dstore(2).nop()
            .fconst_0().fstore(1).nop().lconst_0().lstore(2).nop())
            .accepted();
        method(CD_int, CD_long).handler(INT, LONG)
            .body(cob -> cob.nop().lconst_0().lstore(1).nop().nop())
            .accepted();
        method(CD_int, CD_double).handler(INT, DOUBLE)
            .body(cob -> cob.nop().dconst_0().dstore(1).nop().nop())
            .accepted();
    }

    static void frame(CodeBuilder cob, List<StackMapFrameInfo> frames, Label label,
                      VerificationTypeInfo... locals) {
        cob.labelBinding(label);
        frames.add(StackMapFrameInfo.of(label, List.of(locals), List.of()));
    }

    static void stackMapFrames() throws Exception {
        // Fall-through to chop or full frames can invalidate a cached handler match.
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

        // After goto, the target frame replaces locals without a fall-through match.
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

        // Matching and append frames preserve the locals required by the handler.
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

    // Calling super() initializes every alias and clears flagThisUninit.
    static void uninitializedThis() throws Exception {
        Consumer<CodeBuilder> copy = cob -> cob.aload(0).astore(1).aload(0).astore(2);

        // A handler expecting uninitialized aliases must reject the state after super().
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
        // The current frame has flagThisUninit, but the handler does not.
        constructor().handler()
            .before(copy).body(cob -> cob.nop().nop())
            .rejected(FLAGS);

        // The protected range ends before super(), including any alias stores.
        constructor().handler(UNINITIALIZED_THIS, UNINITIALIZED_THIS, UNINITIALIZED_THIS)
            .before(copy).body(cob -> cob.nop().nop()).after(ExceptionHandlerLocalsChanges::callSuper)
            .accepted();
        constructor().handler(UNINITIALIZED_THIS)
            .body(cob -> cob.nop().aload(0).astore(1).nop().aload(0).astore(2).nop())
            .after(ExceptionHandlerLocalsChanges::callSuper)
            .accepted();
        // After super(), all aliases are initialized and the flag is clear.
        constructor().handler(OBJECT, OBJECT, OBJECT)
            .before(cob -> { copy.accept(cob); callSuper(cob); }).body(cob -> cob.nop().nop())
            .accepted();
    }

    // The label identifies the uninitialized object stored in locals 0 and 1.
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

    static void uninitializedObject() throws Exception {
        // The constructor invalidates handler matches for every uninitialized alias.
        NewObject first = new NewObject();
        method().handler(() -> List.of(first.uninitialized(), first.uninitialized()))
            .before(first).body(cob -> { cob.nop(); callConstructor(cob); cob.nop(); })
            .rejected(mismatch("'java/lang/Object'", 0, "uninitialized 0"));
        NewObject second = new NewObject();
        method().handler(() -> List.of(TOP, second.uninitialized()))
            .before(second).body(cob -> { cob.nop(); callConstructor(cob); cob.nop(); })
            .rejected(mismatch("'java/lang/Object'", 1, "uninitialized 0"));
        method().handler(TOP, TOP)
            .before(new NewObject()).body(cob -> { cob.nop(); callConstructor(cob); cob.nop(); })
            .accepted();
        // The try block starts after the constructor was called.
        method().handler(OBJECT, OBJECT)
            .before((cob, frames) -> { new NewObject().emit(cob, frames); callConstructor(cob); })
            .body(cob -> cob.nop().nop())
            .accepted();
    }

    // Handler matches must not carry over between methods.
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
