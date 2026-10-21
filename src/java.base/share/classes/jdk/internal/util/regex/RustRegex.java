/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
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
import jdk.internal.vm.annotation.ForceInline;
import jdk.internal.vm.annotation.IntrinsicCandidate;

/** Native primary engine for a parsed common subset of Java regex syntax. */
public final class RustRegex {
    public static final boolean ENABLED;
    public static final int SUPPORTED_FLAGS = Pattern.UNIX_LINES | Pattern.CASE_INSENSITIVE | Pattern.DOTALL;
    public static final int MAX_PATTERN_LENGTH = 4096;
    private static final int JAVA_TIER;
    public static final int MAX_LENGTH = 65536;
    public final int groupCount;
    public final Map<String, Integer> namedGroups;
    private volatile long handle;
    private final Subset deferred;
    private final boolean contextSensitive;
    private final boolean finalTerminatorSensitive;
    private final FastPlan fastPlan;
    private final int javaPlanWidth;
    private volatile int shortSearches;
    private final boolean fixedWidth, shortAlternatives;
    private volatile Pattern javaPattern;

    static {
        registerNatives();
        ENABLED = enabled0();
        JAVA_TIER = javaTier0();
    }

    private RustRegex(long handle, Subset subset, FastPlan fastPlan) {
        this.handle = handle;
        groupCount = subset.groups;
        namedGroups = subset.names;
        contextSensitive = subset.contextSensitive;
        finalTerminatorSensitive = subset.finalTerminatorSensitive;
        this.fastPlan = fastPlan;
        String prefix = shortLiteralPrefix();
        // The small prepared skip traversal avoids adapter work in interpreter
        // and C1 configurations. Keep the C2 window narrow for vector searches.
        javaPlanWidth = prefix == null ? 8 : JAVA_TIER == 2 ? 16 : Math.min(64, 8 * prefix.length());
        fixedWidth = !subset.variableLength;
        shortAlternatives = shortLiteralAlternatives(subset.source);
        deferred = handle == 0 ? subset : null;
        if (handle != 0) registerCleanup(handle);
    }

    private void registerCleanup(long handle) {
        try {
            CleanerFactory.cleaner().register(this, new Releaser(handle));
        } catch (Throwable t) {
            free0(handle);
            throw t;
        }
    }

    private synchronized long nativeHandle() {
        if (handle != 0) return handle;
        long compiled = compile0(deferred.output.toString().getBytes(StandardCharsets.US_ASCII),
                deferred.flags, groupCount);
        if (compiled != 0) {
            registerCleanup(compiled);
            handle = compiled;
        }
        return compiled;
    }

    private record Releaser(long handle) implements Runnable {
        public void run() { free0(handle); }
    }

