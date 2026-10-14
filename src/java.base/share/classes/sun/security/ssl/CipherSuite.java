/*
 * Copyright (c) 2002, 2025, Oracle and/or its affiliates. All rights reserved.
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

package sun.security.ssl;

import java.util.*;

import static sun.security.ssl.CipherSuite.HashAlg.*;
import static sun.security.ssl.CipherSuite.KeyExchange.*;
import static sun.security.ssl.CipherSuite.MacAlg.*;
import static sun.security.ssl.SSLCipher.*;
import sun.security.ssl.NamedGroup.NamedGroupSpec;
import static sun.security.ssl.NamedGroup.NamedGroupSpec.*;

/**
 * Enum for SSL/(D)TLS cipher suites.
 *
 * Please refer to the "TLS Cipher Suite Registry" section for more details
 * about each cipher suite:
 *     https://www.iana.org/assignments/tls-parameters/tls-parameters.xml
 */
enum CipherSuite {
    //
    // in preference order
    //

    // Definition of the CipherSuites that are enabled by default.
    //
    // They are listed in preference order, most preferred first, using
    // the following criteria:
    // 1. Prefer Suite B compliant cipher suites, see RFC6460 (To be
    //    changed later, see below).
    // 2. Prefer forward secrecy cipher suites.
    // 3. Prefer the stronger bulk cipher, in the order of AES_256(GCM),
    //    AES_128(GCM), AES_256, AES_128.
    // 4. Prefer the stronger MAC algorithm, in the order of SHA384,
    //    SHA256, SHA.
    // 5. Prefer the better performance of key exchange and digital
    //    signature algorithm, in the order of ECDHE-ECDSA, ECDHE-RSA,
    //    DHE-RSA.

    // TLS 1.3 cipher suites.
    TLS_AES_256_GCM_SHA384(
            0x1302, true, "TLS_AES_256_GCM_SHA384",
            ProtocolVersion.PROTOCOLS_OF_13, B_AES_256_GCM_IV, H_SHA384),
    TLS_AES_128_GCM_SHA256(
            0x1301, true, "TLS_AES_128_GCM_SHA256",
            ProtocolVersion.PROTOCOLS_OF_13, B_AES_128_GCM_IV, H_SHA256),
    TLS_CHACHA20_POLY1305_SHA256(
            0x1303, true, "TLS_CHACHA20_POLY1305_SHA256",
            ProtocolVersion.PROTOCOLS_OF_13, B_CC20_P1305, H_SHA256),

    // Suite B compliant cipher suites, see RFC 6460.
    //
    // Note that, at present this provider is not Suite B compliant. The
    // preference order of the GCM cipher suites does not follow the spec
    // of RFC 6460.  In this section, only two cipher suites are listed
    // so that applications can make use of Suite-B compliant cipher
    // suite firstly.
    TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384(
            0xC02C, true, "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384",
            ProtocolVersion.PROTOCOLS_OF_12,
            K_ECDHE_ECDSA, B_AES_256_GCM, M_NULL, H_SHA384),
    TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256(
            0xC02B, true, "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256",
            ProtocolVersion.PROTOCOLS_OF_12,
            K_ECDHE_ECDSA, B_AES_128_GCM, M_NULL, H_SHA256),

    // Not suite B, but we want it to position the suite early in the list
    // of 1.2 suites.
    TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256(
            0xCCA9, true, "TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256",
            ProtocolVersion.PROTOCOLS_OF_12,
            K_ECDHE_ECDSA, B_CC20_P1305, M_NULL, H_SHA256),

    //
    // Forward secrecy cipher suites.
    //

    // AES_256(GCM) - ECDHE
    TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384(
            0xC030, true, "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384",
            ProtocolVersion.PROTOCOLS_OF_12,
            K_ECDHE_RSA, B_AES_256_GCM, M_NULL, H_SHA384),
    TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256(
            0xCCA8, true, "TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256",
            ProtocolVersion.PROTOCOLS_OF_12,
            K_ECDHE_RSA, B_CC20_P1305, M_NULL, H_SHA256),

