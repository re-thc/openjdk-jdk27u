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

package scannerprovider;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.function.Consumer;

public class State {
    public static final Locale CUSTOM = Locale.of("qaa", "QM");
    public static final Locale OTHER_CUSTOM = Locale.of("qaa", "QN");
    public static final Locale[] LOCALES = {
        Locale.US, Locale.GERMANY, CUSTOM, OTHER_CUSTOM
    };
    public static final RuntimeException FAILURE = new RuntimeException("provider failure");

    public static final List<String> events = new ArrayList<>();
    public static final List<String> requests = new ArrayList<>();
    public static DecimalFormat numberFormat;
    public static DecimalFormatSymbols symbols;
    public static boolean symbolsOnly;
    public static String failAt;
    public static int failureCountdown;
    public static Consumer<Locale> numberCallback;

    public static void prepare(boolean onlySymbols) {
        symbolsOnly = onlySymbols;
        failAt = null;
        numberCallback = null;
        numberFormat = new RecordedFormat();
        numberFormat.setPositivePrefix("pos[");
        numberFormat.setNegativePrefix("neg(");
        numberFormat.setPositiveSuffix("]+");
        numberFormat.setNegativeSuffix(")-");
        symbols = new RecordedSymbols();
        symbols.setGroupingSeparator('_');
        symbols.setDecimalSeparator(':');
        symbols.setNaN("old.nan");
        symbols.setInfinity("old.inf");
        clearTrace();
    }

    public static void clearTrace() {
        events.clear();
        requests.clear();
    }

    public static void event(String event) {
        events.add(event);
        if (event.equals(failAt) && --failureCountdown == 0) {
            throw FAILURE;
        }
    }

    public static void request(String event, Locale locale) {
        requests.add(event + "=" + locale.toLanguageTag());
        event(event);
    }

    private static class RecordedFormat extends DecimalFormat {
        RecordedFormat() {
            super("#,##0.###", new DecimalFormatSymbols(Locale.ROOT));
        }

        @Override
        public String getPositivePrefix() {
            event("positivePrefix");
            return super.getPositivePrefix();
        }

        @Override
        public String getNegativePrefix() {
            event("negativePrefix");
            return super.getNegativePrefix();
        }

        @Override
        public String getPositiveSuffix() {
            event("positiveSuffix");
            return super.getPositiveSuffix();
        }

        @Override
        public String getNegativeSuffix() {
            event("negativeSuffix");
            return super.getNegativeSuffix();
        }
    }

    private static class RecordedSymbols extends DecimalFormatSymbols {
        RecordedSymbols() {
            super(Locale.ROOT);
        }

        @Override
        public char getGroupingSeparator() {
            event("grouping");
            return super.getGroupingSeparator();
        }

        @Override
        public char getDecimalSeparator() {
            event("decimal");
            return super.getDecimalSeparator();
        }

        @Override
        public String getNaN() {
            event("nan");
            return super.getNaN();
        }

        @Override
        public String getInfinity() {
            event("infinity");
            return super.getInfinity();
        }
    }
}
