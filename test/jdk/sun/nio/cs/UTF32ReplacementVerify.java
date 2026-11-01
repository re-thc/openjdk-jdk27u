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
 * @summary Preserve UTF-32 replacement validation and custom charset decoder overrides
 * @modules java.base/sun.nio.cs
 * @run main/othervm UTF32ReplacementVerify
 * @run main/othervm -Xint UTF32ReplacementVerify
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1 UTF32ReplacementVerify
 * @run main/othervm -Xbatch -XX:-TieredCompilation UTF32ReplacementVerify
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics UTF32ReplacementVerify
 */

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HexFormat;
import java.util.List;
import java.util.Random;
import java.util.function.Supplier;

/**
 * Supplemental replacement-validation contract fixture. Run unchanged against
 * original and candidate overlays, then compare the final transcript digest.
 * Requires --add-exports java.base/sun.nio.cs=ALL-UNNAMED for compilation/run.
 */
public class UTF32ReplacementVerify {
    static MessageDigest digest;
    static int cases;
    static final String[] NAMES = {
        "UTF-32", "UTF-32BE", "UTF-32LE", "X-UTF-32BE-BOM", "X-UTF-32LE-BOM"
    };

    static void add(String s) {
        digest.update((s + "\n").getBytes(StandardCharsets.UTF_8));
    }

    static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    static byte[] unit(int cp, boolean little) {
        return ByteBuffer.allocate(4).order(little ? ByteOrder.LITTLE_ENDIAN : ByteOrder.BIG_ENDIAN)
            .putInt(cp).array();
    }

    static byte[] concat(byte[]... parts) {
        int n = 0;
        for (byte[] part : parts) n += part.length;
        byte[] result = new byte[n];
        int p = 0;
        for (byte[] part : parts) {
            System.arraycopy(part, 0, result, p, part.length);
            p += part.length;
        }
        return result;
    }

    static boolean little(Charset cs) {
        return cs.name().contains("LE");
    }

    static String bytes(byte[] a) {
        return a == null ? "null" : HexFormat.of().formatHex(a);
    }

    static String exception(Exception x) {
        return x.getClass().getName() + ":" + x.getMessage();
    }

    static List<byte[]> replacements() {
        List<byte[]> values = new ArrayList<>();
        values.add(null);
        Random random = new Random(0x55aa3201L);
        // Includes every length around both public maxima (4 and 8), partial
        // units, empty, overlength, and longer legal sequences.
        for (int length = 0; length <= 12; length++) {
            values.add(new byte[length]);
            byte[] a = new byte[length];
            random.nextBytes(a);
            values.add(a);
        }
        int[] cps = {0, 'A', 0xfeff, 0xfffe, 0xfffd, 0xd7ff, 0xd800, 0xdfff,
                     0xe000, 0xffff, 0x10000, 0x10ffff, 0x110000, -1};
        for (boolean le : new boolean[] {false, true}) {
            for (int cp : cps) values.add(unit(cp, le));
            values.add(concat(unit(0xfeff, le), unit('A', le)));
            values.add(concat(unit(0xfeff, le), unit(0xfffd, le)));
            values.add(concat(unit('A', le), unit('B', le)));
            values.add(concat(unit('A', le), unit('B', le), unit('C', le)));
            values.add(concat(unit(0xfeff, le), new byte[] {0}));
            values.add(concat(unit(0xfeff, le), new byte[] {0, 0}));
            values.add(concat(unit(0xfeff, le), new byte[] {0, 0, 0}));
        }
        // Deliberate state sequence: an auto-order cached decoder can retain
        // little-endian state; a default fast acceptance must not affect the
        // subsequent fallback reset/BOM behavior.
        values.add(unit(0xfeff, true));
        values.add(unit(0xfffd, false));
        values.add(unit('A', false));
        values.add(unit(0xfeff, false));
        values.add(unit(0xfffd, true));
        values.add(unit('A', true));
        return values;
    }

    static byte[] output(ByteBuffer b) {
        byte[] result = new byte[b.position()];
        b.get(0, result);
        return result;
    }

    static byte[] encodeWhole(CharsetEncoder enc) {
        enc.reset();
        ByteBuffer out = ByteBuffer.allocate(128);
        CharBuffer in = CharBuffer.wrap(new char[] {'A', '\ud800', 'B'});
        CoderResult r = enc.encode(in, out, true);
        require(r.isUnderflow() && !in.hasRemaining(), "whole encode: " + r);
        CoderResult flush = enc.flush(out);
        require(flush.isUnderflow(), "whole flush: " + flush);
        return output(out);
    }

