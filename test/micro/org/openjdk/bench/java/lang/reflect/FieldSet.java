/*
 * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
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
package org.openjdk.bench.java.lang.reflect;

import java.lang.reflect.Field;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.ThreadLocalRandom;

import org.openjdk.jmh.annotations.*;

@BenchmarkMode(Mode.AverageTime)
@State(Scope.Benchmark)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 10, time = 1, timeUnit = TimeUnit.SECONDS)
@Measurement(iterations = 10, time = 2, timeUnit = TimeUnit.SECONDS)
@Fork(3)
public class FieldSet {

    static class FieldHolder {
        static Object staticObj;
        static int staticInt;
        static long staticLong;
        Object obj;
        int intValue;
        long longValue;
        FieldHolder(Object obj, int i, long l) {
            this.obj = obj;
            this.intValue = i;
            this.longValue = l;
        }
    }

    static class FinalFieldHolder {
        final Object obj;
        final int intValue;
        final long longValue;
        FinalFieldHolder(Object obj, int i, long l) {
            this.obj = obj;
            this.intValue = i;
            this.longValue = l;
        }
    }

    // the Fields of the Const, Var and Poly benchmarks below: eight fields of each type
    static class PolyHolder {
        Object o0, o1, o2, o3, o4, o5, o6, o7;
        int i0, i1, i2, i3, i4, i5, i6, i7;
        long l0, l1, l2, l3, l4, l5, l6, l7;
        static Object so0, so1, so2, so3, so4, so5, so6, so7;
        static int si0, si1, si2, si3, si4, si5, si6, si7;
        static long sl0, sl1, sl2, sl3, sl4, sl5, sl6, sl7;
    }

    private static Field field(Class<?> c, String name) {
        try {
            Field f = c.getDeclaredField(name);
            f.setAccessible(true);
            return f;
        } catch (NoSuchFieldException e) {
            throw new NoSuchFieldError(e.getMessage());
        }
    }

    private static Field[] fields(String prefix) {
        Field[] fs = new Field[8];
        for (int i = 0; i < fs.length; i++) {
            fs[i] = field(PolyHolder.class, prefix + i);
        }
        return fs;
    }

    // Const: the Field is a constant for the JIT, so is the accessor and its method handles
    static final Field CONST_OBJ = field(FieldHolder.class, "obj");
    static final Field CONST_INT = field(FieldHolder.class, "intValue");
    static final Field CONST_LONG = field(FieldHolder.class, "longValue");
    static final Field CONST_STATIC_OBJ = field(FieldHolder.class, "staticObj");
    static final Field CONST_STATIC_INT = field(FieldHolder.class, "staticInt");
    static final Field CONST_STATIC_LONG = field(FieldHolder.class, "staticLong");

    private FieldHolder fieldHolder;
    private FinalFieldHolder finalFieldHolder;
    private PolyHolder polyHolder;
    private Object value;
    private Integer boxedValue;
    private int counter;
    private int index;

    // Var: the Field is in a mutable field
    private Field varObj, varInt, varLong, varStaticObj, varStaticInt, varStaticLong;

    // Poly: several Fields of the same type are used at one call site
    private Field[] polyObj, polyInt, polyLong, polyStaticObj, polyStaticInt, polyStaticLong;

    private Field objField1, objField2, objField3;
    private Field intField1, intField2, intField3;
    private Field longField1, longField2, longField3;

    @Setup
    public void setup() throws Exception {
        fieldHolder = new FieldHolder(new Object(), 1, 1L);
        finalFieldHolder = new FinalFieldHolder(new Object(), 1, 1L);
        polyHolder = new PolyHolder();
        value = new Object();
        boxedValue = 1000;

        varObj = field(FieldHolder.class, "obj");
        varInt = field(FieldHolder.class, "intValue");
        varLong = field(FieldHolder.class, "longValue");
        varStaticObj = field(FieldHolder.class, "staticObj");
        varStaticInt = field(FieldHolder.class, "staticInt");
        varStaticLong = field(FieldHolder.class, "staticLong");

        polyObj = fields("o");
        polyInt = fields("i");
        polyLong = fields("l");
        polyStaticObj = fields("so");
        polyStaticInt = fields("si");
        polyStaticLong = fields("sl");

        // non-final && !override
        objField1 = FieldHolder.class.getDeclaredField("obj");
        intField1 = FieldHolder.class.getDeclaredField("intValue");
        longField1 = FieldHolder.class.getDeclaredField("longValue");

        // non-final && override
        objField2 = FieldHolder.class.getDeclaredField("obj");
        objField2.setAccessible(true);
        intField2 = FieldHolder.class.getDeclaredField("intValue");
        intField2.setAccessible(true);
        longField2 = FieldHolder.class.getDeclaredField("longValue");
        longField2.setAccessible(true);

        // final && override
        objField3 = FinalFieldHolder.class.getDeclaredField("obj");
        objField3.setAccessible(true);
        intField3 = FinalFieldHolder.class.getDeclaredField("intValue");
        intField3.setAccessible(true);
        longField3 = FinalFieldHolder.class.getDeclaredField("longValue");
        longField3.setAccessible(true);
    }

    // non-final && !override

    @Benchmark
    public void setNonFinalObjectField() throws Exception {
        objField1.set(fieldHolder, new Object());
    }

    @Benchmark
    public void setNonFinalIntField() throws Exception {
        int newValue = ThreadLocalRandom.current().nextInt();
        intField1.setInt(fieldHolder, newValue);
    }

    @Benchmark
    public void setNonFinalLongField() throws Exception {
        long newValue = ThreadLocalRandom.current().nextLong();
        longField1.setLong(fieldHolder, newValue);
    }

    // non-final && override

    @Benchmark
    public void setNonFinalObjectFieldWithOverride() throws Exception {
        objField2.set(fieldHolder, new Object());
    }

    @Benchmark
    public void setNonFinalIntFieldWithOverride() throws Exception {
        int newValue = ThreadLocalRandom.current().nextInt();
        intField2.setInt(fieldHolder, newValue);
    }

    @Benchmark
    public void setNonFinalLongFieldWithOverride() throws Exception {
        long newValue = ThreadLocalRandom.current().nextLong();
        longField2.setLong(fieldHolder, newValue);
    }

    // final && override

    @Benchmark
    public void setFinalObjectField()throws Exception {
        objField3.set(finalFieldHolder, new Object());
    }

    @Benchmark
    public void setFinalIntField() throws Exception {
        int newValue = ThreadLocalRandom.current().nextInt();
        intField3.setInt(finalFieldHolder, newValue);
    }

    @Benchmark
    public void setFinalLongField() throws Exception {
        long newValue = ThreadLocalRandom.current().nextLong();
        longField3.setLong(finalFieldHolder, newValue);
    }

    // Writes (and, as a control, reads) of non-final fields that are Const, Var or Poly.
    // The set of a boxed int is Field.set with an Integer for an int field.

    @Benchmark
    public void setInstanceConstObject() throws Exception {
        CONST_OBJ.set(fieldHolder, value);
    }

    @Benchmark
    public Object getInstanceConstObject() throws Exception {
        return CONST_OBJ.get(fieldHolder);
    }

    @Benchmark
    public void setInstanceConstInt() throws Exception {
        CONST_INT.setInt(fieldHolder, counter++);
    }

    @Benchmark
    public void setInstanceConstBoxedInt() throws Exception {
        CONST_INT.set(fieldHolder, boxedValue);
    }

    @Benchmark
    public int getInstanceConstInt() throws Exception {
        return CONST_INT.getInt(fieldHolder);
    }

    @Benchmark
    public void setInstanceConstLong() throws Exception {
        CONST_LONG.setLong(fieldHolder, counter++);
    }

    @Benchmark
    public long getInstanceConstLong() throws Exception {
        return CONST_LONG.getLong(fieldHolder);
    }

    @Benchmark
    public void setInstanceVarObject() throws Exception {
        varObj.set(fieldHolder, value);
    }

    @Benchmark
    public Object getInstanceVarObject() throws Exception {
        return varObj.get(fieldHolder);
    }

    @Benchmark
    public void setInstanceVarInt() throws Exception {
        varInt.setInt(fieldHolder, counter++);
    }

    @Benchmark
    public void setInstanceVarBoxedInt() throws Exception {
        varInt.set(fieldHolder, boxedValue);
    }

    @Benchmark
    public int getInstanceVarInt() throws Exception {
        return varInt.getInt(fieldHolder);
    }

    @Benchmark
    public void setInstanceVarLong() throws Exception {
        varLong.setLong(fieldHolder, counter++);
    }

    @Benchmark
    public long getInstanceVarLong() throws Exception {
        return varLong.getLong(fieldHolder);
    }

    @Benchmark
    public void setInstancePolyObject() throws Exception {
        polyObj[index++ & 7].set(polyHolder, value);
    }

    @Benchmark
    public Object getInstancePolyObject() throws Exception {
        return polyObj[index++ & 7].get(polyHolder);
    }

    @Benchmark
    public void setInstancePolyInt() throws Exception {
        polyInt[index++ & 7].setInt(polyHolder, counter++);
    }

    @Benchmark
    public void setInstancePolyBoxedInt() throws Exception {
        polyInt[index++ & 7].set(polyHolder, boxedValue);
    }

    @Benchmark
    public int getInstancePolyInt() throws Exception {
        return polyInt[index++ & 7].getInt(polyHolder);
    }

    @Benchmark
    public void setInstancePolyLong() throws Exception {
        polyLong[index++ & 7].setLong(polyHolder, counter++);
    }

    @Benchmark
    public long getInstancePolyLong() throws Exception {
        return polyLong[index++ & 7].getLong(polyHolder);
    }

    @Benchmark
    public void setStaticConstObject() throws Exception {
        CONST_STATIC_OBJ.set(null, value);
    }

    @Benchmark
    public Object getStaticConstObject() throws Exception {
        return CONST_STATIC_OBJ.get(null);
    }

    @Benchmark
    public void setStaticConstInt() throws Exception {
        CONST_STATIC_INT.setInt(null, counter++);
    }

    @Benchmark
    public void setStaticConstBoxedInt() throws Exception {
        CONST_STATIC_INT.set(null, boxedValue);
    }

    @Benchmark
    public int getStaticConstInt() throws Exception {
        return CONST_STATIC_INT.getInt(null);
    }

    @Benchmark
    public void setStaticConstLong() throws Exception {
        CONST_STATIC_LONG.setLong(null, counter++);
    }

    @Benchmark
    public long getStaticConstLong() throws Exception {
        return CONST_STATIC_LONG.getLong(null);
    }

    @Benchmark
    public void setStaticVarObject() throws Exception {
        varStaticObj.set(null, value);
    }

    @Benchmark
    public Object getStaticVarObject() throws Exception {
        return varStaticObj.get(null);
    }

    @Benchmark
    public void setStaticVarInt() throws Exception {
        varStaticInt.setInt(null, counter++);
    }

    @Benchmark
    public void setStaticVarBoxedInt() throws Exception {
        varStaticInt.set(null, boxedValue);
    }

    @Benchmark
    public int getStaticVarInt() throws Exception {
        return varStaticInt.getInt(null);
    }

    @Benchmark
    public void setStaticVarLong() throws Exception {
        varStaticLong.setLong(null, counter++);
    }

    @Benchmark
    public long getStaticVarLong() throws Exception {
        return varStaticLong.getLong(null);
    }

    @Benchmark
    public void setStaticPolyObject() throws Exception {
        polyStaticObj[index++ & 7].set(null, value);
    }

    @Benchmark
    public Object getStaticPolyObject() throws Exception {
        return polyStaticObj[index++ & 7].get(null);
    }

    @Benchmark
    public void setStaticPolyInt() throws Exception {
        polyStaticInt[index++ & 7].setInt(null, counter++);
    }

    @Benchmark
    public void setStaticPolyBoxedInt() throws Exception {
        polyStaticInt[index++ & 7].set(null, boxedValue);
    }

    @Benchmark
    public int getStaticPolyInt() throws Exception {
        return polyStaticInt[index++ & 7].getInt(null);
    }

    @Benchmark
    public void setStaticPolyLong() throws Exception {
        polyStaticLong[index++ & 7].setLong(null, counter++);
    }

    @Benchmark
    public long getStaticPolyLong() throws Exception {
        return polyStaticLong[index++ & 7].getLong(null);
    }
}
