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
package org.openjdk.bench.java.lang;

import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.BenchmarkMode;
import org.openjdk.jmh.annotations.Fork;
import org.openjdk.jmh.annotations.Level;
import org.openjdk.jmh.annotations.Measurement;
import org.openjdk.jmh.annotations.Mode;
import org.openjdk.jmh.annotations.OperationsPerInvocation;
import org.openjdk.jmh.annotations.OutputTimeUnit;
import org.openjdk.jmh.annotations.Param;
import org.openjdk.jmh.annotations.Scope;
import org.openjdk.jmh.annotations.Setup;
import org.openjdk.jmh.annotations.State;
import org.openjdk.jmh.annotations.Warmup;
import org.openjdk.jmh.infra.Blackhole;

import java.lang.classfile.ClassFile;
import java.lang.classfile.Label;
import java.lang.constant.ClassDesc;
import java.lang.constant.ConstantDescs;
import java.lang.constant.MethodTypeDesc;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import static java.lang.constant.ConstantDescs.CD_Object;
import static java.lang.constant.ConstantDescs.CD_String;
import static java.lang.constant.ConstantDescs.CD_Throwable;
import static java.lang.constant.ConstantDescs.CD_int;
import static java.lang.constant.ConstantDescs.CD_void;

/**
 * Measures definition, verification and initialization of fresh classes.
 * Each invocation defines 100 classes in a new loader; generation runs outside
 * the timed region. Unique names and descriptors force new SymbolTable entries.
 *
 * <p>{@code residentClasses} controls the retained class population and table
 * size. Generated methods include branches, loops, handlers and field accesses
 * to exercise stack-map verification.
 */
@BenchmarkMode(Mode.SingleShotTime)
@OutputTimeUnit(TimeUnit.MICROSECONDS)
@Warmup(iterations = 10)
@Measurement(iterations = 30)
@Fork(value = 5)
@State(Scope.Thread)
public class DefineGeneratedClasses {

    private static final int CLASSES = 100;

    private static final ClassDesc CD_List = ClassDesc.of("java.util.List");
    private static final ClassDesc CD_RuntimeException = ClassDesc.of("java.lang.RuntimeException");
    private static final ClassDesc CD_StringBuilder = ClassDesc.of("java.lang.StringBuilder");

    private static final int METHODS = 6;

    @Param({"0", "25000"})
    public int residentClasses;

    private int generated;
    private Loader loader;
    private String[] names;
    private byte[][] classes;

    // Retain the loader to prevent resident classes from unloading.
    private Loader residentLoader;

    private static final class Loader extends ClassLoader {
        private final Map<String, byte[]> classes = new HashMap<>();

        Loader() {
            super(DefineGeneratedClasses.class.getClassLoader());
        }

        void add(String name, byte[] bytes) {
            classes.put(name, bytes);
        }

        Class<?> define(String name, byte[] bytes) {
            return defineClass(name, bytes, 0, bytes.length);
        }

        @Override
        protected Class<?> findClass(String name) throws ClassNotFoundException {
            byte[] bytes = classes.get(name);
            if (bytes == null) {
                throw new ClassNotFoundException(name);
            }
            return define(name, bytes);
        }
    }

    @Setup(Level.Trial)
    public void defineResidentClasses() {
        residentLoader = new Loader();
        for (int i = 0; i < residentClasses; i++) {
            String name = "resident.Resident" + generated++;
            residentLoader.define(name, generate(name));
        }
    }

    @Setup(Level.Invocation)
    public void generateClasses() {
        loader = new Loader();
        names = new String[CLASSES];
        classes = new byte[CLASSES][];
        for (int i = 0; i < CLASSES; i++) {
            names[i] = "gen.Gen" + generated++;
            classes[i] = generate(names[i]);
            loader.add(names[i], classes[i]);
        }
    }

    @Benchmark
    @OperationsPerInvocation(CLASSES)
    public void define(Blackhole bh) {
        for (int i = 0; i < CLASSES; i++) {
            bh.consume(loader.define(names[i], classes[i]));
        }
    }

