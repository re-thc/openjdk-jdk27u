/*
 * Copyright (c) 2014, 2026, Oracle and/or its affiliates. All rights reserved.
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
 * @test id=invalid
 * @bug 8022865
 * @summary Tests for the -XX:CompressedClassSpaceSize command line option
 * @requires vm.bits == 64 & vm.opt.final.UseCompressedOops == true
 * @requires vm.flagless
 * @library /test/lib
 * @modules java.base/jdk.internal.misc java.management
 * @run driver CompressedClassSpaceSize invalid
 */

/*
 * @test id=valid_small
 * @bug 8022865
 * @summary Tests for the -XX:CompressedClassSpaceSize command line option
 * @requires vm.bits == 64 & vm.opt.final.UseCompressedOops == true
 * @requires vm.flagless
 * @library /test/lib
 * @modules java.base/jdk.internal.misc java.management
 * @run driver CompressedClassSpaceSize valid_small
 */

/*
 * @test id=valid_large_nocds
 * @bug 8022865
 * @summary Tests for the -XX:CompressedClassSpaceSize command line option
 * @requires vm.bits == 64 & vm.opt.final.UseCompressedOops == true
 * @requires vm.flagless
 * @library /test/lib
 * @modules java.base/jdk.internal.misc java.management
 * @run driver CompressedClassSpaceSize valid_large_nocds
 */

/*
 * @test id=valid_large_cds
 * @bug 8022865
 * @summary Tests for the -XX:CompressedClassSpaceSize command line option
 * @requires vm.bits == 64 & vm.opt.final.UseCompressedOops == true & vm.cds
 * @requires vm.flagless
 * @library /test/lib
 * @modules java.base/jdk.internal.misc java.management
 * @run driver CompressedClassSpaceSize valid_large_cds
 */

import jdk.test.lib.process.ProcessTools;
import jdk.test.lib.process.OutputAnalyzer;

public class CompressedClassSpaceSize {

    final static long MB = 1024 * 1024;

    final static long minAllowedClassSpaceSize = MB;
    final static long minRealClassSpaceSize = 16 * MB;
    final static long maxClassSpaceSize = 4096 * MB;

    // For the valid_large_cds sub test: we need to have a notion of what archive size to
    // maximally expect, with a generous fudge factor to avoid having to tweak this test
    // ofent. Note: today's default archives are around 16-20 MB.
    final static long maxExpectedArchiveSize = 512 * MB;

    private static void testLargeClassSpace(boolean four, boolean cds) throws Exception {
        String headerOption = "-XX:" + (four ? "+" : "-") + "UseFourByteObjectHeaders";
        String archiveOption = "-XX:SharedArchiveFile=./ccs-" + (four ? "4" : "8") + ".jsa";
        if (cds) {
            new OutputAnalyzer(ProcessTools.createLimitedTestJavaProcessBuilder(
                    headerOption, archiveOption, "-Xshare:dump", "-version").start())
                    .shouldHaveExitValue(0);
        }
        OutputAnalyzer output = new OutputAnalyzer(ProcessTools.createLimitedTestJavaProcessBuilder(
                headerOption, "-XX:+PrintFlagsFinal",
                "-XX:CompressedClassSpaceSize=" + maxClassSpaceSize,
                archiveOption, "-Xshare:" + (cds ? "on" : "off"),
                "-Xlog:metaspace*", "-version").start());
        output.shouldHaveExitValue(0);
        // Unsupported platforms disable the four-byte request. Verify the
        // corresponding encoding limit, retaining the original 4 GiB coverage.
        boolean usesFour = Boolean.parseBoolean(
                output.firstMatch("UseFourByteObjectHeaders\\s+= (true|false)", 1));
        long encodingLimit = usesFour ? 512 * MB : maxClassSpaceSize;
        if (!cds) {
            output.shouldMatch("Compressed class space.*" + encodingLimit);
        } else {
            long reducedSize = Long.parseLong(output.firstMatch(
                    "reducing class space size from " + encodingLimit + " to (\\d+)", 1));
            long archiveAllowance = Math.min(maxExpectedArchiveSize, encodingLimit / 4);
            if (reducedSize < encodingLimit - archiveAllowance || reducedSize >= encodingLimit) {
                output.reportDiagnosticSummary();
                throw new RuntimeException("Unexpected class space after reserving the CDS archive");
            }
            output.shouldMatch("Compressed class space.*" + reducedSize);
        }
    }

    public static void main(String[] args) throws Exception {
        ProcessBuilder pb;
        OutputAnalyzer output;

        switch (args[0]) {
            case "invalid": {
                // < Minimum size
                pb = ProcessTools.createLimitedTestJavaProcessBuilder("-XX:CompressedClassSpaceSize=0",
                        "-version");
                output = new OutputAnalyzer(pb.start());
                output.shouldContain("outside the allowed range")
                        .shouldHaveExitValue(1);

                // Invalid size of -1 should be handled correctly
                pb = ProcessTools.createLimitedTestJavaProcessBuilder("-XX:CompressedClassSpaceSize=-1",
                        "-version");
                output = new OutputAnalyzer(pb.start());
                output.shouldContain("Improperly specified VM option 'CompressedClassSpaceSize=-1'")
                        .shouldHaveExitValue(1);

                // > Maximum size
                pb = ProcessTools.createLimitedTestJavaProcessBuilder("-XX:CompressedClassSpaceSize=" + maxClassSpaceSize + 1,
                        "-version");
                output = new OutputAnalyzer(pb.start());
                output.shouldContain("outside the allowed range")
                        .shouldHaveExitValue(1);
            }
            break;
            case "valid_small": {
                // Make sure the minimum size is set correctly and printed
                // (Note: ccs size are rounded up to the next larger root chunk boundary (16m).
                // Note that this is **reserved** size and does not affect rss.
                pb = ProcessTools.createLimitedTestJavaProcessBuilder("-XX:+UnlockDiagnosticVMOptions",
                        "-XX:CompressedClassSpaceSize=" + minAllowedClassSpaceSize,
                        "-Xlog:gc+metaspace",
                        "-version");
                output = new OutputAnalyzer(pb.start());
                output.shouldMatch("Compressed class space.*" + minRealClassSpaceSize)
                        .shouldHaveExitValue(0);
            }
            break;
            case "valid_large_nocds": {
                testLargeClassSpace(false, false);
                testLargeClassSpace(true, false);
            }
            break;
            case "valid_large_cds": {
                testLargeClassSpace(false, true);
                testLargeClassSpace(true, true);
            }
            break;
            default:
                throw new RuntimeException("invalid sub test " + args[0]);
        }
    }
}
