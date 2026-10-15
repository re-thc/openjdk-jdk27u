public class MultiplyLoops {
    private static long[] a = new long[4110], b = new long[4110], d = new long[4110];
    private static byte[] ba = new byte[4110], bb = new byte[4110], bd = new byte[4110], be = new byte[4110];
    private static short[] sa = new short[4110], sb = new short[4110], sd = new short[4110], se = new short[4110];
    private static int[] ia = new int[4110], ib = new int[4110], id = new int[4110], ie = new int[4110];

    public static void fourLongs(int from, int end) {
        for (int i = from; i < end; i++) { long x = a[i]; d[i] = x * x * x * x; }
    }
    public static void differentLongs(int from, int end) {
        for (int i = from; i < end; i++) { long x = a[i]; d[i] = x * x * x * b[i]; }
    }
    public static void bytes(int from, int end, byte factor) {
        for (int i = from; i < end; i++) { bd[i] = (byte) (factor * ba[i]); be[i] = (byte) (factor * bb[i]); }
    }
    public static void shorts(int from, int end, short factor) {
        for (int i = from; i < end; i++) { sd[i] = (short) (factor * sa[i]); se[i] = (short) (factor * sb[i]); }
    }
    public static void ints(int from, int end, int factor) {
        for (int i = from; i < end; i++) { id[i] = factor * ia[i]; ie[i] = factor * ib[i]; }
    }
    public static void main(String[] args) {
        for (int i = 0; i < a.length; i++) {
            a[i] = i * 0x1234_5678_9abcl + 0x1020_3040_5060_7080L;
            b[i] = i * -0x3344_5566_7788L + 0x7fff_0000_1234_5678L;
            ba[i] = (byte) i; bb[i] = (byte) -i;
            sa[i] = (short) (i * 19); sb[i] = (short) (i * -23);
            ia[i] = i * 0x12345 - 0x5678_9abc; ib[i] = 0x1357_2468 - i * 0x54321;
        }
        int warmup = args.length > 0 ? Integer.parseInt(args[0]) : 1000;
        long checksum = 0;
        for (int round = 0; round < warmup; round++) {
            int from = round % 4;
            int end = from + 1027;
            fourLongs(from, end);
            differentLongs(from, end);
            bytes(from, end, (byte) -7); shorts(from, end, (short) -311); ints(from, end, -104729);
        }
        for (int from : new int[] {0, 1, 3}) {
            for (int length : new int[] {0, 1, 3, 7, 15, 16, 17, 31, 32, 33, 65, 1024, 4099}) {
                int end = from + length;
                fourLongs(from, end);
                for (int i = from; i < end; i++) {
                    long x = a[i]; if (d[i] != x * x * x * x) throw new AssertionError("fourLongs");
                    checksum += d[i];
                }
                differentLongs(from, end);
                for (int i = from; i < end; i++) {
                    long x = a[i]; if (d[i] != x * x * x * b[i]) throw new AssertionError("differentLongs");
                    checksum += d[i];
                }
                bytes(from, end, (byte) -7); shorts(from, end, (short) -311); ints(from, end, -104729);
                for (int i = from; i < end; i++) {
                    if (bd[i] != (byte) (-7 * ba[i]) || be[i] != (byte) (-7 * bb[i])) throw new AssertionError("bytes");
                    if (sd[i] != (short) (-311 * sa[i]) || se[i] != (short) (-311 * sb[i])) throw new AssertionError("shorts");
                    if (id[i] != -104729 * ia[i] || ie[i] != -104729 * ib[i]) throw new AssertionError("ints");
                    checksum += bd[i] + be[i] + sd[i] + se[i] + id[i] + ie[i];
                }
            }
        }
        System.out.printf("checksum=%016x%n", checksum);
    }
}