    public static RustRegex compile(String pattern, int flags) {
        if (!ENABLED || pattern.length() > MAX_PATTERN_LENGTH ||
                (flags & ~SUPPORTED_FLAGS) != 0)
            return null;
        CacheKey key = new CacheKey(pattern, flags);
        synchronized (CompiledCache.ENTRIES) {
            CacheEntry cached = CompiledCache.ENTRIES.get(key);
            if (cached != null) {
                if (cached.javaOnly) return null;
                RustRegex engine = cached.engine.get();
                if (engine != null) return engine;
                if (cached.preparedSubset != null) {
                    engine = new RustRegex(0, cached.preparedSubset, cached.fastPlan);
                    cached.engine = new WeakReference<>(engine);
                    return engine;
                }
            }
        }
        try {
            Subset subset = new Subset(pattern, flags);
            subset.expression(0);
            if (subset.cursor != subset.source.length() || !subset.complex) {
                cache(key, new CacheEntry(true, null, null, null));
                return null;
            }
            // Freeze capture metadata once, before publishing a preparation.
            // Reconstructing a collected wrapper can share the immutable map.
            subset.names = Map.copyOf(subset.names);
            FastPlan fast = (flags & Pattern.CASE_INSENSITIVE) == 0 ? FastDigits.parse(subset.source, subset.groups) : null;
            if (fast == null && (flags & Pattern.CASE_INSENSITIVE) == 0)
                fast = FastEmail.parse(subset.source, subset.groups);
            if (fast == null && JAVA_TIER != 0 && (flags & Pattern.CASE_INSENSITIVE) == 0)
                fast = FastAlternationDigits.parse(subset.source, subset.groups);
            if (fast == null && subset.groups == 1 &&
                    (subset.source.equals("[0-9]{3}-[0-9]{2}-[0-9]{4}") ||
                     subset.source.equals("\\d{3}-\\d{2}-\\d{4}"))) fast = FastFixedDigits.INSTANCE;
            boolean defer = fast != null || JAVA_TIER == 2 && !subset.variableLength;
            long handle = defer ? 0
                    : compile0(subset.output.toString().getBytes(StandardCharsets.US_ASCII), flags, subset.groups);
            if (handle == 0 && !defer) return null; // Budget failures remain retryable for new Patterns.
            RustRegex engine = new RustRegex(handle, subset, fast);
            // A previously compiled native backend validates this preparation.
            // Small preparations can survive collection of the weak backend;
            // its replacement builds automata only if matching needs them.
            cache(key, new CacheEntry(false, new WeakReference<>(engine),
                    defer || pattern.length() <= 256 ? subset : null, fast));
            return engine;
        } catch (UnsupportedSyntax e) {
            cache(key, new CacheEntry(true, null, null, null));
            return null;
        }
    }

    private record CacheKey(String pattern, int flags) {
        // Cache lookup runs on first regex use. Avoid bootstrapping record
        // method handles just to hash and compare this pair.
        @Override
        public int hashCode() { return 31 * pattern.hashCode() + flags; }

        @Override
        public boolean equals(Object other) {
            return other instanceof CacheKey key && flags == key.flags && pattern.equals(key.pattern);
        }
    }
    private static final class CacheEntry {
        final boolean javaOnly;
        // The mutable weak slot is guarded by CompiledCache.ENTRIES.
        WeakReference<RustRegex> engine;
        final Subset preparedSubset;
        final FastPlan fastPlan;
        CacheEntry(boolean javaOnly, WeakReference<RustRegex> engine,
                   Subset preparedSubset, FastPlan fastPlan) {
            this.javaOnly = javaOnly;
            this.engine = engine;
            this.preparedSubset = preparedSubset;
            this.fastPlan = fastPlan;
        }
    }
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

    public boolean hasShortFixedWidth() { return fastPlan instanceof FastFixedDigits; }
    // Each accepted digit in Java's fixed-count Curly atoms advances last,
    // even if a following separator or full-region assertion later fails.
    public static int fixedFailureLast(String input, int to, int start, int previous) {
        int last = previous;
        for (int i = 0; i < 11; i++) {
            int at = start + i;
            if (at >= to) return last;
            char c = input.charAt(at);
            if (i == 3 || i == 6) {
                if (c != '-') return last;
            } else {
                if (c < '0' || c > '9') return last;
                last = at + 1;
            }
        }
        return last;
    }

    public static int fixedSearchFailureLast(String input, int to, int start, int previous) {
        // Start only probes positions with room for the eleven-character
        // minimum. The last probe that accepts a digit determines last;
        // later nondigit probes leave it untouched.
        for (int at = to - 11; at >= start; at--) {
            char c = input.charAt(at);
            if (c >= '0' && c <= '9') return fixedFailureLast(input, to, at, previous);
        }
        return previous;
    }

