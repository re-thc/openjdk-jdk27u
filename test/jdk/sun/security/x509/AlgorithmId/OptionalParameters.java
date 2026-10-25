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

/*
 * @test
 * @summary Optional AlgorithmId parameters preserve live provider selection and failures
 * @modules java.base/sun.security.util java.base/sun.security.x509
 * @run main/othervm OptionalParameters
 */

import java.io.IOException;
import java.security.AlgorithmParameters;
import java.security.AlgorithmParametersSpi;
import java.security.Provider;
import java.security.ProviderException;
import java.security.Security;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.InvalidParameterSpecException;
import java.util.Arrays;
import java.util.List;

import sun.security.util.DerOutputStream;
import sun.security.util.DerValue;
import sun.security.util.ObjectIdentifier;
import sun.security.x509.AlgorithmId;

public class OptionalParameters {
    private static final String OID = "1.3.6.1.4.1.42.2.27.999.1";
    private static final String ALIAS = "MutableParameters";
    private static final byte[] ENCODED = {4, 1, 7};

    public static void main(String[] args) throws Exception {
        MutableProvider first = new MutableProvider();
        Provider second = new Provider("SecondParameters", "1", "parameter test") {};
        Security.insertProviderAt(first, 1);
        Security.insertProviderAt(second, 2);
        try {
            check(null);
            first.put("AlgorithmParameters." + ALIAS, Parameters.class.getName());
            first.put("Alg.Alias.AlgorithmParameters." + OID, ALIAS);
            AlgorithmParameters a = check(first);
            AlgorithmParameters b = check(first);
            if (a == b) throw new AssertionError("Shared parameter instances");
            first.remove("Alg.Alias.AlgorithmParameters." + OID);
            check(null);
            first.put("Alg.Alias.AlgorithmParameters." + OID, ALIAS);
            first.remove("AlgorithmParameters." + ALIAS);
            check(null);
            first.put("AlgorithmParameters." + ALIAS, "MissingSpi");
            second.put("AlgorithmParameters." + OID, Parameters.class.getName());
            check(second);
            Security.removeProvider(second.getName());
            check(null);
            first.put("AlgorithmParameters." + ALIAS, Parameters.class.getName());
            first.put("Alg.Alias.AlgorithmParameters." + OID, ALIAS);
            Parameters.fail = true;
            try {
                check(first);
                throw new AssertionError("Parameter decoding failure suppressed");
            } catch (IOException expected) {
                if (!expected.getMessage().equals("decode failure")) throw expected;
            }
            Parameters.fail = false;
            first.remove("AlgorithmParameters." + ALIAS);
            first.failConstruction();
            try {
                check(first);
                throw new AssertionError("Unchecked construction failure suppressed");
            } catch (ProviderException expected) {
                if (!expected.getMessage().equals("construction failure")) throw expected;
            }
        } finally {
            Security.removeProvider(first.getName());
            Security.removeProvider(second.getName());
        }
    }

    private static class MutableProvider extends Provider {
        MutableProvider() { super("FirstParameters", "1", "parameter test"); }
        void failConstruction() {
            putService(new Service(this, "AlgorithmParameters", OID,
                    Parameters.class.getName(), List.of(), null) {
                @Override public Object newInstance(Object ignored) {
                    throw new ProviderException("construction failure");
                }
            });
        }
    }

    private static AlgorithmParameters check(Provider expected) throws Exception {
        DerOutputStream fields = new DerOutputStream();
        fields.putOID(ObjectIdentifier.of(OID));
        fields.write(ENCODED);
        DerOutputStream sequence = new DerOutputStream();
        sequence.write(DerValue.tag_Sequence, fields);
        AlgorithmId id = AlgorithmId.parse(new DerValue(sequence.toByteArray()));
        if (!Arrays.equals(id.getEncodedParams(), ENCODED)) {
            throw new AssertionError("Raw parameters changed");
        }
        AlgorithmParameters parameters = id.getParameters();
        if (expected == null) {
            if (parameters != null) throw new AssertionError("Expected no parameters");
        } else if (parameters == null || parameters.getProvider() != expected ||
                !Arrays.equals(parameters.getEncoded(), ENCODED)) {
            throw new AssertionError("Wrong parameters: " + parameters);
        }
        return parameters;
    }

    public static class Parameters extends AlgorithmParametersSpi {
        static boolean fail;
        private byte[] bytes;
        @Override protected void engineInit(byte[] encoded) throws IOException {
            if (fail) throw new IOException("decode failure");
            bytes = encoded.clone();
        }
        @Override protected void engineInit(byte[] encoded, String format) throws IOException {
            engineInit(encoded);
        }
        @Override protected void engineInit(AlgorithmParameterSpec spec)
                throws InvalidParameterSpecException {
            throw new InvalidParameterSpecException();
        }
        @Override protected <T extends AlgorithmParameterSpec> T engineGetParameterSpec(Class<T> type)
                throws InvalidParameterSpecException {
            throw new InvalidParameterSpecException();
        }
        @Override protected byte[] engineGetEncoded() { return bytes.clone(); }
        @Override protected byte[] engineGetEncoded(String format) { return engineGetEncoded(); }
        @Override protected String engineToString() { return "test parameters"; }
    }
}
