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

// SunJSSE does not support dynamic system properties, no way to re-use
// system properties in samevm/agentvm mode.

/*
 * @test
 * @summary Retained providers expose the intended services and preserve registration entries
 * @modules java.base/sun.security.provider:+open java.base/sun.security.rsa
 * @run main/othervm ServiceContracts
 */

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.security.Provider;
import java.security.Security;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;

import sun.security.provider.VerificationProvider;
import sun.security.rsa.SunRsaSignEntries;

public class ServiceContracts {
    public static void main(String[] args) throws Exception {
        for (String name : new String[] {"SUN", "SunRsaSign", "SunEC", "SunJSSE",
                "SunJCE", "SunJGSS", "SunSASL", "XMLDSig", "SunPCSC", "JdkLDAP",
                "JdkSASL", "SunPKCS11"}) {
            if (Security.getProvider(name) == null) throw new AssertionError("Missing " + name);
        }
        services("SUN", "MessageDigest", true, "MD5", "SHA-1", "SHA-256", "SHA3-256");
        services("SUN", "MessageDigest", false, "MD2", "1.2.840.113549.2.2");
        services("SUN", "KeyFactory", true, "DSA");
        services("SUN", "AlgorithmParameters", true, "DSA");
        services("SUN", "AlgorithmParameterGenerator", true, "DSA");
        services("SUN", "KeyPairGenerator", false, "DSA", "1.2.840.10040.4.1");
        services("SUN", "Signature", false, "DSA", "NONEwithDSA", "SHA1withDSA",
                "SHA256withDSA", "RawDSA", "1.2.840.10040.4.3");
        services("SUN", "KeyStore", true, "PKCS12", "DKS");
        services("SUN", "KeyStore", false, "JKS", "CaseExactJKS");
        services("SunRsaSign", "Signature", true, "SHA256withRSA", "RSASSA-PSS");
        services("SunRsaSign", "Signature", false, "MD2withRSA", "MD5withRSA",
                "1.2.840.113549.1.1.2", "1.2.840.113549.1.1.4");
        services("SunEC", "KeyAgreement", true, "ECDH", "XDH", "X25519", "X448");
        services("SunJSSE", "SSLContext", true, "TLS", "TLSv1.2", "TLSv1.3", "DTLSv1.2");
        services("SunJSSE", "SSLContext", false, "SSLv3", "TLSv1", "TLSv1.1", "DTLSv1.0");
        services("SunJCE", "Cipher", true, "AES", "DESede", "ARCFOUR", "PBEWithSHA1AndDESede");
        services("SunJCE", "Cipher", false, "Blowfish", "RC2", "DESedeWrap",
                "PBEWithMD5AndDES", "PBEWithMD5AndTripleDES", "PBEWithSHA1AndRC2_40",
                "PBEWithSHA1AndRC2_128", "PBEWithSHA1AndRC4_40", "PBEWithSHA1AndRC4_128");
        services("SunJCE", "KeyGenerator", false, "Blowfish", "RC2");
        services("SunJCE", "AlgorithmParameters", true, "Blowfish", "PBEWithSHA1AndDESede");
        services("SunJCE", "KeyStore", false, "JCEKS");
        entries();
    }

    private static void services(String provider, String type, boolean present, String... names) {
        Provider p = Security.getProvider(provider);
        for (String name : names) {
            if ((p.getService(type, name) != null) != present) {
                throw new AssertionError(provider + " " + type + "." + name + " present=" + present);
            }
        }
    }

    private static void entries() throws Exception {
        Provider p = new VerificationProvider();
        if (!p.getServices().isEmpty()) {
            throw new AssertionError("Verification provider active while SUN and SunRsaSign exist");
        }
        Class<?> sunEntries = Class.forName("sun.security.provider.SunEntries");
        Constructor<?> ctor = sunEntries.getDeclaredConstructor(Provider.class);
        ctor.setAccessible(true);
        Method iterator = sunEntries.getDeclaredMethod("iterator");
        iterator.setAccessible(true);
        @SuppressWarnings("unchecked")
        Iterator<Provider.Service> sun = (Iterator<Provider.Service>) iterator.invoke(ctor.newInstance(p));
        List<Provider.Service> all = new ArrayList<>();
        sun.forEachRemaining(all::add);
        new SunRsaSignEntries(p).iterator().forEachRemaining(all::add);
        HashSet<Provider.Service> identities = new HashSet<>(all);
        if (identities.size() != all.size() ||
                Provider.Service.class.getMethod("equals", Object.class).getDeclaringClass() != Object.class ||
                Provider.Service.class.getMethod("hashCode").getDeclaringClass() != Object.class) {
            throw new AssertionError("Service equality no longer uses identity");
        }
        Method replay = VerificationProvider.class.getDeclaredMethod("putEntries", Iterator.class);
        replay.setAccessible(true);
        replay.invoke(p, all.iterator());
        if (p.getServices().size() != all.size()) throw new AssertionError("Duplicate service keys");
        for (Provider.Service service : all) {
            if (p.getService(service.getType(), service.getAlgorithm()) != service) {
                throw new AssertionError("Registration lost service identity: " + service);
            }
            System.out.println(service.getType() + ":" + service.getAlgorithm() + ":" +
                    service.getClassName());
        }
        TreeMap<String, String> metadata = new TreeMap<>();
        p.forEach((key, value) -> metadata.put(key.toString(), value.toString()));
        metadata.forEach((key, value) -> {
            if (key.startsWith("Alg.Alias.")) {
                String entry = key.substring("Alg.Alias.".length());
                int split = entry.indexOf('.');
                String type = entry.substring(0, split);
                String alias = entry.substring(split + 1);
                if (p.getService(type, alias) != p.getService(type, value)) {
                    throw new AssertionError("Alias changed: " + key);
                }
            }
        });
        System.out.println("metadata=" + metadata);
    }
}