    public boolean hasShortPlan() { return fastPlan != null; }
    // Supply the validated literal/digit layout when a Java traversal is needed.
    public String literalDigitsPrefix() { return fastPlan instanceof FastDigits digits ? digits.prefix : null; }
    public int literalDigitsFirstChar() { return fastPlan instanceof FastDigits digits ? digits.firstChar : -1; }
    public int literalPrefixGroup() { return ((FastDigits) fastPlan).prefixGroup; }
    public int literalDigitsGroup() { return ((FastDigits) fastPlan).digitsGroup; }
    public String shortLiteralPrefix() {
        return groupCount == 1 && fastPlan instanceof FastDigits digits
                && digits.prefix.length() >= 4 && digits.prefix.length() <= 15 ? digits.prefix : null;
    }
    public Pattern javaPattern() { return javaPattern; }
    public void cacheJavaPattern(Pattern pattern) { javaPattern = pattern; }
    public boolean prefersJava(int length) {
        if (fastPlan instanceof FastDigits digits && !digits.prefix.isEmpty() && length <= javaPlanWidth) {
            if (length <= 8) return true;
            // Reuse of this preparation must justify building a Java sibling.
            // Once selected, Matcher caches the node and bypasses this hint entirely.
            int searches = shortSearches;
            if (searches >= 16) return true;
            shortSearches = searches + 1;
            return false;
        }
        return JAVA_TIER == 2 && fastPlan == null && fixedWidth && length <= 16;
    }
    public boolean prefersJavaEarlyMatch(int length) {
        return length <= 64 && fastPlan == null &&
                (JAVA_TIER == 2 && (fixedWidth || shortAlternatives) || JAVA_TIER == 1 && shortAlternatives);
    }

    // An early result alone does not bound backtracking work: a.*b|a may
    // scan a long failed branch first. Limit this choice to short literal
    // alternatives followed by one greedy digit run, or fixed-width patterns.
    private static boolean shortLiteralAlternatives(String source) {
        if (!source.startsWith("(")) return false;
        int begin = source.startsWith("(?:") ? 3 : FastDigits.groupBody(source, 0);
        if (begin < 0) return false;
        int end = source.indexOf(')', begin);
        if (end < 0 || end - begin > 64) return false;
        int alternatives = 1, width = 0;
        for (int at = begin; at < end; at++) {
            char c = source.charAt(at);
            if (c == '|') {
                if (width == 0 || ++alternatives > 8) return false;
                width = 0;
            } else if (!FastDigits.literal(c) || ++width > 16) return false;
        }
        if (width == 0 || alternatives < 2) return false;
        String tail = source.substring(end + 1);
        return tail.equals("[0-9]+") || tail.equals("\\d+");
    }
    public boolean hasExactEndFlags() { return fastPlan instanceof FastDigits || fastPlan instanceof FastAlternationDigits || fastPlan instanceof FastFixedDigits; }
    public boolean hasExactSuccessEndFlags() { return fastPlan instanceof FastEmail; }
    public boolean successHitsEnd(int[] state, int to) {
        // The bounded suffix tries another letter only below its maximum.
        return !(fastPlan instanceof FastFixedDigits) && state[1] == to && (!(fastPlan instanceof FastEmail)
                || state[1] - state[5] - 1 < 4);
    }
    public boolean anchoredMissHitsEnd(String input, int to, int start) {
        if (fastPlan instanceof FastFixedDigits) {
            for (int i = 0; i < 11; i++) {
                if (start + i == to) return true;
                char c = input.charAt(start + i);
                if (i == 3 || i == 6) { if (c != '-') return false; }
                else if (c < '0' || c > '9') return false;
            }
            return false;
        }
        if (fastPlan instanceof FastAlternationDigits alternatives) {
            if (start == to) return true;
            for (String prefix : alternatives.prefixes) {
                if (input.charAt(start) != prefix.charAt(0)) continue;
                int available = to - start;
                for (int i = 0; i < Math.min(available, prefix.length()); i++)
                    if (input.charAt(start + i) != prefix.charAt(i)) return false;
                return available <= prefix.length();
            }
            return false;
        }
        String prefix = ((FastDigits) fastPlan).prefix;
        int available = to - start;
        for (int i = 0; i < Math.min(available, prefix.length()); i++) {
            if (input.charAt(start + i) != prefix.charAt(i)) return false;
        }
        return available <= prefix.length();
    }

