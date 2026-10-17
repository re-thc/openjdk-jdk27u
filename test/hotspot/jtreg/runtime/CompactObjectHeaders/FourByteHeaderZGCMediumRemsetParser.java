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
 * @summary Validate medium relocation evidence parsing with synthetic inputs
 * @library /test/lib
 * @modules java.base/jdk.internal.misc
 * @build jdk.test.whitebox.WhiteBox FourByteHeaderZGCMediumRemset
 * @run driver/timeout=60 FourByteHeaderZGCMediumRemsetParser
 */

import java.io.OutputStream;
import java.io.PrintStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jdk.test.lib.json.JSONValue;

public class FourByteHeaderZGCMediumRemsetParser {
    private record Input(String text, boolean inPlace) {}
    private static int checked;
    private static int accepted;
    private static int rejected;

    public static void main(String[] args) throws Exception {
        checked = accepted = rejected = 0;
        require(args.length <= 1, "Expected at most one fixture-directory argument");
        String testSource = System.getProperty("test.src");
        require(args.length == 1 || testSource != null,
                "Set test.src or supply the fixture directory");
        Path directory = (args.length == 1 ? Path.of(args[0])
                : Path.of(testSource, "fourByteHeaderZGCMediumRemset"))
                .toAbsolutePath().normalize();
        JSONValue manifest = JSONValue.parse(
                Files.readString(directory.resolve("mutations.json")));
        require(manifest.get("format").asInt() == 1, "Unknown mutation format");
        Map<String, Input> bases = new HashMap<>();
        for (JSONValue base : manifest.get("base_files").elements()) {
            String name = base.get("id").asString();
            Path file = directory.resolve(base.get("file").asString()).normalize();
            require(file.startsWith(directory), "Base path escapes fixture directory");
            Input input = new Input(Files.readString(file), base.get("in_place").asBoolean());
            require(bases.put(name, input) == null, "Duplicate base " + name);
            verify("base/" + name, input, base.get("expected").asString());
        }
        for (JSONValue mutation : manifest.get("mutations").elements()) {
            String name = mutation.get("name").asString();
            for (JSONValue base : mutation.get("bases").elements()) {
                String baseName = base.asString();
                Input original = bases.get(baseName);
                require(original != null, "Unknown base " + baseName);
                String text = original.text;
                for (JSONValue operation : mutation.get("operations").elements()) {
                    text = edit(text, operation);
                }
                verify(name + "/" + baseName, new Input(text, original.inPlace),
                        mutation.get("expected").asString());
            }
        }
        require(checked == 97 && accepted == 4 && rejected == 93,
                "Offline packet cardinality changed: " + checked + "/" + accepted + "/" + rejected);
        System.out.println("OFFLINE SUMMARY cases=" + checked
                + " accepted=" + accepted + " rejected=" + rejected);
    }

    private static void verify(String name, Input input, String expected) throws Exception {
        require(expected.equals("accept") || expected.equals("reject"),
                "Unknown expected result");
        require(input.text.endsWith("\n") && !input.text.contains("\r"),
                "Input must use LF endings with a final LF");

        // Suppress the oracle's correlation output for synthetic inputs.
        AssertionError failure = null;
        PrintStream previous = System.out;
        try (PrintStream sink = new PrintStream(OutputStream.nullOutputStream(), true,
                                               StandardCharsets.UTF_8)) {
            System.setOut(sink);
            try {
                FourByteHeaderZGCMediumRemset.Oracle.check(input.text, input.inPlace);
            } catch (AssertionError error) {
                failure = error;
            } finally {
                System.setOut(previous);
            }
        }
        boolean wantedAcceptance = expected.equals("accept");
        if (wantedAcceptance != (failure == null)) {
            throw new AssertionError("OFFLINE mismatch " + name + ": expected " + expected,
                    failure);
        }
        checked++;
        if (wantedAcceptance) {
            accepted++;
        } else {
            rejected++;
        }
        System.out.println("OFFLINE PASS " + name + " expected=" + expected);
    }

    private static String edit(String text, JSONValue operation) {
        String kind = operation.get("op").asString();
        if (kind.equals("regex_replace")) {
            Matcher matcher = Pattern.compile(operation.get("pattern").asString()).matcher(text);
            String replacement = operation.get("replacement").asString();
            StringBuilder result = new StringBuilder();
            int matches = 0;
            while (matcher.find()) {
                matcher.appendReplacement(result, replacement);
                matches++;
            }
            matcher.appendTail(result);
            require(matches == operation.get("matches").asInt(),
                    "Mutation edit-target count changed");
            return result.toString();
        }

        String target = null;
        if (kind.equals("move_regex_line_after")) {
            Pattern pattern = Pattern.compile(operation.get("pattern").asString());
            for (String line : text.lines().toList()) {
                if (pattern.matcher(line).matches()) {
                    require(target == null, "Ambiguous regex line to move");
                    target = line;
                }
            }
            require(target != null, "Missing regex line to move");
            kind = "move_line_after";
        } else if (kind.equals("remove_line") || kind.equals("move_line_after")
                || kind.equals("move_line_before")) {
            target = operation.get("line").asString();
        }
        if (target != null) {
            int at = uniqueLine(text, target);
            text = text.substring(0, at) + text.substring(at + target.length() + 1);
            if (kind.equals("remove_line")) {
                return text;
            }
        }

        String anchor = operation.get("anchor").asString();
        int at = uniqueLine(text, anchor);
        if (kind.equals("move_line_before")) {
            return text.substring(0, at) + target + "\n" + text.substring(at);
        }
        int after = at + anchor.length() + 1;
        if (kind.equals("move_line_after")) {
            return text.substring(0, after) + target + "\n" + text.substring(after);
        }
        require(kind.equals("insert_after_line"), "Unknown edit operation " + kind);
        return text.substring(0, after) + operation.get("text").asString()
                + text.substring(after);
    }

    private static int uniqueLine(String text, String line) {
        String needle = line + "\n";
        int at = text.indexOf(needle);
        require(at >= 0 && (at == 0 || text.charAt(at - 1) == '\n')
                        && text.indexOf(needle, at + 1) == -1,
                "Missing or ambiguous exact edit line");
        return at;
    }

    private static void require(boolean condition, String message) {
        if (!condition) {
            throw new AssertionError(message);
        }
    }
}
