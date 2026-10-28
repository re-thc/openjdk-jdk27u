/*
 * Copyright (c) 2017, 2026, Oracle and/or its affiliates. All rights reserved.
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

package sun.security.util;

import java.io.BufferedReader;
import java.io.PushbackInputStream;
import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.zip.InflaterInputStream;
import java.util.zip.Inflater;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import static java.nio.charset.StandardCharsets.UTF_8;

import sun.security.ssl.SSLLogger;

/**
 * Allows public suffixes and registered domains to be determined from a
 * string that represents a target domain name. A database of known
 * registered suffixes is used to perform the determination.
 *
 * A public suffix is defined as the rightmost part of a domain name
 * that is not owned by an individual registrant. Examples of
 * public suffixes are:
 *      com
 *      edu
 *      co.uk
 *      k12.ak.us
 *      com.tw
 *      網路.tw
 *
 * Public suffixes effectively denote registration authorities.
 *
 * A registered domain is a public suffix preceded by one domain label
 * and a ".". Examples are:
 *      oracle.com
 *      mit.edu
 *
 * The internal database is derived from the information maintained at
 * http://publicsuffix.org. The information is fixed for a particular
 * JDK installation, but may be updated in future releases or updates.
 *
 * Because of the large number of top-level domains (TLDs) and public
 * suffix rules, we only load rules on demand. The build-generated indexed
 * image has an independently compressed trie for each TLD. Replacement Zip
 * files containing one entry for each TLD retain the legacy parser.
 *
 * As each entry is loaded, its data is stored permanently in a cache.
 *
 * The containment hierarchy for the data is shown below:
 *
 * Rules --> contains all the rules for a particular TLD
 *    RuleSet --> contains all the rules that match 1 label
 *    RuleSet --> contains all the rules that match 2 labels
 *    RuleSet --> contains all the rules that match 3 labels
 *      :
 *    RuleSet --> contains all the rules that match N labels
 *      HashSet of rules, where each rule is an exception rule, a "normal"
 *      rule, a wildcard rule (rules that contain a wildcard prefix only),
 *      or a LinkedList of "other" rules
 *
 * The general matching algorithm tries to find the longest match. So, the
 * search begins at the RuleSet with the most labels, and works backwards.
 *
 * Exceptions take priority over all other rules, and if a Rule contains
 * any exceptions, then even if we find a "normal" match, we search all
 * other RuleSets for exceptions. It is assumed that all other rules don't
 * intersect/overlap. If this happens, a match will be returned, but not
 * necessarily the expected one. For a further explanation of the rules,
 * see http://publicsuffix.org/list/.
 *
 * The "other" rules are for the (possible future) case where wildcards
 * are located in a rule any place other than the beginning.
 */

class DomainName {
    /**
     * For efficiency, the set of rules for each TLD is kept
     * in text files and only loaded if needed.
     */
    private static final Map<String, Rules> cache = new ConcurrentHashMap<>();

    private DomainName() {}

    /**
     * Returns the registered domain of the specified domain.
     *
     * @param domain the domain name
     * @return the registered domain, or null if not known or not registerable
     * @throws NullPointerException if domain is null
     */
    public static RegisteredDomain registeredDomain(String domain) {
        Match match = getMatch(domain);
        return (match != null) ? match.registeredDomain() : null;
    }

    private static Match getMatch(String domain) {
        if (domain == null) {
            throw new NullPointerException();
        }
        Rules rules = Rules.getRules(domain);
        return rules == null ? null : rules.match(domain);
    }

    /**
     * A Rules object contains a list of rules for a particular TLD.
     *
     * Rules are stored in a linked list of RuleSet objects. The list is
     * indexed according to the number of labels in the name (minus one)
     * such that all rules with the same number of labels are stored
     * in the same RuleSet.
     *
     * Doing this means we can find the longest match first, and also we
     * can stop comparing as soon as we find a match.
     */
    private static class Rules {

        private final LinkedList<RuleSet> ruleSets = new LinkedList<>();
        private final boolean hasExceptions;
        private final IndexedRules indexed;

