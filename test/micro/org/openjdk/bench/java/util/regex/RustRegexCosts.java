/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation. Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
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
package org.openjdk.bench.java.util.regex;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.openjdk.jmh.annotations.*;

/** Diagnostic decomposition of the reported 17-character prefix miss. */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@State(Scope.Thread)
@Fork(jvmArgsAppend = "--add-opens=java.base/jdk.internal.util.regex=ALL-UNNAMED")
public class RustRegexCosts {
    private static final MethodHandle COMPILE, HANDLE, MANAGED, RAW, WRAPPER;
    static {
        try {
            Class<?> engine = Class.forName("jdk.internal.util.regex.RustRegex");
            var lookup = MethodHandles.privateLookupIn(engine, MethodHandles.lookup());
            COMPILE = lookup.findStatic(engine, "compile", MethodType.methodType(engine, String.class, int.class))
                    .asType(MethodType.methodType(Object.class, String.class, int.class));
            HANDLE = lookup.findVirtual(engine, "nativeHandle", MethodType.methodType(long.class))
                    .asType(MethodType.methodType(long.class, Object.class));
            MethodType search = MethodType.methodType(int.class, String.class, int[].class,
                    int.class, int.class, int.class, int.class, boolean.class, boolean.class);
            MethodType generic = search.insertParameterTypes(0, Object.class);
            MANAGED = lookup.findVirtual(engine, "match", search).asType(generic);
            WRAPPER = lookup.findVirtual(engine, "nativeMatch", search).asType(generic);
            RAW = lookup.findStatic(engine, "match0",
                    MethodType.methodType(int.class, long.class, byte[].class, int[].class));
        } catch (ReflectiveOperationException error) {
            throw new ExceptionInInitializerError(error);
        }
    }

    private Object engine;
    private Pattern pattern;
    private Matcher matcher;
    private long handle;
    private final String input = "!".repeat(17);
    private final byte[] bytes = input.getBytes(StandardCharsets.ISO_8859_1);
    private final int[] state = new int[6];

    @Setup
    public void setup() throws Throwable {
        engine = (Object) COMPILE.invokeExact("error[0-9]+", 0);
        if (engine == null) throw new AssertionError("native backend unavailable");
        handle = (long) HANDLE.invokeExact(engine);
        if (handle == 0) throw new AssertionError("native preparation");
        pattern = Pattern.compile("error[0-9]+");
        matcher = pattern.matcher(input);
        state[3] = input.length();
        for (int i = 0; i < 16; i++) if (facade()) throw new AssertionError("public miss");
        if (managed() != 0 || rawNative() != 0 || nativeWrapper() != 0)
            throw new AssertionError("component/public miss mismatch");
    }

    @Benchmark public boolean facade() { return matcher.reset().find(); }
    @Benchmark public Matcher resetOnly() { return matcher.reset(); }
    @Benchmark public Matcher matcherAllocation() { return pattern.matcher(input); }
    @Benchmark public Pattern cacheLookup() { return Pattern.compile("error[0-9]+"); }
    @Benchmark public int managed() throws Throwable {
        return (int) MANAGED.invokeExact(engine, input, state, 0, 17, 0, 0, false, true);
    }
    @Benchmark public int rawNative() throws Throwable {
        return (int) RAW.invokeExact(handle, bytes, state);
    }
    @Benchmark public int nativeWrapper() throws Throwable {
        return (int) WRAPPER.invokeExact(engine, input, state, 0, 17, 0, 0, false, true);
    }
}
