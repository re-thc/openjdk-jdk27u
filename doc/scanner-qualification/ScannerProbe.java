import java.util.Scanner;

public class ScannerProbe {
    static volatile Object sink;
    public static void main(String[] args) {
        String mode = args[0];
        System.out.println("READY");
        long start = System.nanoTime();
        work(mode);
        long elapsed = System.nanoTime() - start;
        System.out.println(elapsed);
    }
    static void work(String mode) {
        if (mode.equals("empty")) return;
        try (Scanner scanner = new Scanner(input(mode))) {
            sink = switch (mode) {
                case "line" -> scanner.nextLine();
                case "next" -> scanner.next();
                case "tokens" -> scanner.tokens().toList();
                case "boolean" -> scanner.nextBoolean();
                case "integer" -> scanner.nextInt();
                case "double" -> scanner.nextDouble();
                default -> throw new IllegalArgumentException(mode);
            };
        }
    }
    static String input(String mode) {
        return switch (mode) {
            case "boolean" -> "true false";
            case "integer" -> "123 456";
            case "double" -> "123.5 456.5";
            default -> "alpha\nbeta\n";
        };
    }
}
