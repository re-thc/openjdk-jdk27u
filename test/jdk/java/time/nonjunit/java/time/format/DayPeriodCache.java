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
 * @summary Day-period formatting preserves filtered rules and publishes cached classifications safely
 * @library /test/lib
 * @run driver/timeout=120 DayPeriodCache
 */

import java.io.File;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.nio.file.Files;
import java.nio.file.Path;
import java.text.ParsePosition;
import java.time.DateTimeException;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoField;
import java.time.temporal.TemporalAccessor;
import java.time.temporal.TemporalField;
import java.time.temporal.UnsupportedTemporalTypeException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.spi.CalendarNameProvider;

import jdk.test.lib.Utils;
import jdk.test.lib.process.ProcessTools;
import jdk.test.lib.util.JarUtils;

public class DayPeriodCache {
    private record Rule(long from, long to, long index) { }
    private record Sample(int minute, String text) { }

    private static Constructor<?> periodConstructor;
    private static Map<Locale, Map<Object, Long>> ruleCache;

    public static void main(String[] args) throws Exception {
        if (args.length == 0) {
            Path root = Files.createTempDirectory(Path.of("."), "dayperiod-provider");
            String provider = Names.class.getName();
            Path service = root.resolve("META-INF/services/java.util.spi.CalendarNameProvider");
            Files.createDirectories(service.getParent());
            Files.writeString(service, provider + "\n");
            String classFile = provider + ".class";
            Files.copy(Path.of(System.getProperty("test.classes"), classFile), root.resolve(classFile));
            Path jar = root.resolveSibling(root.getFileName() + ".jar");
            JarUtils.createJarFile(jar, root);
            String classPath = System.getProperty("java.class.path") + File.pathSeparator + jar;
            ProcessTools.executeProcess(ProcessTools.createTestJavaProcessBuilder(
                    "-cp", classPath,
                    "--add-opens=java.base/java.time.format=ALL-UNNAMED",
                    "-Djava.locale.providers=SPI",
                    "-Dtest.timeout.factor=" + System.getProperty("test.timeout.factor", "1.0"),
                    DayPeriodCache.class.getName(), "child"))
                    .shouldHaveExitValue(0).shouldContain("DayPeriodCache passed");
        } else if (args.length == 1 && args[0].equals("child")) {
            initializeFixtures();
            testMissingName();
            testTies();
            testPointsWrapAndFallback();
            testConcurrentFirstUse();
            testErrorOrder();
            System.out.println("DayPeriodCache passed");
        } else {
            throw new IllegalArgumentException("Unexpected arguments");
        }
    }

    @SuppressWarnings("unchecked")
    private static void initializeFixtures() throws Exception {
        // Only the pre-existing raw-rule cache is accessed. The expected outputs
        // below do not inspect or reconstruct the classification cache.
        Class<?> period = Class.forName("java.time.format.DateTimeFormatterBuilder$DayPeriod");
        periodConstructor = period.getDeclaredConstructor(long.class, long.class, long.class);
        periodConstructor.setAccessible(true);
        Field cache = period.getDeclaredField("DAYPERIOD_CACHE");
        cache.setAccessible(true);
        ruleCache = (Map<Locale, Map<Object, Long>>) cache.get(null);
    }

    private static void testMissingName() throws Exception {
        Locale locale = fixture("missing", true,
                new Rule(0, 720, 0), new Rule(720, 1440, 1), new Rule(360, 660, 4));
        Sample[] samples = {new Sample(359, "am"), new Sample(540, "am"),
                new Sample(660, "am"), new Sample(720, "pm")};
        // The provider supplies the shorter rule's FULL and SHORT names but
        // omits its NARROW name. Even FULL must use the finally filtered rules.
        assertOutputs(locale, samples);
        int calls = Names.calls.get();
        Names.version = 1;
        try {
            assertOutputs(locale, samples);
            check(Names.calls.get() == calls, "Cached locale called the mutable provider again");
        } finally {
            Names.version = 0;
        }
    }

