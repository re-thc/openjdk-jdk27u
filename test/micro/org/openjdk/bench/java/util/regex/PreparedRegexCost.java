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

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;
import org.openjdk.jmh.annotations.*;

/** Cache-hit calls and isolated reconstruction of a cleared weak backend. */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 2, time = 100, timeUnit = TimeUnit.MILLISECONDS)
@Measurement(iterations = 3, time = 100, timeUnit = TimeUnit.MILLISECONDS)
@Fork(value = 1, jvmArgsAppend = {
        "--add-opens=java.base/java.util.regex=ALL-UNNAMED",
        "--add-opens=java.base/jdk.internal.util.regex=ALL-UNNAMED"})
public class PreparedRegexCost {
    private static String expression(String shape) {
        return switch (shape) {
            case "named" -> "(?<word>error)(?<digits>[0-9]+)";
            case "general" -> "(?<parts>(?:ab|cd)+)[ef]";
            case "leadingClass" -> "[a-z]+suffix";
            case "literal" -> "errorliteral";
            case "unsupported" -> "(?=error)error[0-9]+";
            default -> "error[0-9]+";
        };
    }

    @State(Scope.Thread)
    public static class Cached {
        @Param({"prefix", "named", "general", "leadingClass", "literal", "unsupported"})
        public String shape;
        String expression;
        Pattern retained;

        @Setup
        public void setup() {
            expression = expression(shape);
            retained = Pattern.compile(expression);
        }
    }

    @State(Scope.Thread)
    public static class Expired {
        @Param({"prefix", "named", "general", "leadingClass"})
        public String shape;
        String expression;
        Pattern retained;
        Map<?, ?> cache;
        Object key;
        Field weak;

        @Setup
        public void setup() throws ReflectiveOperationException {
            expression = expression(shape);
            retained = Pattern.compile(expression);
            Field backend = Pattern.class.getDeclaredField("rustRegex");
            backend.setAccessible(true);
            Object engine = backend.get(retained);
            if (engine == null) throw new IllegalStateException("missing native preparation");
            Field entries = Class.forName("jdk.internal.util.regex.RustRegex$CompiledCache")
                    .getDeclaredField("ENTRIES");
            entries.setAccessible(true);
            cache = (Map<?, ?>) entries.get(null);
            synchronized (cache) {
                for (Map.Entry<?, ?> cached : cache.entrySet()) {
                    Object value = cached.getValue();
                    Field candidate = value.getClass().getDeclaredField("engine");
                    candidate.setAccessible(true);
                    Object reference = candidate.get(value);
                    if (reference instanceof WeakReference<?> ref && ref.get() == engine) {
                        key = cached.getKey();
                        weak = candidate;
                        break;
                    }
                }
            }
            if (key == null) throw new IllegalStateException("missing prepared cache entry");
        }

        @Setup(Level.Invocation)
        public void clearWeakSlot() throws IllegalAccessException {
            // Mechanism isolation: clear outside the timed compile. The retained
            // owner prevents native destruction; restored wrappers remain lazy.
            // Older controls replace the entry when restoring the weak slot.
            synchronized (cache) {
                Object entry = cache.get(key);
                if (entry == null) throw new IllegalStateException("prepared entry evicted");
                ((WeakReference<?>) weak.get(entry)).clear();
            }
        }
    }

    @Benchmark
    public Pattern lookup(Cached state) {
        return Pattern.compile(state.expression);
    }

    @Benchmark
    public Pattern restore(Expired state) {
        return Pattern.compile(state.expression);
    }
}
