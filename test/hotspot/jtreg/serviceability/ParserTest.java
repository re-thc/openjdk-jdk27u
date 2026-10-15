/*
 * Copyright (c) 2012, 2024, Oracle and/or its affiliates. All rights reserved.
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
 * @summary Test the diagnostic command argument parser, including memory-size overflow
 * @modules java.base/jdk.internal.misc
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI ParserTest
 */

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.parser.DiagnosticCommand;
import jdk.test.whitebox.parser.DiagnosticCommand.DiagnosticArgumentType;
import jdk.test.whitebox.WhiteBox;

public class ParserTest {
    private static final BigInteger MEMORY_SIZE_MAX = BigInteger.ONE.shiftLeft(64).subtract(BigInteger.ONE);
    private static final String MEMORY_SIZE_TOO_LARGE = "Parsing error memory size value: value is too large";
    // Every spelling of the supported units; the empty unit is a plain byte count.
    private static final String[] MEMORY_SIZE_UNITS = {"", "b", "B", "k", "K", "m", "M", "g", "G"};
    // java.util.Random is fully specified, so a fixed seed gives the same cases on every JDK.
    private static final long MEMORY_SIZE_ORACLE_SEED = 0x5EED27L;
    private static final int MEMORY_SIZE_RANDOM_CASES_PER_UNIT = 200;

    WhiteBox wb;

    public ParserTest() throws Exception {
        wb = WhiteBox.getWhiteBox();

        testNanoTime();
        testJLong();
        testBool();
        testQuotes();
        testMemorySize();
        testSingleLetterArg();
        testFileName();
    }

    public static void main(String... args) throws Exception  {
         new ParserTest();
    }

    public void testNanoTime() throws Exception {
        String name = "name";
        DiagnosticCommand arg = new DiagnosticCommand(name,
                "desc", DiagnosticArgumentType.NANOTIME,
                false, "0");
        DiagnosticCommand[] args = {arg};

        BigInteger bi = new BigInteger("7");
        //These should work
        parse(name, bi.toString(), name + "=7ns", args);

        bi = bi.multiply(BigInteger.valueOf(1000));
        parse(name, bi.toString(), name + "=7us", args);

        bi = bi.multiply(BigInteger.valueOf(1000));
        parse(name, bi.toString(), name + "=7ms", args);

        bi = bi.multiply(BigInteger.valueOf(1000));
        parse(name, bi.toString(), name + "=7s", args);

        bi = bi.multiply(BigInteger.valueOf(60));
        parse(name, bi.toString() , name + "=7m", args);

        bi = bi.multiply(BigInteger.valueOf(60));
        parse(name, bi.toString() , name + "=7h", args);

        bi = bi.multiply(BigInteger.valueOf(24));
        parse(name, bi.toString() , name + "=7d", args);

        parse(name, "0", name + "=0", args);

        shouldFail(name + "=7xs", args);
        shouldFail(name + "=7mms", args);
        shouldFail(name + "=7f", args);
        //Currently, only value 0 is allowed without unit
        shouldFail(name + "=7", args);
    }

    public void testJLong() throws Exception {
        String name = "name";
        DiagnosticCommand arg = new DiagnosticCommand(name,
                "desc", DiagnosticArgumentType.JLONG,
                false, "0");
        DiagnosticCommand[] args = {arg};

        wb.parseCommandLine(name + "=10", ',', args);
        parse(name, "10", name + "=10", args);
        parse(name, "-5", name + "=-5", args);

        //shouldFail(name + "=12m", args); <-- should fail, doesn't
    }

    public void testBool() throws Exception {
        String name = "name";
        DiagnosticCommand arg = new DiagnosticCommand(name,
                "desc", DiagnosticArgumentType.BOOLEAN,
                false, "false");
        DiagnosticCommand[] args = {arg};

        parse(name, "true", name + "=true", args);
        parse(name, "false", name + "=false", args);
        parse(name, "true", name, args);

        //Empty commandline to parse, tests default value
        //of the parameter "name"
        parse(name, "false", "", args);
    }

