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
 *
 */

/*
 * @test
 * @summary Existing Base64 and character search roots activate in C1
 * @requires vm.compiler1.enabled
 * @library /test/lib
 * @modules java.base/jdk.internal.access
 * @build jdk.test.whitebox.WhiteBox TestBase64Operations TestCharacterSearch
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -Xbatch -XX:TieredStopAtLevel=1
 *      -XX:CompileCommand=dontinline,java.lang.StringLatin1::indexOfChar0
 *      -XX:CompileCommand=dontinline,java.lang.StringUTF16::indexOfChar0
 *      -XX:CompileCommand=dontinline,java.util.Base64$Encoder::encodeBlock
 *      -XX:CompileCommand=dontinline,java.util.Base64$Decoder::decode0
 *      -XX:CompileCommand=dontinline,java.util.Base64$Decoder::decodeBlock
 *      TestBulkC1Roots
 */

import java.lang.reflect.Method;
import jdk.test.whitebox.WhiteBox;

public class TestBulkC1Roots {
    public static void main(String[] args) throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        Method[] methods = {
                Class.forName("java.lang.StringLatin1").getDeclaredMethod("indexOfChar0", byte[].class, int.class, int.class, int.class),
                Class.forName("java.lang.StringUTF16").getDeclaredMethod("indexOfChar0", byte[].class, int.class, int.class, int.class),
                Class.forName("java.util.Base64$Encoder").getDeclaredMethod("encodeBlock", byte[].class, int.class, int.class, byte[].class, int.class, boolean.class),
                Class.forName("java.util.Base64$Decoder").getDeclaredMethod("decode0", byte[].class, int.class, int.class, byte[].class),
                Class.forName("java.util.Base64$Decoder").getDeclaredMethod("decodeBlock", byte[].class, int.class, int.class, byte[].class, int.class, boolean.class, boolean.class)
        };
        for (Method method : methods) {
            if (!wb.enqueueMethodForCompilation(method, 1) || wb.getMethodCompilationLevel(method) != 1) {
                throw new AssertionError("C1 compilation failed: " + method);
            }
        }
        TestBase64Operations.main(args);
        TestCharacterSearch.main(args);
    }
}
