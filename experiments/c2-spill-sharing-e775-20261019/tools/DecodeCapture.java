import dev.jzstd.Jzstd;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;

/** Fixed operation counts for untimed, matched code capture. */
public class DecodeCapture {
    static volatile long sink;
    public static void main(String[] args) throws Exception {
        byte[] source = Files.readAllBytes(Path.of(args[0]));
        byte[] frame = Files.readAllBytes(Path.of(args[1]));
        byte[] destination = new byte[source.length];
        if (!Arrays.equals(source, Jzstd.decompress(frame))) throw new AssertionError("allocating output");
        int repetitions = Integer.parseInt(args[2]);
        for (int i = 0; i < repetitions; i++) {
            int count = Jzstd.decompress(frame, destination);
            if (count != source.length) throw new AssertionError("decoded size");
            sink += count;
        }
        if (!Arrays.equals(source, destination)) throw new AssertionError("complete output");
        System.out.println("capture full-output checks=2 decodes=" + repetitions + " sink=" + sink);
    }
}
