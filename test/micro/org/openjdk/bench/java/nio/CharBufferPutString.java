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

package org.openjdk.bench.java.nio;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.CharBuffer;
import java.util.concurrent.TimeUnit;

import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.BenchmarkMode;
import org.openjdk.jmh.annotations.Fork;
import org.openjdk.jmh.annotations.Measurement;
import org.openjdk.jmh.annotations.Mode;
import org.openjdk.jmh.annotations.OutputTimeUnit;
import org.openjdk.jmh.annotations.Param;
import org.openjdk.jmh.annotations.Scope;
import org.openjdk.jmh.annotations.Setup;
import org.openjdk.jmh.annotations.State;
import org.openjdk.jmh.annotations.Warmup;

/** Writes a whole String into a char buffer. */
@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 5, time = 1)
@State(Scope.Thread)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Fork(3)
public class CharBufferPutString {
    @Param({"1", "8", "32", "128", "1024", "32768"})
    public int length;

    /**
     * HEAP (a char array), or a char view of a direct (DIRECT) or heap (VIEW) byte
     * buffer in native or, with _SWAPPED, the opposite byte order.
     */
    @Param({"HEAP", "DIRECT", "DIRECT_SWAPPED", "VIEW", "VIEW_SWAPPED"})
    public String kind;

    @Param({"LATIN1", "UTF16"})
    public String coder;

    private CharBuffer buffer;
    private String text;

    @Setup
    public void setup() {
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append((char) (coder.equals("LATIN1") ? 'a' + i % 26 : 0x3b1 + i % 26));
        }
        text = sb.toString();
        ByteOrder order = ByteOrder.nativeOrder();
        if (kind.endsWith("_SWAPPED")) {
            order = order == ByteOrder.BIG_ENDIAN ? ByteOrder.LITTLE_ENDIAN : ByteOrder.BIG_ENDIAN;
        }
        if (kind.equals("HEAP")) {
            buffer = CharBuffer.allocate(length);
        } else {
            ByteBuffer bytes = kind.startsWith("DIRECT") ? ByteBuffer.allocateDirect(2 * length)
                                                         : ByteBuffer.allocate(2 * length);
            buffer = bytes.order(order).asCharBuffer();
        }
    }

    @Benchmark
    public CharBuffer put() {
        return buffer.clear().put(text);
    }

    @Benchmark
    public CharBuffer append() {
        return buffer.clear().append(text);
    }
}
