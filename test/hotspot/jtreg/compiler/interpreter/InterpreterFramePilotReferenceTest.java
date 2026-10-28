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
 * @summary Category-1 interpreter-frame bodies preserve references, cached reads, casts and forward joins
 * @requires (os.arch == "amd64" | os.arch == "x86_64") & vm.compiler1.enabled
 * @library /test/lib
 * @build jdk.test.whitebox.WhiteBox
 * @run driver jdk.test.lib.helpers.ClassFileInstaller jdk.test.whitebox.WhiteBox
 * @run driver InterpreterFramePilotReferenceTest
 */
import java.lang.classfile.ClassFile;
import java.lang.classfile.Attributes;
import java.lang.constant.ClassDesc;
import java.lang.constant.MethodTypeDesc;
import java.lang.reflect.Method;
import java.util.Arrays;
import jdk.test.lib.process.ProcessTools;
import jdk.test.whitebox.WhiteBox;

public class InterpreterFramePilotReferenceTest {
    static WhiteBox WB;
    interface Marker { }
    static class Token implements Marker { }
    byte b=-117; short s=-30001; char c=65001; boolean z=true; int i=0x12345678;
    volatile int vi=-917; Object o=new Token(); volatile Object vo=new Token();
    static int si=171; static volatile int svi=-18;
    int fields() { return b+s+c+(z?1:0)+i+vi; }
    Object reference(boolean first,Object other) { Object x=first?o:vo;return x==null?other:x; }
    static int statics() { return si+svi; }
    static Object constants(int n) { return n==0?"cached-string":n==1?Token.class:null; }
    static Object cast(Object x) { return (Marker)x; }
    static int instance(Object x) { return x instanceof Marker?1:0; }
    static Object checkedJoin(Object x) { return x instanceof Marker?(Marker)x:null; }
    Object identity(Object x) { return x; }
    static int forward(int x,Object a,Object b) { int y;if(x<0)y=-1;else if(a==b)y=17;else y=31;return y; }
    static int dereference(InterpreterFramePilotReferenceTest x) { return x.i; }
    static int loop(int x) { int y=0;while(x>0){y+=x;x--;}return y; }
    static int mixed(int x) { return x+(int)System.nanoTime(); }
    static int signature(long x) { return 17; }
    static void check(boolean ok,String why) { if(!ok)throw new AssertionError(why); }
    static Method method(String name,Class<?>... args)throws Exception {
        return InterpreterFramePilotReferenceTest.class.getDeclaredMethod(name,args);
    }
    static long[] query(Method method,int action) { return WB.interpreterFramePilot(method,action); }
    static void prepare(Method method,int action) {
        WB.makeMethodNotCompilable(method);WB.testSetDontInlineMethod(method,true);
        long[] data=query(method,action);
        check(data[0]==1 && data[8]!=0 && data[10]==1,"prepared "+method+Arrays.toString(data));
        check(!WB.isMethodCompiled(method) && data[27]==0,"interpreter code, no nmethod allocation");
        if(action!=5 && method.getDeclaringClass()==InterpreterFramePilotReferenceTest.class &&
                !method.getName().equals("loop") && !method.getName().equals("mixed")) {
            try(var input=InterpreterFramePilotReferenceTest.class.getResourceAsStream("InterpreterFramePilotReferenceTest.class")) {
                var model=ClassFile.of().parse(input.readAllBytes());
                int bytes=model.methods().stream().filter(m -> m.methodName().equalsString(method.getName()))
                    .findFirst().orElseThrow().findAttribute(Attributes.code()).orElseThrow().codeLength();
                check(data[4]==bytes-1,"whole supported body before ordinary return "+method+Arrays.toString(data));
            } catch(java.io.IOException failure) {throw new AssertionError(failure);}
        }
    }
    static class Loader extends ClassLoader {
        Class<?> define(byte[] bytes) { return defineClass(null,bytes,0,bytes.length); }
    }
    static Method generated(String name,ClassDesc target,boolean cast)throws Exception {
        byte[] bytes=ClassFile.of().build(ClassDesc.of(name),c -> c.withFlags(ClassFile.ACC_PUBLIC)
            .withMethodBody("body",MethodTypeDesc.ofDescriptor(cast?"(Ljava/lang/Object;)Ljava/lang/Object;":"()Ljava/lang/Object;"),
                ClassFile.ACC_PUBLIC|ClassFile.ACC_STATIC,m -> {
                    if(cast)m.aload(0).checkcast(target);else m.loadConstant(target);
                    m.areturn();
                }));
        Class<?> klass=new Loader().define(bytes);
        WB.linkClass(klass);
        return cast?klass.getDeclaredMethod("body",Object.class):klass.getDeclaredMethod("body");
    }
    static void child(int action,boolean profiling)throws Exception {
        WB=WhiteBox.getWhiteBox();
        if(profiling)check(WB.getBooleanVMFlag("ProfileInterpreter"),"normal-policy profile emission enabled");
        InterpreterFramePilotReferenceTest data=new InterpreterFramePilotReferenceTest();
        Object a=data.o,b=data.vo;
        int fields=data.fields();statics();constants(0);constants(1);cast(a);instance(a);
        data.reference(true,null);data.reference(false,null);data.identity(a);
        forward(-1,a,b);forward(0,a,a);forward(0,a,b);dereference(data);checkedJoin(a);
        Method[] methods={method("fields"),method("reference",boolean.class,Object.class),method("statics"),
            method("constants",int.class),method("cast",Object.class),method("instance",Object.class),
            method("identity",Object.class),method("forward",int.class,Object.class,Object.class),
            method("dereference",InterpreterFramePilotReferenceTest.class),method("checkedJoin",Object.class)};
        for(Method m:methods){WB.markMethodProfiled(m);prepare(m,action);if(profiling)check(WB.getMethodData(m)!=0,"MDO exists "+m);}
        for(int n=0;n<256;n++) {
            check(data.fields()==fields,"signed narrow/boolean/volatile fields");
            check(data.reference(true,null)==a && data.reference(false,null)==b,"reference branch identity");
            check(data.identity(a)==a && data.identity(null)==null,"instance reference argument/result");
            check(statics()==153 && constants(0)=="cached-string" && constants(1)==Token.class && constants(2)==null,"cached constants/static reads");
            check(cast(a)==a && cast(null)==null && instance(a)==1 && instance(b)==1 && instance(new Object())==0 && instance(null)==0,"cast/instanceof result and null");
            check(checkedJoin(a)==a && checkedJoin(null)==null && checkedJoin(new Object())==null,"cast/branch profile sequence");
            check(forward(-1,a,b)==-1 && forward(0,a,a)==17 && forward(0,a,b)==31,"int/reference forward joins");
            check(dereference(data)==data.i,"resolved receiver read");
        }
        data.o=null;check(data.reference(true,a)==a,"null reference join");data.o=a;
        data.vi=197;data.vo=a;svi=18;
        check(data.fields()==fields+1114 && data.reference(false,null)==a && statics()==189,"volatile reads observe updates");
        try {cast(new Object());throw new AssertionError("cast must throw");}catch(ClassCastException expected) { }
        check(cast(a)==a,"cast profile recovers immediately after failure");
        try {dereference(null);throw new AssertionError("field must throw");}catch(NullPointerException expected) { }
        check(dereference(data)==data.i,"field fallback preserves next invocation");
        // Class literals need no resolved-reference map and must not initialize
        // their target. Unresolved casts preserve null-before-resolution order.
        Method literal=generated("PilotClassLiteral",ClassDesc.of("java.util.ArrayDeque"),false);
        prepare(literal,action);check(literal.invoke(null)==java.util.ArrayDeque.class,"class literal mirror with no reference map");
        check(literal.invoke(null)==java.util.ArrayDeque.class,"resolved class literal cache");
        Method freshCast=generated("PilotUnresolvedCast",ClassDesc.of("java.util.TreeMap"),true);
        prepare(freshCast,action);check(freshCast.invoke(null,new Object[]{null})==null,"null unresolved cast");
        Object map=new java.util.TreeMap<>();check(freshCast.invoke(null,map)==map && freshCast.invoke(null,map)==map,"unresolved then resolved cast");
        try {freshCast.invoke(null,new Object());throw new AssertionError("class cast must throw");}
        catch(java.lang.reflect.InvocationTargetException failure){check(failure.getCause() instanceof ClassCastException,"ordinary class cast exception");}
        check(freshCast.invoke(null,map)==map,"class cast recovers after failure");
        Method missing=generated("PilotMissingCast",ClassDesc.of("PilotNoSuchTarget"),true);
        prepare(missing,action);check(missing.invoke(null,new Object[]{null})==null,"null cast must not resolve missing class");
        try{missing.invoke(null,new Object());throw new AssertionError("missing target must fail");}
        catch(java.lang.reflect.InvocationTargetException failure){check(failure.getCause() instanceof NoClassDefFoundError,"ordinary missing cast target error");}
        check(missing.invoke(null,new Object[]{null})==null,"null bypasses cached class-resolution error");
        check(query(method("signature",long.class),action)[0]==0,"category-2 root excluded");
        prepare(method("loop",int.class),action);check(loop(5)==15,"backward branch stays ordinary");
        prepare(method("mixed",int.class),action);mixed(7); // unsupported category-2 result/call stays ordinary
        for(Method m:methods)check(query(m,3)[9]>0,"generated body used "+m);
        WB.fullGC();check(data.identity(a)==a && data.reference(false,null)==a,"live oop roots after collection");
        System.out.println("PILOT_REFERENCE_OK action="+action);
    }
    public static void main(String[] args)throws Exception {
        if(args.length!=0){child(Integer.parseInt(args[0]),args.length>1);return;}
        for(int action:new int[]{0,4,5})for(String collector:new String[]{"-XX:+UseSerialGC","-XX:+UseG1GC"}) {
            ProcessTools.executeTestJava("-Xbootclasspath/a:.","-Xint","-Xmx64m",collector,
                "-XX:+UnlockExperimentalVMOptions","-XX:+UnlockDiagnosticVMOptions","-XX:+WhiteBoxAPI","-XX:+UseInterpreterFramePilot","-XX:+InterpreterFramePilotTestContinuations",
                InterpreterFramePilotReferenceTest.class.getName(),Integer.toString(action))
                .shouldHaveExitValue(0).shouldContain("PILOT_REFERENCE_OK");
        }
        for(int action:new int[]{4,5}) {
            var output=ProcessTools.executeTestJava("-Xbootclasspath/a:.","-Xmx64m","-XX:+UseG1GC",
                "-XX:+UnlockExperimentalVMOptions","-XX:+UnlockDiagnosticVMOptions","-XX:+WhiteBoxAPI","-XX:+UseInterpreterFramePilot","-XX:+InterpreterFramePilotTestContinuations",
                "-XX:CompileCommand=print,InterpreterFramePilotReferenceTest::cast",
                "-XX:CompileCommand=print,InterpreterFramePilotReferenceTest::checkedJoin",
                "-XX:CompileCommand=print,InterpreterFramePilotReferenceTest::forward",
                InterpreterFramePilotReferenceTest.class.getName(),Integer.toString(action),"profiles")
                .shouldHaveExitValue(0).shouldContain("PILOT_REFERENCE_OK");
            verifyProfiles(output.getOutput());
        }
    }
    static String methodData(String output,String method) {
        for(String section:output.split("-{20,}\\R"))
            if(section.contains("::"+method+"("))return section;
        throw new AssertionError("missing method data for "+method+"\n"+output);
    }
    static long matches(String output,String pattern) {
        return java.util.regex.Pattern.compile(pattern).matcher(output).results().count();
    }
    static void verifyProfiles(String output) {
        String cast=methodData(output,"cast"),join=methodData(output,"checkedJoin"),forward=methodData(output,"forward");
        check(matches(cast,"Token[^\\n]*\\(257[ )]")==1 && matches(cast,"java[/.]lang[/.]Object[^\\n]*\\(1[ )]")==1,
            "successful and failed cast receiver counted once\n"+cast);
        check(matches(join,"Token[^\\n]*\\(256[ )]")==2 && matches(join,"java[/.]lang[/.]Object[^\\n]*\\(256[ )]")==1 && join.contains("flags(1)"),
            "instanceof/null/committed cast profiles counted once\n"+join);
        check(join.contains("taken(512)") && join.contains("not taken(256)"),"instanceof branch profile\n"+join);
        check(matches(forward,"BranchData[^\\n]*taken\\(512\\)")==1 && matches(forward,"BranchData[^\\n]*taken\\(256\\)")==1 && matches(forward,"not taken\\(256\\)")==2,
            "forward branch profiles counted once\n"+forward);
        System.out.println(cast+join+forward);
        System.out.println("PILOT_PROFILE_COUNTS_OK");
    }
}
