/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @summary The disabled HTTP logger avoids bootstrapping record equality
 * @requires vm.flagless
 * @modules java.base/jdk.internal.misc
 *          java.net.http/jdk.internal.net.http.common:open
 * @run main/othervm LoggerConfigStartupTest
 */

import java.lang.System.Logger.Level;
import jdk.internal.misc.Unsafe;

public class LoggerConfigStartupTest {
    public static void main(String[] args) throws Exception {
        var unsafe = Unsafe.getUnsafe();
        var objectMethods = Class.forName("java.lang.runtime.ObjectMethods", false, null);
        if (!unsafe.shouldBeInitialized(objectMethods)) {
            throw new AssertionError("ObjectMethods already initialized before test");
        }

        var configClass = Class.forName("jdk.internal.net.http.common.DebugLogger$LoggerConfig");
        var of = configClass.getDeclaredMethod("of", configClass);
        of.setAccessible(true);
        var offField = configClass.getDeclaredField("OFF");
        offField.setAccessible(true);
        var off = offField.get(null);
        if (of.invoke(null, off) != off) {
            throw new AssertionError("OFF must retain its identity");
        }
        if (!unsafe.shouldBeInitialized(objectMethods)) {
            throw new AssertionError("OFF initialized record equality");
        }

        var constructor = configClass.getDeclaredConstructor(Level.class, Level.class, Level.class);
        constructor.setAccessible(true);
        var copy = constructor.newInstance(Level.OFF, Level.OFF, Level.OFF);
        if (of.invoke(null, copy) != off) {
            throw new AssertionError("Equivalent OFF must canonicalize");
        }
    }
}