    // AES_128(GCM) - ECDHE
    TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256(
            0xC02F, true, "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256",
            ProtocolVersion.PROTOCOLS_OF_12,
            K_ECDHE_RSA, B_AES_128_GCM, M_NULL, H_SHA256),

    // AES_256(GCM) - DHE
    TLS_DHE_RSA_WITH_AES_256_GCM_SHA384(
            0x009F, true, "TLS_DHE_RSA_WITH_AES_256_GCM_SHA384",
            ProtocolVersion.PROTOCOLS_OF_12,
            K_DHE_RSA, B_AES_256_GCM, M_NULL, H_SHA384),
    TLS_DHE_RSA_WITH_CHACHA20_POLY1305_SHA256(
            0xCCAA, true, "TLS_DHE_RSA_WITH_CHACHA20_POLY1305_SHA256",
            ProtocolVersion.PROTOCOLS_OF_12,
            K_DHE_RSA, B_CC20_P1305, M_NULL, H_SHA256),

    // AES_128(GCM) - DHE
    TLS_DHE_RSA_WITH_AES_128_GCM_SHA256(
            0x009E, true, "TLS_DHE_RSA_WITH_AES_128_GCM_SHA256",
            ProtocolVersion.PROTOCOLS_OF_12,
            K_DHE_RSA, B_AES_128_GCM, M_NULL, H_SHA256),

    // AES_256(CBC) - ECDHE
    TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384(
            0xC024, true, "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384",
            ProtocolVersion.PROTOCOLS_OF_12,
            K_ECDHE_ECDSA, B_AES_256, M_SHA384, H_SHA384),
    TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384(
            0xC028, true, "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384",
            ProtocolVersion.PROTOCOLS_OF_12,
            K_ECDHE_RSA, B_AES_256, M_SHA384, H_SHA384),

    // AES_128(CBC) - ECDHE
    TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256(
            0xC023, true, "TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256",
            ProtocolVersion.PROTOCOLS_OF_12,
            K_ECDHE_ECDSA, B_AES_128, M_SHA256, H_SHA256),
    TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256(
            0xC027, true, "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256",
            ProtocolVersion.PROTOCOLS_OF_12,
            K_ECDHE_RSA, B_AES_128, M_SHA256, H_SHA256),

    // AES_256(CBC) - DHE
    TLS_DHE_RSA_WITH_AES_256_CBC_SHA256(
            0x006B, true, "TLS_DHE_RSA_WITH_AES_256_CBC_SHA256",
            ProtocolVersion.PROTOCOLS_OF_12,
            K_DHE_RSA, B_AES_256, M_SHA256, H_SHA256),

    // AES_128(CBC) - DHE
    TLS_DHE_RSA_WITH_AES_128_CBC_SHA256(
            0x0067, true, "TLS_DHE_RSA_WITH_AES_128_CBC_SHA256",
            ProtocolVersion.PROTOCOLS_OF_12,
            K_DHE_RSA, B_AES_128, M_SHA256, H_SHA256),

    //
    // Legacy, used for compatibility
    //

    // AES_256(CBC) - ECDHE - Using SHA
    TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA(
            0xC00A, true, "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA",
            ProtocolVersion.PROTOCOLS_TO_12,
            K_ECDHE_ECDSA, B_AES_256, M_SHA, H_SHA256),
    TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA(
            0xC014, true, "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA",
            ProtocolVersion.PROTOCOLS_TO_12,
            K_ECDHE_RSA, B_AES_256, M_SHA, H_SHA256),

    // AES_128(CBC) - ECDHE - using SHA
    TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA(
            0xC009, true, "TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA",
            ProtocolVersion.PROTOCOLS_TO_12,
            K_ECDHE_ECDSA, B_AES_128, M_SHA, H_SHA256),
    TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA(
            0xC013, true, "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA",
            ProtocolVersion.PROTOCOLS_TO_12,
            K_ECDHE_RSA, B_AES_128, M_SHA, H_SHA256),

