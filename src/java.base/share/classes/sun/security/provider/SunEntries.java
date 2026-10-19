/*
 * Copyright (c) 1996, 2025, Oracle and/or its affiliates. All rights reserved.
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

package sun.security.provider;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.security.NoSuchAlgorithmException;
import java.security.Provider;
import java.security.Security;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import jdk.internal.util.StaticProperty;

import static sun.security.util.SecurityProviderConstants.getAliases;

/**
 * Defines the entries of the SUN provider.
 *
 * Algorithms supported, and their names:
 *
 * - SHA is the message digest scheme described in FIPS 180-1.
 *   Aliases for SHA are SHA-1 and SHA1.
 *
 * - SHA-2 is a set of message digest schemes described in FIPS 180-2.
 *   SHA-2 family of hash functions includes SHA-224, SHA-256, SHA-384,
 *   and SHA-512.
 *
 * - DSA is the key and parameter scheme as described in FIPS 186.
 *   Aliases for DSA include the OID strings "OID.1.3.14.3.2.12"
 *   and "OID.1.2.840.10040.4.1".
 *
 * - MD5 is the message digest scheme described in RFC 1321.
 *   There are no aliases for MD5.
 *
 * - X.509 is the certificate factory type for X.509 certificates
 *   and CRLs. Aliases for X.509 are X509.
 *
 * - PKIX is the certification path validation algorithm described
 *   in RFC 5280. The ValidationAlgorithm attribute notes the
 *   specification that this provider implements.
 *
 * - JavaLoginConfig is the default file-based LoginModule Configuration type.
 */

public final class SunEntries {

    // the default algo used by SecureRandom class for new SecureRandom() calls
    public static final String DEF_SECURE_RANDOM_ALGO;

