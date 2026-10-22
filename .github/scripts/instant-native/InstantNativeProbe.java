/* Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0 */
import java.lang.management.ManagementFactory;
import java.lang.reflect.Method;
import java.security.MessageDigest;
import java.time.*;
import java.time.format.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;

/** CI-only differential and native lifetime integration checks. */
public final class InstantNativeProbe {
    private static volatile Object sink;
    private static long checked;
    private static MessageDigest digest;
    private static final String[] HAPPY = {
        "2026-10-16T12:34:56Z", "2000-02-29T01:02:03.123456Z",
        "1969-12-31T23:59:59.999999Z", "0000-02-29T12:34:56.000001Z",
        "9999-12-31T23:59:59.9Z", "1970-01-01T00:00:00.01Z",
        "1900-01-01T01:01:01.123Z", "2400-02-29T12:34:56.12345Z"
    };
    private static final String[] FALLBACK = {
        "2000-01-01T00:00:00.123456789Z", "2000-01-01T00:00:00.1234567Z",
        "2000-01-01T00:00:00.00000000Z", "2000-01-01T00:00:00.Z",
        "2000-01-01t00:00:00z", "2000-01-01T24:00:00Z",
        "2000-01-01T00:00:00z", "2000-01-01t00:00:00Z",
        "2000-01-01T00:00:00.000000000Z", "2000-01-01T00:00:00+00:00:30",
        "0000-12-31T24:00:00Z", "9999-12-31T24:00:00Z",
        "2016-12-31T23:59:60.5Z", "2000-01-01T00:00:00+00:00",
        "2000-01-01T12:34:56-07:30", "+10000-01-01T00:00:00Z",
        "-0001-01-01T00:00:00Z", "2000-01-01T00:00:00+00"
    };
    private static final String[] INVALID = {
        "1900-02-29T00:00:00Z", "2000-04-31T00:00:00.1Z",
        "2000-00-01T00:00:00Z", "2000-01-00T00:00:00Z",
        "2000-01-01T24:00:01Z", "2000-01-01T00:00:60Z",
        "2000-01-01T00:00:00,1Z", "2000-01-01 00:00:00Z",
        " 2000-01-01T00:00:00Z", "2000-01-01T00:00:00Z ", "", "garbage"
    };

    private static Object outcome(CharSequence value, boolean original) {
        try {
            return original ? DateTimeFormatter.ISO_INSTANT.parse(value, Instant::from) : Instant.parse(value);
        } catch (RuntimeException ex) {
            if (ex instanceof DateTimeParseException p) {
                return List.of(ex.getClass().getName(), p.getErrorIndex(), p.getParsedString(), p.getMessage());
            }
            return Arrays.asList(ex.getClass().getName(), ex.getMessage());
        }
    }

    private static Object compare(CharSequence value) {
        Object expected = outcome(value, true);
        Object actual = outcome(value, false);
        if (!Objects.equals(expected, actual)) {
            throw new AssertionError("Mismatch for " + value + " expected=" + expected + " actual=" + actual);
        }
        checked++;
        String representation = actual.toString();
        for (int i = 0; i < representation.length(); i++) {
            char c = representation.charAt(i);
            digest.update((byte)(c >> 8));
            digest.update((byte)c);
        }
        digest.update((byte)0xff);
        digest.update((byte)0xff);
        return expected;
    }

    private static String canonical(int y, int m, int d, int h, int min, int s, String f) {
        return String.format(Locale.ROOT, "%04d-%02d-%02dT%02d:%02d:%02d%sZ", y, m, d, h, min, s, f);
    }

