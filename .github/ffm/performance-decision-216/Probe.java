import java.lang.foreign.*;
import java.lang.invoke.*;
import java.nio.file.Path;
import static java.lang.foreign.ValueLayout.*;

public class Probe {
    static volatile long sink;
    static int callI(MethodHandle h, int x) throws Throwable { return (int) h.invokeExact(x); }
    static long callJ(MethodHandle h, long x) throws Throwable { return (long) h.invokeExact(x); }
    static double callD(MethodHandle h, double x) throws Throwable { return (double) h.invokeExact(x); }
    static float callF(MethodHandle h, float x) throws Throwable { return (float) h.invokeExact(x); }
    static int callII(MethodHandle h, int x, int y) throws Throwable { return (int) h.invokeExact(x, y); }
    static long batch(MethodHandle h, String shape, int count) throws Throwable {
        long sum = 0;
        switch (shape) {
            case "i": for (int k = 0; k < count; ++k) sum += callI(h, k); break;
            case "ii": for (int k = 0; k < count; ++k) sum += callII(h, k, 1); break;
            case "j": for (int k = 0; k < count; ++k) sum += callJ(h, k); break;
            case "f": for (int k = 0; k < count; ++k) sum += (long) callF(h, k); break;
            case "d": for (int k = 0; k < count; ++k) sum += (long) callD(h, k); break;
            case "v": for (int k = 0; k < count; ++k) h.invokeExact(); break;
            default: throw new IllegalArgumentException(shape);
        }
        sink = sum;
        return sum;
    }
    public static void main(String[] args) throws Throwable {
        long main = System.nanoTime();
        String shape = args[0];
        if (shape.equals("empty")) { System.out.println("{\"main_ns\":" + (System.nanoTime() - main) + "}"); return; }
        Linker linker = Linker.nativeLinker();
        long t1 = System.nanoTime();
        try (Arena a = Arena.ofConfined()) {
            SymbolLookup lookup = SymbolLookup.libraryLookup(Path.of(args[1]), a);
            long t2 = System.nanoTime();
            FunctionDescriptor fd = switch (shape) {
                case "v" -> FunctionDescriptor.ofVoid();
                case "i", "framework" -> FunctionDescriptor.of(JAVA_INT, JAVA_INT);
                case "ii" -> FunctionDescriptor.of(JAVA_INT, JAVA_INT, JAVA_INT);
                case "j" -> FunctionDescriptor.of(JAVA_LONG, JAVA_LONG);
                case "f" -> FunctionDescriptor.of(JAVA_FLOAT, JAVA_FLOAT);
                case "d" -> FunctionDescriptor.of(JAVA_DOUBLE, JAVA_DOUBLE);
                default -> throw new IllegalArgumentException(shape);
            };
            String name = switch (shape) { case "v" -> "noop"; case "ii" -> "add_i"; case "framework" -> "id_i"; default -> "id_" + shape; };
            MemorySegment symbol = lookup.findOrThrow(name);
            long t3 = System.nanoTime();
            if (shape.equals("framework")) {
                System.out.println("{\"linker_ns\":"+(t1-main)+",\"lookup_ns\":"+(t2-t1)+",\"descriptor_symbol_ns\":"+(t3-t2)+",\"main_ns\":"+(t3-main)+"}");
                return;
            }
            MethodHandle h = linker.downcallHandle(symbol, fd);
            long t4 = System.nanoTime();
            long first = batch(h, shape, 1);
            long t5 = System.nanoTime();
            long early = batch(h, shape, 1000);
            long t6 = System.nanoTime();
            long warm = 0, measurement = 0;
            int n = 200_000;
            if (args.length > 2 && args[2].equals("warm")) {
                for (int k = 0; k < 10; k++) batch(h, shape, n);
                warm = System.nanoTime();
                for (int k = 0; k < 10; k++) batch(h, shape, n);
                measurement = System.nanoTime() - warm;
            }
            long end = System.nanoTime();
            long expectedFirst = shape.equals("ii") ? 1 : 0;
            long expectedEarly = shape.equals("ii") ? 500500 : shape.equals("v") ? 0 : 499500;
            if (first != expectedFirst || early != expectedEarly) throw new AssertionError();
            System.out.println("{\"linker_ns\":"+(t1-main)+",\"lookup_ns\":"+(t2-t1)+",\"descriptor_symbol_ns\":"+(t3-t2)+",\"link_ns\":"+(t4-t3)+",\"first_ns\":"+(t5-t4)+",\"early_ns\":"+(t6-t5)+",\"warm_ns\":"+measurement+",\"warm_count\":"+(10*n)+",\"main_ns\":"+(end-main)+",\"sink\":"+sink+"}");
        }
    }
}
