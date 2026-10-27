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
 * @summary The jurisdiction policy files are selected by the names that the
 *          glob "{default,exempt}_*.policy" matches on Unix, and on Windows,
 *          where it ignores case
 * @modules java.base/javax.crypto:+open java.base/sun.nio.fs:+open
 * @run main PolicyFileNameGlob
 */

import java.lang.reflect.Method;
import java.util.List;
import java.util.regex.Pattern;

public class PolicyFileNameGlob {

    private static final String GLOB = "{default,exempt}_*.policy";

    private static final List<String> NAMES = List.of(
            "default_local.policy", "default_US_export.policy",
            "exempt_local.policy", "default_.policy", "exempt_.policy",
            "default_local.POLICY", "default_local.Policy",
            "exempt_local.pOlIcY", "DEFAULT_local.policy",
            "Default_local.policy", "EXEMPT_local.POLICY",
            "default_local.polıcy", "default_local.POLİCY",
            "default.policy", "default_policy", "default_local.polic",
            "default_local.policy.bak", "default_local.policyx",
            "xdefault_local.policy", "exempt.policy", "exemptlocal.policy",
            "default_", "exempt_", ".policy", "", "local.policy",
            "default_.POLICY", "default_x.policy ", " default_x.policy");

    public static void main(String[] args) throws Exception {
        Class<?> jce = Class.forName("javax.crypto.JceSecurity");
        Method isPolicyFileName = jce.getDeclaredMethod(
                "isPolicyFileName", String.class, boolean.class);
        isPolicyFileName.setAccessible(true);

        Class<?> globs = Class.forName("sun.nio.fs.Globs");
        Method toUnix = globs.getDeclaredMethod(
                "toUnixRegexPattern", String.class);
        Method toWindows = globs.getDeclaredMethod(
                "toWindowsRegexPattern", String.class);
        toUnix.setAccessible(true);
        toWindows.setAccessible(true);

        // As UnixFileSystem and WindowsFileSystem compile the glob
        Pattern unix = Pattern.compile((String) toUnix.invoke(null, GLOB));
        Pattern windows = Pattern.compile((String) toWindows.invoke(null, GLOB),
                Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);

        int failures = 0;
        for (String name : NAMES) {
            failures += check(isPolicyFileName, unix, name, false);
            failures += check(isPolicyFileName, windows, name, true);
        }
        if (failures != 0) {
            throw new RuntimeException(failures + " names matched differently");
        }
    }

    private static int check(Method isPolicyFileName, Pattern glob,
            String name, boolean ignoreCase) throws Exception {
        boolean expected = glob.matcher(name).matches();
        boolean actual = (boolean) isPolicyFileName.invoke(null, name,
                ignoreCase);
        System.out.println((ignoreCase ? "windows " : "unix    ") + expected +
                " '" + name + "'");
        if (actual != expected) {
            System.out.println("    FAILED: isPolicyFileName gave " + actual);
            return 1;
        }
        return 0;
    }
}