    private static void testTies() throws Exception {
        Rule first = new Rule(60, 180, 4);
        Rule second = new Rule(120, 240, 6);
        Locale forward = fixture("tiea", false,
                new Rule(0, 720, 0), new Rule(720, 1440, 1), first, second);
        Locale reverse = fixture("tieb", false,
                new Rule(0, 720, 0), new Rule(720, 1440, 1), second, first);
        assertOutputs(forward, new Sample(59, "am"), new Sample(60, "morning-one"),
                new Sample(119, "morning-one"), new Sample(120, "morning-one"),
                new Sample(179, "morning-one"), new Sample(180, "afternoon-one"),
                new Sample(239, "afternoon-one"), new Sample(240, "am"));
        assertOutputs(reverse, new Sample(59, "am"), new Sample(60, "morning-one"),
                new Sample(119, "morning-one"), new Sample(120, "afternoon-one"),
                new Sample(179, "afternoon-one"), new Sample(180, "afternoon-one"),
                new Sample(239, "afternoon-one"), new Sample(240, "am"));
    }

    private static void testPointsWrapAndFallback() throws Exception {
        Locale locale = boundaryFixture("bounds");
        assertOutputs(locale, boundarySamples());

        Locale empty = fixture("empty", false, new Rule(0, 720, 0), new Rule(720, 1440, 1));
        primeNames(empty);
        ruleCache.get(empty).clear();
        assertOutputs(empty, new Sample(0, "am"), new Sample(719, "am"),
                new Sample(720, "pm"), new Sample(1439, "pm"));
    }

    private static Locale boundaryFixture(String id) throws Exception {
        Locale locale = fixture(id, false, new Rule(0, 720, 0), new Rule(720, 1440, 1),
                new Rule(0, 0, 2), new Rule(720, 720, 3),
                new Rule(1320, 360, 10), new Rule(480, 600, 4));
        primeNames(locale);
        // Retain names but leave actual gaps in the test-only rules. Parsing
        // initializes names without first formatting/classifying this locale.
        ruleCache.get(locale).entrySet().removeIf(e -> e.getValue() < 2);
        return locale;
    }

    private static Sample[] boundarySamples() {
        return new Sample[] {new Sample(0, "midnight"), new Sample(1, "night-one"),
                new Sample(359, "night-one"), new Sample(360, "am"),
                new Sample(479, "am"), new Sample(480, "morning-one"),
                new Sample(599, "morning-one"), new Sample(600, "am"),
                new Sample(719, "am"), new Sample(720, "noon"), new Sample(721, "pm"),
                new Sample(1319, "pm"), new Sample(1320, "night-one"),
                new Sample(1439, "night-one")};
    }

    private static void primeNames(Locale locale) {
        ParsePosition position = new ParsePosition(0);
        var parsed = DateTimeFormatter.ofPattern("BBBB", locale)
                .parseUnresolved("full:am", position);
        check(parsed != null && position.getIndex() == "full:am".length(),
                "Could not initialize fixture names for " + locale);
    }

    private static void testConcurrentFirstUse() throws Exception {
        Locale[] locales = new Locale[8];
        for (int i = 0; i < locales.length; i++) {
            // No parsing or formatting of these locales before the barrier:
            // name filtering and classification are both exercised on first use.
            locales[i] = fixture("race" + i, true,
                    new Rule(0, 720, 0), new Rule(720, 1440, 1),
                    new Rule(0, 0, 2), new Rule(720, 720, 3),
                    new Rule(1320, 360, 10), new Rule(480, 600, 4));
        }
        var barrier = new CyclicBarrier(8);
        var workers = Executors.newFixedThreadPool(8, Thread.ofPlatform().daemon().factory());
        long timeout = Utils.adjustTimeout(10_000);
        long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(timeout);
        List<Future<?>> results = new ArrayList<>();
        try {
            for (int thread = 0; thread < 8; thread++) {
                results.add(workers.submit(() -> {
                    for (Locale locale : locales) {
                        barrier.await(timeout, TimeUnit.MILLISECONDS);
                        assertOutputs(locale, boundarySamples());
                    }
                    return null;
                }));
            }
            for (Future<?> result : results) {
                result.get(Math.max(1, deadline - System.nanoTime()), TimeUnit.NANOSECONDS);
            }
        } finally {
            workers.shutdownNow();
            check(workers.awaitTermination(timeout, TimeUnit.MILLISECONDS), "Workers did not stop");
        }
    }

    private static void testErrorOrder() throws Exception {
        Locale locale = fixture("error", true, new Rule(0, 720, 0), new Rule(720, 1440, 1));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("BBBB", locale);
        Names.events.clear();
        try {
            formatter.format(new RecordingTemporal(true));
            throw new AssertionError("Expected hour failure");
        } catch (DateTimeException expected) {
            check(expected.getMessage().equals("hour failure"), expected.toString());
        }
        check(List.copyOf(Names.events).equals(List.of("hour")), "Provider preceded hour failure");
        for (int attempt = 0; attempt < 2; attempt++) {
            Names.events.clear();
            try {
                formatter.format(new RecordingTemporal(false));
                throw new AssertionError("Expected provider failure");
            } catch (IllegalStateException expected) {
                check(expected.getMessage().equals("provider failure"), expected.toString());
            }
            check(List.copyOf(Names.events).equals(List.of("hour", "minute", "provider")),
                    "Unexpected callback order: " + Names.events);
        }
    }

