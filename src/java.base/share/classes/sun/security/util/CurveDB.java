/*
 * Copyright (c) 2006, 2023, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
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

package sun.security.util;

import java.math.BigInteger;

import java.security.spec.*;

import java.util.*;

/**
 * Repository for well-known Elliptic Curve parameters. It is used by both
 * the SunPKCS11 and SunJSSE code.
 *
 * @since   1.6
 * @author  Andreas Sterbenz
 */
public class CurveDB {

    public static final NamedCurve P_256;
    public static final NamedCurve P_384;
    public static final NamedCurve P_521;

    private static final int P  = 1; // prime curve
    private static final int PD = 5; // prime curve, mark as default

    // The parameters of a curve, from which the NamedCurve is made when it
    // is first needed.  Most processes use only a few of the curves, and
    // making all of them takes a lot of BigIntegers.
    private static final class Spec {
        private final KnownOIDs ko;
        private final String sfield, a, b, x, y, n;
        private final int h;
        final int fieldSize;
        private volatile NamedCurve curve;

        Spec(KnownOIDs ko, String sfield, String a, String b,
                String x, String y, String n, int h) {
            this.ko = ko;
            this.sfield = sfield;
            this.a = a;
            this.b = b;
            this.x = x;
            this.y = y;
            this.n = n;
            this.h = h;
            // the size of the field, as ECField.getFieldSize() returns it
            this.fieldSize = bitLength(sfield);
        }

        private static int bitLength(String hex) {
            int i = 0;
            while (i < hex.length() - 1 && hex.charAt(i) == '0') {
                i++;
            }
            int top = Character.digit(hex.charAt(i), 16);
            return (hex.length() - i - 1) * 4
                    + (Integer.SIZE - Integer.numberOfLeadingZeros(top));
        }

        NamedCurve curve() {
            NamedCurve c = curve;
            if (c == null) {
                synchronized (this) {
                    c = curve;
                    if (c == null) {
                        c = make();
                        curve = c;
                    }
                }
            }
            return c;
        }

        private NamedCurve make() {
            EllipticCurve ec = new EllipticCurve(
                    new ECFieldFp(bi(sfield)), bi(a), bi(b));
            ECPoint g = new ECPoint(bi(x), bi(y));
            return new NamedCurve(ko, ec, g, bi(n), h);
        }
    }

    private static final Map<String,Spec> oidMap =
            new LinkedHashMap<>();
    private static final Map<String,Spec> nameMap =
            new HashMap<>();
    private static final Map<Integer,Spec> lengthMap =
            new HashMap<>();

    // Return a NamedCurve for the specified OID/name or null if unknown.
    public static NamedCurve lookup(String name) {
        Spec spec = oidMap.get(name);
        if (spec == null) {
            spec = nameMap.get(name.toLowerCase(Locale.ENGLISH));
        }

        return (spec == null) ? null : spec.curve();
    }

    // Return EC parameters for the specified field size. If there are known
    // NIST recommended parameters for the given length, they are returned.
    // Otherwise, if there are multiple matches for the given size, an
    // arbitrary one is returns.
    // If no parameters are known, the method returns null.
    static NamedCurve lookup(int length) {
        Spec spec = lengthMap.get(length);
        return (spec == null) ? null : spec.curve();
    }

    // Convert the given ECParameterSpec object to a NamedCurve object.
    // If params does not represent a known named curve, return null.
    public static NamedCurve lookup(ECParameterSpec params) {
        if ((params instanceof NamedCurve) || (params == null)) {
            return (NamedCurve)params;
        }

        // This code allows SunJSSE to work with 3rd party crypto
        // providers for ECC and not just SunPKCS11.
        // This can go away once we decide how to expose curve names in the
        // public API.
        // Note that it assumes that the 3rd party provider encodes named
        // curves using the short form, not explicitly. If it did that, then
        // the SunJSSE TLS ECC extensions are wrong, which could lead to
        // interoperability problems.
        int fieldSize = params.getCurve().getField().getFieldSize();
        for (Spec spec : oidMap.values()) {
            // Quick field size check first
            if (spec.fieldSize != fieldSize) {
                continue;
            }
            NamedCurve namedCurve = spec.curve();
            // ECParameterSpec does not define equals, so check all the
            // components ourselves.
            if (ECUtil.equals(namedCurve, params)) {
                // everything matches our named curve, return it
                return namedCurve;
            }
        }
        // no match found
        return null;
    }

    private static BigInteger bi(String s) {
        return new BigInteger(s, 16);
    }

