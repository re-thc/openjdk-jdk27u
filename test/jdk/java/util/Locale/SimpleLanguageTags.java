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
 * @summary Check that Locale.forLanguageTag returns the locale that the
 *          builder does for the tags ll, ll-Ssss, ll-CC and ll-Ssss-CC, which
 *          it creates without parsing them, and that it does not mistake
 *          other tags for those.
 * @run main SimpleLanguageTags
 */

import java.util.IllformedLocaleException;
import java.util.List;
import java.util.Locale;

public class SimpleLanguageTags {

    private static int checked;

    public static void main(String[] args) {
        // The tags of the locales of the providers
        for (Locale locale : Locale.getAvailableLocales()) {
            check(locale.toLanguageTag());
        }

        // Every two and three letter language, with the shapes of the tags
        List<String> suffixes = List.of("", "-Latn", "-US", "-Latn-US", "-419", "-Hans-001");
        for (char c1 = 'a'; c1 <= 'z'; c1++) {
            for (char c2 = 'a'; c2 <= 'z'; c2++) {
                for (String suffix : suffixes) {
                    check("" + c1 + c2 + suffix);
                }
                for (char c3 = 'a'; c3 <= 'z'; c3++) {
                    for (String suffix : suffixes) {
                        check("" + c1 + c2 + c3 + suffix);
                    }
                }
            }
        }

        // Every region and script, and the old codes of some languages
        for (String language : List.of("en", "iw", "in", "ji", "he", "zh", "yue", "und", "sgn", "no", "ja", "th")) {
            for (char c1 = 'A'; c1 <= 'Z'; c1++) {
                for (char c2 = 'A'; c2 <= 'Z'; c2++) {
                    check(language + "-" + c1 + c2);
                }
            }
            for (int i = 0; i < 1000; i++) {
                check(language + "-" + String.format("%03d", i));
            }
        }
        int n = 0;
        for (String language : List.of("en", "und")) {
            for (char c1 = 'A'; c1 <= 'Z'; c1++) {
                for (char c2 = 'a'; c2 <= 'z'; c2++) {
                    for (char c3 = 'a'; c3 <= 'z'; c3++) {
                        for (char c4 = 'a'; c4 <= 'z'; c4++) {
                            if (n++ % 11 == 0) {
                                check(language + "-" + c1 + c2 + c3 + c4);
                            }
                        }
                    }
                }
            }
        }
        // The characters around the ones of the subtags
        for (char c : "/09:@AZ[`az{".toCharArray()) {
            for (String tag : List.of("%c%c", "%c%c-US", "ab-%c%c", "ab-%c%c%c%c", "ab-Cd%c%c", "ab-C%c%c%c", "ab-C%c%c%c-US",
                    "ab-Cdef-%c%c", "ab-Cdef-%c%c%c")) {
                check(tag.formatted(c, c, c, c));
            }
        }

        // Tags that look like the above and are not, or are not in the case of their canonical form
        for (String tag : List.of("en-us", "EN-US", "En-Us", "en-latn", "en-LATN", "en-latn-us", "en-Latn-us",
                "i-klingon", "zh-min", "zh-min-nan", "zh-guoyu", "no-bok", "no-nyn", "sgn-BE-FR", "sgn-BE-NL",
                "sgn-CH-DE", "en-GB-oed", "art-lojban", "cel-gaulish", "zh-cmn-Hans", "und", "und-US", "und-Latn",
                "UND", "en-USA", "en-US-POSIX", "ja-JP-JP", "th-TH-TH", "no-NO-NY", "en-u-ca-gregory",
                "en-US-x-lvariant-POSIX", "x-lvariant-POSIX", "en-1996", "de-1901", "en-Latn-1234")) {
            check(tag);
        }

        // Tags the builder rejects, with the lenient result of forLanguageTag
        expect("", Locale.ROOT);
        expect("-", Locale.ROOT);
        expect("e", Locale.ROOT);
        expect("en-", Locale.ENGLISH);
        expect("en--US", Locale.ENGLISH);
        expect("en-US-", Locale.US);
        expect("en_US", Locale.ROOT);
        expect("en-Latn-", Locale.forLanguageTag("en-Latn"));
        expect("en-12", Locale.ENGLISH);
        expect("en-1234", Locale.forLanguageTag("en-1234"));
        expect("én-US", Locale.ROOT);
        expect("en-٠١٢", Locale.ENGLISH);
        expect("abcde", Locale.of("abcde"));
        expect("und", Locale.ROOT);
        expect("und-US", Locale.of("", "US"));

        System.out.println("Checked " + checked + " language tags");
    }

    private static void check(String tag) {
        Locale actual = Locale.forLanguageTag(tag);
        Locale expected;
        try {
            expected = new Locale.Builder().setLanguageTag(tag).build();
        } catch (IllformedLocaleException e) {
            return;
        }
        checked++;
        if (!actual.equals(expected) || actual.hashCode() != expected.hashCode()
                || !actual.toString().equals(expected.toString())
                || !actual.toLanguageTag().equals(expected.toLanguageTag())) {
            throw new RuntimeException("forLanguageTag(\"" + tag + "\") is " + actual
                    + " but the builder's locale is " + expected);
        }
    }

    private static void expect(String tag, Locale expected) {
        Locale actual = Locale.forLanguageTag(tag);
        if (!actual.equals(expected) || !actual.toLanguageTag().equals(expected.toLanguageTag())) {
            throw new RuntimeException("forLanguageTag(\"" + tag + "\") is " + actual
                    + " but should be " + expected);
        }
    }
}