    // AES_256(CBC) - DHE - Using SHA
    TLS_DHE_RSA_WITH_AES_256_CBC_SHA(
            0x0039, true, "TLS_DHE_RSA_WITH_AES_256_CBC_SHA",
            ProtocolVersion.PROTOCOLS_TO_12,
            K_DHE_RSA, B_AES_256, M_SHA, H_SHA256),

    // AES_128(CBC) - DHE - using SHA
    TLS_DHE_RSA_WITH_AES_128_CBC_SHA(
            0x0033, true, "TLS_DHE_RSA_WITH_AES_128_CBC_SHA",
            ProtocolVersion.PROTOCOLS_TO_12,
            K_DHE_RSA, B_AES_128, M_SHA, H_SHA256),

    // Renegotiation protection request Signalling Cipher Suite Value (SCSV).
    TLS_EMPTY_RENEGOTIATION_INFO_SCSV(        //  RFC 5746, TLS 1.2 and prior
            0x00FF, true, "TLS_EMPTY_RENEGOTIATION_INFO_SCSV",
            ProtocolVersion.PROTOCOLS_TO_12,
            K_SCSV, B_NULL, M_NULL, H_NONE),

    C_NULL("SSL_NULL_WITH_NULL_NULL", 0x0000);

    final int id;
    final boolean isDefaultEnabled;
    final String name;
    final List<ProtocolVersion> supportedProtocols;
    final KeyExchange keyExchange;
    final SSLCipher bulkCipher;
    final MacAlg macAlg;
    final HashAlg hashAlg;

    private static final Map<Integer, CipherSuite> cipherSuiteIds;
    private static final Map<String, CipherSuite> cipherSuiteNames;
    private static final List<CipherSuite> allowedCipherSuites;
    private static final List<CipherSuite> defaultCipherSuites;

    static {
        Map<Integer, CipherSuite> ids = new HashMap<>();
        Map<String, CipherSuite> names = new HashMap<>();
        List<CipherSuite> allowedCS = new ArrayList<>();
        List<CipherSuite> defaultCS = new ArrayList<>();

        for(CipherSuite cs : CipherSuite.values()) {
            ids.put(cs.id, cs);
            names.put(cs.name, cs);

            if (!cs.supportedProtocols.isEmpty()) {
                allowedCS.add(cs);
            }

            if (cs.isDefaultEnabled) {
                defaultCS.add(cs);
            }
        }

        cipherSuiteIds = Map.copyOf(ids);
        cipherSuiteNames = Map.copyOf(names);
        allowedCipherSuites = List.copyOf(allowedCS);
        defaultCipherSuites = List.copyOf(defaultCS);
    }

    // the cipher suite of a session that has not negotiated one yet
    CipherSuite(String name, int id) {
        this(id, false, name,
                ProtocolVersion.PROTOCOLS_EMPTY, null, null, null, null);
    }

    // TLS 1.3 cipher suite
    CipherSuite(int id, boolean isDefaultEnabled,
            String name, ProtocolVersion[] supportedProtocols,
            SSLCipher bulkCipher, HashAlg hashAlg) {
        this(id, isDefaultEnabled, name,
                supportedProtocols, null, bulkCipher, M_NULL, hashAlg);
    }

    CipherSuite(int id, boolean isDefaultEnabled,
            String name,
            ProtocolVersion[] supportedProtocols,
            KeyExchange keyExchange, SSLCipher cipher,
            MacAlg macAlg, HashAlg hashAlg) {
        this.id = id;
        this.isDefaultEnabled = isDefaultEnabled;
        this.name = name;
        this.supportedProtocols = Arrays.asList(supportedProtocols);
        this.keyExchange = keyExchange;
        this.bulkCipher = cipher;
        this.macAlg = macAlg;
        this.hashAlg = hashAlg;
    }

    static CipherSuite nameOf(String ciperSuiteName) {
        return cipherSuiteNames.get(ciperSuiteName);
    }

    static CipherSuite valueOf(int id) {
        return cipherSuiteIds.get(id);
    }

    static String nameOf(int id) {
        CipherSuite cs = cipherSuiteIds.get(id);

        if (cs != null) {
            return cs.name;
        }

        return "UNKNOWN-CIPHER-SUITE(" + Utilities.byte16HexString(id) + ")";
    }

