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

import java.util.Random;
import java.util.concurrent.TimeUnit;
import jdk.internal.util.DecimalDigits;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;

/** End-to-end decimal integer conversions, including exact arrays and consumers. */
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@State(Scope.Thread)
@Warmup(iterations = 3, time = 1)
@Measurement(iterations = 3, time = 1)
@Fork(3)
public class DecimalIntegerConversion {
    private static final int N = 1024;
    @Param({"tiny", "short", "wide", "mixed"})
    public String size;
    private int[] ints;
    private long[] longs, unsignedLongs;
    private String[] intText, longText, unsignedIntText, unsignedLongText;
    private byte[] latin1, utf16;

    @Setup
    public void setup() {
        Random r = new Random(0xDEC1A1L);
        ints = new int[N];
        longs = new long[N];
        unsignedLongs = new long[N];
        intText = new String[N];
        longText = new String[N];
        unsignedIntText = new String[N];
        unsignedLongText = new String[N];
        latin1 = new byte[64];
        utf16 = new byte[128];
        for (int n = 0; n < N; ++n) {
            boolean tiny = size.equals("tiny");
            boolean small = tiny || size.equals("short") || size.equals("mixed") && n % 4 != 0;
            int smallLimit = tiny ? 9 : 999;
            ints[n] = small ? r.nextInt(-smallLimit, smallLimit + 1) : r.nextInt();
            if (small) {
                longs[n] = r.nextInt(-smallLimit, smallLimit + 1);
            } else if (size.startsWith("d")) {
                int count = Integer.parseInt(size.substring(1));
                long low = 1;
                for (int d = 1; d < count; ++d) low *= 10;
                long high = count == 19 ? Long.MAX_VALUE : low * 10;
                longs[n] = r.nextLong(low, high);
                if (r.nextBoolean()) longs[n] = -longs[n];
            } else {
                longs[n] = r.nextLong();
            }
            intText[n] = Integer.toString(ints[n]);
            longText[n] = Long.toString(longs[n]);
            unsignedIntText[n] = Integer.toUnsignedString(small ? Math.abs(ints[n]) : ints[n]);
            unsignedLongs[n] = small ? Math.abs(longs[n]) : longs[n];
            unsignedLongText[n] = Long.toUnsignedString(unsignedLongs[n]);
        }
    }

    @Benchmark @OperationsPerInvocation(N)
    public void parseInt(Blackhole bh) {
        for (String s : intText) bh.consume(Integer.parseInt(s));
    }

    @Benchmark @OperationsPerInvocation(N)
    public void parseLong(Blackhole bh) {
        for (String s : longText) bh.consume(Long.parseLong(s));
    }

    @Benchmark @OperationsPerInvocation(N)
    public void parseUnsignedInt(Blackhole bh) {
        for (String s : unsignedIntText) bh.consume(Integer.parseUnsignedInt(s));
    }

    @Benchmark @OperationsPerInvocation(N)
    public void parseUnsignedLong(Blackhole bh) {
        for (String s : unsignedLongText) bh.consume(Long.parseUnsignedLong(s));
    }

    @Benchmark @OperationsPerInvocation(N)
    public void intString(Blackhole bh) {
        for (int v : ints) bh.consume(Integer.toString(v));
    }

    @Benchmark @OperationsPerInvocation(N)
    public void longString(Blackhole bh) {
        for (long v : longs) bh.consume(Long.toString(v));
    }

    @Benchmark @OperationsPerInvocation(N)
    public void unsignedLongString(Blackhole bh) {
        for (long v : unsignedLongs) bh.consume(Long.toUnsignedString(v));
    }

    @Benchmark @OperationsPerInvocation(N)
    public void intAppend(Blackhole bh) {
        for (int v : ints) bh.consume(new StringBuilder().append('x').append(v).append('y').toString());
    }

    @Benchmark @OperationsPerInvocation(N)
    public void longAppend(Blackhole bh) {
        for (long v : longs) bh.consume(new StringBuilder().append('x').append(v).append('y').toString());
    }

    @Benchmark @OperationsPerInvocation(N)
    public void longAppendUTF16(Blackhole bh) {
        for (long v : longs) bh.consume(new StringBuilder().append('\u20ac').append(v).append('y').toString());
    }

    @Benchmark @OperationsPerInvocation(N)
    public void intConcat(Blackhole bh) {
        for (int v : ints) bh.consume("x" + v + "y");
    }

    @Benchmark @OperationsPerInvocation(N)
    public void longConcat(Blackhole bh) {
        for (long v : longs) bh.consume("x" + v + "y");
    }

    @Benchmark @OperationsPerInvocation(N)
    public void longConcatUTF16(Blackhole bh) {
        for (long v : longs) bh.consume("\u20ac" + v + "y");
    }

    @Benchmark @OperationsPerInvocation(N)
    public void rawIntLatin1(Blackhole bh) {
        for (int v : ints) {
            int start = DecimalDigits.uncheckedGetCharsLatin1(v, 48, latin1);
            bh.consume(start);
            bh.consume(latin1[start]);
        }
    }

    @Benchmark @OperationsPerInvocation(N)
    public void rawLongLatin1(Blackhole bh) {
        for (long v : longs) {
            int start = DecimalDigits.uncheckedGetCharsLatin1(v, 48, latin1);
            bh.consume(start);
            bh.consume(latin1[start]);
        }
    }

    @Benchmark @OperationsPerInvocation(N)
    public void rawIntUTF16(Blackhole bh) {
        for (int v : ints) {
            int start = DecimalDigits.uncheckedGetCharsUTF16(v, 48, utf16);
            bh.consume(start);
            bh.consume(utf16[start * 2]);
        }
    }

    @Benchmark @OperationsPerInvocation(N)
    public void rawLongUTF16(Blackhole bh) {
        for (long v : longs) {
            int start = DecimalDigits.uncheckedGetCharsUTF16(v, 48, utf16);
            bh.consume(start);
            bh.consume(utf16[start * 2]);
        }
    }
}
