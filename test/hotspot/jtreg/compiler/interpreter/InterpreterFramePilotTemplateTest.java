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
 * @summary Copied interpreter-frame helpers preserve roots, branches, casts and both ordinary call steps
 * @requires (os.arch == "amd64" | os.arch == "x86_64") & vm.compiler1.enabled
 * @library /test/lib
 * @modules java.base/jdk.internal.misc
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver InterpreterFramePilotTemplateTest
 */
import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.lang.constant.MethodTypeDesc;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import jdk.internal.misc.Unsafe;
import jdk.test.lib.Platform;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class InterpreterFramePilotTemplateTest {
    static WhiteBox WB;
    public static class Holder { public Object ref=new Object(); }
    static class Run implements Runnable { public void run() { } }
    interface Op { int apply(int x); }
    static class Impl implements Op { public int apply(int x){WB.fullGC();return x+1;} }
    static int helper(int x){WB.fullGC();return x+1;}
    static int direct(int x){return helper(x)+3;}
    static int throughInterface(Op op,int x){return op.apply(x)+5;}
    static int branch(int x){if(x<0)return -7;return 11;}
    static Object cast(Object x){return (Runnable)x;}
    static boolean instance(Object x){return x instanceof Runnable;}
    static void check(boolean ok,String why){if(!ok)throw new AssertionError(why);}
    static class Loader extends ClassLoader { Class<?> define(byte[] bytes){return defineClass(null,bytes,0,bytes.length);} }
    static Method coldField()throws Exception {
        ClassDesc owner=ClassDesc.of("InterpreterFramePilotTemplateTest$Holder");
        byte[] bytes=ClassFile.of().build(ClassDesc.of("PilotTemplateCold"),c -> c.withFlags(ClassFile.ACC_PUBLIC)
            .withMethodBody("read",MethodTypeDesc.of(ClassDesc.of("java.lang.Object"),owner),ClassFile.ACC_PUBLIC|ClassFile.ACC_STATIC,
                m -> m.aload(0).getfield(owner,"ref",ClassDesc.of("java.lang.Object")).areturn()));
        Class<?> klass=new Loader().define(bytes);WB.linkClass(klass);return klass.getMethod("read",Holder.class);
    }
    static void child()throws Exception {
        WB=WhiteBox.getWhiteBox();Unsafe u=Unsafe.getUnsafe();
        check(WB.getBooleanVMFlag("ProfileInterpreter"),"profiling fragments emit real code");
        Method direct=InterpreterFramePilotTemplateTest.class.getDeclaredMethod("direct",int.class);
        Method iface=InterpreterFramePilotTemplateTest.class.getDeclaredMethod("throughInterface",Op.class,int.class);
        Method field=coldField();
        Method[] methods={direct,iface,field,InterpreterFramePilotTemplateTest.class.getDeclaredMethod("branch",int.class),
            InterpreterFramePilotTemplateTest.class.getDeclaredMethod("cast",Object.class),
            InterpreterFramePilotTemplateTest.class.getDeclaredMethod("instance",Object.class)};
        int used=0,built=0;long reserved=0;
        for(Method method:methods) {
            WB.markMethodProfiled(method);WB.makeMethodNotCompilable(method);WB.testSetDontInlineMethod(method,true);
            long[] data=WB.interpreterFramePilot(method,8);
            check(data[0]==1 && data[8]!=0,"prepared "+method);
            check(Short.toUnsignedInt(u.getShort(data[8]+3848))==0x544d,"template metrics belong to this prototype");
            used|=Short.toUnsignedInt(u.getShort(data[8]+3836));
            built|=Short.toUnsignedInt(u.getShort(data[8]+3838));
            reserved=Short.toUnsignedInt(u.getShort(data[8]+3842));
        }
        check(used==0x1ff,"all nine copied families actually generated: "+Integer.toHexString(used));
        check(built==0x1ff && reserved>0 && reserved<32768,"bounded lazy initialization/storage");
        Holder holder=new Holder();Object token=holder.ref;Run run=new Run();Op op=new Impl();
        for(int i=0;i<8;i++) {
            check(direct(i)==i+4 && throughInterface(op,i)==i+6,"both call steps with GC in callee");
            check(field.invoke(null,holder)==token,"cold then resolved reference identity");
            check(branch(-1)==-7 && branch(1)==11,"forward branch profiles");
            check(cast(run)==run && cast(null)==null && instance(run) && !instance(null) && !instance(token),"type predicates/null");
        }
        try{cast(token);throw new AssertionError("cast must fail");}catch(ClassCastException expected) { }
        try{field.invoke(null,new Object[]{null});throw new AssertionError("field must fail");}
        catch(java.lang.reflect.InvocationTargetException failure){check(failure.getCause() instanceof NullPointerException,"ordinary null exception");}
        check(WB.interpreterFramePilot(direct,3)[32]>0 && WB.interpreterFramePilot(iface,3)[32]>0,"copied resume prefixes executed");
        WB.fullGC();check(field.invoke(null,holder)==token,"live oop after collection");
        System.out.println("PILOT_TEMPLATES_OK used="+used+" reserved="+reserved);
    }
    public static void main(String[] args)throws Exception {
        if(args.length!=0){child();return;}
        for(String collector:new String[]{"-XX:+UseSerialGC","-XX:+UseG1GC"}) {
            List<String> options=new ArrayList<>(List.of("-Xbootclasspath/a:.","-Xmx96m",collector,
                "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED",
                "-XX:+UnlockExperimentalVMOptions","-XX:+UnlockDiagnosticVMOptions","-XX:+WhiteBoxAPI",
                "-XX:+UseInterpreterFramePilot","-XX:+InterpreterFramePilotTestContinuations","-XX:+ProfileInterpreter"));
            if(Platform.isDebugBuild())options.addAll(List.of("-XX:-VerifyOops","-XX:-CheckCompressedOops","-XX:-VerifyDataPointer","-XX:-VerifySecondarySupers"));
            options.addAll(List.of(InterpreterFramePilotTemplateTest.class.getName(),"child"));
            ProcessTools.executeTestJava(options).shouldHaveExitValue(0).shouldContain("PILOT_TEMPLATES_OK");
        }
    }
}