        private Rules(IndexedRules indexed) {
            this.indexed = indexed;
            hasExceptions = false;
        }

        private Rules(InputStream is) throws IOException {
            indexed = null;
            InputStreamReader isr = new InputStreamReader(is, UTF_8);
            BufferedReader reader = new BufferedReader(isr);
            boolean hasExceptions = false;

            String line;
            int type = reader.read();
            while (type != -1 && (line = reader.readLine()) != null) {
                int numLabels = RuleSet.numLabels(line);
                if (numLabels != 0) {
                    RuleSet ruleset = getRuleSet(numLabels - 1);
                    ruleset.addRule(type, line);
                    hasExceptions |= ruleset.hasExceptions;
                }
                type = reader.read();
            }
            this.hasExceptions = hasExceptions;
        }

        static Rules getRules(String domain) {
            String tld = getTopLevelDomain(domain);
            if (tld.isEmpty()) {
                return null;
            }
            return cache.computeIfAbsent(tld, k -> createRules(tld));
        }

        private static String getTopLevelDomain(String domain) {
            int n = domain.lastIndexOf('.');
            if (n == -1) {
                return domain;
            }
            return domain.substring(n + 1);
        }

        private static Rules createRules(String tld) {
            try (FileInputStream pubSuffixStream = getPubSuffixStream()) {
                if (pubSuffixStream == null) {
                    return null;
                }
                PushbackInputStream input = new PushbackInputStream(pubSuffixStream, 4);
                byte[] magic = input.readNBytes(4);
                input.unread(magic);
                if (magic.length == 4 && magic[0] == 'P' && magic[1] == 'S' &&
                    magic[2] == 'L' && magic[3] == '1') {
                    pubSuffixStream.getChannel().position(0);
                    return IndexedData.rules(tld, pubSuffixStream);
                }
                return getRules(tld, new ZipInputStream(input));
            } catch (IOException e) {
                if (SSLLogger.isOn() && SSLLogger.isOn(SSLLogger.Opt.SSL)) {
                    SSLLogger.fine(
                        "cannot parse public suffix data for " + tld +
                         ": " + e.getMessage());
                }
                return null;
            }
        }

        private static FileInputStream getPubSuffixStream() {
            FileInputStream is = null;
            File f = new File(System.getProperty("java.home"),
                "lib/security/public_suffix_list.dat");
            try {
                is = new FileInputStream(f);
            } catch (FileNotFoundException e) { }
            if (is == null) {
                if (SSLLogger.isOn() &&
                        SSLLogger.isOn(SSLLogger.Opt.TRUSTMANAGER)) {
                    SSLLogger.fine(
                        "lib/security/public_suffix_list.dat not found");
                }
            }
            return is;
        }

        private static Rules getRules(String tld,
                                      ZipInputStream zis) throws IOException {
            boolean found = false;
            ZipEntry ze = zis.getNextEntry();
            while (ze != null && !found) {
                if (ze.getName().equals(tld)) {
                    found = true;
                } else {
                    ze = zis.getNextEntry();
                }
            }
            if (!found) {
                if (SSLLogger.isOn() && SSLLogger.isOn(SSLLogger.Opt.SSL)) {
                    SSLLogger.fine("Domain " + tld + " not found");
                }
                return null;
            }
            return new Rules(zis);
        }

        /**
         * Return the requested RuleSet. If it hasn't been created yet,
         * create it and any RuleSets leading up to it.
         */
        private RuleSet getRuleSet(int index) {
            if (index < ruleSets.size()) {
                return ruleSets.get(index);
            }
            RuleSet r = null;
            for (int i = ruleSets.size(); i <= index; i++) {
                r = new RuleSet(i + 1);
                ruleSets.add(r);
            }
            return r;
        }

