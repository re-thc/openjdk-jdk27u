import java.lang.foreign.*;
import java.lang.invoke.*;
import java.lang.management.ManagementFactory;
import static java.lang.foreign.ValueLayout.JAVA_INT;

public class Steady {
    static final String MODE = System.getProperty("steady.mode", "bound");
    static final Linker LINKER = Linker.nativeLinker();
    static final MemorySegment SYMBOL;
    static final MethodHandle BOUND;
    static final MethodHandle UNBOUND;
    static MethodHandle variableBound;
    static MethodHandle variableUnbound;
    static volatile long sink;
    static {
        System.load(System.getProperty("steady.library", "/workspace/ffm-lab/libprobe.so"));
        SYMBOL = SymbolLookup.loaderLookup().findOrThrow("id_i");
        FunctionDescriptor fd = FunctionDescriptor.of(JAVA_INT, JAVA_INT);
        UNBOUND = LINKER.downcallHandle(fd);
        BOUND = LINKER.downcallHandle(SYMBOL, fd);
        variableBound = BOUND;
        variableUnbound = UNBOUND;
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
        var bean=ManagementFactory.getThreadMXBean();
        if(!bean.isCurrentThreadCpuTimeSupported()) throw new AssertionError("Thread CPU timing unavailable");
        bean.setThreadCpuTimeEnabled(true);
        int n=Integer.getInteger("steady.count",100_000);
        int warm=Integer.getInteger("steady.warm",20);
        int samples=Integer.getInteger("steady.samples",10);
        long expected=(long)n*(n-1)/2;
        for(int i=0;i<warm;i++) sink=calls(n);
        long[] walls=new long[samples], cpus=new long[samples];
        for(int i=0;i<samples;i++) {
            long cpu=bean.getCurrentThreadCpuTime(),start=System.nanoTime();
            long value=calls(n);
            walls[i]=System.nanoTime()-start;
            cpus[i]=bean.getCurrentThreadCpuTime()-cpu;
            sink=value;
            if(value!=expected) throw new AssertionError(value+" != "+expected);
        }
        System.out.println("{\"mode\":\""+MODE+"\",\"count\":"+n+",\"warm\":"+warm+",\"wall_ns\":"+java.util.Arrays.toString(walls)+",\"cpu_ns\":"+java.util.Arrays.toString(cpus)+",\"sink\":"+sink+"}");
    }
}
