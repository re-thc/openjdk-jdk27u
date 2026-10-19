import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Random;

/** Retain live, patched caller/callee nmethods around the original GC fixture. */
public class GCStateCapture {
    static Path directory;
    static void dump(String label, Method method) throws Exception {
        Object[] nmethod = TestSharedSpillGC.WB.getNMethod(method, false);
        if (nmethod == null) {
            System.out.println("GC_NMETHOD label=" + label + " compiled=false");
            return;
        }
        Object[] blob = (Object[]) nmethod[0];
        byte[] code = (byte[]) nmethod[2];
        Files.write(directory.resolve(label + ".bin"), code);
        System.out.printf("GC_NMETHOD label=%s compiled=true level=%d id=%d begin=0x%x entry=0x%x bytes=%d%n",
                label, (Integer)nmethod[1], (Integer)nmethod[3], (Long)blob[4], (Long)nmethod[4], code.length);
    }
    public static void main(String[] args) throws Exception {
        directory = Path.of(args[0]);
        Files.createDirectories(directory);
        Random random = new Random(0x534f454d41504cL);
        long[] seeds = new long[12];
        for (int i = 0; i < seeds.length; i++) seeds[i] = random.nextLong();
        TestSharedSpillGC.Box[] roots = {new TestSharedSpillGC.Box(random.nextLong()),
                new TestSharedSpillGC.Box(random.nextLong()), new TestSharedSpillGC.Box(random.nextLong())};
        for (int i = 0; i < 3000; i++) TestSharedSpillGC.sink = TestSharedSpillGC.caller(roots, seeds, 8);
        for (int action = 0; action < 4; action++) {
            TestSharedSpillGC.mode = 0;
            TestSharedSpillGC.compileC2(TestSharedSpillGC.OUTER);
            TestSharedSpillGC.compileC2(TestSharedSpillGC.CALLER);
            dump("pre" + action + "-outer", TestSharedSpillGC.OUTER);
            dump("pre" + action + "-caller", TestSharedSpillGC.CALLER);
            long rootArrayBefore = TestSharedSpillGC.WB.getObjectAddress(roots);
            long seedsBefore = TestSharedSpillGC.WB.getObjectAddress(seeds);
            long[] boxesBefore = new long[roots.length];
            for (int i = 0; i < roots.length; i++) boxesBefore[i] = TestSharedSpillGC.WB.getObjectAddress(roots[i]);
            TestSharedSpillGC.mode = action;
            long expected = TestSharedSpillGC.reference(roots, seeds, 16);
            long actual = TestSharedSpillGC.caller(roots, seeds, 16);
            if (actual != expected) throw new AssertionError("state " + action);
            if (action >= 2 && TestSharedSpillGC.WB.getMethodCompilationLevel(TestSharedSpillGC.OUTER) != 0) {
                throw new AssertionError("missing deoptimization");
            }
            dump("post" + action + "-outer", TestSharedSpillGC.OUTER);
            dump("post" + action + "-caller", TestSharedSpillGC.CALLER);
            int movedBoxes = 0;
            for (int i = 0; i < roots.length; i++) {
                if (boxesBefore[i] != TestSharedSpillGC.WB.getObjectAddress(roots[i])) movedBoxes++;
            }
            System.out.printf("GC_ROOT_MOVEMENT action=%d roots_array=%s seeds_array=%s boxes=%d%n", action,
                    rootArrayBefore != TestSharedSpillGC.WB.getObjectAddress(roots),
                    seedsBefore != TestSharedSpillGC.WB.getObjectAddress(seeds), movedBoxes);
            System.out.printf("GC_ACTION action=%d gc=%d deopt=%d%n", action,
                    TestSharedSpillGC.gcCalls, TestSharedSpillGC.deoptCalls);
        }
        if (TestSharedSpillGC.gcCalls != 3 || TestSharedSpillGC.deoptCalls != 2) throw new AssertionError("hook counts");
        System.out.println("GC/deoptimization state checks=4 forcedGC=3 activeDeopt=2");
    }
}
