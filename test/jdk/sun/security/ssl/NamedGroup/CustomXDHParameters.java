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
 * @summary The AlgorithmParameters of x25519 and x448 that a custom provider
 *          supplies for XDH should be passed to the AlgorithmConstraints of
 *          the application, as the null that no provider supplies is
 * @run main/othervm CustomXDHParameters present
 * @run main/othervm CustomXDHParameters configured
 * @run main/othervm CustomXDHParameters absent
 * @run main/othervm CustomXDHParameters init-fails
 */

import java.io.IOException;
import java.nio.ByteBuffer;
import java.security.AlgorithmConstraints;
import java.security.AlgorithmParameters;
import java.security.AlgorithmParametersSpi;
import java.security.CryptoPrimitive;
import java.security.Key;
import java.security.Provider;
import java.security.Security;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.InvalidParameterSpecException;
import java.security.spec.NamedParameterSpec;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLEngine;
import javax.net.ssl.SSLEngineResult;
import javax.net.ssl.SSLParameters;

public class CustomXDHParameters {

    private static final int GROUP_X25519 = 29;
    private static final int GROUP_X448 = 30;

    private static final int EXT_SUPPORTED_GROUPS = 10;

    // Whether the AlgorithmParameters of the provider accept the parameters
    private static boolean initFails;

    public static void main(String[] args) throws Exception {
        String mode = args[0];

        // The provider needs to be installed before the first use of TLS,
        // as the named groups are initialized once.
        boolean supplied = mode.equals("present") || mode.equals("configured");
        initFails = mode.equals("init-fails");
        if (mode.equals("configured")) {
            // As in java.security, so that it is loaded on demand
            int n = 1;
            while (Security.getProperty("security.provider." + n) != null) {
                n++;
            }
            Security.setProperty("security.provider." + n,
                    XDHProvider.class.getName());
        } else if (!mode.equals("absent")) {
            Security.addProvider(new XDHProvider());
        }

        // Reject x25519 by its parameters only, not by its name.
        XDHConstraints constraints = new XDHConstraints("X25519");
        Set<Integer> groups = clientHelloGroups(constraints);
        System.out.println("supported_groups: " + groups);
        System.out.println("XDH parameters: " + constraints.params);

        if (constraints.params.size() < 2) {
            throw new RuntimeException("The constraints were not asked for "
                    + "x25519 and x448: " + constraints.params);
        }

        if (supplied) {
            // The constraints are asked about the parameters of the provider
            Set<String> names = new HashSet<>();
            for (AlgorithmParameters ap : constraints.params) {
                if (ap == null) {
                    throw new RuntimeException("No parameters passed");
                }
                if (!(ap.getProvider() instanceof XDHProvider)
                        || !ap.getAlgorithm().equals("XDH")) {
                    throw new RuntimeException("Not from the provider: " + ap);
                }
                names.add(ap.getParameterSpec(NamedParameterSpec.class)
                        .getName());
            }
            if (!names.equals(Set.of("X25519", "X448"))) {
                throw new RuntimeException("Unexpected parameters: " + names);
            }

            // and the decision follows them
            if (groups.contains(GROUP_X25519)
                    || !groups.contains(GROUP_X448)) {
                throw new RuntimeException("x25519 should be rejected by " +
                        "its parameters, and x448 accepted: " + groups);
            }
        } else {
            // No parameters, so the constraints cannot reject x25519 by them
            for (AlgorithmParameters ap : constraints.params) {
                if (ap != null) {
                    throw new RuntimeException("Unexpected parameters: " + ap);
                }
            }
            if (!groups.contains(GROUP_X25519)
                    || !groups.contains(GROUP_X448)) {
                throw new RuntimeException("x25519 and x448 should be " +
                        "accepted: " + groups);
            }
        }
    }

