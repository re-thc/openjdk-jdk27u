# Socket-to-file transfer experiment

This standalone harness exercises `FileChannel.transferFrom` with a socket, an
empty nonblocking socket, or a custom heap channel. It is a manual benchmark,
not a jtreg test. The sender uses `SocketChannel.write`; no case calls
file-to-socket `transferTo` or `sendfile`.

Compile and run with the JDK under study from the repository root:

```sh
mkdir -p build/socket-file-bench/classes
"$JDK/bin/javac" --add-exports java.base/jdk.internal.access=ALL-UNNAMED \
    -d build/socket-file-bench/classes \
    test/benchmarks/socket-file-transfer/SocketFileBench.java
"$JDK/bin/java" --add-exports java.base/jdk.internal.access=ALL-UNNAMED \
    -XX:MaxDirectMemorySize=1m -cp build/socket-file-bench/classes \
    SocketFileBench socket 8192 available 2000 5 5 platform
```

Arguments are `kind bytes quota operations warmup-batches samples thread`.
Kinds are `socket`, `empty`, and `arbitrary`; quota modes are `available`,
`exhausted`, and `mixed`; thread modes are `platform` and `virtual`. Use the
1 MiB direct-memory limit for `exhausted` and `mixed`, which hold that capacity
to exercise fallback. No heap size or RAM-disk setup is prescribed.

Choose operation counts for the available resources, run adjacent baseline and
candidate JVMs in alternating order, and retain individual pairs as well as
paired medians. Each fork warms for at least one second and the requested batch
count, then reports each sample as JSON. Setup and final content/position
verification are outside samples. CPU includes the sender, GC and concurrent
compilation. Heap allocation excludes native allocation; virtual-thread caller
allocation is reported as unavailable. Temporary files use the working
directory, so record its filesystem. Writes are page-cache writes without fsync.

The harness comes from the native Mac handback at
`322d47a6b5cb7ec5c5db3afb4122c22a62bf1178`. Only its temporary-file directory
changed from a dated build directory to the working directory; the measured
loop and sampling code are retained. The archived measurements and compiler
journals stay on that handback branch and are not part of this benchmark.
