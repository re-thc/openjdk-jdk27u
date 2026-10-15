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
 * @summary Classes whose constant pools have new, shared, duplicate and dead
 *          names are defined correctly, also by many threads at once.
 * @library /test/lib
 * @run main/othervm -Xlog:symboltable=info BatchedInterning
 */

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.lang.constant.ConstantDescs;
import java.lang.constant.MethodTypeDesc;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.TreeSet;
import java.util.concurrent.Phaser;
import java.util.concurrent.atomic.AtomicReference;

import jdk.test.lib.Asserts;

public class BatchedInterning {
    static final int THREADS = 8;
    static final int ROUNDS = 20;
    // More names than the SymbolTable looks up side by side.
    static final int NAMES = 300;

    static class Loader extends ClassLoader {
        Loader() {
            super(BatchedInterning.class.getClassLoader());
        }

        Class<?> define(String name, byte[] bytes) {
            return defineClass(name, bytes, 0, bytes.length);
        }
    }

    public static void main(String[] args) throws Exception {
        testDuplicateNames();
        testConcurrentNames();
    }

    // A class file with two Utf8 entries of the same new name, used as the names of two fields.
    static void testDuplicateNames() throws Exception {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        DataOutputStream out = new DataOutputStream(bytes);
        out.writeInt(0xCAFEBABE);
        out.writeShort(0);
        out.writeShort(52);
        String[] utf8 = { "DuplicateNames", "java/lang/Object", "batchedInterningDuplicate",
                          "batchedInterningDuplicate", "I", "J" };
        out.writeShort(1 + utf8.length + 2);
        for (String s : utf8) {
            out.writeByte(1);  // CONSTANT_Utf8, at 1 to 6
            out.writeUTF(s);
        }
        out.writeByte(7);      // CONSTANT_Class #7
        out.writeShort(1);
        out.writeByte(7);      // CONSTANT_Class #8
        out.writeShort(2);
        out.writeShort(0x0021);  // ACC_PUBLIC | ACC_SUPER
        out.writeShort(7);
        out.writeShort(8);
        out.writeShort(0);     // interfaces
        out.writeShort(2);     // fields
        for (int i = 0; i < 2; i++) {
            out.writeShort(0x0009);  // ACC_PUBLIC | ACC_STATIC
            out.writeShort(3 + i);
            out.writeShort(5 + i);
            out.writeShort(0);
        }
        out.writeShort(0);     // methods
        out.writeShort(0);     // attributes
        out.flush();

        Class<?> c = new Loader().define("DuplicateNames", bytes.toByteArray());
        Field[] fields = c.getDeclaredFields();
        Asserts.assertEquals(fields.length, 2);
        for (Field f : fields) {
            Asserts.assertEquals(f.getName(), "batchedInterningDuplicate");
        }
        Asserts.assertNotEquals(fields[0].getType(), fields[1].getType());
    }

    // A class with a method of each name, in an order of its own, which calls
    // a method of the JDK so that its constant pool also has shared names.
    static byte[] generate(String className, List<String> names) {
        return ClassFile.of().build(ClassDesc.of(className), cb -> {
            for (String name : names) {
                cb.withMethodBody(name, MethodTypeDesc.of(ConstantDescs.CD_String), ClassFile.ACC_PUBLIC | ClassFile.ACC_STATIC,
                                  code -> code.ldc(name)
                                              .invokevirtual(ConstantDescs.CD_String, "intern", MethodTypeDesc.of(ConstantDescs.CD_String))
                                              .areturn());
            }
        });
    }

    // Threads define classes with the same new names at the same time. Each
    // round has names that no class of earlier rounds used, and classes of
    // earlier rounds become unreachable, so that their names die.
    static void testConcurrentNames() throws Exception {
        // A Phaser rather than a CyclicBarrier: when a worker fails, terminating
        // it releases the others at once, while a reset barrier would wait for
        // the failed worker forever.
        Phaser phaser = new Phaser(THREADS);
        AtomicReference<Throwable> failure = new AtomicReference<>();
        List<Thread> threads = new ArrayList<>();
        for (int t = 0; t < THREADS; t++) {
            final int thread = t;
            threads.add(new Thread(() -> {
                try {
                    Random random = new Random(thread);
                    for (int round = 0; round < ROUNDS; round++) {
                        List<String> names = new ArrayList<>();
                        for (int i = 0; i < NAMES; i++) {
                            names.add("batchedInterning" + (round % 4) + "_" + i);
                        }
                        Collections.shuffle(names, random);
                        String className = "Generated" + thread;
                        byte[] bytes = generate(className, names);
                        if (phaser.arriveAndAwaitAdvance() < 0) {
                            return;  // another worker failed
                        }
                        Class<?> c = new Loader().define(className, bytes);
                        TreeSet<String> declared = new TreeSet<>();
                        for (Method m : c.getDeclaredMethods()) {
                            declared.add(m.getName());
                            Asserts.assertEquals(m.invoke(null), m.getName());
                        }
                        Asserts.assertEquals(declared, new TreeSet<>(names));
                        if (round % 4 == 3) {
                            System.gc();
                        }
                    }
                } catch (Throwable e) {
                    // Keep the first failure, the others are often its consequences.
                    if (!failure.compareAndSet(null, e)) {
                        failure.get().addSuppressed(e);
                    }
                    phaser.forceTermination();
                    threads.forEach(Thread::interrupt);
                }
            }));
        }
        threads.forEach(Thread::start);
        for (Thread t : threads) {
            t.join();
        }
        if (failure.get() != null) {
            throw new RuntimeException("A worker failed", failure.get());
        }
    }
}
