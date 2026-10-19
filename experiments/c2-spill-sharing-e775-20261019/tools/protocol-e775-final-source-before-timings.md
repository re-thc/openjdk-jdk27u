# Final qualification after fork master advanced

The publication check found master had advanced from 416d7db to
e7753d9dffffbf3a9430c2cc2ab53c5332bf1bf4 (tree
94e2438d2f55b76c8e360e35c10034c093635f06). Its C2 adjacent-constant integer
guard folding changes allocator inputs; the JavaThread change only suppresses
a GCC diagnostic. Preserve all 416-base builds, tests and measured observations.
Do not present their performance numbers as qualification of this new base.
The attempted publication stopped on the master-identity assertion before push.

Integrate the same minimal nine-file sharing patch with e775, preserving its
implementation and guards. Build complete release/fastdebug stock and candidate
images with the established GCC14, boot JDK, version/date and dependency options.
Record new commits, trees and binary hashes. Repeat native guards, the four
required Java selectors/full regalloc group, selected codec70 and frame85 checks,
and the moved-root, live-call/frame/oop-map audit on this final source pair.

Use equal-length complete release installation paths images/e775-a and e775-b,
with CDS explicitly required on and verified in both arms. This is chosen before
any e775 measurements. The earlier untouched copy loop matched after relocations
while its scores depended on runtime setup; installation paths and CDS use must
be controlled from the start. Retain separate fastdebug images.

Run the same fixed nine-cell, twelve-pair design (216 fresh JVM forks), now
interleaving the cells by pair as well as alternating AB then BA. Rotate cell
order by pair. Keep all app classes, fixed frames, affinity 0-3, one benchmark
thread, SerialGC, 512 MiB heap, ActiveProcessorCount=4, three one-second warmups,
five one-second measurements, median per fork and median paired ratios. Use
the established 20,000-draw paired bootstrap, seed 20261019. Preserve every
observation and order group. There is no score-based retry or favorable subset.

Keep builds, correctness tests, code captures, primary timings, resource-cost
measurements and allocation profiling separate. Run the established twelve-pair
startup/compiler-cost matrix using standard per-child wait4 resource accounting,
with the same explicit CDS setting and image paths. Retain the separate two-pair
GC/allocation profiler cells (direct source, allocating source, positive trigger).

Capture complete final allocated code and actual JMH dense/copy code on this
source pair; account for replacement transport, frames and path-frequency
evidence. Product builds cannot print C2 CFG frequencies; label fastdebug
frequency estimates separately rather than applying exact dynamic counts to
product code. If useful benefit survives the final pair and acceptable controls,
publish one minimal tested draft PR and separate evidence. Otherwise reject
with decisive final-base evidence. Never borrow the prior-base gain.