    static void encodingState(CharsetEncoder enc, String label) {
        enc.onMalformedInput(CodingErrorAction.REPLACE)
            .onUnmappableCharacter(CodingErrorAction.REPLACE);
        byte[] expected = encodeWhole(enc);
        require(Arrays.equals(expected, encodeWhole(enc)), label + " reset/BOM changed");

        enc.reset();
        ByteBuffer out = ByteBuffer.allocate(128);
        CharBuffer first = CharBuffer.wrap(new char[] {'A'});
        CoderResult a = enc.encode(first, out, false);
        require(a.isUnderflow() && !first.hasRemaining(), label + " first chunk: " + a);
        int firstBytes = out.position();
        CharBuffer second = CharBuffer.wrap(new char[] {'\ud800', 'B'});
        CoderResult b = enc.encode(second, out, true);
        require(b.isUnderflow() && !second.hasRemaining(), label + " second chunk: " + b);
        CoderResult f = enc.flush(out);
        require(f.isUnderflow(), label + " chunk flush: " + f);
        require(Arrays.equals(expected, output(out)), label + " chunk/reset/BOM mismatch");
        add(label + ":encode=" + bytes(expected) + ":firstBytes=" + firstBytes);
    }

    static void standard(Charset cs) {
        CharsetEncoder enc = cs.newEncoder();
        byte[] expectedDefault = unit(0xfffd, little(cs));
        require(Arrays.equals(enc.replacement(), expectedDefault), cs + " initial default");
        require(enc.isLegalReplacement(expectedDefault), cs + " default legality");
        require(!enc.isLegalReplacement(unit(0xfffd, !little(cs))), cs + " opposite-order default");
        add(cs.name() + ":max=" + enc.maxBytesPerChar() + ":default=" + bytes(enc.replacement()));

        int index = 0;
        for (byte[] input : replacements()) {
            byte[] repl = input == null ? null : input.clone();
            byte[] before = enc.replacement();
            String label = cs.name() + ":" + index++ + ":" + bytes(repl);
            try {
                add(label + ":legal=" + enc.isLegalReplacement(repl));
            } catch (Exception x) {
                add(label + ":legalThrows=" + exception(x));
            }
            require(Arrays.equals(before, enc.replacement()), label + " legality mutated replacement");

            boolean accepted = false;
            try {
                CharsetEncoder result = enc.replaceWith(repl);
                require(result == enc, label + " replaceWith identity");
                accepted = true;
                add(label + ":replace=" + bytes(enc.replacement()));
            } catch (Exception x) {
                add(label + ":replaceThrows=" + exception(x));
                require(Arrays.equals(before, enc.replacement()), label + " rejected change mutated state");
            }
            if (accepted) {
                byte[] saved = repl.clone();
                require(Arrays.equals(saved, enc.replacement()), label + " accepted bytes differ");
                // The candidate must still pass through replaceWith's defensive
                // copy, not install the caller's default byte array by identity.
                repl[0] ^= 1;
                require(Arrays.equals(saved, enc.replacement()), label + " input array retained");
                byte[] returned = enc.replacement();
                returned[0] ^= 1;
                require(Arrays.equals(saved, enc.replacement()), label + " getter array exposed");
                encodingState(enc, label);
            }
            cases++;
        }
    }

    enum Mode { NORMAL, REJECT, OPPOSITE, NULL }

    static final class State {
        final boolean little;
        Mode mode = Mode.NORMAL;
        int factories, decodes, resets;
        // Keep the cached decoder strongly reachable so collection of the
        // superclass WeakReference cannot make invocation counts nondeterministic.
        CharsetDecoder retained;
        State(boolean little) { this.little = little; }
        String counts() { return factories + "/" + decodes + "/" + resets; }
    }

    interface Tracked {
        State state();
        default Charset charset() { return (Charset) this; }
    }

    static final class CountingDecoder extends CharsetDecoder {
        final State state;
        final CharsetDecoder delegate;
        final boolean reject;
        CountingDecoder(Charset owner, State state, CharsetDecoder delegate, boolean reject) {
            super(owner, 0.25f, 1.0f);
            this.state = state;
            this.delegate = delegate;
            this.reject = reject;
        }
        protected CoderResult decodeLoop(ByteBuffer in, CharBuffer out) {
            state.decodes++;
            if (reject) return in.hasRemaining() ? CoderResult.malformedForLength(1) : CoderResult.UNDERFLOW;
            // Validation calls this wrapper with endOfInput=true. Delegation
            // with false permits repeated calls; the wrapper's outer decode
            // still detects remaining partial units at end-of-input.
            return delegate.decode(in, out, false);
        }
        protected void implReset() {
            state.resets++;
            delegate.reset();
        }
    }

