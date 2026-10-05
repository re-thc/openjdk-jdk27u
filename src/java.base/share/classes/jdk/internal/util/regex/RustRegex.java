/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
package jdk.internal.util.regex;

import java.lang.ref.Reference;
import java.lang.ref.WeakReference;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.regex.Pattern;
import jdk.internal.access.SharedSecrets;
import jdk.internal.ref.CleanerFactory;
import jdk.internal.vm.annotation.IntrinsicCandidate;

/** Native primary engine for a parsed common subset of Java regex syntax. */
public final class RustRegex {
    public static final boolean ENABLED;
    public static final int MAX_LENGTH = 65536;
    public final int groupCount;
    public final Map<String, Integer> namedGroups;
    private final long handle;
    private final boolean contextSensitive;
    private final boolean finalTerminatorSensitive;

    static {
        registerNatives();
        ENABLED = enabled0();
    }

    private RustRegex(long handle, Subset subset) {
        this.handle = handle;
        groupCount = subset.groups;
        namedGroups = Map.copyOf(subset.names);
        contextSensitive = subset.contextSensitive;
        finalTerminatorSensitive = subset.finalTerminatorSensitive;
        try {
            CleanerFactory.cleaner().register(this, new Releaser(handle));
        } catch (Throwable t) {
            free0(handle);
            throw t;
        }
    }

    private record Releaser(long handle) implements Runnable {
        public void run() { free0(handle); }
    }

    public static boolean isLatin1(String input) {
        return SharedSecrets.getJavaLangAccess().getLatin1Bytes(input) != null;
    }

    public static RustRegex compile(String pattern, int flags) {
        if (!ENABLED || pattern.length() > 4096 ||
                (flags & ~(Pattern.UNIX_LINES | Pattern.CASE_INSENSITIVE | Pattern.LITERAL | Pattern.DOTALL)) != 0)
            return null;
        CacheKey key = new CacheKey(pattern, flags);
        synchronized (CompiledCache.ENTRIES) {
            CacheEntry cached = CompiledCache.ENTRIES.get(key);
            if (cached != null) {
                if (cached.javaOnly) return null;
                RustRegex engine = cached.engine.get();
                if (engine != null) return engine;
            }
        }
        try {
            Subset subset = new Subset(pattern, flags);
            subset.expression(0);
            if (subset.cursor != subset.source.length() || !subset.complex) {
                cache(key, new CacheEntry(true, null));
                return null;
            }
            long handle = compile0(subset.output.toString().getBytes(StandardCharsets.US_ASCII), flags, subset.groups);
            if (handle == 0) return null; // Budget failures must remain retryable for new Patterns.
            RustRegex engine = new RustRegex(handle, subset);
            cache(key, new CacheEntry(false, new WeakReference<>(engine)));
            return engine;
        } catch (UnsupportedSyntax e) {
            cache(key, new CacheEntry(true, null));
            return null;
        }
    }

    private record CacheKey(String pattern, int flags) { }
    private record CacheEntry(boolean javaOnly, WeakReference<RustRegex> engine) { }
    private static final class CompiledCache {
        static final Map<CacheKey, CacheEntry> ENTRIES = new LinkedHashMap<>(32, 0.75f, true);
    }
    private static void cache(CacheKey key, CacheEntry entry) {
        synchronized (CompiledCache.ENTRIES) {
            CompiledCache.ENTRIES.put(key, entry);
            if (CompiledCache.ENTRIES.size() > 256)
                CompiledCache.ENTRIES.remove(CompiledCache.ENTRIES.keySet().iterator().next());
        }
    }

    // Four trailing ints in Matcher's capture array carry region/search/mode
    // arguments. The intrinsic therefore needs only three platform ABI args.
    public int match(String input, int[] state, boolean transparent, boolean anchoring) {
        int base = groupCount * 2;
        if (state.length != base + 4 || (contextSensitive && (transparent || !anchoring))) return -1;
        int from = state[base], to = state[base+1], start = state[base+2];
        if (from < 0 || to < from || to > input.length() || start < from || start > to || to-from > MAX_LENGTH)
            return -1;
        if (finalTerminatorSensitive && to > from) {
            char last = input.charAt(to-1);
            if (last == '\n' || last == '\r' || last == 0x85) return -1;
        }
        byte[] bytes = SharedSecrets.getJavaLangAccess().getLatin1Bytes(input);
        if (bytes == null) {
            if (input.length() > MAX_LENGTH) return -1;
            // Handles Latin-1 contents with compact strings disabled, and
            // snapshots of mutable CharSequences, without a second engine.
            bytes = new byte[input.length()];
            for (int i = 0; i < bytes.length; i++) {
                char c = input.charAt(i);
                if (c > 255) return -1;
                bytes[i] = (byte)c;
            }
        }
        try {
            return match0(handle, bytes, state);
        } finally {
            Reference.reachabilityFence(this);
        }
    }

