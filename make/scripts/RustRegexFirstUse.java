/*
 * Copyright (c) 2026, re-thc. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** One fresh-process public find plus its separately reported observations. */
public class RustRegexFirstUse {
    private static String quoted(String value) {
        if (value == null) return "null";
        StringBuilder out = new StringBuilder("\"");
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (c == '\\' || c == '"') out.append('\\').append(c);
            else if (c < 0x20) out.append(String.format("\\u%04x", (int) c));
            else out.append(c);
        }
        return out.append('"').toString();
    }

    public static void main(String[] args) {
        if (args.length != 3) throw new IllegalArgumentException("shape length position");
        String shape = args[0], position = args[2];
        int length = Integer.parseInt(args[1]);
        boolean validShape = switch (shape) {
            case "prefix", "uncaptured", "ssn", "digits", "email", "unsupported",
                 "word", "space", "dot", "backref", "alternation", "unicode" -> true;
            default -> false;
        };
        boolean validPosition = switch (position) {
            case "miss", "early", "late", "full" -> true;
            default -> false;
        };
        if (!validShape || !validPosition || length < 0)
            throw new IllegalArgumentException("invalid first-use fixture");
        String expression = switch (shape) {
            case "uncaptured" -> "error[0-9]+";
            case "ssn" -> "[0-9]{3}-[0-9]{2}-[0-9]{4}";
            case "digits" -> "([0-9]+)";
            case "email" -> "(?<user>[a-z0-9_]+)@(?<domain>[a-z0-9_]+)\\.[a-z]{2,4}";
            case "unsupported" -> "(?=error)(error)([0-9]+)";
            case "word" -> "(?=error)error[a-z]+";
            case "space" -> "(?=error)error\\s+";
            case "dot" -> "(?=error)error.+";
            case "backref" -> "(?=error)error([0-9])\\1+";
            case "alternation" -> "(?<level>error|warning|fatal)([0-9]+)";
            default -> "(error)([0-9]+)";
        };
        String candidate = switch (shape) {
            case "ssn" -> "123-45-6789";
            case "email" -> "a@b.co";
            case "digits" -> "123";
            case "word" -> "erroraaa";
            case "space" -> "error   ";
            default -> "error333";
        };
        String padding = (shape.equals("unicode") ? "\u0100" : "!").repeat(length);
        String input = switch (position) {
            case "early" -> candidate + padding.substring(candidate.length());
            case "late" -> padding.substring(candidate.length()) + candidate;
            case "full" -> switch (shape) {
                case "unicode" -> "\u0100error" + "3".repeat(length - 6);
                case "ssn" -> candidate;
                case "digits" -> "3".repeat(length);
                case "email" -> "a".repeat(length - 5) + "@b.co";
                case "word" -> "error" + "a".repeat(length - 5);
                case "space" -> "error" + " ".repeat(length - 5);
                default -> "error" + "3".repeat(length - 5);
            };
            default -> padding;
        };
        if (input.length() != length) throw new IllegalArgumentException("fixture does not fit requested length");
        long started = System.nanoTime();
        Pattern pattern = Pattern.compile(expression);
        long prepared = System.nanoTime();
        Matcher matcher = pattern.matcher(input);
        long allocated = System.nanoTime();
        boolean found = matcher.find();
        long matched = System.nanoTime();
        int count = found ? matcher.groupCount() + 1 : 0;
        int[] starts = new int[count], ends = new int[count];
        String[] values = new String[count];
        long checksum = found ? 1 : 0;
        for (int group = 0; group < count; group++) {
            starts[group] = matcher.start(group);
            ends[group] = matcher.end(group);
            values[group] = matcher.group(group);
            checksum = 31 * checksum + starts[group] + ends[group];
        }
        long captured = System.nanoTime();
        boolean hitEnd = matcher.hitEnd(), requireEnd = matcher.requireEnd();
        long complete = System.nanoTime();
        if (found == position.equals("miss")) throw new AssertionError("scenario");
        StringBuilder captures = new StringBuilder("[");
        for (int group = 0; group < count; group++) {
            if (group != 0) captures.append(',');
            captures.append("{\"start\":").append(starts[group]).append(",\"end\":")
                    .append(ends[group]).append(",\"value\":").append(quoted(values[group])).append('}');
        }
        captures.append(']');
        StringBuilder names = new StringBuilder("{");
        for (var entry : pattern.namedGroups().entrySet()) {
            if (names.length() > 1) names.append(',');
            names.append(quoted(entry.getKey())).append(':').append(entry.getValue());
        }
        names.append('}');
        System.out.printf("{\"prepareNs\":%d,\"matcherNs\":%d,\"matchNs\":%d,"
                + "\"captureNs\":%d,\"endFlagsNs\":%d,\"observeNs\":%d,\"firstUseNs\":%d,"
                + "\"found\":%s,\"checksum\":%d,\"hitEnd\":%s,\"requireEnd\":%s,"
                + "\"captures\":%s,\"namedGroups\":%s}%n",
                prepared - started, allocated - prepared, matched - allocated,
                captured - matched, complete - captured, complete - matched, complete - started,
                found, checksum, hitEnd, requireEnd, captures, names);
    }
}