        /**
         * Find a match for the target string.
         */
        Match match(String domain) {
            if (indexed != null) {
                return indexed.match(domain);
            }
            // Start at the end of the rules list, looking for longest match.
            // After we find a normal match, we only look for exceptions.
            Match possibleMatch = null;

            Iterator<RuleSet> it = ruleSets.descendingIterator();
            while (it.hasNext()) {
                RuleSet ruleSet = it.next();
                Match match = ruleSet.match(domain);
                if (match != null) {
                    if (match.type() == Rule.Type.EXCEPTION || !hasExceptions) {
                        return match;
                    }
                    if (possibleMatch == null) {
                        possibleMatch = match;
                    }
                }
            }
            return possibleMatch;
        }

        /**
         * Represents a set of rules with the same number of labels
         * and for a particular TLD.
         *
         * Examples:
         *      numLabels = 2
         *      names: co.uk, ac.uk
         *      wildcards *.de (only "de" stored in HashSet)
         *      exceptions: !foo.de (stored as "foo.de")
         */
        private static class RuleSet {
            // the number of labels in this ruleset
            private final int numLabels;
            private final Set<Rule> rules = new HashSet<>();
            boolean hasExceptions = false;
            private static final RegisteredDomain.Type[] AUTHS =
                RegisteredDomain.Type.values();

            RuleSet(int n) {
                numLabels = n;
            }

            void addRule(int auth, String rule) {
                if (rule.startsWith("!")) {
                    rules.add(new Rule(rule.substring(1), Rule.Type.EXCEPTION,
                                       AUTHS[auth]));
                    hasExceptions = true;
                } else if (rule.startsWith("*.") &&
                           rule.lastIndexOf('*') == 0) {
                    rules.add(new Rule(rule.substring(2), Rule.Type.WILDCARD,
                                       AUTHS[auth]));
                } else if (rule.indexOf('*') == -1) {
                    // a "normal" label
                    rules.add(new Rule(rule, Rule.Type.NORMAL, AUTHS[auth]));
                } else {
                    // There is a wildcard in a non-leading label. This case
                    // doesn't currently exist, but we need to handle it anyway.
                    rules.add(new OtherRule(rule, AUTHS[auth], split(rule)));
                }
            }

            Match match(String domain) {
                Match match = null;
                for (Rule rule : rules) {
                    switch (rule.type) {
                        case NORMAL:
                            if (match == null) {
                                match = matchNormal(domain, rule);
                            }
                            break;
                        case WILDCARD:
                            if (match == null) {
                                match = matchWildcard(domain, rule);
                            }
                            break;
                        case OTHER:
                            if (match == null) {
                                match = matchOther(domain, rule);
                            }
                            break;
                        case EXCEPTION:
                            Match excMatch = matchException(domain, rule);
                            if (excMatch != null) {
                                return excMatch;
                            }
                            break;
                    }
                }
                return match;
            }

            private static LinkedList<String> split(String rule) {
                String[] labels = rule.split("\\.");
                return new LinkedList<>(Arrays.asList(labels));
            }

            private static int numLabels(String rule) {
                if (rule.isEmpty()) {
                    return 0;
                }
                int len = rule.length();
                int count = 0;
                int index = 0;
                while (index < len) {
                    int pos;
                    if ((pos = rule.indexOf('.', index)) == -1) {
                        return count + 1;
                    }
                    index = pos + 1;
                    count++;
                }
                return count;
            }

            /**
             * Check for a match with an explicit name rule or a wildcard rule
             * (i.e., a non-exception rule).
             */
            private Match matchNormal(String domain, Rule rule) {
                int index = labels(domain, numLabels);
                if (index == -1) {
                    return null;
                }

                // Check for explicit names.
                String substring = domain.substring(index);
                if (rule.domain.equals(substring)) {
                    return new CommonMatch(domain, rule, index);
                }

                return null;
            }

            private Match matchWildcard(String domain, Rule rule) {
                // Now check for wildcards. In this case, there is one fewer
                // label than numLabels.
                int index = labels(domain, numLabels - 1);
                if (index > 0) {
                    String substring = domain.substring(index);

                    if (rule.domain.equals(substring)) {
                        return new CommonMatch(domain, rule,
                                               labels(domain, numLabels));
                    }
                }

                return null;
            }

