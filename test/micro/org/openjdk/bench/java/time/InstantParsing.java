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

package org.openjdk.bench.java.time;

import java.nio.CharBuffer;
import java.time.Instant;
import java.time.format.DateTimeParseException;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;

@State(Scope.Thread)
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 2, time = 300, timeUnit = TimeUnit.MILLISECONDS)
@Measurement(iterations = 3, time = 300, timeUnit = TimeUnit.MILLISECONDS)
@Fork(1)
public class InstantParsing {
    static volatile Object sink;

    @Param({"happy", "mixed", "fallback", "syntax", "calendar", "custom"})
    public String input;

    private CharSequence[] texts;
    private int index;

    @Setup
    public void setup() {
        String[] happy = {
            "2026-10-16T12:34:56Z", "2000-02-29T01:02:03.123456Z",
            "1969-12-31T23:59:59.999999Z", "0000-02-29T12:34:56.000001Z",
            "9999-12-31T23:59:59.9Z", "1970-01-01T00:00:00.01Z",
            "1900-01-01T01:01:01.123Z", "2400-02-29T12:34:56.12345Z"
        };
        String[] fallback = {
            "2000-01-01T00:00:00.1234567Z", "2000-01-01T00:00:00.12345678Z",
            "2000-01-01T00:00:00.123456789Z", "2000-01-01t00:00:00z",
            "2000-01-01T24:00:00Z", "2016-12-31T23:59:60.5Z",
            "2000-01-01T00:00:00+00:00", "2000-01-01T12:34:56-07:30",
            "+10000-01-01T00:00:00Z", "-0001-01-01T00:00:00Z",
            "2000-01-01T00:00:00+00:00:30", "2000-01-01T00:00:00.000000000Z"
        };
        String[] calendar = {"1900-02-29T00:00:00Z", "2000-04-31T00:00:00.1Z"};
        texts = switch (input) {
            case "happy" -> happy;
            case "mixed" -> new String[] {happy[0], happy[1], fallback[0], calendar[0],
                    happy[2], happy[3], fallback[6], calendar[1]};
            case "fallback" -> fallback;
            case "syntax" -> new String[] {
                "2000-00-01T00:00:00Z", "2000-01-00T00:00:00Z",
                "2000-01-01T24:00:01Z", "2000-01-01T00:00:60Z",
                "2000-01-01T00:00:00,1Z", "2000-01-01 00:00:00Z",
                " 2000-01-01T00:00:00Z", "2000-01-01T00:00:00Z ", "", "garbage"
            };
            case "calendar" -> calendar;
            case "custom" -> new CharSequence[] {new StringBuilder(happy[0]),
                    CharBuffer.wrap(happy[1]), new StringBuilder(happy[2]), CharBuffer.wrap(happy[3])};
            default -> throw new IllegalArgumentException(input);
        };
    }

    @Benchmark
    public Object parse() {
        CharSequence text = texts[index];
        if (++index == texts.length) index = 0;
        Object result;
        try {
            result = Instant.parse(text);
        } catch (DateTimeParseException ex) {
            result = ex;
        }
        sink = result;
        return result;
    }
}
