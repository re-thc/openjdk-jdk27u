/*
 * Copyright (c) 1998, 2025, Oracle and/or its affiliates. All rights reserved.
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
 * @bug 4023247 4027685 4032037 4072029 4073003 4118010 4120606 4133833
 *      4136916 6274757 6314387 8347841
 * @modules java.base/java.util:open
 * @run junit DateRegression
 */

import java.util.*;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.fail;

@SuppressWarnings("deprecation")
public class DateRegression {

    /**
     * @bug 4023247
     */
    @Test
    public void Test4023247() {
        Date d1 = new Date(96, Calendar.DECEMBER, 22, 0, 0, 0);
        Date d2 = new Date(96, Calendar.DECEMBER, 22, 0, 0, 0);
        // Field setters are retired in this fork. Compare a cached-calendar
        // Date with an uncached Date through the retained getter path.
        d1.getYear();

        if (d1.hashCode() != d2.hashCode())
            fail("Fail: Date hashCode misbehaves");
    }

    /**
     * @bug 4027685
     */
    @Test
    public void Test4027685() {
        // Should be 01/16/97 00:00:00
        Date nite = new Date(Date.parse("16-JAN-97 12:00 AM"));
        // Should be 01/16/97 12:00:00
        Date noon = new Date(Date.parse("16-JAN-97 12:00 PM"));

        System.out.println("Midnight = " + nite + ", Noon = " + noon);
        if (!nite.equals(new Date(97, Calendar.JANUARY, 16, 0, 0, 0)) ||
            !noon.equals(new Date(97, Calendar.JANUARY, 16, 12, 0, 0)))
            fail("Fail: Nite/Noon confused");
    }

    /**
     * @bug 4032037
     */
    @Test
    public void Test4032037() {
        Date ref = new Date(97, 1, 10);
        Date d = new Date(Date.parse("2/10/97"));
        System.out.println("Date.parse(2/10/97) => " + d);
        if (!d.equals(ref)) fail("Fail: Want " + ref + " Got " + d);
        d = new Date(Date.parse("10 feb 1997"));
        System.out.println("Date.parse(10 feb 1997) => " + d);
        if (!d.equals(ref)) fail("Fail: Want " + ref + " Got " + d);
        d = new Date(Date.parse("2/10/97"));
        System.out.println("Date(2/10/97) => " + d);
        if (!d.equals(ref)) fail("Fail: Want " + ref + " Got " + d);
        d = new Date(Date.parse("10 feb 1997"));
        System.out.println("Date(10 feb 1997) => " + d);
        if (!d.equals(ref)) fail("Fail: Want " + ref + " Got " + d);
    }

    /**
     * @bug 4072029
     */
    @Test
    public void Test4072029() {
        TimeZone saveZone = TimeZone.getDefault();

        try {
            TimeZone.setDefault(TimeZone.getTimeZone("America/Los_Angeles"));
            Date now = new Date();
            String s = now.toString();
            Date now2 = new Date(Date.parse(now.toString()));
            String s2 = now2.toString(); // An hour's difference

            if (!s.equals(s2) ||
                Math.abs(now.getTime() - now2.getTime()) > 60000 /*one min*/) {
                fail("Fail: Roundtrip toString/parse");
            }
        }
        finally {
            TimeZone.setDefault(saveZone);
        }
    }

    /**
     * @bug 4073003
     */
    @Test
    public void Test4073003() {
        Date d = new Date(Date.parse("01/02/1984"));
        if (!d.equals(new Date(84, 0, 2)))
            fail("Fail: Want 1/2/1984 Got " + d);
        d = new Date(Date.parse("02/03/2012"));
        if (!d.equals(new Date(112, 1, 3)))
            fail("Fail: Want 2/3/2012 Got " + d);
        d = new Date(Date.parse("03/04/15"));
        if (!d.equals(new Date(115, 2, 4)))
            fail("Fail: Want 3/4/2015 Got " + d);
    }

