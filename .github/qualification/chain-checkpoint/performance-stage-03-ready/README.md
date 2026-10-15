Linux x64 performance checkpoint for implementation 0fb3e86a762be2cd3ed9ec35f327e1e7c64682bc.

Raw commands, paired fresh-JVM observations, JMH fresh-fork results, image fingerprints, fixture sources/bytecode and all classpath JARs are retained with a per-file SHA256 manifest. Original measurement files remain intact. Incomplete phases are partial evidence only.

First-call cases use fresh JVMs with a warm operating-system file cache; call time and whole-process wall time are separate. Legacy BigInteger inputs have nominal sizes whose actual bit length is seven bits smaller; the exact fixture supplies full-size operands. Startup retains wall and CreateVM time. Paired Student-t 95% intervals are reported; JMH iterations are not treated as independent forks. Positive intervals remain explicit review signals.

This packet does not qualify native ARM CDS/performance, Windows or AVX-512 on Windows, or certify clean tier2. The pre-performance checkpoint and assessment retain the local test limitations. No speedup or readiness conclusion follows merely from completing a measurement phase.