            /**
             * Check for a match with an exception rule.
             */
            private Match matchException(String domain, Rule rule) {
                int index = labels(domain, numLabels);
                if (index == -1) {
                    return null;
                }
                String substring = domain.substring(index);

                if (rule.domain.equals(substring)) {
                    return new CommonMatch(domain, rule,
                                           labels(domain, numLabels - 1));
                }

                return null;
            }

            /**
             * A left-to-right comparison of labels.
             * The simplest approach to doing match() would be to
             * use a descending iterator giving a right-to-left comparison.
             * But, it's more efficient to do left-to-right compares
             * because the left most labels are the ones most likely to be
             * different. We just have to figure out which label to start at.
             */
            private Match matchOther(String domain, Rule rule) {
                OtherRule otherRule = (OtherRule)rule;
                LinkedList<String> target = split(domain);

                int diff = target.size() - numLabels;
                if (diff < 0) {
                    return null;
                }

                boolean found = true;
                for (int i = 0; i < numLabels; i++) {
                    String ruleLabel = otherRule.labels.get(i);
                    String targetLabel = target.get(i + diff);

                    if (ruleLabel.charAt(0) != '*' &&
                        !ruleLabel.equalsIgnoreCase(targetLabel)) {
                        found = false;
                        break;
                    }
                }
                if (found) {
                    return new OtherMatch(rule, numLabels, target);
                }
                return null;
            }

            /**
             * Returns a substring (index) with the n right-most labels from s.
             * Returns -1 if s does not have at least n labels, 0, if the
             * substring is s.
             */
            private static int labels(String s, int n) {
                if (n < 1) {
                    return -1;
                }
                int index = s.length();
                for (int i = 0; i < n; i++) {
                    int next = s.lastIndexOf('.', index);
                    if (next == -1) {
                        if (i == n - 1) {
                            return 0;
                        } else {
                            return -1;
                        }
                    }
                    index = next - 1;
                }
                return index + 2;
            }
        }
    }

    /**
     * A self-describing directory is read afresh for every uncached TLD.
     * The directory and selected shard use the same open file descriptor;
     * only a successfully parsed TLD shard enters the existing positive cache.
     */
    private static final class IndexedData {
        private static final int HEADER_LENGTH = 84;
        private static final int MAX_DIRECTORY_LENGTH = 1024 * 1024;
        private static final int MAX_SHARD_LENGTH = 8 * 1024 * 1024;
        private final byte[] directory;
        private final int[] entries;

        private IndexedData(byte[] prefix, int imageLength) throws IOException {
            int count = readInt(prefix, 80);
            if (count < 0 || count > (prefix.length - HEADER_LENGTH) / 15) {
                throw new IOException("Invalid public suffix directory size");
            }
            entries = new int[count];
            int position = HEADER_LENGTH;
            int previous = 0;
            int previousLength = 0;
            for (int i = 0; i < count; i++) {
                if (position > prefix.length - 15) {
                    throw new IOException("Truncated public suffix directory");
                }
                int length = readUnsignedShort(prefix, position);
                if (length == 0 || length > prefix.length - position - 14) {
                    throw new IOException("Invalid public suffix TLD length");
                }
                int name = position + 2;
                validateLabel(prefix, name, length);
                if (i > 0 && compareUTF8(prefix, previous, previousLength,
                                        name, length) >= 0) {
                    throw new IOException("Unsorted public suffix directory");
                }
                entries[i] = position;
                previous = name;
                previousLength = length;
                position = name + length + 12;
            }
            if (position != prefix.length) {
                throw new IOException("Invalid public suffix directory extent");
            }
            int end = position;
            for (int entry : entries) {
                int metadata = entry + 2 + readUnsignedShort(prefix, entry);
                int offset = readInt(prefix, metadata);
                int compressed = readInt(prefix, metadata + 4);
                int length = readInt(prefix, metadata + 8);
                if (offset != end || compressed < 1 || compressed > MAX_SHARD_LENGTH ||
                    length < 14 || length > MAX_SHARD_LENGTH || compressed > imageLength - end) {
                    throw new IOException("Invalid public suffix directory entry");
                }
                end += compressed;
            }
            if (end != imageLength) {
                throw new IOException("Trailing public suffix image data");
            }
            directory = prefix;
        }