    // The ids in the supported_groups extension of the ClientHello for an
    // engine that is set to use the constraints.
    private static Set<Integer> clientHelloGroups(
            AlgorithmConstraints constraints) throws Exception {
        SSLContext ctx = SSLContext.getInstance("TLS");
        ctx.init(null, null, null);
        SSLEngine engine = ctx.createSSLEngine();
        engine.setUseClientMode(true);
        SSLParameters sslParams = engine.getSSLParameters();
        sslParams.setAlgorithmConstraints(constraints);
        engine.setSSLParameters(sslParams);

        ByteBuffer out = ByteBuffer.allocate(
                engine.getSession().getPacketBufferSize());
        SSLEngineResult result = engine.wrap(ByteBuffer.allocate(0), out);
        if (result.getStatus() != SSLEngineResult.Status.OK) {
            throw new RuntimeException("Unexpected result: " + result);
        }
        out.flip();

        // TLS record header, and handshake header
        if (out.get() != 22) {
            throw new RuntimeException("Not a handshake record");
        }
        skip(out, 4);
        if (out.get() != 1) {
            throw new RuntimeException("Not a ClientHello");
        }
        // length, version, random, session id, cipher suites, compression
        skip(out, 3 + 2 + 32);
        skip(out, out.get() & 0xFF);
        skip(out, out.getShort() & 0xFFFF);
        skip(out, out.get() & 0xFF);

        int extensionsLength = out.getShort() & 0xFFFF;
        int end = out.position() + extensionsLength;
        Set<Integer> groups = new HashSet<>();
        while (out.position() < end) {
            int type = out.getShort() & 0xFFFF;
            int length = out.getShort() & 0xFFFF;
            if (type == EXT_SUPPORTED_GROUPS) {
                int groupsEnd = out.position() + length;
                out.getShort();
                while (out.position() < groupsEnd) {
                    groups.add(out.getShort() & 0xFFFF);
                }
            } else {
                skip(out, length);
            }
        }

        return groups;
    }

    private static void skip(ByteBuffer buffer, int length) {
        buffer.position(buffer.position() + length);
    }

    // Records the parameters it is asked about for XDH, and rejects the
    // named parameters that are set.
    private static class XDHConstraints implements AlgorithmConstraints {
        private final String rejected;
        final List<AlgorithmParameters> params =
                Collections.synchronizedList(new ArrayList<>());

        XDHConstraints(String rejected) {
            this.rejected = rejected;
        }

        @Override
        public boolean permits(Set<CryptoPrimitive> primitives,
                String algorithm, AlgorithmParameters parameters) {
            if (!algorithm.equals("XDH")) {
                return true;
            }

            params.add(parameters);
            if (parameters == null) {
                return true;
            }
            try {
                return !rejected.equals(parameters.getParameterSpec(
                        NamedParameterSpec.class).getName());
            } catch (InvalidParameterSpecException e) {
                throw new RuntimeException(e);
            }
        }

        @Override
        public boolean permits(Set<CryptoPrimitive> primitives, Key key) {
            return true;
        }

        @Override
        public boolean permits(Set<CryptoPrimitive> primitives,
                String algorithm, Key key, AlgorithmParameters parameters) {
            return true;
        }
    }

    // A provider of the AlgorithmParameters of XDH, which no JDK provider has
    public static class XDHProvider extends Provider {
        public XDHProvider() {
            super("XDHProvider", "1.0", "AlgorithmParameters of XDH");
            put("AlgorithmParameters.XDH", XDHParameters.class.getName());
        }
    }

    public static class XDHParameters extends AlgorithmParametersSpi {
        private NamedParameterSpec spec;

        @Override
        protected void engineInit(AlgorithmParameterSpec paramSpec)
                throws InvalidParameterSpecException {
            if (initFails || !(paramSpec instanceof NamedParameterSpec nps)) {
                throw new InvalidParameterSpecException("Not supported");
            }
            spec = nps;
        }

        @Override
        protected void engineInit(byte[] params) throws IOException {
            throw new IOException("Not supported");
        }

        @Override
        protected void engineInit(byte[] params, String format)
                throws IOException {
            throw new IOException("Not supported");
        }

        @Override
        protected <T extends AlgorithmParameterSpec> T engineGetParameterSpec(
                Class<T> paramSpec) throws InvalidParameterSpecException {
            if (spec == null || !paramSpec.isInstance(spec)) {
                throw new InvalidParameterSpecException("Not supported");
            }
            return paramSpec.cast(spec);
        }

        @Override
        protected byte[] engineGetEncoded() throws IOException {
            throw new IOException("Not supported");
        }

        @Override
        protected byte[] engineGetEncoded(String format) throws IOException {
            throw new IOException("Not supported");
        }

        @Override
        protected String engineToString() {
            return "XDH " + (spec == null ? null : spec.getName());
        }
    }
}
