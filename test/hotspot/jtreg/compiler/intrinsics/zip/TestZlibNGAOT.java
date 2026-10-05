/*
 * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @summary Exercise zlib-ng runtime calls across buffer shapes and compilation tiers with GC
 * @requires (os.family == "linux") & (os.arch == "amd64" | os.arch == "aarch64")
 * @run main/othervm -Xmx64m -XX:+UseZlibNG TestZlibNG
 * @run main/othervm -Xmx64m -XX:+UseZlibNG -Xbatch -XX:TieredStopAtLevel=1 TestZlibNG
 * @run main/othervm -Xmx64m -XX:+UseZlibNG -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=1000 TestZlibNG
 * @run main/othervm -Xmx64m -XX:+UseZlibNG -Xint TestZlibNG
 * @run main/othervm -Xmx64m -XX:+UseZlibNG -XX:+UnlockDiagnosticVMOptions -XX:-UseZipIntrinsics TestZlibNG
 * @run main/othervm -Xmx64m -XX:-UseZlibNG TestZlibNG
 */

import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Random;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.zip.Adler32;
import java.util.zip.DataFormatException;
import java.util.zip.Deflater;
import java.util.zip.Inflater;

public class TestZlibNG {
    private static ByteBuffer buffer(byte[] data, boolean direct) {
        ByteBuffer b = direct ? ByteBuffer.allocateDirect(data.length + 17)
                              : ByteBuffer.allocate(data.length + 17);
        b.position(7).put(data).flip().position(7);
        return b.slice().asReadOnlyBuffer();
    }

    private static void roundTrip(byte[] data, boolean directInput, boolean directOutput,
                                  boolean raw, byte[] dictionary, int level) throws Exception {
        ByteArrayOutputStream encoded = new ByteArrayOutputStream();
        try (Deflater d = new Deflater(level, raw)) {
            if (dictionary != null) d.setDictionary(buffer(dictionary, directInput));
            d.setInput(buffer(data, directInput));
            d.finish();
            ByteBuffer output = directOutput ? ByteBuffer.allocateDirect(257) : ByteBuffer.allocate(257);
            while (!d.finished()) {
                output.clear();
                int written = d.deflate(output);
                output.flip();
                while (output.hasRemaining()) encoded.write(output.get());
                if (written == 0 && !d.finished()) throw new AssertionError("deflate stalled");
            }
            if (d.getBytesRead() != data.length || d.getBytesWritten() != encoded.size()) {
                throw new AssertionError("deflate counters");
            }
            d.reset();
            d.setLevel(1);
            d.setStrategy(Deflater.FILTERED);
        }
        ByteArrayOutputStream decoded = new ByteArrayOutputStream();
        try (Inflater i = new Inflater(raw)) {
            if (raw && dictionary != null) i.setDictionary(buffer(dictionary, directInput));
            i.setInput(buffer(encoded.toByteArray(), directInput));
            ByteBuffer output = directOutput ? ByteBuffer.allocateDirect(193) : ByteBuffer.allocate(193);
            while (!i.finished()) {
                output.clear();
                int written = i.inflate(output);
                if (i.needsDictionary()) i.setDictionary(buffer(dictionary, directInput));
                output.flip();
                while (output.hasRemaining()) decoded.write(output.get());
                if (written == 0 && i.needsInput() && !i.finished()) throw new AssertionError("inflate stalled");
            }
            if (i.getBytesRead() != encoded.size() || i.getBytesWritten() != data.length) {
                throw new AssertionError("inflate counters");
            }
            i.reset();
        }
        if (!Arrays.equals(data, decoded.toByteArray())) throw new AssertionError("round trip");
        Adler32 a = new Adler32();
        a.update(data);
        long expected = a.getValue();
        a.reset();
        a.update(buffer(data, directInput));
        if (expected != a.getValue()) throw new AssertionError("Adler32");
    }

