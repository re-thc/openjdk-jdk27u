// Scanner-specific qualification probe. See the repository LICENSE.
import java.lang.management.ManagementFactory;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.InputMismatchException;
import java.util.Locale;
import java.util.Scanner;
import scannerprovider.State;

public class ScannerPhases {
    static volatile long sink;
    static final String MANY = "123 456 ".repeat(1_000);
    static final String LARGE = "a".repeat(65_536) + "\nb\n";
    static final BigInteger BIG = new BigInteger("123456789012345678901234567890");
    static final BigDecimal DECIMAL = new BigDecimal("12345.5");
    static final Locale ARABIC = Locale.forLanguageTag("en-US-u-nu-arab");

    public static void main(String[] args) {
        String mode = args[0];
        if (mode.equals("spi-text")) State.prepare(false);
        var bean = (com.sun.management.ThreadMXBean) ManagementFactory.getThreadMXBean();
        if (!bean.isThreadAllocatedMemorySupported()) throw new AssertionError("allocation unsupported");
        bean.setThreadAllocatedMemoryEnabled(true);
        long thread = Thread.currentThread().threadId();
        int[] counts = switch (mode) {
            case "integer", "double" -> new int[] {1_000, 9_000, 20_000, 170_000, 100_000};
            case "scan-int" -> new int[] {100, 200, 700, 2_000};
            case "large-line" -> new int[] {10, 90, 200};
            default -> new int[] {1_000, 9_000, 20_000};
        };
        if (args.length == 2 && args[1].equals("check")) counts = new int[] {1};
        else if (args.length != 1) throw new IllegalArgumentException("mode [check]");
        for (int window = 0; window < counts.length; window++) {
            long sum = 0;
            long bytes = bean.getThreadAllocatedBytes(thread);
            long start = System.nanoTime();
            for (int i = 0; i < counts[window]; i++) sum += work(mode);
            long elapsed = System.nanoTime() - start;
            long allocated = bean.getThreadAllocatedBytes(thread) - bytes;
            sink = sum;
            long operations = (long) counts[window] * (mode.equals("scan-int") ? 2_000 : 1);
            System.out.println("ROW," + window + "," + operations + "," + elapsed
                    + "," + allocated + "," + sum);
        }
    }

    static long work(String mode) {
        String input = switch (mode) {
            case "integer" -> "123 456";
            case "double" -> "123.5 456.5";
            case "big-int" -> "123456789012345678901234567890";
            case "big-decimal" -> "12345.5";
            case "mixed" -> "alpha\ntrue 123 4.5";
            case "invalid" -> "bad 2147483648 7";
            case "radix" -> "ff 10 101 z";
            case "german" -> "1.234 2,5";
            case "arabic" -> "\u0661\u066c\u0662\u0663\u0664\u066b\u0665";
            case "locale" -> "1.5 1.234";
            case "scan-int" -> MANY;
            case "large-line" -> LARGE;
            default -> "alpha\nbeta\n";
        };
        try (Scanner scanner = new Scanner(input)) {
            switch (mode) {
                case "integer" -> require(scanner.nextInt() == 123);
                case "double" -> require(scanner.nextDouble() == 123.5);
                case "big-int" -> require(scanner.nextBigInteger().equals(BIG));
                case "big-decimal" -> require(scanner.nextBigDecimal().equals(DECIMAL));
                case "line", "host-text" -> require(scanner.nextLine().equals("alpha"));
                case "tokens" -> require(scanner.tokens().toList().equals(java.util.List.of("alpha", "beta")));
                case "spi-text" -> {
                    String locale = Locale.getDefault(Locale.Category.FORMAT).toLanguageTag();
                    require(State.requests.equals(java.util.List.of("number=" + locale, "symbols=" + locale)));
                    require(scanner.nextLine().equals("alpha"));
                    State.clearTrace();
                }
                case "mixed" -> {
                    require(scanner.nextLine().equals("alpha") && scanner.nextBoolean());
                    require(scanner.hasNextInt() && scanner.nextInt() == 123);
                    require(scanner.nextDouble() == 4.5);
                }
                case "invalid" -> {
                    require(!scanner.hasNextInt());
                    mismatch(scanner);
                    require(scanner.next().equals("bad") && !scanner.hasNextInt());
                    mismatch(scanner);
                    require(scanner.next().equals("2147483648") && scanner.nextInt() == 7);
                }
                case "radix" -> {
                    require(scanner.useRadix(16).nextInt() == 255 && scanner.nextInt(2) == 2);
                    require(scanner.useRadix(2).nextInt() == 5 && scanner.useRadix(36).nextInt() == 35);
                }
                case "german" -> {
                    scanner.useLocale(Locale.GERMANY);
                    require(scanner.nextInt() == 1234 && scanner.nextDouble() == 2.5);
                }
                case "arabic" -> require(scanner.useLocale(ARABIC).nextDouble() == 1234.5);
                case "locale" -> {
                    scanner.useLocale(Locale.US).useLocale(Locale.US);
                    require(scanner.nextBigDecimal().equals(new BigDecimal("1.5")));
                    require(scanner.useLocale(Locale.GERMANY).nextBigDecimal().equals(new BigDecimal("1234")));
                    require(scanner.useRadix(16).reset().radix() == 10);
                    require(scanner.locale().equals(Locale.US));
                    try (Scanner cache = new Scanner("1,234 2,5").useLocale(Locale.US)) {
                        require(cache.hasNextInt() && cache.useLocale(Locale.US).nextInt() == 1234);
                        require(cache.useLocale(Locale.GERMANY).hasNextDouble());
                        require(cache.useLocale(Locale.US).nextDouble() == 2.5);
                    }
                }
                case "debug" -> {
                    require(scanner.toString().contains("[group separator="));
                    require(scanner.next().equals("alpha"));
                }
                case "scan-int" -> {
                    long sum = 0;
                    while (scanner.hasNextInt()) sum += scanner.nextInt();
                    require(sum == 579_000);
                }
                case "large-line" -> require(scanner.nextLine().length() == 65_536);
                default -> throw new IllegalArgumentException(mode);
            }
        }
        return 1;
    }

    static void mismatch(Scanner scanner) {
        try {
            scanner.nextInt();
            throw new AssertionError("expected mismatch");
        } catch (InputMismatchException expected) { }
    }

    static void require(boolean value) {
        if (!value) throw new AssertionError("Scanner workload result");
    }
}
