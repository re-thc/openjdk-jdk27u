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

package test.java.time;

import java.lang.management.ManagementFactory;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.time.Instant;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.LongSupplier;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class TestInstantSpeedate {
    private static Object result(CharSequence value, boolean original) {
        try {
            return original ? DateTimeFormatter.ISO_INSTANT.parse(value, Instant::from) : Instant.parse(value);
        } catch (RuntimeException ex) {
            if (ex instanceof DateTimeParseException p) {
                return List.of(ex.getClass().getName(), p.getMessage(), p.getParsedString(), p.getErrorIndex());
            }
            return Arrays.asList(ex.getClass().getName(), ex.getMessage());
        }
    }

    private static void compare(CharSequence value) {
        if (!Objects.equals(result(value, true), result(value, false))) {
            throw new AssertionError("Original formatter mismatch: " + value);
        }
    }

    private static Method nativeParser() throws Exception {
        Class<?> config = Class.forName("java.time.InstantParserConfig");
        var enabled = config.getDeclaredField("ENABLED");
        enabled.setAccessible(true);
        if (!(boolean)enabled.get(null) || "false".equals(System.getProperty("jdk.time.instantSpeedate"))) {
            return null;
        }
        Method fast = Class.forName("java.time.InstantParser").getDeclaredMethod("tryParse", String.class);
        fast.setAccessible(true);
        assertEquals(Instant.EPOCH, fast.invoke(null, "1970-01-01T00:00:00Z"),
                "Native backend did not execute");
        return fast;
    }

    private static void nativeValue(Method fast, String text, Instant expected) throws Exception {
        assertEquals(expected, fast.invoke(null, text), "Native value: " + text);
        assertEquals(expected, Instant.parse(text), "Public value: " + text);
    }

    private static void fallback(Method fast, String text) throws Exception {
        compare(text);
        if (fast != null) {
            assertNull(fast.invoke(null, text), "Expected Java fallback: " + text);
        }
    }

    @Test
    public void testNativeValuesAndLibraryGrammar() throws Exception {
        Method fast = nativeParser();
        if (fast == null) return;
        String[] fractions = {"", ".1", ".12", ".123", ".1234", ".12345", ".123456"};
        int[] nanos = {0, 100_000_000, 120_000_000, 123_000_000, 123_400_000, 123_450_000, 123_456_000};
        for (int i = 0; i < fractions.length; i++) {
            nativeValue(fast, "1970-01-01T00:00:00" + fractions[i] + "Z",
                    Instant.ofEpochSecond(0, nanos[i]));
        }
        for (String text : new String[] {"0000-01-01T00:00:00Z", "0000-02-29T12:34:56.000001Z",
                "2000-02-29T12:34:56Z", "9999-12-31T23:59:59.999999Z"}) {
            nativeValue(fast, text, DateTimeFormatter.ISO_INSTANT.parse(text, Instant::from));
        }
        nativeValue(fast, "1969-12-31T23:59:59.000001Z", Instant.ofEpochSecond(-1, 1000));
        nativeValue(fast, "1969-12-31T23:59:59.999999Z", Instant.ofEpochSecond(-1, 999_999_000));
        // These spellings deliberately follow speedate when the native backend is available.
        for (String text : new String[] {"1969-12-31 23:59:59,000001Z",
                "1969-12-31_23:59:59.000001z", "1969-12-31t23:59:59.000001Z",
                "1969-12-31T23:59:59,000001Z"}) {
            nativeValue(fast, text, Instant.ofEpochSecond(-1, 1000));
        }
    }

    @Test
    public void testJavaFallbacksAndNanosecondPrecision() throws Exception {
        Method fast = nativeParser();
        String[] fractions = {"1234567", "12345678", "123456789"};
        int[] nanos = {123_456_700, 123_456_780, 123_456_789};
        for (int i = 0; i < fractions.length; i++) {
            String text = "1970-01-01T00:00:00." + fractions[i] + "Z";
            fallback(fast, text);
            assertEquals(Instant.ofEpochSecond(0, nanos[i]), Instant.parse(text));
        }
        for (String text : new String[] {"2000-01-01T00:00:00+01:00",
                "2000-01-01T00:00:00+00:00:30", "2000-01-01T24:00:00Z",
                "2016-12-31T23:59:60.123456Z", "+10000-01-01T00:00:00Z",
                "-0001-01-01T00:00:00Z", "2000-01-01T00:00:00.Z"}) {
            fallback(fast, text);
        }
        compare(null);
        compare(new StringBuilder("1969-12-31T23:59:59.000001Z"));
    }

    @Test
    public void testLibraryMissesAndRecovery() throws Exception {
        Method fast = nativeParser();
        for (String text : new String[] {"1900-02-29T00:00:00Z", "2000-04-31T00:00:00Z",
                "2000-13-01T00:00:00Z", "2000-00-01T00:00:00Z", "2000-02-00T00:00:00Z"}) {
            DateTimeParseException rejected = assertThrows(DateTimeParseException.class,
                    () -> Instant.parse(text));
            assertEquals(text, rejected.getParsedString());
            if (fast != null) {
                InvocationTargetException nativeRejection = assertThrows(InvocationTargetException.class,
                        () -> fast.invoke(null, text));
                assertEquals(DateTimeParseException.class, nativeRejection.getCause().getClass());
            }
        }
        for (String text : new String[] {"2000-02-29T24:01:00Z", "2000-02-29T00:60:00Z",
                "2000-02-29T00:00:61Z", "2000-02-29T0x:00:00Z",
                "2000-02-29T00:00:00ZZ", "2000-02-29T00:00:00Z!"}) {
            fallback(fast, text);
        }
        for (char replacement : new char[] {'\0', '\u0130', '\ud800'}) {
            char[] chars = "2000-02-29T00:00:00Z".toCharArray();
            chars[11] = replacement;
            fallback(fast, new String(chars));
        }
        if (fast != null) {
            nativeValue(fast, "1970-01-01T00:00:00Z", Instant.EPOCH);
        }
    }

    @Test
    public void testConcurrentParsingWithGC() throws Exception {
        Method fast = nativeParser();
        if (fast == null) return;
        String[] texts = {"1970-01-01T00:00:00Z", "1969-12-31T23:59:59.000001Z",
                "0000-01-01T00:00:00Z", "9999-12-31T23:59:59.999999Z"};
        Instant[] expected = {Instant.EPOCH, Instant.ofEpochSecond(-1, 1000),
                Instant.ofEpochSecond(-62_167_219_200L),
                Instant.ofEpochSecond(253_402_300_799L, 999_999_000)};
        var collectors = ManagementFactory.getGarbageCollectorMXBeans();
        LongSupplier collectionCount = () -> collectors.stream()
                .mapToLong(collector -> Math.max(0, collector.getCollectionCount())).sum();
        long[] initialCollections = {collectionCount.getAsLong()};
        AtomicReference<Throwable> failure = new AtomicReference<>();
        AtomicInteger active = new AtomicInteger(3);
        AtomicBoolean collectedWhileActive = new AtomicBoolean();
        CountDownLatch workersStarted = new CountDownLatch(3);
        CountDownLatch start = new CountDownLatch(1);
        Thread[] threads = new Thread[4];
        for (int worker = 0; worker < 3; worker++) {
            int offset = worker;
            threads[worker] = new Thread(() -> {
                try {
                    workersStarted.countDown();
                    start.await();
                    for (int i = 0; i < 40_000; i++) {
                        int index = (i + offset) % texts.length;
                        // String(String) shares storage; this creates fresh backing arrays.
                        String text = new String(texts[index].toCharArray());
                        assertEquals(expected[index], Instant.parse(text), text);
                        // Also observe during ZGC's cycle, while System.gc may still be waiting.
                        if ((i & 255) == 0 && collectionCount.getAsLong() > initialCollections[0]) {
                            collectedWhileActive.set(true);
                        }
                    }
                } catch (Throwable ex) {
                    failure.compareAndSet(null, ex);
                } finally {
                    active.decrementAndGet();
                }
            }, "instant-parser-" + worker);
        }
        threads[3] = new Thread(() -> {
            try {
                start.await();
                byte[][] retained = new byte[8][];
                for (int round = 0; round < 32 && active.get() > 0; round++) {
                    for (int i = 0; i < retained.length; i++) {
                        retained[i] = new byte[64 * 1024];
                    }
                    System.gc();
                    java.lang.ref.Reference.reachabilityFence(retained);
                    if (collectionCount.getAsLong() > initialCollections[0] && active.get() > 0) {
                        collectedWhileActive.set(true);
                    }
                }
            } catch (Throwable ex) {
                failure.compareAndSet(null, ex);
            }
        }, "instant-parser-gc");
        for (Thread thread : threads) thread.start();
        boolean interrupted = false;
        for (;;) {
            try {
                workersStarted.await();
                break;
            } catch (InterruptedException ex) {
                interrupted = true;
                failure.compareAndSet(null, ex);
            }
        }
        // Publish a fresh baseline after worker setup, immediately before parsing starts.
        initialCollections[0] = collectionCount.getAsLong();
        start.countDown();
        for (Thread thread : threads) {
            for (;;) {
                try {
                    thread.join();
                    break;
                } catch (InterruptedException ex) {
                    interrupted = true;
                    failure.compareAndSet(null, ex);
                }
            }
        }
        if (interrupted) Thread.currentThread().interrupt();
        if (failure.get() != null) {
            throw new AssertionError("Concurrent parsing or GC failed", failure.get());
        }
        assertTrue(collectedWhileActive.get(), "No collection observed while parsing workers were active");
        nativeValue(fast, new String(texts[1].toCharArray()), expected[1]);
    }
}
