/* Bounded complete-operation comparison; run separate, alternating JVMs.
 * Measures one gathering send plus one scattering receive. Native metadata
 * allocation is NOT visible to Java allocation profilers; count it separately.
 */
import java.lang.management.ManagementFactory;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.StandardSocketOptions;
import java.nio.ByteBuffer;
import java.nio.channels.*;
import java.util.concurrent.TimeUnit;

public class WindowsVectorIOCost {
    private static final long DEADLINE = System.nanoTime()
            + TimeUnit.SECONDS.toNanos(20);

    public static void main(String[] args) throws Exception {
        String protocol = args[0];
        int vectors = Integer.parseInt(args[1]);
        int bytes = Integer.parseInt(args[2]);
        int iterations = Integer.parseInt(args[3]);
        if ((!protocol.equals("tcp") && !protocol.equals("udp"))
                || vectors < 1 || vectors > 16 || bytes < vectors || bytes > 4096
                || iterations < 1 || iterations > 100000) {
            throw new IllegalArgumentException("bounded tcp|udp vectors bytes iterations");
        }
        var loopback = new InetSocketAddress(InetAddress.getLoopbackAddress(), 0);
        try (ServerSocketChannel listener = ServerSocketChannel.open();
             DatagramChannel udpSource = DatagramChannel.open();
             DatagramChannel udpSink = DatagramChannel.open()) {
            listener.bind(loopback);
            try (SocketChannel tcpSource = SocketChannel.open(listener.getLocalAddress());
                 SocketChannel tcpSink = listener.accept()) {
                tcpSource.setOption(StandardSocketOptions.TCP_NODELAY, true);
                tcpSource.configureBlocking(false);
                tcpSink.configureBlocking(false);
                udpSource.bind(loopback);
                udpSink.bind(loopback);
                udpSource.connect(udpSink.getLocalAddress());
                udpSink.connect(udpSource.getLocalAddress());
                udpSource.configureBlocking(false);
                udpSink.configureBlocking(false);
                GatheringByteChannel source = protocol.equals("tcp") ? tcpSource : udpSource;
                ScatteringByteChannel sink = protocol.equals("tcp") ? tcpSink : udpSink;
                ByteBuffer[] src = new ByteBuffer[vectors], dst = new ByteBuffer[vectors];
                for (int i = 0; i < vectors; i++) {
                    int n = bytes / vectors + (i < bytes % vectors ? 1 : 0);
                    src[i] = ByteBuffer.allocateDirect(n);
                    dst[i] = ByteBuffer.allocateDirect(n);
                    for (int j = 0; j < n; j++) src[i].put(j, (byte) (i + j));
                }
                transfer(source, sink, src, dst, bytes, Math.min(iterations, 2000));
                var os = (com.sun.management.OperatingSystemMXBean)
                        ManagementFactory.getOperatingSystemMXBean();
                long cpu = os.getProcessCpuTime();
                long start = System.nanoTime();
                long calls = transfer(source, sink, src, dst, bytes, iterations);
                long elapsed = System.nanoTime() - start;
                cpu = os.getProcessCpuTime() - cpu;
                for (int i = 0; i < vectors; i++) {
                    for (int j = 0; j < src[i].capacity(); j++) {
                        if (src[i].get(j) != dst[i].get(j)) {
                            throw new AssertionError("contents");
                        }
                    }
                }
                System.out.printf("%s,%d,%d,%d,%d,%d,%d%n", protocol, vectors,
                        bytes, iterations, elapsed, cpu, calls);
            }
        }
    }

    private static long transfer(GatheringByteChannel source, ScatteringByteChannel sink,
                                  ByteBuffer[] src, ByteBuffer[] dst,
                                  int bytes, int iterations) throws Exception {
        long calls = 0;
        for (int round = 0; round < iterations; round++) {
            for (ByteBuffer b : src) b.clear();
            for (ByteBuffer b : dst) b.clear();
            long sent = 0, received = 0;
            while (received < bytes) {
                if (System.nanoTime() - DEADLINE >= 0) {
                    throw new RuntimeException("Cost comparison timed out");
                }
                if (sent < bytes) { sent += source.write(src); calls++; }
                long n = sink.read(dst);
                calls++;
                if (n < 0) throw new AssertionError("EOF");
                received += n;
                if (n == 0) Thread.onSpinWait();
            }
        }
        return calls;
    }
}
