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
 * @summary Verify DateFormatSymbols serialization array aliases and clone isolation
 * @run main/othervm DateFormatSymbolsSerializationAliasesTest
 */

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serial;
import java.text.DateFormatSymbols;
import java.util.Arrays;
import java.util.Locale;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;

public class DateFormatSymbolsSerializationAliasesTest {
    private static final String[] NAMES = {
        "eras", "months", "shortMonths", "weekdays", "shortWeekdays", "ampms"
    };

    public static void main(String[] args) throws Exception {
        for (boolean cloneOnWorker : new boolean[] { false, true }) {
            testOutputHooks(false, cloneOnWorker);
            testOutputHooks(true, cloneOnWorker);
        }
        testDeserializedAliases();
        testSubclass();
    }

    // A replacement hook can retain or mutate arrays while they are written.
    // It must not gain access to arrays used by other live symbol instances,
    // their clones, or the locale cache. The same applies to stream aliases.
    private static void testOutputHooks(boolean mutateInHook, boolean cloneOnWorker)
            throws Exception {
        DateFormatSymbols first = symbols();
        DateFormatSymbols peer = symbols();
        DateFormatSymbols clone = (DateFormatSymbols) first.clone();
        String[][] expected = values(first);
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        String[][] retained;
        RetainingStream stream = new RetainingStream(bytes, first, expected,
                mutateInHook, cloneOnWorker);
        try (RetainingStream out = stream) {
            out.writeObject(first);
            out.stopCapturing();
            retained = out.retained;
            for (int i = 0; i < NAMES.length; i++) {
                if (retained[i] == null) {
                    throw new AssertionError("Did not encounter " + NAMES[i]);
                }
            }
            assertValues(first, retained, "source during replacement hook");
            assertValues(peer, expected, "peer during replacement hook");
            assertValues(clone, expected, "clone during replacement hook");
            out.assertHookClone();
            assertValues(symbols(), expected, "locale cache during replacement hook");
            out.writeObject(peer);
            out.writeObject(retained);
        }
        mutate(retained, "retained-");
        assertValues(first, retained, "source after retained-array mutation");
        assertValues(peer, expected, "peer after retained-array mutation");
        assertValues(clone, expected, "clone after retained-array mutation");
        stream.assertHookClone();
        assertValues(symbols(), expected, "locale cache after retained-array mutation");

        try (ObjectInputStream in = input(bytes.toByteArray())) {
            DateFormatSymbols restoredFirst = (DateFormatSymbols) in.readObject();
            DateFormatSymbols restoredPeer = (DateFormatSymbols) in.readObject();
            String[][] exposed = (String[][]) in.readObject();
            assertAliases(restoredFirst, exposed, "stream-");
            assertValues(restoredPeer, expected, "peer in the same stream");
        }
    }

    // Replacement creates a valid graph in which each private symbol array
    // is also externally reachable. Deserialization must retain these aliases,
    // while clone must detach from them. Reserializing must retain them again.
    private static void testDeserializedAliases() throws Exception {
        DateFormatSymbols source = symbols();
        String[][] external = values(source);
        for (int i = 0; i < external.length; i++) {
            for (int j = 0; j < external[i].length; j++) {
                external[i][j] = "symbol-" + i + "-" + j;
            }
        }
        setValues(source, external);
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (ObjectOutputStream out = new ObjectOutputStream(bytes) {
            { enableReplaceObject(true); }

            @Override
            protected Object replaceObject(Object obj) {
                if (obj instanceof String[] array) {
                    for (String[] replacement : external) {
                        if (Arrays.equals(array, replacement)) {
                            return replacement;
                        }
                    }
                }
                return obj;
            }
        }) {
            out.writeObject(source);
            out.writeObject(external);
        }

        DateFormatSymbols restored;
        String[][] exposed;
        try (ObjectInputStream in = input(bytes.toByteArray())) {
            restored = (DateFormatSymbols) in.readObject();
            exposed = (String[][]) in.readObject();
        }
        assertAliases(restored, exposed, "read-");
        DateFormatSymbols clone = (DateFormatSymbols) restored.clone();
        DateFormatSymbols secondClone = (DateFormatSymbols) clone.clone();
        String[][] expected = values(clone);

        bytes.reset();
        try (ObjectOutputStream out = new ObjectOutputStream(bytes)) {
            out.writeObject(restored);
            out.writeObject(exposed);
        }
        mutate(exposed, "original-");
        assertValues(clone, expected, "clone of externally aliased arrays");
        assertValues(secondClone, expected, "second clone of externally aliased arrays");

        try (ObjectInputStream in = input(bytes.toByteArray())) {
            DateFormatSymbols reread = (DateFormatSymbols) in.readObject();
            String[][] reexposed = (String[][]) in.readObject();
            DateFormatSymbols rereadClone = (DateFormatSymbols) reread.clone();
            String[][] rereadExpected = values(rereadClone);
            assertAliases(reread, reexposed, "reread-");
            assertValues(rereadClone, rereadExpected, "clone after reserialization");
        }
    }

    private static void testSubclass() throws Exception {
        TrappingSymbols source = new TrappingSymbols();
        source.setZoneStrings(new String[][] { { "GMT", "GMT", "GMT", "GMT", "GMT" } });
        String[][] expected = source.baseValues();
        TrappingSymbols clone = source.cloneUsingSuper();
        if (!Arrays.deepEquals(clone.baseValues(), expected)) {
            throw new AssertionError("Subclass base fields were not cloned");
        }
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (ObjectOutputStream out = new ObjectOutputStream(bytes)) {
            out.writeObject(source);
        }
        try (ObjectInputStream in = input(bytes.toByteArray())) {
            TrappingSymbols restored = (TrappingSymbols) in.readObject();
            if (!Arrays.deepEquals(restored.baseValues(), expected)) {
                throw new AssertionError("Subclass base fields were not serialized");
            }
        }
    }

