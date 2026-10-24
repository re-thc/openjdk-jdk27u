/* Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only
 */
import java.lang.management.ManagementFactory;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.StandardSocketOptions;
import java.nio.ByteBuffer;
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
    static final boolean TRACE = System.getProperty("native.polling.trace") != null;
    static final int READ = SelectionKey.OP_READ, WRITE = SelectionKey.OP_WRITE;
    static final com.sun.management.OperatingSystemMXBean OS =
        (com.sun.management.OperatingSystemMXBean) ManagementFactory.getOperatingSystemMXBean();
    static final com.sun.management.ThreadMXBean THREADS =
        (com.sun.management.ThreadMXBean) ManagementFactory.getThreadMXBean();
    static long allocations() { return THREADS.getThreadAllocatedBytes(Thread.currentThread().threadId()); }
    static String quote(String s) { return "\"" + s.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r") + "\""; }
    static int connections(String kind) { return kind.equals("construct") ? 0 : kind.equals("single") ? 1 : kind.equals("bulk") ? 137 : 64; }
    static int payloadSize(String kind) { return kind.equals("construct") ? 0 : kind.equals("backpressure") ? 128 * 1024 : 1024; }
    static int bufferSize(String kind) { return kind.equals("backpressure") ? 16 * 1024 : 64 * 1024; }
    static void checkSelector(Selector s) {
        if (!s.getClass().getName().equals("sun.nio.ch.KQueueSelectorImpl")) throw new AssertionError("Wrong selector provider");
    }
    static class Stats {
        long wall, cpu, allocated, units, operations, rounds, changes, partialWrites, zeroWrites;
        long writes, reads, selections, checksum, drain, latencySamples;
        long[] trace;
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
        String json() {
            return "{\"wall_ns\":" + wall + ",\"cpu_ns\":" + cpu + ",\"allocated_main_thread_bytes\":" + allocated
                + ",\"units\":" + units + ",\"operations\":" + operations + ",\"rounds\":" + rounds
                + ",\"logical_filter_transitions\":" + changes + ",\"partial_writes\":" + partialWrites
                + ",\"zero_writes\":" + zeroWrites + ",\"write_calls\":" + writes + ",\"read_calls\":" + reads
                + ",\"selection_calls\":" + selections + ",\"drain_ns\":" + drain
                + ",\"checksum\":\"" + Long.toUnsignedString(checksum) + "\",\"latency_samples\":" + latencySamples
                + ",\"latency_p50_upper_ns\":" + quantile(.50) + ",\"latency_p95_upper_ns\":" + quantile(.95)
                + ",\"latency_p99_upper_ns\":" + quantile(.99) + ",\"registration_trace\":" + Arrays.toString(trace)
                + ",\"histogram_log2_sub16\":" + Arrays.toString(histogram) + "}";
        }
    }
    static class State {
        final SocketChannel channel;
        final byte[] payload, incoming;
        final ByteBuffer tx, rx;
        final int id;
        SelectionKey key;
        boolean active;
        long sent, sequence;
        State(SocketChannel channel, int size, int id) {
            this.channel = channel; this.id = id;
            payload = new byte[size]; incoming = new byte[size];
            for (int i = 0; i < size; i++) payload[i] = (byte) (i * 31 + id * 13 + 17);
            tx = ByteBuffer.wrap(payload); rx = ByteBuffer.wrap(incoming);
        }
    }
    static class Tcp implements AutoCloseable {
        final String kind;
        final boolean pressure;
        final Selector selector = Selector.open();
        final List<State> states = new ArrayList<>();
        final List<SocketChannel> peers = new ArrayList<>();
        final List<Thread> workers = new ArrayList<>();
        final AtomicBoolean stopping = new AtomicBoolean();
        final AtomicReference<Throwable> error = new AtomicReference<>();
        Tcp(String kind) throws Exception {
            this.kind = kind; pressure = kind.equals("backpressure"); checkSelector(selector);
            try (ServerSocketChannel server = ServerSocketChannel.open()) {
                server.setOption(StandardSocketOptions.SO_RCVBUF, bufferSize(kind));
                server.bind(new InetSocketAddress(InetAddress.getLoopbackAddress(), 0));
                for (int i = 0; i < connections(kind); i++) {
                    SocketChannel client = SocketChannel.open();
                    try {
                        options(client); client.connect(server.getLocalAddress());
                        SocketChannel peer = server.accept(); peers.add(peer); options(peer);
                        client.configureBlocking(false);
                        State state = new State(client, payloadSize(kind), i);
                        state.key = client.register(selector, READ, state); states.add(state);
                        Thread worker = Thread.ofPlatform().daemon(true).unstarted(() -> echo(peer));
                        workers.add(worker); worker.start();
                    } catch (Throwable failure) { client.close(); throw failure; }
                }
                selector.selectNow(); selector.selectedKeys().clear();
            } catch (Throwable failure) {
                try { close(); } catch (Throwable cleanup) { failure.addSuppressed(cleanup); }
                throw failure;
            }
        }
        void options(SocketChannel channel) throws Exception {
            channel.setOption(StandardSocketOptions.SO_SNDBUF, bufferSize(kind));
            channel.setOption(StandardSocketOptions.SO_RCVBUF, bufferSize(kind));
            channel.setOption(StandardSocketOptions.TCP_NODELAY, true);
        }
        int[] buffers() throws Exception {
            int[] values = {Integer.MAX_VALUE, 0, Integer.MAX_VALUE, 0, Integer.MAX_VALUE, 0, Integer.MAX_VALUE, 0};
            for (int i = 0; i < states.size(); i++) {
                int[] observed = {states.get(i).channel.getOption(StandardSocketOptions.SO_SNDBUF),
                    states.get(i).channel.getOption(StandardSocketOptions.SO_RCVBUF),
                    peers.get(i).getOption(StandardSocketOptions.SO_SNDBUF), peers.get(i).getOption(StandardSocketOptions.SO_RCVBUF)};
                for (int j = 0; j < observed.length; j++) {
                    values[j * 2] = Math.min(values[j * 2], observed[j]); values[j * 2 + 1] = Math.max(values[j * 2 + 1], observed[j]);
                }
            }
            return values;
        }
        void echo(SocketChannel peer) {
            ByteBuffer buffer = ByteBuffer.allocate(16 * 1024);
            try {
                while (!stopping.get()) {
                    if (pressure) Thread.sleep(5);
                    int n = peer.read(buffer); if (n < 0) break;
                    buffer.flip(); while (buffer.hasRemaining()) peer.write(buffer); buffer.clear();
                }
            } catch (Throwable failure) { if (!stopping.get()) error.compareAndSet(null, failure); }
        }
        void mask(State state, int value, Stats stats) {
            int old = state.key.interestOps();
            if (old != value) { state.key.interestOps(value); stats.changes += Integer.bitCount(old ^ value); }
        }
        int attemptWrite(State state, Stats stats) throws Exception {
            int remaining = state.tx.remaining(), n = state.channel.write(state.tx); stats.writes++;
            if (n > 0 && n < remaining) stats.partialWrites++; if (n == 0) stats.zeroWrites++; return n;
        }
        void write(State state, Stats stats) throws Exception {
            if (pressure) {
                while (state.tx.hasRemaining()) if (attemptWrite(state, stats) == 0) break;
                mask(state, READ | (state.tx.hasRemaining() ? WRITE : 0), stats);
            } else {
                long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(500);
                while (state.tx.hasRemaining()) {
                    if (System.nanoTime() > deadline) throw new AssertionError("Small write did not complete");
                    if (attemptWrite(state, stats) == 0) Thread.onSpinWait();
                }
            }
        }
        void start(State state, Stats stats) throws Exception {
            state.tx.clear(); state.rx.clear(); ByteBuffer.wrap(state.payload).putInt(state.id).putLong(++state.sequence);
            state.sent = System.nanoTime(); state.active = true; write(state, stats);
        }
        void select(Stats stats, boolean now) throws Exception {
            if (now) selector.selectNow(); else selector.select(100); stats.selections++;
        }
        void health(long deadline) {
            if (System.nanoTime() > deadline) throw new AssertionError("Incomplete TCP delivery at drain deadline");
            if (error.get() != null) throw new AssertionError("Peer failed", error.get());
        }
        boolean receive(State state, Stats stats) throws Exception {
            int n = state.channel.read(state.rx); stats.reads++;
            if (n < 0) throw new AssertionError("Unexpected EOF");
            if (state.rx.hasRemaining()) return false;
            if (state.tx.hasRemaining() || !Arrays.equals(state.payload, state.incoming)) throw new AssertionError("Payload mismatch");
            stats.units += state.payload.length; stats.operations++; stats.latency(System.nanoTime() - state.sent);
            stats.checksum = Long.rotateLeft(stats.checksum, 1) ^ state.id ^ state.sequence ^ state.payload.length;
            state.active = false; return true;
        }
        Stats phase(long millis) throws Exception {
            Stats stats = new Stats(); if (TRACE) KeventReach.start(selector);
            long allocated = allocations(), cpu = OS.getProcessCpuTime(), start = System.nanoTime();
            long until = start + TimeUnit.MILLISECONDS.toNanos(millis), drain = until + TimeUnit.SECONDS.toNanos(2);
            if (kind.equals("single") || kind.equals("bulk")) {
                do {
                    health(drain); for (State state : states) start(state, stats);
                    for (State state : states) mask(state, kind.equals("bulk") ? WRITE : READ | WRITE, stats);
                    select(stats, true); selector.selectedKeys().clear();
                    for (State state : states) mask(state, READ, stats);
                    select(stats, true); int pending = states.size();
                    while (pending > 0) {
                        health(drain); var iterator = selector.selectedKeys().iterator();
                        while (iterator.hasNext()) {
                            SelectionKey key = iterator.next(); iterator.remove(); State state = (State) key.attachment();
                            if (state.active && key.isReadable() && receive(state, stats)) pending--;
                        }
                        if (pending > 0) select(stats, false);
                    }
                    stats.rounds++;
                } while (System.nanoTime() < until);
            } else {
                for (State state : states) start(state, stats); int pending = states.size();
                List<State> restarts = new ArrayList<>();
                while (pending > 0) {
                    health(drain); select(stats, false); var iterator = selector.selectedKeys().iterator();
                    while (iterator.hasNext()) {
                        SelectionKey key = iterator.next(); iterator.remove(); State state = (State) key.attachment();
                        if (!state.active) continue;
                        if (key.isWritable() && state.tx.hasRemaining()) write(state, stats);
                        if (key.isReadable() && receive(state, stats)) {
                            pending--;
                            if (System.nanoTime() < until) {
                                if (pressure) restarts.add(state); else start(state, stats);
                                pending++;
                            }
                        }
                    }
                    if (!restarts.isEmpty()) {
                        // Flush completed WRITE deletions before an exchange can add WRITE again.
                        select(stats, true);
                        for (State state : restarts) start(state, stats);
                        restarts.clear();
                    }
                }
            }
            for (State state : states) mask(state, READ, stats);
            select(stats, true); selector.selectedKeys().clear();
            stats.wall = System.nanoTime() - start; stats.cpu = OS.getProcessCpuTime() - cpu;
            stats.allocated = allocations() - allocated; stats.drain = Math.max(0, stats.wall - TimeUnit.MILLISECONDS.toNanos(millis));
            if (TRACE) stats.trace = KeventReach.snapshot(); health(drain);
            if (stats.operations == 0 || (pressure && (stats.partialWrites == 0 || stats.zeroWrites == 0 || stats.changes == 0)))
                throw new AssertionError("Required data/pressure/registration work did not occur");
            return stats;
        }
        public void close() throws Exception {
            stopping.set(true); List<Throwable> failures = new ArrayList<>();
            for (State state : states) try { state.channel.close(); } catch (Throwable t) { failures.add(t); }
            for (SocketChannel peer : peers) try { peer.close(); } catch (Throwable t) { failures.add(t); }
            try { selector.close(); } catch (Throwable t) { failures.add(t); }
            long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(2);
            for (Thread worker : workers) {
                long remaining = deadline - System.nanoTime(); if (remaining > 0) worker.join(Math.max(1, TimeUnit.NANOSECONDS.toMillis(remaining)));
                if (worker.isAlive()) failures.add(new AssertionError("Peer worker did not stop"));
            }
            if (error.get() != null) failures.add(error.get());
            if (!failures.isEmpty()) { Exception failure = new Exception("TCP teardown failed"); failures.forEach(failure::addSuppressed); throw failure; }
        }
    }
    static Stats construct(long millis) throws Exception {
        Stats stats = new Stats(); if (TRACE) KeventReach.startAll();
        long allocated = allocations(), cpu = OS.getProcessCpuTime(), start = System.nanoTime();
        long until = start + TimeUnit.MILLISECONDS.toNanos(millis);
        do {
            try (Selector selector = Selector.open()) { checkSelector(selector); selector.selectNow(); stats.selections++; }
            stats.units++; stats.operations++;
        } while (System.nanoTime() < until);
        stats.wall = System.nanoTime() - start; stats.cpu = OS.getProcessCpuTime() - cpu; stats.allocated = allocations() - allocated;
        if (TRACE) stats.trace = KeventReach.snapshot(); return stats;
    }
    static void phaseObservation(String kind, String phase, Stats stats) {
        System.out.println("NATIVE_POLLING_PHASE {\"case\":" + quote(kind) + ",\"phase\":" + quote(phase) + ",\"stats\":" + stats.json() + "}");
    }
    public static void main(String[] args) throws Exception {
        if (args.length != 3) throw new IllegalArgumentException("case warmup-ms measure-ms");
        String kind = args[0];
        if (!List.of("stable", "single", "bulk", "backpressure", "construct").contains(kind)) throw new IllegalArgumentException(kind);
        long warm = Long.parseLong(args[1]), measure = Long.parseLong(args[2]);
        if (warm <= 0 || measure <= 0 || warm > 3000 || measure > 10000) throw new IllegalArgumentException();
        if (!TRACE && System.getenv("DYLD_INSERT_LIBRARIES") != null) throw new AssertionError("Instrumented timing process");
        if (!THREADS.isThreadAllocatedMemorySupported() || OS.getProcessCpuTime() < 0) throw new AssertionError("Required process metrics unavailable");
        if (!THREADS.isThreadAllocatedMemoryEnabled()) THREADS.setThreadAllocatedMemoryEnabled(true);
        Stats first, second; int[] before = {}, after = {};
        if (kind.equals("construct")) {
            first = construct(warm); phaseObservation(kind, "warmup", first);
            second = construct(measure); phaseObservation(kind, "measurement", second);
        } else {
            try (Tcp tcp = new Tcp(kind)) {
                first = tcp.phase(warm); phaseObservation(kind, "warmup", first); before = tcp.buffers();
                second = tcp.phase(measure); phaseObservation(kind, "measurement", second); after = tcp.buffers();
            }
        }
        if (second.wall <= 0 || second.cpu <= 0 || second.units <= 0 || second.allocated < 0) throw new AssertionError("Invalid metrics");
        System.out.println("NATIVE_POLLING_RESULT {\"case\":" + quote(kind) + ",\"instrumented\":" + TRACE
            + ",\"java_home\":" + quote(System.getProperty("java.home")) + ",\"java_vm_version\":" + quote(System.getProperty("java.vm.version"))
            + ",\"processors\":" + Runtime.getRuntime().availableProcessors() + ",\"max_heap_bytes\":" + Runtime.getRuntime().maxMemory()
            + ",\"verified\":true,\"warmup_ms\":" + warm + ",\"measure_ms\":" + measure
            + ",\"connections\":" + connections(kind) + ",\"payload_bytes\":" + payloadSize(kind)
            + ",\"requested_buffer_bytes\":" + (kind.equals("construct") ? 0 : bufferSize(kind)) + ",\"tcp_nodelay\":true,\"peer_pause_ms\":" + (kind.equals("backpressure") ? 5 : 0)
            + ",\"buffers_before\":" + Arrays.toString(before) + ",\"buffers_after\":" + Arrays.toString(after)
            + ",\"unit\":" + quote(kind.equals("construct") ? "selector_lifecycles" : "verified_response_bytes")
            + ",\"warmup\":" + first.json() + ",\"measurement\":" + second.json() + "}");
    }
}
