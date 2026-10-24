/*
 * Copyright (c) 1999, 2026, Oracle and/or its affiliates. All rights reserved.
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

/*
 * (C) Copyright Taligent, Inc. 1996, 1997 - All Rights Reserved
 * (C) Copyright IBM Corp. 1996-1998 - All Rights Reserved
 *
 *   The original version of this source code and documentation is copyrighted
 * and owned by Taligent, Inc., a wholly-owned subsidiary of IBM. These
 * materials are provided under terms of a License Agreement between Taligent
 * and Sun. This technology is protected by multiple US and International
 * patents. This notice and attribution to Taligent may not be removed.
 *   Taligent is a registered trademark of Taligent, Inc.
 *
 */

package java.text;

import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashSet;
import java.util.HexFormat;
import java.util.Vector;
import java.util.WeakHashMap;
import jdk.internal.loader.BuiltinClassLoader;
import sun.text.UCompactIntArray;
import sun.text.IntHashtable;
import sun.text.resources.CollationDataIdentity;

/**
 * This class contains the static state of a RuleBasedCollator: The various
 * tables that are used by the collation routines.  Several RuleBasedCollators
 * can share a single RBCollationTables object, easing memory requirements and
 * improving performance.
 */
final class RBCollationTables {
    //===========================================================================================
    //  The following diagram shows the data structure of the RBCollationTables object.
    //  Suppose we have the rule, where 'o-umlaut' is the unicode char 0x00F6.
    //  "a, A < b, B < c, C, ch, cH, Ch, CH < d, D ... < o, O; 'o-umlaut'/E, 'O-umlaut'/E ...".
    //  What the rule says is, sorts 'ch'ligatures and 'c' only with tertiary difference and
    //  sorts 'o-umlaut' as if it's always expanded with 'e'.
    //
    // mapping table                     contracting list           expanding list
    // (contains all unicode char
    //  entries)                   ___    ____________       _________________________
    //  ________                +>|_*_|->|'c' |v('c') |  +>|v('o')|v('umlaut')|v('e')|
    // |_\u0001_|-> v('\u0001') | |_:_|  |------------|  | |-------------------------|
    // |_\u0002_|-> v('\u0002') | |_:_|  |'ch'|v('ch')|  | |             :           |
    // |____:___|               | |_:_|  |------------|  | |-------------------------|
    // |____:___|               |        |'cH'|v('cH')|  | |             :           |
    // |__'a'___|-> v('a')      |        |------------|  | |-------------------------|
    // |__'b'___|-> v('b')      |        |'Ch'|v('Ch')|  | |             :           |
    // |____:___|               |        |------------|  | |-------------------------|
    // |____:___|               |        |'CH'|v('CH')|  | |             :           |
    // |___'c'__|----------------         ------------   | |-------------------------|
    // |____:___|                                        | |             :           |
    // |o-umlaut|----------------------------------------  |_________________________|
    // |____:___|
    //
    // Noted by Helena Shih on 6/23/97
    //============================================================================================

    public RBCollationTables(String rules, int decmp) throws ParseException {
        this.rules = rules;

        BuildAPI data = new BuildAPI();
        new RBTableBuilder(data).build(rules, decmp);
        frenchSec = data.frenchSec;
        seAsianSwapping = data.seAsianSwapping;
        mapping = data.mapping;
        contractTable = data.contractTable;
        expandTable = data.expandTable;
        contractFlags = data.contractFlags;
        maxSecOrder = data.maxSecOrder;
        maxTerOrder = data.maxTerOrder;
    }

    // Load only provider-owned resources. Public
    // RuleBasedCollator constructors always use RBTableBuilder.
    private static final int MAGIC = 0x52424354;
    private static final int SCHEMA = 2;
    private static final String UNICODE_VERSION = "17.0.0";
    private static final int MAX_RESOURCE_BYTES = 32 * 1024 * 1024;
    private static final int MAX_ENTRIES = 1_000_000;
    // Neither the rules nor their tables outlive the collators that own them.
    // In particular, this cache must not defeat Collator's existing soft cache.
    private static final WeakHashMap<String, WeakReference<RBCollationTables>> BUILT_IN =
            new WeakHashMap<>();