    /** Defines the classes, and then verifies and initializes them. */
    @Benchmark
    @OperationsPerInvocation(CLASSES)
    public void defineAndLink(Blackhole bh) throws ClassNotFoundException {
        for (int i = 0; i < CLASSES; i++) {
            bh.consume(Class.forName(names[i], true, loader));
        }
    }

    private static byte[] generate(String name) {
        ClassDesc self = ClassDesc.of(name);
        return ClassFile.of().build(self, clb -> {
            clb.withFlags(ClassFile.ACC_PUBLIC | ClassFile.ACC_SUPER);
            clb.withField("count", CD_int, ClassFile.ACC_PUBLIC);
            clb.withField("text", CD_String, ClassFile.ACC_PUBLIC);
            clb.withField("next", self, ClassFile.ACC_PUBLIC);
            clb.withField("items", CD_Object.arrayType(), ClassFile.ACC_PUBLIC);
            clb.withMethodBody(ConstantDescs.INIT_NAME, ConstantDescs.MTD_void, ClassFile.ACC_PUBLIC, cob -> cob
                    .aload(0)
                    .invokespecial(CD_Object, ConstantDescs.INIT_NAME, ConstantDescs.MTD_void)
                    .return_());
            for (int m = 0; m < METHODS; m++) {
                // Use unique descriptor names without loading the referenced classes.
                clb.withMethod("native" + m, MethodTypeDesc.of(CD_void, ClassDesc.of(name + "$Arg" + m)),
                        ClassFile.ACC_PUBLIC | ClassFile.ACC_STATIC | ClassFile.ACC_NATIVE, mb -> { });
                clb.withMethodBody("run" + m, MethodTypeDesc.of(CD_Object, CD_String, CD_List, self),
                        ClassFile.ACC_PUBLIC, cob -> {
                    // locals: this, text, list, other, builder, sum, i, exception
                    cob.new_(CD_StringBuilder).dup()
                       .invokespecial(CD_StringBuilder, ConstantDescs.INIT_NAME, ConstantDescs.MTD_void)
                       .astore(4);
                    cob.iconst_0().istore(5);
                    cob.trying(tb -> {
                        Label loop = tb.newLabel();
                        Label end = tb.newLabel();
                        Label noText = tb.newLabel();
                        Label next = tb.newLabel();
                        tb.iconst_0().istore(6);
                        tb.labelBinding(loop);
                        tb.iload(6).iconst_4().if_icmpge(end);
                        tb.aload(1).ifnull(noText);
                        tb.aload(4).aload(1)
                          .invokevirtual(CD_StringBuilder, "append", MethodTypeDesc.of(CD_StringBuilder, CD_String))
                          .iload(6)
                          .invokevirtual(CD_StringBuilder, "append", MethodTypeDesc.of(CD_StringBuilder, CD_int))
                          .pop();
                        tb.goto_(next);
                        tb.labelBinding(noText);
                        tb.aload(4).aload(2)
                          .invokeinterface(CD_List, "size", MethodTypeDesc.of(CD_int))
                          .invokevirtual(CD_StringBuilder, "append", MethodTypeDesc.of(CD_StringBuilder, CD_int))
                          .pop();
                        tb.labelBinding(next);
                        tb.iload(5).iload(6).iadd().istore(5);
                        tb.iinc(6, 1);
                        tb.goto_(loop);
                        tb.labelBinding(end);
                        tb.aload(0).iload(5).putfield(self, "count", CD_int);
                        tb.aload(0).aload(3).putfield(self, "next", self);
                        tb.aload(0).aload(4)
                          .invokevirtual(CD_StringBuilder, "toString", MethodTypeDesc.of(CD_String))
                          .putfield(self, "text", CD_String);
                    }, catchb -> catchb.catching(CD_RuntimeException, handler -> handler
                            .astore(7)
                            .aload(4).aload(7)
                            .invokevirtual(CD_Throwable, "getMessage", MethodTypeDesc.of(CD_String))
                            .invokevirtual(CD_StringBuilder, "append", MethodTypeDesc.of(CD_StringBuilder, CD_String))
                            .pop()));
                    cob.aload(4)
                       .invokevirtual(CD_StringBuilder, "toString", MethodTypeDesc.of(CD_String))
                       .areturn();
                });
            }
        });
    }
}
