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
 * @summary Test that invokeinterface call sites of java.lang.Object methods
 *          keep checking the receiver after they have been resolved
 * @requires vm.flagless
 * @compile InterfaceObjectMethodSites.jasm
 * @run main/othervm -Xint InterfaceObjectMethodTest
 * @run main/othervm InterfaceObjectMethodTest
 * @run main/othervm -XX:Tier0ProfilingStartPercentage=0 -XX:Tier0InvokeNotifyFreqLog=3
 *                   InterfaceObjectMethodTest
 */

import java.util.function.Supplier;

public class InterfaceObjectMethodTest {

    // Few enough calls of each site that they all run in the interpreter.
    private static final int CHECKED_ITERATIONS = 10;
    private static final int WARMUP_ITERATIONS = 20_000;

    static class Plain implements Runnable {
        public void run() { }
    }

    static class Overriding implements Runnable {
        public void run() { }
        @Override public int hashCode() { return 17; }
        @Override public String toString() { return "Overriding"; }
        @Override public boolean equals(Object o) { return o instanceof Overriding; }
    }

    static class Sub extends Overriding {
        @Override public int hashCode() { return 18; }
    }

    static class NotRunnable { }

    interface Check {
        void run() throws Throwable;
    }

    static void expect(Class<?> type, String message, Check check) {
        Throwable thrown = null;
        try {
            check.run();
        } catch (Throwable t) {
            thrown = t;
        }
        if (thrown == null || thrown.getClass() != type ||
            (message != null && !message.equals(thrown.getMessage()))) {
            throw new RuntimeException("Expected " + type.getName() + ": " + message + ", got " + thrown, thrown);
        }
    }

    // The results of the call sites must be those of the receiver's methods.
    static void verify(Object[] receivers) {
        for (int i = 0; i < receivers.length; i++) {
            Object a = receivers[i];
            Object b = receivers[(i + 1) % receivers.length];
            if (InterfaceObjectMethodSites.hashCodeOf(a) != a.hashCode()) {
                throw new RuntimeException("Wrong hashCode() for " + a.getClass());
            }
            if (!InterfaceObjectMethodSites.toStringOf(a).equals(a.toString())) {
                throw new RuntimeException("Wrong toString() for " + a.getClass());
            }
            if (InterfaceObjectMethodSites.equalsOf(a, a) != a.equals(a) ||
                InterfaceObjectMethodSites.equalsOf(a, b) != a.equals(b)) {
                throw new RuntimeException("Wrong equals() for " + a.getClass());
            }
            if (InterfaceObjectMethodSites.getClassOf(a) != a.getClass()) {
                throw new RuntimeException("Wrong getClass() for " + a.getClass());
            }
        }
    }

    public static void main(String[] args) throws Throwable {
        Object[] receivers = { new Plain(), new Overriding(), new Sub(), (Runnable) () -> { } };
        Supplier<String> supplier = () -> "supplier";
        Object notRunnable = new NotRunnable();
        Object badHash = Class.forName("InterfaceObjectMethodBadHash").getDeclaredConstructor().newInstance();

        String notRunnableMessage = "Class " + NotRunnable.class.getName() +
                                    " does not implement the requested interface java.lang.Runnable";
        String notSupplierMessage = "Class " + NotRunnable.class.getName() +
                                    " does not implement the requested interface java.util.function.Supplier";
        String notPublicMessage = "'int InterfaceObjectMethodBadHash.hashCode()'";

        Check firstHashICCE = () -> InterfaceObjectMethodSites.firstHashCodeOf(notRunnable);
        Check hashICCE = () -> InterfaceObjectMethodSites.hashCodeOf(notRunnable);
        Check stringICCE = () -> InterfaceObjectMethodSites.toStringOf(notRunnable);
        Check sameICCE = () -> InterfaceObjectMethodSites.equalsOf(notRunnable, notRunnable);
        Check typeICCE = () -> InterfaceObjectMethodSites.getClassOf(notRunnable);
        Check hashIAE = () -> InterfaceObjectMethodSites.hashCodeOf(badHash);
        Check hashNPE = () -> InterfaceObjectMethodSites.hashCodeOf(null);
        Check typeNPE = () -> InterfaceObjectMethodSites.getClassOf(null);

        // The first call of this call site has a receiver that does not
        // implement the interface.
        expect(IncompatibleClassChangeError.class, notSupplierMessage, firstHashICCE);

        for (int i = 0; i < CHECKED_ITERATIONS; i++) {
            // The call sites are resolved by the first good receiver, and the
            // later calls with bad receivers must still throw the same errors.
            if (InterfaceObjectMethodSites.firstHashCodeOf(supplier) != supplier.hashCode()) {
                throw new RuntimeException("Wrong hashCode() for " + supplier.getClass());
            }
            expect(IncompatibleClassChangeError.class, notSupplierMessage, firstHashICCE);

            verify(receivers);
            expect(IncompatibleClassChangeError.class, notRunnableMessage, hashICCE);
            expect(IncompatibleClassChangeError.class, notRunnableMessage, stringICCE);
            expect(IncompatibleClassChangeError.class, notRunnableMessage, sameICCE);
            expect(IncompatibleClassChangeError.class, notRunnableMessage, typeICCE);
            expect(IllegalAccessError.class, notPublicMessage, hashIAE);
            expect(NullPointerException.class, null, hashNPE);
            expect(NullPointerException.class, null, typeNPE);
        }

        for (int i = 0; i < WARMUP_ITERATIONS; i++) {
            verify(receivers);
        }
    }
}