    public void testQuotes() throws Exception {
        String name = "name";
        DiagnosticCommand arg1 = new DiagnosticCommand(name,
                "desc", DiagnosticArgumentType.STRING,
                false, null);
        DiagnosticCommand arg2 = new DiagnosticCommand("arg",
                "desc", DiagnosticArgumentType.STRING,
                false, null);
        DiagnosticCommand[] args = {arg1, arg2};

        // try with a quoted value
        parse(name, "Recording 1", name + "=\"Recording 1\"", args);
        // try with a quoted argument
        parse(name, "myrec", "\"" + name + "\"" + "=myrec", args);
        // try with both a quoted value and a quoted argument
        parse(name, "Recording 1", "\"" + name + "\"" + "=\"Recording 1\"", args);

        // now the same thing but with other arguments after

        // try with a quoted value
        parse(name, "Recording 1", name + "=\"Recording 1\",arg=value", args);
        // try with a quoted argument
        parse(name, "myrec", "\"" + name + "\"" + "=myrec,arg=value", args);
        // try with both a quoted value and a quoted argument
        parse(name, "Recording 1", "\"" + name + "\"" + "=\"Recording 1\",arg=value", args);
    }

    public void testSingleLetterArg() throws Exception {
        DiagnosticCommand[] args = new DiagnosticCommand[]{
            new DiagnosticCommand("flag", "desc", DiagnosticArgumentType.STRING, true, false, null),
            new DiagnosticCommand("value", "desc", DiagnosticArgumentType.STRING, true, false, null)
        };
        parse("flag", "flag", "flag v", ' ', args);
        parse("value", "v", "flag v", ' ', args);
    }

    public void testFileName() throws Exception {
        // --- Testing options
        long pid = ProcessTools.getProcessId();

        // Test pid gets injected into %p
        String name = "name";
        DiagnosticCommand arg = new DiagnosticCommand(name,
                "desc", DiagnosticArgumentType.FILE,
                false, null);
        DiagnosticCommand[] args = {arg};
        parse(name, "file%d.txt".formatted(pid), name + "=file%p.txt", args);

        // Test custom file name with no %p
        parse(name, "myFile.txt", name + "=myFile.txt", args);

        // --- Testing arguments

        // Test pid gets injected into %p
        arg = new DiagnosticCommand(name, "desc", DiagnosticArgumentType.FILE, true,
                false, null);
        args = new DiagnosticCommand[]{arg};
        parse(name, "file%d.txt".formatted(pid), "file%p.txt", args);

        // Test custom file name with no %p
        parse(name, "myFile.txt", "myFile.txt", args);
    }

    public void testMemorySize() throws Exception {
        String name = "name";
        String defaultValue = "1024";
        DiagnosticCommand arg = new DiagnosticCommand(name,
                "desc", DiagnosticArgumentType.MEMORYSIZE,
                false, defaultValue);
        DiagnosticCommand[] args = {arg};

        BigInteger bi = new BigInteger("7");
        parse(name, bi.toString(), name + "=7b", args);

        bi = bi.multiply(BigInteger.valueOf(1024));
        parse(name, bi.toString(), name + "=7k", args);

        bi = bi.multiply(BigInteger.valueOf(1024));
        parse(name, bi.toString(), name + "=7m", args);

        bi = bi.multiply(BigInteger.valueOf(1024));
        parse(name, bi.toString(), name + "=7g", args);
        parse(name, defaultValue, "", args);

        BigInteger max = BigInteger.ONE.shiftLeft(64).subtract(BigInteger.ONE);
        // The parser stores an unsigned size; WhiteBox retains its signed rendering.
        String renderedMax = Long.toString(max.longValue());
        parse(name, renderedMax, name + "=" + max, args);
        parse(name, renderedMax, name + "=" + max + "b", args);
        String[] suffixes = {"kK", "mM", "gG"};
        for (int i = 0; i < suffixes.length; i++) {
            BigInteger multiplier = BigInteger.valueOf(1024).pow(i + 1);
            BigInteger limit = max.divide(multiplier);
            for (char suffix : suffixes[i].toCharArray()) {
                parse(name, "0", name + "=0" + suffix, args);
                parse(name, multiplier.toString(), name + "=1" + suffix, args);
                parse(name, Long.toString(limit.multiply(multiplier).longValue()), name + "=" + limit + suffix, args);
                shouldFail(name + "=" + limit.add(BigInteger.ONE) + suffix, args);
                shouldFail(name + "=" + max + suffix, args);
                shouldFail(name + "=-1" + suffix, args);
            }
        }

        testMemorySizeLimits(name, args);
        testMemorySizeOracle(name, args);

        //shouldFail(name + "=7gg", args); <---- should fail, doesn't
        //shouldFail(name + "=7t", args);  <----- should fail, doesn't
    }