    // A recursive grammar recognizer, not a character whitelist. Unsupported
    // constructs return to the Java compiler, which also diagnoses invalid
    // syntax. Capture-bearing repeated subtrees are restricted to a single
    // non-nullable capture so Java's retained captures cannot diverge.
    private static final class Subset {
        final String source;
        final StringBuilder output = new StringBuilder();
        final Map<String, Integer> names = new HashMap<>();
        final int flags;
        int cursor, groups = 1;
        boolean complex, contextSensitive, finalTerminatorSensitive;

        Subset(String source, int flags) {
            this.flags = flags;
            StringBuilder expanded = new StringBuilder();
            boolean quoted = (flags & Pattern.LITERAL) != 0;
            boolean literal = quoted;
            for (int i = 0; i < source.length(); i++) {
                char c = source.charAt(i);
                if (c > 127) fail();
                if (!literal && c == '\\' && i+1 < source.length()) {
                    char next = source.charAt(i+1);
                    if (next > 127) fail();
                    if (!quoted && next == 'Q') { quoted = true; i++; continue; }
                    if (quoted && next == 'E') { quoted = false; i++; continue; }
                    if (!quoted) { expanded.append(c).append(next); i++; continue; }
                }
                if (quoted) hex(expanded, c);
                else expanded.append(c);
            }
            this.source = expanded.toString();
        }

        Shape expression(int depth) {
            if (depth > 64) fail();
            int captures = 0;
            boolean nullable = false;
            do {
                boolean sequenceNullable = true;
                while (cursor < source.length() && peek() != ')' && peek() != '|') {
                    Shape atom = atom(depth+1);
                    int min = 1, max = 1;
                    boolean quantified = false;
                    if (cursor < source.length()) {
                        char c = peek();
                        if (c == '*' || c == '+' || c == '?') {
                            quantified = true;
                            cursor++; output.append(c); complex = true;
                            min = c == '+' ? 1 : 0;
                            max = c == '?' ? 1 : Integer.MAX_VALUE;
                        } else if (c == '{') {
                            quantified = true;
                            cursor++; output.append('{'); complex = true;
                            min = number(); max = min;
                            if (peek() == ',') {
                                cursor++; output.append(',');
                                max = peek() == '}' ? Integer.MAX_VALUE : number();
                            }
                            if (peek() != '}' || min > max) fail();
                            cursor++; output.append('}');
                        }
                        if (quantified) {
                            if (max > 1 && atom.captures != 0 &&
                                    !(atom.singleCapture && atom.captures == 1 && !atom.nullable)) fail();
                            if (peek() == '?') { cursor++; output.append('?'); }
                            else if (peek() == '+') fail(); // Java possessive semantics differ.
                        }
                    }
                    sequenceNullable &= min == 0 || atom.nullable;
                    captures += atom.captures;
                }
                nullable |= sequenceNullable;
                if (peek() != '|') break;
                cursor++; output.append('|'); complex = true;
            } while (true);
            return new Shape(nullable, captures, false);
        }

