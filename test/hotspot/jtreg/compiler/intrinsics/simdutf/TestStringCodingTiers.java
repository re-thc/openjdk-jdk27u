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
 * @summary countPositives, Latin-1 inflation and UTF-16 compression give the results of their
 *          Java loops in the interpreter, C1 and C2, and the interpreter and C1 run them as
 *          leaves where the C2 stubs do not exist
 * @requires (os.arch == "aarch64") | (os.arch == "amd64" & vm.cpu.features ~= ".*sse4.2.*")
 * @requires vm.compiler1.enabled & vm.compMode != "Xint"
 * @library /test/lib
 * @modules java.base/java.lang:open
 *          java.base/sun.nio.cs:open
 *          java.base/jdk.internal.access
 *
 * @run main/othervm -Xint
 *      --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/sun.nio.cs=ALL-UNNAMED TestStringCodingTiers light exact
 * @run main/othervm -Xbatch -XX:TieredStopAtLevel=1
 *      --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/sun.nio.cs=ALL-UNNAMED TestStringCodingTiers exact
 * @run main/othervm -Xbatch -XX:-TieredCompilation
 *      --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/sun.nio.cs=ALL-UNNAMED TestStringCodingTiers
 * @run main/othervm -Xbatch
 *      --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/sun.nio.cs=ALL-UNNAMED TestStringCodingTiers
 * @run main/othervm -XX:-UseSIMDUTFIntrinsics -Xbatch -XX:TieredStopAtLevel=1
 *      --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/sun.nio.cs=ALL-UNNAMED TestStringCodingTiers exact
 * @run main/othervm TestStringCodingTiers activation
 */

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.invoke.VarHandle;
import java.nio.ByteOrder;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.regex.Pattern;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class TestStringCodingTiers {
    private static final VarHandle CHARS = MethodHandles.byteArrayViewVarHandle(char[].class, ByteOrder.nativeOrder());
    private static final byte SENTINEL = (byte) 0x5a;
    private static final char CHAR_SENTINEL = 0x5a5a;

    private static final MethodHandle COUNT, INFLATE_CHARS, INFLATE_BYTES, COMPRESS_CHARS, COMPRESS_BYTES,
                                      ISO_CHARS, ISO_BYTES, ASCII_CHARS;
    static {
        try {
            MethodHandles.Lookup coding = MethodHandles.privateLookupIn(Class.forName("java.lang.StringCoding"), MethodHandles.lookup());
            MethodHandles.Lookup latin1 = MethodHandles.privateLookupIn(Class.forName("java.lang.StringLatin1"), MethodHandles.lookup());
            MethodHandles.Lookup utf16 = MethodHandles.privateLookupIn(Class.forName("java.lang.StringUTF16"), MethodHandles.lookup());
            COUNT = coding.findStatic(coding.lookupClass(), "countPositives",
                    MethodType.methodType(int.class, byte[].class, int.class, int.class));
            INFLATE_CHARS = latin1.findStatic(latin1.lookupClass(), "inflate",
                    MethodType.methodType(void.class, byte[].class, int.class, char[].class, int.class, int.class));
            INFLATE_BYTES = latin1.findStatic(latin1.lookupClass(), "inflate",
                    MethodType.methodType(void.class, byte[].class, int.class, byte[].class, int.class, int.class));
            COMPRESS_CHARS = utf16.findStatic(utf16.lookupClass(), "compress",
                    MethodType.methodType(int.class, char[].class, int.class, byte[].class, int.class, int.class));
            COMPRESS_BYTES = utf16.findStatic(utf16.lookupClass(), "compress",
                    MethodType.methodType(int.class, byte[].class, int.class, byte[].class, int.class, int.class));
            // The ISO-8859-1 encoders narrow like compress, and are lenient about their arguments
            ISO_BYTES = coding.findStatic(coding.lookupClass(), "encodeISOArray",
                    MethodType.methodType(int.class, byte[].class, int.class, byte[].class, int.class, int.class));
            // The ASCII encoder stops at the first char above U+007F instead
            ASCII_CHARS = coding.findStatic(coding.lookupClass(), "encodeAsciiArray0",
                    MethodType.methodType(int.class, char[].class, int.class, byte[].class, int.class, int.class));
            Class<?> iso = Class.forName("sun.nio.cs.ISO_8859_1$Encoder");
            MethodHandles.Lookup isoLookup = MethodHandles.privateLookupIn(iso, MethodHandles.lookup());
            ISO_CHARS = isoLookup.findStatic(iso, "encodeISOArray",
                    MethodType.methodType(int.class, char[].class, int.class, byte[].class, int.class, int.class));
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private static final Random RANDOM = new Random(0x5c0d);
    private static int checks;
    // countPositives may return less than the index of the first negative byte, as the C2 stubs of
    // some platforms do. The interpreter and C1 leaves and the Java loop return that index.
    private static boolean exact;

    private static int countPositives(byte[] a, int off, int len) throws Throwable {
        return (int) COUNT.invokeExact(a, off, len);
    }

    private static void inflateChars(byte[] s, int so, char[] d, int dof, int len) throws Throwable {
        INFLATE_CHARS.invokeExact(s, so, d, dof, len);
    }

    private static void inflateBytes(byte[] s, int so, byte[] d, int dof, int len) throws Throwable {
        INFLATE_BYTES.invokeExact(s, so, d, dof, len);
    }

    private static int compressChars(char[] s, int so, byte[] d, int dof, int len) throws Throwable {
        return (int) COMPRESS_CHARS.invokeExact(s, so, d, dof, len);
    }

    private static int compressBytes(byte[] s, int so, byte[] d, int dof, int len) throws Throwable {
        return (int) COMPRESS_BYTES.invokeExact(s, so, d, dof, len);
    }

    private static int isoChars(char[] s, int so, byte[] d, int dof, int len) throws Throwable {
        return (int) ISO_CHARS.invokeExact(s, so, d, dof, len);
    }

    private static int isoBytes(byte[] s, int so, byte[] d, int dof, int len) throws Throwable {
        return (int) ISO_BYTES.invokeExact(s, so, d, dof, len);
    }

    private static int asciiChars(char[] s, int so, byte[] d, int dof, int len) throws Throwable {
        return (int) ASCII_CHARS.invokeExact(s, so, d, dof, len);
    }

    /** The first negative byte of the range, relative to its start, or the length. */
    private static int firstNegative(byte[] a, int off, int len) {
        for (int i = 0; i < len; i++) {
            if (a[off + i] < 0) return i;
        }
        return len;
    }

    private static byte[] latin1Bytes(int size, int firstBad) {
        byte[] a = new byte[size];
        for (int i = 0; i < size; i++) a[i] = (byte) (RANDOM.nextInt(128));
        if (firstBad >= 0 && firstBad < size) {
            a[firstBad] = (byte) (0x80 | RANDOM.nextInt(128));
            for (int i = firstBad + 1; i < size; i++) {
                if (RANDOM.nextInt(4) == 0) a[i] = (byte) RANDOM.nextInt(256);
            }
        }
        return a;
    }

    private static void checkCount(int length, int offset, int bad) throws Throwable {
        byte[] a = latin1Bytes(offset + length + 3, bad < 0 ? -1 : offset + bad);
        int want = firstNegative(a, offset, length);
        int got = countPositives(a, offset, length);
        if (want == length || exact ? got != want : (got < 0 || got > want)) {
            throw new AssertionError("countPositives length=" + length + " offset=" + offset
                    + " bad=" + bad + " got=" + got + " want=" + want);
        }
        checks++;
    }

    private static void checkInflate(int length, int srcOffset, int dstOffset) throws Throwable {
        byte[] src = new byte[srcOffset + length + 3];
        RANDOM.nextBytes(src);
        // char[] destination
        char[] dst = new char[dstOffset + length + 5];
        Arrays.fill(dst, CHAR_SENTINEL);
        inflateChars(src, srcOffset, dst, dstOffset, length);
        for (int i = 0; i < dst.length; i++) {
            char want = (i >= dstOffset && i < dstOffset + length) ? (char) (src[srcOffset + i - dstOffset] & 0xff) : CHAR_SENTINEL;
            if (dst[i] != want) {
                throw new AssertionError("inflate to chars length=" + length + " src=" + srcOffset + " dst=" + dstOffset + " at " + i);
            }
        }
        // UTF-16 byte[] destination, whose offsets count characters
        byte[] bytes = new byte[2 * (dstOffset + length + 5)];
        Arrays.fill(bytes, SENTINEL);
        inflateBytes(src, srcOffset, bytes, dstOffset, length);
        for (int i = 0; i < bytes.length / 2; i++) {
            boolean inside = i >= dstOffset && i < dstOffset + length;
            char got = (char) CHARS.get(bytes, 2 * i);
            char want = inside ? (char) (src[srcOffset + i - dstOffset] & 0xff) : (char) 0x5a5a;
            if (got != want) {
                throw new AssertionError("inflate to bytes length=" + length + " src=" + srcOffset + " dst=" + dstOffset + " at " + i);
            }
        }
        checks += 2;
    }

    private static char[] compressible(int size, int firstBad, char bad) {
        char[] c = new char[size];
        for (int i = 0; i < size; i++) c[i] = (char) RANDOM.nextInt(256);
        if (firstBad >= 0 && firstBad < size) {
            c[firstBad] = bad;
            for (int i = firstBad + 1; i < size; i++) {
                if (RANDOM.nextInt(3) == 0) c[i] = (char) RANDOM.nextInt(0x10000);
            }
        }
        return c;
    }

    /** Chars that are ASCII except for the one at firstBad, which is bad, and random chars after it. */
    private static char[] asciiText(int size, int firstBad, char bad) {
        char[] c = new char[size];
        for (int i = 0; i < size; i++) c[i] = (char) RANDOM.nextInt(0x80);
        if (firstBad >= 0 && firstBad < size) {
            c[firstBad] = bad;
            for (int i = firstBad + 1; i < size; i++) {
                if (RANDOM.nextInt(3) == 0) c[i] = (char) RANDOM.nextInt(0x10000);
            }
        }
        return c;
    }

    private static void checkAscii(int length, int srcOffset, int dstOffset, int bad) throws Throwable {
        char[] badChars = {0x80, 0xff, 0x100, 0xd800, 0xdc00, 0x20ac, 0x8000};
        char[] src = asciiText(srcOffset + length + 3, bad < 0 ? -1 : srcOffset + bad,
                badChars[RANDOM.nextInt(badChars.length)]);
        int want = length;
        for (int i = 0; i < length; i++) {
            if (src[srcOffset + i] >= 0x80) { want = i; break; }
        }
        byte[] dst = new byte[dstOffset + length + 5];
        Arrays.fill(dst, SENTINEL);
        int got = asciiChars(src, srcOffset, dst, dstOffset, length);
        verifyCompress("ascii chars", length, srcOffset, dstOffset, bad, got, want, dst, i -> src[srcOffset + i]);
        checks++;
    }

    private static void checkCompress(int length, int srcOffset, int dstOffset, int bad) throws Throwable {
        char[] badChars = {0x100, 0xff00, 0xd800, 0xdc00, 0x20ac, 0x8000};
        char[] src = compressible(srcOffset + length + 3, bad < 0 ? -1 : srcOffset + bad,
                badChars[RANDOM.nextInt(badChars.length)]);
        int want = length;
        for (int i = 0; i < length; i++) {
            if (src[srcOffset + i] > 0xff) { want = i; break; }
        }
        // char[] source
        byte[] dst = new byte[dstOffset + length + 5];
        Arrays.fill(dst, SENTINEL);
        int got = compressChars(src, srcOffset, dst, dstOffset, length);
        verifyCompress("chars", length, srcOffset, dstOffset, bad, got, want, dst, i -> src[srcOffset + i]);
        // UTF-16 byte[] source
        byte[] packed = new byte[2 * src.length];
        for (int i = 0; i < src.length; i++) CHARS.set(packed, 2 * i, src[i]);
        Arrays.fill(dst, SENTINEL);
        got = compressBytes(packed, srcOffset, dst, dstOffset, length);
        verifyCompress("bytes", length, srcOffset, dstOffset, bad, got, want, dst, i -> src[srcOffset + i]);
        // The ISO-8859-1 encoders narrow the same way
        Arrays.fill(dst, SENTINEL);
        got = isoChars(src, srcOffset, dst, dstOffset, length);
        verifyCompress("iso chars", length, srcOffset, dstOffset, bad, got, want, dst, i -> src[srcOffset + i]);
        Arrays.fill(dst, SENTINEL);
        got = isoBytes(packed, srcOffset, dst, dstOffset, length);
        verifyCompress("iso bytes", length, srcOffset, dstOffset, bad, got, want, dst, i -> src[srcOffset + i]);
        checks += 4;
    }

    private static void verifyCompress(String kind, int length, int srcOffset, int dstOffset, int bad,
                                       int got, int want, byte[] dst, java.util.function.IntUnaryOperator source) {
        String where = "compress " + kind + " length=" + length + " src=" + srcOffset + " dst=" + dstOffset + " bad=" + bad;
        if (got != want) {
            throw new AssertionError(where + " returned " + got + ", expected " + want);
        }
        // The copied prefix is exact, and nothing outside the range changes
        for (int i = 0; i < dst.length; i++) {
            int rel = i - dstOffset;
            if (rel >= 0 && rel < got) {
                if (dst[i] != (byte) source.applyAsInt(rel)) throw new AssertionError(where + " prefix differs at " + rel);
            } else if (rel < 0 || rel >= length) {
                if (dst[i] != SENTINEL) throw new AssertionError(where + " wrote outside the range at " + i);
            }
        }
    }

    private static void differential(boolean light) throws Throwable {
        int[] lengths = {0, 1, 2, 7, 8, 15, 16, 17, 31, 32, 33, 63, 64, 65, 100, 127, 128, 129, 255, 256, 257, 1000, 4099};
        for (int rounds = 0; rounds < (light ? 2 : 12); rounds++) {
            for (int length : lengths) {
                if (light && length > 300) continue;
                int[] bads = {-1, 0, length / 2, Math.max(0, length - 1), length / 3, length};
                for (int bad : bads) {
                    int offset = RANDOM.nextInt(5);
                    checkCount(length, offset, bad);
                    checkCompress(length, RANDOM.nextInt(5), RANDOM.nextInt(5), bad);
                    checkAscii(length, RANDOM.nextInt(5), RANDOM.nextInt(5), bad);
                }
                checkInflate(length, RANDOM.nextInt(5), RANDOM.nextInt(5));
            }
        }
        // Every length with the offender at every position, for the shapes of the vector kernels
        for (int length = 0; length <= (light ? 70 : 140); length++) {
            for (int bad = 0; bad <= length; bad++) {
                checkCount(length, 0, bad);
                checkCompress(length, 0, 0, bad);
                checkAscii(length, 0, 0, bad);
            }
        }
        // Blocks of 2048 chars are checked as a whole: the offender at the block bounds
        for (int length : new int[]{2047, 2048, 2049, 4095, 4096, 4097, 5000}) {
            for (int bad : new int[]{-1, 0, 2046, 2047, 2048, 2049, 4095, 4096, length - 1}) {
                if (bad < length) checkAscii(length, RANDOM.nextInt(3), RANDOM.nextInt(3), bad);
            }
        }
        System.out.println("passed " + checks + " checks");
    }

    /** Runs the work class in a child VM and returns its output. */
    private static OutputAnalyzer run(String mode, String... options) throws Exception {
        String[] all = new String[options.length + 7];
        System.arraycopy(options, 0, all, 0, options.length);
        all[options.length] = "--add-exports=java.base/jdk.internal.access=ALL-UNNAMED";
        all[options.length + 1] = "--add-opens=java.base/java.lang=ALL-UNNAMED";
        all[options.length + 2] = "--add-opens=java.base/sun.nio.cs=ALL-UNNAMED";
        all[options.length + 3] = "-cp";
        all[options.length + 4] = System.getProperty("test.classes");
        all[options.length + 5] = "StringCodingWork";
        all[options.length + 6] = mode;
        OutputAnalyzer output = ProcessTools.executeTestJava(all);
        output.shouldHaveExitValue(0);
        return output;
    }

    private static long nanos(OutputAnalyzer output, String op) {
        var m = Pattern.compile("^" + op + " (\\d+)$", Pattern.MULTILINE).matcher(output.getStdout());
        if (!m.find()) throw new AssertionError("no timing for " + op + " in\n" + output.getStdout());
        return Long.parseLong(m.group(1));
    }

    private static void activation() throws Exception {
        // The results are the same either way, so the interpreter's leaf shows as speed: the
        // same work takes at least ten times longer through its Java bytecodes.
        OutputAnalyzer on = run("interpreter", "-Xint");
        OutputAnalyzer off = run("interpreter", "-Xint", "-XX:-UseSIMDUTFIntrinsics");
        for (String op : List.of("countPositives", "inflateChars", "inflateBytes", "compressChars", "compressBytes",
                "isoChars", "isoBytes", "asciiChars")) {
            long fast = nanos(on, op);
            long slow = nanos(off, op);
            System.out.println(op + ": " + fast + " ns with the leaf, " + slow + " ns without");
            if (slow < 10 * fast) {
                throw new AssertionError(op + " does not reach its interpreter leaf: " + fast + " ns against " + slow + " ns");
            }
        }
        // C1 inlines each boundary as an intrinsic; C2 would also, with its stub, so it is not asked.
        String[] methods = {"StringCoding::countPositives0", "StringLatin1::inflate0", "StringUTF16::compress0",
                            "StringCoding::encodeISOArray0", "ISO_8859_1$Encoder::encodeISOArray0",
                            "StringCoding::encodeAsciiArray0"};
        OutputAnalyzer c1 = run("compiled", "-Xbatch", "-XX:TieredStopAtLevel=1",
                "-XX:+UnlockDiagnosticVMOptions", "-XX:+PrintInlining");
        OutputAnalyzer c1off = run("compiled", "-Xbatch", "-XX:TieredStopAtLevel=1", "-XX:-UseSIMDUTFIntrinsics",
                "-XX:+UnlockDiagnosticVMOptions", "-XX:+PrintInlining");
        for (String method : methods) {
            String intrinsic = Pattern.quote(method) + " \\(\\d+ bytes\\)\\s+\\(?intrinsic\\)?";
            c1.shouldMatch(intrinsic);
            c1off.shouldNotMatch(intrinsic);
        }
    }

    public static void main(String[] args) throws Throwable {
        List<String> options = List.of(args);
        exact = options.contains("exact");
        if (options.contains("activation")) {
            activation();
        } else {
            differential(options.contains("light"));
        }
    }
}

/** The five boundaries through their callers, timed in the interpreter or compiled and inlined. */
class StringCodingWork {
    public static void main(String[] args) throws Throwable {
        String mode = args[0];
        jdk.internal.access.JavaLangAccess jla = jdk.internal.access.SharedSecrets.getJavaLangAccess();
        byte[] ascii = new byte[1 << 20];
        java.util.Arrays.fill(ascii, (byte) 'a');
        char[] chars = new char[ascii.length];
        java.util.Arrays.fill(chars, 'b');
        byte[] latin1 = new byte[ascii.length];
        byte[] utf16 = new byte[2 * ascii.length];
        long sink = 0;
        if (mode.equals("interpreter")) {
            // Entry through the wrappers, as the callers do, once per timing: the bytecodes of the
            // loop being replaced run for a million elements in the slow case.
            Class<?> coding = Class.forName("java.lang.StringCoding");
            Class<?> l1 = Class.forName("java.lang.StringLatin1");
            Class<?> u16 = Class.forName("java.lang.StringUTF16");
            var count = MethodHandles.privateLookupIn(coding, MethodHandles.lookup()).findStatic(coding, "countPositives",
                    MethodType.methodType(int.class, byte[].class, int.class, int.class));
            var inflateC = MethodHandles.privateLookupIn(l1, MethodHandles.lookup()).findStatic(l1, "inflate",
                    MethodType.methodType(void.class, byte[].class, int.class, char[].class, int.class, int.class));
            var inflateB = MethodHandles.privateLookupIn(l1, MethodHandles.lookup()).findStatic(l1, "inflate",
                    MethodType.methodType(void.class, byte[].class, int.class, byte[].class, int.class, int.class));
            var compressC = MethodHandles.privateLookupIn(u16, MethodHandles.lookup()).findStatic(u16, "compress",
                    MethodType.methodType(int.class, char[].class, int.class, byte[].class, int.class, int.class));
            Class<?> iso = Class.forName("sun.nio.cs.ISO_8859_1$Encoder");
            var isoC = MethodHandles.privateLookupIn(iso, MethodHandles.lookup()).findStatic(iso, "encodeISOArray",
                    MethodType.methodType(int.class, char[].class, int.class, byte[].class, int.class, int.class));
            var isoB = MethodHandles.privateLookupIn(coding, MethodHandles.lookup()).findStatic(coding, "encodeISOArray",
                    MethodType.methodType(int.class, byte[].class, int.class, byte[].class, int.class, int.class));
            var asciiC = MethodHandles.privateLookupIn(coding, MethodHandles.lookup()).findStatic(coding, "encodeAsciiArray0",
                    MethodType.methodType(int.class, char[].class, int.class, byte[].class, int.class, int.class));
            // The UTF-16 source of the byte[] variant
            for (int i = 0; i < ascii.length; i++) utf16[2 * i] = (byte) 'c';
            var compressB = MethodHandles.privateLookupIn(u16, MethodHandles.lookup()).findStatic(u16, "compress",
                    MethodType.methodType(int.class, byte[].class, int.class, byte[].class, int.class, int.class));
            // Link every call site on a short range first: linking a method handle costs far
            // more than the work timed below
            sink += (int) count.invoke(ascii, 0, 16);
            inflateC.invoke(ascii, 0, new char[16], 0, 16);
            inflateB.invoke(ascii, 0, new byte[32], 0, 16);
            sink += (int) compressC.invoke(chars, 0, latin1, 0, 16);
            sink += (int) compressB.invoke(utf16, 0, latin1, 0, 16);
            sink += (int) isoC.invoke(chars, 0, latin1, 0, 16);
            sink += (int) isoB.invoke(utf16, 0, latin1, 0, 16);
            sink += (int) asciiC.invoke(chars, 0, latin1, 0, 16);
            int n = 1 << 18;
            char[] dc = new char[n];
            byte[] db = new byte[2 * n];
            // The best of several runs, so that a preemption does not decide the comparison
            long best = Long.MAX_VALUE;
            for (int i = 0; i < 5; i++) {
                long t = System.nanoTime();
                sink += (int) count.invoke(ascii, 0, n);
                best = Math.min(best, System.nanoTime() - t);
            }
            System.out.println("countPositives " + best);
            best = Long.MAX_VALUE;
            for (int i = 0; i < 5; i++) {
                long t = System.nanoTime();
                inflateC.invoke(ascii, 0, dc, 0, n);
                best = Math.min(best, System.nanoTime() - t);
            }
            System.out.println("inflateChars " + best);
            best = Long.MAX_VALUE;
            for (int i = 0; i < 5; i++) {
                long t = System.nanoTime();
                inflateB.invoke(ascii, 0, db, 0, n);
                best = Math.min(best, System.nanoTime() - t);
            }
            System.out.println("inflateBytes " + best);
            best = Long.MAX_VALUE;
            for (int i = 0; i < 5; i++) {
                long t = System.nanoTime();
                sink += (int) compressC.invoke(chars, 0, latin1, 0, n);
                best = Math.min(best, System.nanoTime() - t);
            }
            System.out.println("compressChars " + best);
            best = Long.MAX_VALUE;
            for (int i = 0; i < 5; i++) {
                long t = System.nanoTime();
                sink += (int) compressB.invoke(utf16, 0, latin1, 0, n);
                best = Math.min(best, System.nanoTime() - t);
            }
            System.out.println("compressBytes " + best);
            best = Long.MAX_VALUE;
            for (int i = 0; i < 5; i++) {
                long t = System.nanoTime();
                sink += (int) isoC.invoke(chars, 0, latin1, 0, n);
                best = Math.min(best, System.nanoTime() - t);
            }
            System.out.println("isoChars " + best);
            best = Long.MAX_VALUE;
            for (int i = 0; i < 5; i++) {
                long t = System.nanoTime();
                sink += (int) isoB.invoke(utf16, 0, latin1, 0, n);
                best = Math.min(best, System.nanoTime() - t);
            }
            System.out.println("isoBytes " + best);
            best = Long.MAX_VALUE;
            for (int i = 0; i < 5; i++) {
                long t = System.nanoTime();
                sink += (int) asciiC.invoke(chars, 0, latin1, 0, n);
                best = Math.min(best, System.nanoTime() - t);
            }
            System.out.println("asciiChars " + best);
        } else {
            // Callers of each boundary, hot enough to be compiled and inlined
            String text = "héllo wide world ".repeat(16);
            String wide = "€" + text;
            char[] source = text.toCharArray();
            byte[] bytes = text.substring(0, 200).getBytes(java.nio.charset.StandardCharsets.ISO_8859_1);
            for (int i = 0; i < 30000; i++) {
                sink += jla.countPositives(bytes, 0, bytes.length);
                char[] out = new char[bytes.length];
                jla.inflateBytesToChars(bytes, 0, out, 0, bytes.length);
                sink += out[bytes.length - 1];
                sink += new String(source).length();                     // StringUTF16.compress(char[])
                sink += wide.substring(1).length();                      // StringUTF16.compress(byte[])
                StringBuilder sb = new StringBuilder(text);
                sb.append('€');                                     // StringLatin1.inflate(byte[], byte[])
                sink += sb.length();
                sink += wide.getBytes(java.nio.charset.StandardCharsets.ISO_8859_1).length;   // encodeISOArray0(byte[])
                java.nio.ByteBuffer iso = java.nio.ByteBuffer.allocate(source.length + 8);
                java.nio.charset.StandardCharsets.ISO_8859_1.newEncoder()
                        .encode(java.nio.CharBuffer.wrap(source), iso, true);             // encodeISOArray0(char[])
                sink += iso.position();
                java.nio.ByteBuffer us = java.nio.ByteBuffer.allocate(source.length + 8);
                java.nio.charset.StandardCharsets.US_ASCII.newEncoder()
                        .encode(java.nio.CharBuffer.wrap(source), us, true);              // encodeAsciiArray0
                sink += us.position();
            }
        }
        System.out.println("done " + sink);
    }
}
