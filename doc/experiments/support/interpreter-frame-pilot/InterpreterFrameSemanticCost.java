import java.lang.management.ManagementFactory;
import java.lang.management.ThreadMXBean;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Objects;
import java.util.function.Supplier;
import com.sun.tools.javac.code.TypeTag;
import com.sun.tools.javac.util.Assert;
import jdk.test.whitebox.WhiteBox;
import jdk.internal.misc.Unsafe;

// Adapted from the existing integer-pilot measurement harness. Explicit held-
// method preparation only; five fixed shapes, no automatic admission.
public class InterpreterFrameSemanticCost {
    static final WhiteBox WB=WhiteBox.getWhiteBox();
    static volatile int sink;
    static class Token {
        final int value;
        Token(int value){this.value=value;}
        @Override public boolean equals(Object other){return other instanceof Token && ((Token)other).value==value;}
    }
    interface Op {int apply(int value);}
    static class Impl implements Op {public int apply(int value){return value*3+1;}}
    static final Token LEFT=new Token(17),RIGHT=new Token(17);
    static final Op OP=new Impl();
    static final Supplier<String> MESSAGE=()->"unexpected-null";
    static int twice(int value){return value*2;}
    static int targetStatic(int value){return twice(value)+7;}
    static int targetInterface(Op receiver,int value){return receiver.apply(value)+13;}
    static int runTag(int n){int sum=0;for(int i=0;i<n;i++)sum+=TypeTag.BYTE.isStrictSubRangeOf(TypeTag.INT)?1:0;return sum;}
    static int runEquals(int n){int sum=0;for(int i=0;i<n;i++)sum+=Objects.equals(LEFT,RIGHT)?1:0;return sum;}
    static int runAssert(int n){int sum=0;for(int i=0;i<n;i++)sum+=Assert.checkNonNull(LEFT,MESSAGE)==LEFT?1:0;return sum;}
    static int runStatic(int n){int sum=0;for(int i=0;i<n;i++)sum+=targetStatic(i);return sum;}
    static int runInterface(int n){int sum=0;for(int i=0;i<n;i++)sum+=targetInterface(OP,i);return sum;}
    static int run(int i,int n){return switch(i){case 0->runTag(n);case 1->runEquals(n);case 2->runAssert(n);case 3->runStatic(n);case 4->runInterface(n);default->throw new AssertionError();};}
    static final String[] NAMES={"Tag","Equals","Assert","Static","Interface"};
    static Method[] targets()throws Exception{return new Method[]{TypeTag.class.getMethod("isStrictSubRangeOf",TypeTag.class),
        Objects.class.getMethod("equals",Object.class,Object.class),Assert.class.getMethod("checkNonNull",Object.class,Supplier.class),
        InterpreterFrameSemanticCost.class.getDeclaredMethod("targetStatic",int.class),
        InterpreterFrameSemanticCost.class.getDeclaredMethod("targetInterface",Op.class,int.class)};}
    static void check(boolean yes,String message){if(!yes)throw new AssertionError(message);}
    static void compile(Method m)throws Exception{
        WB.markMethodProfiled(m);WB.testSetDontInlineMethod(m,true);
        check(WB.enqueueMethodForCompilation(m,4),"C2 enqueue "+m);
        long end=System.nanoTime()+20_000_000_000L;
        while(WB.getMethodCompilationLevel(m)!=4){check(System.nanoTime()<end,"C2 timeout "+m);Thread.sleep(2);}
    }
    static void initialize(Method[] targets,Method[] callers,Method[] callees)throws Exception {
        check(WB.getBooleanVMFlag("ProfileInterpreter"),"normal interpreter profiling");
        for(Method m:targets){WB.makeMethodNotCompilable(m);WB.testSetDontInlineMethod(m,true);}
        for(int i=0;i<5;i++){sink=run(i,20_000);WB.markMethodProfiled(targets[i]);}
        for(Method m:callees)compile(m);
        for(Method m:callers)compile(m);
        for(int i=0;i<5;i++){sink=run(i,20_000);check(WB.getMethodCompilationLevel(targets[i])==0,"interpreted root");}
    }
    public static void main(String[] args)throws Exception {
        String order=args[0];boolean reverse=Boolean.parseBoolean(args[1]);int action=Integer.parseInt(args[2]);int count=500_000;
        check(order.length()==5 && order.chars().distinct().count()==5,"permutation");
        ThreadMXBean cpu=ManagementFactory.getThreadMXBean();cpu.getCurrentThreadCpuTime();
        var compilation=ManagementFactory.getCompilationMXBean();
        Boolean counterFlag=WB.getBooleanVMFlag("InterpreterFramePilotTestContinuations");
        boolean countContinuations=counterFlag==null || counterFlag;
        Method[] targets=targets(),callers=new Method[5];
        for(int i=0;i<5;i++)callers[i]=InterpreterFrameSemanticCost.class.getDeclaredMethod("run"+NAMES[i],int.class);
        Method[] callees={InterpreterFrameSemanticCost.class.getDeclaredMethod("twice",int.class),
            Token.class.getDeclaredMethod("equals",Object.class),Impl.class.getDeclaredMethod("apply",int.class)};
        initialize(targets,callers,callees);
        long[][] queries=new long[2][];long[] queryCpu=new long[2],queryWall=new long[2];
        for(int q=0;q<2;q++){
            long c=cpu.getCurrentThreadCpuTime(),w=System.nanoTime();queries[q]=WB.interpreterFramePilot(callers[0],3);
            queryWall[q]=System.nanoTime()-w;queryCpu[q]=cpu.getCurrentThreadCpuTime()-c;
            check(queries[q][8]==0,"query cannot emit a body");
        }
        long[][] gen=new long[5][];long[] genCpu=new long[5],genWall=new long[5];
        for(int position=0;position<5;position++){
            int i=order.charAt(position)-'0';long c=cpu.getCurrentThreadCpuTime(),w=System.nanoTime();
            gen[i]=WB.interpreterFramePilot(targets[i],action);
            genWall[i]=System.nanoTime()-w;genCpu[i]=cpu.getCurrentThreadCpuTime()-c;
            check(gen[i][0]==1 && gen[i][8]!=0,"prepared "+NAMES[i]+Arrays.toString(gen[i]));
            if(action==5)for(int f:new int[]{1,2,3,4,5,11,12,13,14,15,16,17,23,24,25,27,28,31})check(gen[i][f]==0,"silent producer "+f);
        }
        for(Method m:targets)WB.interpreterFramePilot(m,2);
        int[] expected=new int[5];for(int i=0;i<5;i++)expected[i]=run(i,count);
        long[][] samples=new long[20][7];long compileBefore=compilation.getTotalCompilationTime();
        for(int block=0;block<4;block++)for(int position=0;position<5;position++){
            int i=order.charAt(position)-'0';boolean on=(block==1||block==2)^reverse;
            WB.interpreterFramePilot(targets[i],on?1:2);long[] before=WB.interpreterFramePilot(targets[i],3);
            long c=cpu.getCurrentThreadCpuTime(),w=System.nanoTime();int value=run(i,count);
            long wall=System.nanoTime()-w,threadCpu=cpu.getCurrentThreadCpuTime()-c;
            long[] after=WB.interpreterFramePilot(targets[i],3);sink=value;
            check(value==expected[i],"checksum "+NAMES[i]);
            check(after[9]-before[9]==(on && countContinuations?count:0),"native entries "+NAMES[i]);
            check(after[32]-before[32]==(on && countContinuations && (i==1||i==3||i==4)?count:0),"native continuations "+NAMES[i]);
            check(WB.getMethodCompilationLevel(callers[i])==4 && WB.getMethodCompilationLevel(targets[i])==0,"root/caller levels");
            for(Method m:callees)check(WB.getMethodCompilationLevel(m)==4,"callee level "+m);
            samples[block*5+i]=new long[]{on?1:0,count,threadCpu,wall,after[9]-before[9],after[32]-before[32],value};
        }
        long compileAfter=compilation.getTotalCompilationTime();
        for(int q=0;q<2;q++)System.out.println("QUERY "+q+" "+Arrays.toString(queries[q])+" "+queryCpu[q]+" "+queryWall[q]);
        for(int position=0;position<5;position++){
            int i=order.charAt(position)-'0';System.out.println("GEN "+NAMES[i]+" "+position+" "+Arrays.toString(gen[i])+" "+genCpu[i]+" "+genWall[i]);
        }
        for(int block=0;block<4;block++)for(int i=0;i<5;i++)System.out.println("SAMPLE "+NAMES[i]+" "+block+" "+Arrays.toString(samples[block*5+i]));
        System.out.println("COMPILATION "+compileBefore+" "+compileAfter);
        System.out.println("COUNTERS "+countContinuations);
        Unsafe u=Unsafe.getUnsafe();
        for(int i=0;i<5;i++){
            long entry=gen[i][8];int maps=Short.toUnsignedInt(u.getShort(entry+3832)),bytes=Short.toUnsignedInt(u.getShort(entry+3834));
            check(maps<=64 && bytes>0 && bytes<3832,"immutable map bounds");
            System.out.println("CODE "+NAMES[i]+" "+bytes+" "+maps);
        }
        System.out.println("SEMANTIC_COST_OK "+sink);
    }
}
