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
 * @modules java.base/java.net:open
 * @build NullResolverProviderImpl
 * @run main/othervm NullResolverProviderTest
 */

import java.lang.reflect.Field;
import java.net.InetAddress;
import java.net.spi.InetAddressResolver;

public class NullResolverProviderTest {

    public static void main(String[] args) throws Exception {
        // The first lookup of a host name loads the provider. Its result is not
        // checked: a lookup of "localhost" succeeds even without a resolver.
        InetAddress.getByName("localhost");
        if (NullResolverProviderImpl.configuration == null) {
            throw new RuntimeException("InetAddressResolverProvider was not found");
        }

        // The resolver in use is the built-in resolver offered to the provider
        InetAddressResolver builtin = NullResolverProviderImpl.configuration.builtinResolver();
        Field field = InetAddress.class.getDeclaredField("resolver");
        field.setAccessible(true);
        Object resolver = field.get(null);
        if (resolver != builtin) {
            throw new RuntimeException("Resolver in use: " + resolver
                    + ", expected the built-in resolver " + builtin);
        }
    }
}
