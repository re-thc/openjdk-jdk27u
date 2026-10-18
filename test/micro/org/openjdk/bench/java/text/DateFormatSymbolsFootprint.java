/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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

package org.openjdk.bench.java.text;

import java.lang.instrument.Instrumentation;
import java.lang.management.ManagementFactory;
import java.lang.reflect.Field;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.IdentityHashMap;
import java.util.Locale;
import com.sun.management.ThreadMXBean;

/**
 * Standalone bounded footprint/allocation probe; no JMH dependency is needed.
 * Run with this class as a javaagent to measure shallow sizes of the unique
 * six-field arrays and optional ownership snapshots reachable from a
 * 1000-instance cohort. Strings, zone data, and other cache storage are
 * excluded. Timings are indicative fixed-loop
 * measurements, not a substitute for a JMH performance comparison.
 *
 * From the repository root, using a built JDK:
 * <pre>{@code
 * task_jdk=build/review/jdk
 * task_probe=$(mktemp -d)
 * "$task_jdk/bin/javac" -d "$task_probe/classes" \
 *     test/micro/org/openjdk/bench/java/text/DateFormatSymbolsFootprint.java
 * printf 'Premain-Class: org.openjdk.bench.java.text.DateFormatSymbolsFootprint\n' > "$task_probe/manifest"
 * "$task_jdk/bin/jar" --create --file "$task_probe/probe.jar" \
 *     --manifest "$task_probe/manifest" -C "$task_probe/classes" .
 * for gc in Serial G1 Z; do
 *     "$task_jdk/bin/java" -Xms128m -Xmx128m -XX:ActiveProcessorCount=4 \
 *         "-XX:+Use${gc}GC" --add-opens=java.base/java.text=ALL-UNNAMED \
 *         "-javaagent:$task_probe/probe.jar" -cp "$task_probe/classes" \
 *         org.openjdk.bench.java.text.DateFormatSymbolsFootprint allocation
 * done
 * }</pre>
 * Repeat with each JDK and in fresh JVMs. The optional {@code startup} argument
 * constructs one symbols instance and exits; it needs neither the agent nor
 * the module-opening option.
 * The optional {@code allocation} argument retains the cohorts and measures
 * allocation only, without collecting timings.
 */
public class DateFormatSymbolsFootprint {
    private static Instrumentation instrumentation;
    private static final Object[] keep = new Object[1024];
    private static DateFormatSymbols symbols;
    private static SimpleDateFormat formatter;
    public static void premain(String args, Instrumentation value) {
        instrumentation = value;
    }
    private static Object operation(String mode) {
        return switch (mode) {
            case "symbolsNew" -> new DateFormatSymbols(Locale.US);
            case "symbolsClone" -> symbols.clone();
            case "formatterNew" -> new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US);
            case "formatterClone" -> formatter.clone();
            default -> throw new IllegalArgumentException(mode);
        };
    }
    private static void retained(boolean clones) throws Exception {
        var instances = new DateFormatSymbols[1000];
        var arrays = new IdentityHashMap<Object, Boolean>();
        long slots = 0;
        for (String name : new String[]{"eras", "months", "shortMonths", "weekdays", "shortWeekdays", "ampms"}) {
            Field f = DateFormatSymbols.class.getDeclaredField(name);
            f.setAccessible(true);
            var distinct = new IdentityHashMap<Object, Boolean>();
            for (int i = 0; i < instances.length; ++i) {
                if (instances[i] == null) instances[i] = clones
                        ? (DateFormatSymbols) symbols.clone() : new DateFormatSymbols(Locale.US);
                Object array = f.get(instances[i]);
                distinct.put(array, true);
                if (arrays.put(array, true) == null) slots += ((String[]) array).length;
            }
            System.out.printf("%s distinct=%d%n", name, distinct.size());
        }
        long arrayBytes = arrays.keySet().stream().mapToLong(instrumentation::getObjectSize).sum();
        var snapshots = new IdentityHashMap<Object, Boolean>();
        try {
            Field field = DateFormatSymbols.class.getDeclaredField("sharedSymbolArrays");
            field.setAccessible(true);
            for (var instance : instances) {
                Object snapshot = field.get(instance);
                if (snapshot != null) snapshots.put(snapshot, true);
            }
        } catch (NoSuchFieldException baselineWithoutSnapshots) {
            // The same probe measures the unmodified baseline.
        }
        long snapshotBytes = snapshots.keySet().stream().mapToLong(instrumentation::getObjectSize).sum();
        long instanceBytes = instrumentation.getObjectSize(instances[0]);
        System.out.printf("retained clones=%s arrays=%d slots=%d arrayBytes=%d instanceBytes=%d "
                        + "snapshots=%d snapshotBytes=%d cohortShallowBytes=%d%n",
                clones, arrays.size(), slots, arrayBytes, instanceBytes,
                snapshots.size(), snapshotBytes, instances.length * instanceBytes + arrayBytes + snapshotBytes);
        keep[0] = instances;
    }
    public static void main(String[] args) throws Exception {
        if (args.length != 0 && args[0].equals("startup")) {
            keep[0] = new DateFormatSymbols(Locale.US);
            return;
        }
        if (instrumentation == null) {
            throw new IllegalStateException("Run with -javaagent pointing to this class");
        }
        symbols = new DateFormatSymbols(Locale.US);
        formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US);
        boolean allocationOnly = args.length != 0 && args[0].equals("allocation");
        retained(false);
        retained(true);
        ThreadMXBean bean = (ThreadMXBean) ManagementFactory.getThreadMXBean();
        bean.setThreadAllocatedMemoryEnabled(true);
        long tid = Thread.currentThread().threadId();
        for (String mode : new String[]{"symbolsNew", "symbolsClone", "formatterNew", "formatterClone"}) {
            for (int j = 0; j < 3; j++)
                for (int i = 0; i < 50000; i++) keep[i & 1023] = operation(mode);
            if (allocationOnly) {
                long bytes = bean.getThreadAllocatedBytes(tid);
                for (int i = 0; i < 100000; i++) keep[i & 1023] = operation(mode);
                System.out.printf("%s B/op=%.3f%n", mode,
                        (bean.getThreadAllocatedBytes(tid) - bytes) / 100000.0);
                continue;
            }
            double[] timings = new double[7];
            double[] allocations = new double[7];
            for (int j = 0; j < timings.length; j++) {
                long bytes = bean.getThreadAllocatedBytes(tid);
                long start = System.nanoTime();
                for (int i = 0; i < 100000; i++) keep[i & 1023] = operation(mode);
                timings[j] = (System.nanoTime() - start) / 100000.0;
                allocations[j] = (bean.getThreadAllocatedBytes(tid) - bytes) / 100000.0;
            }
            Arrays.sort(timings);
            Arrays.sort(allocations);
            System.out.printf("%s B/op=%.3f ns/op=%.3f range=%.3f..%.3f%n", mode,
                    allocations[3], timings[3], timings[0], timings[6]);
        }
    }
}
