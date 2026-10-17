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

import com.sun.management.ThreadMXBean;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.lang.management.ManagementFactory;
import java.text.DateFormatSymbols;
import java.text.NumberFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.Phaser;

/**
 * Fixed one-case-per-JVM qualification fixture. Use the adjacent Python runner
 * and documented protocol. This standard-JDK harness is not a JMH substitute
 * for arbitrary work: its scope, fork budget and decision gates are fixed.
 * Fixture creation and the valid round-trip assertion are outside timing.
 */
public class DateFormatSymbolsQualification {
    private static final String PATTERN = "yyyy-MM-dd HH:mm:ss";
    private static final String TEXT_PATTERN = "G yyyy MMMM dd EEEE HH:mm:ss";
    private static volatile Object sink;

    @FunctionalInterface
    private interface Operation {
        Object run() throws Exception;
    }

    @SuppressWarnings("serial")
    private static class SymbolsSubclass extends DateFormatSymbols {
        SymbolsSubclass() {
            super(Locale.US);
        }
    }

    private static DateFormatSymbols symbols() {
        DateFormatSymbols value = new DateFormatSymbols(Locale.US);
        value.setZoneStrings(new String[][] {{"GMT", "GMT", "GMT", "GMT", "GMT"}});
        return value;
    }

    private static byte[] serialize(DateFormatSymbols value) throws Exception {
        var bytes = new ByteArrayOutputStream();
        try (var stream = new ObjectOutputStream(bytes)) {
            stream.writeObject(value);
        }
        return bytes.toByteArray();
    }

    private static DateFormatSymbols shared(String mode) throws Exception {
        DateFormatSymbols value;
        switch (mode) {
            case "symbolsCloneShared":
                return new DateFormatSymbols(Locale.US);
            case "symbolsCloneSerialized", "serializeRepeated":
                value = symbols();
                serialize(value);
                return value;
            case "symbolsCloneZones":
                value = new DateFormatSymbols(Locale.US);
                value.getZoneStrings();
                return value;
            case "symbolsCloneDeserialized":
                try (var stream = new ObjectInputStream(
                        new ByteArrayInputStream(serialize(symbols())))) {
                    return (DateFormatSymbols) stream.readObject();
                }
            case "symbolsCloneSubclass":
                value = new SymbolsSubclass();
                value.setZoneStrings(new String[][] {{"GMT", "GMT", "GMT", "GMT", "GMT"}});
                return value;
            default:
                return null;
        }
    }

    private static SimpleDateFormat formatter(Locale locale, boolean text) {
        var value = new SimpleDateFormat(text ? TEXT_PATTERN : PATTERN,
                new DateFormatSymbols(locale));
        value.setTimeZone(TimeZone.getTimeZone("UTC"));
        value.setLenient(false);
        return value;
    }

    private static Operation operation(String mode, DateFormatSymbols shared)
            throws Exception {
        switch (mode) {
            case "symbolsNew":
                return () -> new DateFormatSymbols(Locale.US);
            case "symbolsClone": {
                var value = new DateFormatSymbols(Locale.US);
                return value::clone;
            }
            case "symbolsCloneShared", "symbolsCloneSerialized", "symbolsCloneZones",
                    "symbolsCloneDeserialized", "symbolsCloneSubclass":
                // Always clone this original fixture. Replacing it with a
                // returned clone would promote fallback copies to trusted data.
                return shared::clone;
            case "formatterNewLocale":
                return () -> new SimpleDateFormat(PATTERN, Locale.US);
            case "formatterNewSymbols": {
                var value = new DateFormatSymbols(Locale.US);
                return () -> new SimpleDateFormat(PATTERN, value);
            }
            case "formatterClone": {
                var value = formatter(Locale.US, false);
                return value::clone;
            }
            case "formatUS", "parseUS", "formatJA", "parseJA", "parseInvalid": {
                Locale locale = mode.endsWith("JA") ? Locale.JAPAN : Locale.US;
                var value = formatter(locale, true);
                var epoch = new Date(0);
                String text = value.format(epoch);
                if (!value.parse(text).equals(epoch)) {
                    throw new AssertionError("Fixture round trip");
                }
                if (mode.startsWith("format")) {
                    return () -> value.format(epoch);
                }
                if (mode.equals("parseInvalid")) {
                    return () -> {
                        var position = new ParsePosition(0);
                        if (value.parse("invalid-date", position) != null
                                || position.getErrorIndex() < 0) {
                            throw new AssertionError("Invalid parse accepted");
                        }
                        return position;
                    };
                }
                return () -> value.parse(text);
            }
            case "serializeFresh":
                return () -> serialize(symbols());
            case "serializeRepeated":
                // A fresh stream on every call avoids serialization backrefs.
                return () -> serialize(shared);
            case "calendarControl":
                return () -> Calendar.getInstance(Locale.US);
            case "numberCloneControl": {
                NumberFormat value = NumberFormat.getIntegerInstance(Locale.US);
                return value::clone;
            }
            default:
                throw new IllegalArgumentException(mode);
        }
    }

