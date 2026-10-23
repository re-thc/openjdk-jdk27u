/*
 * Copyright (c) 2015, 2025, Oracle and/or its affiliates. All rights reserved.
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

import java.io.IOException;
import java.util.*;
import java.util.AbstractMap.SimpleImmutableEntry;

final class SSLKeyExchange implements SSLKeyAgreementGenerator,
        SSLHandshakeBinding {
    private final List<SSLAuthentication> authentication;
    private final SSLKeyAgreement keyAgreement;

    SSLKeyExchange(List<X509Authentication> authentication,
            SSLKeyAgreement keyAgreement) {
        if (authentication != null) {
            this.authentication = List.copyOf(authentication);
        } else {
            this.authentication = null;
        }
        this.keyAgreement = keyAgreement;
    }

    SSLPossession[] createPossessions(HandshakeContext context) {
        // authentication
        SSLPossession authPossession = null;
        if (authentication != null) {
            // Loop through potential authentication types and end at
            // the first non-null possession.
            for (SSLAuthentication authType : authentication) {
                if ((authPossession = authType.createPossession(context))
                        != null) {
                    break;
                }
            }

            if (authPossession == null) {
                return new SSLPossession[0];
            } else if (context instanceof ServerHandshakeContext shc) {
                // The authentication information may be used further for
                // key agreement parameters negotiation.
                shc.interimAuthn = authPossession;
            }
        }

        // key agreement
        SSLPossession kaPossession = keyAgreement.createPossession(context);
        if (kaPossession == null) {
            return new SSLPossession[0];
        } else {
            return authentication != null ?
                    new SSLPossession[] {authPossession, kaPossession} :
                    new SSLPossession[] {kaPossession};
        }
    }

    @Override
    public SSLKeyDerivation createKeyDerivation(
            HandshakeContext handshakeContext) throws IOException {
        return keyAgreement.createKeyDerivation(handshakeContext);
    }

    @Override
    public SSLHandshake[] getRelatedHandshakers(
            HandshakeContext handshakeContext) {
        SSLHandshake[] auHandshakes = null;
        if (authentication != null) {
            for (SSLAuthentication authType : authentication) {
                auHandshakes = authType.getRelatedHandshakers(handshakeContext);
                if (auHandshakes != null && auHandshakes.length > 0) {
                    break;
                }
            }
        }

        SSLHandshake[] kaHandshakes =
                keyAgreement.getRelatedHandshakers(handshakeContext);

        if (auHandshakes == null || auHandshakes.length == 0) {
            return kaHandshakes;
        } else if (kaHandshakes == null || kaHandshakes.length == 0) {
            return auHandshakes;
        } else {
            SSLHandshake[] producers = Arrays.copyOf(
                     auHandshakes, auHandshakes.length + kaHandshakes.length);
            System.arraycopy(kaHandshakes, 0,
                    producers, auHandshakes.length, kaHandshakes.length);
            return producers;
        }
    }

    @Override
    public Map.Entry<Byte, HandshakeProducer>[] getHandshakeProducers(
            HandshakeContext handshakeContext) {
        Map.Entry<Byte, HandshakeProducer>[] auProducers = null;
        if (authentication != null) {
            for (SSLAuthentication authType : authentication) {
                auProducers = authType.getHandshakeProducers(handshakeContext);
                if (auProducers != null && auProducers.length > 0) {
                    break;
                }
            }
        }

        Map.Entry<Byte, HandshakeProducer>[] kaProducers =
                keyAgreement.getHandshakeProducers(handshakeContext);

        if (auProducers == null || auProducers.length == 0) {
            return kaProducers;
        } else if (kaProducers == null || kaProducers.length == 0) {
            return auProducers;
        } else {
            Map.Entry<Byte, HandshakeProducer>[] producers = Arrays.copyOf(
                     auProducers, auProducers.length + kaProducers.length);
            System.arraycopy(kaProducers, 0,
                    producers, auProducers.length, kaProducers.length);
            return producers;
        }
    }

    @Override
    public Map.Entry<Byte, SSLConsumer>[] getHandshakeConsumers(
            HandshakeContext handshakeContext) {
        Map.Entry<Byte, SSLConsumer>[] auConsumers = null;
        if (authentication != null) {
            for (SSLAuthentication authType : authentication) {
                auConsumers = authType.getHandshakeConsumers(handshakeContext);
                if (auConsumers != null && auConsumers.length > 0) {
                    break;
                }
            }
        }

        Map.Entry<Byte, SSLConsumer>[] kaConsumers =
                keyAgreement.getHandshakeConsumers(handshakeContext);

        if (auConsumers == null || auConsumers.length == 0) {
            return kaConsumers;
        } else if (kaConsumers == null || kaConsumers.length == 0) {
            return auConsumers;
        } else {
            Map.Entry<Byte, SSLConsumer>[] producers = Arrays.copyOf(
                     auConsumers, auConsumers.length + kaConsumers.length);
            System.arraycopy(kaConsumers, 0,
                    producers, auConsumers.length, kaConsumers.length);
            return producers;
        }
    }

    // (D)TLS 1.2
    static SSLKeyExchange valueOf(
            CipherSuite.KeyExchange keyExchange,
            ProtocolVersion protocolVersion) {
        if (keyExchange == null || protocolVersion == null) {
            return null;
        }

        switch (keyExchange) {
            case K_DHE_RSA:
                return SSLKeyExDHERSAOrPSS.KE;
            case K_ECDHE_ECDSA:
                return SSLKeyExECDHEECDSA.KE;
            case K_ECDHE_RSA:
                return SSLKeyExECDHERSAOrPSS.KE;
        }

        return null;
    }

    // TLS 1.3
    static SSLKeyExchange valueOf(NamedGroup namedGroup) {
        SSLKeyAgreement ka = T13KeyAgreement.valueOf(namedGroup);
        if (ka != null) {
            return new SSLKeyExchange(null, ka);
        }

        return null;
    }

    private static class SSLKeyExDHERSAOrPSS {
        private static final SSLKeyExchange KE = new SSLKeyExchange(
                List.of(X509Authentication.RSA_OR_PSS), T12KeyAgreement.DHE);
    }

    private static class SSLKeyExECDHEECDSA {
        private static final SSLKeyExchange KE = new SSLKeyExchange(
                List.of(X509Authentication.EC, X509Authentication.EDDSA),
                T12KeyAgreement.ECDHE);
    }

    private static class SSLKeyExECDHERSAOrPSS {
        private static final SSLKeyExchange KE = new SSLKeyExchange(
                List.of(X509Authentication.RSA_OR_PSS), T12KeyAgreement.ECDHE);
    }

    private enum T12KeyAgreement implements SSLKeyAgreement {
        DHE             ("dhe",         DHKeyExchange.poGenerator,
                                        DHKeyExchange.kaGenerator),
        ECDHE           ("ecdhe",       ECDHKeyExchange.poGenerator,
                                        ECDHKeyExchange.ecdheXdhKAGenerator);

        final String name;
        final SSLPossessionGenerator possessionGenerator;
        final SSLKeyAgreementGenerator keyAgreementGenerator;

        T12KeyAgreement(String name,
                SSLPossessionGenerator possessionGenerator,
                SSLKeyAgreementGenerator keyAgreementGenerator) {
            this.name = name;
            this.possessionGenerator = possessionGenerator;
            this.keyAgreementGenerator = keyAgreementGenerator;
        }

        @Override
        public SSLPossession createPossession(HandshakeContext context) {
            return possessionGenerator.createPossession(context);
        }

        @Override
        public SSLKeyDerivation createKeyDerivation(
                HandshakeContext context) throws IOException {
            return keyAgreementGenerator.createKeyDerivation(context);
        }

        @Override
        public SSLHandshake[] getRelatedHandshakers(
                HandshakeContext handshakeContext) {
            if (!handshakeContext.negotiatedProtocol.useTLS13PlusSpec()) {
                return new SSLHandshake[] {
                        SSLHandshake.SERVER_KEY_EXCHANGE
                    };
            }

            return new SSLHandshake[0];
        }

        @Override
        @SuppressWarnings({"unchecked", "rawtypes"})
        public Map.Entry<Byte, HandshakeProducer>[] getHandshakeProducers(
                HandshakeContext handshakeContext) {
            if (handshakeContext.negotiatedProtocol.useTLS13PlusSpec()) {
                return (Map.Entry<Byte, HandshakeProducer>[])(new Map.Entry[0]);
            }

            if (handshakeContext.sslConfig.isClientMode) {
                switch (this) {
                    case DHE:
                        return (Map.Entry<Byte,
                                HandshakeProducer>[])(new Map.Entry[] {
                            new SimpleImmutableEntry<Byte, HandshakeProducer>(
                                    SSLHandshake.CLIENT_KEY_EXCHANGE.id,
                                    DHClientKeyExchange.dhHandshakeProducer
                            )
                        });

                    case ECDHE:
                        return (Map.Entry<Byte,
                                HandshakeProducer>[])(new Map.Entry[] {
                            new SimpleImmutableEntry<>(
                                SSLHandshake.CLIENT_KEY_EXCHANGE.id,
                                ECDHClientKeyExchange.ecdheHandshakeProducer
                            )
                        });
                }
            } else {
                switch (this) {
                    case DHE:
                        return (Map.Entry<Byte,
                                HandshakeProducer>[])(new Map.Entry[] {
                            new SimpleImmutableEntry<>(
                                    SSLHandshake.SERVER_KEY_EXCHANGE.id,
                                    DHServerKeyExchange.dhHandshakeProducer
                            )
                        });

                    case ECDHE:
                        return (Map.Entry<Byte,
                                HandshakeProducer>[])(new Map.Entry[] {
                            new SimpleImmutableEntry<>(
                                    SSLHandshake.SERVER_KEY_EXCHANGE.id,
                                    ECDHServerKeyExchange.ecdheHandshakeProducer
                            )
                        });
                }
            }

            return (Map.Entry<Byte, HandshakeProducer>[])(new Map.Entry[0]);
        }

        @Override
        @SuppressWarnings({"unchecked", "rawtypes"})
        public Map.Entry<Byte, SSLConsumer>[] getHandshakeConsumers(
                HandshakeContext handshakeContext) {
            if (handshakeContext.negotiatedProtocol.useTLS13PlusSpec()) {
                return (Map.Entry<Byte, SSLConsumer>[])(new Map.Entry[0]);
            }

            if (handshakeContext.sslConfig.isClientMode) {
                switch (this) {
                    case DHE:
                        return (Map.Entry<Byte,
                                SSLConsumer>[])(new Map.Entry[] {
                            new SimpleImmutableEntry<>(
                                    SSLHandshake.SERVER_KEY_EXCHANGE.id,
                                    DHServerKeyExchange.dhHandshakeConsumer
                            )
                        });

                    case ECDHE:
                        return (Map.Entry<Byte,
                                SSLConsumer>[])(new Map.Entry[] {
                            new SimpleImmutableEntry<>(
                                    SSLHandshake.SERVER_KEY_EXCHANGE.id,
                                    ECDHServerKeyExchange.ecdheHandshakeConsumer
                            )
                        });
                }
            } else {
                switch (this) {
                    case DHE:
                        return (Map.Entry<Byte,
                                SSLConsumer>[])(new Map.Entry[] {
                            new SimpleImmutableEntry<>(
                                    SSLHandshake.CLIENT_KEY_EXCHANGE.id,
                                    DHClientKeyExchange.dhHandshakeConsumer
                            )
                        });

                    case ECDHE:
                        return (Map.Entry<Byte,
                                SSLConsumer>[])(new Map.Entry[] {
                            new SimpleImmutableEntry<>(
                                SSLHandshake.CLIENT_KEY_EXCHANGE.id,
                                ECDHClientKeyExchange.ecdheHandshakeConsumer
                            )
                        });
                }
            }

            return (Map.Entry<Byte, SSLConsumer>[])(new Map.Entry[0]);
        }
    }

    private static final class T13KeyAgreement implements SSLKeyAgreement {
        private final NamedGroup namedGroup;

        private T13KeyAgreement(NamedGroup namedGroup) {
            this.namedGroup = namedGroup;
        }

        static T13KeyAgreement valueOf(NamedGroup namedGroup) {
            return new T13KeyAgreement(namedGroup);
        }

        @Override
        public SSLPossession createPossession(HandshakeContext hc) {
            return namedGroup.createPossession(
                    hc instanceof ClientHandshakeContext,
                    hc.sslContext.getSecureRandom());
        }

        @Override
        public SSLKeyDerivation createKeyDerivation(
                HandshakeContext hc) throws IOException {
            return namedGroup.createKeyDerivation(hc);
        }
    }
}