    /**
     * @bug 4118010
     * Regress bug:
     * Feb. 2000 has 29 days, but Date(2000, 1, 29) returns March 01, 2000
     * NOTE: This turned out to be a user error (passing in 2000 instead
     * of 2000-1900 to the Date constructor).
     */
    @Test
    public void Test4118010() {
        Date d=new java.util.Date(2000-1900, Calendar.FEBRUARY, 29);
        int m=d.getMonth();
        int date=d.getDate();
        if (m != Calendar.FEBRUARY ||
            date != 29)
            fail("Fail: Want Feb 29, got " + d);
    }

    /**
     * @bug 4120606
     * Date objects share state after cloning.
     */
    @Test
    public void Test4120606() throws ReflectiveOperationException {
        Date d = new Date(98, Calendar.MAY, 24);
        d.getMonth(); // Populate the calendar before cloning.
        Date e = (Date)d.clone();
        // The retired field setters no longer expose a shared mutable calendar.
        // Keep the original cache-alias regression check before setTime clears it.
        var calendar = Date.class.getDeclaredField("cdate");
        calendar.setAccessible(true);
        Object originalCalendar = calendar.get(d);
        if (originalCalendar == null || originalCalendar == calendar.get(e)) {
            fail("Cloned Date objects share cached calendar state");
        }
        // Retain public clone independence through setTime as well.
        d.setTime(new Date(98, Calendar.FEBRUARY, 24).getTime());
        if (d.getMonth() != Calendar.FEBRUARY) {
            fail("Date mutation after cloning failed");
        }
        if (e.getMonth() != Calendar.MAY) {
            fail("Cloned Date objects share state");
        }
    }

    /**
     * @bug 4133833
     * Date constructor crashes with parameters out of range, when it should
     * normalize.
     */
    @Test
    public void Test4133833() {
        Date date = new java.util.Date(12,15,19);
        Date exp  = new Date(1913-1900, Calendar.APRIL, 19);
        if (!date.equals(exp))
            fail("Fail: Want " + exp +
                                "; got " + date);
    }

    /**
     * @bug 4136916
     * Date.toString() throws exception in 1.2b4-E
     * CANNOT REPRODUCE this bug
     */
    @Test
    public void Test4136916() {
        Date time = new Date();
        System.out.println(time.toString());
    }

    /**
     * @bug 6274757
     * Date getTime and toString interaction for some time values
     */
    @Test
    public void Test6274757() {
        TimeZone savedTz = TimeZone.getDefault();
        try {
            // Use a time zone west of GMT.
            TimeZone.setDefault(TimeZone.getTimeZone("America/Los_Angeles"));
            TimeZone jdkGMT = TimeZone.getTimeZone("GMT");
            Calendar jdkCal = Calendar.getInstance(jdkGMT);
            jdkCal.clear();
            jdkCal.set(1582, Calendar.OCTOBER, 15);
            System.out.println("JDK time: " + jdkCal.getTime().getTime() );
            System.out.println("JDK time (str): " + jdkCal.getTime() );
            System.out.println("Day of month: " + jdkCal.get(Calendar.DAY_OF_MONTH));
            Date co = jdkCal.getTime();
            System.out.println("Change over (Oct 15 1582) = " + co + " (" +
                  co.getTime() + ")");
            long a = jdkCal.getTime().getTime();
            Date c = jdkCal.getTime();
            c.toString();
            long b = c.getTime();

            if (a != b) {
                fail("ERROR: " + a + " != " + b);
            } else {
                System.out.println(a + " = " + b);
            }
        } finally {
            TimeZone.setDefault(savedTz);
        }
    }

    /**
     * @bug 6314387
     * JCK6.0: api/java_util/Date/index.html#misc fails, mustang
     */
    @Test
    public void Test6314387() {
        Date d = new Date(Long.MAX_VALUE);
        int y = d.getYear();
        if (y != 292277094) {
            fail("yesr: got " + y + ", expected 292277094");
        }
        d = new Date(Long.MIN_VALUE);
        y = d.getYear();
        if (y != 292267155) {
            fail("yesr: got " + y + ", expected 292267155");
        }
    }
}

//eof
