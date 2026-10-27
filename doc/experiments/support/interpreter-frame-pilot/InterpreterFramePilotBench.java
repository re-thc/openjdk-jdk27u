import java.lang.management.ManagementFactory;
import java.lang.management.ThreadMXBean;
import java.lang.reflect.Method;
import java.util.Arrays;
import jdk.test.whitebox.WhiteBox;
import jdk.internal.misc.Unsafe;

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
    // Inspect only a published, committed, immutable 4 KiB pilot slice, after
    // every timing window. Its unused tail retains reserve()'s 0xcc fill.
    static byte[] code(long entry) {
        Unsafe unsafe=Unsafe.getUnsafe();byte[] bytes=new byte[4096];
        for(int i=0;i<bytes.length;i++) {
            bytes[i]=unsafe.getByte(entry+i);
        }
        return bytes;
    }
    static int extent(byte[] bytes) {
        int end=0;for(int i=0;i<bytes.length;i++)if(bytes[i]!=(byte)0xcc)end=i+1;
        check(end>0 && end<bytes.length,"published slice has a padded tail");
        return end;
    }
    public static void main(String[] args)throws Exception {
        boolean enabled=Boolean.parseBoolean(args[0]);int action=args.length>1?Integer.parseInt(args[1]):0;int count=500_000;
        String order=args.length>2?args[2]:"012";
        check(order.length()==3 && order.chars().distinct().count()==3 && order.chars().allMatch(c->c>='0'&&c<='2'),"case order");
        ThreadMXBean cpu=ManagementFactory.getThreadMXBean();cpu.getCurrentThreadCpuTime();
        var compilation=ManagementFactory.getCompilationMXBean();
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
        long[][] queries=new long[2][];long[] queryCpu=new long[2],queryWall=new long[2];
        // Isolate first native-bridge use without generating a body or
        // changing any target's compilation state. This caller already has
        // a cached method ID from the preceding C2 enqueue/level checks.
        for(int q=0;q<2;q++) {
            long cpuStart=cpu.getCurrentThreadCpuTime(),wallStart=System.nanoTime();
            queries[q]=WB.interpreterFramePilot(callers[0],3);
            queryWall[q]=System.nanoTime()-wallStart;queryCpu[q]=cpu.getCurrentThreadCpuTime()-cpuStart;
            check(queries[q][0]==1 && queries[q][8]==0,"query does not prepare a body");
        }
        long[][] generation=new long[3][];long[] genCpu=new long[3],genWall=new long[3];
        for(int position=0;position<3;position++) {
            int i=order.charAt(position)-'0';
            long cpuStart=cpu.getCurrentThreadCpuTime(),wallStart=System.nanoTime();
            long[] data=WB.interpreterFramePilot(targets[i],action);
            long wall=System.nanoTime()-wallStart,threadCpu=cpu.getCurrentThreadCpuTime()-cpuStart;
            check(!enabled || data[0]==1,"generation");
            check(!enabled || data[8]!=0,"published entry");
            check(enabled || data[8]==0,"ordinary baseline has no generated code");
            generation[i]=data;genCpu[i]=threadCpu;genWall[i]=wall;
            if(enabled && position>0) {
                int previous=order.charAt(position-1)-'0';
                check(data[8]-generation[previous][8]==4096,"three fresh successful slices with no failed emissions");
            }
        }
        for(int i=0;i<3;i++) {
            long[] data=generation[i];
            if(enabled && data.length>11)check((data[28]==data[29])==(action==4),"producer thread identity");
            if(action==5)for(int f:new int[]{1,2,3,4,5,11,12,13,14,15,16,17,23,24,25,27,28,31})
                check(data[f]==0,"observation-free producer fields");
            WB.interpreterFramePilot(targets[i],2);
        }
        int[] expected=new int[3];for(int i=0;i<3;i++)expected[i]=run(i,count);
        long[][] samples=new long[12][5];
        long compileBefore=compilation.getTotalCompilationTime();
        for(int block=0;block<4;block++)for(int position=0;position<3;position++) {
            int i=order.charAt(position)-'0';
            boolean on=enabled&&(block==1||block==2);WB.interpreterFramePilot(targets[i],on?1:2);
            long before=WB.interpreterFramePilot(targets[i],3)[9];
            long cpuStart=cpu.getCurrentThreadCpuTime(),wallStart=System.nanoTime();int value=run(i,count);
            long wall=System.nanoTime()-wallStart,threadCpu=cpu.getCurrentThreadCpuTime()-cpuStart;
            long after=WB.interpreterFramePilot(targets[i],3)[9];
            check(value==expected[i],"result");sink=value;
            check(WB.getMethodCompilationLevel(callers[i])==4 && WB.getMethodCompilationLevel(targets[i])==0,"tier state");
            check(after-before==(on?count:0),"actual codelet entries");
            long[] sample=samples[block*3+i];
            sample[0]=on?1:0;sample[1]=count;sample[2]=threadCpu;sample[3]=wall;sample[4]=after-before;
        }
        long compileAfter=compilation.getTotalCompilationTime();
        // No diagnostic output occurs between request or execution windows.
        for(int q=0;q<2;q++)System.out.println("QUERY "+q+" "+Arrays.toString(queries[q])+" "+queryCpu[q]+" "+queryWall[q]);
        for(int position=0;position<3;position++) {
            int i=order.charAt(position)-'0';
            System.out.println("GEN "+cases[i]+" "+position+" "+Arrays.toString(generation[i])+" "+genCpu[i]+" "+genWall[i]);
        }
        for(int block=0;block<4;block++)for(int i=0;i<3;i++) {
            long[] s=samples[block*3+i];
            System.out.println("SAMPLE "+cases[i]+" "+block+" "+(s[0]!=0)+" "+s[1]+" "+s[2]+" "+s[3]+" "+s[4]);
        }
        System.out.println("COMPILATION "+compileBefore+" "+compileAfter);
        if(enabled)for(int i=0;i<3;i++) {
            byte[] bytes=code(generation[i][8]);int size=extent(bytes);
            if(action!=5)check(size==generation[i][3],"padding extent matches observed emitted size");
            System.out.println("CODE "+cases[i]+" "+size+" "+java.util.HexFormat.of().formatHex(bytes));
        }
        System.out.println("PILOT_BENCH_OK "+sink);
    }
}
