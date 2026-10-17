import java.lang.management.ManagementFactory;
import java.util.Scanner;

public class ScannerSteady {
    static volatile long sink;
    public static void main(String[] args) {
        var bean = (com.sun.management.ThreadMXBean) ManagementFactory.getThreadMXBean();
        long thread = Thread.currentThread().threadId();
        if (args[0].startsWith("first-")) {
            long before = bean.getThreadAllocatedBytes(thread);
            ScannerProbe.work(args[0].substring(6));
            System.out.println(bean.getThreadAllocatedBytes(thread) - before);
            return;
        }
        boolean numeric = args[0].equals("scan-integer");
        String input = "123 456 ".repeat(1_000);
        int warmup = args.length > 1 ? Integer.parseInt(args[1]) : numeric ? 100 : 10_000;
        int rounds = args.length > 2 ? Integer.parseInt(args[2]) : numeric ? 200 : 20_000;
        for (int i = 0; i < warmup; i++) work(args[0], input);
        long bytes = bean.getThreadAllocatedBytes(thread);
        long start = System.nanoTime();
        for (int i = 0; i < rounds; i++) work(args[0], input);
        long time = System.nanoTime() - start;
        long allocated = bean.getThreadAllocatedBytes(thread) - bytes;
        int operations = rounds * (numeric ? 2_000 : 1);
        System.out.println(time / (double) operations + " " + allocated / (double) operations);
    }
    static void work(String mode, String input) {
        if (!mode.equals("scan-integer")) {
            ScannerProbe.work(mode);
            return;
        }
        long sum = 0;
        try (Scanner scanner = new Scanner(input)) {
            while (scanner.hasNextInt()) sum += scanner.nextInt();
        }
        sink = sum;
    }
}
