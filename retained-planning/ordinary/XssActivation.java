/* Task-local ordinary correctness witness; never used in timing images. */
import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.SplittableRandom;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import jdk.test.whitebox.WhiteBox;

public class XssActivation {
    private static final WhiteBox WB = WhiteBox.getWhiteBox();
    private static final Class<?> DPQ;
    private static final MethodHandle HANDLE;
    private static final Method ROUTER;
    private static final Method ATTEMPT;
    static {
        try {
            DPQ = Class.forName("java.util.DualPivotQuicksort");
            HANDLE = MethodHandles.privateLookupIn(DPQ, MethodHandles.lookup())
                    .findStatic(DPQ, "trySortRange", MethodType.methodType(
                            boolean.class, long[].class, int.class, int.class));
            ROUTER = DPQ.getDeclaredMethod("sort",
                    Class.forName("java.util.DualPivotQuicksort$Sorter"),
                    long[].class, int.class, int.class, int.class);
            ATTEMPT = XssActivation.class.getDeclaredMethod("attempt",
                    long[].class, int.class, int.class);
        } catch (ReflectiveOperationException e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private static native long[] nativeSortCounters();
    private static native void resetNativeSortCounters();

    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }

    private static boolean attempt(long[] array, int low, int high) throws Throwable {
        return (boolean) HANDLE.invokeExact(array, low, high);
    }

    private static long[] random(int size, long seed) {
        SplittableRandom r = new SplittableRandom(seed);
        long[] result = new long[size];
        for (int i = 0; i < size; i++) result[i] = r.nextLong();
        return result;
    }

    private static void sorted(long[] array) {
        for (int i = 1; i < array.length; i++) {
            check(array[i - 1] <= array[i], "wrong order at " + i);
        }
    }

    private static void compile(Method method, int level) {
        check(WB.enqueueMethodForCompilation(method, level), "compile enqueue failed: " + method);
        long deadline = System.nanoTime() + 5_000_000_000L;
        while (WB.getMethodCompilationLevel(method) != level && System.nanoTime() < deadline) {
            Thread.yield();
        }
        check(WB.getMethodCompilationLevel(method) == level,
                "wrong compilation level " + WB.getMethodCompilationLevel(method) + " for " + method);
    }

    private static void activation() throws Throwable {
        for (int i = 0; i < 32; i++) attempt(random(8192, i), 0, 8192);
        compile(ATTEMPT, 4);
        resetNativeSortCounters();
        long[] array = random(8192, 573);
        check(attempt(array, 0, array.length), "compiled helper declined ordinary range");
        sorted(array);
        long[] counts = nativeSortCounters();
        check(counts.length == 3 && counts[0] == 1 && counts[1] == 1 && counts[2] == 0,
                "native entry/completion not proved: " + Arrays.toString(counts));

        for (int i = 0; i < 32; i++) Arrays.sort(random(8192, i));
        compile(ROUTER, 4);
        resetNativeSortCounters();
        array = random(8192, 574);
        Arrays.sort(array);
        sorted(array);
        counts = nativeSortCounters();
        check(counts[0] > 0 && counts[1] > 0, "public sort did not complete native entry");

        for (String pattern : new String[]{"equal", "sorted", "reverse"}) {
            array = new long[8192];
            for (int i = 0; i < array.length; i++) {
                array[i] = pattern.equals("equal") ? 7
                        : pattern.equals("sorted") ? i : array.length - i;
            }
            resetNativeSortCounters();
            Arrays.sort(array);
            sorted(array);
            check(nativeSortCounters()[0] == 0, "adaptive exit intercepted: " + pattern);
        }
        System.out.println("PASS actual C2/private/public native activation and adaptive exits");
    }

    private static void fallback() throws Throwable {
        compile(ATTEMPT, 4);
        compile(ROUTER, 4);
        fallbackChecks();
    }

    private static void interpreted() throws Throwable {
        check(WB.getMethodCompilationLevel(ATTEMPT) == 0, "attempt unexpectedly compiled");
        check(WB.getMethodCompilationLevel(ROUTER) == 0, "router unexpectedly compiled");
        fallbackChecks();
    }

    private static void fallbackChecks() throws Throwable {
        resetNativeSortCounters();
        for (int i = 0; i < 64; i++) {
            long[] array = random(8192, i);
            long[] before = array.clone();
            check(!attempt(array, 0, array.length), "fallback accepted range");
            check(Arrays.equals(array, before), "fallback mutated input");
            Arrays.sort(array);
            sorted(array);
        }
        check(nativeSortCounters()[0] == 0, "fallback entered native implementation");
        System.out.println("PASS zero native entries in fallback mode");
    }

    private static void c1() throws Throwable {
        compile(ATTEMPT, 1);
        resetNativeSortCounters();
        long[] array = random(8192, 731);
        long[] before = array.clone();
        check(!attempt(array, 0, array.length), "C1 helper unexpectedly completed");
        check(Arrays.equals(array, before), "C1 helper stub mutated input");
        check(nativeSortCounters()[0] == 0, "C1 path entered native implementation");
        System.out.println("PASS C1 helper stub without native entry");
    }

    private static void stress() throws Throwable {
        compile(ATTEMPT, 4);
        compile(ROUTER, 4);
        boolean interrupted = Thread.currentThread().isInterrupted();
        try {
            Thread.currentThread().interrupt();
            for (int i = 0; i < 64; i++) {
                if ((i & 7) == 0) WB.deoptimizeMethod(ROUTER);
                long[] array = random(8192, i + 600);
                Arrays.sort(array);
                sorted(array);
                check(Thread.currentThread().isInterrupted(), "sort cleared interrupt");
            }
        } finally {
            Thread.interrupted();
            if (interrupted) Thread.currentThread().interrupt();
        }
        for (int i = 0; i < 8; i++) {
            final int seed = i;
            AtomicReference<Throwable> error = new AtomicReference<>();
            Thread t = Thread.ofVirtual().start(() -> {
                try {
                    for (int j = 0; j < 16; j++) {
                        Thread.yield();
                        long[] array = random(8192, seed * 16L + j);
                        check(attempt(array, 0, array.length), "virtual native helper declined");
                        sorted(array);
                    }
                } catch (Throwable e) {
                    error.set(e);
                }
            });
            t.join();
            check(error.get() == null, "virtual-thread failure: " + error.get());
        }
        long[] shared = random(8192, 7014);
        AtomicBoolean stop = new AtomicBoolean();
        AtomicReference<Throwable> error = new AtomicReference<>();
        Thread writer = Thread.ofPlatform().start(() -> {
            SplittableRandom r = new SplittableRandom(8192);
            try {
                while (!stop.get()) shared[r.nextInt(shared.length)] = r.nextLong();
            } catch (Throwable e) {
                error.set(e);
            }
        });
        try {
            for (int i = 0; i < 128; i++) {
                // Enter the compiled intrinsic directly: do not confuse existing
                // Java scanner race behavior with this native bounds check.
                check(attempt(shared, 0, shared.length), "race helper declined");
            }
        } finally {
            stop.set(true);
            writer.join();
        }
        check(error.get() == null, "writer failure: " + error.get());
        // A racy sort has no ordering/permutation assertion. Crash and deadline
        // failures are retained by the supervising ordinary controller.
        System.out.println("PASS bounded interruption/deoptimization/virtual/race stress");
    }

    public static void main(String[] args) throws Throwable {
        check(args.length == 2, "usage: XssActivation <activation|fallback|interpreted|c1|stress> <witness-path|none>");
        if (!args[1].equals("none")) System.load(args[1]);
        switch (args[0]) {
            case "activation": activation(); break;
            case "fallback": fallback(); break;
            case "interpreted": interpreted(); break;
            case "c1": c1(); break;
            case "stress": stress(); break;
            default: throw new AssertionError("unknown mode");
        }
        if (!args[0].equals("stress")) BoundedSimdSort.main(new String[0]);
    }
}
