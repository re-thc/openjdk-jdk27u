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
 * @summary The verifier tells apart the class names in the descriptors of the
 *          fields and methods of a class, also if there are many of them or
 *          they only differ in their first characters.
 * @run main/othervm -Xverify:remote DescriptorClassNames
 */

import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.lang.constant.MethodTypeDesc;

import static java.lang.classfile.ClassFile.ACC_PUBLIC;
import static java.lang.classfile.ClassFile.ACC_STATIC;
import static java.lang.constant.ConstantDescs.CD_double;
import static java.lang.constant.ConstantDescs.CD_long;
import static java.lang.constant.ConstantDescs.CD_void;

public class DescriptorClassNames {

    static final int NAMES = 150;

    // Defines the empty classes that the classes under test refer to on demand.
    static class Loader extends ClassLoader {
        @Override
        protected Class<?> findClass(String name) throws ClassNotFoundException {
            if (!name.startsWith("p.") && !name.endsWith(".pkg.Foo")) {
                throw new ClassNotFoundException(name);
            }
            byte[] bytes = ClassFile.of().build(ClassDesc.of(name), cb -> cb.withFlags(ACC_PUBLIC));
            return defineClass(name, bytes, 0, bytes.length);
        }

        Class<?> define(String name, byte[] bytes) {
            return defineClass(name, bytes, 0, bytes.length);
        }
    }

    static MethodTypeDesc sig(ClassDesc... params) {
        return MethodTypeDesc.of(CD_void, params);
    }

    static ClassDesc type(int i) {
        return ClassDesc.of("p.T" + i);
    }

    // Methods f_i(a, b) that call g_i(b, a), where a and b are two of many
    // classes, and use a static field of type a.
    static byte[] manyNames() {
        ClassDesc main = ClassDesc.of("ManyNames");
        return ClassFile.of().build(main, cb -> {
            cb.withFlags(ACC_PUBLIC);
            cb.withField("l", CD_long, ACC_PUBLIC | ACC_STATIC);
            cb.withField("d", CD_double, ACC_PUBLIC | ACC_STATIC);
            for (int i = 0; i < NAMES; i++) {
                final int n = i;
                ClassDesc a = type(i);
                ClassDesc b = type((i * 7 + 3) % NAMES);
                cb.withField("s" + n, a, ACC_PUBLIC | ACC_STATIC);
                cb.withMethodBody("g" + n, sig(b, a), ACC_PUBLIC | ACC_STATIC, cob -> cob.return_());
                cb.withMethodBody("k" + n, sig(a.arrayType()), ACC_PUBLIC | ACC_STATIC, cob -> cob.return_());
                cb.withMethodBody("f" + n, sig(a, b), ACC_PUBLIC | ACC_STATIC, cob -> cob
                    .aload(1).aload(0).invokestatic(main, "g" + n, sig(b, a))
                    .aload(0).putstatic(main, "s" + n, a)
                    .getstatic(main, "s" + n, a).pop()
                    .aload(0).putstatic(main, "s" + n, a)
                    .lconst_1().putstatic(main, "l", CD_long)
                    .getstatic(main, "l", CD_long).pop2()
                    .dconst_1().putstatic(main, "d", CD_double)
                    .getstatic(main, "d", CD_double).pop2()
                    .iconst_1().anewarray(a).invokestatic(main, "k" + n, sig(a.arrayType()))
                    .aload(1).aload(0).invokestatic(main, "g" + n, sig(b, a))
                    .return_());
            }
        });
    }

    // bad(a) calls take(b), which takes a class unrelated to a.
    static byte[] wrongName(ClassDesc a, ClassDesc b) {
        ClassDesc main = ClassDesc.of("WrongName");
        return ClassFile.of().build(main, cb -> cb
            .withFlags(ACC_PUBLIC)
            .withMethodBody("take", sig(b), ACC_PUBLIC | ACC_STATIC, cob -> cob.return_())
            .withMethodBody("bad", sig(a), ACC_PUBLIC | ACC_STATIC, cob -> cob
                .aload(0).invokestatic(main, "take", sig(b)).return_()));
    }

    // Two classes with names that only differ in the first characters, passed
    // to a method that expects them in the other order.
    static byte[] similarNames(String name, boolean swap) {
        ClassDesc main = ClassDesc.of(name);
        ClassDesc a = ClassDesc.of("a.pkg.Foo");
        ClassDesc b = ClassDesc.of("b.pkg.Foo");
        return ClassFile.of().build(main, cb -> cb
            .withFlags(ACC_PUBLIC)
            .withMethodBody("take", sig(b, a), ACC_PUBLIC | ACC_STATIC, cob -> cob.return_())
            .withMethodBody("test", sig(a, b), ACC_PUBLIC | ACC_STATIC, cob -> cob
                .aload(swap ? 1 : 0).aload(swap ? 0 : 1).invokestatic(main, "take", sig(b, a)).return_()));
    }

    static void verify(String name, byte[] bytes, String... expectedInError) throws Exception {
        Loader loader = new Loader();
        Class<?> c = loader.define(name, bytes);
        try {
            Class.forName(name, true, loader);
            if (expectedInError.length != 0) {
                throw new RuntimeException(name + " passed verification");
            }
        } catch (VerifyError e) {
            if (expectedInError.length == 0) {
                throw new RuntimeException(name + " failed verification", e);
            }
            for (String s : expectedInError) {
                if (!e.getMessage().contains(s)) {
                    throw new RuntimeException(name + ": no " + s + " in " + e.getMessage(), e);
                }
            }
            System.out.println("Expected: " + e.getMessage().lines().findFirst().get());
        }
    }

    public static void main(String[] args) throws Exception {
        verify("ManyNames", manyNames());
        verify("WrongName", wrongName(type(3), type(70)), "'p/T3'", "'p/T70'");
        verify("Similar1", similarNames("Similar1", true));
        verify("Similar2", similarNames("Similar2", false), "'a/pkg/Foo'", "'b/pkg/Foo'");
    }
}
