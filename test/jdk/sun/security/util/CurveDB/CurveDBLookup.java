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

/*
 * @test
 * @summary The curves of CurveDB are found by OID, name, alias, field size
 *          and parameters, and each of them is made once, also when threads
 *          ask for it at the same time
 * @modules java.base/sun.security.util
 * @run main/othervm CurveDBLookup
 */

import java.math.BigInteger;
import java.security.AlgorithmParameters;
import java.security.spec.ECFieldFp;
import java.security.spec.ECParameterSpec;
import java.security.spec.ECPoint;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;

import sun.security.util.CurveDB;
import sun.security.util.ECKeySizeParameterSpec;
import sun.security.util.KnownOIDs;
import sun.security.util.NamedCurve;

public class CurveDBLookup {

    private static void check(boolean ok, String message) {
        if (!ok) {
            throw new RuntimeException(message);
        }
    }

    public static void main(String[] args) throws Exception {
        List<KnownOIDs> curves = new ArrayList<>();
        for (KnownOIDs ko : KnownOIDs.values()) {
            if (CurveDB.lookup(ko.value()) != null) {
                curves.add(ko);
            }
        }
        check(curves.size() > 3, "Too few curves: " + curves);

        raceForTheCurves(curves);

        for (KnownOIDs ko : curves) {
            NamedCurve c = CurveDB.lookup(ko.value());
            check(c.getObjectId().equals(ko.value()), "OID of " + ko);
            check(c.getNameAndAliases()[0].equals(ko.stdName()),
                    "Name of " + ko);

            List<String> names = new ArrayList<>();
            names.add(ko.stdName());
            names.addAll(List.of(ko.aliases()));
            for (String name : names) {
                for (String s : new String[] {name,
                        name.toLowerCase(Locale.ROOT),
                        name.toUpperCase(Locale.ROOT)}) {
                    check(CurveDB.lookup(s) == c,
                            "Lookup of " + s + " is not " + ko);
                }
            }

            // a copy of the parameters is found as the named curve
            ECParameterSpec copy = new ECParameterSpec(c.getCurve(),
                    c.getGenerator(), c.getOrder(), c.getCofactor());
            check(CurveDB.lookup(copy) == c, "Lookup of the parameters of "
                    + ko);

            // the generator is on the curve
            if (c.getCurve().getField() instanceof ECFieldFp f) {
                BigInteger p = f.getP();
                ECPoint g = c.getGenerator();
                BigInteger x = g.getAffineX();
                BigInteger y = g.getAffineY();
                BigInteger lhs = y.multiply(y).mod(p);
                BigInteger rhs = x.multiply(x).multiply(x)
                        .add(c.getCurve().getA().multiply(x))
                        .add(c.getCurve().getB()).mod(p);
                check(lhs.equals(rhs), "The generator of " + ko
                        + " is not on the curve");
            }
        }

        check(CurveDB.P_256 == CurveDB.lookup("secp256r1"), "P_256");
        check(CurveDB.P_384 == CurveDB.lookup("NIST P-384"), "P_384");
        check(CurveDB.P_521 == CurveDB.lookup("1.3.132.0.35"), "P_521");

        check(CurveDB.lookup("EC keySize < 224") == null, "Unknown name");
        check(CurveDB.lookup("secp256r") == null, "Unknown name");
        check(CurveDB.lookup((ECParameterSpec) null) == null, "null");

        // the curve for a field size
        int[] sizes = {192, 224, 256, 384, 521};
        String[] names = {"secp192r1", "secp224r1", "secp256r1",
                "secp384r1", "secp521r1"};
        for (int i = 0; i < sizes.length; i++) {
            AlgorithmParameters ap = AlgorithmParameters.getInstance("EC");
            ap.init(new ECKeySizeParameterSpec(sizes[i]));
            check(ap.getParameterSpec(ECParameterSpec.class)
                    == CurveDB.lookup(names[i]), "Curve for " + sizes[i]);
        }
    }

    // Many threads that look for every curve for the first time get the
    // same object for each of them.
    private static void raceForTheCurves(List<KnownOIDs> curves)
            throws Exception {
        int threads = 8;
        CountDownLatch start = new CountDownLatch(1);
        NamedCurve[][] found = new NamedCurve[threads][curves.size()];
        AtomicReference<Throwable> failure = new AtomicReference<>();
        List<Thread> list = new ArrayList<>();
        for (int t = 0; t < threads; t++) {
            int id = t;
            Thread thread = new Thread(new Runnable() {
                public void run() {
                    try {
                        start.await();
                        for (int i = 0; i < curves.size(); i++) {
                            // in a different order in each thread
                            int k = (i + id * 7) % curves.size();
                            found[id][k] = CurveDB.lookup(
                                    curves.get(k).stdName());
                        }
                    } catch (Throwable e) {
                        failure.set(e);
                    }
                }
            });
            list.add(thread);
            thread.start();
        }
        start.countDown();
        for (Thread thread : list) {
            thread.join();
        }
        if (failure.get() != null) {
            throw new RuntimeException(failure.get());
        }
        for (int i = 0; i < curves.size(); i++) {
            for (int t = 1; t < threads; t++) {
                check(found[t][i] != null && found[t][i] == found[0][i],
                        "Different objects for " + curves.get(i));
            }
        }
    }
}
