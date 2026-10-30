/*
 * Copyright (c) 2015, Oracle and/or its affiliates. All rights reserved.
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

/**
 * @test
 * @bug 8072645
 * @summary Test current LogRecord serialization retains nanosecond timestamps
 * @run main/othervm SerializeLogRecord
 * @author danielfuchs
 */

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.time.Instant;
import java.util.Locale;
import java.util.TimeZone;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.LogRecord;
import java.util.logging.SimpleFormatter;

public class SerializeLogRecord {
    public static void main(String[] args) throws Exception {
        Locale.setDefault(Locale.ENGLISH);
        TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
        System.setProperty("java.util.logging.SimpleFormatter.format",
                "%1$tb %1$td, %1$tY %1$tl:%1$tM:%1$tS.%1$tN %1$Tp %2$s - %4$s: %5$s%6$s");
        for (int nanos : new int[] {0, 192_000_000, 192_939_123}) {
            LogRecord record = new LogRecord(Level.INFO, "Java Version: {0}");
            record.setLoggerName("test");
            record.setParameters(new Object[] {System.getProperty("java.version")});
            record.setInstant(Instant.ofEpochSecond(1_424_175_643L, nanos));
            roundTrip(record);
        }
    }

    private static void roundTrip(LogRecord record) throws Exception {
        SimpleFormatter formatter = new SimpleFormatter();
        String expected = formatter.format(record);
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (ObjectOutputStream out = new ObjectOutputStream(bytes)) {
            out.writeObject(record);
        }
        byte[] binary = bytes.toByteArray();
        byte[] base64 = Base64.getDecoder().decode(Base64.getEncoder().encodeToString(binary));
        for (byte[] payload : new byte[][] {binary, base64}) {
            LogRecord restored;
            try (ObjectInputStream in = new ObjectInputStream(
                    new ByteArrayInputStream(payload))) {
                restored = (LogRecord) in.readObject();
            }
            if (!record.getInstant().equals(restored.getInstant())) {
                throw new RuntimeException("Timestamp precision changed during serialization");
            }
            String actual = formatter.format(restored);
            if (!expected.equals(actual)) {
                throw new RuntimeException("Unexpected serialized log record:\nExpected: "
                        + expected + "\nActual: " + actual);
            }
        }
    }
}