        Shape atom(int depth) {
            char c = take();
            if (c == '(') {
                complex = true;
                boolean capturing = true;
                String name = null;
                output.append('(');
                if (peek() == '?') {
                    cursor++; output.append('?');
                    if (peek() == ':') { cursor++; output.append(':'); capturing = false; }
                    else if (peek() == '<') {
                        cursor++; output.append('<');
                        int begin = cursor;
                        if (!letter(peek())) fail();
                        while (letter(peek()) || digit(peek())) output.append(take());
                        name = source.substring(begin, cursor);
                        if (take() != '>') fail();
                        output.append('>');
                    } else fail();
                }
                if (capturing) {
                    int index = groups++;
                    if (groups > 33 || (name != null && names.putIfAbsent(name, index) != null)) fail();
                }
                Shape body = expression(depth);
                if (take() != ')') fail();
                output.append(')');
                return new Shape(body.nullable, body.captures + (capturing ? 1 : 0), capturing);
            }
            if (c == '[') { characterClass(); complex = true; return new Shape(false, 0, false); }
            if (c == '.') {
                complex = true;
                output.append((flags & Pattern.DOTALL) != 0 ? "[\\x00-\\xff]"
                        : (flags & Pattern.UNIX_LINES) != 0 ? "[^\\n]" : "[^\\n\\r\\x85]");
                return new Shape(false, 0, false);
            }
            if (c == '^' || c == '$') {
                contextSensitive = true; complex = true;
                output.append(c == '^' ? "\\A" : "\\z");
                finalTerminatorSensitive |= c == '$';
                return new Shape(true, 0, false);
            }
            if (c == '\\') {
                char escaped = take();
                if ("AzZbB".indexOf(escaped) >= 0) {
                    contextSensitive = true; complex = true;
                    finalTerminatorSensitive |= escaped == 'Z';
                    output.append('\\').append(escaped == 'Z' ? 'z' : escaped);
                    return new Shape(true, 0, false);
                }
                cursor--;
                character(output, false);
                return new Shape(false, 0, false);
            }
            if ("*+?{}".indexOf(c) >= 0 || c == '\0') fail();
            if (c == ']') hex(output, c); else output.append(c);
            return new Shape(false, 0, false);
        }

        void characterClass() {
            output.append('[');
            if (peek() == '^') { cursor++; output.append('^'); }
            boolean first = true;
            while (cursor < source.length()) {
                if (peek() == ']' && !first) { cursor++; output.append(']'); return; }
                StringBuilder left = new StringBuilder();
                int value = classCharacter(left);
                output.append(left);
                first = false;
                if (peek() == '-' && cursor+1 < source.length() && source.charAt(cursor+1) != ']') {
                    cursor++;
                    StringBuilder right = new StringBuilder();
                    int end = classCharacter(right);
                    if (value < 0 || end < value) fail();
                    output.append('-').append(right);
                }
            }
            fail();
        }

        int classCharacter(StringBuilder target) {
            if (peek() == '-' && cursor+1 < source.length() && source.charAt(cursor+1) == '-') fail();
            char c = take();
            if (c == '[' || c == '&' || c == '~' || c == '|') fail();
            if (c == '\\') return character(target, true);
            hex(target, c);
            return c;
        }

        int character(StringBuilder target, boolean inClass) {
            char c = take();
            if ("dDwWsS".indexOf(c) >= 0) {
                target.append('\\').append(c); complex = true; return -1;
            }
            int value;
            if (c == 't') value = '\t';
            else if (c == 'n') value = '\n';
            else if (c == 'r') value = '\r';
            else if (c == 'f') value = '\f';
            else if (c == 'x' || c == 'u') {
                value = 0;
                for (int i = 0, count = c == 'x' ? 2 : 4; i < count; i++) {
                    int digit = Character.digit(take(), 16);
                    if (digit < 0) fail();
                    value = value*16 + digit;
                }
                if (value > 255) fail();
            } else if (!letter(c) && !digit(c)) value = c;
            else { fail(); return -1; }
            hex(target, value);
            return value;
        }

        int number() {
            if (!digit(peek())) fail();
            long value = 0;
            while (digit(peek())) {
                char c = take(); output.append(c);
                value = value*10 + c-'0';
                if (value > Integer.MAX_VALUE) fail();
            }
            return (int)value;
        }
        char peek() { return cursor < source.length() ? source.charAt(cursor) : '\0'; }
        char take() { if (cursor == source.length()) fail(); return source.charAt(cursor++); }
        static boolean letter(char c) { return c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z'; }
        static boolean digit(char c) { return c >= '0' && c <= '9'; }
    }

    private record Shape(boolean nullable, int captures, boolean singleCapture) { }
    private static void hex(StringBuilder target, int c) {
        target.append("\\x").append("0123456789abcdef".charAt(c >>> 4))
                .append("0123456789abcdef".charAt(c & 15));
    }
    private static final UnsupportedSyntax UNSUPPORTED = new UnsupportedSyntax();
    private static void fail() { throw UNSUPPORTED; }
    private static final class UnsupportedSyntax extends RuntimeException {
        @java.io.Serial
        private static final long serialVersionUID = 1L;
        UnsupportedSyntax() { super(null, null, false, false); }
    }

    private static native void registerNatives();
    private static native boolean enabled0();
    private static native long compile0(byte[] pattern, int flags, int groups);
    private static native void free0(long handle);
    @IntrinsicCandidate
    private static native int match0(long handle, byte[] input, int[] state);
}
