/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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

import java.text.DateFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.BenchmarkMode;
import org.openjdk.jmh.annotations.Fork;
import org.openjdk.jmh.annotations.Level;
import org.openjdk.jmh.annotations.Measurement;
import org.openjdk.jmh.annotations.Mode;
import org.openjdk.jmh.annotations.OutputTimeUnit;
import org.openjdk.jmh.annotations.Scope;
import org.openjdk.jmh.annotations.Setup;
import org.openjdk.jmh.annotations.State;
import org.openjdk.jmh.annotations.Warmup;

/**
 * Cost checks separate from the instrumented allocation-only footprint probe.
 * Return values escape through JMH. Formatting/parsing state is private to each
 * worker; only symbolsCloneShared uses a shared, never-mutated prototype.
 * Run that method at one and four workers to expose clone-monitor contention.
 * This read-only prototype scenario is not a concurrent-mutation safety claim.
 */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 7, time = 1)
@Fork(1)
public class DateFormatSymbolsCost {
    private static final String PATTERN = "EEEE, dd MMMM yyyy hh:mm:ss a";
    private static final String EPOCH_TEXT = "Thursday, 01 January 1970 12:00:00 AM";

    @State(Scope.Thread)
    public static class PrivateState {
        DateFormatSymbols symbols;
        SimpleDateFormat formatter;
        Date epoch;

        @Setup(Level.Trial)
        public void setup() throws ParseException {
            symbols = new DateFormatSymbols(Locale.US);
            formatter = new SimpleDateFormat(PATTERN, Locale.US);
            formatter.setTimeZone(TimeZone.getTimeZone("UTC"));
            epoch = new Date(0);
            if (!symbols.equals(symbols.clone())
                    || !EPOCH_TEXT.equals(formatter.format(epoch))
                    || formatter.parse(EPOCH_TEXT).getTime() != 0) {
                throw new AssertionError("Invalid symbols/formatter benchmark state");
            }
        }
    }

    @State(Scope.Benchmark)
    public static class SharedState {
        DateFormatSymbols symbols;

        @Setup(Level.Trial)
        public void setup() {
            symbols = new DateFormatSymbols(Locale.US);
            if (!symbols.equals(symbols.clone())) {
                throw new AssertionError("Invalid shared symbols prototype");
            }
        }
    }

    @Benchmark
    public DateFormatSymbols symbolsNew() {
        return new DateFormatSymbols(Locale.US);
    }

    @Benchmark
    public Object symbolsClone(PrivateState state) {
        return state.symbols.clone();
    }

    @Benchmark
    public Object symbolsCloneShared(SharedState state) {
        return state.symbols.clone();
    }

    @Benchmark
    public SimpleDateFormat formatterNew() {
        return new SimpleDateFormat(PATTERN, Locale.US);
    }

    @Benchmark
    public Object formatterClone(PrivateState state) {
        return state.formatter.clone();
    }

    @Benchmark
    public String formatterFormat(PrivateState state) {
        return state.formatter.format(state.epoch);
    }

    @Benchmark
    public Date formatterParse(PrivateState state) throws ParseException {
        return state.formatter.parse(EPOCH_TEXT);
    }
}