    static RBCollationTables forBuiltIn(String rules) throws ParseException {
        RBCollationTables loaded;
        synchronized (BUILT_IN) {
            WeakReference<RBCollationTables> reference = BUILT_IN.get(rules);
            loaded = reference == null ? null : reference.get();
            if (loaded == null) {
                BUILT_IN.remove(rules);
                // Serialize first loads, including loads for different rules,
                // so racing callers materialize each live table only once.
                // Ordinary Collator locale-cache hits do not take this lock.
                loaded = load(rules);
                if (loaded != null) {
                    // Use the table's own exact rules string as the weak key.
                    // A live collator then keeps this key and table reachable.
                    BUILT_IN.put(loaded.rules, new WeakReference<>(loaded));
                }
            }
        }
        // Missing resources retain neither the rules nor a cache entry, and
        // legacy parsing runs outside the shared resource-loading monitor.
        return loaded != null ? loaded :
                new RBCollationTables(rules, Collator.CANONICAL_DECOMPOSITION);
    }

    static String resourceName(String rules) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            for (int i = 0; i < rules.length(); i++) {
                char c = rules.charAt(i);
                digest.update((byte)(c >>> 8));
                digest.update((byte)c);
            }
            return "/sun/text/resources/collation-" +
                    HexFormat.of().formatHex(digest.digest()) + ".bin";
        } catch (NoSuchAlgorithmException e) {
            throw new InternalError(e);
        }
    }

    private static RBCollationTables load(String rules) {
        try (InputStream stream = openResource(resourceName(rules))) {
            if (stream == null) return null;
            byte[] bytes = stream.readNBytes(MAX_RESOURCE_BYTES + 1);
            if (bytes.length > MAX_RESOURCE_BYTES) return null;
            try (DataInputStream in = new DataInputStream(new ByteArrayInputStream(bytes))) {
                return readFrom(in, rules);
            }
        } catch (IOException | IllegalArgumentException e) {
            // Missing, stale, or malformed resources retain the legacy builder.
            return null;
        }
    }

    private static InputStream openResource(String name) throws IOException {
        InputStream stream = RBCollationTables.class.getResourceAsStream(name);
        if (stream != null) return stream;
        Module localedata = ModuleLayer.boot().findModule("jdk.localedata").orElse(null);
        if (localedata != null && localedata.getClassLoader() instanceof BuiltinClassLoader loader) {
            String filename = name.substring(name.lastIndexOf('/') + 1);
            return loader.findResourceAsStream(localedata.getName(),
                    "sun/text/resources/ext/" + filename);
        }
        return null;
    }

    // Package-private build-time codec; no Java object serialization is used.
    void writeTo(DataOutputStream out) throws IOException {
        out.writeInt(MAGIC);
        out.writeInt(SCHEMA);
        writeString(out, UNICODE_VERSION);
        writeString(out, CollationDataIdentity.INPUTS_SHA256);
        writeString(out, rules);
        out.writeBoolean(frenchSec);
        out.writeBoolean(seAsianSwapping);
        out.writeShort(maxSecOrder);
        out.writeShort(maxTerOrder);
        mapping.writeTo(out);
        contractFlags.writeTo(out);
        out.writeInt(contractTable == null ? -1 : contractTable.size());
        if (contractTable != null) {
            for (Vector<EntryPair> list : contractTable) {
                out.writeInt(list.size());
                for (EntryPair pair : list) {
                    writeString(out, pair.entryName);
                    out.writeInt(pair.value);
                    out.writeBoolean(pair.fwd);
                }
            }
        }
        out.writeInt(expandTable == null ? -1 : expandTable.size());
        if (expandTable != null) {
            for (int[] list : expandTable) {
                out.writeInt(list.length);
                for (int value : list) out.writeInt(value);
            }
        }
    }

    static RBCollationTables readFrom(DataInputStream in, String rules) throws IOException {
        if (in.readInt() != MAGIC || in.readInt() != SCHEMA ||
                !UNICODE_VERSION.equals(readString(in)) ||
                !CollationDataIdentity.INPUTS_SHA256.equals(readString(in)) ||
                !rules.equals(readString(in))) {
            throw new IOException("Incompatible collation resource");
        }
        RBCollationTables tables = new RBCollationTables(in, rules);
        if (in.read() != -1) throw new IOException("Trailing collation resource data");
        return tables;
    }

    private RBCollationTables(DataInputStream in, String rules) throws IOException {
        this.rules = rules;
        frenchSec = in.readBoolean();
        seAsianSwapping = in.readBoolean();
        maxSecOrder = in.readShort();
        maxTerOrder = in.readShort();
        mapping = UCompactIntArray.readFrom(in);
        contractFlags = IntHashtable.readFrom(in);
        int count = readCount(in, true);
        contractTable = count == -1 ? null : new Vector<>(count);
        for (int i = 0; i < count; i++) {
            int length = readCount(in, false);
            if (length == 0) throw new IOException("Empty contraction list");
            Vector<EntryPair> list = new Vector<>(length);
            for (int j = 0; j < length; j++) {
                list.add(new EntryPair(readString(in), in.readInt(), in.readBoolean()));
            }
            contractTable.add(list);
        }
        count = readCount(in, true);
        expandTable = count == -1 ? null : new Vector<>(count);
        for (int i = 0; i < count; i++) {
            int length = readCount(in, false);
            if (length == 0) throw new IOException("Empty expansion list");
            int[] list = new int[length];
            for (int j = 0; j < length; j++) list[j] = in.readInt();
            expandTable.add(list);
        }
        // Validate every mapping reference before publishing shared tables.
        for (int c = 0; c <= Character.MAX_CODE_POINT; c++) {
            checkOrder(mapping.elementAt(c));
        }
        if (contractTable != null) {
            for (int i = 0; i < contractTable.size(); i++) {
                validateContractions(i, contractTable.elementAt(i));
            }
        }
        // Expansion elements are emitted directly by the iterator, rather than
        // interpreted as mapping references. Preserve every builder-produced
        // int, including values in the reserved mapping-reference ranges.
    }

    private void validateContractions(int index, Vector<EntryPair> list) throws IOException {
        EntryPair first = list.firstElement();
        String base = first.entryName;
        checkName(base);
        if (!first.fwd || base.length() != Character.charCount(base.codePointAt(0)) ||
                mapping.elementAt(base.codePointAt(0)) != CONTRACTCHARINDEX + index) {
            throw new IOException("Invalid contraction base");
        }
        int longest = list.lastElement().entryName.length();
        HashSet<String> forward = new HashSet<>();
        HashSet<String> backward = new HashSet<>();
        for (int i = 0; i < list.size(); i++) {
            EntryPair pair = list.elementAt(i);
            checkName(pair.entryName);
            if (!pair.entryName.startsWith(base) || pair.entryName.length() > longest ||
                    !(pair.fwd ? forward : backward).add(pair.entryName)) {
                throw new IOException("Invalid contraction name or ordering");
            }
            // Iterators resolve contractions once, then possibly an expansion.
            if (pair.value >= CONTRACTCHARINDEX) {
                throw new IOException("Nested contraction reference");
            }
            checkOrder(pair.value);
            if (i > 0) {
                for (int offset = 0; offset < pair.entryName.length();) {
                    int c = pair.entryName.codePointAt(offset);
                    if (contractFlags.get(c) != 1) {
                        throw new IOException("Missing contraction character flag");
                    }
                    offset += Character.charCount(c);
                }
            }
        }
    }

    private static void checkName(String name) throws IOException {
        if (name.isEmpty()) throw new IOException("Empty contraction name");
        for (int i = 0; i < name.length(); i++) {
            char c = name.charAt(i);
            if (Character.isHighSurrogate(c)) {
                if (++i == name.length() || !Character.isLowSurrogate(name.charAt(i))) {
                    throw new IOException("Malformed contraction name");
                }
            } else if (Character.isLowSurrogate(c)) {
                throw new IOException("Malformed contraction name");
            }
        }
    }

    private void checkOrder(int order) throws IOException {
        if (order < 0 && order != UNMAPPED) {
            throw new IOException("Invalid negative collation order");
        }
        if (order >= CONTRACTCHARINDEX) {
            if (contractTable == null || order - CONTRACTCHARINDEX >= contractTable.size()) {
                throw new IOException("Invalid contraction reference");
            }
        } else if (order >= EXPANDCHARINDEX) {
            if (expandTable == null || order - EXPANDCHARINDEX >= expandTable.size()) {
                throw new IOException("Invalid expansion reference");
            }
        }
    }

    private static int readCount(DataInputStream in, boolean nullable) throws IOException {
        int count = in.readInt();
        if (count < (nullable ? -1 : 0) || count > MAX_ENTRIES) {
            throw new IOException("Invalid collation resource length");
        }
        return count;
    }

    private static String readString(DataInputStream in) throws IOException {
        int length = readCount(in, false);
        char[] chars = new char[length];
        for (int i = 0; i < length; i++) chars[i] = in.readChar();
        return new String(chars);
    }

    private static void writeString(DataOutputStream out, String value) throws IOException {
        if (value.length() > MAX_ENTRIES) throw new IOException("Collation string too long");
        out.writeInt(value.length());
        for (int i = 0; i < value.length(); i++) out.writeChar(value.charAt(i));
    }

    static final class BuildAPI {
        private boolean frenchSec;
        private boolean seAsianSwapping;
        private UCompactIntArray mapping;
        private Vector<Vector<EntryPair>> contractTable;
        private Vector<int[]> expandTable;
        private IntHashtable contractFlags;
        private short maxSecOrder;
        private short maxTerOrder;

        /**
         * Private constructor.  Prevents anyone else besides RBTableBuilder
         * from gaining direct access to the internals of this class.
         */
        private BuildAPI() {
        }

        /**
         * This function is used by RBTableBuilder to fill in all the members of this
         * object.  (Effectively, the builder class functions as a "friend" of this
         * class, but to avoid changing too much of the logic, it carries around "shadow"
         * copies of all these variables until the end of the build process and then
         * copies them en masse into the actual tables object once all the construction
         * logic is complete.  This function does that "copying en masse".
         * @param f2ary The value for frenchSec (the French-secondary flag)
         * @param swap The value for SE Asian swapping rule
         * @param map The collator's character-mapping table (the value for mapping)
         * @param cTbl The collator's contracting-character table (the value for contractTable)
         * @param eTbl The collator's expanding-character table (the value for expandTable)
         * @param cFlgs The hash table of characters that participate in contracting-
         *              character sequences (the value for contractFlags)
         * @param mso The value for maxSecOrder
         * @param mto The value for maxTerOrder
         */
        void fillInTables(boolean f2ary,
                          boolean swap,
                          UCompactIntArray map,
                          Vector<Vector<EntryPair>> cTbl,
                          Vector<int[]> eTbl,
                          IntHashtable cFlgs,
                          short mso,
                          short mto) {
            frenchSec = f2ary;
            seAsianSwapping = swap;
            mapping = map;
            contractTable = cTbl;
            expandTable = eTbl;
            contractFlags = cFlgs;
            maxSecOrder = mso;
            maxTerOrder = mto;
        }
    }

    /**
     * Gets the table-based rules for the collation object.
     * @return returns the collation rules that the table collation object
     * was created from.
     */
    public String getRules()
    {
        return rules;
    }

    public boolean isFrenchSec() {
        return frenchSec;
    }

    public boolean isSEAsianSwapping() {
        return seAsianSwapping;
    }

    // ==============================================================
    // internal (for use by CollationElementIterator)
    // ==============================================================

    /**
     *  Get the entry of hash table of the contracting string in the collation
     *  table.
     *  @param ch the starting character of the contracting string
     */
    Vector<EntryPair> getContractValues(int ch)
    {
        int index = mapping.elementAt(ch);
        return getContractValuesImpl(index - CONTRACTCHARINDEX);
    }

    //get contract values from contractTable by index
    private Vector<EntryPair> getContractValuesImpl(int index)
    {
        if (index >= 0)
        {
            return contractTable.elementAt(index);
        }
        else // not found
        {
            return null;
        }
    }

    /**
     * Returns true if this character appears anywhere in a contracting
     * character sequence.  (Used by CollationElementIterator.setOffset().)
     */
    boolean usedInContractSeq(int c) {
        return contractFlags.get(c) == 1;
    }

    /**
     * Return the maximum length of any expansion sequences that end
     * with the specified comparison order.
     *
     * @param order a collation order returned by previous or next.
     * @return the maximum length of any expansion sequences ending
     *         with the specified order.
     *
     * @see CollationElementIterator#getMaxExpansion
     */
    int getMaxExpansion(int order) {
        int result = 1;

        if (expandTable != null) {
            // Right now this does a linear search through the entire
            // expansion table.  If a collator had a large number of expansions,
            // this could cause a performance problem, but in practise that
            // rarely happens
            for (int i = 0; i < expandTable.size(); i++) {
                int[] valueList = expandTable.elementAt(i);
                int length = valueList.length;

                if (length > result && valueList[length-1] == order) {
                    result = length;
                }
            }
        }

        return result;
    }

    /**
     * Get the entry of hash table of the expanding string in the collation
     * table.
     * @param idx the index of the expanding string value list
     */
    final int[] getExpandValueList(int idx) {
        return expandTable.elementAt(idx - EXPANDCHARINDEX);
    }

    /**
     * Get the comarison order of a character from the collation table.
     * @return the comparison order of a character.
     */
    int getUnicodeOrder(int ch) {
        return mapping.elementAt(ch);
    }

    short getMaxSecOrder() {
        return maxSecOrder;
    }

    short getMaxTerOrder() {
        return maxTerOrder;
    }

    /**
     * Reverse a string.
     */
    //shemran/Note: this is used for secondary order value reverse, no
    //              need to consider supplementary pair.
    static void reverse (StringBuilder result, int from, int to)
    {
        int i = from;
        char swap;

        int j = to - 1;
        while (i < j) {
            swap =  result.charAt(i);
            result.setCharAt(i, result.charAt(j));
            result.setCharAt(j, swap);
            i++;
            j--;
        }
    }

    static final int getEntry(Vector<EntryPair> list, String name, boolean fwd) {
        for (int i = 0; i < list.size(); i++) {
            EntryPair pair = list.elementAt(i);
            if (pair.fwd == fwd && pair.entryName.equals(name)) {
                return i;
            }
        }
        return UNMAPPED;
    }

    // ==============================================================
    // constants
    // ==============================================================
    //sherman/Todo: is the value big enough?????
    static final int EXPANDCHARINDEX = 0x7E000000; // Expand index follows
    static final int CONTRACTCHARINDEX = 0x7F000000;  // contract indexes follow
    static final int UNMAPPED = 0xFFFFFFFF;

    static final int PRIMARYORDERMASK = 0xffff0000;
    static final int SECONDARYORDERMASK = 0x0000ff00;
    static final int TERTIARYORDERMASK = 0x000000ff;
    static final int PRIMARYDIFFERENCEONLY = 0xffff0000;
    static final int SECONDARYDIFFERENCEONLY = 0xffffff00;
    static final int PRIMARYORDERSHIFT = 16;
    static final int SECONDARYORDERSHIFT = 8;

    // ==============================================================
    // instance variables
    // ==============================================================
    private final String rules;
    private final boolean frenchSec;
    private final boolean seAsianSwapping;

    private final UCompactIntArray mapping;
    private final Vector<Vector<EntryPair>> contractTable;
    private final Vector<int[]> expandTable;
    private final IntHashtable contractFlags;

    private final short maxSecOrder;
    private final short maxTerOrder;
}
