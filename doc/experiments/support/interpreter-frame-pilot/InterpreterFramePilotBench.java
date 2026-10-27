import java.lang.management.ManagementFactory;
import java.lang.management.ThreadMXBean;
import java.lang.reflect.Method;
import java.util.Arrays;
import jdk.test.whitebox.WhiteBox;

// Three deliberately small arithmetic shapes. Targets remain interpreted;
// ordinary C2 compiles only the fixed callers, before measurement.
public class InterpreterFramePilotBench {
    static final WhiteBox WB=WhiteBox.getWhiteBox();
    static volatile int sink;
    static int targetShort(int x,int y) { return x+y+3; }
    static int targetMedium(int x,int y) { int z=(x*31+y)^16383;z=z+(x|7);return(z*13)^(z>>>3); }
    static int targetLong(int x,int y) {
        int z=x+y;z=(z*31+x)^y;z=(z*17-y)+(x>>>3);z=(z*13+y)^(x<<2);z=z+(x|7);return z;
    }
    static int runShort(int n) { int sum=0;for(int i=0;i<n;i++)sum+=targetShort(i,i^0x8765);return sum; }
    static int runMedium(int n) { int sum=0;for(int i=0;i<n;i++)sum+=targetMedium(i,i^0x8765);return sum; }
    static int runLong(int n) { int sum=0;for(int i=0;i<n;i++)sum+=targetLong(i,i^0x8765);return sum; }
    static int run(int which,int n) {return which==0?runShort(n):which==1?runMedium(n):runLong(n);}
    static void check(boolean good,String reason) { if(!good)throw new AssertionError(reason); }
    public static void main(String[] args)throws Exception {
        boolean enabled=Boolean.parseBoolean(args[0]);int count=500_000;
        ThreadMXBean cpu=ManagementFactory.getThreadMXBean();cpu.getCurrentThreadCpuTime();
        Method[] targets=new Method[3],callers=new Method[3];String[] cases={"Short","Medium","Long"};
        for(int i=0;i<3;i++) {
            targets[i]=InterpreterFramePilotBench.class.getDeclaredMethod("target"+cases[i],int.class,int.class);
            callers[i]=InterpreterFramePilotBench.class.getDeclaredMethod("run"+cases[i],int.class);
            sink=run(i,50000);
            check(WB.enqueueMethodForCompilation(callers[i],4),"caller C2 admission");
            long deadline=System.nanoTime()+20_000_000_000L;
            while(WB.getMethodCompilationLevel(callers[i])!=4) {
                if(System.nanoTime()>deadline)throw new AssertionError("caller C2 "+cases[i]);Thread.sleep(2);
            }
        }
        for(int i=0;i<3;i++) {
            long cpuStart=cpu.getCurrentThreadCpuTime(),wallStart=System.nanoTime();
            long[] data=WB.interpreterFramePilot(targets[i],0);
            long wall=System.nanoTime()-wallStart,threadCpu=cpu.getCurrentThreadCpuTime()-cpuStart;
            check(!enabled || data[0]==1,"generation "+cases[i]+Arrays.toString(data));
            check(enabled || data[8]==0,"ordinary baseline has no generated code");
            System.out.println("GEN "+cases[i]+" "+Arrays.toString(data)+" "+threadCpu+" "+wall);
            WB.interpreterFramePilot(targets[i],2);
        }
        int[] expected=new int[3];for(int i=0;i<3;i++)expected[i]=run(i,count);
        for(int block=0;block<4;block++)for(int i=0;i<3;i++) {
            boolean on=enabled&&(block==1||block==2);WB.interpreterFramePilot(targets[i],on?1:2);
            long before=WB.interpreterFramePilot(targets[i],3)[9];
            long cpuStart=cpu.getCurrentThreadCpuTime(),wallStart=System.nanoTime();int value=run(i,count);
            long wall=System.nanoTime()-wallStart,threadCpu=cpu.getCurrentThreadCpuTime()-cpuStart;
            long after=WB.interpreterFramePilot(targets[i],3)[9];
            check(value==expected[i],"result "+cases[i]);sink=value;
            check(WB.getMethodCompilationLevel(callers[i])==4 && WB.getMethodCompilationLevel(targets[i])==0,"tier state");
            check(after-before==(on?count:0),"actual codelet entries "+(after-before));
            System.out.println("SAMPLE "+cases[i]+" "+block+" "+on+" "+count+" "+threadCpu+" "+wall+" "+(after-before));
        }
        System.out.println("PILOT_BENCH_OK "+sink);
    }
}
