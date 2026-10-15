# BigInteger first-use chain checkpoint

Source `0fb3e86a762be2cd3ed9ec35f327e1e7c64682bc`, tree `e75b5e645ec9f03bc491d327b74ebc6cfc2028ba`. The verified source bundle
requires the unchanged public PR head c04d1ba1. Release/fastdebug rebuilds are in
progress; no earlier correctness result qualifies this new source.

Source 0af2b4bc's complete first-call matrix found 4096-bit modPow regressions
against the published head in interpreter and C1. Diagnostic tracing identified
two initial products before Montgomery and nearly 200 resolver visits in a cold
recursive square. A simple quadratic-work threshold fixed the large case but
regressed a 2048-bit first square by 0.24 ms, so it was rejected.

The selected implementation prepares at exact BigInteger oddModPow and
squareKaratsuba Java target resolution. Smaller isolated products remain
unprepared. A separate recursive multiply guard reads both operand magnitudes
inside a no-safepoint scope and drops raw oops before preparation. Exploratory
40-pair balanced crossover runs found deferred interpreter products slower at
3328+ bits and deferred C1 level-1 products slower at 3840 bits; 2048/2560-bit
products retained a clear Java advantage. The selected work guards are 104^2
and 120^2 limbs. Source-specific final performance is still required.

Initialization tests now cover a deferred medium square and recursive product,
first large square/product, and independently computed 512/4096-bit modPow.
Concurrent redefinition now includes the enclosing Java targets. Source 0af's
stale-target repair remains outside blocking work and independently reviewed;
its race test passed before repair, so no reproduced crash is claimed.

The packet preserves all exploratory commands, images/fingerprints, raw samples
and rejected patches. Only the initial full 0af matrix used 120 permutations;
exploratory crossover runs use 40 measured balanced Latin blocks after 20 warmup
blocks. The original ARM failure is not proven fixed. Its Library transfer and
native ARM/Windows hardware gaps remain. No PR push, hosted campaign, init
change, merge or force-push occurred.