    private static Spec add(KnownOIDs o, int type, String sfield,
            String a, String b, String x, String y, String n, int h) {
        if ((type != P) && (type != PD)) {
            throw new RuntimeException("Invalid type: " + type);
        }

        Spec spec = new Spec(o, sfield, a, b, x, y, n, h);

        String oid = o.value();
        if (oidMap.put(oid, spec) != null) {
            throw new RuntimeException("Duplication oid: " + oid);
        }

        // the standard name followed by the aliases
        if (nameMap.put(o.stdName().toLowerCase(Locale.ENGLISH), spec)
                != null) {
            throw new RuntimeException("Duplication name: " + o.stdName());
        }
        for (String cn : o.aliases()) {
            if (nameMap.put(cn.toLowerCase(Locale.ENGLISH), spec) != null) {
                throw new RuntimeException("Duplication name: " + cn);
            }
        }

        int len = spec.fieldSize;
        if ((type == PD) || (lengthMap.get(len) == null)) {
            // add entry if none present for this field size or if
            // the curve is marked as a default curve.
            lengthMap.put(len, spec);
        }

        return spec;
    }

    static {
        /* SEC2 prime curves */
        add(KnownOIDs.secp224r1, PD,
            "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000001",
            "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFE",
            "B4050A850C04B3ABF54132565044B0B7D7BFD8BA270B39432355FFB4",
            "B70E0CBD6BB4BF7F321390B94A03C1D356C21122343280D6115C1D21",
            "BD376388B5F723FB4C22DFE6CD4375A05A07476444D5819985007E34",
            "FFFFFFFFFFFFFFFFFFFFFFFFFFFF16A2E0B8F03E13DD29455C5C2A3D",
            1);

        add(KnownOIDs.secp256k1, P,
            "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFC2F",
            "0000000000000000000000000000000000000000000000000000000000000000",
            "0000000000000000000000000000000000000000000000000000000000000007",
            "79BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798",
            "483ADA7726A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8",
            "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141",
            1);

        add(KnownOIDs.secp256r1, PD,
            "FFFFFFFF00000001000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF",
            "FFFFFFFF00000001000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFC",
            "5AC635D8AA3A93E7B3EBBD55769886BC651D06B0CC53B0F63BCE3C3E27D2604B",
            "6B17D1F2E12C4247F8BCE6E563A440F277037D812DEB33A0F4A13945D898C296",
            "4FE342E2FE1A7F9B8EE7EB4A7C0F9E162BCE33576B315ECECBB6406837BF51F5",
            "FFFFFFFF00000000FFFFFFFFFFFFFFFFBCE6FAADA7179E84F3B9CAC2FC632551",
            1);

        add(KnownOIDs.secp384r1, PD,
            "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFF0000000000000000FFFFFFFF",
            "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFF0000000000000000FFFFFFFC",
            "B3312FA7E23EE7E4988E056BE3F82D19181D9C6EFE8141120314088F5013875AC656398D8A2ED19D2A85C8EDD3EC2AEF",
            "AA87CA22BE8B05378EB1C71EF320AD746E1D3B628BA79B9859F741E082542A385502F25DBF55296C3A545E3872760AB7",
            "3617DE4A96262C6F5D9E98BF9292DC29F8F41DBD289A147CE9DA3113B5F0B8C00A60B1CE1D7E819D7A431D7C90EA0E5F",
            "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7634D81F4372DDF581A0DB248B0A77AECEC196ACCC52973",
            1);

        add(KnownOIDs.secp521r1, PD,
            "01FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
            "01FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC",
            "0051953EB9618E1C9A1F929A21A0B68540EEA2DA725B99B315F3B8B489918EF109E156193951EC7E937B1652C0BD3BB1BF073573DF883D2C34F1EF451FD46B503F00",
            "00C6858E06B70404E9CD9E3ECB662395B4429C648139053FB521F828AF606B4D3DBAA14B5E77EFE75928FE1DC127A2FFA8DE3348B3C1856A429BF97E7E31C2E5BD66",
            "011839296A789A3BC0045C8A5FB42C7D1BD998F54449579B446817AFBD17273E662C97EE72995EF42640C550B9013FAD0761353C7086A272C24088BE94769FD16650",
            "01FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA51868783BF2F966B7FCC0148F709A5D03BB5C9B8899C47AEBB6FB71E91386409",
            1);

        /*
         * Brainpool curves (RFC 5639)
         * (Twisted curves are not included)
         */

        add(KnownOIDs.brainpoolP224r1, P,
            "D7C134AA264366862A18302575D1D787B09F075797DA89F57EC8C0FF",
            "68A5E62CA9CE6C1C299803A6C1530B514E182AD8B0042A59CAD29F43",
            "2580F63CCFE44138870713B1A92369E33E2135D266DBB372386C400B",
            "0D9029AD2C7E5CF4340823B2A87DC68C9E4CE3174C1E6EFDEE12C07D",
            "58AA56F772C0726F24C6B89E4ECDAC24354B9E99CAA3F6D3761402CD",
            "D7C134AA264366862A18302575D0FB98D116BC4B6DDEBCA3A5A7939F",
            1);

        add(KnownOIDs.brainpoolP256r1, P,
            "A9FB57DBA1EEA9BC3E660A909D838D726E3BF623D52620282013481D1F6E5377",
            "7D5A0975FC2C3057EEF67530417AFFE7FB8055C126DC5C6CE94A4B44F330B5D9",
            "26DC5C6CE94A4B44F330B5D9BBD77CBF958416295CF7E1CE6BCCDC18FF8C07B6",
            "8BD2AEB9CB7E57CB2C4B482FFC81B7AFB9DE27E1E3BD23C23A4453BD9ACE3262",
            "547EF835C3DAC4FD97F8461A14611DC9C27745132DED8E545C1D54C72F046997",
            "A9FB57DBA1EEA9BC3E660A909D838D718C397AA3B561A6F7901E0E82974856A7",
            1);

        add(KnownOIDs.brainpoolP320r1, P,
            "D35E472036BC4FB7E13C785ED201E065F98FCFA6F6F40DEF4F92B9EC7893EC28FCD412B1F1B32E27",
            "3EE30B568FBAB0F883CCEBD46D3F3BB8A2A73513F5EB79DA66190EB085FFA9F492F375A97D860EB4",
            "520883949DFDBC42D3AD198640688A6FE13F41349554B49ACC31DCCD884539816F5EB4AC8FB1F1A6",
            "43BD7E9AFB53D8B85289BCC48EE5BFE6F20137D10A087EB6E7871E2A10A599C710AF8D0D39E20611",
            "14FDD05545EC1CC8AB4093247F77275E0743FFED117182EAA9C77877AAAC6AC7D35245D1692E8EE1",
            "D35E472036BC4FB7E13C785ED201E065F98FCFA5B68F12A32D482EC7EE8658E98691555B44C59311",
            1);

        add(KnownOIDs.brainpoolP384r1, P,
            "8CB91E82A3386D280F5D6F7E50E641DF152F7109ED5456B412B1DA197FB71123ACD3A729901D1A71874700133107EC53",
            "7BC382C63D8C150C3C72080ACE05AFA0C2BEA28E4FB22787139165EFBA91F90F8AA5814A503AD4EB04A8C7DD22CE2826",
            "04A8C7DD22CE28268B39B55416F0447C2FB77DE107DCD2A62E880EA53EEB62D57CB4390295DBC9943AB78696FA504C11",
            "1D1C64F068CF45FFA2A63A81B7C13F6B8847A3E77EF14FE3DB7FCAFE0CBD10E8E826E03436D646AAEF87B2E247D4AF1E",
            "8ABE1D7520F9C2A45CB1EB8E95CFD55262B70B29FEEC5864E19C054FF99129280E4646217791811142820341263C5315",
            "8CB91E82A3386D280F5D6F7E50E641DF152F7109ED5456B31F166E6CAC0425A7CF3AB6AF6B7FC3103B883202E9046565",
            1);

        add(KnownOIDs.brainpoolP512r1, P,
            "AADD9DB8DBE9C48B3FD4E6AE33C9FC07CB308DB3B3C9D20ED6639CCA703308717D4D9B009BC66842AECDA12AE6A380E62881FF2F2D82C68528AA6056583A48F3",
            "7830A3318B603B89E2327145AC234CC594CBDD8D3DF91610A83441CAEA9863BC2DED5D5AA8253AA10A2EF1C98B9AC8B57F1117A72BF2C7B9E7C1AC4D77FC94CA",
            "3DF91610A83441CAEA9863BC2DED5D5AA8253AA10A2EF1C98B9AC8B57F1117A72BF2C7B9E7C1AC4D77FC94CADC083E67984050B75EBAE5DD2809BD638016F723",
            "81AEE4BDD82ED9645A21322E9C4C6A9385ED9F70B5D916C1B43B62EEF4D0098EFF3B1F78E2D0D48D50D1687B93B97D5F7C6D5047406A5E688B352209BCB9F822",
            "7DDE385D566332ECC0EABFA9CF7822FDF209F70024A57B1AA000C55B881F8111B2DCDE494A5F485E5BCA4BD88A2763AED1CA2B2FA8F0540678CD1E0F3AD80892",
            "AADD9DB8DBE9C48B3FD4E6AE33C9FC07CB308DB3B3C9D20ED6639CCA70330870553E5C414CA92619418661197FAC10471DB1D381085DDADDB58796829CA90069",
            1);

        P_256 = lookup(KnownOIDs.secp256r1.value());
        P_384 = lookup(KnownOIDs.secp384r1.value());
        P_521 = lookup(KnownOIDs.secp521r1.value());
    }
}
