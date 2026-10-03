/*
 * Source-only standalone oracle. Run with an UNCHANGED stock JDK after the
 * source checkpoint is saved. All expected text, positions, malformed lengths,
 * underflow and overflow results come from the public CharsetDecoder API.
 * There is no hand-written UTF-8 parser in this oracle.
 */
import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CoderResult;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.Random;

public final class CharsetDecoderProgressOracle {
    private static final int MAX = 4096;
    private static final CodingErrorAction[] ACTIONS = {
        CodingErrorAction.REPORT, CodingErrorAction.REPLACE, CodingErrorAction.IGNORE
    };
    private static DataOutputStream file;
    private static long records;
    private static long protocols;

    // kind: 0 underflow, 1 malformed, 2 overflow. Unmappable is impossible here.
    private record Answer(int consumed, char[] chars, int kind, int errorLength) {}

    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    private static Answer answer(byte[] backing, int start, int length,
                                 int capacity, boolean end, int action) {
        byte[] before = backing.clone();
        ByteBuffer input = ByteBuffer.wrap(backing);
        input.position(2).limit(backing.length - 2);
        input = input.slice();
        input.position(start - 2).limit(start - 2 + length);
        int initialInput = input.position();
        char[] target = new char[capacity + 19];
        Arrays.fill(target, '\u5aa5');
        CharBuffer output = CharBuffer.wrap(target);
        output.position(3).limit(target.length - 3);
        output = output.slice();
        output.position(5).limit(5 + capacity);
        int initialOutput = output.position();
        int firstChar = output.arrayOffset() + initialOutput;
        CharsetDecoder decoder = StandardCharsets.UTF_8.newDecoder()
                .onMalformedInput(ACTIONS[action]).onUnmappableCharacter(ACTIONS[action]);
        CoderResult result = decoder.decode(input, output, end);
        require(result.isUnderflow() || result.isOverflow() || result.isMalformed(),
                "unexpected coder result " + result);
        int written = output.position() - initialOutput;
        require(Arrays.equals(before, backing), "stock decoder changed source");
        for (int i = 0; i < firstChar; ++i) {
            require(target[i] == '\u5aa5', "stock output prefix guard");
        }
        for (int i = firstChar + written; i < target.length; ++i) {
            require(target[i] == '\u5aa5', "stock output tail guard");
        }
        return new Answer(input.position() - initialInput,
                Arrays.copyOfRange(target, firstChar, firstChar + written),
                result.isMalformed() ? 1 : result.isOverflow() ? 2 : 0,
                result.isMalformed() ? result.length() : 0);
    }

    private static byte[] backing(byte[] selected) {
        byte[] result = new byte[selected.length + 8];
        Arrays.fill(result, (byte) 0xff);
        result[3] = (byte) 0xf0;
        // A continuation directly outside the requested end exposes slice leaks.
        result[4 + selected.length] = (byte) 0x80;
        System.arraycopy(selected, 0, result, 4, selected.length);
        return result;
    }

    private static void bytes(byte[] value) throws Exception {
        file.writeInt(value.length);
        file.write(value);
    }

    private static void text(String value) throws Exception {
        bytes(value.getBytes(StandardCharsets.UTF_8));
    }

    private static void chars(char[] value) throws Exception {
        file.writeInt(value.length);
        for (char c : value) file.writeChar(c);
    }

    private static void writeAnswer(Answer value) throws Exception {
        file.writeInt(value.consumed);
        chars(value.chars);
        file.writeInt(value.kind);
        file.writeInt(value.errorLength);
    }

    private static void same(Answer first, Answer second, String context) {
        require(first.consumed == second.consumed && first.kind == second.kind &&
                first.errorLength == second.errorLength &&
                Arrays.equals(first.chars, second.chars), "resume mismatch " + context);
    }

    private static void emit(String name, byte[] selected) throws Exception {
        require(selected.length <= MAX, "kernel input exceeds bound");
        byte[] source = backing(selected);
        Answer partial = answer(source, 4, selected.length, selected.length, false, 0);
        Answer ended = answer(source, 4, selected.length, selected.length, true, 0);
        require(partial.kind != 2 && ended.kind != 2, "worst-case reservation overflow");
        require(partial.consumed == ended.consumed &&
                Arrays.equals(partial.chars, ended.chars), "end flag changed valid prefix");
        int status = partial.consumed == selected.length ? 0 : 1;
        require(status == 0 ? ended.kind == 0 : ended.kind == 1,
                "complete/unresolved mapping");
        file.writeByte(1);
        text(name);
        bytes(source);
        file.writeInt(4);
        file.writeInt(selected.length);
        file.writeInt(status);
        writeAnswer(partial);
        writeAnswer(ended);
        records++;
    }

