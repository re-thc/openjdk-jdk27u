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
 * @summary SSLContext retains supplied randoms and primes supplied or default randoms once
 * @run main/othervm InitSecureRandom
 */

import java.security.Provider;
import java.security.SecureRandom;
import java.security.SecureRandomSpi;
import java.security.Security;
import java.util.Arrays;
import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;

public class InitSecureRandom {
    private static final Provider PROVIDER = new Provider(
            "InitRandom", "1", "SSLContext random selection test") {
        {
            put("SecureRandom.Counting", CountingSpi.class.getName());
        }
    };
    private static int instances;
    private static int outputs;

    public static void main(String[] args) throws Exception {
        Security.insertProviderAt(PROVIDER, 1);
        try {
            SuppliedRandom supplied = new SuppliedRandom();
            int before = instances;
            SSLContext context = SSLContext.getInstance("TLS");
            context.init(new KeyManager[0], new TrustManager[0], supplied);
            if (supplied.calls != 1 || instances != before || outputs != 0) {
                throw new AssertionError("Supplied random was replaced or not primed once");
            }
            context.init(new KeyManager[0], new TrustManager[0], supplied);
            if (supplied.calls != 2) throw new AssertionError("Reinitialization was not primed");

            context.init(new KeyManager[0], new TrustManager[0], null);
            if (instances != before + 1 || outputs != 1) {
                throw new AssertionError("Default provider selection or priming changed");
            }
            supplied.failure = new RuntimeException("Priming failure");
            try {
                context.init(new KeyManager[0], new TrustManager[0], supplied);
                throw new AssertionError("Priming failure was suppressed");
            } catch (RuntimeException expected) {
                if (expected != supplied.failure) throw expected;
            }
            try {
                context.createSSLEngine();
                throw new AssertionError("Failed initialization left context usable");
            } catch (IllegalStateException expected) {
                // Initialization must finish only after successful priming.
            }
        } finally {
            Security.removeProvider(PROVIDER.getName());
        }
    }

    private static class SuppliedRandom extends SecureRandom {
        int calls;
        RuntimeException failure;
        SuppliedRandom() { super(new CountingSpi(), PROVIDER); }
        @Override public int nextInt() {
            calls++;
            if (failure != null) throw failure;
            return 1;
        }
    }

    public static class CountingSpi extends SecureRandomSpi {
        public CountingSpi() { instances++; }
        @Override protected void engineSetSeed(byte[] seed) { }
        @Override protected void engineNextBytes(byte[] bytes) {
            outputs++;
            Arrays.fill(bytes, (byte) 1);
        }
        @Override protected byte[] engineGenerateSeed(int length) {
            throw new AssertionError("Unexpected seed generation");
        }
    }
}
