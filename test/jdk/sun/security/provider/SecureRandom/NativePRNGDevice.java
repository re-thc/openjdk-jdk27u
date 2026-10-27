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
 * @summary NativePRNG gets the bytes and the seed from the OS like it read
 *          /dev/urandom, which does not block, or /dev/random, which blocks
 *          until the OS random number generator is initialized
 * @requires os.family != "windows"
 * @modules java.base/sun.security.provider:open
 * @run main/othervm NativePRNGDevice default
 * @run main/othervm -Djava.security.egd=file:/dev/random NativePRNGDevice default
 * @run main/othervm -Djava.security.egd=file:/dev/urandom NativePRNGDevice urandom
 * @run main/othervm NativePRNGDevice missing
 */

import java.io.File;
import java.lang.reflect.Field;

public class NativePRNGDevice {

    public static void main(String[] args) throws Exception {
        boolean seedUrandom = false;
        switch (args[0]) {
            case "default" -> { }
            case "urandom" -> seedUrandom = true;
            case "missing" -> System.setProperty("java.security.egd",
                    new File("no-such-egd.bin").toURI().toString());
            default -> throw new IllegalArgumentException(args[0]);
        }

        check("sun.security.provider.NativePRNG", seedUrandom, true);
        check("sun.security.provider.NativePRNG$NonBlocking", true, true);
        check("sun.security.provider.NativePRNG$Blocking", false, false);
    }

    private static void check(String name, boolean seedUrandom,
            boolean nextUrandom) throws Exception {
        Class<?> c = Class.forName(name);
        Field instance = c.getDeclaredField("INSTANCE");
        instance.setAccessible(true);
        Object io = instance.get(null);
        check(name, io, "seedUrandom", seedUrandom);
        check(name, io, "nextUrandom", nextUrandom);
    }

    private static void check(String name, Object io, String field,
            boolean expected) throws Exception {
        Field f = io.getClass().getDeclaredField(field);
        f.setAccessible(true);
        if (f.getBoolean(io) != expected) {
            throw new RuntimeException(name + "." + field + " is not " + expected);
        }
    }
}