    private static final class PhaseClock extends Phaser {
        private volatile long start;
        private volatile long deadline;

        PhaseClock(int parties) {
            super(parties);
        }

        @Override
        protected boolean onAdvance(int phase, int registeredParties) {
            if ((phase & 1) == 0) {
                start = System.nanoTime();
                deadline = start + (phase == 0 ? 3_000_000_000L : 1_000_000_000L);
            }
            return false;
        }
    }

    private static final class Worker implements Runnable {
        private final Operation operation;
        private final PhaseClock phases;
        private final ThreadMXBean allocation;
        private final long[] counts = new long[5];
        private final long[] nanos = new long[5];
        private final long[] bytes = new long[5];
        private volatile Throwable failure;

        Worker(Operation operation, PhaseClock phases, ThreadMXBean allocation) {
            this.operation = operation;
            this.phases = phases;
            this.allocation = allocation;
        }

        @Override
        public void run() {
            try {
                var keep = new Object[256];
                long thread = Thread.currentThread().threadId();
                for (int phase = -1; phase < 5; phase++) {
                    if (phases.arriveAndAwaitAdvance() < 0) {
                        return;
                    }
                    long before = allocation.getThreadAllocatedBytes(thread);
                    long start = phases.start;
                    long deadline = phases.deadline;
                    long count = 0;
                    do {
                        for (int batch = 0; batch < 64; batch++) {
                            keep[(int) count++ & 255] = operation.run();
                        }
                    } while (System.nanoTime() - deadline < 0);
                    long elapsed = System.nanoTime() - start;
                    long allocated = allocation.getThreadAllocatedBytes(thread) - before;
                    if (phase >= 0) {
                        counts[phase] = count;
                        nanos[phase] = elapsed;
                        bytes[phase] = allocated;
                    }
                    if (phases.arriveAndAwaitAdvance() < 0) {
                        return;
                    }
                }
                sink = keep;
            } catch (Throwable t) {
                failure = t;
                phases.forceTermination();
            }
        }
    }

    public static void main(String[] args) throws Exception {
        String mode = args[0];
        int threads = Integer.parseInt(args[1]);
        if (threads != 1 && threads != 4) {
            throw new IllegalArgumentException("Only one or four workers");
        }
        DateFormatSymbols shared = shared(mode);
        var bean = (ThreadMXBean) ManagementFactory.getThreadMXBean();
        if (!bean.isThreadAllocatedMemorySupported()) {
            throw new UnsupportedOperationException("Thread allocation counting");
        }
        bean.setThreadAllocatedMemoryEnabled(true);
        var phases = new PhaseClock(threads + 1);
        Worker[] workers = new Worker[threads];
        Thread[] running = new Thread[threads];
        for (int index = 0; index < threads; index++) {
            workers[index] = new Worker(operation(mode, shared), phases, bean);
        }
        for (int index = 0; index < threads; index++) {
            running[index] = Thread.ofPlatform().start(workers[index]);
        }
        for (int phase = -1; phase < 5; phase++) {
            if (phases.arriveAndAwaitAdvance() < 0
                    || phases.arriveAndAwaitAdvance() < 0) {
                break;
            }
        }
        for (int index = 0; index < threads; index++) {
            running[index].join();
            if (workers[index].failure != null) {
                throw new AssertionError(workers[index].failure);
            }
        }
        double[] ns = new double[5];
        double[] bytes = new double[5];
        for (int sample = 0; sample < 5; sample++) {
            long count = 0;
            long elapsed = 0;
            long allocated = 0;
            for (Worker worker : workers) {
                count += worker.counts[sample];
                elapsed = Math.max(elapsed, worker.nanos[sample]);
                allocated += worker.bytes[sample];
            }
            ns[sample] = (double) elapsed / count;
            bytes[sample] = (double) allocated / count;
        }
        System.out.printf(Locale.ROOT,
                "{\"mode\":\"%s\",\"threads\":%d,\"nsPerOp\":%s,\"bytesPerOp\":%s}%n",
                mode, threads, Arrays.toString(ns), Arrays.toString(bytes));
    }

    /** Separate entry point so the no-op control does not initialize fixtures. */
    public static class Startup {
        public static void main(String[] args) {
            switch (args[0]) {
                case "noop":
                    sink = new Object();
                    break;
                case "symbols":
                    sink = new DateFormatSymbols(Locale.US);
                    break;
                case "formatter":
                    sink = new SimpleDateFormat(PATTERN, Locale.US).clone();
                    break;
                default:
                    throw new IllegalArgumentException(args[0]);
            }
        }
    }
}
