import java.lang.foreign.*;
import java.lang.invoke.*;
import java.lang.management.ManagementFactory;
import static java.lang.foreign.ValueLayout.JAVA_INT;

public class Steady {
    static { Trace.mark(Trace.INIT,-1,0); }
    static final String MODE = System.getProperty("steady.mode", "bound");
    static final Linker LINKER = Linker.nativeLinker();
    static final MemorySegment SYMBOL;
    static final MethodHandle BOUND;
    static final MethodHandle UNBOUND;
    static MethodHandle variableBound;
    static MethodHandle variableUnbound;
    static volatile long sink;
    static {
        Trace.mark(Trace.LIBRARY,-1,0);
        System.load(System.getProperty("steady.library", "/workspace/ffm-lab/libprobe.so"));
        Trace.mark(Trace.LIBRARY,-1,1);
        SYMBOL = SymbolLookup.loaderLookup().findOrThrow("id_i");
        FunctionDescriptor fd = FunctionDescriptor.of(JAVA_INT, JAVA_INT);
        Trace.mark(Trace.UNBOUND,-1,0);
        UNBOUND = LINKER.downcallHandle(fd);
        Trace.mark(Trace.UNBOUND,-1,1);
        Trace.mark(Trace.BOUND,-1,0);
        BOUND = LINKER.downcallHandle(SYMBOL, fd);
        Trace.mark(Trace.BOUND,-1,1);
        variableBound = BOUND;
        variableUnbound = UNBOUND;
        Trace.mark(Trace.INIT,-1,1);
    }
    static long callsBound(int n) throws Throwable {
        long sum=0;
        for (int i=0;i<n;i++) sum += (int) BOUND.invokeExact(i);
        return sum;
    }
    static long callsUnbound(int n) throws Throwable {
        long sum=0;
        for (int i=0;i<n;i++) sum += (int) UNBOUND.invokeExact(SYMBOL,i);
        return sum;
    }
    static long callsJava(int n) {
        long sum=0;
        for (int i=0;i<n;i++) sum += i;
        return sum;
    }
    static long callsVariable(int n) throws Throwable {
        MethodHandle handle = variableBound;
        long sum=0;
        for (int i=0;i<n;i++) sum += (int) handle.invokeExact(i);
        return sum;
    }
    static long callsVariableUnbound(int n) throws Throwable {
        MethodHandle handle = variableUnbound;
        long sum=0;
        for (int i=0;i<n;i++) sum += (int) handle.invokeExact(SYMBOL,i);
        return sum;
    }
    static long calls(int n) throws Throwable {
        return switch(MODE) {
            case "bound" -> callsBound(n);
            case "unbound" -> callsUnbound(n);
            case "variable" -> callsVariable(n);
            case "variable-unbound" -> callsVariableUnbound(n);
            case "java" -> callsJava(n);
            default -> throw new IllegalArgumentException(MODE);
        };
    }
    public static void main(String[] args) throws Throwable {
        Trace.mark(Trace.MXBEAN,-1,0);
        var bean=ManagementFactory.getThreadMXBean();
        if(!bean.isCurrentThreadCpuTimeSupported()) throw new AssertionError("Thread CPU timing unavailable");
        bean.setThreadCpuTimeEnabled(true);
        Trace.initializeClock();
        Trace.mark(Trace.MXBEAN,-1,1);
        int n=Integer.getInteger("steady.count",1_000_000);
        int warm=Integer.getInteger("steady.warm",30);
        int samples=Integer.getInteger("steady.samples",10);
        boolean untimed=Boolean.getBoolean("trace.untimed");
        if(!MODE.equals("unbound")) throw new AssertionError("Fixed diagnostic uses unbound root");
        long expected=(long)n*(n-1)/2;
        Trace.mark(Trace.BEGIN,-1,0);
        Trace.begin();
        Trace.mark(Trace.BEGIN,-1,1);
        Trace.mark(Trace.WARM_SET,-1,0);
        for(int i=0;i<warm;i++) {
            Trace.mark(Trace.WARM,i,0);
            sink=calls(n);
            Trace.mark(Trace.WARM,i,1);
            if(sink!=expected) throw new AssertionError("warm checksum");
        }
        Trace.mark(Trace.WARM_SET,-1,1);
        long[] walls=new long[samples], cpus=new long[samples];
        for(int i=0;i<samples;i++) {
            Trace.mark(Trace.SAMPLE,i,0);
            long value;
            if(untimed) {
                value=calls(n);
                Trace.mark(Trace.SAMPLE,i,1);
                Trace.sample(i,false,0,0,0,0,value);
            } else {
                // Original timer API ordering retained; boundary hooks are outside.
                long cpu=bean.getCurrentThreadCpuTime(),start=System.nanoTime();
                value=calls(n);
                long end=System.nanoTime();
                long cpuEnd=bean.getCurrentThreadCpuTime();
                walls[i]=end-start;
                cpus[i]=cpuEnd-cpu;
                Trace.mark(Trace.SAMPLE,i,1);
                Trace.sample(i,true,start,end,cpu,cpuEnd,value);
            }
            sink=value;
            if(value!=expected) throw new AssertionError(value+" != "+expected);
        }
        Trace.mark(Trace.OUTPUT,-1,0);
        System.out.println("{\"mode\":\""+MODE+"\",\"timed\":"+!untimed+",\"count\":"+n+",\"warm\":"+warm+",\"samples\":"+samples+",\"symbol\":\"0x"+Long.toHexString(SYMBOL.address())+"\",\"wall_ns\":"+java.util.Arrays.toString(walls)+",\"cpu_ns\":"+java.util.Arrays.toString(cpus)+",\"sink\":"+sink+"}");
        Trace.mark(Trace.OUTPUT,-1,1);
        Trace.mark(Trace.CAPTURE,-1,0);
        Trace.capture();
        Trace.mark(Trace.CAPTURE,-1,1);
        Trace.mark(Trace.MAIN_END,-1,1);
    }
}
