/*
 * Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * This diagnostic is distributed under the GNU General Public License version 2.
 */
import bench.MultiplyBench;
import java.lang.reflect.Field;

/** Check the frozen benchmark's output arrays against interpreted Java arithmetic. */
public class BenchmarkCheck {
    private static Object field(MultiplyBench b, String name) throws Exception {
        Field f = MultiplyBench.class.getDeclaredField(name);
        f.setAccessible(true);
        return f.get(b);
    }
    private static void check(MultiplyBench b, String method) throws Exception {
        int from = b.offset, end = from + b.length;
        if (method.equals("fourLongs") || method.equals("differentLongs")) {
            long[] a = (long[]) field(b, "longs"), other = (long[]) field(b, "otherLongs"), out = (long[]) field(b, "resultLongs");
            for (int i = 0; i < out.length; i++) {
                long x = a[i], expected = i < from ? 0 : x * x * x * (method.equals("fourLongs") ? x : other[i]);
                if (out[i] != expected) throw new AssertionError(method + " index=" + i);
            }
        } else {
            String type = method.substring(0, method.indexOf("Broadcast"));
            String suffix = type.substring(0, 1).toUpperCase() + type.substring(1) + "s";
            int factor = (Integer) field(b, "factor");
            Object a = field(b, type + "s"), other = field(b, "other" + suffix);
            Object out = field(b, "result" + suffix), second = field(b, "second" + suffix);
            for (int i = 0; i < end; i++) {
                int x = java.lang.reflect.Array.getInt(a, i), y = java.lang.reflect.Array.getInt(other, i);
                int ex = i < from ? 0 : factor * x, ey = i < from ? 0 : factor * y;
                if (type.equals("byte")) { ex = (byte) ex; ey = (byte) ey; }
                if (type.equals("short")) { ex = (short) ex; ey = (short) ey; }
                if (java.lang.reflect.Array.getInt(out, i) != ex || java.lang.reflect.Array.getInt(second, i) != ey) throw new AssertionError(method + " index=" + i);
            }
        }
    }
    public static void main(String[] args) throws Exception {
        for (int length : new int[] {1, 3, 7, 15, 16, 17, 31, 32, 33, 65, 1024, 4099}) {
            for (int offset : new int[] {0, 1, 3}) {
                MultiplyBench b = new MultiplyBench(); b.length = length; b.offset = offset; b.setup();
                for (String method : new String[] {"fourLongs", "differentLongs", "byteBroadcast", "shortBroadcast", "intBroadcast"}) {
                    var m = MultiplyBench.class.getDeclaredMethod(method);
                    for (int warm = 0; warm < 500; warm++) m.invoke(b);
                    jdk.test.whitebox.WhiteBox.getWhiteBox().enqueueMethodForCompilation(m, 4);
                    Object[] code = jdk.test.whitebox.WhiteBox.getWhiteBox().getNMethod(m, false);
                    if (code == null || (Integer) code[1] != 4) throw new AssertionError("Missing actual benchmark C2 method: " + method);
                    m.invoke(b);
                    check(b, method);
                }
            }
        }
        System.out.println("Frozen benchmark arrays verified against interpreted Java; all five methods compiled by C2.");
    }
}
