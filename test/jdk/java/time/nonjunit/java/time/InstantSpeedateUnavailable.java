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
 * @summary Permanent Instant backend load failure bypasses guards; transient loading does not disable it
 * @modules java.base/java.time:open java.base/jdk.internal.loader:open
 * @run main/othervm -Djdk.time.instantSpeedate=true -XX:+CompactStrings InstantSpeedateUnavailable
 * @run main/othervm -Djdk.time.instantSpeedate=true -XX:-CompactStrings InstantSpeedateUnavailable
 */

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.Instant;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Arrays;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicInteger;

public class InstantSpeedateUnavailable {
    private static final String VALID = "1970-01-01T00:00:00Z";

    private record Failure(Class<?> type, String message, String parsed, int index) {}

    private static Object outcome(String text, boolean original) {
        try {
            return original ? DateTimeFormatter.ISO_INSTANT.parse(text, Instant::from) : Instant.parse(text);
        } catch (DateTimeParseException ex) {
            return new Failure(ex.getClass(), ex.getMessage(), ex.getParsedString(), ex.getErrorIndex());
        } catch (RuntimeException ex) {
            return new Failure(ex.getClass(), ex.getMessage(), null, -1);
        }
    }

    private static Object invoke(Method method, String text) throws Exception {
        try {
            return method.invoke(null, text);
        } catch (InvocationTargetException ex) {
            if (ex.getCause() instanceof RuntimeException cause) throw cause;
            if (ex.getCause() instanceof Error cause) throw cause;
            throw ex;
        }
    }

    public static void main(String[] args) throws Exception {
        // Initialize formatter and file-system support before temporarily
        // replacing the bootstrap native search paths in this isolated VM.
        if (!Instant.EPOCH.equals(outcome(VALID, true))) throw new AssertionError();
        Path empty = Files.createTempDirectory("instant-no-native-");
        Class<?> parser = Class.forName("java.time.InstantParser");
        Method fast = parser.getDeclaredMethod("tryParse", String.class);
        Method parse = parser.getDeclaredMethod("parse", String.class);
        var failed = parser.getDeclaredField("failed");
        fast.setAccessible(true);
        parse.setAccessible(true);
        failed.setAccessible(true);
        Class<?> library = Class.forName("java.time.InstantParser$Library");
        var stateField = library.getDeclaredField("STATE");
        stateField.setAccessible(true);
        AtomicInteger state = (AtomicInteger)stateField.get(null);
        if (state.get() != 0 || failed.getBoolean(null)) throw new AssertionError("Backend was already used");

        // A LOADING observer falls back without publishing permanent failure.
        state.set(1);
        if (invoke(fast, VALID) != null || !Instant.EPOCH.equals(invoke(parse, VALID))
                || state.get() != 1 || failed.getBoolean(null)) {
            throw new AssertionError("Transient loading disabled the backend");
        }
        state.set(0);

        Class<?> pathsClass = Class.forName("jdk.internal.loader.NativeLibraries$LibraryPaths");
        var pathsField = pathsClass.getDeclaredField("SYS_PATHS");
        pathsField.setAccessible(true);
        String[] paths = (String[])pathsField.get(null);
        String[] saved = paths.clone();
        Arrays.fill(paths, empty.toAbsolutePath().toString());
        try {
            // This is a real winning load attempt against an empty directory,
            // rather than injecting an UNAVAILABLE state or failure flag.
            if (!Instant.EPOCH.equals(invoke(parse, VALID))) throw new AssertionError("Fallback value");
            if (state.get() != 3 || !failed.getBoolean(null)) {
                throw new AssertionError("Permanent load failure was not published");
            }
            // Null would fail eligibility; the sticky failure must bypass it.
            if (invoke(fast, null) != null) throw new AssertionError("Failed backend accepted input");
            for (String text : new String[] {VALID, "1969-12-31T23:59:59.000001Z",
                    "1900-02-29T00:00:00Z", "2000-04-31T00:00:00.1Z", "garbage", "",
                    "2000-01-01T00:00:00.123456789Z", "2016-12-31T23:59:60.5Z",
                    "2000-01-01T24:00:00Z", "2000-01-01t00:00:00z", null}) {
                if (!Objects.equals(outcome(text, true), outcome(text, false))) {
                    throw new AssertionError("Original formatter mismatch: " + text);
                }
            }
        } finally {
            System.arraycopy(saved, 0, paths, 0, paths.length);
            Files.delete(empty);
        }
    }
}
