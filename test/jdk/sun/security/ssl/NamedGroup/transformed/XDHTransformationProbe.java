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

import java.lang.reflect.Field;
import java.security.AlgorithmParameters;
import java.security.NoSuchAlgorithmException;
import java.security.Provider;
import java.security.spec.NamedParameterSpec;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import jdk.internal.module.ModuleReferenceImpl;

public class XDHTransformationProbe {
    public static void main(String[] args) throws Exception {
        boolean supplied = Boolean.parseBoolean(args[1]);
        var reference = ModuleLayer.boot().configuration()
                .findModule("java.security.sasl").orElseThrow().reference();
        if (!(reference instanceof ModuleReferenceImpl impl) || impl.isPatched()) {
            throw new AssertionError("Test requires an unpatched SunSASL module");
        }
        System.out.println("SunSASL module location=" + reference.location().orElseThrow()
                + " isPatched=false agent=" + System.getProperty("xdh.fixture.agent"));
        if (supplied != Boolean.getBoolean("xdh.fixture.agent")) {
            throw new AssertionError("Wrong agent state");
        }
        // Read diagnostics without defining/initializing the target provider.
        try {
            Class<?> config = Class.forName("sun.security.jca.ProviderConfig");
            Field started = config.getDeclaredField("providerDiscoveryStarted");
            started.setAccessible(true);
            if (started.getBoolean(null)) throw new AssertionError("Discovery already started");
            System.out.println("providerDiscoveryStarted=false");
        } catch (NoSuchFieldException expected) {
            System.out.println("No shortcut discovery flag");
        }
        try {
            switch (args[0]) {
                case "lookup" -> lookup("X25519", supplied);
                case "hello" -> ChangingXDHParameters.check(supplied ? "SunSASL" : null);
                case "mutation" -> mutation();
                case "concurrent" -> concurrent();
                default -> throw new IllegalArgumentException(args[0]);
            }
            if (supplied && (!Boolean.getBoolean("xdh.fixture.transformed") ||
                    !Boolean.getBoolean("xdh.fixture.installed"))) {
                throw new AssertionError("Transformed constructor did not execute");
            }
        } finally {
            System.out.println("transformed=" + System.getProperty("xdh.fixture.transformed")
                    + " installed=" + System.getProperty("xdh.fixture.installed"));
        }
        System.out.println("Passed " + args[0] + " supplied=" + supplied);
    }

    private static AlgorithmParameters lookup(String name, boolean supplied) throws Exception {
        AlgorithmParameters result;
        try {
            result = AlgorithmParameters.getInstance("XDH");
        } catch (NoSuchAlgorithmException missing) {
            if (supplied) throw new AssertionError("Transformed XDH provider was skipped", missing);
            return null;
        }
        if (!supplied || !result.getProvider().getName().equals("SunSASL")) {
            throw new AssertionError("Unexpected provider: " + result.getProvider());
        }
        result.init(new NamedParameterSpec(name));
        if (!name.equals(result.getParameterSpec(NamedParameterSpec.class).getName())) {
            throw new AssertionError("Wrong initialized parameters");
        }
        return result;
    }

    private static void mutation() throws Exception {
        lookup("X25519", true);
        Class<?> bridge = Class.forName("xdhagent.Bridge", true, null);
        Provider provider = (Provider) bridge.getField("installedProvider").get(null);
        provider.remove("AlgorithmParameters.XDH");
        lookup("X25519", false);
        provider.put("AlgorithmParameters.CustomXDH", "xdhagent.Bridge$Parameters");
        provider.put("Alg.Alias.AlgorithmParameters.XDH", "CustomXDH");
        lookup("X448", true);
        ChangingXDHParameters.check("SunSASL");
    }

    private static void concurrent() throws Exception {
        CountDownLatch start = new CountDownLatch(1);
        List<Future<AlgorithmParameters>> futures = new ArrayList<>();
        try (var pool = Executors.newFixedThreadPool(4)) {
            for (int i = 0; i < 16; i++) {
                String name = i % 2 == 0 ? "X25519" : "X448";
                futures.add(pool.submit(() -> {
                    start.await();
                    return lookup(name, true);
                }));
            }
            start.countDown();
            Set<AlgorithmParameters> identities = Collections.newSetFromMap(new IdentityHashMap<>());
            for (Future<AlgorithmParameters> future : futures) identities.add(future.get());
            if (identities.size() != futures.size()) {
                throw new AssertionError("Shared parameter instances");
            }
        }
    }
}
