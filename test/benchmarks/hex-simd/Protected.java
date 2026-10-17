/* Copyright (c) 2026, Harry Chan. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0 */
import java.security.MessageDigest;
import java.util.HexFormat;
import java.util.HexFormatReference;
import java.util.Random;
import java.util.function.Function;
import java.util.function.Supplier;

/** Fixed workload models for the bounded integration qualification, without I/O. */
public class Protected {
    private static void pair(int size, String name, Supplier<?> reference, Supplier<?> selected) {
        Bench.measure(size, new String[]{name + "-jdk", name + "-native"},
                new Supplier<?>[]{reference, selected});
    }

    private static String invalid(Supplier<?> parser) {
        try {
            parser.get();
            throw new AssertionError("malformed input accepted");
        } catch (IllegalArgumentException expected) {
            return expected.getClass().getName() + ":" + expected.getMessage();
        }
    }

    private static Object mixed(Function<byte[], String> encoder, byte[][] small,
                                byte[] bulk, Object[] results) {
        // Every result escapes, including the small operations in this model.
        for (int i = 0; i < 100; i++) results[i] = encoder.apply(small[i & 3]);
        results[100] = encoder.apply(bulk);
        return results;
    }

    static void run() throws Exception {
        HexFormat h = HexFormat.of(), upper = h.withUpperCase();
        HexFormatReference r = HexFormatReference.of(), upperRef = r.withUpperCase();
        byte[] bulk = new byte[65536], packet = new byte[4096 + 14];
        Random random = new Random(0x483358);
        random.nextBytes(bulk);
        random.nextBytes(packet);
        String text = r.formatHex(bulk), ranged = "!!" + text + "??";
        String bad = text.substring(0, text.length() - 1) + "g";
        String utf16 = text.substring(0, text.length() - 1) + "\u1234";
        MessageDigest referenceDigest = MessageDigest.getInstance("SHA-256");
        MessageDigest selectedDigest = MessageDigest.getInstance("SHA-256");
        pair(bulk.length, "sha256-hex",
                () -> r.formatHex(referenceDigest.digest(bulk)),
                () -> h.formatHex(selectedDigest.digest(bulk)));

        byte[] digest = referenceDigest.digest(bulk);
        HexFormat fingerprint = HexFormat.ofDelimiter(":").withUpperCase();
        HexFormatReference fingerprintRef = HexFormatReference.ofDelimiter(":").withUpperCase();
        pair(digest.length, "fingerprint",
                () -> fingerprintRef.formatHex(digest), () -> fingerprint.formatHex(digest));
        pair(4096, "uppercase-offset-encode",
                () -> upperRef.formatHex(packet, 7, packet.length - 7),
                () -> upper.formatHex(packet, 7, packet.length - 7));
        pair(bulk.length, "offset-decode",
                () -> r.parseHex(ranged, 2, ranged.length() - 2),
                () -> h.parseHex(ranged, 2, ranged.length() - 2));
        pair(bulk.length, "charsequence",
                () -> r.parseHex(new StringBuilder(text)),
                () -> h.parseHex(new StringBuilder(text)));
        pair(4096, "appendable",
                () -> r.formatHex(new StringBuilder(), packet, 7, packet.length - 7),
                () -> h.formatHex(new StringBuilder(), packet, 7, packet.length - 7));
        // Keep parser suppliers outside timing; exception creation and exact
        // diagnostic extraction remain inside each measured public operation.
        Supplier<?> badRef = () -> r.parseHex(bad), badSelected = () -> h.parseHex(bad);
        Supplier<?> utf16Ref = () -> r.parseHex(utf16), utf16Selected = () -> h.parseHex(utf16);
        pair(bulk.length, "late-invalid", () -> invalid(badRef), () -> invalid(badSelected));
        pair(bulk.length, "utf16-invalid", () -> invalid(utf16Ref), () -> invalid(utf16Selected));

        byte[][] small = {new byte[8], new byte[16], new byte[32], new byte[64]};
        for (byte[] bytes : small) random.nextBytes(bytes);
        Object[] referenceResults = new Object[101], selectedResults = new Object[101];
        Function<byte[], String> referenceEncoder = r::formatHex, selectedEncoder = h::formatHex;
        // One reported call is the entire fixed 101-operation workload, with
        // 100 small encodes and one 64 KiB encode. Report plain cases separately.
        pair(bulk.length, "mixed-101", () -> mixed(referenceEncoder, small, bulk, referenceResults),
                () -> mixed(selectedEncoder, small, bulk, selectedResults));
    }
}