    private static DateFormatSymbols symbols() {
        DateFormatSymbols symbols = new DateFormatSymbols(Locale.US);
        symbols.setZoneStrings(new String[][] { { "GMT", "GMT", "GMT", "GMT", "GMT" } });
        return symbols;
    }

    private static ObjectInputStream input(byte[] bytes) throws IOException {
        return new ObjectInputStream(new ByteArrayInputStream(bytes));
    }

    private static String[][] values(DateFormatSymbols symbols) {
        return new String[][] {
            symbols.getEras(), symbols.getMonths(), symbols.getShortMonths(),
            symbols.getWeekdays(), symbols.getShortWeekdays(), symbols.getAmPmStrings()
        };
    }

    private static void setValues(DateFormatSymbols symbols, String[][] values) {
        symbols.setEras(values[0]);
        symbols.setMonths(values[1]);
        symbols.setShortMonths(values[2]);
        symbols.setWeekdays(values[3]);
        symbols.setShortWeekdays(values[4]);
        symbols.setAmPmStrings(values[5]);
    }

    private static void mutate(String[][] arrays, String prefix) {
        for (int i = 0; i < arrays.length; i++) {
            arrays[i][0] = prefix + NAMES[i];
        }
    }

    private static void assertAliases(DateFormatSymbols symbols, String[][] exposed,
                                      String prefix) {
        mutate(exposed, prefix);
        assertValues(symbols, exposed, "externally reachable serialized arrays");
    }

    private static void assertValues(DateFormatSymbols symbols, String[][] expected,
                                     String context) {
        String[][] actual = values(symbols);
        for (int i = 0; i < expected.length; i++) {
            if (!Arrays.equals(actual[i], expected[i])) {
                throw new AssertionError(context + ": " + NAMES[i]
                        + " expected " + Arrays.toString(expected[i])
                        + ", actual " + Arrays.toString(actual[i]));
            }
        }
    }

    private static class RetainingStream extends ObjectOutputStream {
        private final DateFormatSymbols source;
        private final String[][] expected;
        private final boolean mutateInHook;
        private final boolean cloneOnWorker;
        private final String[][] retained = new String[NAMES.length][];
        private boolean capturing = true;
        private DateFormatSymbols hookClone;
        private String[][] hookCloneExpected;

        RetainingStream(ByteArrayOutputStream bytes, DateFormatSymbols source, String[][] expected,
                        boolean mutateInHook, boolean cloneOnWorker) throws IOException {
            super(bytes);
            this.source = source;
            this.expected = expected;
            this.mutateInHook = mutateInHook;
            this.cloneOnWorker = cloneOnWorker;
            enableReplaceObject(true);
        }

        void stopCapturing() {
            capturing = false;
        }

        void assertHookClone() {
            assertValues(hookClone, hookCloneExpected, "clone made inside replacement hook");
        }

        @Override
        protected Object replaceObject(Object obj) throws IOException {
            if (capturing && obj instanceof String[] array) {
                for (int i = 0; i < expected.length; i++) {
                    if (Arrays.equals(array, expected[i])) {
                        if (hookClone == null) {
                            if (cloneOnWorker) {
                                // A callback must be able to wait for another
                                // thread to clone the source: writeObject must
                                // release the source monitor before callbacks.
                                var task = new FutureTask<>(
                                        () -> (DateFormatSymbols) source.clone());
                                Thread.ofPlatform().daemon().start(task);
                                try {
                                    hookClone = task.get(30, TimeUnit.SECONDS);
                                } catch (Exception e) {
                                    throw new IOException("Clone in stream callback", e);
                                }
                            } else {
                                hookClone = (DateFormatSymbols) source.clone();
                            }
                            hookCloneExpected = values(hookClone);
                        }
                        retained[i] = array;
                        if (mutateInHook) {
                            array[0] = "hook-" + NAMES[i];
                        }
                        break;
                    }
                }
            }
            return obj;
        }
    }

    private static class TrappingSymbols extends DateFormatSymbols {
        @Serial
        private static final long serialVersionUID = 1L;

        TrappingSymbols() {
            super(Locale.US);
        }

        TrappingSymbols cloneUsingSuper() {
            return (TrappingSymbols) super.clone();
        }

        String[][] baseValues() {
            return new String[][] {
                super.getEras(), super.getMonths(), super.getShortMonths(),
                super.getWeekdays(), super.getShortWeekdays(), super.getAmPmStrings()
            };
        }

        @Override
        public Object clone() {
            throw new AssertionError("Unexpected virtual clone call");
        }

        @Override
        public String[] getEras() {
            throw new AssertionError("Unexpected virtual getEras call");
        }

        @Override
        public String[] getMonths() {
            throw new AssertionError("Unexpected virtual getMonths call");
        }

        @Override
        public String[] getShortMonths() {
            throw new AssertionError("Unexpected virtual getShortMonths call");
        }

        @Override
        public String[] getWeekdays() {
            throw new AssertionError("Unexpected virtual getWeekdays call");
        }

        @Override
        public String[] getShortWeekdays() {
            throw new AssertionError("Unexpected virtual getShortWeekdays call");
        }

        @Override
        public String[] getAmPmStrings() {
            throw new AssertionError("Unexpected virtual getAmPmStrings call");
        }
    }
}