    static Collection<CipherSuite> allowedCipherSuites() {
        return allowedCipherSuites;
    }

    static Collection<CipherSuite> defaultCipherSuites() {
        return defaultCipherSuites;
    }

    /**
     * Validates and converts an array of cipher suite names.
     *
     * @throws IllegalArgumentException when one or more of the ciphers named
     *         by the parameter is not supported, or when the parameter is null.
     */
    static List<CipherSuite> validValuesOf(String[] names) {
        if (names == null) {
            throw new IllegalArgumentException("CipherSuites cannot be null");
        }

        List<CipherSuite> cipherSuites = new ArrayList<>(names.length);
        for (String name : names) {
            if (name == null || name.isEmpty()) {
                throw new IllegalArgumentException(
                        "The specified CipherSuites array contains " +
                        "invalid null or empty string elements");
            }

            boolean found = false;
            CipherSuite cs;
            if ((cs = cipherSuiteNames.get(name)) != null
                    && !cs.supportedProtocols.isEmpty()) {
                cipherSuites.add(cs);
                found = true;
            }
            if (!found) {
                throw new IllegalArgumentException(
                        "Unsupported CipherSuite: "  + name);
            }
        }

        return Collections.unmodifiableList(cipherSuites);
    }

    static String[] namesOf(List<CipherSuite> cipherSuites) {
        String[] names = new String[cipherSuites.size()];
        int i = 0;
        for (CipherSuite cipherSuite : cipherSuites) {
            names[i++] = cipherSuite.name;
        }

        return names;
    }

    boolean isAvailable() {
        // Note: keyExchange is null for TLS 1.3 CipherSuites.
        return !supportedProtocols.isEmpty() &&
                (keyExchange == null || keyExchange.isAvailable()) &&
                bulkCipher != null && bulkCipher.isAvailable();
    }

    public boolean supports(ProtocolVersion protocolVersion) {
        return supportedProtocols.contains(protocolVersion);
    }

    boolean isNegotiable() {
        return this != TLS_EMPTY_RENEGOTIATION_INFO_SCSV && isAvailable();
    }

    // See also SSLWriteCipher.calculatePacketSize().
    int calculatePacketSize(int fragmentSize,
            ProtocolVersion protocolVersion, boolean isDTLS) {
        int packetSize = fragmentSize;
        if (bulkCipher != null && bulkCipher != B_NULL) {
            int blockSize = bulkCipher.ivSize;
            switch (bulkCipher.cipherType) {
                case BLOCK_CIPHER:
                    packetSize += macAlg.size;
                    packetSize += 1;        // 1 byte padding length field
                    packetSize +=           // use the minimal padding
                            (blockSize - (packetSize % blockSize)) % blockSize;
                    if (protocolVersion.useTLS11PlusSpec()) {
                        packetSize += blockSize;        // explicit IV
                    }

                    break;
                case AEAD_CIPHER:
                    if (protocolVersion == ProtocolVersion.TLS12 ||
                            protocolVersion == ProtocolVersion.DTLS12) {
                        packetSize +=
                                bulkCipher.ivSize - bulkCipher.fixedIvSize;
                    }
                    packetSize += bulkCipher.tagSize;

                    break;
                default:    // NULL_CIPHER
                    packetSize += macAlg.size;
            }
        }

        return packetSize +
            (isDTLS ? DTLSRecord.headerSize : SSLRecord.headerSize);
    }

    // See also CipherBox.calculateFragmentSize().
    int calculateFragSize(int packetLimit,
            ProtocolVersion protocolVersion, boolean isDTLS) {
        int fragSize = packetLimit -
                (isDTLS ? DTLSRecord.headerSize : SSLRecord.headerSize);
        if (bulkCipher != null && bulkCipher != B_NULL) {
            int blockSize = bulkCipher.ivSize;
            switch (bulkCipher.cipherType) {
                case BLOCK_CIPHER:
                    if (protocolVersion.useTLS11PlusSpec()) {
                        fragSize -= blockSize;          // explicit IV
                    }
                    fragSize -= (fragSize % blockSize); // cannot hold a block
                    // No padding for a maximum fragment.
                    fragSize -= 1;        // 1 byte padding length field: 0x00
                    fragSize -= macAlg.size;

                    break;
                case AEAD_CIPHER:
                    fragSize -= bulkCipher.tagSize;
                    fragSize -= bulkCipher.ivSize - bulkCipher.fixedIvSize;

                    break;
                default:    // NULL_CIPHER
                    fragSize -= macAlg.size;
            }
        }

        return fragSize;
    }