    SunEntries(Provider p) {
        services = new ArrayList<>(50);

        // start populating content using the specified provider

        // common attribute map
        HashMap<String, String> attrs = new HashMap<>(3);

        /*
         * SecureRandom engines
         */
        attrs.put("ThreadSafe", "true");
        if (NativePRNG.isAvailable()) {
            addSecureRandom(p, "NativePRNG",
                    "sun.security.provider.NativePRNG", attrs);
        }
        if (NativePRNG.Blocking.isAvailable()) {
            addSecureRandom(p, "NativePRNGBlocking",
                    "sun.security.provider.NativePRNG$Blocking", attrs);
        }
        if (NativePRNG.NonBlocking.isAvailable()) {
            addSecureRandom(p, "NativePRNGNonBlocking",
                    "sun.security.provider.NativePRNG$NonBlocking", attrs);
        }
        attrs.put("ImplementedIn", "Software");
        addSecureRandom(p, "DRBG", "sun.security.provider.DRBG", attrs);
        addSecureRandom(p, "SHA1PRNG",
                "sun.security.provider.SecureRandom", attrs);

        /*
         * Signature engines
         */
        attrs.clear();
        attrs.put("ImplementedIn", "Software");
        addWithAlias(p, "Signature", "HSS/LMS", "sun.security.provider.HSS", attrs);

        add(p, "Signature", "ML-DSA", "sun.security.provider.ML_DSA_Impls$SIG", attrs);
        addWithAlias(p, "Signature", "ML-DSA-44", "sun.security.provider.ML_DSA_Impls$SIG2", attrs);
        addWithAlias(p, "Signature", "ML-DSA-65", "sun.security.provider.ML_DSA_Impls$SIG3", attrs);
        addWithAlias(p, "Signature", "ML-DSA-87", "sun.security.provider.ML_DSA_Impls$SIG5", attrs);

        /*
         *  Key Pair Generator engines
         */
        attrs.clear();
        attrs.put("ImplementedIn", "Software");

        add(p, "KeyPairGenerator", "ML-DSA", "sun.security.provider.ML_DSA_Impls$KPG", attrs);
        addWithAlias(p, "KeyPairGenerator", "ML-DSA-44", "sun.security.provider.ML_DSA_Impls$KPG2", attrs);
        addWithAlias(p, "KeyPairGenerator", "ML-DSA-65", "sun.security.provider.ML_DSA_Impls$KPG3", attrs);
        addWithAlias(p, "KeyPairGenerator", "ML-DSA-87", "sun.security.provider.ML_DSA_Impls$KPG5", attrs);

        /*
         * Algorithm Parameter Generator engines
         */
        attrs.put("KeySize", "2048");
        addWithAlias(p, "AlgorithmParameterGenerator", "DSA",
                "sun.security.provider.DSAParameterGenerator", attrs);
        attrs.remove("KeySize");

        /*
         * Algorithm Parameter engines
         */
        addWithAlias(p, "AlgorithmParameters", "DSA",
                "sun.security.provider.DSAParameters", attrs);

        /*
         * Key factories
         */
        addWithAlias(p, "KeyFactory", "DSA",
                "sun.security.provider.DSAKeyFactory", attrs);
        addWithAlias(p, "KeyFactory", "HSS/LMS",
                "sun.security.provider.HSS$KeyFactoryImpl", attrs);

        add(p, "KeyFactory", "ML-DSA", "sun.security.provider.ML_DSA_Impls$KF", attrs);
        addWithAlias(p, "KeyFactory", "ML-DSA-44", "sun.security.provider.ML_DSA_Impls$KF2", attrs);
        addWithAlias(p, "KeyFactory", "ML-DSA-65", "sun.security.provider.ML_DSA_Impls$KF3", attrs);
        addWithAlias(p, "KeyFactory", "ML-DSA-87", "sun.security.provider.ML_DSA_Impls$KF5", attrs);

        /*
         * Digest engines
         */
        addWithAlias(p, "MessageDigest", "MD5", "sun.security.provider.MD5",
                attrs);
        addWithAlias(p, "MessageDigest", "SHA-1", "sun.security.provider.SHA",
                attrs);

        addWithAlias(p, "MessageDigest", "SHA-224",
                "sun.security.provider.SHA2$SHA224", attrs);
        addWithAlias(p, "MessageDigest", "SHA-256",
                "sun.security.provider.SHA2$SHA256", attrs);
        addWithAlias(p, "MessageDigest", "SHA-384",
                "sun.security.provider.SHA5$SHA384", attrs);
        addWithAlias(p, "MessageDigest", "SHA-512",
                "sun.security.provider.SHA5$SHA512", attrs);
        addWithAlias(p, "MessageDigest", "SHA-512/224",
                "sun.security.provider.SHA5$SHA512_224", attrs);
        addWithAlias(p, "MessageDigest", "SHA-512/256",
                "sun.security.provider.SHA5$SHA512_256", attrs);
        addWithAlias(p, "MessageDigest", "SHA3-224",
                "sun.security.provider.SHA3$SHA224", attrs);
        addWithAlias(p, "MessageDigest", "SHA3-256",
                "sun.security.provider.SHA3$SHA256", attrs);
        addWithAlias(p, "MessageDigest", "SHA3-384",
                "sun.security.provider.SHA3$SHA384", attrs);
        addWithAlias(p, "MessageDigest", "SHA3-512",
                "sun.security.provider.SHA3$SHA512", attrs);
        addWithAlias(p, "MessageDigest", "SHAKE128-256",
                "sun.security.provider.SHA3$SHAKE128Hash", attrs);
        addWithAlias(p, "MessageDigest", "SHAKE256-512",
                "sun.security.provider.SHA3$SHAKE256Hash", attrs);

        /*
         * Certificates
         */
        addWithAlias(p, "CertificateFactory", "X.509",
                "sun.security.provider.X509Factory", attrs);

        /*
         * KeyStore
         */
        add(p, "KeyStore", "PKCS12",
                "sun.security.pkcs12.PKCS12KeyStore");
        add(p, "KeyStore", "DKS", "sun.security.provider.DomainKeyStore$DKS",
                attrs);


        /*
         * CertStores
         */
        add(p, "CertStore", "Collection",
                "sun.security.provider.certpath.CollectionCertStore",
                attrs);
        add(p, "CertStore", "com.sun.security.IndexedCollection",
                "sun.security.provider.certpath.IndexedCollectionCertStore",
                attrs);

        /*
         * Configuration
         */
        add(p, "Configuration", "JavaLoginConfig",
                "sun.security.provider.ConfigFile$Spi");

        /*
         * CertPathBuilder and CertPathValidator
         */
        attrs.clear();
        attrs.put("ValidationAlgorithm", "RFC5280");
        attrs.put("ImplementedIn", "Software");

        add(p, "CertPathBuilder", "PKIX",
                "sun.security.provider.certpath.SunCertPathBuilder",
                attrs);
        add(p, "CertPathValidator", "PKIX",
                "sun.security.provider.certpath.PKIXCertPathValidator",
                attrs);
    }

