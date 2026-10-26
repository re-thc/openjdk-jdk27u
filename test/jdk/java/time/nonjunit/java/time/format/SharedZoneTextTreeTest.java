/*
 * Copyright (c) 2026, Harry Chan. All rights reserved.
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
 */

/*
 * @test
 * @summary Check named-zone sharing, overwrite isolation, eligibility and rebuilds
 * @modules java.base/java.time.format:open
 * @run main/othervm -Djava.locale.providers=CLDR SharedZoneTextTreeTest
 * @run main/othervm -Djava.locale.providers=CLDR,SPI SharedZoneTextTreeTest bypass
 * @run main/othervm -Djava.locale.providers=HOST,CLDR SharedZoneTextTreeTest bypass
 */

import java.lang.ref.Reference;
import java.lang.reflect.Field;
import java.time.Instant;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.format.TextStyle;
import java.time.zone.ZoneRules;
import java.time.zone.ZoneRulesProvider;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.NavigableMap;
import java.util.Set;
import java.util.TreeMap;
import java.util.concurrent.Callable;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class SharedZoneTextTreeTest {
    private static final String[] SLOTS = {"fullTree", "fullTreeCI", "shortTree", "shortTreeCI"};
    private static final String PREFIX = "2026-01-15 12:00 ";
    private static final String PACIFIC = "America/Los_Angeles";
    private static final Class<?> PARSER;
    static {
        try {
            PARSER = Class.forName("java.time.format.DateTimeFormatterBuilder$ZoneTextPrinterParser");
        } catch (ClassNotFoundException e) {
            throw new ExceptionInInitializerError(e);
        }
    }
    private record Snapshot(Object holder, Object resources) { }

    private static DateTimeFormatter formatter(TextStyle style, boolean sensitive,
                                               Locale locale, Set<ZoneId> preferred) {
        var b = new DateTimeFormatterBuilder();
        if (!sensitive) b.parseCaseInsensitive();
        b.appendPattern("uuuu-MM-dd HH:mm ");
        if (preferred == null) b.appendZoneText(style);
        else b.appendZoneText(style, preferred);
        return b.toFormatter(locale);
    }

    private static String parse(DateTimeFormatter f, String text, String expected) {
        var value = f.parse(PREFIX + text, ZonedDateTime::from);
        if ((expected != null && !value.getZone().getId().equals(expected)) || value.getYear() != 2026 ||
                value.getMonthValue() != 1 || value.getDayOfMonth() != 15 ||
                value.getHour() != 12 || value.getMinute() != 0) {
            throw new AssertionError(value);
        }
        return value.getZone().getId();
    }

    private static Reference<?> slot(String name) throws Exception {
        Field f = PARSER.getDeclaredField(name);
        f.setAccessible(true);
        return (Reference<?>) f.get(null);
    }

    private static Snapshot snapshot(String name) throws Exception {
        var ref = slot(name);
        Object holder = ref == null ? null : ref.get();
        if (holder == null) throw new AssertionError("No shared snapshot: " + name);
        Field data = holder.getClass().getDeclaredField("zoneStrings");
        data.setAccessible(true);
        Object resources = ((Reference<?>) data.get(holder)).get();
        if (resources == null) throw new AssertionError("No resource snapshot: " + name);
        return new Snapshot(holder, resources);
    }

    private static void same(String name, Snapshot old) throws Exception {
        if (snapshot(name).holder != old.holder) throw new AssertionError("Snapshot changed: " + name);
        Reference.reachabilityFence(old);
    }

    private static Object field(Object target, String name) throws Exception {
        Field f = target.getClass().getDeclaredField(name);
        f.setAccessible(true);
        return f.get(target);
    }

    private static Object instanceTree(DateTimeFormatter formatter) throws Exception {
        Object composite = field(formatter, "printerParser");
        for (Object parser : (Object[]) field(composite, "printerParsers")) {
            if (PARSER.isInstance(parser)) {
                Map<?, ?> cache = (Map<?, ?>) field(parser, "cachedTree");
                Map.Entry<?, ?> entry = (Map.Entry<?, ?>) cache.get(Locale.US);
                return entry == null ? null : ((Reference<?>) entry.getValue()).get();
            }
        }
        throw new AssertionError("No zone text parser");
    }

    private static void empty() throws Exception {
        for (String name : SLOTS) {
            var ref = slot(name);
            if (ref != null && !ref.refersTo(null)) throw new AssertionError("Unexpected shared slot: " + name);
        }
    }

    public static void main(String[] args) throws Exception {
        var value = ZonedDateTime.ofInstant(Instant.EPOCH, ZoneId.of(PACIFIC));
        formatter(TextStyle.SHORT, true, Locale.US, null).format(value);
        new DateTimeFormatterBuilder().appendZoneId().toFormatter(Locale.US).parse(PACIFIC);
        empty(); // Formatting and zone-ID parsing must not create shared text trees.
        if (args.length != 0) {
            parse(formatter(TextStyle.SHORT, true, Locale.US, null), PACIFIC, PACIFIC);
            empty(); // A later SPI/HOST provider also makes the path ineligible.
            return;
        }

        parse(formatter(TextStyle.SHORT_STANDALONE, true, Locale.US, null), PACIFIC, PACIFIC);
        empty();
        parse(formatter(TextStyle.SHORT, true, Locale.forLanguageTag("en-US-u-nu-thai"), null), PACIFIC, PACIFIC);
        empty();
        parse(formatter(TextStyle.SHORT, true, Locale.UK, null), PACIFIC, PACIFIC);
        empty();

        var pins = new ArrayList<Snapshot>();
        int index = 0;
        for (var style : List.of(TextStyle.FULL, TextStyle.SHORT)) {
            for (boolean sensitive : new boolean[] {true, false}) {
                String name = style == TextStyle.FULL ? "Pacific Standard Time" : "PST";
                if (!sensitive) name = name.toLowerCase(Locale.ROOT);
                String expected = parse(formatter(style, sensitive, Locale.US, null), name, null);
                var old = snapshot(SLOTS[index++]);
                pins.add(old); // Pin holder AND weak resource identity for sharing assertions.
                parse(formatter(style, sensitive, Locale.US, Set.of()), name, expected);
                same(SLOTS[index - 1], old);
            }
        }

        var vanilla = formatter(TextStyle.SHORT, true, Locale.US, null);
        String ordinaryPst = parse(vanilla, "PST", null);
        String ordinaryCst = vanilla.parse(PREFIX + "CST", ZonedDateTime::from).getZone().getId();
        var shortSnapshot = snapshot("shortTree");
        parse(formatter(TextStyle.SHORT, true, Locale.US,
                        Set.of(ZoneId.of("Asia/Shanghai"))), "CST", "Asia/Shanghai");
        parse(formatter(TextStyle.SHORT, true, Locale.US, null), "CST", ordinaryCst);
        same("shortTree", shortSnapshot); // Preferred overwrites must not mutate the shared tree.

        slot("shortTree").clear();
        parse(formatter(TextStyle.SHORT, true, Locale.US, null), "PST", ordinaryPst);
        var rebuilt = snapshot("shortTree");
        if (rebuilt.holder == shortSnapshot.holder) throw new AssertionError("Soft snapshot not rebuilt");
        pins.add(rebuilt);
        Field data = rebuilt.holder.getClass().getDeclaredField("zoneStrings");
        data.setAccessible(true);
        ((Reference<?>) data.get(rebuilt.holder)).clear();
        parse(formatter(TextStyle.SHORT, true, Locale.US, null), "PST", ordinaryPst);
        var resourcesRebuilt = snapshot("shortTree");
        if (resourcesRebuilt.holder == rebuilt.holder) throw new AssertionError("Cleared resource identity reused");
        pins.add(resourcesRebuilt);

        slot("shortTreeCI").clear();
        var tasks = new ArrayList<Callable<Void>>();
        for (int i = 0; i < 16; i++) tasks.add(() -> {
            parse(formatter(TextStyle.SHORT, false, Locale.US, null), PACIFIC, PACIFIC);
            return null;
        });
        try (var pool = Executors.newFixedThreadPool(4)) {
            for (var result : pool.invokeAll(tasks, 30, TimeUnit.SECONDS)) result.get();
        }

        var beforeRegistration = snapshot("shortTree");
        ZoneRulesProvider.registerProvider(new ExtraProvider());
        var afterRegistration = formatter(TextStyle.SHORT, true, Locale.US, null);
        parse(afterRegistration, "PST", ordinaryPst);
        if (instanceTree(afterRegistration) == field(beforeRegistration.holder, "tree")) {
            throw new AssertionError("Old ID snapshot reused after provider registration");
        }
        same("shortTree", beforeRegistration); // Custom-name construction must not publish.
        if (!ZoneId.of(ExtraProvider.ID).getRules().getOffset(Instant.EPOCH).equals(ZoneOffset.UTC)) {
            throw new AssertionError("Custom provider rules lost");
        }
        Reference.reachabilityFence(beforeRegistration);
        Reference.reachabilityFence(shortSnapshot);
        Reference.reachabilityFence(pins);
    }

    private static final class ExtraProvider extends ZoneRulesProvider {
        static final String ID = "Audit/SharedZoneTextCI";
        protected Set<String> provideZoneIds() { return Set.of(ID); }
        protected ZoneRules provideRules(String id, boolean cache) { return ZoneRules.of(ZoneOffset.UTC); }
        protected NavigableMap<String, ZoneRules> provideVersions(String id) {
            return new TreeMap<>(java.util.Map.of("test", provideRules(id, false)));
        }
    }
}
