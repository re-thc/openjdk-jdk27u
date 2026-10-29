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
 * @summary Optional parameter discovery preserves live JCA selection and failures
 * @modules java.base/jdk.internal.access java.base/sun.security.jca
 * @run main/othervm OptionalParameters
 */

import java.io.IOException;
import java.security.AlgorithmParameters;
import java.security.AlgorithmParametersSpi;
import java.security.NoSuchAlgorithmException;
import java.security.Provider;
import java.security.ProviderException;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.InvalidParameterSpecException;
import java.security.spec.NamedParameterSpec;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import jdk.internal.access.SharedSecrets;
import sun.security.jca.ProviderList;
import sun.security.jca.Providers;

public class OptionalParameters {
    private static final String ALGORITHM = "OptionalParametersTest";
    private static final List<String> trace = new ArrayList<>();

    public static void main(String[] args) throws Exception {
        // Compare the optional path with the unchanged public factory. Provider
        // overrides observe calls, and may change without a registration change.
        List<String> publicTrace = scenario(false);
        List<String> optionalTrace = scenario(true);
        equal(publicTrace, optionalTrace);
        aliasesAndFreshInstances();
        threadProviderLists();
        try {
            optional(null);
            throw new AssertionError("Null algorithm accepted");
        } catch (NullPointerException expected) {
            equal(expected.getMessage(), "null algorithm name");
        }
    }

    private static List<String> scenario(boolean nullable) throws Exception {
        trace.clear();
        RecordingProvider first = new RecordingProvider("First");
        RecordingProvider second = new RecordingProvider("Second");
        ProviderList saved = Providers.beginThreadProviderList(
                ProviderList.newList(first, second));
        try {
            absent(nullable);
            // A virtual service appears without put/putService/list changes.
            first.service = first.service(() -> new Parameters());
            AlgorithmParameters a = lookup(nullable);
            check(a, first);
            first.service = null;
            absent(nullable);
            second.service = second.service(() -> new Parameters());
            check(lookup(nullable), second);

            // Malformed advertised SPI falls through to the next provider.
            first.service = first.service(Object::new);
            int beforeFallback = trace.size();
            check(lookup(nullable), second);
            equal(trace.subList(beforeFallback, trace.size()), List.of(
                    "First:get", "First:new", "First:get", "Second:get", "Second:new"));
            second.service = null;
            try {
                lookup(nullable);
                throw new AssertionError("Advertised malformed SPI treated as absent");
            } catch (NoSuchAlgorithmException expected) {
                if (expected.getMessage() == null) throw new AssertionError(expected);
            }

            ProviderException failure = new ProviderException("construction failure");
            first.service = first.service(() -> { throw failure; });
            try {
                lookup(nullable);
                throw new AssertionError("Unchecked failure suppressed");
            } catch (ProviderException expected) {
                if (expected != failure) throw new AssertionError(expected);
            }

            // Changing the current list during construction must not change
            // the list used for this lookup's construction-failure fallback.
            RecordingProvider replacement = new RecordingProvider("Replacement");
            replacement.service = replacement.service(() -> new Parameters());
            first.service = first.service(() -> {
                Providers.setProviderList(ProviderList.newList(replacement));
                throw new NoSuchAlgorithmException("try the original next service");
            });
            second.service = second.service(() -> new Parameters());
            check(lookup(nullable), second);
            check(lookup(nullable), replacement);
            return List.copyOf(trace);
        } finally {
            Providers.endThreadProviderList(saved);
        }
    }

    private static void absent(boolean nullable) throws Exception {
        if (nullable) {
            if (lookup(true) != null) throw new AssertionError("Expected absence");
        } else {
            try {
                lookup(false);
                throw new AssertionError("Public factory accepted absent algorithm");
            } catch (NoSuchAlgorithmException expected) {
                equal(expected.getMessage(), ALGORITHM + " AlgorithmParameters not available");
            }
        }
    }

    private static AlgorithmParameters lookup(boolean nullable) throws Exception {
        return nullable ? optional(ALGORITHM) : AlgorithmParameters.getInstance(ALGORITHM);
    }

    private static AlgorithmParameters optional(String algorithm)
            throws NoSuchAlgorithmException {
        return SharedSecrets.getJavaSecurityAlgorithmParametersAccess()
                .getInstanceOrNull(algorithm);
    }

    private static void check(AlgorithmParameters p, Provider provider) {
        if (p == null || p.getClass() != AlgorithmParameters.class ||
                p.getProvider() != provider || !p.getAlgorithm().equals(ALGORITHM)) {
            throw new AssertionError("Wrong parameters: " + p);
        }
    }