        static Rules rules(String tld, FileInputStream input) throws IOException {
            // File size and all reads/seeks refer to this descriptor, even if
            // the pathname is replaced while the lookup is in progress.
            long fileLength = input.getChannel().size();
            byte[] header = new byte[HEADER_LENGTH];
            if (input.readNBytes(header, 0, header.length) != header.length ||
                readInt(header, 0) != 0x50534c31 || readInt(header, 4) != 2) {
                throw new IOException("Unsupported public suffix image header");
            }
            int imageLength = readInt(header, 8);
            int directoryLength = readInt(header, 12);
            if (imageLength < HEADER_LENGTH || imageLength != fileLength ||
                directoryLength < HEADER_LENGTH || directoryLength > MAX_DIRECTORY_LENGTH ||
                directoryLength > imageLength) {
                throw new IOException("Invalid public suffix image bounds");
            }
            byte[] prefix = new byte[directoryLength];
            System.arraycopy(header, 0, prefix, 0, header.length);
            if (input.readNBytes(prefix, header.length, prefix.length - header.length)
                    != prefix.length - header.length) {
                throw new IOException("Truncated public suffix directory");
            }
            IndexedData data = new IndexedData(prefix, imageLength);
            int metadata = data.find(tld);
            if (metadata < 0) {
                return null;
            }
            int offset = readInt(prefix, metadata);
            byte[] shard = new byte[readInt(prefix, metadata + 4)];
            input.getChannel().position(offset);
            if (input.readNBytes(shard, 0, shard.length) != shard.length) {
                throw new IOException("Truncated public suffix shard");
            }
            return inflate(shard, readInt(prefix, metadata + 8), tld);
        }

        private int find(String tld) throws IOException {
            int low = 0;
            int high = entries.length - 1;
            while (low <= high) {
                int middle = (low + high) >>> 1;
                int name = entries[middle] + 2;
                int length = readUnsignedShort(directory, entries[middle]);
                int comparison = compareUTF8(directory, name, length, tld);
                if (comparison < 0) {
                    low = middle + 1;
                } else if (comparison > 0) {
                    high = middle - 1;
                } else {
                    return name + length;
                }
            }
            return -1;
        }

        private static Rules inflate(byte[] bytes, int length, String tld)
                throws IOException {
            ByteArrayInputStream encoded = new ByteArrayInputStream(bytes);
            Inflater inflater = new Inflater();
            try (InflaterInputStream input = new InflaterInputStream(encoded, inflater)) {
                byte[] raw = new byte[length];
                if (input.readNBytes(raw, 0, length) != length || input.read() != -1 ||
                    !inflater.finished() || inflater.getRemaining() != 0 ||
                    encoded.available() != 0) {
                    throw new IOException("Invalid public suffix compressed shard");
                }
                return new Rules(new IndexedRules(raw, tld));
            } finally {
                inflater.end();
            }
        }

        private static int readInt(byte[] bytes, int offset) {
            return (bytes[offset] & 0xff) << 24 |
                   (bytes[offset + 1] & 0xff) << 16 |
                   (bytes[offset + 2] & 0xff) << 8 |
                   bytes[offset + 3] & 0xff;
        }

        private static int readUnsignedShort(byte[] bytes, int offset) {
            return (bytes[offset] & 0xff) << 8 | bytes[offset + 1] & 0xff;
        }

