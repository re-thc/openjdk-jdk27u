public class IntrinsicScanProbe {
    public static void main(String[] args) {
        String pad = " \t\n\u001c".repeat(1024);
        String lines = "x".repeat(4096) + "\r\n" + "x".repeat(4096);
        long sum = 0;
        for (int i = 0; i < 30000; i++) {
            if (!pad.isBlank() || !pad.trim().isEmpty() || !pad.stripTrailing().isEmpty()) throw new AssertionError();
            sum += lines.lines().count();
        }
        if (sum != 60000) throw new AssertionError(sum);
    }
}
