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
 * @summary XDH parameter lookup observes provider order, aliases and service
 *          changes, handles errors, and supports concurrent constraint checks
 * @modules java.base/sun.security.ssl:open
 * @build CustomXDHParameters
 * @run main/othervm ChangingXDHParameters changes
 * @run main/othervm ChangingXDHParameters errors
 * @run main/othervm -Djdk.tls.client.protocols=TLSv1.3
 *      -Djdk.tls.namedGroups=x25519,x448 ChangingXDHParameters dynamic-service
 * @run main/othervm ChangingXDHParameters configured
 * @run main/othervm ChangingXDHParameters preferred
 * @run main/othervm ChangingXDHParameters concurrent-absent
 * @run main/othervm ChangingXDHParameters concurrent-configured
 * @run main/othervm ChangingXDHParameters availability-present
 * @run main/othervm ChangingXDHParameters availability-absent
 * @run main/othervm -Djdk.tls.client.protocols=TLSv1.3
 *      -Djdk.tls.namedGroups=x25519,x448 ChangingXDHParameters callback-update
 */

import java.security.AlgorithmConstraints;
import java.security.AlgorithmParameters;
import java.security.CryptoPrimitive;
import java.security.Key;
import java.security.Provider;
import java.security.ProviderException;
import java.security.Security;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.InvalidParameterSpecException;
import java.security.spec.NamedParameterSpec;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.Executors;
import java.util.stream.IntStream;

public class ChangingXDHParameters {
    private static final String SPI =
            CustomXDHParameters.XDHParameters.class.getName();
    private static volatile boolean failInit;
    private static volatile boolean runtimeFailure;

    public static void main(String[] args) throws Exception {
        switch (args[0]) {
            case "changes" -> changes();
            case "errors" -> errors();
            case "dynamic-service" -> dynamicService();
            case "callback-update" -> callbackUpdate();
            case "configured" -> {
                configure(ConfigurableProvider.class.getName() + " argument");
                check("ConfiguredXDH");
            }
            case "preferred" -> {
                // Set before the provider list is first initialized.
                Security.setProperty("jdk.security.provider.preferred",
                        "AlgorithmParameters.XDH:SecondXDH");
                Security.addProvider(new ParametersProvider("FirstXDH", SPI));
                Security.addProvider(new ParametersProvider("SecondXDH", SPI));
                check("SecondXDH");
            }
            case "availability-present", "availability-absent" ->
                    availability(args[0].equals("availability-present"));
            case "concurrent-absent", "concurrent-configured" -> {
                boolean supplied = args[0].equals("concurrent-configured");
                if (supplied) {
                    configure(ConfigurableProvider.class.getName() + " argument");
                }
                try (var pool = Executors.newFixedThreadPool(8)) {
                    var jobs = IntStream.range(0, 32)
                            .<Callable<Void>>mapToObj(i -> () -> {
                                check(supplied ? "ConfiguredXDH" : null);
                                return null;
                            }).toList();
                    for (var result : pool.invokeAll(jobs)) {
                        result.get();
                    }
                }
            }
            default -> throw new IllegalArgumentException(args[0]);
        }
    }

    private static void configure(String entry) {
        int n = 1;
        while (Security.getProperty("security.provider." + n) != null) {
            n++;
        }
        Security.setProperty("security.provider." + n, entry);
    }

    private static void dynamicService() throws Exception {
        DynamicProvider provider = new DynamicProvider();
        Security.addProvider(provider);
        check(null);
        provider.visible = true;
        check("DynamicXDH");
        provider.visible = false;
        check(null);
        // A virtual service may also appear during an earlier callback in
        // the same ClientHello, without any provider or service registration.
        callbackUpdate(() -> provider.visible = true);
    }

    // Even a miss retained only for one ClientHello can hide a provider
    // installed by an earlier constraint callback in the same operation.
    private static void callbackUpdate() throws Exception {
        callbackUpdate(() -> Security.addProvider(
                new ParametersProvider("DuringCallback", SPI)));
    }

