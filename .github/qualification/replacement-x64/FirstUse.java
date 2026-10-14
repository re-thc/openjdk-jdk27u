import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.Arrays;

// Each measurement runs in a fresh JVM. Time the actual first public API call,
// including its class initialization, separately from warmed JMH measurements.
public class FirstUse {
    public static void main(String[] args) throws Exception {
        byte[] input = new byte[64];
        for (int i = 0; i < input.length; i++) input[i] = (byte) (i * 31 + 1);
        long start = System.nanoTime();
        int result;
        switch (args[0]) {
            case "hash" -> result = Arrays.hashCode(input);
            case "sha256" -> result = Arrays.hashCode(MessageDigest.getInstance("SHA-256").digest(input));
            case "multiply" -> {
                BigInteger value = new BigInteger(1, input);
                result = value.multiply(value).hashCode();
            }
            case "scalar" -> result = Long.bitCount(0x9876543210fedcbaL);
            default -> throw new IllegalArgumentException(args[0]);
        }
        long elapsed = System.nanoTime() - start;
        System.out.println(elapsed + " " + result);
    }
}