    // Emulate only the proposed admission and position-commit protocol. The
    // stock decoder computes BOTH the prefix and the remaining public behavior.
    // UTF-8 has no state carried between complete code points. No native code
    // participates in the expected results or the proof of suffix equivalence.
    private static void protocol(String name, byte[] selected, int capacity,
                                  boolean end, int action) throws Exception {
        byte[] source = backing(selected);
        int block = Math.min(MAX, Math.min(selected.length, capacity));
        Answer prefix = answer(source, 4, block, block, false, 0);
        Answer direct = answer(source, 4, selected.length, capacity, end, action);
        Answer suffix = answer(source, 4 + prefix.consumed,
                selected.length - prefix.consumed, capacity - prefix.chars.length, end, action);
        char[] combined = Arrays.copyOf(prefix.chars, prefix.chars.length + suffix.chars.length);
        System.arraycopy(suffix.chars, 0, combined, prefix.chars.length, suffix.chars.length);
        same(direct, new Answer(prefix.consumed + suffix.consumed,
                combined, suffix.kind, suffix.errorLength), name);
        file.writeByte(2);
        text(name);
        bytes(source);
        file.writeInt(4);
        file.writeInt(selected.length);
        file.writeInt(capacity);
        file.writeInt(action);
        file.writeBoolean(end);
        file.writeInt(block);
        file.writeInt(prefix.consumed == block ? 0 : 1);
        writeAnswer(prefix);
        writeAnswer(suffix);
        writeAnswer(direct);
        records++;
        protocols++;
    }

    private static void capacities(String name, byte[] selected) throws Exception {
        LinkedHashSet<Integer> capacities = new LinkedHashSet<>();
        for (int c : new int[] {0, 1, 2, 3, 4, 5, 7, 8, 15, 16, 17, 31, 32, 33,
                Math.max(0, selected.length - 1), selected.length, selected.length + 1}) {
            capacities.add(c);
        }
        for (int capacity : capacities) {
            for (int action = 0; action < ACTIONS.length; ++action) {
                for (boolean end : new boolean[] {false, true}) {
                    protocol(name + "-cap-" + capacity + "-action-" + action + "-end-" + end,
                            selected, capacity, end, action);
                }
            }
        }
    }

    private static byte[] sequence(int... values) {
        byte[] result = new byte[values.length];
        for (int i = 0; i < values.length; ++i) result[i] = (byte) values[i];
        return result;
    }

    private static byte[] ascii(int length) {
        byte[] result = new byte[length];
        Arrays.fill(result, (byte) 'x');
        return result;
    }

    private static byte[] append(byte[] first, byte[] second) {
        byte[] result = Arrays.copyOf(first, first.length + second.length);
        System.arraycopy(second, 0, result, first.length, second.length);
        return result;
    }

