/*
 * Copyright (c) 2026, Datadog, Inc. All rights reserved.
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

package gc.stress.ihash;

/*
 * @test id=Serial
 * @bug 8372151
 * @summary Stress test: cloning identity-hashed objects must not copy mark-word hash-control bits
 * @requires vm.gc.Serial
 * @key stress
 * @run main/othervm/timeout=300
 *      -XX:+UseFourByteObjectHeaders -XX:+UseSerialGC
 *      -XX:+UnlockDiagnosticVMOptions -XX:+VerifyDuringGC
 *      -Xmx256m
 *      gc.stress.ihash.TestStressIHash
 */

/*
 * @test id=G1
 * @bug 8372151
 * @summary Stress test: cloning identity-hashed objects must not copy mark-word hash-control bits
 * @requires vm.gc.G1
 * @key stress
 * @run main/othervm/timeout=300
 *      -XX:+UseFourByteObjectHeaders -XX:+UseG1GC
 *      -XX:+UnlockDiagnosticVMOptions -XX:+VerifyDuringGC
 *      -Xmx256m
 *      gc.stress.ihash.TestStressIHash
 */

/*
 * @test id=Z
 * @bug 8372151
 * @summary Stress test: cloning identity-hashed objects must not copy mark-word hash-control bits
 * @requires vm.gc.Z
 * @key stress
 * @run main/othervm/timeout=300
 *      -XX:+UseFourByteObjectHeaders -XX:+UseZGC
 *      -XX:+UnlockDiagnosticVMOptions -XX:+VerifyDuringGC
 *      -Xmx256m
 *      gc.stress.ihash.TestStressIHash
 */

/*
 * @test id=C2-Serial
 * @bug 8372151
 * @summary C2 clone of objects with narrowOop at offset 4 must use mismatched access
 * @requires vm.gc.Serial
 * @requires vm.opt.TieredCompilation != true
 * @key stress
 * @run main/othervm/timeout=300
 *      -XX:+UseFourByteObjectHeaders -XX:+UseSerialGC
 *      -XX:-TieredCompilation
 *      -Xmx256m
 *      gc.stress.ihash.TestStressIHash clone-ref
 */

/*
 * @test id=C2-G1
 * @bug 8372151
 * @summary C2 clone of objects with narrowOop at offset 4 must use mismatched access
 * @requires vm.gc.G1
 * @requires vm.opt.TieredCompilation != true
 * @key stress
 * @run main/othervm/timeout=300
 *      -XX:+UseFourByteObjectHeaders -XX:+UseG1GC
 *      -XX:-TieredCompilation
 *      -Xmx256m
 *      gc.stress.ihash.TestStressIHash clone-ref
 */

import java.util.Random;

/**
 * Cloning a hashed, relocated object must reset its hash state and preserve its
 * payload. GC verification checks that cloning does not corrupt object sizes.
 */
public class TestStressIHash {

    // With four-byte headers: header(4) + int(4) = 8 bytes (1 HeapWord).
    // The identity hash needs 4 bytes but there is no gap in the layout,
    // so GC must expand the object by one word when preserving the hash.
    static class Payload implements Cloneable {
        int field;

        Payload(int v) { field = v; }

        @Override
        public Payload clone() {
            try {
                return (Payload) super.clone();
            } catch (CloneNotSupportedException e) {
                throw new RuntimeException(e);
            }
        }
    }

    // Only reference fields: C2 must handle a narrow oop at offset four.
    // Primitive fields could occupy that slot and hide the StoreI/StoreN mismatch.
    static class RefPayload implements Cloneable {
        Object ref;
        Object ref2;
        Object ref3;
        Object ref4;

        RefPayload(Object r) {
            ref = r;
            ref2 = r;
            ref3 = r;
            ref4 = r;
        }

        @Override
        public RefPayload clone() {
            try {
                return (RefPayload) super.clone();
            } catch (CloneNotSupportedException e) {
                throw new RuntimeException(e);
            }
        }
    }

    static final int BATCH_SIZE = 100_000;
    static final int MAX_SURVIVORS = 1_000_000;

    // Keep the clone small enough for C2 to inline its intrinsic.
    static Payload clonePayload(Payload p) {
        return p.clone();
    }

    // Inlining the source allocation lets C2 fold the clone's reference load,
    // exercising the interaction between the int pre-copy and typed oop stores.
    static Object cloneRefPayload(Object r) {
        RefPayload p = new RefPayload(r);
        RefPayload c = p.clone();
        return c.ref;
    }

    public static void main(String[] args) {
        boolean cloneRef = args.length > 0 && "clone-ref".equals(args[0]);

        if (cloneRef) {
            testCloneRefPayload();
        } else {
            testClonePayload();
        }
    }

    // Exercise the clone pre-copy StoreI/StoreN mismatch at offset four in C2.
    static void testCloneRefPayload() {
        Object anchor = new Object();
        for (int i = 0; i < 100_000; i++) {
            Object result = cloneRefPayload(anchor);
            if (result != anchor) {
                throw new RuntimeException("FAIL: RefPayload clone has wrong ref field");
            }
        }
    }

    // GC stress test: clones identity-hashed Payload objects across GC
    // cycles and verifies independent hashes and heap integrity.
    static void testClonePayload() {
        Random rng = new Random(12345);
        Object[] survivors = new Object[MAX_SURVIVORS];
        int survivorCount = 0;
        int totalCreated = 0;
        int sharedHashes = 0;
        int totalCloned = 0;

        while (survivorCount < MAX_SURVIVORS) {
            // Hash a batch of objects before relocation.
            Payload[] batch = new Payload[BATCH_SIZE];
            int[] srcHashes = new int[BATCH_SIZE];
            for (int i = 0; i < BATCH_SIZE; i++) {
                batch[i] = new Payload(totalCreated++);
                srcHashes[i] = System.identityHashCode(batch[i]);
            }

            // Relocation installs each hash in an expanded object.
            System.gc();

            // Clones must not inherit the source's hash state or stored hash.
            for (int i = 0; i < BATCH_SIZE; i++) {
                Payload clone = clonePayload(batch[i]);
                totalCloned++;
                int cloneHash = System.identityHashCode(clone);
                if (cloneHash == srcHashes[i]) {
                    sharedHashes++;
                }
                if (rng.nextInt(10) == 0 && survivorCount < MAX_SURVIVORS) {
                    survivors[survivorCount++] = clone;
                }
            }

            // Let the originals die.
            batch = null;
        }

        // Final GC: with VerifyDuringGC, this walks the heap and will detect
        // corrupt clones if the allocation-size vs mark-word bug is present.
        System.gc();

        // Allow occasional collisions between independent 31-bit hashes.
        if (sharedHashes > 10) {
            throw new RuntimeException("FAIL: " + sharedHashes + " / " + totalCloned
                + " clones share identity hash with source object");
        }
    }
}
