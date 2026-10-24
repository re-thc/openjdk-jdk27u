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
 * @summary ZIP metadata helpers must not initialize native compression capabilities
 * @library /test/lib
 * @run main MetadataInitialization
 */

import java.nio.file.attribute.FileTime;
import java.util.Arrays;
import java.util.zip.Deflater;
import java.util.zip.Inflater;
import java.util.zip.ZipEntry;
import jdk.test.lib.process.ProcessTools;
import jdk.test.lib.process.OutputAnalyzer;

public class MetadataInitialization {
    public static void main(String[] args) throws Exception {
        if (args.length != 0) {
            if (args[0].equals("metadata")) {
                ZipEntry entry = new ZipEntry("metadata");
                long millis = 1_700_000_000_000L;
                entry.setTime(millis);
                if (entry.getTime() != millis) throw new AssertionError("DOS time");
                FileTime time = FileTime.fromMillis(millis + 123);
                entry.setLastModifiedTime(time);
                entry.setLastAccessTime(time);
                entry.setCreationTime(time);
                if (!entry.getLastModifiedTime().equals(time) ||
                    !entry.getLastAccessTime().equals(time) ||
                    !entry.getCreationTime().equals(time)) throw new AssertionError("FileTime");
            } else {
                byte[] input = new byte[4096];
                Arrays.fill(input, (byte) 71);
                try (Deflater d = new Deflater(6); Inflater i = new Inflater()) {
                    d.setInput(input);
                    d.finish();
                    byte[] encoded = new byte[8192];
                    int n = d.deflate(encoded);
                    if (!d.finished()) throw new AssertionError("finish");
                    i.setInput(encoded, 0, n);
                    byte[] decoded = new byte[input.length];
                    if (i.inflate(decoded) != input.length || !i.finished() ||
                        !Arrays.equals(input, decoded)) throw new AssertionError("round trip");
                }
            }
            System.out.println("PASS " + args[0]);
            return;
        }
        // Directory classpath and disabled sharing keep the child independent of
        // jtreg's JARs. libzip may already be loaded by VM startup; observe the
        // Java capability query itself, not whether the OS library is present.
        for (String mode : new String[]{"metadata", "stream"}) {
            OutputAnalyzer out = ProcessTools.executeTestJava("-Xshare:off",
                "-Xlog:jni+resolve=debug,class+init=info", "-cp",
                System.getProperty("test.classes"), "MetadataInitialization", mode);
            out.shouldHaveExitValue(0).shouldContain("PASS " + mode);
            String query = "java.util.zip.ZipUtils.zipIntrinsicLimits";
            String holder = "java/util/zip/ZipUtils$IntrinsicLimits";
            if (mode.equals("metadata")) {
                out.shouldNotContain(query).shouldNotContain(holder);
            } else {
                out.shouldContain(query).shouldContain(holder);
            }
        }
    }
}
