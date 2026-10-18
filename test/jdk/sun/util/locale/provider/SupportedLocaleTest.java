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
 * @summary Check that the calendar data and currency name providers of the
 *          locale provider adapters support the locales that are specified
 *          by LocaleServiceProvider.isSupportedLocale, that the CLDR
 *          adapter has the same language tags for all categories, that
 *          the available locales of the providers are not shared, and that
 *          the language tags of the adapters are the same whichever of
 *          them are asked for first.
 * @modules java.base/sun.util.locale.provider
 *          java.base/sun.util.cldr
 * @run main SupportedLocaleTest
 */

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.TreeSet;
import java.util.function.Supplier;
import java.util.spi.CalendarDataProvider;
import java.util.spi.CurrencyNameProvider;
import java.util.spi.LocaleServiceProvider;

import sun.util.cldr.CLDRLocaleProviderAdapter;
import sun.util.locale.provider.FallbackLocaleProviderAdapter;
import sun.util.locale.provider.JRELocaleProviderAdapter;
import sun.util.locale.provider.LocaleProviderAdapter;
import sun.util.locale.provider.LocaleProviderAdapter.Type;

public class SupportedLocaleTest {

    public static void main(String[] args) {
        List<Locale> locales = new ArrayList<>(List.of(Locale.getAvailableLocales()));
        for (String language : Locale.getISOLanguages()) {
            locales.add(Locale.of(language));
        }
        locales.addAll(List.of(
                Locale.ROOT,
                Locale.US,
                Locale.GERMANY,
                Locale.of("en", "XX"),
                Locale.of("xx", "YY"),
                Locale.of("ja", "JP", "JP"),
                Locale.of("th", "TH", "TH"),
                Locale.of("no", "NO", "NY"),
                Locale.of("en", "US", "POSIX"),
                Locale.forLanguageTag("mo"),
                Locale.forLanguageTag("tl"),
                Locale.forLanguageTag("zh-Hant-HK"),
                Locale.forLanguageTag("en-US-u-ca-japanese"),
                Locale.forLanguageTag("de-u-nu-thai"),
                Locale.forLanguageTag("x-private")));

        // The language tags of java.base are known before those of jdk.localedata,
        // which must not change what the sets answer.
        for (String category : List.of("FormatData", "CollationData", "BreakIteratorInfo",
                "BreakIteratorRules", "BreakIteratorResources", "TimeZoneNames", "LocaleNames",
                "CurrencyNames", "CalendarData", "AvailableLocales", "NoSuchCategory")) {
            checkTags(JRELocaleProviderAdapter::new, category);
            checkTags(FallbackLocaleProviderAdapter::new, category);
            checkTags(CLDRLocaleProviderAdapter::new, category);
        }

        // The FALLBACK adapter supports few locales: do not try all of them.
        List<Locale> fewLocales = List.of(Locale.ROOT, Locale.ENGLISH, Locale.US,
                Locale.GERMANY, Locale.of("xx", "YY"), Locale.of("en", "US", "POSIX"),
                Locale.forLanguageTag("en-US-u-ca-japanese"), Locale.forLanguageTag("x-private"));
        for (Type type : List.of(Type.CLDR, Type.FALLBACK)) {
            LocaleProviderAdapter adapter = LocaleProviderAdapter.forType(type);
            List<Locale> toCheck = type == Type.CLDR ? locales : fewLocales;
            check(adapter, adapter.getLocaleServiceProvider(CalendarDataProvider.class), toCheck);
            check(adapter, adapter.getLocaleServiceProvider(CurrencyNameProvider.class), toCheck);
        }

        // All the categories of the CLDR adapter share the available locales.
        JRELocaleProviderAdapter cldr =
                (JRELocaleProviderAdapter) LocaleProviderAdapter.forType(Type.CLDR);
        Set<String> tags = cldr.getLanguageTagSet("FormatData");
        for (String category : List.of("CalendarData", "CurrencyNames",
                "LocaleNames", "TimeZoneNames", "AvailableLocales")) {
            if (!tags.equals(cldr.getLanguageTagSet(category))) {
                throw new RuntimeException("Different language tags for " + category);
            }
        }
        // Tags are separated by runs of spaces, and the first one is empty
        // as the list starts with a space: it stands for Locale.ROOT.
        for (String tag : List.of("", "en", "en-US", "en-US-POSIX", "de", "ja-JP", "zh-Hant-HK")) {
            if (!tags.contains(tag)) {
                throw new RuntimeException("No language tag '" + tag + "'");
            }
        }
        if (tags.stream().anyMatch(t -> t.contains(" "))) {
            throw new RuntimeException("Language tag with a space");
        }

        // The adapter has the locales of its language tags
        Set<Locale> adapterLocales = Set.of(cldr.getAvailableLocales());
        for (LocaleServiceProvider provider : List.of(
                cldr.getLocaleServiceProvider(CalendarDataProvider.class),
                cldr.getLocaleServiceProvider(CurrencyNameProvider.class))) {
            if (!adapterLocales.equals(Set.of(provider.getAvailableLocales()))) {
                throw new RuntimeException(provider.getClass().getSimpleName()
                        + ": not the locales of the adapter");
            }
        }
    }

    // The tags of an adapter that is first asked about a few of them are those of one
    // that is asked for all of them.
    private static void checkTags(Supplier<JRELocaleProviderAdapter> newAdapter, String category) {
        Set<String> lazy = newAdapter.get().getLanguageTagSet(category);
        Set<String> all = new HashSet<>(newAdapter.get().getLanguageTagSet(category));
        List<String> probes = new ArrayList<>(List.of("", "en", "en-US", "th", "ja", "de", "und", "xx"));
        probes.addAll(all);
        // A category without tags is empty, for LocaleData to weed out no locale
        if (lazy.isEmpty() != all.isEmpty()) {
            throw new RuntimeException(category + ": isEmpty " + lazy.isEmpty() + " for " + all);
        }
        for (String tag : probes) {
            if (lazy.contains(tag) != all.contains(tag)) {
                throw new RuntimeException(category + ": contains('" + tag + "') "
                        + lazy.contains(tag) + " for " + all);
            }
        }
        if (!lazy.equals(all) || lazy.size() != all.size() || lazy.hashCode() != all.hashCode()) {
            throw new RuntimeException(category + ": " + new TreeSet<>(lazy) + " not " + new TreeSet<>(all));
        }
    }

    private static void check(LocaleProviderAdapter adapter, LocaleServiceProvider provider,
            List<Locale> locales) {
        Locale[] availableLocales = provider.getAvailableLocales();
        Set<Locale> available = Set.of(availableLocales);
        // The caller owns the array
        Arrays.fill(availableLocales, null);
        if (!available.equals(Set.of(provider.getAvailableLocales()))) {
            throw new RuntimeException(adapter.getAdapterType() + " "
                    + provider.getClass().getSimpleName() + ": available locales changed");
        }
        List<Locale> stripped = available.stream().map(Locale::stripExtensions).toList();
        for (Locale locale : locales) {
            // As specified by LocaleServiceProvider.isSupportedLocale
            boolean expected = stripped.contains(locale.stripExtensions());
            boolean actual = provider.isSupportedLocale(locale);
            if (expected != actual) {
                throw new RuntimeException(adapter.getAdapterType() + " "
                        + provider.getClass().getSimpleName() + " " + locale
                        + ": expected " + expected + " but got " + actual);
            }
        }
    }
}