        // The low word is a Unicode scalar; the high word is the next offset.
        private static long decodeUTF8(byte[] bytes, int offset, int end)
                throws IOException {
            int first = bytes[offset++] & 0xff;
            if (first < 0x80) {
                return (long) offset << 32 | first;
            }
            int extra;
            int scalar;
            int minimum;
            if (first >= 0xc2 && first <= 0xdf) {
                extra = 1;
                scalar = first & 0x1f;
                minimum = 0x80;
            } else if (first >= 0xe0 && first <= 0xef) {
                extra = 2;
                scalar = first & 0x0f;
                minimum = 0x800;
            } else if (first >= 0xf0 && first <= 0xf4) {
                extra = 3;
                scalar = first & 7;
                minimum = 0x10000;
            } else {
                throw new IOException("Invalid public suffix UTF-8");
            }
            if (extra > end - offset) {
                throw new IOException("Truncated public suffix UTF-8");
            }
            for (int i = 0; i < extra; i++) {
                int next = bytes[offset++] & 0xff;
                if ((next & 0xc0) != 0x80) {
                    throw new IOException("Invalid public suffix UTF-8 continuation");
                }
                scalar = scalar << 6 | next & 0x3f;
            }
            if (scalar < minimum || scalar > 0x10ffff ||
                (scalar >= 0xd800 && scalar <= 0xdfff)) {
                throw new IOException("Invalid public suffix Unicode scalar");
            }
            return (long) offset << 32 | scalar;
        }

        private static void validateLabel(byte[] bytes, int offset, int length)
                throws IOException {
            if (length == 0) {
                throw new IOException("Empty public suffix label");
            }
            int end = offset + length;
            while (offset < end) {
                long decoded = decodeUTF8(bytes, offset, end);
                int scalar = (int) decoded;
                if (scalar == '.' || scalar == '*') {
                    throw new IOException("Invalid public suffix label");
                }
                offset = (int) (decoded >>> 32);
            }
        }

        // Compare valid stored UTF-8 in String.compareTo's UTF-16 order.
        private static int compareUTF8(byte[] bytes, int offset, int length,
                                       int other, int otherLength)
                throws IOException {
            int end = offset + length;
            int otherEnd = other + otherLength;
            while (offset < end && other < otherEnd) {
                long left = decodeUTF8(bytes, offset, end);
                long right = decodeUTF8(bytes, other, otherEnd);
                int a = (int) left;
                int b = (int) right;
                int firstA = a < 0x10000 ? a : Character.highSurrogate(a);
                int firstB = b < 0x10000 ? b : Character.highSurrogate(b);
                if (firstA != firstB) {
                    return firstA - firstB;
                }
                if (a != b) {
                    return a - b;
                }
                offset = (int) (left >>> 32);
                other = (int) (right >>> 32);
            }
            return offset < end ? 1 : other < otherEnd ? -1 : 0;
        }

        private static int compareUTF8(byte[] bytes, int offset, int length,
                                       String target) throws IOException {
            int end = offset + length;
            int index = 0;
            int pending = -1;
            while (offset < end || pending != -1) {
                if (index == target.length()) {
                    return 1;
                }
                int unit;
                if (pending != -1) {
                    unit = pending;
                    pending = -1;
                } else {
                    long decoded = decodeUTF8(bytes, offset, end);
                    offset = (int) (decoded >>> 32);
                    int scalar = (int) decoded;
                    if (scalar >= 0x10000) {
                        unit = Character.highSurrogate(scalar);
                        pending = Character.lowSurrogate(scalar);
                    } else {
                        unit = scalar;
                    }
                }
                int comparison = unit - target.charAt(index++);
                if (comparison != 0) {
                    return comparison;
                }
            }
            return index < target.length() ? -1 : 0;
        }

        private static String readString(DataInputStream in) throws IOException {
            int length = in.readUnsignedShort();
            byte[] bytes = in.readNBytes(length);
            if (bytes.length != length) {
                throw new IOException("Invalid public suffix label length");
            }
            validateLabel(bytes, 0, length);
            return new String(bytes, UTF_8);
        }
    }

    /** Reversed-label BFS trie, with each node's children in UTF-16 order. */
    private static final class IndexedRules {
        private final String[] labels;
        private final int[] first;
        private final int[] count;
        private final byte[] flags;
        private static final RegisteredDomain.Type[] AUTHS =
            RegisteredDomain.Type.values();

