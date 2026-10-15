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

    // Check errors before warming the call sites.
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

    static class Named implements InterfaceObjectMethodNamed {
        @Override public String toString() { return "Named"; }
    }

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
        Object missingHash = Class.forName("InterfaceObjectMethodMissingHash").getDeclaredConstructor().newInstance();
        Object named = new Named();
        Object defaultHash = Class.forName("InterfaceObjectMethodDefaultHashImpl").getDeclaredConstructor().newInstance();

        String notRunnableMessage = "Class " + NotRunnable.class.getName() +
                                    " does not implement the requested interface java.lang.Runnable";
        String notSupplierMessage = "Class " + NotRunnable.class.getName() +
                                    " does not implement the requested interface java.util.function.Supplier";
        String notNamedMessage = "Class " + NotRunnable.class.getName() +
                                 " does not implement the requested interface InterfaceObjectMethodNamed";
        String notDefaultHashMessage = "Class " + NotRunnable.class.getName() +
                                       " does not implement the requested interface InterfaceObjectMethodDefaultHash";
        String notPublicMessage = "'int InterfaceObjectMethodBadHash.hashCode()'";
        String abstractMessage = "Receiver class InterfaceObjectMethodMissingHash does not define or inherit an " +
                                 "implementation of the resolved method 'int hashCode()' of class java.lang.Object. " +
                                 "Selected method is 'abstract int InterfaceObjectMethodReabstracted.hashCode()'.";
        String hashNullMessage = "Cannot invoke \"java.lang.Runnable.hashCode()\" because \"<parameter1>\" is null";
        String typeNullMessage = "Cannot invoke \"java.lang.Runnable.getClass()\" because \"<parameter1>\" is null";

        Check firstHashICCE = () -> InterfaceObjectMethodSites.firstHashCodeOf(notRunnable);
        Check hashICCE = () -> InterfaceObjectMethodSites.hashCodeOf(notRunnable);
        Check stringICCE = () -> InterfaceObjectMethodSites.toStringOf(notRunnable);
        Check sameICCE = () -> InterfaceObjectMethodSites.equalsOf(notRunnable, notRunnable);
        Check typeICCE = () -> InterfaceObjectMethodSites.getClassOf(notRunnable);
        Check namedICCE = () -> InterfaceObjectMethodSites.namedToStringOf(notRunnable);
        Check defaultHashICCE = () -> InterfaceObjectMethodSites.defaultHashCodeOf(notRunnable);
        Check hashIAE = () -> InterfaceObjectMethodSites.hashCodeOf(badHash);
        Check hashAME = () -> InterfaceObjectMethodSites.hashCodeOf(missingHash);
        Check hashNPE = () -> InterfaceObjectMethodSites.hashCodeOf(null);
        Check typeNPE = () -> InterfaceObjectMethodSites.getClassOf(null);

        // Exercise a bad receiver before the call site has resolved.
        expect(IncompatibleClassChangeError.class, notSupplierMessage, firstHashICCE);

        for (int i = 0; i < CHECKED_ITERATIONS; i++) {
            // Resolve with good receivers, then verify errors on cached entries.
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
            expect(AbstractMethodError.class, abstractMessage, hashAME);
            expect(NullPointerException.class, hashNullMessage, hashNPE);
            expect(NullPointerException.class, typeNullMessage, typeNPE);

            // Interfaces that redeclare a method of java.lang.Object
            if (!InterfaceObjectMethodSites.namedToStringOf(named).equals("Named")) {
                throw new RuntimeException("Wrong toString() for " + named.getClass());
            }
            expect(IncompatibleClassChangeError.class, notNamedMessage, namedICCE);
            if (InterfaceObjectMethodSites.defaultHashCodeOf(defaultHash) != System.identityHashCode(defaultHash)) {
                throw new RuntimeException("Wrong hashCode() for " + defaultHash.getClass());
            }
            expect(IncompatibleClassChangeError.class, notDefaultHashMessage, defaultHashICCE);
        }

        for (int i = 0; i < WARMUP_ITERATIONS; i++) {
            verify(receivers);
        }
    }
}
