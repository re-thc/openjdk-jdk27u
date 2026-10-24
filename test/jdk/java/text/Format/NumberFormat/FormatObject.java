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
 * @summary Check that format(Object) and formatToCharacterIterator(Object)
 *          of the number formats format each kind of Number as the format
 *          method for its type does, and reject other objects.
 * @run main FormatObject
 */

import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.ChoiceFormat;
import java.text.DecimalFormat;
import java.text.FieldPosition;
import java.text.Format;
import java.text.NumberFormat;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

public class FormatObject {

    // Not a known type of number: formatted as a double
    private static final Number CUSTOM = new Number() {
        @Override public int intValue() { return 7; }
        @Override public long longValue() { return 7; }
        @Override public float floatValue() { return 1234.5f; }
        @Override public double doubleValue() { return 1234.5; }
    };

    public static void main(String[] args) {
        // A format that uses the method of NumberFormat
        NumberFormat choice = new ChoiceFormat(new double[] {0, 1, 2, 1000, 10000},
                new String[] {"zero", "one", "two", "thousand", "many"});
        // ChoiceFormat does not format a BigInteger or BigDecimal in any other way than as a double
        checkLongs(choice);
        checkDoubles(choice);
        check(choice, BigInteger.ONE.shiftLeft(63), choice.format(Math.pow(2, 63)));
        check(choice, new BigDecimal("1000.25"), choice.format(1000.25));
        check(choice, CUSTOM, choice.format(1234.5));
        checkRejected(choice);

        DecimalFormat decimal = (DecimalFormat) NumberFormat.getInstance(Locale.US);
        decimal.setMaximumFractionDigits(20);
        checkLongs(decimal);
        checkDoubles(decimal);
        check(decimal, BigInteger.ONE.shiftLeft(63), "9,223,372,036,854,775,808");
        check(decimal, BigInteger.ONE.shiftLeft(100).negate(), "-1,267,650,600,228,229,401,496,703,205,376");
        check(decimal, new BigDecimal("12345678901234567890.123456789"), "12,345,678,901,234,567,890.123456789");
        check(decimal, CUSTOM, decimal.format(1234.5));
        checkRejected(decimal);
        checkIterator(decimal);

        NumberFormat compact = NumberFormat.getCompactNumberInstance(Locale.US, NumberFormat.Style.SHORT);
        checkLongs(compact);
        checkDoubles(compact);
        check(compact, BigInteger.ONE.shiftLeft(63), "9223372T");
        check(compact, new BigDecimal("12345678901234567890.123456789"), "12345679T");
        check(compact, CUSTOM, compact.format(1234.5));
        checkRejected(compact);
        checkIterator(compact);
    }

    private static void checkLongs(NumberFormat format) {
        for (long value : new long[] {0, 1, 2, -1, 1000, 12345, Integer.MAX_VALUE, Integer.MIN_VALUE,
                Long.MAX_VALUE, Long.MIN_VALUE}) {
            String expected = format.format(value);
            check(format, value, expected);
            check(format, BigInteger.valueOf(value), expected);
            check(format, new AtomicLong(value), expected);
            if (value >= Integer.MIN_VALUE && value <= Integer.MAX_VALUE) {
                check(format, (int) value, expected);
                check(format, new AtomicInteger((int) value), expected);
            }
            if (value >= Short.MIN_VALUE && value <= Short.MAX_VALUE) {
                check(format, (short) value, expected);
            }
            if (value >= Byte.MIN_VALUE && value <= Byte.MAX_VALUE) {
                check(format, (byte) value, expected);
            }
        }
    }

    private static void checkDoubles(NumberFormat format) {
        for (double value : new double[] {0.0, 1.5, -2.25, 1000.125, 12345.6789, 1e15, Double.MAX_VALUE}) {
            check(format, value, format.format(value));
            // The float is formatted as the double that has its value
            check(format, (float) value, format.format((double) (float) value));
        }
    }

    private static void check(NumberFormat format, Object number, String expected) {
        String actual = format.format(number);
        if (!expected.equals(actual)) {
            throw new RuntimeException(format.getClass().getSimpleName() + " " + number.getClass().getSimpleName()
                    + " " + number + ": expected " + expected + " but got " + actual);
        }
        // The StringBuffer of the caller is the one that is returned
        StringBuffer buffer = new StringBuffer("[");
        if (format.format(number, buffer, new FieldPosition(0)) != buffer
                || !buffer.toString().equals("[" + expected)) {
            throw new RuntimeException(format.getClass().getSimpleName() + " " + number.getClass().getSimpleName()
                    + " " + number + ": bad buffer " + buffer);
        }
    }

    private static void checkRejected(Format format) {
        for (Object object : new Object[] {null, "12", 'c', new Object(), Boolean.TRUE}) {
            try {
                format.format(object);
                throw new RuntimeException(format.getClass().getSimpleName() + ": formatted " + object);
            } catch (IllegalArgumentException expected) {
            }
        }
    }

    private static void checkIterator(Format format) {
        for (Object number : new Object[] {1.5, 2.5f, 3L, 4, (short) 5, (byte) 6, new AtomicInteger(7),
                new AtomicLong(8), new BigDecimal("9.5"), BigInteger.TEN}) {
            String expected = format.format(number);
            var iterator = format.formatToCharacterIterator(number);
            StringBuilder actual = new StringBuilder();
            for (char c = iterator.first(); c != java.text.CharacterIterator.DONE; c = iterator.next()) {
                actual.append(c);
            }
            if (!expected.equals(actual.toString())) {
                throw new RuntimeException(format.getClass().getSimpleName() + " " + number.getClass().getSimpleName()
                        + ": iterator over " + actual + " but formatted " + expected);
            }
        }
        try {
            format.formatToCharacterIterator(null);
            throw new RuntimeException("Iterated over null");
        } catch (NullPointerException expected) {
        }
        for (Object object : new Object[] {"12", 'c', new Object(), CUSTOM}) {
            try {
                format.formatToCharacterIterator(object);
                throw new RuntimeException("Iterated over " + object);
            } catch (IllegalArgumentException expected) {
            }
        }
    }
}
