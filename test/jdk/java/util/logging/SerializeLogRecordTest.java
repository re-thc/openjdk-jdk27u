/*
 * Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.
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
 * @bug 8245302
 * @summary Test current LogRecord roundtrips with int and long thread IDs
 * @run main/othervm SerializeLogRecordTest
 */

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.ObjectStreamClass;
import java.time.Instant;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.LogRecord;
import java.util.logging.XMLFormatter;

public class SerializeLogRecordTest {
    public static void main(String[] args) throws Exception {
        LogRecord record = record("test");
        record.setThreadID(Integer.MAX_VALUE - 10);
        roundTrip(record);

        record = record("test1");
        record.setThreadID(Integer.MAX_VALUE / 2 - 20);
        roundTrip(record);

        record = record("test2");
        record.setLongThreadID(Integer.MAX_VALUE + 10L);
        roundTrip(record);
        testLegacyFieldDefaults();
    }

    private static void testLegacyFieldDefaults() throws Exception {
        LogRecord record = record("field defaults");
        record.setThreadID(1234);
        record.setInstant(Instant.ofEpochSecond(1_424_175_643L, 192_939_123));
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (ObjectOutputStream out = new ObjectOutputStream(bytes)) {
            out.writeObject(record);
        }
        // Model the GetField defaults for forms predating longThreadID and nanos.
        for (boolean defaultNanos : new boolean[] {false, true}) {
            try (ObjectInputStream in = new ObjectInputStream(
                    new ByteArrayInputStream(bytes.toByteArray())) {
                @Override
                public GetField readFields() throws IOException, ClassNotFoundException {
                    GetField fields = super.readFields();
                    if (fields.getObjectStreamClass().forClass() != LogRecord.class) {
                        return fields;
                    }
                    return new GetField() {
                        public ObjectStreamClass getObjectStreamClass() {
                            return fields.getObjectStreamClass();
                        }
                        public boolean defaulted(String name) throws IOException {
                            return name.equals("longThreadID")
                                    || defaultNanos && name.equals("nanoAdjustment")
                                    || fields.defaulted(name);
                        }
                        public long get(String name, long value) throws IOException {
                            return name.equals("longThreadID") ? value : fields.get(name, value);
                        }
                        public int get(String name, int value) throws IOException {
                            return defaultNanos && name.equals("nanoAdjustment")
                                    ? value : fields.get(name, value);
                        }
                        public boolean get(String name, boolean value) throws IOException {
                            return fields.get(name, value);
                        }
                        public byte get(String name, byte value) throws IOException {
                            return fields.get(name, value);
                        }
                        public char get(String name, char value) throws IOException {
                            return fields.get(name, value);
                        }
                        public short get(String name, short value) throws IOException {
                            return fields.get(name, value);
                        }
                        public float get(String name, float value) throws IOException {
                            return fields.get(name, value);
                        }
                        public double get(String name, double value) throws IOException {
                            return fields.get(name, value);
                        }
                        public Object get(String name, Object value)
                                throws IOException, ClassNotFoundException {
                            return fields.get(name, value);
                        }
                    };
                }
            }) {
                LogRecord restored = (LogRecord) in.readObject();
                Instant expected = defaultNanos
                        ? Instant.ofEpochMilli(record.getMillis()) : record.getInstant();
                if (restored.getThreadID() != 1234 || restored.getLongThreadID() != 1234
                        || !expected.equals(restored.getInstant())) {
                    throw new RuntimeException("Incorrect legacy log field defaults");
                }
            }
        }
    }

    private static LogRecord record(String name) {
        LogRecord record = new LogRecord(Level.INFO, "Java Version: {0}");
        record.setLoggerName(name);
        record.setParameters(new Object[] {System.getProperty("java.version")});
        return record;
    }

    private static void roundTrip(LogRecord record) throws Exception {
        XMLFormatter formatter = new XMLFormatter();
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
            if (record.getThreadID() != restored.getThreadID()
                    || record.getLongThreadID() != restored.getLongThreadID()) {
                throw new RuntimeException("Thread IDs changed during serialization");
            }
            String actual = formatter.format(restored);
            if (!expected.equals(actual)
                    || !actual.contains("<thread>" + restored.getLongThreadID() + "</thread>")) {
                throw new RuntimeException("Unexpected serialized log record:\nExpected: "
                        + expected + "\nActual: " + actual);
            }
        }
    }
}
