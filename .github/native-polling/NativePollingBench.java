/* Test-only matched complete-operation probe; no production flags or hooks. */
import java.lang.management.ManagementFactory;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.StandardSocketOptions;
import java.nio.ByteBuffer;
import java.nio.channels.Pipe;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

public class NativePollingBench {
    static final int READ = SelectionKey.OP_READ;
    static final int WRITE = SelectionKey.OP_WRITE;
    static final com.sun.management.OperatingSystemMXBean OS =
        (com.sun.management.OperatingSystemMXBean) ManagementFactory.getOperatingSystemMXBean();
    static final com.sun.management.ThreadMXBean THREADS =
        (com.sun.management.ThreadMXBean) ManagementFactory.getThreadMXBean();
    static long allocations() {
        return THREADS.isThreadAllocatedMemorySupported()
            ? THREADS.getThreadAllocatedBytes(Thread.currentThread().threadId()) : -1;
    }
    static class Stats {
        long wall, cpu, allocated, units, operations, changes, partialWrites, checksum;
        long drain, latencySamples;
        final long[] histogram = new long[1024];
        void latency(long value) {
            int power = 63 - Long.numberOfLeadingZeros(Math.max(1, value));
            int sub = (int) ((value - (1L << power)) >>> Math.max(0, power - 4));
            histogram[Math.min(histogram.length - 1, power * 16 + Math.min(15, sub))]++;
            latencySamples++;
        }
        long quantile(double fraction) {
            if (latencySamples == 0) return 0;
            long target = (long) Math.ceil(latencySamples * fraction), sum = 0;
            for (int i = 0; i < histogram.length; i++) {
                sum += histogram[i];
                if (sum >= target) {
                    int power = i / 16;
                    return (1L << power) + (long) (i % 16 + 1) * (1L << Math.max(0, power - 4));
                }
            }
            throw new AssertionError();
        }
    }
    static class State {
        final SocketChannel channel;
        final byte[] payload, incoming;
        final ByteBuffer tx, rx;
        SelectionKey key;
        boolean active;
        long sent;
        State(SocketChannel channel, int size) {
            this.channel = channel;
            payload = new byte[size]; incoming = new byte[size];
            for (int i = 0; i < size; i++) payload[i] = (byte) (i * 31 + 17);
            tx = ByteBuffer.wrap(payload); rx = ByteBuffer.wrap(incoming);
        }
    }
    static class Tcp implements AutoCloseable {
        final String kind;
        final Selector selector = Selector.open();
        final List<State> states = new ArrayList<>();
        final List<SocketChannel> peers = new ArrayList<>();
        final List<Thread> workers = new ArrayList<>();
        final AtomicBoolean stopping = new AtomicBoolean();
        final AtomicReference<Throwable> error = new AtomicReference<>();
        final boolean pressure;
        int sendBufferMin = Integer.MAX_VALUE, sendBufferMax;
        int receiveBufferMin = Integer.MAX_VALUE, receiveBufferMax;
        Tcp(String kind) throws Exception {
            this.kind = kind;
            pressure = kind.equals("backpressure");
            int count = kind.equals("single") ? 1 : kind.equals("bulk") ? 137 : 64;
            try (ServerSocketChannel server = ServerSocketChannel.open()) {
                server.bind(new InetSocketAddress(InetAddress.getLoopbackAddress(), 0));
                for (int i = 0; i < count; i++) {
                    SocketChannel client = SocketChannel.open();
                    try {
                        if (pressure) client.setOption(StandardSocketOptions.SO_SNDBUF, 16 * 1024);
                        client.connect(server.getLocalAddress());
                        SocketChannel peer = server.accept();
                        peers.add(peer);
                        int send = client.getOption(StandardSocketOptions.SO_SNDBUF);
                        int receive = peer.getOption(StandardSocketOptions.SO_RCVBUF);
                        sendBufferMin = Math.min(sendBufferMin, send); sendBufferMax = Math.max(sendBufferMax, send);
                        receiveBufferMin = Math.min(receiveBufferMin, receive); receiveBufferMax = Math.max(receiveBufferMax, receive);
                        client.configureBlocking(false);
                        State state = new State(client, pressure ? 128 * 1024 : 1024);
                        state.key = client.register(selector, READ, state);
                        states.add(state);
                        Thread worker = Thread.ofPlatform().daemon(true).unstarted(() -> echo(peer));
                        workers.add(worker); worker.start();
                    } catch (Throwable failure) {
                        client.close(); throw failure;
                    }
                }
                selector.selectNow();
            } catch (Throwable failure) {
                close(); throw failure;
            }
        }
        void echo(SocketChannel peer) {
            ByteBuffer buffer = ByteBuffer.allocate(16 * 1024);
            try {
                while (!stopping.get()) {
                    if (pressure) Thread.sleep(5);
                    int n = peer.read(buffer);
                    if (n < 0) break;
                    buffer.flip();
                    while (buffer.hasRemaining()) peer.write(buffer);
                    buffer.clear();
                }
            } catch (Throwable failure) {
                if (!stopping.get()) error.compareAndSet(null, failure);
            }
        }
        void mask(State state, int mask, Stats stats) {
            int old = state.key.interestOps();
            if (old != mask) {
                state.key.interestOps(mask);
                stats.changes += Integer.bitCount(old ^ mask);
            }
        }
        void write(State state, Stats stats) throws Exception {
            int before = state.tx.remaining();
            int n = state.channel.write(state.tx);
            if (n < before) stats.partialWrites++;
            if (pressure) {
                mask(state, READ | (state.tx.hasRemaining() ? WRITE : 0), stats);
            } else {
                // Fixed READ-interest control: bounded direct completion, never a
                // hidden WRITE registration. Any partial occurrence is reported.
                long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(500);
                while (state.tx.hasRemaining()) {
                    if (System.nanoTime() > deadline) throw new AssertionError("Small write did not complete");
                    state.channel.write(state.tx);
                    Thread.onSpinWait();
                }
            }
        }
        void start(State state, Stats stats) throws Exception {
            state.tx.clear(); state.rx.clear(); state.sent = System.nanoTime(); state.active = true;
            write(state, stats);
        }
        Stats phase(long millis) throws Exception {
            Stats stats = new Stats();
            long allocated = allocations(), cpu = OS.getProcessCpuTime(), start = System.nanoTime();
            long until = start + TimeUnit.MILLISECONDS.toNanos(millis), drainDeadline = until + TimeUnit.SECONDS.toNanos(2);
            for (State state : states) start(state, stats);
            boolean toggle = false;
            int pending = states.size();
            while (pending != 0) {
                long now = System.nanoTime();
                if (now > drainDeadline) throw new AssertionError("Incomplete TCP delivery at drain deadline");
                if (error.get() != null) throw new AssertionError("Peer failed", error.get());
                boolean issuing = now < until;
                if (kind.equals("single") || kind.equals("bulk")) {
                    toggle = !toggle;
                    for (State state : states) {
                        if (kind.equals("bulk")) mask(state, toggle ? READ | WRITE : 0, stats);
                        else mask(state, READ | (toggle ? WRITE : 0), stats);
                    }
                    selector.selectNow();
                } else selector.select(100);
                var iterator = selector.selectedKeys().iterator();
                while (iterator.hasNext()) {
                    SelectionKey key = iterator.next(); iterator.remove();
                    State state = (State) key.attachment();
                    if (!state.active) continue;
                    if (key.isWritable() && state.tx.hasRemaining()) write(state, stats);
                    if (key.isReadable()) {
                        int n = state.channel.read(state.rx);
                        if (n < 0) throw new AssertionError("Unexpected EOF");
                        if (!state.rx.hasRemaining()) {
                            if (state.tx.hasRemaining()) throw new AssertionError("Response preceded complete request");
                            if (!Arrays.equals(state.payload, state.incoming)) throw new AssertionError("Payload mismatch");
                            stats.units += state.payload.length; stats.operations++;
                            stats.checksum = Long.rotateLeft(stats.checksum, 1) ^ state.payload.length ^ 0x517cc1b727220a95L;
                            stats.latency(System.nanoTime() - state.sent);
                            state.active = false; pending--;
                            if (issuing && System.nanoTime() < until) { start(state, stats); pending++; }
                        }
                    }
                }
            }
            for (State state : states) mask(state, READ, stats);
            selector.selectNow(); selector.selectedKeys().clear();
            stats.wall = System.nanoTime() - start;
            stats.cpu = OS.getProcessCpuTime() - cpu;
            stats.allocated = allocated < 0 ? -1 : allocations() - allocated;
            stats.drain = Math.max(0, stats.wall - TimeUnit.MILLISECONDS.toNanos(millis));
            if (stats.operations == 0) throw new AssertionError("No complete messages");
            if (pressure && stats.partialWrites == 0) throw new AssertionError("Backpressure was not induced");
            return stats;
        }
        public void close() throws Exception {
            stopping.set(true);
            List<Throwable> failures = new ArrayList<>();
            for (State state : states) try { state.channel.close(); } catch (Throwable t) { failures.add(t); }
            for (SocketChannel peer : peers) try { peer.close(); } catch (Throwable t) { failures.add(t); }
            try { selector.close(); } catch (Throwable t) { failures.add(t); }
            long end = System.nanoTime() + TimeUnit.SECONDS.toNanos(2);
            for (Thread worker : workers) {
                long remaining = end - System.nanoTime();
                if (remaining > 0) worker.join(Math.max(1, TimeUnit.NANOSECONDS.toMillis(remaining)));
                if (worker.isAlive()) failures.add(new AssertionError("Peer worker did not stop"));
            }
            if (!failures.isEmpty()) {
                Exception failure = new Exception("TCP teardown failed");
                failures.forEach(failure::addSuppressed); throw failure;
            }
        }
    }
    static Stats control(String kind, long millis) throws Exception {
        Stats stats = new Stats();
        int count = kind.startsWith("register") ? Integer.parseInt(kind.substring(8)) : 0;
        List<Pipe> pipes = new ArrayList<>();
        try (Selector selector = Selector.open()) {
            for (int i = 0; i < count; i++) {
                Pipe pipe = Pipe.open(); pipes.add(pipe);
                pipe.source().configureBlocking(false); pipe.source().register(selector, READ);
            }
            selector.selectNow();
            long allocated = allocations(), cpu = OS.getProcessCpuTime(), start = System.nanoTime();
            long deadline = start + TimeUnit.MILLISECONDS.toNanos(millis);
            do {
                if (count == 0) {
                    try (Selector constructed = Selector.open()) { constructed.selectNow(); }
                    stats.units++; stats.operations++;
                } else {
                    for (Pipe pipe : pipes) pipe.source().keyFor(selector).interestOps(0);
                    if (selector.selectNow() != 0) throw new AssertionError("Unexpected pipe readiness");
                    for (Pipe pipe : pipes) pipe.source().keyFor(selector).interestOps(READ);
                    if (selector.selectNow() != 0) throw new AssertionError("Unexpected pipe readiness");
                    stats.units += count * 2L; stats.changes += count * 2L; stats.operations++;
                }
            } while (System.nanoTime() < deadline);
            stats.wall = System.nanoTime() - start;
            stats.cpu = OS.getProcessCpuTime() - cpu;
            stats.allocated = allocated < 0 ? -1 : allocations() - allocated;
        } finally {
            for (Pipe pipe : pipes) { pipe.source().close(); pipe.sink().close(); }
        }
        return stats;
    }
    static void phaseObservation(String kind, String phase, Stats stats) {
        System.out.println("NATIVE_POLLING_PHASE {\"case\":\"" + kind + "\",\"phase\":\"" + phase
            + "\",\"wall_ns\":" + stats.wall + ",\"cpu_ns\":" + stats.cpu
            + ",\"allocated_main_thread_bytes\":" + stats.allocated + ",\"units\":" + stats.units
            + ",\"operations\":" + stats.operations + ",\"effective_filter_changes\":" + stats.changes
            + ",\"partial_writes\":" + stats.partialWrites + ",\"drain_ns\":" + stats.drain
            + ",\"checksum\":\"" + Long.toUnsignedString(stats.checksum)
            + "\",\"histogram_log2_sub16\":" + Arrays.toString(stats.histogram) + "}");
    }
    public static void main(String[] args) throws Exception {
        if (args.length != 3) throw new IllegalArgumentException("case warmup-ms measure-ms");
        String kind = args[0];
        if (!List.of("stable", "single", "bulk", "backpressure", "register63", "register64", "register65", "construct").contains(kind))
            throw new IllegalArgumentException(kind);
        long warmup = Long.parseLong(args[1]), measure = Long.parseLong(args[2]);
        if (warmup <= 0 || measure <= 0 || warmup > 3000 || measure > 10000) throw new IllegalArgumentException();
        if (THREADS.isThreadAllocatedMemorySupported() && !THREADS.isThreadAllocatedMemoryEnabled())
            THREADS.setThreadAllocatedMemoryEnabled(true);
        Stats stats, warmStats;
        int sendMin = 0, sendMax = 0, receiveMin = 0, receiveMax = 0;
        if (kind.startsWith("register") || kind.equals("construct")) {
            warmStats = control(kind, warmup); phaseObservation(kind, "warmup", warmStats);
            stats = control(kind, measure); phaseObservation(kind, "measurement", stats);
        } else {
            try (Tcp tcp = new Tcp(kind)) {
                warmStats = tcp.phase(warmup); phaseObservation(kind, "warmup", warmStats);
                stats = tcp.phase(measure); phaseObservation(kind, "measurement", stats);
                sendMin = tcp.sendBufferMin; sendMax = tcp.sendBufferMax;
                receiveMin = tcp.receiveBufferMin; receiveMax = tcp.receiveBufferMax;
            }
        }
        if (stats.wall <= 0 || stats.cpu <= 0 || stats.units <= 0) throw new AssertionError("Invalid metrics");
        String unit = kind.startsWith("register") ? "filter_changes" : kind.equals("construct") ? "selector_lifecycles" : "verified_response_bytes";
        System.out.println("NATIVE_POLLING_RESULT {\"case\":\"" + kind + "\",\"verified\":true,\"warmup_ms\":" + warmup
            + ",\"measure_ms\":" + measure + ",\"unit\":\"" + unit + "\""
            + ",\"warmup\":{\"wall_ns\":" + warmStats.wall + ",\"cpu_ns\":" + warmStats.cpu
            + ",\"allocated_main_thread_bytes\":" + warmStats.allocated + ",\"units\":" + warmStats.units
            + ",\"operations\":" + warmStats.operations + ",\"effective_filter_changes\":" + warmStats.changes
            + ",\"partial_writes\":" + warmStats.partialWrites + ",\"drain_ns\":" + warmStats.drain
            + ",\"checksum\":\"" + Long.toUnsignedString(warmStats.checksum) + "\""
            + ",\"histogram_log2_sub16\":" + Arrays.toString(warmStats.histogram) + "}"
            + ",\"wall_ns\":" + stats.wall + ",\"cpu_ns\":" + stats.cpu
            + ",\"allocated_main_thread_bytes\":" + (stats.allocated < 0 ? "null" : stats.allocated)
            + ",\"units\":" + stats.units + ",\"operations\":" + stats.operations + ",\"effective_filter_changes\":" + stats.changes
            + ",\"partial_writes\":" + stats.partialWrites + ",\"drain_ns\":" + stats.drain
            + ",\"checksum\":\"" + Long.toUnsignedString(stats.checksum) + "\",\"latency_p50_upper_ns\":" + stats.quantile(.50)
            + ",\"latency_p95_upper_ns\":" + stats.quantile(.95) + ",\"latency_p99_upper_ns\":" + stats.quantile(.99)
            + ",\"send_buffer_min\":" + sendMin + ",\"send_buffer_max\":" + sendMax
            + ",\"peer_receive_buffer_min\":" + receiveMin + ",\"peer_receive_buffer_max\":" + receiveMax
            + ",\"histogram_log2_sub16\":" + Arrays.toString(stats.histogram) + "}");
    }
}
