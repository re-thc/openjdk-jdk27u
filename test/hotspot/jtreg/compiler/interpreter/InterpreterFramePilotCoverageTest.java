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
 * @summary Cold fields and forward targets beyond returns preserve interpreter resolution and exit semantics
 * @requires (os.arch == "amd64" | os.arch == "x86_64") & vm.compiler1.enabled
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver InterpreterFramePilotCoverageTest
 */
import java.lang.classfile.ClassFile;
import java.lang.constant.ClassDesc;
import java.lang.constant.MethodTypeDesc;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class InterpreterFramePilotCoverageTest {
    static WhiteBox WB;
    static int effects,initializations;
    public static class Holder {
        public int i=17;public byte b=-117;public short s=-30001;public char c=65001;
        public boolean z=true;public volatile int vi=-917;
        public Object ref=new Object();public volatile Object vr=new Object();
    }
    public static class Secret { private int value=31; }
    static class RefChild extends java.lang.ref.WeakReference<Object> {
        int own=53;RefChild(){super(new Object());}
    }
    static class Lazy {
        static {initializations++;}
        static int value=29;static Object ref=new Object();
    }
    static int consume(int x){effects++;return x*3;}
    static Object echo(Object x){effects++;WB.fullGC();return x;}
    static int readInt(Holder h){return consume(h.i)+1;}
    static int readByte(Holder h){return consume(h.b)+1;}
    static int readShort(Holder h){return consume(h.s)+1;}
    static int readChar(Holder h){return consume(h.c)+1;}
    static int readBoolean(Holder h){return consume(h.z?1:0)+1;}
    static int readVolatile(Holder h){return consume(h.vi)+1;}
    static Object readRef(Holder h){Object x=h.ref;return echo(x)==x?x:null;}
    static Object readVolatileRef(Holder h){Object x=h.vr;return echo(x)==x?x:null;}
    static int readStatic(){return consume(Lazy.value)+1;}
    static Object readStaticRef(){Object x=Lazy.ref;return echo(x)==x?x:null;}
    static int readSubclass(RefChild h){return consume(h.own)+1;}
    static int early(Holder a,Holder b){if(a==b)return 7;int x=consume(a.i);return x+3;}
    static void check(boolean ok,String why){if(!ok)throw new AssertionError(why);}
    static Method method(String name,Class<?>... args)throws Exception {
        return InterpreterFramePilotCoverageTest.class.getDeclaredMethod(name,args);
    }
    static long[] query(Method m,int action){return WB.interpreterFramePilot(m,action);}
    static long resumes(Method m){return query(m,3)[32];}
    static long[] prepare(Method m,int action) {
        WB.markMethodProfiled(m);WB.makeMethodNotCompilable(m);WB.testSetDontInlineMethod(m,true);
        long[] data=query(m,action);
        check(data[0]==1 && data[8]!=0 && data[27]==0,"prepared before execution "+m+Arrays.toString(data));
        return data;
    }
    static class Loader extends ClassLoader {Class<?> define(byte[] bytes){return defineClass(null,bytes,0,bytes.length);}}
    static Class<?> invalidClass(String name,boolean missing,boolean privateField)throws Exception {
        ClassDesc owner=ClassDesc.of(privateField?"InterpreterFramePilotCoverageTest$Secret":"InterpreterFramePilotCoverageTest$Holder");
        byte[] bytes=ClassFile.of().build(ClassDesc.of(name),c -> {
            c.withFlags(ClassFile.ACC_PUBLIC);
            if(!missing && !privateField)c.withMethodBody("good",MethodTypeDesc.of(ClassDesc.ofDescriptor("I"),owner),
                ClassFile.ACC_PUBLIC|ClassFile.ACC_STATIC,m -> m.aload(0).getfield(owner,"i",ClassDesc.ofDescriptor("I")).iconst_1().iadd().ireturn());
            c.withMethodBody("bad",missing||privateField?MethodTypeDesc.of(ClassDesc.ofDescriptor("I"),owner):MethodTypeDesc.ofDescriptor("()I"),
                ClassFile.ACC_PUBLIC|ClassFile.ACC_STATIC,m -> {
                    if(missing||privateField)m.aload(0).getfield(owner,missing?"missing":"value",ClassDesc.ofDescriptor("I"));
                    else m.getstatic(owner,"i",ClassDesc.ofDescriptor("I"));
                    m.iconst_1().iadd().ireturn();
                });
        });
        Class<?> klass=new Loader().define(bytes);WB.linkClass(klass);return klass;
    }
    static void fails(Method m,Class<? extends Throwable> error,Object... args)throws Exception {
        long before=resumes(m);
        try{m.invoke(null,args);throw new AssertionError("expected "+error);}
        catch(InvocationTargetException failure){check(error.isInstance(failure.getCause()),"ordinary resolution/exception: "+failure.getCause());}
        check(resumes(m)==before,"failed field does not resume after effect");
    }
    static void child(int action,boolean profiles)throws Exception {
        WB=WhiteBox.getWhiteBox();Holder h=new Holder(),other=new Holder();RefChild ref=new RefChild();
        consume(0);echo(h); // Warm helper entries, never a tested field-get entry.
        Method[] reads={method("readInt",Holder.class),method("readByte",Holder.class),method("readShort",Holder.class),
            method("readChar",Holder.class),method("readBoolean",Holder.class),method("readVolatile",Holder.class),
            method("readRef",Holder.class),method("readVolatileRef",Holder.class),method("readStatic"),method("readStaticRef"),
            method("readSubclass",RefChild.class),method("early",Holder.class,Holder.class)};
        long[] entries=new long[reads.length];
        for(int i=0;i<reads.length;i++) {
            long[] data=prepare(reads[i],action);entries[i]=data[8];
            if(action!=5)check(data[4]>3,"generation extends past cold getfield and first return "+reads[i]);
        }
        check(initializations==0,"preparation does not initialize field holder");
        effects=0;check(readInt(h)==52 && effects==1 && resumes(reads[0])==0,"first cold access resolves and falls back once");
        check(readInt(h)==52 && effects==2 && resumes(reads[0])==1,"same body uses newly resolved field and resumes after call");
        for(int n=0;n<20;n++) {
            check(readByte(h)==-350 && readShort(h)==-90002 && readChar(h)==195004 && readBoolean(h)==4,"cold narrow fields");
            check(readVolatile(h)==-2750 && readRef(h)==h.ref && readVolatileRef(h)==h.vr,"cold volatile/reference reads and GC");
            check(readStatic()==88 && readStaticRef()==Lazy.ref && initializations==1,"lazy static initialization once");
            check(readSubclass(ref)==160,"Reference subclass own ordinary field");
            check(early(h,h)==7 && early(h,other)==54,"ordinary early return and later native path");
        }
        for(int i=1;i<reads.length;i++)check(resumes(reads[i])>0,"native work beyond cold field/early return "+reads[i]);
        for(int i=0;i<reads.length;i++)check(query(reads[i],3)[8]==entries[i],"no regeneration "+reads[i]);
        h.vi=31;h.vr=h.ref;Lazy.value=-3;ref.own=7;
        check(readVolatile(h)==94 && readVolatileRef(h)==h.ref && readStatic()==-8 && readSubclass(ref)==22,"live updates after publication");
        long before=resumes(reads[0]);
        try{readInt(null);throw new AssertionError("null receiver");}catch(NullPointerException expected){}
        check(resumes(reads[0])==before && readInt(h)==52,"null fallback preserves stack/BCP");
        Class<?> wrong=invalidClass("PilotWrongFieldOpcode",false,false);
        check((int)wrong.getMethod("good",Holder.class).invoke(null,h)==18,"same entry cached for getfield");
        Method badStatic=wrong.getMethod("bad");prepare(badStatic,action);
        fails(badStatic,IncompatibleClassChangeError.class);fails(badStatic,IncompatibleClassChangeError.class);
        Method missing=invalidClass("PilotMissingField",true,false).getMethod("bad",Holder.class);prepare(missing,action);
        fails(missing,NoSuchFieldError.class,h);fails(missing,NoSuchFieldError.class,(Object)null);
        Method denied=invalidClass("PilotPrivateField",false,true).getMethod("bad",Secret.class);prepare(denied,action);
        fails(denied,IllegalAccessError.class,new Secret());fails(denied,IllegalAccessError.class,(Object)null);
        check(!WB.isMethodCompiled(reads[0]) && query(reads[0],3)[9]>0,"actual interpreted native arena execution");
        System.out.println("PILOT_COVERAGE_OK action="+action+" profiles="+profiles);
    }
    public static void main(String[] args)throws Exception {
        if(args.length>0){child(Integer.parseInt(args[0]),args.length>1);return;}
        for(int action:new int[]{0,4,5})for(String collector:new String[]{"-XX:+UseSerialGC","-XX:+UseG1GC"})
            ProcessTools.executeTestJava("-Xbootclasspath/a:.","-Xint","-Xmx96m",collector,
                "-XX:+UnlockExperimentalVMOptions","-XX:+UnlockDiagnosticVMOptions","-XX:+WhiteBoxAPI",
                "-XX:+UseInterpreterFramePilot","-XX:+InterpreterFramePilotTestContinuations",
                InterpreterFramePilotCoverageTest.class.getName(),Integer.toString(action))
                .shouldHaveExitValue(0).shouldContain("PILOT_COVERAGE_OK");
        var output=ProcessTools.executeTestJava("-Xbootclasspath/a:.","-Xmx96m","-XX:+UseG1GC",
            "-XX:+UnlockExperimentalVMOptions","-XX:+UnlockDiagnosticVMOptions","-XX:+WhiteBoxAPI",
            "-XX:+UseInterpreterFramePilot","-XX:+InterpreterFramePilotTestContinuations",
            "-XX:CompileCommand=print,InterpreterFramePilotCoverageTest::early",
            InterpreterFramePilotCoverageTest.class.getName(),"4","profiles")
            .shouldHaveExitValue(0).shouldContain("PILOT_COVERAGE_OK");
        String text=output.getOutput();
        check(text.contains("taken(20)") && text.contains("not taken(20)"),"early-return branches profiled exactly once\n"+text);
    }
}
