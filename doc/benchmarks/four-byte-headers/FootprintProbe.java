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

public final class FootprintProbe {
    static final class Cell { int value; Cell(int value) { this.value = value; } }
    static Cell[] retained;
    static volatile Object garbage;
    static long graphBytes() {
        long bytes = FootprintAgent.instrumentation.getObjectSize(retained);
        for (Cell cell : retained) bytes += FootprintAgent.instrumentation.getObjectSize(cell);
        return bytes;
    }
    static void collect() { for (int i = 0; i < 3; i++) System.gc(); }
    public static void main(String[] args) {
        int count = 1000000;
        retained = new Cell[count];
        for (int i = 0; i < count; i++) retained[i] = new Cell(i);
        collect();
        long unhashed = graphBytes();
        int[] hashes = new int[count];
        retained = new Cell[count];
        for (int i = 0; i < count; i++) {
            retained[i] = new Cell(i);
            hashes[i] = System.identityHashCode(retained[i]);
            // Leave dead holes to make relocation and hash preservation necessary.
            garbage = new byte[32];
        }
        long before = graphBytes();
        collect();
        long after = graphBytes();
        for (int i = 0; i < count; i++) {
            if (retained[i].value != i || System.identityHashCode(retained[i]) != hashes[i])
                throw new AssertionError("Hash or payload changed at " + i);
        }
        System.out.printf("{\"objects\":%d,\"unhashed_graph_bytes\":%d,\"hashed_before_gc_graph_bytes\":%d,\"hashed_after_gc_graph_bytes\":%d,\"unhashed_cell_bytes\":%d,\"hashed_cell_bytes\":%d}%n",
            count, unhashed, before, after,
            (unhashed - FootprintAgent.instrumentation.getObjectSize(retained)) / count,
            FootprintAgent.instrumentation.getObjectSize(retained[count / 2]));
    }
}