    // The parser accepts any size up to 2^64-1 bytes. Stricter limits belong to the consumers.
    private void testMemorySizeLimits(String name, DiagnosticCommand[] args) throws Exception {
        BigInteger max = MEMORY_SIZE_MAX;
        BigInteger overflow = max.add(BigInteger.ONE);
        String renderedMax = Long.toString(max.longValue());

        // Decimal conversion must be range checked before any unit is applied.
        String[] oversized = {
            overflow.toString(),
            max.add(BigInteger.TWO).toString(),
            max.multiply(BigInteger.TEN).toString(),
            "9".repeat(20),
            "9".repeat(40),
            "1" + "0".repeat(100),
            "0".repeat(30) + overflow,
        };
        for (String unit : MEMORY_SIZE_UNITS) {
            // The largest value that still fits once the unit is applied, and the one after it.
            BigInteger multiplier = unitMultiplier(unit);
            BigInteger limit = max.divide(multiplier);
            parse(name, Long.toString(limit.multiply(multiplier).longValue()), name + "=" + limit + unit, args);
            shouldFailTooLarge(name + "=" + limit.add(BigInteger.ONE) + unit, args);
            for (String value : oversized) {
                shouldFailTooLarge(name + "=" + value + unit, args);
            }
        }

        // Leading zeros and a plus sign are existing syntax and must keep working, however long the string is.
        parse(name, renderedMax, name + "=" + "0".repeat(30) + max, args);
        parse(name, "7", name + "=+7", args);
        parse(name, "7", name + "=007", args);
        parse(name, "7168", name + "=007k", args);
    }

    private void shouldFailTooLarge(String argument, DiagnosticCommand[] argumentTypes) throws Exception {
        try {
            wb.parseCommandLine(argument, ',', argumentTypes);
        } catch (IllegalArgumentException e) {
            if (!e.getMessage().contains(MEMORY_SIZE_TOO_LARGE)) {
                throw new Exception("Wrong error for '" + argument + "': " + e.getMessage(), e);
            }
            return;
        }
        throw new Exception("Parser accepted argument: " + argument);
    }

    private static BigInteger unitMultiplier(String unit) {
        return switch (unit) {
            case "k", "K" -> BigInteger.ONE.shiftLeft(10);
            case "m", "M" -> BigInteger.ONE.shiftLeft(20);
            case "g", "G" -> BigInteger.ONE.shiftLeft(30);
            default -> BigInteger.ONE;
        };
    }

    // One generated input. The expectation comes from BigInteger arithmetic, not from the parser's own logic.
    private record MemorySizeCase(String text, BigInteger bytes) {
        boolean representable() {
            return bytes.compareTo(MEMORY_SIZE_MAX) <= 0;
        }

        // WhiteBox renders the unsigned size through a signed 64-bit conversion.
        String rendered() {
            return Long.toString(bytes.longValue());
        }
    }

    private record MemorySizeCases(List<MemorySizeCase> unique, int generated) { }

    // Deterministic for a given seed: boundary values for every unit plus seeded pseudo-random values.
    // Inputs that are generated more than once are kept once.
    private static MemorySizeCases memorySizeCases(long seed) {
        Random random = new Random(seed);
        BigInteger twoTo63 = BigInteger.ONE.shiftLeft(63);
        Set<String> seen = new LinkedHashSet<>();
        List<MemorySizeCase> cases = new ArrayList<>();
        int generated = 0;
        for (String unit : MEMORY_SIZE_UNITS) {
            BigInteger limit = MEMORY_SIZE_MAX.divide(unitMultiplier(unit));
            List<BigInteger> values = new ArrayList<>();
            for (int delta = -2; delta <= 2; delta++) {
                values.add(limit.add(BigInteger.valueOf(delta)));
            }
            for (int delta = -1; delta <= 2; delta++) {
                values.add(MEMORY_SIZE_MAX.add(BigInteger.valueOf(delta)));
            }
            values.add(BigInteger.ZERO);
            values.add(BigInteger.ONE);
            values.add(twoTo63.subtract(BigInteger.ONE));
            values.add(twoTo63);
            values.add(twoTo63.add(BigInteger.ONE));
            values.add(BigInteger.TEN.pow(19));
            values.add(BigInteger.TEN.pow(20).subtract(BigInteger.ONE));
            values.add(BigInteger.TEN.pow(20));
            values.add(BigInteger.TEN.pow(30));
            List<String> texts = new ArrayList<>();
            for (BigInteger value : values) {
                texts.add(value.toString());
            }
            for (int i = 0; i < MEMORY_SIZE_RANDOM_CASES_PER_UNIT; i++) {
                BigInteger value = switch (random.nextInt(3)) {
                    case 0 -> new BigInteger(1 + random.nextInt(130), random);
                    case 1 -> limit.add(BigInteger.valueOf(random.nextInt(4097) - 2048));
                    default -> MEMORY_SIZE_MAX.add(BigInteger.valueOf(random.nextInt(4097) - 2048));
                };
                value = value.max(BigInteger.ZERO);
                String digits = value.toString();
                if (random.nextInt(8) == 0) {
                    digits = "0".repeat(1 + random.nextInt(25)) + digits;
                }
                values.add(value);
                texts.add(digits);
            }
            for (int i = 0; i < values.size(); i++) {
                generated++;
                String text = texts.get(i) + unit;
                if (seen.add(text)) {
                    cases.add(new MemorySizeCase(text, values.get(i).multiply(unitMultiplier(unit))));
                }
            }
        }
        return new MemorySizeCases(cases, generated);
    }

