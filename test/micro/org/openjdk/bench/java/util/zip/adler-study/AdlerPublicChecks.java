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
package org.openjdk.bench.java.util.zip;

/** Untimed checks of the exact benchmark methods; does not invoke JMH. */
public class AdlerPublicChecks {
    public static void main(String[] args) {
        ChecksumPaths bench = new ChecksumPaths();
        for (int size : new int[]{64, 4095, 4096, 4097, 65536, 1048576}) {
            ChecksumPaths.BulkState state = new ChecksumPaths.BulkState();
            state.size = size;
            state.setup();
            int s1 = 1, s2 = 0;
            for (int i = 7; i < size + 7; i++) {
                s1 = (s1 + (state.data[i] & 255)) % 65521;
                s2 = (s2 + s1) % 65521;
            }
            long expected = ((long) s2 << 16) | s1;
            for (int repeat = 0; repeat < 5; repeat++) {
                if (bench.adlerDirect(state) != expected ||
                    state.direct.position() != size + 7 || state.direct.limit() != size + 7) {
                    throw new AssertionError("Public direct mismatch: " + size);
                }
                if (size == 4096 && bench.adlerHeap(state) != expected) {
                    throw new AssertionError("Public heap mismatch");
                }
            }
        }
        System.out.println("Seven public workloads passed untimed checks");
    }
}
