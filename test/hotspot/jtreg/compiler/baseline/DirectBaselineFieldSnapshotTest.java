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
 * @summary Resolved instance-field snapshots preserve widths, volatility, inherited holders and final-write checks
 * @requires vm.compiler1.enabled & (os.arch == "amd64" | os.arch == "x86_64")
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver DirectBaselineFieldSnapshotTest
 */
import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.lang.constant.ConstantDescs;
import java.lang.constant.MethodTypeDesc;
import java.lang.invoke.MethodHandles;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class DirectBaselineFieldSnapshotTest {
    public static class Parent {
        boolean flag; byte small; char wide; short signed;
        volatile long value; Object ref; volatile boolean ready;
        public final int fixed; public int before;
        Parent(int fixed) { this.fixed=fixed; }
    }
    static class Child extends Parent { Child(int fixed) { super(fixed); } }
    static long narrow(Parent b,int i,long value,Object token) {
        b.flag=(i&1)!=0; b.small=(byte)(i-117); b.wide=(char)(65535-i);
        b.signed=(short)(i-30000); b.value=value; b.ref=token;
        return b.value+b.small+b.wide+b.signed+(b.flag?7:19);
    }
    static int inherited(Child b) { return b.fixed; }
    static Object reference(Parent b) { return b.ref; }
    static void publish(Parent b,Object value) { b.ref=value; b.ready=true; }
    static Object acquire(Parent b) { return b.ready?b.ref:null; }
    static void check(boolean value) { if(!value)throw new AssertionError(); }
    static void await(WhiteBox wb,Method method) throws Exception {
        long end=System.nanoTime()+20_000_000_000L;
        while(wb.getMethodCompilationLevel(method)!=1) {
            if(System.nanoTime()>end)throw new AssertionError("missing direct field root "+method);
            Thread.sleep(5);
        }
    }
    static Method badFinal() throws Exception {
        ClassDesc owner=ClassDesc.of("DirectBaselineFieldSnapshotTest$Parent");
        byte[] code=ClassFile.of().build(ClassDesc.of("DirectBadFinalField"),c ->
            c.withMethodBody("attempt",MethodTypeDesc.ofDescriptor("(LDirectBaselineFieldSnapshotTest$Parent;I)I"),
                ClassFile.ACC_PUBLIC|ClassFile.ACC_STATIC,m -> {
                    m.aload(0).getfield(owner,"fixed",ConstantDescs.CD_int).istore(2);
                    m.iload(1).ifThen(t -> {
                        t.aload(0).dup().getfield(owner,"before",ConstantDescs.CD_int).iconst_1().iadd().putfield(owner,"before",ConstantDescs.CD_int);
                        t.aload(0).iconst_m1().putfield(owner,"fixed",ConstantDescs.CD_int);
                    });
                    m.iload(2).ireturn();
                }));
        return MethodHandles.lookup().defineClass(code).getDeclaredMethod("attempt",Parent.class,int.class);
    }
    static void child() throws Exception {
        WhiteBox wb=WhiteBox.getWhiteBox(); Parent b=new Parent(17);
        Child first=new Child(23),second=new Child(91); Object token=new byte[8192];
        Method bad=badFinal(); long value=0x76543210abcdef01L;
        for(int i=0;i<64;i++) {
            check(narrow(b,i,value,token)==value+(byte)(i-117)+(char)(65535-i)+(short)(i-30000)+((i&1)!=0?7:19));
            check(inherited(first)==23 && inherited(second)==91 && reference(b)==token);
            publish(b,token); check(acquire(b)==token); b.ready=false;
            check((int)bad.invoke(null,b,0)==17); Thread.sleep(1);
        }
        for(Method method:new Method[]{
                DirectBaselineFieldSnapshotTest.class.getDeclaredMethod("narrow",Parent.class,int.class,long.class,Object.class),
                DirectBaselineFieldSnapshotTest.class.getDeclaredMethod("inherited",Child.class),
                DirectBaselineFieldSnapshotTest.class.getDeclaredMethod("reference",Parent.class),
                DirectBaselineFieldSnapshotTest.class.getDeclaredMethod("publish",Parent.class,Object.class),
                DirectBaselineFieldSnapshotTest.class.getDeclaredMethod("acquire",Parent.class)}) await(wb,method);
        check(narrow(b,-123,value,token)==value+(byte)-240+(char)65658+(short)-30123+7);
        check(inherited(first)==23 && inherited(second)==91);
        System.gc(); check(reference(b)==token);
        b.ref=null; b.ready=false; Object expected=new byte[1<<20];
        Throwable[] failure={null};
        Thread reader=new Thread(() -> {
            try { while(acquire(b)==null)Thread.onSpinWait(); check(acquire(b)==expected); }
            catch(Throwable error) { failure[0]=error; }
        });
        reader.start(); publish(b,expected); reader.join(20000); check(!reader.isAlive() && failure[0]==null);
        try { bad.invoke(null,b,1);throw new AssertionError("illegal final write succeeded"); }
        catch(InvocationTargetException error) { check(error.getCause() instanceof IllegalAccessError); }
        check(b.before==1 && b.fixed==17);
        try { narrow(null,0,value,token);throw new AssertionError("missing null field exception"); }
        catch(NullPointerException expectedNull) { }
        System.out.println("DIRECT_FIELD_SNAPSHOT_OK");
    }
    public static void main(String[] args) throws Exception {
        if(args.length!=0){child();return;}
        for(String gc:new String[]{"-XX:+UseSerialGC","-XX:+UseG1GC"}) {
            ProcessTools.executeTestJava("-Xbootclasspath/a:.","-XX:+UnlockExperimentalVMOptions",
                "-XX:+UnlockDiagnosticVMOptions","-XX:+WhiteBoxAPI","-XX:+UseDirectBaseline",
                "-XX:+TraceDirectBaseline","-Xmx64m",gc,
                "-XX:CompileCommand=dontinline,DirectBaselineFieldSnapshotTest::*",
                "-XX:CompileCommand=dontinline,DirectBadFinalField::*",
                DirectBaselineFieldSnapshotTest.class.getName(),"child")
                .shouldHaveExitValue(0).shouldContain("DIRECT_FIELD_SNAPSHOT_OK")
                .shouldContain("direct install narrow(").shouldContain("direct install inherited(")
                .shouldContain("direct install reference(").shouldContain("direct install publish(")
                .shouldContain("direct install acquire(").shouldNotContain("direct install attempt(");
        }
    }
}
