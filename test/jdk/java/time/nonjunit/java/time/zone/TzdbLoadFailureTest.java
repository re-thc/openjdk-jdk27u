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
 * @summary Tests how java.time and java.util.TimeZone report that lib/tzdb.dat
 *          is missing or cannot be parsed, at the first and at later attempts
 * @requires jlink.packagedModules
 * @modules jdk.jlink
 * @library /test/lib
 * @run junit TzdbLoadFailureTest
 */

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.ZoneId;
import java.time.zone.ZoneRulesException;
import java.time.zone.ZoneRulesProvider;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.TimeZone;
import java.util.spi.ToolProvider;

import jdk.test.lib.Utils;
import jdk.test.lib.process.ProcessTools;
import jdk.test.lib.util.FileUtils;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.EnumSource;

public class TzdbLoadFailureTest {

    private static final String ZRE = "ZoneRulesException[Unable to load TZDB time-zone rules]";
    // What the use of a class fails with once its initialization has failed
    private static final String AGAIN = "NoClassDefFoundError";

    private static Path image;
    private static Path tzdb;
    private static byte[] original;

    private enum Damage {
        MISSING("FileNotFoundException"),
        TRUNCATED("EOFException"),
        BAD_FORMAT("StreamCorruptedException"),
        NEGATIVE_COUNT("NegativeArraySizeException");

        final String cause;

        Damage(String cause) {
            this.cause = cause;
        }

        // The initialization of ZoneRulesProvider, which java.time needs, fails.
        String zoneRulesProviderFailure() {
            return "ExceptionInInitializerError <- " + ZRE + " <- " + cause;
        }

        // The initialization of ZoneInfoFile, which java.util.TimeZone needs, fails.
        String zoneInfoFileFailure() {
            return "Error <- " + cause;
        }
    }

    @BeforeAll
    static void createImage() throws IOException {
        image = Path.of("image");
        ToolProvider jlink = ToolProvider.findFirst("jlink").orElseThrow();
        int rc = jlink.run(System.out, System.err,
                "--add-modules", "java.base", "--output", image.toString());
        assertEquals(0, rc, "jlink failed");
        tzdb = image.resolve("lib", "tzdb.dat");
        original = Files.readAllBytes(tzdb);
    }

    @AfterAll
    static void deleteImage() throws IOException {
        if (Files.exists(image)) {
            FileUtils.deleteFileTreeWithRetry(image);
        }
    }

    private static void damageTzdb(Damage damage) throws IOException {
        switch (damage) {
            case MISSING -> Files.deleteIfExists(tzdb);
            case TRUNCATED -> Files.write(tzdb, Arrays.copyOf(original, original.length / 2));
            case BAD_FORMAT -> {
                byte[] bytes = original.clone();
                bytes[0] = 0;
                Files.write(tzdb, bytes);
            }
            case NEGATIVE_COUNT -> {
                ByteArrayOutputStream bytes = new ByteArrayOutputStream();
                try (DataOutputStream out = new DataOutputStream(bytes)) {
                    out.writeByte(1);
                    out.writeUTF("TZDB");
                    out.writeShort(1);
                    out.writeUTF("2026a");
                    out.writeShort(-1);
                }
                Files.write(tzdb, bytes.toByteArray());
            }
        }
    }

    /**
     * Runs the operations in a new JVM of the image, in this order.
     * Returns the outcome of each operation.
     */
    private static List<String> run(String... ops) throws Exception {
        List<String> command = new ArrayList<>();
        command.add(image.resolve("bin", "java").toString());
        command.addAll(Arrays.asList(Utils.prependTestJavaOpts(
                "-cp", System.getProperty("test.classes"),
                Child.class.getName())));
        command.addAll(Arrays.asList(ops));
        List<String> outcomes = ProcessTools.executeProcess(new ProcessBuilder(command))
                .outputTo(System.out)
                .errorTo(System.err)
                .shouldHaveExitValue(0)
                .stdoutAsLines().stream()
                .filter(line -> line.startsWith("RESULT "))
                .map(line -> line.substring("RESULT ".length()))
                .toList();
        assertEquals(ops.length, outcomes.size());
        return outcomes;
    }

    // java.time is the first to need tzdb.dat. Its time-zone rules provider
    // fails to initialize with the exception it has always failed with.
    @ParameterizedTest
    @EnumSource(Damage.class)
    void javaTimeFirst(Damage damage) throws Exception {
        damageTzdb(damage);
        List<String> outcomes = run("zid", "ids", "tz", "tzdef");
        assertEquals("zid: " + damage.zoneRulesProviderFailure(), outcomes.get(0));
        assertEquals("ids: " + AGAIN, outcomes.get(1));
        // java.util.TimeZone fails too, as the provider shares its data.
        assertTrue(outcomes.get(2).matches("tz: (Error|NoClassDefFoundError).*"), outcomes.get(2));
        assertTrue(outcomes.get(3).matches("tzdef: (Error|NoClassDefFoundError).*"), outcomes.get(3));
    }

    // java.util.TimeZone is the first to need tzdb.dat. The provider of
    // java.time still fails with the original exception as the cause.
    @ParameterizedTest
    @EnumSource(Damage.class)
    void timeZoneFirst(Damage damage) throws Exception {
        damageTzdb(damage);
        assertEquals(List.of(
                "tz: " + damage.zoneInfoFileFailure(),
                "tzdef: " + AGAIN,
                "zid: " + damage.zoneRulesProviderFailure(),
                "ids: " + AGAIN),
                run("tz", "tzdef", "zid", "ids"));
    }

    @ParameterizedTest
    @EnumSource(Damage.class)
    void timeZoneOnly(Damage damage) throws Exception {
        damageTzdb(damage);
        assertEquals(List.of(
                "tz: " + damage.zoneInfoFileFailure(),
                "tzdef: " + AGAIN,
                "tz: " + AGAIN),
                run("tz", "tzdef", "tz"));
    }

    /** The operations succeed with the unmodified tzdb.dat. */
    @Test
    void intact() throws Exception {
        Files.write(tzdb, original);
        assertEquals(List.of("zid: ok", "ids: ok", "tz: ok", "tzdef: ok"),
                run("zid", "ids", "tz", "tzdef"));
    }

    /** Runs in the JVM of the image. */
    public static class Child {
        public static void main(String[] args) {
            for (String op : args) {
                String outcome;
                try {
                    perform(op);
                    outcome = "ok";
                } catch (Throwable t) {
                    outcome = describe(t);
                }
                System.out.println("RESULT " + op + ": " + outcome);
            }
        }

        private static void perform(String op) {
            switch (op) {
                case "zid" -> ZoneId.of("Europe/Paris");
                case "ids" -> ZoneRulesProvider.getAvailableZoneIds();
                case "tz" -> TimeZone.getTimeZone("Europe/Paris");
                case "tzdef" -> TimeZone.getDefault();
                default -> throw new IllegalArgumentException(op);
            }
        }

        // The classes of the exception and of its causes, except for the cause
        // of a NoClassDefFoundError, which the VM chooses.
        private static String describe(Throwable t) {
            StringBuilder sb = new StringBuilder();
            for (; t != null; t = t.getCause()) {
                if (!sb.isEmpty()) {
                    sb.append(" <- ");
                }
                sb.append(t.getClass().getSimpleName());
                if (t instanceof ZoneRulesException) {
                    sb.append('[').append(t.getMessage()).append(']');
                }
                if (t instanceof NoClassDefFoundError) {
                    break;
                }
            }
            return sb.toString();
        }
    }
}
