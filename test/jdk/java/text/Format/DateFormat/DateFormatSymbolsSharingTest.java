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
 * @summary Check ownership of shared DateFormatSymbols arrays and clone isolation
 * @modules java.base/java.text:open
 * @run main/othervm DateFormatSymbolsSharingTest
 */

import java.lang.reflect.Field;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class DateFormatSymbolsSharingTest {
    private record Symbol(String fieldName, String property) {
        String[] get(DateFormatSymbols dfs) throws Exception {
            return (String[]) DateFormatSymbols.class.getMethod("get" + property).invoke(dfs);
        }

        void set(DateFormatSymbols dfs, String[] value) throws Exception {
            DateFormatSymbols.class.getMethod("set" + property, String[].class)
                    .invoke(dfs, (Object) value);
        }

        String[] internal(DateFormatSymbols dfs) throws Exception {
            Field field = DateFormatSymbols.class.getDeclaredField(fieldName);
            field.setAccessible(true);
            return (String[]) field.get(dfs);
        }
    }

    private static final Symbol[] SYMBOLS = {
        new Symbol("eras", "Eras"),
        new Symbol("months", "Months"),
        new Symbol("shortMonths", "ShortMonths"),
        new Symbol("weekdays", "Weekdays"),
        new Symbol("shortWeekdays", "ShortWeekdays"),
        new Symbol("ampms", "AmPmStrings")
    };

    public static void main(String[] args) throws Exception {
        checkSymbols();
        checkSubclass();
        checkZones();
        checkFormatParse();
        checkRegionOverride();
        checkConcurrentCache();
    }

    private static void checkSymbols() throws Exception {
        DateFormatSymbols original = new DateFormatSymbols(Locale.US);
        DateFormatSymbols peer = new DateFormatSymbols(Locale.US);
        DateFormatSymbols clone = (DateFormatSymbols) original.clone();
        // Avoid loading the locale's time zone table merely to test equals/hashCode.
        for (DateFormatSymbols dfs : new DateFormatSymbols[]{original, peer, clone}) {
            dfs.setZoneStrings(new String[0][]);
        }
        check(original.equals(clone) && original.hashCode() == clone.hashCode(), "clone equality");
        int oldHash = original.hashCode();
        for (Symbol symbol : SYMBOLS) {
            String[] expected = symbol.get(peer);
            check(symbol.internal(original) == symbol.internal(peer), symbol + " cache sharing");
            check(symbol.internal(original) == symbol.internal(clone), symbol + " clone sharing");
            String[] output = symbol.get(original);
            output[0] = "modified getter result";
            check(Arrays.equals(expected, symbol.get(original)), symbol + " getter isolation");
            check(Arrays.equals(expected, symbol.get(clone)), symbol + " cloned getter isolation");

            String[] input = expected.clone();
            input[0] = "custom " + symbol.fieldName;
            symbol.set(original, input);
            input[0] = "modified setter input";
            check(symbol.get(original)[0].equals("custom " + symbol.fieldName), symbol + " setter isolation");
            check(Arrays.equals(expected, symbol.get(clone)), symbol + " original/clone isolation");
            check(Arrays.equals(expected, symbol.get(new DateFormatSymbols(Locale.US))), symbol + " cache isolation");

            DateFormatSymbols customClone = (DateFormatSymbols) original.clone();
            check(Arrays.equals(symbol.get(original), symbol.get(customClone)), symbol + " custom clone value");
            symbol.set(customClone, expected);
            check(symbol.get(original)[0].equals("custom " + symbol.fieldName), symbol + " clone setter isolation");
        }
        check(!original.equals(clone), "changed symbols must differ");
        check(clone.hashCode() == oldHash, "peer hash must not change");
        check(original.hashCode() == ((DateFormatSymbols) original.clone()).hashCode(),
                "setter must invalidate hash");
    }

    @SuppressWarnings("serial")
    private static class Subclass extends DateFormatSymbols {
        Subclass() {
            super(Locale.US);
        }

        @Override
        public String[] getMonths() {
            String[] months = super.getMonths();
            months[0] = "SubclassJanuary";
            return months;
        }
    }

    private static void checkSubclass() throws Exception {
        Subclass original = new Subclass();
        Subclass clone = (Subclass) original.clone();
        for (Symbol symbol : SYMBOLS) {
            check(symbol.internal(original) != symbol.internal(clone), symbol + " subclass clone copy");
        }
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy MMMM dd", original);
        formatter.setCalendar(new GregorianCalendar(TimeZone.getTimeZone("GMT"), Locale.US));
        String text = formatter.format(new Date(0));
        check(text.equals("1970 SubclassJanuary 01"), "virtual subclass getter");
        check(formatter.parse(text).equals(new Date(0)), "subclass parse");
    }

    private static String[][] internalZones(DateFormatSymbols dfs) throws Exception {
        Field field = DateFormatSymbols.class.getDeclaredField("zoneStrings");
        field.setAccessible(true);
        return (String[][]) field.get(dfs);
    }

    private static void checkZones() throws Exception {
        DateFormatSymbols original = new DateFormatSymbols(Locale.US);
        check(internalZones(original) == null, "zones should be lazy");
        check(internalZones((DateFormatSymbols) original.clone()) == null, "cloned zones should be lazy");
        original.getZoneStrings();
        checkZoneClone(original);
        String[][] input = {{"GMT", "Custom Standard", "CST", "Custom Daylight", "CDT"}};
        original.setZoneStrings(input);
        input[0][1] = "modified setter input";
        input[0] = new String[5];
        check(original.getZoneStrings()[0][1].equals("Custom Standard"), "zone setter isolation");
        String[][] output = original.getZoneStrings();
        output[0][1] = "modified getter result";
        check(original.getZoneStrings()[0][1].equals("Custom Standard"), "zone getter isolation");
        checkZoneClone(original);
    }

    private static void checkZoneClone(DateFormatSymbols original) throws Exception {
        DateFormatSymbols clone = (DateFormatSymbols) original.clone();
        String[][] a = internalZones(original);
        String[][] b = internalZones(clone);
        check(a != b && Arrays.deepEquals(a, b), "zone table clone");
        for (int i = 0; i < a.length; i++) {
            check(a[i] != b[i], "zone row clone " + i);
        }
    }

    private static void checkFormatParse() throws Exception {
        DateFormatSymbols symbols = new DateFormatSymbols(Locale.US);
        symbols.setZoneStrings(new String[][]{{"GMT", "Custom Standard", "CST", "Custom Daylight", "CDT"}});
        SimpleDateFormat original = new SimpleDateFormat("G yyyy MMMM dd EEEE hh:mm:ss a zzzz", symbols);
        original.setCalendar(new GregorianCalendar(TimeZone.getTimeZone("GMT"), Locale.US));
        Date epoch = new Date(0);
        String text = original.format(epoch);
        check(text.endsWith("Custom Standard"), "custom time zone format");
        check(original.parse(text).equals(epoch), "format/parse roundtrip");
        SimpleDateFormat clone = (SimpleDateFormat) original.clone();
        DateFormatSymbols changed = clone.getDateFormatSymbols();
        String[] months = changed.getMonths();
        months[0] = "ChangedJanuary";
        changed.setMonths(months);
        clone.setDateFormatSymbols(changed);
        check(clone.format(epoch).contains("ChangedJanuary"), "formatter clone setter");
        check(original.format(epoch).equals(text), "formatter clone isolation");
    }

    private static void checkRegionOverride() throws Exception {
        DateFormatSymbols original = new DateFormatSymbols(Locale.forLanguageTag("fr-CA-u-rg-frzzzz"));
        for (Symbol symbol : SYMBOLS) {
            DateFormatSymbols clone = (DateFormatSymbols) original.clone();
            String[] expected = symbol.get(original);
            check(Arrays.equals(expected, symbol.get(clone)), symbol + " region-override clone");
            check(symbol.internal(original) == symbol.internal(clone), symbol + " region-override sharing");
            String[] changed = expected.clone();
            changed[0] = "region-override local change";
            symbol.set(clone, changed);
            check(Arrays.equals(expected, symbol.get(original)), symbol + " region-override isolation");
        }
    }

    private static void checkConcurrentCache() throws Exception {
        // Exercise cache publication without also racing the inherited shared
        // region-override Locale.Builder. That path is covered sequentially.
        Locale locale = Locale.CANADA_FRENCH;
        String[] expected = new DateFormatSymbols(locale).getMonths();
        var cacheField = DateFormatSymbols.class.getDeclaredField("cachedInstances");
        cacheField.setAccessible(true);
        ((java.util.Map<?, ?>) cacheField.get(null)).remove(locale);
        CyclicBarrier start = new CyclicBarrier(4);
        try (var executor = Executors.newFixedThreadPool(4)) {
            Future<?>[] tasks = new Future<?>[4];
            for (int i = 0; i < tasks.length; i++) {
                tasks[i] = executor.submit(() -> {
                    start.await();
                    for (int j = 0; j < 100; j++) {
                        DateFormatSymbols dfs = new DateFormatSymbols(locale);
                        check(Arrays.equals(expected, dfs.getMonths()), "concurrent cache values");
                        String[] changed = expected.clone();
                        changed[0] = "local change";
                        dfs.setMonths(changed);
                        check(Arrays.equals(expected, new DateFormatSymbols(locale).getMonths()),
                                "concurrent cache isolation");
                    }
                    return null;
                });
            }
            for (Future<?> task : tasks) {
                task.get();
            }
        }
    }

    private static void check(boolean condition, String message) {
        if (!condition) {
            throw new AssertionError(message);
        }
    }
}