    // Only native calls marshal region/search/mode into the capture array.
    // Short plans use the scalar arguments without allocating native state.
    @ForceInline
    public int match(String input, int[] state, int from, int to, int start, int mode,
                     boolean transparent, boolean anchoring) {
        int base = groupCount * 2;
        if (state.length != base + 4 || from < 0 || to < from || to > input.length()
                || start < from || start > to) return -1;
        if (fastPlan != null) {
            int result = fastPlan.match(input, state, to, start, mode, to - from);
            if (result != -2) return result;
            if (fastPlan instanceof FastAlternationDigits) start = state[state.length - 2];
        }
        return nativeMatch(input, state, from, to, start, mode, transparent, anchoring);
    }

    private int nativeMatch(String input, int[] state, int from, int to, int start, int mode,
                            boolean transparent, boolean anchoring) {
        if (contextSensitive && (transparent || !anchoring)) return -1;
        if (to - from > MAX_LENGTH) return -1;
        if (finalTerminatorSensitive && to > from) {
            char last = input.charAt(to-1);
            if (last == '\n' || last == '\r' || last == 0x85) return -1;
        }
        long nativeHandle = handle;
        if (nativeHandle == 0 && JAVA_TIER == 2 && mode == 0 &&
                fastPlan instanceof FastDigits digits && !digits.prefix.isEmpty() &&
                input.indexOf(digits.prefix.charAt(0), start, to - digits.prefix.length()) < 0)
            return 0;
        byte[] bytes = SharedSecrets.getJavaLangAccess().getLatin1Bytes(input);
        if (bytes == null) {
            if (input.length() > MAX_LENGTH) return -1;
            // Handles Latin-1 contents when compact Strings are disabled,
            // without constructing a second engine.
            bytes = new byte[input.length()];
            for (int i = 0; i < bytes.length; i++) {
                char c = input.charAt(i);
                if (c > 255) return -1;
                bytes[i] = (byte)c;
            }
        }
        int base = groupCount * 2;
        state[base] = from;
        state[base+1] = to;
        state[base+2] = start;
        state[base+3] = mode;
        try {
            if (nativeHandle == 0) nativeHandle = nativeHandle();
            if (nativeHandle == 0) return -1;
            int result = match0(nativeHandle, bytes, state);
            return result == -2 ? matchSafepoint0(nativeHandle, bytes, state) : result;
        } finally {
            Reference.reachabilityFence(this);
        }
    }

    // A narrow specialization of already parsed/validated expressions. This
    // keeps only a literal prefix and two capture indices, not a Java graph.
    // Short searches and early positives can avoid the foreign-call overhead;
    // general expressions and long scans continue through the Rust engine.
    private interface FastPlan {
        int match(String input, int[] state, int to, int start, int mode, int length);
    }

    private enum FastFixedDigits implements FastPlan {
        INSTANCE;

        private static boolean digit(char c) { return c >= '0' && c <= '9'; }

        @Override
        public int match(String input, int[] state, int to, int start, int mode, int length) {
            if (to - start < 11) return 0;
            if (JAVA_TIER == 0) return -2;
            boolean scan = mode == 0 && length <= (JAVA_TIER == 2 ? 256 : 16);
            int limit = scan ? to - 11 : start;
            for (int at = start; at <= limit; at++) {
                if (digit(input.charAt(at)) && input.charAt(at + 3) == '-' &&
                        input.charAt(at + 6) == '-' &&
                        digit(input.charAt(at + 1)) && digit(input.charAt(at + 2)) &&
                        digit(input.charAt(at + 4)) && digit(input.charAt(at + 5)) &&
                        digit(input.charAt(at + 7)) && digit(input.charAt(at + 8)) &&
                        digit(input.charAt(at + 9)) && digit(input.charAt(at + 10))) {
                    if (mode == 2 && at + 11 != to) return 0;
                    state[0] = at;
                    state[1] = at + 11;
                    return 1;
                }
            }
            return scan || mode != 0 ? 0 : -2;
        }
    }

