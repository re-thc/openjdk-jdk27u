import java.lang.management.ManagementFactory;
import java.lang.management.RuntimeMXBean;

/** Diagnostic boundaries only. Native entry points resolved from startup agent. */
final class Trace {
    static final int INIT=0, LIBRARY=1, UNBOUND=2, BOUND=3, MXBEAN=4,
        WARM_SET=5, WARM=6, SAMPLE=7, OUTPUT=8, CAPTURE=9, MAIN_END=10, BEGIN=11;
    private static RuntimeMXBean runtime;
    static void initializeClock() { runtime=ManagementFactory.getRuntimeMXBean(); }
    static void mark(int phase, int index, int edge) {
        long a=System.nanoTime();
        long uptime=runtime == null ? -1 : runtime.getUptime();
        long b=System.nanoTime();
        mark0(phase,index,edge,a,uptime,b);
    }
    private static native void mark0(int phase,int index,int edge,long a,long uptime,long b);
    static native void begin();
    static native void capture();
    static native void sample(int index,boolean timed,long wall0,long wall1,long cpu0,long cpu1,long checksum);
}
