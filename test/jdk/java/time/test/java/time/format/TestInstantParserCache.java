/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only
 */
package test.java.time.format;

import java.nio.CharBuffer;
import java.text.ParsePosition;
import java.time.Instant;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.format.DateTimeParseException;
import java.time.format.DecimalStyle;
import java.time.temporal.ChronoField;
import java.time.temporal.TemporalAccessor;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class TestInstantParserCache {
    private static final String TEXT = "1969-12-31T23:59:59.000001Z";
    private static final Instant VALUE = Instant.ofEpochSecond(-1, 1000);
    private static final DateTimeFormatter SENSITIVE = new DateTimeFormatterBuilder()
            .parseCaseSensitive().appendInstant().toFormatter(Locale.ROOT);
    private static final DateTimeFormatter INSENSITIVE = new DateTimeFormatterBuilder()
            .parseCaseInsensitive().appendInstant(-1).toFormatter(Locale.ROOT);
    private static final DateTimeFormatter LENIENT = new DateTimeFormatterBuilder()
            .parseLenient().appendInstant(-1).toFormatter(Locale.ROOT);
    private static final DateTimeFormatter ARABIC = SENSITIVE.withDecimalStyle(
            DecimalStyle.STANDARD.withZeroDigit('\u0660').withDecimalSeparator('\u066b'));

    private static String arabic(String text) {
        StringBuilder out = new StringBuilder(text.length());
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            out.append(c >= '0' && c <= '9' ? (char)('\u0660' + c - '0')
                    : c == '.' ? '\u066b' : c);
        }
        return out.toString();
    }

    @Test
    public void independentParseContexts() {
        for (int i = 0; i < 10; i++) {
            assertEquals(VALUE, SENSITIVE.parse(TEXT, Instant::from));
            assertEquals(Instant.parse("2000-01-02T03:04:05Z"),
                    LENIENT.parse("2000-1-2T3:4:5Z", Instant::from));
            assertThrows(DateTimeParseException.class,
                    () -> SENSITIVE.parse("2000-1-2T3:4:5Z", Instant::from));
            assertEquals(VALUE, ARABIC.parse(arabic(TEXT), Instant::from));
            assertEquals(VALUE, INSENSITIVE.parse(TEXT.toLowerCase(Locale.ROOT), Instant::from));
            assertThrows(DateTimeParseException.class,
                    () -> SENSITIVE.parse(TEXT.toLowerCase(Locale.ROOT), Instant::from));
            assertEquals(VALUE, DateTimeFormatter.ISO_INSTANT.parse(new StringBuilder(TEXT), Instant::from));
            assertEquals(VALUE, DateTimeFormatter.ISO_INSTANT.parse(CharBuffer.wrap(TEXT), Instant::from));
        }
    }

    @Test
    public void fieldsAndParsePositionStayLocal() {
        DateTimeFormatter combined = new DateTimeFormatterBuilder()
                .appendValue(ChronoField.YEAR, 4).appendLiteral('|').appendInstant()
                .toFormatter(Locale.ROOT);
        String text = "1999|" + TEXT + "tail";
        ParsePosition position = new ParsePosition(0);
        TemporalAccessor parsed = combined.parseUnresolved(text, position);
        assertNotNull(parsed);
        assertEquals(text.length() - 4, position.getIndex());
        assertEquals(1999, parsed.getLong(ChronoField.YEAR));
        assertEquals(-1, parsed.getLong(ChronoField.INSTANT_SECONDS));
        assertEquals(1000, parsed.getLong(ChronoField.NANO_OF_SECOND));

        ParsePosition invalid = new ParsePosition(0);
        assertNull(combined.parseUnresolved("1999|1900-02-29T00:00:00Z", invalid));
        assertEquals(5, invalid.getErrorIndex());
        assertEquals(0, invalid.getIndex());

        ParsePosition offset = new ParsePosition(2);
        TemporalAccessor again = SENSITIVE.parseUnresolved("@@" + TEXT + "tail", offset);
        assertNotNull(again);
        assertEquals(2 + TEXT.length(), offset.getIndex());
        assertEquals(-1, again.getLong(ChronoField.INSTANT_SECONDS));
        assertEquals(1999, parsed.getLong(ChronoField.YEAR));
    }

    @Test
    public void leapSecondAndFailureDoNotLeak() {
        TemporalAccessor leap = INSENSITIVE.parse("2016-12-31T23:59:60.5Z");
        assertTrue(leap.query(DateTimeFormatter.parsedLeapSecond()));
        assertEquals(Instant.ofEpochSecond(1483228799L, 500000000), Instant.from(leap));
        for (String text : List.of("1900-02-29T00:00:00Z", "2000-04-31T00:00:00Z",
                "2000-01-01T24:00:01Z", "2000-01-01T00:00:00.1234567890Z")) {
            assertThrows(DateTimeParseException.class, () -> INSENSITIVE.parse(text));
        }
        TemporalAccessor normal = INSENSITIVE.parse(TEXT);
        assertFalse(normal.query(DateTimeFormatter.parsedLeapSecond()));
        assertEquals(VALUE, Instant.from(normal));
        assertEquals(Instant.parse("2000-01-02T00:00:00Z"),
                INSENSITIVE.parse("2000-01-01T24:00:00Z", Instant::from));
        assertEquals(Instant.MIN, SENSITIVE.parse(Instant.MIN.toString(), Instant::from));
        assertEquals(Instant.MAX, SENSITIVE.parse(Instant.MAX.toString(), Instant::from));
    }

    @Test
    public void sharedFormattersAcrossThreads() throws Exception {
        var pool = Executors.newFixedThreadPool(4, task -> {
            Thread thread = new Thread(task);
            thread.setDaemon(true);
            return thread;
        });
        try {
            var work = new ArrayList<java.util.concurrent.Callable<Void>>();
            for (int thread = 0; thread < 4; thread++) {
                final int slot = thread;
                work.add(() -> {
                    Instant expected = Instant.ofEpochSecond(-1 - slot, 1000 + slot);
                    String ascii = expected.toString();
                    for (int i = 0; i < 1000; i++) {
                        DateTimeFormatter formatter = (i + slot) % 2 == 0 ? SENSITIVE : ARABIC;
                        String text = formatter == ARABIC ? arabic(ascii) : ascii;
                        assertEquals(expected, formatter.parse(text, Instant::from));
                        assertEquals(expected, INSENSITIVE.parse(ascii.toLowerCase(Locale.ROOT), Instant::from));
                    }
                    return null;
                });
            }
            for (var future : pool.invokeAll(work, 30, TimeUnit.SECONDS)) {
                future.get(1, TimeUnit.SECONDS);
            }
        } finally {
            pool.shutdownNow();
        }
    }
}