    private static void test() throws Exception {
        digest = MessageDigest.getInstance("SHA-256");
        Method fast = null;
        long nativeHits = 0;
        if (Boolean.getBoolean("probe.native")) {
            fast = Class.forName("java.time.InstantParser").getDeclaredMethod("tryParse", String.class);
            fast.setAccessible(true);
        }
        for (String[] set : new String[][] {HAPPY, FALLBACK, INVALID}) for (String s : set) compare(s);
        for (String s : new String[] {"0000-02-29T23:59:59.999999Z", "0100-02-29T00:00:00Z",
                "2100-02-29T00:00:00Z", "2016-12-31T23:59:60.123456Z"}) compare(s);
        compare("2000-01-01T/::00:00Z");
        compare("2000-/;-01T00:00:00Z");
        char[] compensatingUnicode = "2000-01-01T00:00:00Z".toCharArray();
        compensatingUnicode[11] = 0; compensatingUnicode[12] = '\u0210';
        compare(new String(compensatingUnicode));
        compare(null);
        compare(new StringBuilder(HAPPY[0]));
        compare(new CharSequence() {
            public int length() { throw new IllegalStateException("length probe"); }
            public char charAt(int i) { throw new AssertionError(); }
            public CharSequence subSequence(int a, int b) { throw new AssertionError(); }
        });
        int[] years = {0, 1, 99, 100, 399, 400, 1582, 1600, 1700, 1800, 1900, 1969, 1970, 2000, 2100, 2400, 9999};
        String[] fractions = {"", ".1", ".01", ".001", ".0001", ".12345", ".000001", ".999999", ".0000000", ".123456789"};
        for (int y : years) for (int m = 1; m <= 12; m++) for (int d = 0; d <= 32; d++)
            for (String f : fractions) {
                String input = canonical(y, m, d, 23, 59, 59, f);
                Object expected = compare(input);
                if (fast != null && expected instanceof Instant && f.length() <= 7) {
                    if (!expected.equals(fast.invoke(null, input))) throw new AssertionError("native miss " + input);
                    nativeHits++;
                }
            }
        char[] replacements = {'0', '1', '9', '-', ':', '.', ',', 't', 'z', ' ', '_', '\0', '\u00e9', '\uff11', '\ud800'};
        for (String base : HAPPY) for (int i = 0; i < base.length(); i++) for (char c : replacements) {
            char[] chars = base.toCharArray(); chars[i] = c; compare(new String(chars));
        }
        Random random = new Random(0x5eed20261016L);
        for (int i = 0; i < 30000; i++) {
            String s = canonical(random.nextInt(10000), random.nextInt(14), random.nextInt(34),
                    random.nextInt(26), random.nextInt(63), random.nextInt(63), fractions[random.nextInt(fractions.length)]);
            compare(s);
        }
        if (Boolean.getBoolean("probe.native")) nativeCoverage();
        if (fast != null) System.out.println("systematic_native_hits=" + nativeHits);
        System.out.println("differential_checked=" + checked);
        System.out.println("corpus_sha256=" + HexFormat.of().formatHex(digest.digest()));
    }

    private static void nativeCoverage() throws Exception {
        Class<?> helper = Class.forName("java.time.InstantParser");
        Method fast = helper.getDeclaredMethod("tryParse", String.class); fast.setAccessible(true);
        Method raw = helper.getDeclaredMethod("parse0", String.class); raw.setAccessible(true);
        for (String s : HAPPY) {
            if (!Instant.parse(s).equals(fast.invoke(null, s))) throw new AssertionError("native miss " + s);
        }
        for (String s : new String[] {"1970-01-01T00:00:00Z", "1970-01-01T00:00:00.000000Z",
                "1969-12-31T23:59:59Z", "0000-02-29T23:59:59.999999Z"}) {
            if (!Instant.parse(s).equals(fast.invoke(null, s))) throw new AssertionError("native miss " + s);
        }
        for (String[] set : new String[][] {FALLBACK, INVALID}) for (String s : set) {
            if (fast.invoke(null, s) != null || (long)raw.invoke(null, s) != Long.MIN_VALUE)
                throw new AssertionError("unexpected native acceptance " + s);
        }
        char[] nonAscii = HAPPY[0].toCharArray();
        for (char c : new char[] {'\u00e9', '\ud800'}) {
            nonAscii[11] = c;
            if ((long)raw.invoke(null, new String(nonAscii)) != Long.MIN_VALUE) throw new AssertionError("non-ASCII JNI acceptance");
        }
        if ((long)raw.invoke(null, (Object)null) != Long.MIN_VALUE) throw new AssertionError("null JNI acceptance");
        // Explicit epoch floor-seconds semantics, independent of formatter output.
        Instant negative = (Instant)fast.invoke(null, "1969-12-31T23:59:59.000001Z");
        if (negative.getEpochSecond() != -1 || negative.getNano() != 1000) throw new AssertionError(negative);
        System.out.println("native_coverage=hits,misses,epoch-floor");
    }

    private static void stress() throws Exception {
        int count = 10000;
        nativeCoverage();
        long collectionsBefore = collections();
        CountDownLatch start = new CountDownLatch(1);
        AtomicInteger active = new AtomicInteger(3);
        AtomicReference<Throwable> failure = new AtomicReference<>();
        List<Thread> threads = new ArrayList<>();
        for (int t = 0; t < 3; t++) {
            int offset = t;
            Thread worker = new Thread(() -> {
                try {
                    start.await();
                    for (int i = 0; i < count; i++) {
                        String input = new String(HAPPY[(i + offset) % HAPPY.length].toCharArray());
                        Instant actual = Instant.parse(input);
                        Instant expected = DateTimeFormatter.ISO_INSTANT.parse(input, Instant::from);
                        if (!actual.equals(expected)) throw new AssertionError(input);
                        sink = actual;
                    }
                } catch (Throwable ex) { failure.compareAndSet(null, ex); }
                finally { active.decrementAndGet(); }
            });
            threads.add(worker); worker.start();
        }
        Thread pressure = new Thread(() -> {
            try {
                byte[][] retained = new byte[8][];
                int index = 0;
                while (active.get() != 0) {
                    retained[index++ & 7] = new byte[65536];
                    sink = retained;
                    if ((index & 63) == 0) System.gc();
                    Thread.yield();
                }
            } catch (Throwable ex) { failure.compareAndSet(null, ex); }
        });
        pressure.start(); start.countDown();
        for (Thread worker : threads) worker.join();
        pressure.join();
        if (failure.get() != null) throw new AssertionError("stress", failure.get());
        if (Boolean.getBoolean("probe.native")) nativeCoverage();
        long collected = collections() - collectionsBefore;
        if (collected <= 0) throw new AssertionError("No GC collection occurred");
        System.out.println("concurrent_checked=" + (3L * count) + ",gc_collections=" + collected);
    }

