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
 * @summary Typed String conversion roots compile with C1 and preserve Java semantics
 * @requires vm.compiler1.enabled
 * @library /test/lib
 * @modules java.base/jdk.internal.access
 * @build jdk.test.whitebox.WhiteBox TestLatin1UTF8 TestUTF16UTF8 TestUTF8Decode TestStrictUTF8Decode
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run main/othervm -Xbootclasspath/a:. -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI
 *      -Xbatch -XX:TieredStopAtLevel=1
 *      -XX:CompileCommand=dontinline,java.lang.String::encodeUTF8Latin1
 *      -XX:CompileCommand=dontinline,java.lang.String::encodeUTF8UTF16
 *      -XX:CompileCommand=dontinline,java.lang.String::decodeUTF8_UTF16
 *      -XX:CompileCommand=dontinline,java.lang.String::decodeUTF8_UTF16OrThrow
 *      TestStringUTF8C1Roots
 */

import java.lang.reflect.Method;
import jdk.test.whitebox.WhiteBox;

public class TestStringUTF8C1Roots {
    public static void main(String[] args) throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        Method[] methods = {
                String.class.getDeclaredMethod("encodeUTF8Latin1", byte[].class, int.class, byte[].class, int.class),
                String.class.getDeclaredMethod("encodeUTF8UTF16", byte[].class, int.class, byte[].class, int.class, Class.class),
                String.class.getDeclaredMethod("decodeUTF8_UTF16", byte[].class, int.class, int.class, byte[].class, int.class),
                String.class.getDeclaredMethod("decodeUTF8_UTF16OrThrow", byte[].class, int.class, int.class, byte[].class, int.class)
        };
        for (Method method : methods) {
            if (!wb.enqueueMethodForCompilation(method, 1) || wb.getMethodCompilationLevel(method) != 1) {
                throw new AssertionError("C1 compilation failed: " + method);
            }
        }
        TestLatin1UTF8.main(args);
        TestUTF16UTF8.main(args);
        TestUTF8Decode.main(args);
        TestStrictUTF8Decode.main(args);
    }
}