    private static void hybridReset() throws Exception {
        for (int badLevel : new int[]{-2, 10}) {
            try {
                new Deflater(badLevel).close();
                throw new AssertionError("invalid level accepted");
            } catch (IllegalArgumentException expected) { }
        }
        int[] lengths = {0, 64, 1024, 1025, 65536, 64, 4096, 0};
        byte[] input = new byte[65536];
        new Random(54321).nextBytes(input);
        byte[] compressed = new byte[70000];
        byte[] output = new byte[70000];
        byte[] dictionary = Arrays.copyOf(input, 2048);
        for (boolean raw : new boolean[]{false, true}) {
            try (Deflater d = new Deflater(6, raw); Inflater i = new Inflater(raw)) {
                if (d.getAdler() != 1) throw new AssertionError("initial Adler32");
                d.reset(); // Also exercise reset before lazy initialization.
                for (int n = 0; n < 160; n++) {
                    int length = lengths[n % lengths.length];
                    boolean dict = n % 3 == 0;
                    d.reset();
                    d.setLevel(n % 10);
                    d.setStrategy(n % 3);
                    if (dict) d.setDictionary(dictionary);
                    d.setInput(input, 0, length);
                    d.finish();
                    int encoded = 0;
                    for (int attempt = 0; !d.finished(); attempt++) {
                        if (attempt == 10) throw new AssertionError("hybrid deflate stalled");
                        encoded += d.deflate(compressed, encoded, compressed.length - encoded);
                    }
                    i.reset();
                    if (raw && dict) i.setDictionary(dictionary);
                    i.setInput(compressed, 0, encoded);
                    int decoded = 0;
                    for (int attempt = 0; !i.finished(); attempt++) {
                        if (attempt == 10) throw new AssertionError("hybrid inflate stalled");
                        decoded += i.inflate(output, decoded, output.length - decoded);
                        if (i.needsDictionary()) i.setDictionary(dictionary);
                    }
                    if (decoded != length || !Arrays.equals(input, 0, length, output, 0, length)) {
                        throw new AssertionError("hybrid reset round trip");
                    }
                }
            }
        }
    }

    public static void main(String[] args) throws Exception {
        hybridReset();
        byte[] data = new byte[4096];
        new Random(12345).nextBytes(data);
        byte[] dictionary = Arrays.copyOfRange(data, 0, 1024);
        // Warm the common runtime call in both JIT tiers.
        try (Deflater d = new Deflater(); Inflater i = new Inflater()) {
            byte[] compressed = new byte[8192];
            byte[] decoded = new byte[4096];
            for (int n = 0; n < 12000; n++) {
                d.reset(); d.setInput(data); d.finish();
                int length = d.deflate(compressed);
                i.reset(); i.setInput(compressed, 0, length);
                int written = i.inflate(decoded);
                if (written != data.length || !Arrays.equals(data, decoded)) {
                    throw new AssertionError("warmup iteration=" + n + " compressed=" + length + " inflated=" + written + " finished=" + i.finished());
                }
            }
        }
        AtomicBoolean done = new AtomicBoolean();
        Thread gc = new Thread(() -> {
            while (!done.get()) {
                System.gc();
                try { Thread.sleep(2); } catch (InterruptedException e) { throw new AssertionError(e); }
            }
        });
        gc.start();
        try {
            for (int n = 0; n < 80; n++) {
                for (boolean directInput : new boolean[]{false, true}) {
                    for (boolean directOutput : new boolean[]{false, true}) {
                        roundTrip(data, directInput, directOutput, (n & 1) == 0,
                                  (n & 2) == 0 ? dictionary : null, n % 10);
                    }
                }
                try (Inflater i = new Inflater()) {
                    i.setInput(new byte[]{0, 0, 0, 0});
                    try {
                        i.inflate(new byte[1024]);
                        throw new AssertionError("expected DataFormatException");
                    } catch (DataFormatException expected) { }
                }
            }
        } finally {
            done.set(true);
            gc.join();
        }
    }
}
/**
 * @test
 * @summary Verify AOT code cache compatibility and ZIP backend initialization
 * @requires os.family == "linux"
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @requires os.simpleArch == "aarch64" | vm.cpu.features ~= ".*avx2.*"
 * @requires vm.cds.supports.aot.code.caching
 * @requires vm.compiler1.enabled & vm.compiler2.enabled
 * @requires vm.compMode != "Xcomp" & vm.compMode != "Xint"
 * @requires vm.opt.VerifyOops == null | vm.opt.VerifyOops == false
 * @library /test/lib
 * @build TestZlibNGAOT ZlibNGAOTApp
 * @run driver jdk.test.lib.helpers.ClassFileInstaller -jar app.jar ZlibNGAOTApp
 * @run driver/timeout=600 TestZlibNGAOT
 */

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.zip.Deflater;
import java.util.zip.Inflater;

