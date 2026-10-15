import java.lang.reflect.Method;
import jdk.incubator.vector.IntVector;
import jdk.test.whitebox.WhiteBox;

/** Local mechanism experiment; logged/observed, never a timing workload. */
public class ProfiledOsrDiagnostic {
    static volatile long sink;
    public static void main(String[] args) throws Exception {
        // Previous task168 had no receiver profiles in IntVector.lanewise;
        // it retained virtual broadcast/lanewise calls. Warm those helpers
        // independently before installing the target OSR compilation.
        var value = IntVector.zero(PhaseVectorKernels.IS);
        for (int i = 0; i < 40000; i++) {
            value = value.add(i);
            sink = value.reduceLanes(jdk.incubator.vector.VectorOperators.ADD);
        }
        Method method = PhaseVectorKernels.class.getDeclaredMethod("osrAccumulator", int.class);
        WhiteBox wb = WhiteBox.getWhiteBox();
        for (int i = 0; i < 16; i++) PhaseVectorKernels.osrAccumulator(128);
        if (!wb.enqueueMethodForCompilation(method, 4, 9)) throw new AssertionError("OSR enqueue failed");
        for (int i = 0; wb.getMethodCompilationLevel(method, true) != 4 && i < 1000; i++) Thread.sleep(10);
        if (wb.getMethodCompilationLevel(method, true) != 4 || wb.getMethodCompilationLevel(method, false) != 0)
            throw new AssertionError("OSR-only installation failed");
        wb.lockCompilation();
        try {
            System.out.println("LOCAL_PROFILED_OSR normal=0 osr=4 bci=9; helper profile warmed; diagnostics only");
            PhaseVectorProbe.main(new String[]{"osrAccumulator", "osr"});
            if (wb.getMethodCompilationLevel(method, false) != 0 || wb.getMethodCompilationLevel(method, true) != 4)
                throw new AssertionError("OSR isolation lost");
        } finally { wb.unlockCompilation(); }
    }
}
