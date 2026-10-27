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
 * @summary A cached class resolution error must survive subsequent class definition by the same loader
 * @requires vm.compiler1.enabled & (os.arch == "amd64" | os.arch == "x86_64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver DirectBaselineResolutionErrorTest
 */
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class DirectBaselineResolutionErrorTest {
    public static class Target { public Target() {} }
    public static class Site {
        public static Object cast(Object x) { return (Target)x; }
        public static boolean test(Object x) { return x instanceof Target; }
    }
    static class Loader extends ClassLoader {
        boolean allowTarget;
        @Override protected Class<?> loadClass(String name, boolean resolve) throws ClassNotFoundException {
            if (!name.equals(Site.class.getName()) && !name.equals(Target.class.getName())) return super.loadClass(name,resolve);
            Class<?> c = findLoadedClass(name);
            if (c == null) {
                if (name.equals(Target.class.getName()) && !allowTarget) throw new ClassNotFoundException(name);
                try (var in = DirectBaselineResolutionErrorTest.class.getResourceAsStream("/"+name.replace('.','/')+".class")) {
                    byte[] bytes = in.readAllBytes(); c = defineClass(name,bytes,0,bytes.length);
                } catch(IOException e) { throw new ClassNotFoundException(name,e); }
            }
            if(resolve) resolveClass(c); return c;
        }
    }
    static void failure(Method method, Object target) throws Exception {
        try { method.invoke(null,target); throw new AssertionError("cached failure bypassed: "+method); }
        catch(InvocationTargetException e) {
            if (!(e.getCause() instanceof NoClassDefFoundError)) throw e;
        }
    }
    static void child() throws Exception {
        WhiteBox wb = WhiteBox.getWhiteBox();
        Loader loader = new Loader();
        Class<?> site = loader.loadClass(Site.class.getName());
        Method cast = site.getMethod("cast",Object.class), test = site.getMethod("test",Object.class);
        failure(cast,new Object()); failure(test,new Object());
        loader.allowTarget = true;
        Object target = loader.loadClass(Target.class.getName()).getConstructor().newInstance();
        for(int i=0;i<64;i++) { failure(cast,target); failure(test,target); Thread.sleep(1); }
        if(wb.getMethodCompilationLevel(cast) != 0 || wb.getMethodCompilationLevel(test) != 0) throw new AssertionError("error site compiled");
        System.out.println("DIRECT_RESOLUTION_ERROR_OK");
    }
    public static void main(String[] args) throws Exception {
        if(args.length != 0) { child(); return; }
        ProcessTools.executeTestJava("-Xbootclasspath/a:.", "-XX:+UnlockExperimentalVMOptions",
            "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI", "-XX:+UseDirectBaseline",
            "-XX:-DirectBaselineDedicatedWorker", "-XX:+TraceDirectBaseline",
            "-XX:CompileCommand=dontinline,DirectBaselineResolutionErrorTest*::*",
            DirectBaselineResolutionErrorTest.class.getName(),"child")
            .shouldHaveExitValue(0).shouldContain("DIRECT_RESOLUTION_ERROR_OK")
            .shouldContain("cast resolution error");
    }
}
