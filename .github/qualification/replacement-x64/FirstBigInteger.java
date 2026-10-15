import java.math.BigInteger;
public class FirstBigInteger {
    public static void main(String[] args) {
        int bits = Integer.parseInt(args[1]);
        byte[] input = new byte[bits / 8];
        for (int i = 0; i < input.length; i++) input[i] = (byte) (i * 31 + 1);
        long start = System.nanoTime();
        BigInteger value = new BigInteger(1, input);
        BigInteger result;
        if (args[0].equals("multiply")) {
            result = value.multiply(value);
        } else {
            BigInteger modulus = value.setBit(bits - 1).setBit(0);
            result = value.modPow(BigInteger.valueOf(65537), modulus);
        }
        long elapsed = System.nanoTime() - start;
        System.out.println(elapsed + " " + result.hashCode());
    }
}
