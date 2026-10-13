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
 * @summary Test that the built-in resolver is used when the InetAddressResolverProvider
 *          on the class path does not provide a resolver
 * @build NullResolverProviderImpl
 * @run main/othervm NullResolverProviderTest
 */

import java.net.InetAddress;
import java.net.UnknownHostException;

public class NullResolverProviderTest {

    public static void main(String[] args) throws Exception {
        // The first lookup of a host name loads the provider
        InetAddress localhost = InetAddress.getByName("localhost");
        System.out.println("Resolved localhost to " + localhost);
        if (NullResolverProviderImpl.configuration == null) {
            throw new RuntimeException("InetAddressResolverProvider was not found");
        }

        // A reverse lookup gives the same result as the built-in resolver
        byte[] addr = { 127, 0, 0, 1 };
        String expected;
        try {
            expected = NullResolverProviderImpl.configuration.builtinResolver()
                    .lookupByAddress(addr);
        } catch (UnknownHostException e) {
            expected = "127.0.0.1";
        }
        String actual = InetAddress.getByAddress(addr).getHostName();
        if (!actual.equals(expected)) {
            throw new RuntimeException("Host name of 127.0.0.1: expected " + expected
                    + " but got " + actual);
        }
    }
}
