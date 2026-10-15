import java.lang.management.ManagementFactory;
import java.lang.reflect.Method;
import java.util.Arrays;
import com.sun.management.ThreadMXBean;
import jdk.incubator.vector.*;
import jdk.test.whitebox.WhiteBox;

/** Local mechanism probe, separate from every frozen native timing input. */
public class VectorInsertAllocationProbe {
    static final VectorSpecies<Float> SPECIES = Integer.getInteger("bits", 0) == 0
        ? FloatVector.SPECIES_MAX : VectorSpecies.of(float.class, VectorShape.forBitSize(Integer.getInteger("bits")));
    static final float[] input = new float[1024];
    static final float[] output = new float[1024];
    static int index = SPECIES.length() - 1;
    static float value = -0.0f;
    static volatile long sink;
    static {
        for (int i = 0; i < input.length; i++) input[i] = Float.intBitsToFloat(0x3f012345 + i * 7919);
    }
    public static void kernel() {
        for (int i = 0; i < input.length; i += SPECIES.length()) {
            FloatVector.fromArray(SPECIES, input, i).withLane(index, value).intoArray(output, i);
        }
    }
    static void check() {
        for (int i = 0; i < input.length; i++) {
            float expected = i % SPECIES.length() == index ? value : input[i];
            if (Float.floatToRawIntBits(output[i]) != Float.floatToRawIntBits(expected)) {
                throw new AssertionError("insert lane " + i);
            }
        }
    }
    public static void main(String[] args) throws Exception {
        ThreadMXBean bean = (ThreadMXBean)ManagementFactory.getThreadMXBean();
        bean.setThreadAllocatedMemoryEnabled(true);
        long thread = Thread.currentThread().threadId();
        Method method = VectorInsertAllocationProbe.class.getDeclaredMethod("kernel");
        WhiteBox wb = WhiteBox.getWhiteBox();
        for (int i = 0; i < 20000; i++) kernel();
        check();
        if (wb.getMethodCompilationLevel(method, false) != 4) throw new AssertionError("ordinary C2 missing");
        System.out.println("LOCAL_INSERT_SCOPE bits=" + SPECIES.vectorBitSize() + " native_max=" + FloatVector.SPECIES_MAX.vectorBitSize());
        for (int row = 0; row < 5; row++) {
            int before = wb.getMethodCompilationLevel(method, false);
            long start = bean.getThreadAllocatedBytes(thread);
            for (int call = 0; call < 100; call++) kernel();
            long allocated = bean.getThreadAllocatedBytes(thread) - start;
            int after = wb.getMethodCompilationLevel(method, false);
            if (before != 4 || after != 4) throw new AssertionError("C2 level changed");
            check();
            sink = Float.floatToRawIntBits(output[1023]);
            System.out.println("LOCAL_INSERT_ROW calls=100 bytes=" + allocated + " B_per_op=" + allocated / 100.0
                + " before=" + before + " after=" + after);
        }
        for (int lane : new int[]{0, SPECIES.length() - 1}) {
            index = lane;
            for (int bits : new int[]{0, 0x80000000, 0x7f800000, 0xff800000, 0x7fc12345, 0xffc12345, 0x7f812345}) {
                value = Float.intBitsToFloat(bits); kernel(); check();
            }
        }
        for (int lane : new int[]{-1, SPECIES.length()}) {
            index = lane;
            float[] saved = output.clone();
            try { kernel(); throw new AssertionError("invalid lane accepted"); }
            catch (IllegalArgumentException expected) { }
            if (!Arrays.equals(output, saved)) throw new AssertionError("store before bounds failure");
        }
        System.out.println("LOCAL_INSERT_SEMANTICS_PASS");
    }
}
