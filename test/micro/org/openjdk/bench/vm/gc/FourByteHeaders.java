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

package org.openjdk.bench.vm.gc;

import java.util.IdentityHashMap;
import java.util.concurrent.TimeUnit;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;

@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Warmup(iterations = 5, time = 1)
@Measurement(iterations = 5, time = 1)
@Fork(3)
@State(Scope.Thread)
public class FourByteHeaders {
    static final class Cell { int value; Cell(int value) { this.value = value; } }
    Cell[] cells;
    IdentityHashMap<Cell, Integer> identities;
    Object[] retainedMaps;
    int index;

    @Setup(Level.Trial)
    public void setup() {
        cells = new Cell[1024];
        identities = new IdentityHashMap<>(2048);
        retainedMaps = new Object[2048];
        for (int i = 0; i < cells.length; i++) {
            cells[i] = new Cell(i);
            identities.put(cells[i], i);
        }
        // Exercise the stored hash after movement as well as address-derived hashing.
        System.gc();
    }

    @Benchmark public void allocate(Blackhole blackhole) { blackhole.consume(new Cell(42)); }
    @Benchmark public int firstHash() { return System.identityHashCode(new Cell(42)); }
    @Benchmark public int storedHash() { return System.identityHashCode(cells[(index++ & 1023)]); }
    @Benchmark public int identityMapLookup() { return identities.get(cells[(index++ & 1023)]); }
    @Benchmark public IdentityHashMap<Cell, Cell> identityMapChurn() {
        var map = new IdentityHashMap<Cell, Cell>(512);
        for (int i = 0; i < 512; i++) {
            var cell = new Cell(i);
            map.put(cell, cell);
        }
        // Keep hashed objects alive across young collections so this includes
        // copying and hash preservation, rather than only hash computation.
        retainedMaps[index++ & (retainedMaps.length - 1)] = map;
        return map;
    }
}