    private void testMemorySizeOracle(String name, DiagnosticCommand[] args) throws Exception {
        MemorySizeCases generated = memorySizeCases(MEMORY_SIZE_ORACLE_SEED);
        // The same seed must give the same cases.
        if (!generated.equals(memorySizeCases(MEMORY_SIZE_ORACLE_SEED))) {
            throw new Exception("Memory size case generation is not deterministic");
        }
        List<MemorySizeCase> cases = generated.unique();
        List<String> mismatches = new ArrayList<>();
        int representable = 0;
        for (MemorySizeCase c : cases) {
            String cmdLine = name + "=" + c.text();
            String problem = null;
            representable += c.representable() ? 1 : 0;
            try {
                Object[] res = wb.parseCommandLine(cmdLine, ',', args);
                String actual = (String) res[1];
                if (!c.representable()) {
                    problem = "accepted as " + actual + " but " + c.bytes() + " bytes exceeds 2^64-1";
                } else if (!actual.equals(c.rendered())) {
                    problem = "parsed as " + actual + ", expected " + c.rendered();
                }
            } catch (IllegalArgumentException e) {
                if (c.representable()) {
                    problem = "rejected (" + e.getMessage().trim() + ") but " + c.bytes() + " bytes is representable";
                } else if (!e.getMessage().contains(MEMORY_SIZE_TOO_LARGE)) {
                    problem = "rejected with the wrong error: " + e.getMessage().trim();
                }
            }
            if (problem != null) {
                mismatches.add(cmdLine + ": " + problem);
            }
        }
        System.out.printf("Memory size oracle: seed=0x%X generated=%d unique=%d representable=%d oversized=%d mismatches=%d%n",
                          MEMORY_SIZE_ORACLE_SEED, generated.generated(), cases.size(), representable,
                          cases.size() - representable, mismatches.size());
        if (!mismatches.isEmpty()) {
            mismatches.stream().limit(10).forEach(System.out::println);
            throw new Exception(mismatches.size() + " of " + cases.size() + " memory size cases mismatched; seed=0x"
                                + Long.toHexString(MEMORY_SIZE_ORACLE_SEED));
        }
    }

    public void parse(String searchName, String expectedValue,
            String cmdLine, DiagnosticCommand[] argumentTypes) throws Exception {
        parse(searchName, expectedValue, cmdLine, ',', argumentTypes);
    }
    public void parse(String searchName, String expectedValue,
            String cmdLine, char delim, DiagnosticCommand[] argumentTypes) throws Exception {
        //parseCommandLine will return an object array that looks like
        //{<name of parsed object>, <of parsed object> ... }
        Object[] res = wb.parseCommandLine(cmdLine, delim, argumentTypes);
        for (int i = 0; i < res.length-1; i+=2) {
            String parsedName = (String) res[i];
            if (searchName.equals(parsedName)) {
                String parsedValue = (String) res[i+1];
                if (expectedValue.equals(parsedValue)) {
                    return;
                } else {
                    throw new Exception("Parsing of cmdline '" + cmdLine + "' failed!\n"
                            + searchName + " parsed as " + parsedValue
                            + "! Expected: " + expectedValue);
                }
            }
        }
        throw new Exception(searchName + " not found as a parsed Argument!");
    }

    private void shouldFail(String argument, DiagnosticCommand[] argumentTypes) throws Exception {
        shouldFail(argument, ',', argumentTypes);
    }
    private void shouldFail(String argument, char delim, DiagnosticCommand[] argumentTypes) throws Exception {
        try {
            wb.parseCommandLine(argument, delim, argumentTypes);
            throw new Exception("Parser accepted argument: " + argument);
        } catch (IllegalArgumentException e) {
            //expected
        }
    }
}