    /**
     * An SSL/TLS key exchange algorithm.
     */
    enum KeyExchange {
        K_DHE_RSA       ("DHE_RSA",        true,  NAMED_GROUP_FFDHE),

        // These KeyExchanges can use either ECDHE/XDH, so we'll use a
        // varargs here.
        K_ECDHE_ECDSA   ("ECDHE_ECDSA",    JsseJce.ALLOW_ECC,
            NAMED_GROUP_ECDHE, NAMED_GROUP_XDH),
        K_ECDHE_RSA     ("ECDHE_RSA",      JsseJce.ALLOW_ECC,
            NAMED_GROUP_ECDHE, NAMED_GROUP_XDH),

        // renegotiation protection request signaling cipher suite
        K_SCSV          ("SCSV",           true,  NAMED_GROUP_NONE);

        // name of the key exchange algorithm, e.g. DHE_RSA
        final String name;
        final boolean allowed;
        final NamedGroupSpec[] groupTypes;
        private final boolean alwaysAvailable;

        KeyExchange(String name, boolean allowed,
                NamedGroupSpec... groupTypes) {
            this.name = name;
            this.groupTypes = groupTypes;
            this.allowed = allowed;

            this.alwaysAvailable = allowed && (!name.startsWith("EC"));
        }

        boolean isAvailable() {
            if (alwaysAvailable) {
                return true;
            }

            if (NamedGroupSpec.arrayContains(groupTypes,
                    NamedGroupSpec.NAMED_GROUP_ECDHE)) {
                return (allowed && JsseJce.isEcAvailable());
            } else {
                return allowed;
            }
        }

        @Override
        public String toString() {
            return name;
        }
    }

    /**
     * An SSL/TLS key MAC algorithm.
     *
     * Also contains a factory method to obtain an initialized MAC
     * for this algorithm.
     */
    enum MacAlg {
        M_NULL      ("NULL",     0,   0,   0),
        M_SHA       ("SHA",     20,  64,   9),
        M_SHA256    ("SHA256",  32,  64,   9),
        M_SHA384    ("SHA384",  48, 128,  17);

        // descriptive name, e.g. MD5
        final String name;

        // size of the MAC value (and MAC key) in bytes
        final int size;

        // block size of the underlying hash algorithm
        final int hashBlockSize;

        // minimal padding size of the underlying hash algorithm
        final int minimalPaddingSize;

        MacAlg(String name, int size,
                int hashBlockSize, int minimalPaddingSize) {
            this.name = name;
            this.size = size;
            this.hashBlockSize = hashBlockSize;
            this.minimalPaddingSize = minimalPaddingSize;
        }

        @Override
        public String toString() {
            return name;
        }
    }

    /**
     * The hash algorithms used for PRF (PseudoRandom Function) or HKDF.
     *
     * Note that TLS 1.1- uses a single MD5/SHA1-based PRF algorithm for
     * generating the necessary material.
     */
    enum HashAlg {
        H_NONE      ("NONE",    0,    0),
        H_SHA256    ("SHA-256", 32,  64),
        H_SHA384    ("SHA-384", 48, 128);

        final String name;
        final int hashLength;
        final int blockSize;
        final String hkdfAlgorithm;

        HashAlg(String hashAlg, int hashLength, int blockSize) {
            this.name = hashAlg;
            this.hashLength = hashLength;
            this.blockSize = blockSize;
            this.hkdfAlgorithm = "HKDF-" + hashAlg.replace("-", "");
        }

        @Override
        public String toString() {
            return name;
        }
    }
}
