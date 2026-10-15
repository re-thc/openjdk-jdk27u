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
 * @modules java.base/sun.security.util:+open
 * @run main/othervm CurveDBLookup
 */

import java.lang.reflect.Field;
import java.math.BigInteger;
import java.security.AlgorithmParameters;
import java.security.spec.ECFieldFp;
import java.security.spec.ECParameterSpec;
import java.security.spec.ECPoint;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;

import sun.security.util.CurveDB;
import sun.security.util.ECKeySizeParameterSpec;
import sun.security.util.KnownOIDs;
import sun.security.util.NamedCurve;

public class CurveDBLookup {

    // The curves of CurveDB, listed here so that the race below is the
    // first lookup of them
    private static final List<KnownOIDs> CURVES = List.of(
            KnownOIDs.c2tnb191v1, KnownOIDs.c2tnb191v2, KnownOIDs.c2tnb191v3,
            KnownOIDs.c2tnb239v1, KnownOIDs.c2tnb239v2, KnownOIDs.c2tnb239v3,
            KnownOIDs.c2tnb359v1, KnownOIDs.c2tnb431r1, KnownOIDs.secp192r1,
            KnownOIDs.prime192v2, KnownOIDs.prime192v3, KnownOIDs.prime239v1,
            KnownOIDs.prime239v2, KnownOIDs.prime239v3, KnownOIDs.secp256r1,
            KnownOIDs.brainpoolP160r1, KnownOIDs.brainpoolP192r1,
            KnownOIDs.brainpoolP224r1, KnownOIDs.brainpoolP256r1,
            KnownOIDs.brainpoolP320r1, KnownOIDs.brainpoolP384r1,
            KnownOIDs.brainpoolP512r1, KnownOIDs.sect163k1,
            KnownOIDs.sect163r1, KnownOIDs.sect239k1, KnownOIDs.sect113r1,
            KnownOIDs.sect113r2, KnownOIDs.secp112r1, KnownOIDs.secp112r2,
            KnownOIDs.secp160r1, KnownOIDs.secp160k1, KnownOIDs.secp256k1,
            KnownOIDs.sect163r2, KnownOIDs.sect283k1, KnownOIDs.sect283r1,
            KnownOIDs.sect131r1, KnownOIDs.sect131r2, KnownOIDs.sect193r1,
            KnownOIDs.sect193r2, KnownOIDs.sect233k1, KnownOIDs.sect233r1,
            KnownOIDs.secp128r1, KnownOIDs.secp128r2, KnownOIDs.secp160r2,
            KnownOIDs.secp192k1, KnownOIDs.secp224k1, KnownOIDs.secp224r1,
            KnownOIDs.secp384r1, KnownOIDs.secp521r1, KnownOIDs.sect409k1,
            KnownOIDs.sect409r1, KnownOIDs.sect571k1, KnownOIDs.sect571r1);

    // Made when CurveDB is initialized
    private static final Set<KnownOIDs> BUILT_AT_INIT = Set.of(
            KnownOIDs.secp256r1, KnownOIDs.secp384r1, KnownOIDs.secp521r1);

    // Whether the NamedCurve of the curve has been made, which initializes
    // CurveDB but makes no curve
    private static boolean isMade(KnownOIDs ko) throws Exception {
        Field oidMap = CurveDB.class.getDeclaredField("oidMap");
        oidMap.setAccessible(true);
        Object spec = ((Map<?, ?>) oidMap.get(null)).get(ko.value());
        Field curve = spec.getClass().getDeclaredField("curve");
        curve.setAccessible(true);
        return curve.get(spec) != null;
    }

    private static void check(boolean ok, String message) {
        if (!ok) {
            throw new RuntimeException(message);
        }
    }

    public static void main(String[] args) throws Exception {
        // Only the curves that CurveDB makes when it is initialized are made
        // before the race
        for (KnownOIDs ko : CURVES) {
            check(isMade(ko) == BUILT_AT_INIT.contains(ko),
                    ko + " made before the race: " + isMade(ko));
        }

        raceForTheCurves(CURVES);

        // The list has every curve of CurveDB
        List<KnownOIDs> curves = new ArrayList<>();
        for (KnownOIDs ko : KnownOIDs.values()) {
            if (CurveDB.lookup(ko.value()) != null) {
                curves.add(ko);
            }
        }
        check(Set.copyOf(curves).equals(Set.copyOf(CURVES)),
                "The curves of CurveDB are " + curves);

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
    // same object for each of them, and each curve is made.
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
            check(isMade(curves.get(i)), curves.get(i) + " not made");
            for (int t = 1; t < threads; t++) {
                check(found[t][i] != null && found[t][i] == found[0][i],
                        "Different objects for " + curves.get(i));
            }
        }
    }
}
