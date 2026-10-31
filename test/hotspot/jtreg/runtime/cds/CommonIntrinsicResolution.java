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
 * @summary Archive common-intrinsic fallback class and method references consistently
 * @requires vm.cds & vm.gc.Serial & vm.compiler2.enabled & vm.flagless
 * @requires os.simpleArch == "x64" | os.simpleArch == "aarch64"
 * @requires vm.opt.final.UseVectorizedHashCodeIntrinsic == true
 * @library /test/lib
 * @run driver CommonIntrinsicResolution
 */

import jdk.test.lib.cds.CDSOptions;
import jdk.test.lib.cds.CDSTestUtils;
import jdk.test.lib.process.OutputAnalyzer;

public class CommonIntrinsicResolution {
    public static void main(String[] args) throws Exception {
        String archive = "common-intrinsic-resolution.jsa";
        OutputAnalyzer dump = CDSTestUtils.createArchiveAndCheck(new CDSOptions()
                .setArchiveName(archive)
                .addPrefix("-Xint", "-XX:+UseCommonIntrinsics")
                .addSuffix("-XX:+UseSerialGC", "-Xmx128m", "-Xlog:aot+resolve=trace"));

        // Check the state retained in the archive, rather than whether the Java
        // fallback happened to execute during this particular dump. These are
        // symbolic names: constant-pool indices can change with the Java source.
        dump.shouldMatch("archived klass  CP entry \\[ *[0-9]+\\]: java/lang/Long .* => java/lang/Integer ")
            .shouldMatch("archived method CP entry \\[ *[0-9]+\\]: java/lang/Long java/lang/Integer.numberOfLeadingZeros:\\(I\\)I")
            .shouldMatch("archived klass  CP entry \\[ *[0-9]+\\]: jdk/internal/util/ArraysSupport .* => \\[B ")
            .shouldMatch("archived method CP entry \\[ *[0-9]+\\]: jdk/internal/util/ArraysSupport jdk/internal/util/ArraysSupport.unsignedHashCode:");

        for (String common : new String[] {"-XX:+UseCommonIntrinsics", "-XX:-UseCommonIntrinsics"}) {
            CDSTestUtils.run(new CDSOptions()
                .setArchiveName(archive)
                .setXShareMode("on")
                .setUseVersion(false)
                .addPrefix("-Xint", common)
                .addSuffix("-XX:+UseSerialGC", "-Xmx128m", "-cp",
                           System.getProperty("test.classes"), App.class.getName()))
                .assertNormalExit("Common intrinsic archive replay passed");
        }
    }

    public static class App {
        public static void main(String[] args) {
            long[] values = {0, 1, -1, Long.MIN_VALUE, Long.MAX_VALUE, 0xffffffffL, 1L << 32};
            for (long value : values) {
                long n = value;
                int expected = 64;
                while (n != 0) {
                    n >>>= 1;
                    expected--;
                }
                if (Long.numberOfLeadingZeros(value) != expected) {
                    throw new AssertionError("numberOfLeadingZeros: " + value);
                }
            }
            char[] chars = new char[257];
            int expectedHash = 0;
            for (int i = 0; i < chars.length; i++) {
                chars[i] = (char)((i * 31) & 255);
                expectedHash = expectedHash * 31 + chars[i];
            }
            if (new String(chars).hashCode() != expectedHash) {
                throw new AssertionError("unsigned Latin-1 hash");
            }
            System.out.println("Common intrinsic archive replay passed");
        }
    }
}
