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
 * @summary Test getEnumConstants on enums that are not accessible to
 *          java.lang.Class, and on one that can't be initialized
 * @run junit EnumConstantsAccess
 */
import java.util.EnumMap;
import java.util.EnumSet;
import java.util.concurrent.TimeUnit;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class EnumConstantsAccess {

    private enum Private { A, B, C }

    enum PackagePrivate { X, Y }

    public enum WithBodies {
        ONE { @Override int value() { return 1; } },
        TWO { @Override int value() { return 2; } };
        abstract int value();
    }

    enum Failing {
        F;
        static {
            if (true) {
                throw new IllegalStateException("static initializer");
            }
        }
    }

    @Test
    void nonPublicEnums() {
        assertArrayEquals(new Private[] { Private.A, Private.B, Private.C },
                          Private.class.getEnumConstants());
        assertArrayEquals(PackagePrivate.values(), PackagePrivate.class.getEnumConstants());
        assertEquals(EnumSet.allOf(Private.class), EnumSet.of(Private.A, Private.B, Private.C));
        assertTrue(new EnumMap<PackagePrivate, String>(PackagePrivate.class).isEmpty());
    }

    @Test
    void constantsWithBodies() {
        WithBodies[] constants = WithBodies.class.getEnumConstants();
        assertEquals(2, constants.length);
        assertEquals(1, constants[0].value());
        assertEquals(2, constants[1].value());
        // the constant's class is not an enum class
        assertNull(constants[0].getClass().getEnumConstants());
    }

    @Test
    void enumInUnexportedPackage() throws Exception {
        Class<?> c = Class.forName("jdk.internal.util.OperatingSystem");
        Object[] constants = c.getEnumConstants();
        assertNotNull(constants);
        assertTrue(constants.length > 0);
    }

    @Test
    void notAnEnum() {
        assertNull(String.class.getEnumConstants());
        assertNull(Thread.State[].class.getEnumConstants());
    }

    @Test
    void eachCallGetsOwnArray() {
        TimeUnit[] first = TimeUnit.class.getEnumConstants();
        first[0] = null;
        assertEquals(TimeUnit.NANOSECONDS, TimeUnit.class.getEnumConstants()[0]);
    }

    @Test
    void failingInitializer() {
        ExceptionInInitializerError e = assertThrows(ExceptionInInitializerError.class,
                () -> Failing.class.getEnumConstants());
        assertInstanceOf(IllegalStateException.class, e.getCause());
    }
}