    private record RecordingTemporal(boolean failHour) implements TemporalAccessor {
        @Override
        public boolean isSupported(TemporalField field) {
            return field == ChronoField.HOUR_OF_DAY || field == ChronoField.MINUTE_OF_HOUR;
        }

        @Override
        public long getLong(TemporalField field) {
            if (field == ChronoField.HOUR_OF_DAY) {
                Names.events.add("hour");
                if (failHour) {
                    throw new DateTimeException("hour failure");
                }
                return 9;
            } else if (field == ChronoField.MINUTE_OF_HOUR) {
                Names.events.add("minute");
                return 0;
            }
            throw new UnsupportedTemporalTypeException(field.toString());
        }
    }

    private static Locale fixture(String id, boolean removable, Rule... rules) throws Exception {
        Locale locale = Locale.forLanguageTag("en-US-x-dpc-" + id);
        // Concurrent maps permit removals during name lookup.
        // The ordered fixtures have every name, making encounter-order ties explicit.
        Map<Object, Long> map = removable ? new ConcurrentHashMap<>() : new LinkedHashMap<>();
        for (Rule rule : rules) {
            map.put(periodConstructor.newInstance(rule.from, rule.to, rule.index), rule.index);
        }
        check(ruleCache.putIfAbsent(locale, map) == null, "Locale already used: " + locale);
        return locale;
    }

    private static void assertOutputs(Locale locale, Sample... samples) {
        String[] patterns = {"B", "BBBB", "BBBBB"};
        String[] prefixes = {"short:", "full:", "narrow:"};
        for (int i = 0; i < patterns.length; i++) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern(patterns[i], locale);
            for (Sample sample : samples) {
                String actual = formatter.format(LocalTime.of(sample.minute / 60, sample.minute % 60));
                String expected = prefixes[i] + sample.text;
                check(actual.equals(expected), locale + " " + patterns[i] + " minute " + sample.minute
                        + ": expected " + expected + ", got " + actual);
            }
        }
    }

    private static void check(boolean condition, String message) {
        if (!condition) {
            throw new AssertionError(message);
        }
    }

    public static class Names extends CalendarNameProvider {
        static final AtomicInteger calls = new AtomicInteger();
        static final ConcurrentLinkedQueue<String> events = new ConcurrentLinkedQueue<>();
        static volatile int version;

        @Override
        public Locale[] getAvailableLocales() {
            return new Locale[] {Locale.US};
        }

        @Override
        public boolean isSupportedLocale(Locale locale) {
            return locale.stripExtensions().equals(Locale.US);
        }

        @Override
        public String getDisplayName(String calendar, int field, int value, int style, Locale locale) {
            calls.incrementAndGet();
            String fixture = locale.getExtension('x');
            if (fixture != null && fixture.endsWith("error")) {
                events.add("provider");
                throw new IllegalStateException("provider failure");
            }
            if (field != Calendar.AM_PM || value < 0 || value > 11
                    || (fixture != null && fixture.endsWith("missing")
                        && value == 4 && style == Calendar.NARROW_FORMAT)) {
                return null;
            }
            String text = switch (value) {
                case 0 -> "am";
                case 1 -> "pm";
                case 2 -> "midnight";
                case 3 -> "noon";
                case 4 -> "morning-one";
                case 5 -> "morning-two";
                case 6 -> "afternoon-one";
                case 7 -> "afternoon-two";
                case 8 -> "evening-one";
                case 9 -> "evening-two";
                case 10 -> "night-one";
                case 11 -> "night-two";
                default -> throw new AssertionError(value);
            };
            String prefix = switch (style) {
                case Calendar.SHORT_FORMAT -> "short:";
                case Calendar.LONG_FORMAT -> "full:";
                case Calendar.NARROW_FORMAT -> "narrow:";
                default -> throw new AssertionError(style);
            };
            return (version == 0 ? "" : "changed:") + prefix + text;
        }

        @Override
        public Map<String, Integer> getDisplayNames(String calendar, int field, int style, Locale locale) {
            return null;
        }
    }
}
