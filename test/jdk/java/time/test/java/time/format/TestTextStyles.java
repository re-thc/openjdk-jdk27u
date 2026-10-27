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
 * @summary Check the texts of all the styles of the text fields, whichever
 *          style, and whether printing or parsing, is used first in a locale.
 */
package test.java.time.format;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.text.ParsePosition;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.format.TextStyle;
import java.time.temporal.ChronoField;
import java.time.temporal.IsoFields;
import java.time.temporal.TemporalAccessor;
import java.time.temporal.TemporalField;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import org.junit.jupiter.api.Test;

public class TestTextStyles {

    // The texts of the values of a field, in the order of TextStyle.values().
    // Stand-alone styles that have no text for the field print the numbers.
    private record Texts(TemporalField field, long firstValue, String... styles) {}

    private static final List<Texts> TEXTS = List.of(
        new Texts(ChronoField.ERA, 0,
            "Before Christ|Anno Domini", "0|1", "BC|AD", "0|1", "B|A", "0|1"),
        new Texts(ChronoField.MONTH_OF_YEAR, 1,
            "January|February|March|April|May|June|July|August|September|October|November|December",
            "January|February|March|April|May|June|July|August|September|October|November|December",
            "Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec",
            "Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec",
            "J|F|M|A|M|J|J|A|S|O|N|D", "J|F|M|A|M|J|J|A|S|O|N|D"),
        new Texts(ChronoField.DAY_OF_WEEK, 1,
            "Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday",
            "Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday",
            "Mon|Tue|Wed|Thu|Fri|Sat|Sun", "Mon|Tue|Wed|Thu|Fri|Sat|Sun",
            "M|T|W|T|F|S|S", "M|T|W|T|F|S|S"),
        new Texts(ChronoField.AMPM_OF_DAY, 0,
            "AM|PM", "0|1", "AM|PM", "0|1", "a|p", "0|1"),
        new Texts(IsoFields.QUARTER_OF_YEAR, 1,
            "1st quarter|2nd quarter|3rd quarter|4th quarter",
            "1st quarter|2nd quarter|3rd quarter|4th quarter",
            "Q1|Q2|Q3|Q4", "Q1|Q2|Q3|Q4", "1|2|3|4", "1|2|3|4"));

    // The locales have the same texts and a cache of their own
    private static final Locale PRINT_FIRST = Locale.US;
    private static final Locale PARSE_FIRST = Locale.ENGLISH;
    private static final Locale ONE_STYLE_FIRST = Locale.forLanguageTag("en-US-u-ca-gregory");

    @Test
    public void printFirst() {
        for (Texts texts : TEXTS) {
            for (TextStyle style : TextStyle.values()) {
                checkPrint(PRINT_FIRST, texts, style);
            }
        }
        for (Texts texts : TEXTS) {
            for (TextStyle style : TextStyle.values()) {
                checkParse(PRINT_FIRST, texts, style, true);
                checkParse(PRINT_FIRST, texts, style, false);
            }
        }
    }

    @Test
    public void parseFirst() {
        // Lenient parsing uses the texts of all the styles
        for (Texts texts : TEXTS) {
            for (TextStyle style : TextStyle.values()) {
                checkParse(PARSE_FIRST, texts, style, false);
            }
        }
        for (Texts texts : TEXTS) {
            for (TextStyle style : TextStyle.values()) {
                checkParse(PARSE_FIRST, texts, style, true);
                checkPrint(PARSE_FIRST, texts, style);
            }
        }
    }

    @Test
    public void oneStyleFirst() {
        // Each style is used, in turn, before any other, for a field
        for (Texts texts : TEXTS) {
            checkPrint(ONE_STYLE_FIRST, texts, TextStyle.SHORT);
        }
        for (Texts texts : TEXTS) {
            checkParse(ONE_STYLE_FIRST, texts, TextStyle.NARROW, true);
        }
        for (Texts texts : TEXTS) {
            for (TextStyle style : TextStyle.values()) {
                checkPrint(ONE_STYLE_FIRST, texts, style);
                checkParse(ONE_STYLE_FIRST, texts, style, true);
            }
        }
    }

    private static void checkPrint(Locale locale, Texts texts, TextStyle style) {
        String[] expected = texts.styles()[style.ordinal()].split("\\|");
        DateTimeFormatter formatter = new DateTimeFormatterBuilder()
                .appendText(texts.field(), style).toFormatter(locale);
        for (int i = 0; i < expected.length; i++) {
            long value = texts.firstValue() + i;
            assertEquals(expected[i], formatter.format(new Value(texts.field(), value)),
                    texts.field() + " " + style + " " + value + " in " + locale);
        }
    }

    private static void checkParse(Locale locale, Texts texts, TextStyle style, boolean strict) {
        String[] names = texts.styles()[style.ordinal()].split("\\|");
        DateTimeFormatterBuilder builder = new DateTimeFormatterBuilder();
        DateTimeFormatter formatter = (strict ? builder.parseStrict() : builder.parseLenient())
                .appendText(texts.field(), style).toFormatter(locale);
        for (int i = 0; i < names.length; i++) {
            ParsePosition position = new ParsePosition(0);
            TemporalAccessor parsed = formatter.parseUnresolved(names[i], position);
            assertNotNull(parsed, names[i] + " " + texts.field() + " " + style + " in " + locale);
            assertEquals(names[i].length(), position.getIndex(), names[i]);
            long value = texts.firstValue() + i;
            // The texts that are not unique, such as the narrow ones, may be any of the values
            if (Arrays.stream(names).filter(names[i]::equals).count() == 1) {
                assertEquals(value, parsed.getLong(texts.field()),
                        names[i] + " " + texts.field() + " " + style + " in " + locale);
            }
        }
    }

    // A single value of a field
    private record Value(TemporalField field, long value) implements TemporalAccessor {
        @Override
        public boolean isSupported(TemporalField f) {
            return f == field;
        }

        @Override
        public long getLong(TemporalField f) {
            return value;
        }
    }
}
