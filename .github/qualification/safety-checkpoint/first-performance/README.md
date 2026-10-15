# First public API calls at source 0af2b4bc

All 16 tier/operation/size cases passed checksum checks. Each uses 120 measured
fresh JVMs per variant after 20 discarded blocks, all five-variant permutations,
CPU affinity, identical libjvm loading preparation and paired 95% intervals.
Master 87edd79d, published c04d1ba1 and current 0af2b4bc images are fingerprinted.
No builds or tests ran concurrently. Raw commands and samples are retained.

This is an open regression checkpoint. Against the published head, interpreter
4096-bit modPow is +0.705 ms (95% +0.235 to +1.175); C1 level 1 is +0.306 ms
(+0.184 to +0.428), C1 level 3 is +0.395 ms (+0.239 to +0.551). First 4096-bit
multiply is also slower in C1. C2 modPow is -0.064 ms (-0.107 to -0.021).
First 512-bit multiply improves in interpreter/C1; no resolved 512-bit modPow
slowdown appears. These results do not establish complete performance readiness.
A separate temporary diagnostic build is tracing deferred BigInteger resolution.
Startup, warmed performance and tier2 remain pending; original ARM evidence
transfer/hardware and Windows qualification gaps remain as previously recorded.
