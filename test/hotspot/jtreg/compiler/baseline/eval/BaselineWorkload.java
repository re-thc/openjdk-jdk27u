// Local evaluation driver: parse UTF-8-like ASCII records through small static
// helpers, with fields, references, branches, array reads, and Java calls.
// No timer/logging in the target helpers. Each sample runs in a fresh VM.
import java.nio.charset.StandardCharsets;
import java.util.zip.CRC32;
public class BaselineWorkload {
    static class Cursor { int position; int sum; Object tag; }
    static volatile int sink;
    static int digit(byte[] a, int p) { return a[p] - 48; }
    static int token(byte[] a, int p) { return digit(a,p)*100 + digit(a,p+1)*10 + digit(a,p+2); }
    static int accept(Cursor c, Object tag, int n) { c.tag = tag; c.sum = c.sum + n; c.position = c.position + 4; return c.sum; }
    static int record(byte[] a, Cursor c, Object tag) { return accept(c, tag, token(a, c.position)); }
    static int parse(byte[] a, Cursor c) {
        c.position=0; c.sum=0;
        while (c.position < a.length) record(a, c, a);
        return c.sum;
    }
    public static void main(String[] args) throws Exception {
        String mode = args.length == 0 ? "startup" : args[0];
        byte[] data = "123,456,789,234,567,890,321,654,987,432,765,098,".repeat(16).getBytes(StandardCharsets.US_ASCII);
        Cursor cursor = new Cursor();
        if (mode.equals("startup")) {
            for (int i=0; i<100; i++) sink=parse(data,cursor);
            // Also exercise standard JDK startup (charset conversion, CRC, format).
            CRC32 crc = new CRC32(); crc.update(data);
            System.out.println(sink + ":" + crc.getValue());
        } else {
            for (int i=0; i<100_000; i++) sink=parse(data,cursor);
            for (int r=0; r<5; r++) {
                long start=System.nanoTime(); int value=0;
                for (int i=0; i<100_000; i++) value ^= parse(data,cursor);
                sink=value;
                System.out.println("warm_ns="+(System.nanoTime()-start));
            }
        }
    }
}
