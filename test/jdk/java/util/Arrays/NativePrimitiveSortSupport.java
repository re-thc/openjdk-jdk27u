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

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

class NativePrimitiveSortSupport {
    static Path helper() {
        return Path.of(System.getProperty("test.nativepath"),
                       System.mapLibraryName("NativePrimitiveSortTest")).toAbsolutePath();
    }
    static void load() { System.load(helper().toString()); }
    static boolean supportedBuild() throws Exception {
        String os = System.getProperty("os.name"), arch = System.getProperty("os.arch");
        if (!os.equals("Linux") || !arch.equals("amd64")) {
            System.out.println("SKIP native witness: unsupported platform " + os + "/" + arch);
            return false;
        }
        OutputAnalyzer version = new OutputAnalyzer(ProcessTools.createTestJavaProcessBuilder("-Xinternalversion").start());
        version.shouldHaveExitValue(0);
        if (!version.getOutput().toLowerCase(Locale.ROOT).contains("gcc")) {
            System.out.println("SKIP native witness: library is not built by this compiler: " + version.getOutput());
            return false;
        }
        Path library = Path.of(System.getProperty("test.jdk"), "lib", "libprimitivesort.so");
        if (!Files.isRegularFile(library)) throw new AssertionError("Missing supported-build component: " + library);
        load();
        if (!hasInstrumentation()) {
            System.out.println("SKIP native witness: AVX2/glibc test instrumentation unavailable");
            return false;
        }
        return true;
    }
    static void child(String main, String... options) throws Exception {
        List<String> args = new ArrayList<>(Arrays.asList(options));
        args.add("--enable-native-access=ALL-UNNAMED");
        args.add("-Xmx512m");
        args.add("-agentpath:" + helper());
        args.add("-Dtest.nativepath=" + System.getProperty("test.nativepath"));
        args.add(main); args.add("child");
        ProcessBuilder process = ProcessTools.createTestJavaProcessBuilder(args.toArray(String[]::new));
        String preload = process.environment().get("LD_PRELOAD");
        process.environment().put("LD_PRELOAD", helper() + (preload == null ? "" : ":" + preload));
        OutputAnalyzer result = new OutputAnalyzer(process.start());
        System.out.print(result.getOutput());
        result.shouldHaveExitValue(0);
    }
    static long[] input(int low, int n, long seed, boolean prefix) {
        long[] values = new long[n + low + 19];
        for (int i = 0; i < values.length; i++) {
            seed ^= seed << 13; seed ^= seed >>> 7; seed ^= seed << 17;
            values[i] = seed;
        }
        if (prefix) {
            for (int i = 0; i < 15; i++) values[low + i] = 15 - i;
            values[low + 15] = Long.MAX_VALUE;
        }
        return values;
    }
    static void check(long[] actual, long[] expected) {
        if (!Arrays.equals(actual, expected)) throw new AssertionError("Complete output or range guard mismatch");
    }
    // calls, active, peak_active, live_bytes, peak_bytes, malloc_failures,
    // post-copy declines, calls held inside the original C++ copy.
    static native long[] stats();
    static native boolean hasInstrumentation();
    static native void arm(int mode);
    static native void release();
}
