/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only
 */

package test.java.time;

import java.lang.reflect.Method;
import org.junit.jupiter.api.Test;
import java.time.Instant;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

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

    @Test
    public void testOriginalOutcomesAndNativeGrammar() throws Exception {
        for (String s : new String[] {
                "0000-02-29T23:59:59.999999Z", "0100-02-29T00:00:00Z",
                "1900-02-29T00:00:00Z", "2000-02-29T00:00:00Z", "2000-04-31T00:00:00Z",
                "1969-12-31T23:59:59.000001Z", "1970-01-01T00:00:00Z",
                "9999-12-31T23:59:59.1234Z", "9999-12-31T24:00:00Z",
                "2016-12-31T23:59:60.123456Z", "2000-01-01T00:00:00.000000000Z",
                "2000-01-01t00:00:00z", "2000-01-01T00:00:00+00:00:30",
                "2000-01-01T00:00:00.Z", "2000-01-01T00:00:00,1Z"}) {
            compare(s);
        }
        compare(null);
        compare(new StringBuilder("1969-12-31T23:59:59.000001Z"));
        for (int y : new int[] {0, 1, 100, 400, 1900, 1970, 2000, 2100, 2400, 9999}) {
            for (int m = 0; m <= 13; m++) for (int d = 0; d <= 32; d++) {
                compare(String.format(java.util.Locale.ROOT, "%04d-%02d-%02dT12:34:56.000001Z", y, m, d));
            }
        }
        Class<?> config = Class.forName("java.time.InstantParserConfig");
        var enabled = config.getDeclaredField("ENABLED");
        enabled.setAccessible(true);
        if (!(boolean)enabled.get(null) || "false".equals(System.getProperty("jdk.time.instantSpeedate"))) {
            return;
        }
        Class<?> parser = Class.forName("java.time.InstantParser");
        Method eligible = parser.getDeclaredMethod("eligible", String.class);
        Method fast = parser.getDeclaredMethod("tryParse", String.class);
        Method raw = parser.getDeclaredMethod("parse0", String.class);
        eligible.setAccessible(true); fast.setAccessible(true); raw.setAccessible(true);
        Instant epoch = (Instant)fast.invoke(null, "1970-01-01T00:00:00Z");
        if (!Instant.EPOCH.equals(epoch)) throw new AssertionError("Native backend did not execute");
        char[] unicode = "2000-01-01T00:00:00Z".toCharArray();
        unicode[11] = 0; unicode[12] = '\u0210';
        for (String s : new String[] {"2000-01-01T/::00:00Z", "2000-/;-01T00:00:00Z", new String(unicode)}) {
            if (!(boolean)eligible.invoke(null, s)) throw new AssertionError("Test must exercise coarse eligibility");
            if (fast.invoke(null, s) != null || (long)raw.invoke(null, s) != Long.MIN_VALUE) {
                throw new AssertionError("Native grammar validation was bypassed");
            }
            compare(s);
        }
    }
}
