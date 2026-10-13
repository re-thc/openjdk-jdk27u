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
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 */

/*
 * @test
 * @summary Same-lane reinterpretation must not materialize redundant vectors in Java fallback paths
 * @modules jdk.incubator.vector jdk.management
 * @library /test/lib
 * @run main/othervm -Xint SelfReinterpretAllocation
 * @run main/othervm -XX:TieredStopAtLevel=1 SelfReinterpretAllocation
 */

import com.sun.management.ThreadMXBean;
import java.lang.management.ManagementFactory;
import jdk.incubator.vector.*;
import jtreg.SkippedException;

public class SelfReinterpretAllocation {
    private static volatile Object escape;

    private static Vector<?> view(Vector<?> v, int type) {
        return switch (type) {
            case 0 -> v.reinterpretAsBytes();
            case 1 -> v.reinterpretAsShorts();
            case 2 -> v.reinterpretAsInts();
            case 3 -> v.reinterpretAsLongs();
            case 4 -> v.reinterpretAsFloats();
            case 5 -> v.reinterpretAsDoubles();
            default -> throw new AssertionError(type);
        };
    }

    public static void main(String[] args) {
        ThreadMXBean bean = (ThreadMXBean) ManagementFactory.getThreadMXBean();
        if (!bean.isThreadAllocatedMemorySupported()) {
            throw new SkippedException("Thread allocation accounting unavailable");
        }
        bean.setThreadAllocatedMemoryEnabled(true);
        long before = bean.getCurrentThreadAllocatedBytes();
        escape = new int[1024];
        if (bean.getCurrentThreadAllocatedBytes() - before < 4096) {
            throw new AssertionError("Allocation counter did not observe the escaping array");
        }
        Vector<?>[] values = {
            ByteVector.broadcast(ByteVector.SPECIES_128, (byte) -1),
            ShortVector.broadcast(ShortVector.SPECIES_128, (short) -1),
            IntVector.broadcast(IntVector.SPECIES_128, -1),
            LongVector.broadcast(LongVector.SPECIES_128, -1),
            FloatVector.broadcast(FloatVector.SPECIES_128, Float.intBitsToFloat(0x7fc01234)),
            DoubleVector.broadcast(DoubleVector.SPECIES_128, Double.longBitsToDouble(0xfff8000000001234L))
        };
        for (int type = 0; type < values.length; type++) {
            Vector<?> value = values[type];
            for (int i = 0; i < 20000; i++) escape = view(value, type);
            before = bean.getCurrentThreadAllocatedBytes();
            for (int i = 0; i < 10000; i++) escape = view(value, type);
            long allocated = bean.getCurrentThreadAllocatedBytes() - before;
            if (allocated != 0) {
                throw new AssertionError(value.species() + " same-lane view allocated " + allocated + " bytes");
            }
        }
    }
}
