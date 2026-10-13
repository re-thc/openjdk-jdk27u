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
 * @summary The SecureRandom services of the SUN provider create the classes
 *          they are registered with, and report parameters that don't fit
 *          as Service.newInstance does
 * @run main SunSecureRandomServices
 */

import java.security.DrbgParameters;
import java.security.InvalidParameterException;
import java.security.NoSuchAlgorithmException;
import java.security.Provider;
import java.security.SecureRandom;
import java.security.SecureRandomParameters;
import java.security.Security;
import java.util.Set;

public class SunSecureRandomServices {

    public static void main(String[] args) throws Exception {
        Provider sun = Security.getProvider("SUN");
        int found = 0;
        for (Provider.Service s : sun.getServices()) {
            if (!s.getType().equals("SecureRandom")) {
                continue;
            }
            found++;
            String algorithm = s.getAlgorithm();
            System.out.println(algorithm + " " + s.getClassName());

            // the registered class, a new instance each time
            Object spi = s.newInstance(null);
            if (!spi.getClass().getName().equals(s.getClassName())) {
                throw new RuntimeException(algorithm + ": " + spi.getClass());
            }
            if (s.newInstance(null) == spi) {
                throw new RuntimeException(algorithm + ": same instance");
            }

            SecureRandom random = SecureRandom.getInstance(algorithm);
            if (!random.getAlgorithm().equals(algorithm)
                    || random.getProvider() != sun) {
                throw new RuntimeException(algorithm + ": " + random);
            }
            random.nextBytes(new byte[16]);

            // not a SecureRandomParameters
            try {
                s.newInstance("parameter");
                throw new RuntimeException(algorithm + ": no exception");
            } catch (NoSuchAlgorithmException e) {
                if (!(e.getCause() instanceof InvalidParameterException)) {
                    throw new RuntimeException(algorithm, e);
                }
                System.out.println("  " + e.getCause().getMessage());
            }

            // a SecureRandomParameters that none of them supports
            try {
                s.newInstance(new SecureRandomParameters() { });
                throw new RuntimeException(algorithm + ": no exception");
            } catch (NoSuchAlgorithmException e) {
                System.out.println("  " + e.getMessage());
            }
        }
        if (found < 2) {
            throw new RuntimeException("SecureRandom services: " + found);
        }
        Set<String> expected = Set.of("DRBG", "SHA1PRNG");
        for (String algorithm : expected) {
            if (sun.getService("SecureRandom", algorithm) == null) {
                throw new RuntimeException(algorithm);
            }
        }

        // the parameter that DRBG uses
        SecureRandomParameters params = DrbgParameters.instantiation(
                128, DrbgParameters.Capability.NONE, null);
        Object drbg = sun.getService("SecureRandom", "DRBG").newInstance(params);
        if (!drbg.getClass().getName().equals("sun.security.provider.DRBG")) {
            throw new RuntimeException(drbg.getClass().toString());
        }
        SecureRandom random = SecureRandom.getInstance("DRBG", params);
        if (random.getParameters() == null) {
            throw new RuntimeException("no parameters");
        }
    }
}