    static CharsetDecoder trackedDecoder(Charset owner, State state, CharsetDecoder normal) {
        state.factories++;
        if (state.mode == Mode.NULL) return null;
        CharsetDecoder delegate = state.mode == Mode.OPPOSITE
            ? Charset.forName(state.little ? "UTF-32BE" : "UTF-32LE").newDecoder() : normal;
        state.retained = new CountingDecoder(owner, state, delegate, state.mode == Mode.REJECT);
        return state.retained;
    }

    static final class Tracked32 extends sun.nio.cs.UTF_32 implements Tracked {
        final State state = new State(false);
        public State state() { return state; }
        public CharsetDecoder newDecoder() { return trackedDecoder(this, state, super.newDecoder()); }
    }
    static final class TrackedBE extends sun.nio.cs.UTF_32BE implements Tracked {
        final State state = new State(false);
        public State state() { return state; }
        public CharsetDecoder newDecoder() { return trackedDecoder(this, state, super.newDecoder()); }
    }
    static final class TrackedLE extends sun.nio.cs.UTF_32LE implements Tracked {
        final State state = new State(true);
        public State state() { return state; }
        public CharsetDecoder newDecoder() { return trackedDecoder(this, state, super.newDecoder()); }
    }
    static final class TrackedBEBOM extends sun.nio.cs.UTF_32BE_BOM implements Tracked {
        final State state = new State(false);
        public State state() { return state; }
        public CharsetDecoder newDecoder() { return trackedDecoder(this, state, super.newDecoder()); }
    }
    static final class TrackedLEBOM extends sun.nio.cs.UTF_32LE_BOM implements Tracked {
        final State state = new State(true);
        public State state() { return state; }
        public CharsetDecoder newDecoder() { return trackedDecoder(this, state, super.newDecoder()); }
    }

    static void customs(Supplier<Tracked> factory) {
        for (Mode mode : Mode.values()) {
            Tracked custom = factory.get();
            State state = custom.state();
            state.mode = mode;
            String label = custom.getClass().getSimpleName() + ":" + mode;
            CharsetEncoder enc = null;
            Exception failed = null;
            try { enc = custom.charset().newEncoder(); }
            catch (Exception x) { failed = x; }
            require(state.factories == 1, label + " constructor skipped custom newDecoder: " + state.counts());
            if (mode == Mode.NORMAL) {
                require(failed == null && enc != null, label + " construction failed: " + failed);
                require(state.decodes == 1 && state.resets == 0, label + " constructor validation count: " + state.counts());
                add(label + ":construct=" + state.counts());
                byte[] defaultBytes = unit(0xfffd, state.little);
                require(enc.isLegalReplacement(defaultBytes), label + " custom default rejected");
                require(state.factories == 1 && state.decodes == 2 && state.resets == 1,
                        label + " repeated default bypassed custom decoder: " + state.counts());
                add(label + ":default=" + state.counts());
                enc.replaceWith(defaultBytes);
                require(state.factories == 1 && state.decodes == 3 && state.resets == 2,
                        label + " replace default bypassed custom decoder: " + state.counts());
                add(label + ":replaceDefault=" + state.counts());
                try { enc.isLegalReplacement(null); throw new AssertionError(label + " null accepted"); }
                catch (NullPointerException expected) { add(label + ":null=" + exception(expected)); }
                require(state.factories == 1 && state.decodes == 3 && state.resets == 3,
                        label + " null fallback sequence changed: " + state.counts());
                enc.replaceWith(unit('A', state.little));
                require(state.factories == 1 && state.decodes == 4 && state.resets == 4,
                        label + " cached decoder reuse changed: " + state.counts());
                add(label + ":customReplacement=" + state.counts());
                encodingState(enc, label);
            } else {
                Class<? extends Exception> expected = mode == Mode.NULL
                    ? NullPointerException.class : IllegalArgumentException.class;
                require(failed != null && failed.getClass() == expected,
                        label + " expected " + expected + " but got " + failed);
                require(state.decodes == (mode == Mode.NULL ? 0 : 1) && state.resets == 0,
                        label + " rejection callback count changed: " + state.counts());
                add(label + ":constructThrows=" + exception(failed) + ":calls=" + state.counts());
            }
            cases++;
        }
    }

    public static void main(String[] args) throws Exception {
        digest = MessageDigest.getInstance("SHA-256");
        for (String name : NAMES) standard(Charset.forName(name));
        customs(Tracked32::new);
        customs(TrackedBE::new);
        customs(TrackedLE::new);
        customs(TrackedBEBOM::new);
        customs(TrackedLEBOM::new);
        System.out.println("PASS " + cases + " replacement/custom-subclass cases; "
                           + HexFormat.of().formatHex(digest.digest()));
    }
}
