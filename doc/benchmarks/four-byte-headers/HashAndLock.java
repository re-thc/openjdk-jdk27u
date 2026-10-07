/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * This file is available under the GNU General Public License version 2.
 */
package fourbyte;

import org.openjdk.jcstress.annotations.*;
import org.openjdk.jcstress.infra.results.II_Result;

@JCStressTest
@Outcome(id = "1, 2", expect = Expect.ACCEPTABLE,
         desc = "Stable hash and both locked updates.")
@Outcome(expect = Expect.FORBIDDEN,
         desc = "Hash instability or lost/corrupted payload.")
@State
public class HashAndLock {
    static class Box { int value; }
    final Box box = new Box();
    int first, second;
    volatile Object garbage;

    @Actor public void actor1() {
        first = System.identityHashCode(box);
        synchronized (box) { box.value++; }
    }

    @Actor public void actor2() {
        second = System.identityHashCode(box);
        garbage = new byte[512];
        synchronized (box) { box.value++; }
    }

    @Arbiter public void arbiter(II_Result result) {
        result.r1 = first == second && first == System.identityHashCode(box) ? 1 : 0;
        result.r2 = box.value;
    }
}