    public static void main(String[] args) throws Exception {
        if (args.length != 1) throw new IllegalArgumentException("one output path required");
        try (DataOutputStream output = new DataOutputStream(
                new BufferedOutputStream(new FileOutputStream(args[0])))) {
            file = output;
            file.writeBytes("TMFYDEC1");
            text(System.getProperty("java.runtime.version"));
            text(System.getProperty("java.vendor"));
            text(System.getProperty("java.vm.name"));
            emit("empty", new byte[0]);
            capacities("empty", new byte[0]);
            for (int a = 0; a < 256; ++a) {
                emit("single-" + a, sequence(a));
                for (int b = 0; b < 256; ++b) emit("pair-" + a + "-" + b, sequence(a, b));
            }
            int[] alphabet = {0, 0x41, 0x7f, 0x80, 0x8f, 0x90, 0x9f, 0xa0, 0xbf,
                    0xc0, 0xc1, 0xc2, 0xdf, 0xe0, 0xed, 0xef, 0xf0, 0xf4, 0xf5, 0xff};
            for (int a : alphabet) {
                for (int b : alphabet) {
                    for (int c : alphabet) {
                        for (int d : alphabet) emit("shape-" + a + "-" + b + "-" + c + "-" + d,
                                sequence(a, b, c, d));
                    }
                }
            }
            // Exercise every byte in each continuation position with representative
            // sequence headers, including overlong/surrogate/out-of-range borders.
            for (int lead : new int[] {0xc0, 0xc1, 0xc2, 0xdf, 0xe0, 0xe1, 0xed, 0xef,
                    0xf0, 0xf1, 0xf4, 0xf5, 0xf7, 0xf8, 0xff}) {
                for (int b = 0; b < 256; ++b) {
                    emit("continuation2-" + lead + "-" + b, sequence(lead, b, 0x80, 0x80));
                    emit("continuation3-" + lead + "-" + b, sequence(lead, 0xa0, b, 0x80));
                    emit("continuation4-" + lead + "-" + b, sequence(lead, 0x90, 0x80, b));
                }
            }
            byte[][] patterns = {sequence(0x80), sequence(0xff), sequence(0xc0, 0x80),
                sequence(0xc1, 0xbf), sequence(0xc2), sequence(0xc2, 0x41),
                sequence(0xc2, 0x80), sequence(0xdf, 0xbf), sequence(0xe0, 0x80, 0x80),
                sequence(0xe0, 0xa0, 0x80), sequence(0xed, 0x9f, 0xbf),
                sequence(0xed, 0xa0, 0x80), sequence(0xef, 0xbf, 0xbf),
                sequence(0xe1), sequence(0xe1, 0x80), sequence(0xe1, 0x41),
                sequence(0xe1, 0x80, 0x41), sequence(0xf0, 0x80, 0x80, 0x80),
                sequence(0xf0, 0x90, 0x80, 0x80), sequence(0xf4, 0x8f, 0xbf, 0xbf),
                sequence(0xf4, 0x90, 0x80, 0x80), sequence(0xf5, 0x80, 0x80, 0x80),
                sequence(0xf0), sequence(0xf0, 0x90), sequence(0xf0, 0x90, 0x80),
                sequence(0xf0, 0x41), sequence(0xf0, 0x90, 0x41),
                sequence(0xf0, 0x90, 0x80, 0x41), sequence(0xf8), sequence(0xed, 0xa0)};
            int[] boundaries = {0, 1, 2, 3, 4, 15, 16, 17, 31, 32, 33, 63, 64, 65,
                    79, 80, 81, 127, 128, 129, 255, 256, 257, 511, 512, 513,
                    1023, 1024, 1025, 2047, 2048, 2049, 4092, 4093, 4094, 4095, 4096};
            for (int at : boundaries) {
                emit("ascii-" + at, ascii(at));
                for (int p = 0; p < patterns.length; ++p) {
                    byte[] input = append(ascii(at), patterns[p]);
                    if (input.length <= MAX) emit("boundary-" + at + "-" + p, input);
                    for (int truncated = 1; truncated < patterns[p].length; ++truncated) {
                        byte[] prefix = append(ascii(at), Arrays.copyOf(patterns[p], truncated));
                        if (prefix.length <= MAX) emit("truncated-" + at + "-" + p + "-" + truncated, prefix);
                    }
                    if (at <= 4 || at == 31 || at == 63 || at >= 4092) {
                        capacities("public-" + at + "-" + p, append(input, sequence(0x41)));
                    }
                }
            }
            for (int at = 0; at < MAX; ++at) {
                byte[] input = ascii(MAX);
                input[at] = (byte) 0xff;
                emit("every-error-position-" + at, input);
            }
            for (String text : new String[] {"a", "\u4e2d", "\ud800\udc00", "\udbff\udfff",
                    "a\u007f\u0080\u07ff\u0800\uffff\udbff\udfff"}) {
                byte[] encoded = text.repeat(MAX).getBytes(StandardCharsets.UTF_8);
                for (int length : boundaries) emit("valid-or-cut-" + (int) text.charAt(0) + "-" + length,
                        Arrays.copyOf(encoded, length));
                capacities("many-pairs-" + (int) text.charAt(0), Arrays.copyOf(encoded, 4100));
            }
            Random random = new Random(0x4344454350524f47L);
            for (int trial = 0; trial < 3000; ++trial) {
                byte[] input = new byte[random.nextInt(MAX + 1)];
                random.nextBytes(input);
                emit("random-bytes-" + trial, input);
                StringBuilder valid = new StringBuilder();
                for (int i = 0; i < 256; ++i) {
                    int point;
                    do { point = random.nextInt(0x110000); }
                    while (point >= 0xd800 && point <= 0xdfff);
                    valid.appendCodePoint(point);
                }
                byte[] encoded = valid.toString().getBytes(StandardCharsets.UTF_8);
                emit("random-valid-" + trial, encoded);
                emit("random-cut-" + trial, Arrays.copyOf(encoded, random.nextInt(encoded.length + 1)));
            }
            file.writeByte(0);
            file.writeLong(records);
            file.writeLong(protocols);
        }
        System.out.println("Stock CharsetDecoder oracle records=" + records + " protocols=" + protocols +
                " java=" + System.getProperty("java.runtime.version"));
    }
}
