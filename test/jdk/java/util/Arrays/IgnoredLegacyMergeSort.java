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

/*
 * @test
 * @summary The former legacy merge sort property does not change object sorting
 * @library /test/lib
 * @run driver IgnoredLegacyMergeSort
 */

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

import jdk.test.lib.process.ProcessTools;

public class IgnoredLegacyMergeSort {
    private static final String PROPERTY = "java.util.Arrays.useLegacyMergeSort";
    private static long comparisons;
    private static long trace;

    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            probe();
            return;
        }

        var expected = run(null);
        for (String value : List.of("false", "true")) {
            var actual = run(value);
            if (!actual.equals(expected)) {
                throw new AssertionError(PROPERTY + "=" + value
                        + " changed the comparison trace\nExpected: " + expected
                        + "\nActual: " + actual);
            }
        }
    }

    private static List<String> run(String value) throws Exception {
        var command = new ArrayList<String>();
        if (value != null) {
            command.add("-D" + PROPERTY + "=" + value);
        }
        command.add(IgnoredLegacyMergeSort.class.getName());
        command.add("probe");
        var output = ProcessTools.executeTestJava(command.toArray(String[]::new))
                .shouldHaveExitValue(0);
        var lines = output.getStdout().lines()
                .filter(line -> line.startsWith("TRACE ")).toList();
        if (lines.size() != 60) {
            throw new AssertionError("Incomplete probe output: " + lines);
        }
        return lines;
    }

    private static void probe() {
        for (int length : new int[] {0, 1, 7, 8, 31, 32, 33, 64, 128, 1024}) {
            for (int mode = 0; mode < 6; mode++) {
                Value[] values = new Value[length];
                for (int i = 0; i < length; i++) {
                    // Repeated keys exercise stability; IDs identify input positions.
                    values[i] = new Value(Integer.rotateLeft(i * 0x9e3779b9, 13) >>> 27, i);
                }
                Value[] original = values.clone();
                int from = mode % 2 == 0 ? 0 : length / 4;
                int to = mode % 2 == 0 ? length : length - length / 4;
                comparisons = 0;
                trace = 0;
                Comparator<Value> comparator = IgnoredLegacyMergeSort::compare;
                switch (mode) {
                    case 0 -> Arrays.sort(values);
                    case 1 -> Arrays.sort(values, from, to);
                    case 2 -> Arrays.sort(values, comparator);
                    case 3 -> Arrays.sort(values, from, to, comparator);
                    case 4 -> Arrays.sort(values, (Comparator<Value>) null);
                    case 5 -> Arrays.sort(values, from, to, null);
                }
                check(values, original, from, to);
                // Compare executions, without specifying any algorithm's trace.
                System.out.println("TRACE " + length + " " + mode + " "
                        + comparisons + " " + trace);
            }
        }
    }

    private static int compare(Value left, Value right) {
        comparisons++;
        trace = Long.rotateLeft(trace, 7) ^ ((long) left.id << 32) ^ right.id;
        return Integer.compare(left.key, right.key);
    }

    private static void check(Value[] values, Value[] original, int from, int to) {
        boolean[] seen = new boolean[values.length];
        for (int i = 0; i < values.length; i++) {
            Value value = values[i];
            if (i < from || i >= to) {
                if (value != original[i]) {
                    throw new AssertionError("Changed element outside the sorted range");
                }
            } else {
                if (value.id < from || value.id >= to || seen[value.id]) {
                    throw new AssertionError("Sorted range is not a permutation of its input");
                }
                seen[value.id] = true;
                if (i > from && (values[i - 1].key > value.key
                        || values[i - 1].key == value.key && values[i - 1].id > value.id)) {
                    throw new AssertionError("Incorrect ordering or unstable sort");
                }
            }
        }
    }

    private record Value(int key, int id) implements Comparable<Value> {
        @Override
        public int compareTo(Value other) {
            return compare(this, other);
        }
    }
}