    private static void callbackUpdate(Runnable update) throws Exception {
        boolean[] updated = {false};
        boolean[] observedX448 = {false};
        AlgorithmConstraints constraints = new AlgorithmConstraints() {
            @Override
            public boolean permits(Set<CryptoPrimitive> primitives,
                    String algorithm, AlgorithmParameters parameters) {
                if (!algorithm.equals("XDH")) return true;
                if (parameters == null) {
                    if (!updated[0]) {
                        update.run();
                        updated[0] = true;
                    }
                    return true;
                }
                try {
                    String name = parameters.getParameterSpec(NamedParameterSpec.class).getName();
                    if (name.equals("X448")) {
                        observedX448[0] = true;
                        return false;
                    }
                    return true;
                } catch (InvalidParameterSpecException e) {
                    throw new AssertionError(e);
                }
            }
            @Override
            public boolean permits(Set<CryptoPrimitive> primitives, Key key) { return true; }
            @Override
            public boolean permits(Set<CryptoPrimitive> primitives, String algorithm,
                    Key key, AlgorithmParameters parameters) { return true; }
        };
        Set<Integer> groups = CustomXDHParameters.clientHelloGroups(constraints);
        if (!updated[0] || !observedX448[0] || !groups.contains(29) || groups.contains(30)) {
            throw new AssertionError("Provider update hidden within ClientHello: " + groups);
        }
    }

    private static void availability(boolean supplied) throws Exception {
        Security.removeProvider("SunEC");
        if (supplied) {
            Security.addProvider(new ParametersProvider("AvailabilityXDH", SPI));
        }
        Class<?> namedGroup = Class.forName("sun.security.ssl.NamedGroup");
        var nameOf = namedGroup.getDeclaredMethod("nameOf", String.class);
        nameOf.setAccessible(true);
        Object group = nameOf.invoke(null, "x25519");
        var available = namedGroup.getDeclaredField("isAvailable");
        available.setAccessible(true);
        if (available.getBoolean(group) != supplied) {
            throw new AssertionError("Wrong availability without KeyAgreement");
        }
        if (supplied) {
            var permits = namedGroup.getDeclaredMethod("isPermitted",
                    AlgorithmConstraints.class);
            permits.setAccessible(true);
            if ((boolean) permits.invoke(group,
                    new RecordingConstraints("AvailabilityXDH"))) {
                throw new AssertionError("Parameters should reject x25519");
            }
            Security.removeProvider("AvailabilityXDH");
            if (!(boolean) permits.invoke(group, new RecordingConstraints(null))) {
                throw new AssertionError("Removed provider's parameters retained");
            }
        }
    }

    private static void changes() throws Exception {
        check(null);
        Provider first = new ParametersProvider("FirstXDH", SPI);
        Security.addProvider(first);
        check("FirstXDH");
        Provider second = new ParametersProvider("SecondXDH", SPI);
        Security.insertProviderAt(second, 1);
        check("SecondXDH");
        Security.removeProvider("SecondXDH");
        check("FirstXDH");

        // A provider's services and aliases are mutable even when the provider
        // list itself has not changed. Neither success nor absence can be kept.
        first.remove("Alg.Alias.AlgorithmParameters.XDH");
        check(null);
        first.put("Alg.Alias.AlgorithmParameters.XDH", "CustomXDH");
        check("FirstXDH");
        first.remove("AlgorithmParameters.CustomXDH");
        check(null);
        first.put("AlgorithmParameters.CustomXDH", SPI);
        first.put("Alg.Alias.AlgorithmParameters.XDH", "CustomXDH");
        check("FirstXDH");
        Security.removeProvider("FirstXDH");
        check(null);

        // An application provider can have the same name as a JDK provider.
        Security.removeProvider("SunSASL");
        Security.addProvider(new ParametersProvider("SunSASL", SPI));
        check("SunSASL");
    }

    private static void errors() throws Exception {
        Provider broken = new ParametersProvider("BrokenXDH", "NoSuchSPI");
        Provider working = new ParametersProvider("WorkingXDH", SPI);
        Security.insertProviderAt(broken, 1);
        Security.addProvider(working);
        // A service that cannot be constructed must allow normal JCA failover.
        check("WorkingXDH");
        Security.removeProvider("BrokenXDH");
        Security.removeProvider("WorkingXDH");

        Provider toggled = new ParametersProvider("ToggledXDH",
                ToggleParameters.class.getName());
        Security.insertProviderAt(toggled, 1);
        Security.addProvider(working);
        failInit = true;
        // Parameter initialization failure does not select another provider.
        check(null);
        failInit = false;
        check("ToggledXDH");
        runtimeFailure = true;
        try {
            check("ToggledXDH");
            throw new AssertionError("ProviderException was suppressed");
        } catch (javax.net.ssl.SSLException expected) {
            if (!(expected.getCause() instanceof ProviderException cause) ||
                    !cause.getMessage().equals("XDH parameter error")) {
                throw expected;
            }
        }
    }

