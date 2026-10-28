/*
 * Copyright (c) 2013, 2021, Oracle and/or its affiliates. All rights reserved.
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

/**
 * @test CdsDifferentCompactStrings
 * @summary Reject disabled compact strings at startup and in archive headers.
 * @requires vm.cds
 * @library /test/lib
 * @modules java.base/jdk.internal.misc
 *          java.management
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI CdsDifferentCompactStrings
 */

import java.io.File;

import jdk.test.lib.cds.CDSArchiveUtils;
import jdk.test.lib.cds.CDSOptions;
import jdk.test.lib.cds.CDSTestUtils;
import jdk.test.whitebox.WhiteBox;

public class CdsDifferentCompactStrings {
    public static void main(String[] args) throws Exception {
        CDSTestUtils.createArchiveAndCheck("-XX:+CompactStrings");
        CDSTestUtils.runWithArchiveAndCheck();

        // An explicit off request is rejected before the archive is considered.
        CDSTestUtils.runWithArchive("-XX:-CompactStrings")
                .shouldContain("CompactStrings cannot be disabled in this VM")
                .shouldHaveExitValue(1);

        // An off-mode archive must still be rejected independently of flag parsing.
        File archive = CDSArchiveUtils.copyArchiveFile(
                new File(CDSTestUtils.getDefaultArchiveName()), "compact-strings-mismatch.jsa");
        int offset = WhiteBox.getWhiteBox().getCDSOffsetForName("FileMapHeader::_compact_strings");
        CDSArchiveUtils.writeData(archive, offset, new byte[] { 0 });
        CDSTestUtils.run(new CDSOptions().setArchiveName(archive.getPath())
                // Exercise the option check rather than the deliberately stale header CRC.
                .addSuffix("-XX:-VerifySharedSpaces", "-Xlog:cds"))
                .assertAbnormalExit("The shared archive file's CompactStrings setting (disabled)"
                        + " does not equal the current CompactStrings setting (enabled)");
    }
}