import jdk.test.lib.cds.CDSAppTester;
import jdk.test.lib.process.OutputAnalyzer;

public class TestZlibNGAOT {
    public static void main(String[] args) throws Exception {
        for (String flag : List.of("UseZlibNG", "UseZipIntrinsics", "UseAdler32Intrinsics")) {
            for (boolean saved : new boolean[] {false, true}) {
                for (boolean changed : new boolean[] {false, true}) {
                    test(flag, saved, changed);
                }
            }
        }
    }

    private static void test(String flag, boolean saved, boolean changed) throws Exception {
        new CDSAppTester("ZIP-" + flag + "-" + saved + "-" + changed) {
            private boolean value(RunMode mode) {
                return mode == RunMode.PRODUCTION && changed ? !saved : saved;
            }

            @Override
            public String[] vmArgs(RunMode mode) {
                List<String> options = new ArrayList<>(List.of(
                    "-XX:+UnlockDiagnosticVMOptions", "-XX:-AbortVMOnAOTCodeFailure",
                    "-XX:+UseZlibNG", "-XX:+UseZipIntrinsics", "-XX:+UseAdler32Intrinsics",
                    "-Xlog:aot+codecache*=debug",
                    "--add-opens=java.base/java.util.zip=ALL-UNNAMED"));
                options.add("-XX:" + (value(mode) ? "+" : "-") + flag);
                return options.toArray(String[]::new);
            }

            @Override
            public String classpath(RunMode mode) {
                return "app.jar";
            }

            @Override
            public String[] appCommandLine(RunMode mode) {
                boolean enabled = !flag.equals("UseAdler32Intrinsics") ? value(mode) : true;
                return new String[] {"ZlibNGAOTApp", Boolean.toString(enabled)};
            }

            @Override
            public void checkExecution(OutputAnalyzer out, RunMode mode) {
                if (mode == RunMode.ASSEMBLY) {
                    out.shouldMatch("AOT code cache size: [1-9][0-9]+ bytes");
                } else if (mode == RunMode.PRODUCTION) {
                    out.shouldContain("ZIP backend initialized correctly");
                    if (changed) {
                        out.shouldContain("AOT Code Cache disabled: it was created with " + flag +
                            " = " + saved + " vs current " + !saved);
                    } else {
                        out.shouldMatch("Loaded [1-9][0-9]+ AOT code entries from AOT Code Cache");
                    }
                }
            }
        }.runAOTWorkflow("--two-step-training");
    }
}

class ZlibNGAOTApp {
    public static void main(String[] args) throws Exception {
        var field = Class.forName("java.util.zip.ZipUtils")
                         .getDeclaredField("USE_ZIP_INTRINSICS");
        field.setAccessible(true);
        if (field.getBoolean(null) != Boolean.parseBoolean(args[0])) {
            throw new AssertionError("ZIP flag was restored from a different AOT run");
        }

        byte[] input = new byte[65536];
        for (int i = 0; i < input.length; i++) {
            input[i] = (byte) (i % 23);
        }
        byte[] compressed = new byte[input.length + 1024];
        byte[] restored = new byte[input.length];
        try (Deflater deflater = new Deflater(); Inflater inflater = new Inflater()) {
            for (int i = 0; i < 100; i++) {
                deflater.reset();
                deflater.setInput(input);
                deflater.finish();
                int length = deflater.deflate(compressed);
                if (!deflater.finished()) {
                    throw new AssertionError("Incomplete compression");
                }
                inflater.reset();
                inflater.setInput(compressed, 0, length);
                if (inflater.inflate(restored) != input.length || !inflater.finished() ||
                    !Arrays.equals(input, restored)) {
                    throw new AssertionError("Incorrect decompression");
                }
            }
        }
        System.out.println("ZIP backend initialized correctly");
    }
}
