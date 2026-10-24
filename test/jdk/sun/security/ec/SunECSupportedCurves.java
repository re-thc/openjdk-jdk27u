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
 * @summary The SunEC provider advertises its supported curves without
 *          setting up the table of all curves
 * @library /test/lib
 * @run main SunECSupportedCurves
 */

import java.security.Provider;
import java.security.Security;

import jdk.test.lib.process.OutputAnalyzer;
import jdk.test.lib.process.ProcessTools;

public class SunECSupportedCurves {

    private static final String EXPECTED =
        "[secp256r1,NIST P-256,X9.62 prime256v1,1.2.840.10045.3.1.7]"
        + "|[secp384r1,NIST P-384,1.3.132.0.34]"
        + "|[secp521r1,NIST P-521,1.3.132.0.35]";

    public static void main(String[] args) throws Exception {
        if (args.length > 0) {
            Provider p = Security.getProvider("SunEC");
            String curves = p.getProperty("AlgorithmParameters.EC SupportedCurves");
            if (!EXPECTED.equals(curves)) {
                throw new Exception("Unexpected supported curves: " + curves);
            }
            if (!EXPECTED.equals(p.getService("AlgorithmParameters", "EC")
                    .getAttribute("SupportedCurves"))) {
                throw new Exception("Unexpected supported curves attribute");
            }
            return;
        }

        OutputAnalyzer out = ProcessTools.executeTestJava(
                "-Xlog:class+load=info", SunECSupportedCurves.class.getName(),
                "check");
        out.shouldHaveExitValue(0);
        out.shouldContain("sun.security.ec.SunEC");
        out.shouldNotContain("sun.security.util.CurveDB");
    }
}