    private record FastDigits(String prefix, int prefixGroup, int digitsGroup, int firstChar) implements FastPlan {
        static FastDigits parse(String source, int groups) {
            if (source.isEmpty()) return null;
            int cursor = 0, prefixGroup = 0, digitsGroup = 0;
            String prefix = "";
            if (source.charAt(0) == '(') {
                int begin = groupBody(source, 0);
                int end = begin;
                while (end >= 0 && end < source.length() && literal(source.charAt(end))) end++;
                if (begin >= 0 && end > begin && end < source.length() && source.charAt(end) == ')') {
                    prefix = source.substring(begin, end);
                    prefixGroup = 1;
                    cursor = end + 1;
                }
            } else {
                while (cursor < source.length() && literal(source.charAt(cursor))) cursor++;
                prefix = source.substring(0, cursor);
            }
            int body = cursor;
            boolean capture = cursor < source.length() && source.charAt(cursor) == '(';
            if (capture) {
                body = groupBody(source, cursor);
                if (body < 0) return null;
                digitsGroup = prefixGroup + 1;
            }
            int end;
            if (source.startsWith("[0-9]+", body)) end = body + 6;
            else if (source.startsWith("\\d+", body)) end = body + 3;
            else return null;
            if (capture) {
                if (end >= source.length() || source.charAt(end) != ')') return null;
                end++;
            }
            if (end != source.length() || groups != 1 + (prefixGroup != 0 ? 1 : 0) + (digitsGroup != 0 ? 1 : 0))
                return null;
            return new FastDigits(prefix, prefixGroup, digitsGroup, prefix.isEmpty() ? -1 : prefix.charAt(0));
        }

        private static int groupBody(String source, int at) {
            if (at+1 >= source.length()) return -1;
            if (source.charAt(at+1) != '?') return at+1;
            if (!source.startsWith("(?<", at)) return -1;
            int end = source.indexOf('>', at+3);
            return end < 0 ? -1 : end+1;
        }
        private static boolean literal(char c) {
            return c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z' || c >= '0' && c <= '9'
                    || c == '_' || c == '-' || c == ':' || c == ' ' || c == ',';
        }

        @Override
        public int match(String input, int[] state, int to, int start, int mode, int length) {
            if (to - start <= prefix.length()) return 0;
            boolean scan = mode == 0 && length <= 256;
            int at = start;
            if (scan && !prefix.isEmpty() && (at == to || input.charAt(at) != prefix.charAt(0)))
                at = candidate(input, at, to);
            if (scan && prefix.isEmpty()) {
                // Digit-only expressions have no literal prefix to search for.
                while (at < to) {
                    int c = input.charAt(at);
                    if (c >= '0' && c <= '9') break;
                    at++;
                }
                if (at == to) return 0;
            }
            int limit = to-start <= 256 ? 256 : JAVA_TIER == 2 ? Integer.MAX_VALUE : 32;
            while (at >= 0 && at <= to) {
                int digits = at + prefix.length();
                if (digits <= to && (prefix.isEmpty() || input.startsWith(prefix, at))) {
                    int end = digits;
                    while (end < to) {
                        int c = input.charAt(end);
                        if (c < '0' || c > '9') break;
                        if (end-digits == limit) return -2;
                        end++;
                    }
                    if (end != digits) {
                        if (mode == 2 && end != to) return 0;
                        state[0] = at; state[1] = end;
                        if (prefixGroup != 0) {
                            state[2*prefixGroup] = at;
                            state[2*prefixGroup+1] = digits;
                        }
                        if (digitsGroup != 0) {
                            state[2*digitsGroup] = digits;
                            state[2*digitsGroup+1] = end;
                        }
                        return 1;
                    }
                }
                if (!scan) return mode == 0 ? -2 : 0;
                if (at == to) return 0;
                at = candidate(input, at+1, to);
                if (at < 0) return 0;
            }
            return 0;
        }

        @ForceInline
        private int candidate(String input, int at, int to) {
            return to == input.length() ? input.indexOf(prefix, at)
                    : input.indexOf(prefix, at, to);
        }
    }


