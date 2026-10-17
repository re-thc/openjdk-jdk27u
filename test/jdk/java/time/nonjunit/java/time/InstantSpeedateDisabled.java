/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only
 */

/*
 * @test
 * @summary Startup-disabled Instant parsing bypasses input guards and library initialization
 * @modules java.base/java.time:open java.base/jdk.internal.misc
 * @run main/othervm -Djdk.time.instantSpeedate=false -XX:+CompactStrings -Djava.system.class.loader=InstantSpeedateDisabled$EarlyLoader InstantSpeedateDisabled
 * @run main/othervm -Djdk.time.instantSpeedate=false -XX:-CompactStrings -Djava.system.class.loader=InstantSpeedateDisabled$EarlyLoader InstantSpeedateDisabled
 */

import java.lang.reflect.Method;
import java.nio.CharBuffer;
import java.time.Instant;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Objects;

public class InstantSpeedateDisabled {
    private static final String PROPERTY = "jdk.time.instantSpeedate";

    private static void uninitialized(String name) throws Exception {
        Class<?> type = Class.forName("java.time.InstantParser$" + name, false, null);
        // The java.time JUnit actions compile this entire test tree without
        // this standalone test's @modules exports. Keep internal API access
        // reflective so sibling tests can still compile it.
        Class<?> unsafe = Class.forName("jdk.internal.misc.Unsafe");
        Object instance = unsafe.getMethod("getUnsafe").invoke(null);
        if (!(boolean)unsafe.getMethod("shouldBeInitialized", Class.class).invoke(instance, type)) {
            throw new AssertionError(name + " initialized on the disabled route");
        }
    }

    private static boolean booted() throws Exception {
        return (boolean)Class.forName("jdk.internal.misc.VM").getMethod("isBooted").invoke(null);
    }

    private static String savedProperty(String name) throws Exception {
        return (String)Class.forName("jdk.internal.misc.VM")
                .getMethod("getSavedProperty", String.class).invoke(null, name);
    }

    public static class EarlyLoader extends ClassLoader {
        public EarlyLoader(ClassLoader parent) throws Exception {
            super(parent);
            if (booted()) throw new AssertionError("preboot check ran after boot");
            Instant value = Instant.parse("1969-12-31T23:59:59.000001Z");
            if (value.getEpochSecond() != -1 || value.getNano() != 1000) {
                throw new AssertionError(value);
            }
            uninitialized("RuntimeConfig");
            uninitialized("Library");
            // Mutate before boot completes, so even a launcher calling parse
            // before main cannot hide a live-property snapshot bug.
            System.setProperty(PROPERTY, "true");
            System.setProperty("test.instant.preboot", "checked");
        }
    }

    private record Failure(Class<?> type, String message, String parsed, int index) {}

    private static Object outcome(CharSequence text, boolean original) {
        try {
            return original ? DateTimeFormatter.ISO_INSTANT.parse(text, Instant::from) : Instant.parse(text);
        } catch (DateTimeParseException ex) {
            return new Failure(ex.getClass(), ex.getMessage(), ex.getParsedString(), ex.getErrorIndex());
        } catch (RuntimeException ex) {
            return new Failure(ex.getClass(), ex.getMessage(), null, -1);
        }
    }

    private static void compare(CharSequence text) {
        Object expected = outcome(text, true);
        Object actual = outcome(text, false);
        if (!Objects.equals(expected, actual)) {
            throw new AssertionError("original formatter mismatch: " + text + ": " + expected + " / " + actual);
        }
    }

    public static void main(String[] args) throws Exception {
        if (!"checked".equals(System.getProperty("test.instant.preboot"))) {
            throw new AssertionError("preboot check did not execute");
        }
        if (!"false".equals(savedProperty(PROPERTY))) {
            throw new AssertionError("test requires startup property false");
        }
        uninitialized("Library");
        if (!"true".equals(System.getProperty(PROPERTY))) {
            throw new AssertionError("preboot property mutation did not persist");
        }
        Method fast = Class.forName("java.time.InstantParser").getDeclaredMethod("tryParse", String.class);
        fast.setAccessible(true);
        // Private null is a guard-order sentinel: eligibility would dereference it.
        if (fast.invoke(null, (Object)null) != null) throw new AssertionError("disabled helper accepted input");
        for (String text : new String[] {
                "0000-02-29T23:59:59.999999Z", "1969-12-31T23:59:59.000001Z",
                "1970-01-01T00:00:00Z", "9999-12-31T23:59:59.9Z",
                "1900-02-29T00:00:00Z", "2000-04-31T00:00:00Z", "garbage", "",
                "2000-01-01T00:00:00.1234567Z", "2000-01-01T00:00:00.123456789Z",
                "2016-12-31T23:59:60.5Z", "2000-01-01T24:00:00Z",
                "2000-01-01t00:00:00z", "2000-01-01T00:00:00+00:00:30",
                "+10000-01-01T00:00:00Z"}) {
            if (fast.invoke(null, text) != null) throw new AssertionError("disabled helper accepted " + text);
            compare(text);
        }
        compare(null);
        compare(new StringBuilder("1969-12-31T23:59:59.000001Z"));
        compare(CharBuffer.wrap("2000-01-01T00:00:00.123456789Z"));
        compare(new CharSequence() {
            public int length() { throw new IllegalStateException("custom length"); }
            public char charAt(int index) { throw new AssertionError(); }
            public CharSequence subSequence(int start, int end) { throw new AssertionError(); }
        });
        System.clearProperty(PROPERTY);
        if (fast.invoke(null, (Object)null) != null) throw new AssertionError("live property clear enabled route");
        uninitialized("Library");
    }
}