        IndexedRules(byte[] raw, String tld) throws IOException {
            try (DataInputStream in = new DataInputStream(
                    new ByteArrayInputStream(raw))) {
                int size = in.readInt();
                if (size < 1 || size > raw.length / 9) {
                    throw new IOException("Invalid public suffix trie size");
                }
                labels = new String[size];
                first = new int[size];
                count = new int[size];
                flags = new byte[size];
                int next = 1;
                for (int i = 0; i < size; i++) {
                    labels[i] = IndexedData.readString(in);
                    first[i] = in.readInt();
                    count[i] = in.readUnsignedShort();
                    flags[i] = in.readByte();
                    if ((i > 0 && i >= next) || first[i] != next || count[i] < 0 ||
                        count[i] > size - next || (flags[i] & 0xc0) != 0 ||
                        (flags[i] & 3) == 3 || ((flags[i] >>> 2) & 3) == 3 ||
                        ((flags[i] >>> 4) & 3) == 3) {
                        throw new IOException("Invalid public suffix trie node");
                    }
                    next += count[i];
                }
                if (next != size || in.available() != 0 ||
                    !labels[0].equals(tld) || (flags[0] & 0x30) != 0) {
                    throw new IOException("Invalid public suffix trie extent");
                }
                for (int i = 0; i < size; i++) {
                    if (((flags[i] >>> 2) & 3) != 0) {
                        for (int j = first[i]; j < first[i] + count[i]; j++) {
                            if ((flags[j] & 3) != 0) {
                                throw new IOException("Overlapping public suffix rules");
                            }
                        }
                    }
                    for (int j = first[i] + 1; j < first[i] + count[i]; j++) {
                        if (labels[j - 1].compareTo(labels[j]) >= 0) {
                            throw new IOException("Unsorted public suffix children");
                        }
                    }
                }
            }
        }

        Match match(String domain) {
            int node = 0;
            int depth = 1;
            int ordinaryAuth = 0;
            int ordinarySuffix = 0;
            Rule.Type ordinaryType = Rule.Type.NORMAL;
            int exceptionAuth = 0;
            int exceptionSuffix = 0;
            while (true) {
                int suffix = Rules.RuleSet.labels(domain, depth);
                int normal = flags[node] & 3;
                if (normal != 0) {
                    ordinaryAuth = normal;
                    ordinarySuffix = suffix;
                    ordinaryType = Rule.Type.NORMAL;
                }
                int wildcard = (flags[node] >>> 2) & 3;
                if (wildcard != 0 && suffix > 0) {
                    ordinaryAuth = wildcard;
                    ordinarySuffix = Rules.RuleSet.labels(domain, depth + 1);
                    ordinaryType = Rule.Type.WILDCARD;
                }
                int except = (flags[node] >>> 4) & 3;
                if (except != 0) {
                    exceptionAuth = except;
                    exceptionSuffix = Rules.RuleSet.labels(domain, depth - 1);
                }
                int start = Rules.RuleSet.labels(domain, depth + 1);
                if (start < 0 || suffix <= 0) {
                    break;
                }
                int child = findChild(domain, start, suffix - 1, node);
                if (child < 0) {
                    break;
                }
                node = child;
                depth++;
            }
            if (exceptionAuth != 0) {
                return match(domain, Rule.Type.EXCEPTION, exceptionAuth,
                             exceptionSuffix);
            }
            return ordinaryAuth == 0 ? null :
                match(domain, ordinaryType, ordinaryAuth, ordinarySuffix);
        }

        private int findChild(String domain, int start, int end, int node) {
            int low = first[node];
            int high = low + count[node] - 1;
            int length = end - start;
            while (low <= high) {
                int middle = (low + high) >>> 1;
                String label = labels[middle];
                int comparison = 0;
                for (int i = 0; i < Math.min(length, label.length()); i++) {
                    comparison = label.charAt(i) - domain.charAt(start + i);
                    if (comparison != 0) {
                        break;
                    }
                }
                if (comparison == 0) {
                    comparison = label.length() - length;
                }
                if (comparison < 0) {
                    low = middle + 1;
                } else if (comparison > 0) {
                    high = middle - 1;
                } else {
                    return middle;
                }
            }
            return -1;
        }

