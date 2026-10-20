public class ColdScans {
    static volatile Object result;
    public static void main(String[] args) {
        String op = args[0];
        String s = args[1].equals("empty") ? "" :
                op.startsWith("lines") ? "x".repeat(4096) + "\r\n" + "y".repeat(4096) : " \t\n\u001c".repeat(1024);
        long elapsed;
        switch (op) {
            case "trim" -> { long start = System.nanoTime(); String value = s.trim(); elapsed = System.nanoTime() - start; result = value; }
            case "strip" -> { long start = System.nanoTime(); String value = s.strip(); elapsed = System.nanoTime() - start; result = value; }
            case "stripLeading" -> { long start = System.nanoTime(); String value = s.stripLeading(); elapsed = System.nanoTime() - start; result = value; }
            case "stripTrailing" -> { long start = System.nanoTime(); String value = s.stripTrailing(); elapsed = System.nanoTime() - start; result = value; }
            case "isBlank" -> { long start = System.nanoTime(); boolean value = s.isBlank(); elapsed = System.nanoTime() - start; result = value; }
            case "linesCount" -> { long start = System.nanoTime(); long value = s.lines().count(); elapsed = System.nanoTime() - start; result = value; }
            case "linesFirst" -> { long start = System.nanoTime(); String value = s.lines().findFirst().orElse(""); elapsed = System.nanoTime() - start; result = value; }
            default -> throw new IllegalArgumentException(op);
        }
        System.out.println(elapsed);
    }
}