    // Distinct first characters make these literal choices unambiguous.
    // Every capture is mandatory, and only the trailing digit run repeats.
    private record FastAlternationDigits(String[] prefixes, int prefixGroup,
                                         int digitsGroup, int minimumWidth) implements FastPlan {
        static FastAlternationDigits parse(String source, int groups) {
            if (source.isEmpty() || source.charAt(0) != '(') return null;
            boolean prefixCapture = !source.startsWith("(?:");
            int begin = prefixCapture ? FastDigits.groupBody(source, 0) : 3;
            if (begin < 0) return null;
            int end = source.indexOf(')', begin);
            if (end < 0 || end - begin > 128) return null;
            String[] words = new String[8];
            int count = 0, at = begin, minimum = Integer.MAX_VALUE;
            for (int i = begin; i <= end; i++) {
                if (i != end && source.charAt(i) != '|') {
                    if (!FastDigits.literal(source.charAt(i))) return null;
                    continue;
                }
                if (i == at || i - at > 16 || count == words.length) return null;
                String word = source.substring(at, i);
                for (int j = 0; j < count; j++)
                    if (words[j].charAt(0) == word.charAt(0)) return null;
                words[count++] = word;
                minimum = Math.min(minimum, word.length());
                at = i + 1;
            }
            if (count < 2) return null;
            int body = end + 1, digitsGroup = 0, prefixGroup = prefixCapture ? 1 : 0;
            boolean wrapped = body < source.length() && source.charAt(body) == '(';
            if (wrapped) {
                boolean capture = !source.startsWith("(?:", body);
                body = capture ? FastDigits.groupBody(source, body) : body + 3;
                if (body < 0) return null;
                if (capture) digitsGroup = prefixGroup + 1;
            }
            if (source.startsWith("[0-9]+", body)) body += 6;
            else if (source.startsWith("\\d+", body)) body += 3;
            else return null;
            if (wrapped) {
                if (body >= source.length() || source.charAt(body) != ')') return null;
                body++;
            }
            if (body != source.length() || groups != 1 + prefixGroup + (digitsGroup == 0 ? 0 : 1)) return null;
            return new FastAlternationDigits(java.util.Arrays.copyOf(words, count), prefixGroup, digitsGroup, minimum);
        }

        @Override
        public int match(String input, int[] state, int to, int start, int mode, int length) {
            boolean scan = mode == 0 && length <= 16;
            for (int at = start; at < to - minimumWidth;) {
                char first = input.charAt(at);
                for (String prefix : prefixes) {
                    if (first != prefix.charAt(0)) continue;
                    if (prefix.length() < to - at && input.startsWith(prefix, at)) {
                        int digits = at + prefix.length(), end = digits;
                        while (end < to) {
                            char c = input.charAt(end);
                            if (c < '0' || c > '9') break;
                            end++;
                        }
                        if (end > digits) {
                            if (mode == 2 && end != to) return 0;
                            state[0] = at; state[1] = end;
                            if (prefixGroup != 0) {
                                state[2 * prefixGroup] = at;
                                state[2 * prefixGroup + 1] = digits;
                            }
                            if (digitsGroup != 0) {
                                state[2 * digitsGroup] = digits;
                                state[2 * digitsGroup + 1] = end;
                            }
                            return 1;
                        }
                    }
                    break;
                }
                if (!scan) {
                    if (mode != 0) return 0;
                    if (JAVA_TIER == 1) {
                        state[state.length - 2] = start;
                        return -2;
                    }
                    int candidate = to;
                    for (String prefix : prefixes) {
                        int bound = to - prefix.length();
                        if (start + 1 < bound) {
                            int next = input.indexOf(prefix.charAt(0), start + 1, bound);
                            if (next >= 0) {
                                candidate = Math.min(candidate, next);
                                if (candidate == start + 1) break;
                            }
                        }
                    }
                    if (candidate != to) {
                        if (to - candidate <= 32 && validCandidate(input, candidate, to)) {
                            at = candidate;
                            scan = true;
                            continue;
                        }
                        state[state.length - 2] = candidate;
                        return -2;
                    }
                    return 0;
                }
                at++;
            }
            return 0;
        }

        private boolean validCandidate(String input, int at, int to) {
            char first = input.charAt(at);
            for (String prefix : prefixes) {
                if (first != prefix.charAt(0)) continue;
                int digits = at + prefix.length();
                if (digits >= to || !input.startsWith(prefix, at)) return false;
                char c = input.charAt(digits);
                return c >= '0' && c <= '9';
            }
            return false;
        }
    }

