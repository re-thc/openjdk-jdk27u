/*
 * Copyright (c) 2018, 2025, Oracle and/or its affiliates. All rights reserved.
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
package build.tools.cldrconverter;

import java.io.IOException;
import java.math.BigInteger;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.*;
import java.util.regex.*;

final class CompactPatternPlansGenerator {
    record Input(String locale, String width, String[] patterns) {}
    private CompactPatternPlansGenerator() {}
    private static <T> int intern(List<T> pool, Map<T, Integer> ids, T value) {
        Integer id = ids.get(value);
        if (id != null) return id;
        int next = pool.size();
        if (next > 65535) throw new IllegalArgumentException("compact table exceeds char indices");
        pool.add(value); ids.put(value, next); return next;
    }
    private static void code(StringBuilder data, int value) {
        if (value < 0 || value > 65535) throw new IllegalArgumentException("compact table index: " + value);
        data.append((char) value);
    }
    private static String packed(String data) {
        var out = new StringBuilder("\"");
        for (char ch : data.toCharArray()) {
            if (ch <= 255) out.append(String.format(Locale.ROOT, "\\%03o", (int) ch));
            else out.append(ch);
        }
        return out.append('"').toString();
    }
    private static String quote(String text) {
        var out = new StringBuilder("\"");
        for (char ch : text.toCharArray()) {
            if (ch == '\\' || ch == '"') out.append('\\').append(ch);
            else if (ch < 32) out.append(String.format(Locale.ROOT, "\\%03o", (int) ch));
            else out.append(ch);
        }
        return out.append('"').toString();
    }
    static void generate(Path destination, List<Input> inputs) throws IOException {
        Comparator<List<String>> order = (a,b) -> {
            for (int i=0;i<Math.min(a.size(),b.size());i++) { int c=a.get(i).compareTo(b.get(i)); if(c!=0)return c; }
            return Integer.compare(a.size(),b.size());
        };
        var unique = new TreeMap<List<String>, String[]>(order);
        for (Input input : inputs) {
            String[] p=input.patterns();
            if(p.length<=32 && Arrays.stream(p).allMatch(Objects::nonNull)
                    && Arrays.stream(p).mapToInt(String::length).sum()<=4096)
                unique.putIfAbsent(List.of(p.clone()),p.clone());
        }
        var patterns=new ArrayList<>(unique.values());
        var texts=new ArrayList<String>();var textIds=new HashMap<String,Integer>();
        var rows=new ArrayList<List<String>>();var rowIds=new HashMap<List<String>,Integer>();
        var numbers=new ArrayList<Number>();var numberIds=new HashMap<Number,Integer>();
        var elements=new ArrayList<List<Integer>>();var elementIds=new HashMap<List<Integer>,Integer>();
        var sequences=new ArrayList<List<Integer>>();var sequenceIds=new HashMap<List<Integer>,Integer>();
        var rawKeys=new StringBuilder();var keyOffsets=new StringBuilder();var planSeqs=new StringBuilder();
        var hashes=new TreeMap<Integer,List<Integer>>();
        for(int id=0;id<patterns.size();id++) {
            String[] p=patterns.get(id);code(keyOffsets,rawKeys.length());
            for(String text:p)code(rawKeys,intern(texts,textIds,text));
            var parser=new Parser(p);parser.parse();var sequence=new ArrayList<Integer>();
            for(int i=0;i<p.length;i++) {
                var element=new ArrayList<Integer>();
                element.add(intern(numbers,numberIds,parser.divisors.get(i)));
                for(String key:parser.positivePrefixPatterns.get(i).patternsMap.keySet()) {
                    var row=new ArrayList<String>();row.add(key);
                    for(var list:List.of(parser.positivePrefixPatterns,parser.negativePrefixPatterns,
                            parser.positiveSuffixPatterns,parser.negativeSuffixPatterns,parser.placeHolderPatterns))
                        row.add(list.get(i).patternsMap.get(key));
                    element.add(intern(rows,rowIds,List.copyOf(row)));
                }
                sequence.add(intern(elements,elementIds,List.copyOf(element)));
            }
            code(planSeqs,intern(sequences,sequenceIds,List.copyOf(sequence)));
            hashes.computeIfAbsent(Arrays.hashCode(p),k->new ArrayList<>()).add(id);
        }
        code(keyOffsets,rawKeys.length());
        var seqOffsets=new StringBuilder();var seqData=new StringBuilder();
        for(var sequence:sequences) { code(seqOffsets,seqData.length());for(int e:sequence)code(seqData,e); }
        code(seqOffsets,seqData.length());
        var elemOffsets=new StringBuilder();var elemData=new StringBuilder();
        for(var element:elements) { code(elemOffsets,elemData.length());for(int e:element)code(elemData,e); }
        code(elemOffsets,elemData.length());
        var rowData=new StringBuilder();for(var row:rows)for(String text:row)code(rowData,intern(texts,textIds,text));
        var source=new StringBuilder();
        source.append(CopyrightHeaders.getOpenJDKCopyright(2026).replace(
                "Copyright (c) 2012, 2026, Oracle and/or its affiliates.","Copyright (c) 2026, Teamoffy Pte. Ltd."));
        source.append(CopyrightHeaders.getUnicodeCopyright());
        source.append("// Generated from target CLDR; packed indices are data, not plural/pattern grammar.\npackage java.text;\nfinal class BuiltInCompactPatternPlans {\n");
        String[] names={"KEYS","KEY_OFFSETS","PLAN_SEQUENCES","SEQUENCE_OFFSETS","SEQUENCES","ELEMENT_OFFSETS","ELEMENTS","ROWS"};
        StringBuilder[] tables={rawKeys,keyOffsets,planSeqs,seqOffsets,seqData,elemOffsets,elemData,rowData};
        for(int i=0;i<names.length;i++) {
            String data=tables[i].toString(); int chunks=Math.max(1,(data.length()+7999)/8000);
            for(int c=0;c<chunks;c++)source.append("    private static final String "+names[i]+c+" = "+packed(data.substring(c*8000,Math.min(data.length(),(c+1)*8000)))+";\n");
            source.append("    private static char at"+names[i]+"(int at) { return switch(at/8000) {\n");
            for(int c=0;c<chunks;c++)source.append("case "+c+" -> "+names[i]+c+".charAt(at%8000);\n");
            source.append("default -> throw new AssertionError(at);};}\n");
        }
        source.append("    private static final Number[] NUMBERS = new Number[]{");
        for(Number n:numbers)source.append(n instanceof BigInteger ? "new java.math.BigInteger(\""+n+"\")":n+"L").append(',');
        source.append("};\n");
        source.append("""
            static int size(int plan) { return KEY_OFFSETS.charAt(plan+1)-KEY_OFFSETS.charAt(plan); }
            static int element(int plan,int index) { int s=PLAN_SEQUENCES.charAt(plan);return SEQUENCES.charAt(SEQUENCE_OFFSETS.charAt(s)+index); }
            static Number divisor(int element) { return NUMBERS[ELEMENTS.charAt(ELEMENT_OFFSETS.charAt(element))]; }
            static int count(int element) { return ELEMENT_OFFSETS.charAt(element+1)-ELEMENT_OFFSETS.charAt(element)-1; }
            static String value(int element,int row,int field) { int r=ELEMENTS.charAt(ELEMENT_OFFSETS.charAt(element)+1+row);return text(ROWS.charAt(r*6+field)); }
            private static boolean matches(String[] p,int id) { if(p.length!=size(id))return false;int at=KEY_OFFSETS.charAt(id);for(int i=0;i<p.length;i++)if(!text(KEYS.charAt(at+i)).equals(p[i]))return false;return true; }
            static int lookup(String[] p) { return lookup0(p,java.util.Arrays.hashCode(p)); }
        """);
        var keys=new ArrayList<>(hashes.keySet());int groups=Math.max(1,(keys.size()+31)/32);
        for(int g=0;g<groups;g++) {
            source.append("    private static int lookup"+g+"(String[] p,int h) { switch(h) {\n");
            for(int j=g*32;j<Math.min(keys.size(),(g+1)*32);j++) {
                int hash=keys.get(j);source.append("case "+hash+":\n");
                for(int id:hashes.get(hash))source.append("if(matches(p,"+id+"))return "+id+";\n");
                source.append("return -1;\n");
            }
            source.append("default:return "+(g+1<groups?"lookup"+(g+1)+"(p,h)":"-1")+";} }\n");
        }
        int textGroups=Math.max(1,(texts.size()+127)/128);
        source.append("    private static String text(int id) { return switch(id/128) {\n");
        for(int g=0;g<textGroups;g++)source.append("case "+g+" -> text"+g+"(id);\n");
        source.append("default -> throw new AssertionError(id);};}\n");
        for(int g=0;g<textGroups;g++) {
            source.append("    private static String text"+g+"(int id) { return switch(id) {\n");
            for(int j=g*128;j<Math.min(texts.size(),(g+1)*128);j++)source.append("case "+j+" -> "+quote(texts.get(j))+";\n");
            source.append("default -> throw new AssertionError(id);};}\n");
        }
        source.append("}\n");Path file=destination.resolve("java/text/BuiltInCompactPatternPlans.java");
        Files.createDirectories(file.getParent());String result=source.toString();
        for(String name:names)result=result.replace(name+".charAt(","at"+name+"(");
        Files.writeString(file,result);
        System.out.printf("plans=%d payloads=%d elements=%d rows=%d texts=%d numbers=%d packed_chars=%d%n",patterns.size(),sequences.size(),elements.size(),rows.size(),texts.size(),numbers.size(),Arrays.stream(tables).mapToInt(StringBuilder::length).sum());
    }
    private static final class Parser {
        private final String[] compactPatterns;
        private List<Patterns> positivePrefixPatterns, negativePrefixPatterns,
                positiveSuffixPatterns, negativeSuffixPatterns, placeHolderPatterns;
        private List<Number> divisors;
        Parser(String[] patterns) { compactPatterns = patterns; }
        private static final int RANGE_MULTIPLIER = 10;
        private static final Pattern PLURALS = Pattern.compile("^\\{(?<plurals>.*)}$");
        private static final Pattern COUNT_PATTERN = Pattern.compile("(zero|one|two|few|many|other):((' '|[^ ])+)[ ]*");
        private static final class Patterns {
            final Map<String, String> patternsMap = new HashMap<>();
            void put(String key, String value) { patternsMap.put(key, value); }
        }
    private static final char ZERO_DIGIT = '0';
    private static final char DIGIT = '#';
    private static final char DECIMAL_SEPARATOR = '.';
    private static final char GROUPING_SEPARATOR = ',';
    private static final char MINUS_SIGN = '-';
    private static final char PERCENT = '%';
    private static final char PER_MILLE = '\u2030';
    private static final char SEPARATOR = ';';
    private static final char CURRENCY_SIGN = '\u00A4';
    private static final char QUOTE = 0x27;
    private Number computeDivisor(String minIntDigits, int patternIndex) {
        int count = minIntDigits.length();
        Number matchedValue;
        // The divisor value can go above long range, if the compact patterns
        // goes above index 18, divisor may need to be stored as BigInteger,
        // since long can't store numbers >= 10^19,
        if (patternIndex < 19) {
            matchedValue = (long) Math.pow(RANGE_MULTIPLIER, patternIndex);
        } else {
            matchedValue = BigInteger.valueOf(RANGE_MULTIPLIER).pow(patternIndex);
        }
        Number divisor = matchedValue;
        if (count > 0) {
            if (matchedValue instanceof BigInteger bigValue) {
                if (bigValue.compareTo(BigInteger.valueOf((long) Math.pow(RANGE_MULTIPLIER, count - 1))) < 0) {
                    throw new IllegalArgumentException("Invalid Pattern"
                            + " [" + compactPatterns[patternIndex]
                            + "]: min integer digits specified exceeds the limit"
                            + " for the index " + patternIndex);
                }
                divisor = bigValue.divide(BigInteger.valueOf((long) Math.pow(RANGE_MULTIPLIER, count - 1)));
            } else {
                long longValue = (long) matchedValue;
                if (longValue < (long) Math.pow(RANGE_MULTIPLIER, count - 1)) {
                    throw new IllegalArgumentException("Invalid Pattern"
                            + " [" + compactPatterns[patternIndex]
                            + "]: min integer digits specified exceeds the limit"
                            + " for the index " + patternIndex);
                }
                divisor = longValue / (long) Math.pow(RANGE_MULTIPLIER, count - 1);
            }
        }
        return divisor;
    }

    private void parse() {
        int size = compactPatterns.length;
        positivePrefixPatterns = new ArrayList<>(size);
        negativePrefixPatterns = new ArrayList<>(size);
        positiveSuffixPatterns = new ArrayList<>(size);
        negativeSuffixPatterns = new ArrayList<>(size);
        divisors = new ArrayList<>(size);
        placeHolderPatterns = new ArrayList<>(size);

        for (int index = 0; index < size; index++) {
            String text = compactPatterns[index];
            positivePrefixPatterns.add(new Patterns());
            negativePrefixPatterns.add(new Patterns());
            positiveSuffixPatterns.add(new Patterns());
            negativeSuffixPatterns.add(new Patterns());
            placeHolderPatterns.add(new Patterns());

            // check if it is the old style
            Matcher m = text != null ? PLURALS.matcher(text) : null;
            if (m != null && m.matches()) {
                final int idx = index;
                String plurals = m.group("plurals");
                COUNT_PATTERN.matcher(plurals).results()
                        .forEach(mr -> applyPattern(mr.group(1), mr.group(2), idx));
            } else {
                applyPattern("other", text, index);
            }
        }

    }

    private void applyPattern(String count, String pattern, int index) {

        if (pattern == null) {
            throw new IllegalArgumentException("A null compact pattern" +
                    " encountered at index: " + index);
        }

        int start = 0;
        boolean gotNegative = false;

        String positivePrefix = "";
        String positiveSuffix = "";
        String negativePrefix = "";
        String negativeSuffix = "";
        String zeros = "";
        for (int j = 1; j >= 0 && start < pattern.length(); --j) {

            StringBuilder prefix = new StringBuilder();
            StringBuilder suffix = new StringBuilder();
            boolean inQuote = false;
            // The phase ranges from 0 to 2.  Phase 0 is the prefix.  Phase 1 is
            // the section of the pattern with digits. Phase 2 is the suffix.
            // The separation of the characters into phases is
            // strictly enforced; if phase 1 characters are to appear in the
            // suffix, for example, they must be quoted.
            int phase = 0;

            // The affix is either the prefix or the suffix.
            StringBuilder affix = prefix;

            for (int pos = start; pos < pattern.length(); ++pos) {
                char ch = pattern.charAt(pos);
                switch (phase) {
                    case 0:
                    case 2:
                        // Process the prefix / suffix characters
                        if (inQuote) {
                            // A quote within quotes indicates either the closing
                            // quote or two quotes, which is a quote literal. That
                            // is, we have the second quote in 'do' or 'don''t'.
                            if (ch == QUOTE) {
                                if ((pos + 1) < pattern.length()
                                        && pattern.charAt(pos + 1) == QUOTE) {
                                    ++pos;
                                    affix.append("''"); // 'don''t'
                                } else {
                                    inQuote = false; // 'do'
                                }
                                continue;
                            }
                        } else {
                            // Process unquoted characters seen in prefix or suffix
                            // phase.
                            switch (ch) {
                                case ZERO_DIGIT:
                                    phase = 1;
                                    --pos; // Reprocess this character
                                    continue;
                                case QUOTE:
                                    // A quote outside quotes indicates either the
                                    // opening quote or two quotes, which is a quote
                                    // literal. That is, we have the first quote in 'do'
                                    // or o''clock.
                                    if ((pos + 1) < pattern.length()
                                            && pattern.charAt(pos + 1) == QUOTE) {
                                        ++pos;
                                        affix.append("''"); // o''clock
                                    } else {
                                        inQuote = true; // 'do'
                                    }
                                    continue;
                                case SEPARATOR:
                                    // Don't allow separators before we see digit
                                    // characters of phase 1, and don't allow separators
                                    // in the second pattern (j == 0).
                                    if (phase == 0 || j == 0) {
                                        throw new IllegalArgumentException(
                                                "Unquoted special character '"
                                                + ch + "' in pattern \"" + pattern + "\"");
                                    }
                                    start = pos + 1;
                                    pos = pattern.length();
                                    continue;
                                case MINUS_SIGN:
                                    affix.append("'-");
                                    continue;
                                case DECIMAL_SEPARATOR:
                                case GROUPING_SEPARATOR:
                                case DIGIT:
                                case PERCENT:
                                case PER_MILLE:
                                case CURRENCY_SIGN:
                                    throw new IllegalArgumentException(
                                            "Unquoted special character '" + ch
                                            + "' in pattern \"" + pattern + "\"");
                                default:
                                    break;
                            }
                        }
                        // Note that if we are within quotes, or if this is an
                        // unquoted, non-special character, then we usually fall
                        // through to here.
                        affix.append(ch);
                        break;

                    case 1:
                        // The negative subpattern (j = 0) serves only to specify the
                        // negative prefix and suffix, so all the phase 1 characters,
                        // for example, digits, zeroDigit, groupingSeparator,
                        // decimalSeparator, exponent are ignored
                        if (j == 0) {
                            while (pos < pattern.length()) {
                                char negPatternChar = pattern.charAt(pos);
                                if (negPatternChar == ZERO_DIGIT) {
                                    ++pos;
                                } else {
                                    // Not a phase 1 character, consider it as
                                    // suffix and parse it in phase 2
                                    --pos; //process it again in outer loop
                                    phase = 2;
                                    affix = suffix;
                                    break;
                                }
                            }
                            continue;
                        }
                        // Consider only '0' as valid pattern char which can appear
                        // in number part, rest can be either suffix or prefix
                        if (ch == ZERO_DIGIT) {
                            zeros = zeros + "0";
                        } else {
                            phase = 2;
                            affix = suffix;
                            --pos;
                        }
                        break;
                }
            }

            if (inQuote) {
                throw new IllegalArgumentException("Invalid single quote"
                        + " in pattern \"" + pattern + "\"");
            }

            if (j == 1) {
                positivePrefix = prefix.toString();
                positiveSuffix = suffix.toString();
                negativePrefix = positivePrefix;
                negativeSuffix = positiveSuffix;
            } else {
                negativePrefix = prefix.toString();
                negativeSuffix = suffix.toString();
                gotNegative = true;
            }

            // If there is no negative pattern, or if the negative pattern is
            // identical to the positive pattern, then prepend the minus sign to
            // the positive pattern to form the negative pattern.
            if (!gotNegative
                    || (negativePrefix.equals(positivePrefix)
                    && negativeSuffix.equals(positiveSuffix))) {
                negativeSuffix = positiveSuffix;
                negativePrefix = "'-" + positivePrefix;
            }
        }

        // Only if positive affix exists; else put empty strings
        if (!positivePrefix.isEmpty() || !positiveSuffix.isEmpty()) {
            positivePrefixPatterns.get(index).put(count, positivePrefix);
            negativePrefixPatterns.get(index).put(count, negativePrefix);
            positiveSuffixPatterns.get(index).put(count, positiveSuffix);
            negativeSuffixPatterns.get(index).put(count, negativeSuffix);
            placeHolderPatterns.get(index).put(count, zeros);
            if (divisors.size() <= index) {
                divisors.add(computeDivisor(zeros, index));
            }
        } else {
            positivePrefixPatterns.get(index).put(count, "");
            negativePrefixPatterns.get(index).put(count, "");
            positiveSuffixPatterns.get(index).put(count, "");
            negativeSuffixPatterns.get(index).put(count, "");
            placeHolderPatterns.get(index).put(count, "");
            if (divisors.size() <= index) {
                divisors.add(1L);
            }
        }
    }

    }
}
