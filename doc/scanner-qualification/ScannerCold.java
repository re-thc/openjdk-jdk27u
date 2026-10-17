// Scanner-specific qualification probe. See the repository LICENSE.
import java.util.Scanner;

public class ScannerCold {
    static volatile Object sink;

    public static void main(String[] args) throws java.io.IOException {
        boolean allocation = args[0].equals("allocation");
        com.sun.management.ThreadMXBean bean = null;
        if (allocation) {
            bean = (com.sun.management.ThreadMXBean)
                    java.lang.management.ManagementFactory.getThreadMXBean();
            if (!bean.isThreadAllocatedMemorySupported()) throw new AssertionError("allocation unsupported");
            bean.setThreadAllocatedMemoryEnabled(true);
        }
        long thread = Thread.currentThread().threadId();
        System.out.println("READY");
        if (System.in.read() != 1) throw new AssertionError("missing controller acknowledgement");
        long bytes = allocation ? bean.getThreadAllocatedBytes(thread) : -1;
        long start = System.nanoTime();
        work(args[1]);
        long elapsed = System.nanoTime() - start;
        long allocated = allocation ? bean.getThreadAllocatedBytes(thread) - bytes : -1;
        Object expected = switch (args[1]) {
            case "empty" -> null;
            case "line", "host-line", "next" -> "alpha";
            case "tokens" -> java.util.List.of("alpha", "beta");
            case "boolean" -> Boolean.TRUE;
            case "integer" -> Integer.valueOf(123);
            case "double" -> Double.valueOf(123.5);
            default -> throw new IllegalArgumentException(args[1]);
        };
        if (!java.util.Objects.equals(sink, expected)) throw new AssertionError("first-use result");
        System.out.println("ROW,cold,1," + elapsed + "," + allocated + ",1");
    }

    static void work(String mode) {
        if (mode.equals("empty")) return;
        String input = switch (mode) {
            case "integer" -> "123 456";
            case "double" -> "123.5 456.5";
            case "boolean" -> "true false";
            default -> "alpha\nbeta\n";
        };
        try (Scanner scanner = new Scanner(input)) {
            sink = switch (mode) {
                case "line", "host-line" -> scanner.nextLine();
                case "next" -> scanner.next();
                case "tokens" -> scanner.tokens().toList();
                case "boolean" -> scanner.nextBoolean();
                case "integer" -> scanner.nextInt();
                case "double" -> scanner.nextDouble();
                default -> throw new IllegalArgumentException(mode);
            };
        }
    }
}