    private static void race() throws Exception {
        CountDownLatch start = new CountDownLatch(1);
        AtomicReference<Throwable> failure = new AtomicReference<>();
        List<Thread> workers = new ArrayList<>();
        for (int i = 0; i < 4; i++) {
            Thread worker = new Thread(() -> {
                try {
                    start.await();
                    for (int n = 0; n < 2000; n++) {
                        Instant value = Instant.parse(new String("1969-12-31T23:59:59.000001Z".toCharArray()));
                        if (value.getEpochSecond() != -1 || value.getNano() != 1000) throw new AssertionError(value);
                        sink = value;
                    }
                } catch (Throwable ex) { failure.compareAndSet(null, ex); }
            });
            workers.add(worker); worker.start();
        }
        start.countDown();
        for (Thread worker : workers) worker.join();
        if (failure.get() != null) throw new AssertionError(failure.get());
        nativeCoverage();
        System.out.println("cold_race_checked=8000");
    }

    private static CountDownLatch onLoadEntered;

    // Invoked from a test JNI_OnLoad with the real parser library lock held.
    public static void onLoadCallback() throws Exception {
        onLoadEntered.countDown();
        Class<?> backend = Class.forName("java.time.InstantParser$Library", false, null);
        var stateField = backend.getDeclaredField("STATE"); stateField.setAccessible(true);
        AtomicInteger state = (AtomicInteger)stateField.get(null);
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(10);
        while (state.get() != 1 && System.nanoTime() < deadline) Thread.yield();
        if (state.get() != 1) throw new AssertionError("loader did not enter LOADING state");
        Instant value = Instant.parse("1969-12-31T23:59:59.000001Z");
        if (value.getEpochSecond() != -1 || value.getNano() != 1000) throw new AssertionError(value);
        System.out.println("onload_callback_fallback_checked");
    }

    private static void onLoadRace() throws Exception {
        onLoadEntered = new CountDownLatch(1);
        AtomicReference<Throwable> failure = new AtomicReference<>();
        Thread loading = new Thread(() -> {
            try {
                Class<?> libs = Class.forName("jdk.internal.loader.NativeLibraries");
                Method acquire = libs.getDeclaredMethod("acquireNativeLibraryLock", String.class);
                Method release = libs.getDeclaredMethod("releaseNativeLibraryLock", String.class);
                acquire.setAccessible(true); release.setAccessible(true);
                String parserPath = new java.io.File(System.getProperty("probe.parser.library")).getCanonicalPath();
                acquire.invoke(null, parserPath);
                try { System.load(System.getProperty("probe.onload.library")); }
                finally { release.invoke(null, parserPath); }
            }
            catch (Throwable ex) { failure.compareAndSet(null, ex); }
        });
        Thread parsing = new Thread(() -> {
            try {
                if (!onLoadEntered.await(10, TimeUnit.SECONDS)) throw new AssertionError("no JNI_OnLoad callback");
                Instant value = Instant.parse("1969-12-31T23:59:59.000001Z");
                if (value.getEpochSecond() != -1 || value.getNano() != 1000) throw new AssertionError(value);
            } catch (Throwable ex) { failure.compareAndSet(null, ex); }
        });
        loading.setDaemon(true); parsing.setDaemon(true);
        loading.start(); parsing.start();
        loading.join(15000); parsing.join(15000);
        if (loading.isAlive() || parsing.isAlive()) throw new AssertionError("native load/parse lock cycle");
        if (failure.get() != null) throw new AssertionError(failure.get());
        nativeCoverage();
        System.out.println("onload_race_checked=callback-fallback,post-load-native");
    }

    private static long collections() {
        return ManagementFactory.getGarbageCollectorMXBeans().stream()
                .mapToLong(bean -> Math.max(0, bean.getCollectionCount())).sum();
    }

    public static void main(String[] args) throws Exception {
        var enabled = Class.forName("java.time.InstantParserConfig").getDeclaredField("ENABLED");
        enabled.setAccessible(true);
        if (!(boolean)enabled.get(null)) throw new AssertionError("Backend was compiled out");
        if (System.getProperty("jdk.time.instantSpeedate") != null) {
            throw new AssertionError("Native lanes must use the default startup setting");
        }
        System.out.println("vm_arguments=" + ManagementFactory.getRuntimeMXBean().getInputArguments());
        System.out.println("collectors=" + ManagementFactory.getGarbageCollectorMXBeans().stream()
                .map(bean -> bean.getName()).toList());
        switch (args[0]) {
            case "test" -> test();
            case "stress" -> stress();
            case "race" -> race();
            case "onload" -> onLoadRace();
            default -> throw new IllegalArgumentException(args[0]);
        }
        System.out.println("PASS " + args[0]);
    }
}