        private static Match match(String domain, Rule.Type type, int auth,
                                   int suffix) {
            return new CommonMatch(domain, type, AUTHS[auth - 1], suffix);
        }
    }

    private static class Rule {
        enum Type { EXCEPTION, NORMAL, OTHER, WILDCARD }

        String domain;
        Type type;
        RegisteredDomain.Type auth;
        Rule(String domain, Type type, RegisteredDomain.Type auth) {
            this.domain = domain;
            this.type = type;
            this.auth = auth;
        }
    }

    private static class OtherRule extends Rule {
        List<String> labels;
        OtherRule(String domain, RegisteredDomain.Type auth,
                  List<String> labels) {
            super(domain, Type.OTHER, auth);
            this.labels = labels;
        }
    }

    /**
     * Represents a string's match with a rule in the public suffix list.
     */
    private interface Match {
        RegisteredDomain registeredDomain();
        Rule.Type type();
    }

    private static class RegisteredDomainImpl implements RegisteredDomain {
        private final String name;
        private final Type type;
        private final String publicSuffix;
        RegisteredDomainImpl(String name, Type type, String publicSuffix) {
            this.name = name;
            this.type = type;
            this.publicSuffix = publicSuffix;
        }
        @Override
        public String name() {
            return name;
        }
        @Override
        public Type type() {
            return type;
        }
        @Override
        public String publicSuffix() {
            return publicSuffix;
        }
    }

    /**
     * Represents a match against a standard rule in the public suffix list.
     * A standard rule is an explicit name, a wildcard rule with a wildcard
     * only in the leading label, or an exception rule.
     */
    private static class CommonMatch implements Match {
        private final String domain;
        private final int publicSuffix; // index to
        private int registeredDomain; // index to
        private final Rule.Type type;
        private final RegisteredDomain.Type auth;

        CommonMatch(String domain, Rule rule, int publicSuffix) {
            this(domain, rule.type, rule.auth, publicSuffix);
        }

        CommonMatch(String domain, Rule.Type type, RegisteredDomain.Type auth,
                    int publicSuffix) {
            this.domain = domain;
            this.publicSuffix = publicSuffix;
            this.type = type;
            this.auth = auth;
            // now locate the previous label
            registeredDomain = domain.lastIndexOf('.', publicSuffix - 2);
            if (registeredDomain == -1) {
                registeredDomain = 0;
            } else {
                registeredDomain++;
            }
        }

        @Override
        public RegisteredDomain registeredDomain() {
            if (publicSuffix == 0) {
                return null;
            }
            return new RegisteredDomainImpl(domain.substring(registeredDomain),
                                            auth,
                                            domain.substring(publicSuffix));
        }

        @Override
        public Rule.Type type() {
            return type;
        }
    }

    /**
     * Represents a non-match with {@code NO_MATCH} or a match against
     * a non-standard rule in the public suffix list. A non-standard rule
     * is a wildcard rule that includes wildcards in a label other than
     * the leading label. The public suffix list doesn't currently have
     * such rules.
     */
    private static class OtherMatch implements Match {
        private final Rule rule;
        private final int numLabels;
        private final LinkedList<String> target;

        OtherMatch(Rule rule, int numLabels, LinkedList<String> target) {
            this.rule = rule;
            this.numLabels = numLabels;
            this.target = target;
        }

        @Override
        public RegisteredDomain registeredDomain() {
            int nlabels = numLabels + 1;
            if (nlabels > target.size()) {
                // special case when registered domain is same as pub suffix
                return null;
            }
            return new RegisteredDomainImpl(getSuffixes(nlabels),
                                            rule.auth, getSuffixes(numLabels));
        }

        @Override
        public Rule.Type type() {
            return rule.type;
        }

        private String getSuffixes(int n) {
            Iterator<String> targetIter = target.descendingIterator();
            StringBuilder sb = new StringBuilder();
            while (n > 0 && targetIter.hasNext()) {
                String s = targetIter.next();
                sb.insert(0, s);
                if (n > 1) {
                    sb.insert(0, '.');
                }
                n--;
            }
            return sb.toString();
        }
    }
}
