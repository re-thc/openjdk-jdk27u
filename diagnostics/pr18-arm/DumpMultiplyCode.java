import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Path;
import jdk.test.whitebox.WhiteBox;

public class DumpMultiplyCode {
    public static void main(String[] args) throws Exception {
        MultiplyLoops.main(new String[] {"500"});
        WhiteBox wb = WhiteBox.getWhiteBox();
        for (String name : new String[] {"fourLongs", "differentLongs", "bytes", "shorts", "ints"}) {
            Class<?>[] parameters = name.equals("bytes") ? new Class<?>[] {int.class, int.class, byte.class}
                                    : name.equals("shorts") ? new Class<?>[] {int.class, int.class, short.class}
                                    : name.equals("ints") ? new Class<?>[] {int.class, int.class, int.class}
                                    : new Class<?>[] {int.class, int.class};
            Method method = MultiplyLoops.class.getDeclaredMethod(name, parameters);
            wb.enqueueMethodForCompilation(method, 4);
            Object[] nmethod = wb.getNMethod(method, false);
            if (nmethod == null || (Integer) nmethod[1] != 4) {
                throw new AssertionError(name + " missing C2 nmethod");
            }
            byte[] code = (byte[]) nmethod[2];
            Files.write(Path.of(args[0], name + ".bin"), code);
            System.out.printf("%s level=%s id=%s bytes=%d entry=%x%n", name, nmethod[1], nmethod[3], code.length, (Long) nmethod[4]);
        }
        MultiplyLoops.main(new String[] {"1"});
    }
}
