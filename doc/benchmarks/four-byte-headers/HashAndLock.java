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
package fourbyte;

import org.openjdk.jcstress.annotations.Actor;
import org.openjdk.jcstress.annotations.Arbiter;
import org.openjdk.jcstress.annotations.Expect;
import org.openjdk.jcstress.annotations.JCStressTest;
import org.openjdk.jcstress.annotations.Outcome;
import org.openjdk.jcstress.annotations.State;
import org.openjdk.jcstress.infra.results.II_Result;

@JCStressTest
@Outcome(id = "1, 2", expect = Expect.ACCEPTABLE,
         desc = "Stable hash and both locked updates.")
@Outcome(expect = Expect.FORBIDDEN,
         desc = "Hash instability or lost/corrupted payload.")
@State
public class HashAndLock {
    static class Box {
        int value;
    }
    final Box box = new Box();
    int first, second;
    volatile Object garbage;

    @Actor
    public void actor1() {
        first = System.identityHashCode(box);
        synchronized (box) {
            box.value++;
        }
    }

    @Actor
    public void actor2() {
        second = System.identityHashCode(box);
        garbage = new byte[512];
        synchronized (box) {
            box.value++;
        }
    }

    @Arbiter
    public void arbiter(II_Result result) {
        result.r1 = first == second && first == System.identityHashCode(box) ? 1 : 0;
        result.r2 = box.value;
    }
}
