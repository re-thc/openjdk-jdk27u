/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

/* @test
 * @summary Ordinary Java bytecode-intrinsic roots use the direct emitter without special marker semantics
 * @requires vm.compiler1.enabled & (os.arch == "amd64" | os.arch == "x86_64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver DirectBaselineIntrinsicRootTest
 */
import java.lang.reflect.Executable;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class DirectBaselineIntrinsicRootTest {
    static void check(boolean value) { if (!value) throw new AssertionError(); }
    static void await(WhiteBox wb, Executable method) throws Exception {
        long end = System.nanoTime() + 20_000_000_000L;
        while (wb.getMethodCompilationLevel(method) != 1) {
            if (System.nanoTime() > end) throw new AssertionError("missing direct root " + method);
            Thread.sleep(5);
        }
    }
    static void child() throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        Byte small = Byte.valueOf((byte)-117);
        Short signed = Short.valueOf((short)-30201);
        Character wide = Character.valueOf((char)65531);
        Long large = Long.valueOf(0x76543210abcdef01L);
        String original = "bytecode intrinsic identity";
        for (int i = 0; i < 64; i++) {
            check(small.byteValue() == -117 && signed.shortValue() == -30201);
            check(wide.charValue() == 65531 && large.longValue() == 0x76543210abcdef01L);
            String copy = new String(original);
            check(copy != original && copy.equals(original));
            Thread.sleep(1);
        }
        for (Executable method : new Executable[]{
                Byte.class.getDeclaredMethod("byteValue"), Short.class.getDeclaredMethod("shortValue"),
                Character.class.getDeclaredMethod("charValue"), Long.class.getDeclaredMethod("longValue"),
                String.class.getDeclaredConstructor(String.class)}) await(wb, method);
        check(small.byteValue() == -117 && signed.shortValue() == -30201);
        check(wide.charValue() == 65531 && large.longValue() == 0x76543210abcdef01L);
        String installedCopy = new String(original);
        check(installedCopy != original && installedCopy.equals(original));
        try { new String((String)null); throw new AssertionError("missing null constructor exception"); }
        catch (NullPointerException expected) { }
        System.out.println("DIRECT_BYTECODE_INTRINSICS_OK");
    }
    public static void main(String[] args) throws Exception {
        if (args.length != 0) { child(); return; }
        for (String gc : new String[]{"-XX:+UseSerialGC", "-XX:+UseG1GC"}) {
            ProcessTools.executeTestJava("-Xbootclasspath/a:.", "-XX:+UnlockExperimentalVMOptions",
                "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI", "-XX:+UseDirectBaseline",
                "-XX:+TraceDirectBaseline", "-Xmx64m", gc,
                "-XX:CompileCommand=exclude,DirectBaselineIntrinsicRootTest::*",
                "-XX:CompileCommand=dontinline,java.lang.Byte::byteValue",
                "-XX:CompileCommand=dontinline,java.lang.Short::shortValue",
                "-XX:CompileCommand=dontinline,java.lang.Character::charValue",
                "-XX:CompileCommand=dontinline,java.lang.Long::longValue",
                "-XX:CompileCommand=dontinline,java.lang.String::<init>",
                DirectBaselineIntrinsicRootTest.class.getName(), "child")
                .shouldHaveExitValue(0).shouldContain("DIRECT_BYTECODE_INTRINSICS_OK")
                .shouldContain("direct install byteValue()B").shouldContain("direct install shortValue()S")
                .shouldContain("direct install charValue()C").shouldContain("direct install longValue()J")
                .shouldContain("direct install <init>(Ljava/lang/String;)V")
                // Object.<init> still needs its VM finalizer-registration hook.
                .shouldNotContain("direct compile java/lang/Object <init>");
        }
    }
}