    static void check(String expectedProvider) throws Exception {
        RecordingConstraints constraints = new RecordingConstraints(expectedProvider);
        Set<Integer> groups = CustomXDHParameters.clientHelloGroups(constraints);
        if (constraints.calls < 2) {
            throw new AssertionError("No XDH constraint callbacks");
        }
        if (expectedProvider != null &&
                !constraints.names.equals(Set.of("X25519", "X448"))) {
            throw new AssertionError("Parameters: " + constraints.names);
        }
        // The application decision must affect the ClientHello itself.
        if (groups.contains(29) != (expectedProvider == null) ||
                !groups.contains(30)) {
            throw new AssertionError("Unexpected supported groups: " + groups);
        }
    }

    private static final class RecordingConstraints implements AlgorithmConstraints {
        private final String expectedProvider;
        final Set<String> names = new HashSet<>();
        int calls;

        RecordingConstraints(String expectedProvider) {
            this.expectedProvider = expectedProvider;
        }

        @Override
        public boolean permits(Set<CryptoPrimitive> primitives,
                String algorithm, AlgorithmParameters parameters) {
            if (!algorithm.equals("XDH")) {
                return true;
            }
            calls++;
            if (expectedProvider == null) {
                if (parameters != null) {
                    throw new AssertionError("Unexpected parameters: " + parameters);
                }
                return true;
            }
            if (parameters == null ||
                    !parameters.getProvider().getName().equals(expectedProvider)) {
                throw new AssertionError("Expected " + expectedProvider +
                        ", got " + (parameters == null ? null : parameters.getProvider()));
            }
            try {
                String name = parameters.getParameterSpec(NamedParameterSpec.class)
                        .getName();
                names.add(name);
                return !name.equals("X25519");
            } catch (InvalidParameterSpecException e) {
                throw new AssertionError(e);
            }
        }

        @Override
        public boolean permits(Set<CryptoPrimitive> primitives, Key key) {
            return true;
        }

        @Override
        public boolean permits(Set<CryptoPrimitive> primitives, String algorithm,
                Key key, AlgorithmParameters parameters) {
            return true;
        }
    }

    public static class ParametersProvider extends Provider {
        public ParametersProvider(String name, String spi) {
            super(name, "1.0", "XDH parameters for constraint checks");
            put("AlgorithmParameters.CustomXDH", spi);
            put("Alg.Alias.AlgorithmParameters.XDH", "CustomXDH");
        }
    }

    public static class DynamicProvider extends Provider {
        volatile boolean visible;
        private final Service parameters = new Service(this,
                "AlgorithmParameters", "XDH", SPI, null, null) {
            @Override
            public Object newInstance(Object unused) {
                return new CustomXDHParameters.XDHParameters();
            }
        };

        public DynamicProvider() {
            super("DynamicXDH", "1.0", "Virtual XDH service");
        }

        @Override
        public Service getService(String type, String algorithm) {
            return visible && type.equals("AlgorithmParameters") &&
                    algorithm.equalsIgnoreCase("XDH") ? parameters : null;
        }
    }

    public static class ConfigurableProvider extends Provider {
        public ConfigurableProvider() {
            super("UnconfiguredXDH", "1.0", "Configurable XDH parameters");
        }

        @Override
        public Provider configure(String argument) {
            if (!argument.equals("argument")) {
                throw new AssertionError("Unexpected configuration: " + argument);
            }
            return new ParametersProvider("ConfiguredXDH", SPI);
        }
    }

    public static class ToggleParameters
            extends CustomXDHParameters.XDHParameters {
        @Override
        protected void engineInit(AlgorithmParameterSpec spec)
                throws InvalidParameterSpecException {
            if (runtimeFailure) {
                throw new ProviderException("XDH parameter error");
            }
            if (failInit) {
                throw new InvalidParameterSpecException("Transient failure");
            }
            super.engineInit(spec);
        }
    }
}