    // Two captured ASCII words, an @ separator and a bounded lowercase suffix.
    // The subset parser has already validated names and capture numbering.
    private record FastEmail() implements FastPlan {
        static FastEmail parse(String source, int groups) {
            if (groups != 3 || source.isEmpty() || source.charAt(0) != '(') return null;
            int first = FastDigits.groupBody(source, 0);
            String word = "[a-z0-9_]+)";
            if (first < 0 || !source.startsWith(word, first)) return null;
            int next = first + word.length();
            if (!source.startsWith("@(", next)) return null;
            int second = FastDigits.groupBody(source, next + 1);
            String tail = word + "\\.[a-z]{2,4}";
            return second >= 0 && source.startsWith(tail, second)
                    && second + tail.length() == source.length() ? new FastEmail() : null;
        }

        private static boolean word(char c) {
            return c >= 'a' && c <= 'z' || c >= '0' && c <= '9' || c == '_';
        }

        @Override
        public int match(String input, int[] state, int to, int start, int mode, int length) {
            boolean scan = mode == 0 && length <= 32;
            int at = start;
            while (at < to) {
                int user = at;
                while (user < to && word(input.charAt(user))) {
                    if (user - at >= 32) return -2;
                    user++;
                }
                if (user != at && user < to && input.charAt(user) == '@') {
                    int domain = user + 1, dot = domain;
                    while (dot < to && word(input.charAt(dot))) {
                        if (dot - at >= 32) return -2;
                        dot++;
                    }
                    if (dot != domain && dot < to && input.charAt(dot) == '.') {
                        int end = dot + 1;
                        while (end < to && end - dot <= 4) {
                            char c = input.charAt(end);
                            if (c < 'a' || c > 'z') break;
                            end++;
                        }
                        if (end - dot >= 3) {
                            if (mode == 2 && end != to) return 0;
                            state[0] = at;
                            state[1] = end;
                            state[2] = at;
                            state[3] = user;
                            state[4] = domain;
                            state[5] = dot;
                            return 1;
                        }
                    }
                }
                if (!scan) return mode == 0 ? -2 : 0;
                // A shorter start inside this word has the same @ position.
                at = Math.max(at + 1, user + 1);
            }
            return 0;
        }
    }

    // A recursive grammar recognizer, not a character whitelist. Unsupported
    // constructs return to the Java compiler, which also diagnoses invalid
    // syntax. Capture-bearing repeated subtrees are restricted to a single
    // non-nullable capture so Java's retained captures cannot diverge.
    private static final class Subset {
        final String source;
        final StringBuilder output = new StringBuilder();
        // Mutable while parsing; frozen before this preparation is published.
        Map<String, Integer> names = new HashMap<>();
        final int flags;
        int cursor, groups = 1;
        boolean complex, contextSensitive, finalTerminatorSensitive, variableLength;

        Subset(String source, int flags) {
            this.flags = flags;
            StringBuilder expanded = new StringBuilder();
            boolean quoted = false;
            for (int i = 0; i < source.length(); i++) {
                char c = source.charAt(i);
                if (c > 127) fail();
                if (c == '\\' && i+1 < source.length()) {
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
                            variableLength |= min != max;
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
                variableLength = true;
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
                character(output);
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
            if (c == '\\') return character(target);
            hex(target, c);
            return c;
        }

        int character(StringBuilder target) {
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
    private static native int javaTier0();
    private static native long compile0(byte[] pattern, int flags, int groups);
    private static native void free0(long handle);
    @IntrinsicCandidate
    private static native int match0(long handle, byte[] input, int[] state);
    private static native int matchSafepoint0(long handle, byte[] input, int[] state);
}