    Iterator<Provider.Service> iterator() {
        return services.iterator();
    }

    private void add(Provider p, String type, String algo, String cn) {
        services.add(new Provider.Service(p, type, algo, cn, null, null));
    }

    private void add(Provider p, String type, String algo, String cn,
            HashMap<String, String> attrs) {
        services.add(new Provider.Service(p, type, algo, cn, null, attrs));
    }

    private void addWithAlias(Provider p, String type, String algo, String cn,
            HashMap<String, String> attrs) {
        services.add(new Provider.Service(p, type, algo, cn,
            getAliases(algo), attrs));
    }

    private void addSecureRandom(Provider p, String algo, String cn,
            HashMap<String, String> attrs) {
        services.add(new SecureRandomService(p, algo, cn, attrs));
    }

    // Avoid reflective constructor linkage for parameterless SecureRandom services.
    private static final class SecureRandomService extends Provider.Service {

        // Cache the registration check required by Provider.Service.newInstance.
        private boolean registered;

        SecureRandomService(Provider p, String algo, String cn,
                HashMap<String, String> attrs) {
            super(p, "SecureRandom", algo, cn, null, attrs);
        }

        @Override
        public Object newInstance(Object ctrParamObj)
                throws NoSuchAlgorithmException {
            if (ctrParamObj == null && (registered ||
                    getProvider().getService(getType(), getAlgorithm()) == this)) {
                registered = true;
                try {
                    Object spi = switch (getAlgorithm()) {
                        case "DRBG" -> new DRBG(null);
                        case "SHA1PRNG" -> new SecureRandom();
                        default -> NativePRNG.newInstance(getAlgorithm());
                    };
                    if (spi != null) {
                        return spi;
                    }
                } catch (RuntimeException e) {
                    // Preserve Provider.Service's exception reporting.
                }
            }
            return super.newInstance(ctrParamObj);
        }
    }

    private final ArrayList<Provider.Service> services;

    // name of the *System* property, takes precedence over PROP_RNDSOURCE
    private static final String PROP_EGD = "java.security.egd";
    // name of the *Security* property
    private static final String PROP_RNDSOURCE = "securerandom.source";

    static final String URL_DEV_RANDOM = "file:/dev/random";
    static final String URL_DEV_URANDOM = "file:/dev/urandom";

    private static final String seedSource = getOverridableSeedSource();

    private static String getOverridableSeedSource() {
        String egdSource = System.getProperty(PROP_EGD, "");
        if (egdSource.length() != 0) {
            return egdSource;
        }
        egdSource = Security.getProperty(PROP_RNDSOURCE);
        if (egdSource == null) {
            return "";
        }
        return egdSource;
    }

    static {
        DEF_SECURE_RANDOM_ALGO  = (NativePRNG.isAvailable() &&
            (seedSource.equals(URL_DEV_URANDOM) ||
             seedSource.equals(URL_DEV_RANDOM)) ?
            "NativePRNG" : "DRBG");
    }

    static String getSeedSource() {
        return seedSource;
    }

    /*
     * Use a URI to access this File. Previous code used a URL
     * which is less strict on syntax. If we encounter a
     * URISyntaxException we make a best effort for backwards
     * compatibility. e.g. space character in deviceName string.
     *
     * Moved from SeedGenerator to avoid initialization problems with
     * signed providers.
     */
    static File getDeviceFile(URL device) throws IOException {
        try {
            URI deviceURI = device.toURI();
            if(deviceURI.isOpaque()) {
                // File constructor does not accept opaque URI
                URI localDir = new File(
                    StaticProperty.userDir()).toURI();
                String uriPath = localDir.toString() +
                                     deviceURI.toString().substring(5);
                return new File(URI.create(uriPath));
            } else {
                return new File(deviceURI);
            }
        } catch (URISyntaxException use) {
            /*
             * Make a best effort to access this File.
             * We can try using the URL path.
             */
            return new File(device.getPath());
        }
    }
}