    private static void aliasesAndFreshInstances() throws Exception {
        Provider provider = new Provider("Alias", "1", "optional parameters") {};
        provider.put("AlgorithmParameters.Canonical", Parameters.class.getName());
        provider.put("Alg.Alias.AlgorithmParameters.RequestedAlias", "Canonical");
        ProviderList saved = Providers.beginThreadProviderList(ProviderList.newList(provider));
        try {
            AlgorithmParameters a = optional("rEqUeStEdAlIaS");
            AlgorithmParameters b = optional("rEqUeStEdAlIaS");
            if (a == null || b == null || a == b || a.getClass() != AlgorithmParameters.class ||
                    a.getProvider() != provider || b.getProvider() != provider) {
                throw new AssertionError("Alias selection or fresh wrapper lost");
            }
            equal(a.getAlgorithm(), "rEqUeStEdAlIaS");
            a.init(NamedParameterSpec.X25519);
            b.init(NamedParameterSpec.X448);
            equal(a.getParameterSpec(NamedParameterSpec.class).getName(), "X25519");
            equal(b.getParameterSpec(NamedParameterSpec.class).getName(), "X448");
            provider.remove("Alg.Alias.AlgorithmParameters.RequestedAlias");
            if (optional("RequestedAlias") != null) throw new AssertionError("Stale alias");
            provider.put("Alg.Alias.AlgorithmParameters.RequestedAlias", "Canonical");
            if (optional("RequestedAlias") == null) throw new AssertionError("New alias missed");
            provider.remove("AlgorithmParameters.Canonical");
            if (optional("RequestedAlias") != null) throw new AssertionError("Stale service");
        } finally {
            Providers.endThreadProviderList(saved);
        }
    }

    private static void threadProviderLists() throws Exception {
        RecordingProvider outer = new RecordingProvider("Outer");
        outer.service = outer.service(() -> new Parameters());
        ProviderList saved = Providers.beginThreadProviderList(ProviderList.newList(outer));
        try {
            check(optional(ALGORITHM), outer);
            AtomicReference<Throwable> failure = new AtomicReference<>();
            // A fresh lookup must honor the calling thread's provider list.
            Thread thread = Thread.ofPlatform().unstarted(() -> {
                ProviderList previous = Providers.beginThreadProviderList(ProviderList.newList());
                try {
                    if (optional(ALGORITHM) != null) throw new AssertionError("Wrong thread list");
                } catch (Throwable e) {
                    failure.set(e);
                } finally {
                    Providers.endThreadProviderList(previous);
                }
            });
            thread.start();
            thread.join();
            if (failure.get() != null) throw new AssertionError(failure.get());
            check(optional(ALGORITHM), outer);
        } finally {
            Providers.endThreadProviderList(saved);
        }
    }

    private static void equal(Object actual, Object expected) {
        if (!actual.equals(expected)) {
            throw new AssertionError("Expected " + expected + ", got " + actual);
        }
    }

    @FunctionalInterface
    private interface Factory {
        Object create() throws NoSuchAlgorithmException;
    }

    private static class RecordingProvider extends Provider {
        Service service;

        RecordingProvider(String name) {
            super(name, "1", "live optional parameters");
        }

        @Override
        public Service getService(String type, String algorithm) {
            if (type.equals("AlgorithmParameters") && algorithm.equals(ALGORITHM)) {
                trace.add(getName() + ":get");
                return service;
            }
            return null;
        }

        Service service(Factory factory) {
            return new Service(this, "AlgorithmParameters", ALGORITHM,
                    Parameters.class.getName(), List.of(), Map.of()) {
                @Override
                public Object newInstance(Object unused) throws NoSuchAlgorithmException {
                    trace.add(getName() + ":new");
                    return factory.create();
                }
            };
        }
    }

    public static class Parameters extends AlgorithmParametersSpi {
        private NamedParameterSpec spec;
        protected void engineInit(AlgorithmParameterSpec spec)
                throws InvalidParameterSpecException {
            if (!(spec instanceof NamedParameterSpec named)) {
                throw new InvalidParameterSpecException("Expected named parameters");
            }
            this.spec = named;
        }
        protected <T extends AlgorithmParameterSpec> T engineGetParameterSpec(Class<T> type) {
            return type.cast(spec);
        }
        protected void engineInit(byte[] bytes) throws IOException { throw new IOException(); }
        protected void engineInit(byte[] bytes, String format) throws IOException { throw new IOException(); }
        protected byte[] engineGetEncoded() throws IOException { throw new IOException(); }
        protected byte[] engineGetEncoded(String format) throws IOException { throw new IOException(); }
        protected String engineToString() { return "optional parameters"; }
    }
}
