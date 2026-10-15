# Common-intrinsic redefinition safety checkpoint

Source is `0af2b4bcb53962ebce26bed0f67bd82d81cee87c`, tree
`44d482c5b36d17981a5c88dde92cbf6307fefd40`. The source bundle requires the
unchanged public PR head c04d1ba1. Its SHA256 is
`81372518a469f3cb91f460d236027113ee05b0428be1818fb295f85ec0b424d9`.

Common-intrinsic preparation can block after CallInfo selects a method. Cache
publication now reacquires CallInfo's current method inside its existing
NoSafepointVerifier. MemberName setup likewise refreshes the current method
after preparation and derives/publishes its state without another safepoint.
CallInfo retains the old method across the blocking work; structural class,
signature and dispatch information stays compatible across redefinition.
JavaCalls already permits blocking and entering Java with its rooted selected
method; it does not publish a captured CallInfo target into a resolution cache.

The new test uses non-identical, semantically unchanged BigInteger bytecodes,
48 concurrent redefinitions and 12 first-use callers in each fresh JVM. It
covers multiply, modPow and direct method-handle lookup/invocation under the
interpreter and C1 levels 1/3, including first compiler-stub generation. The
pre-repair fastdebug image passed this stress test: no crash is claimed. The
repair addresses the documented source invariant. Both repaired release and
fastdebug images rebuilt successfully; focused checks are recorded separately.
The initial fastdebug harness launch preceded image-copy completion and ran
zero tests; a new run follows successful snapshot hash verification.

Earlier 7454b15f qualification does not qualify this changed source. No
performance or tier2 run has started, no hosted campaign/init change/merge or
force push occurred, and the original ARM failure is still unqualified.
