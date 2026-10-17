# Predefined production-route evaluation

Frozen before production measurements, 2026-10-16. Preserve prototype commit
fdb9621ae74 and its evidence. No selection of a passing fork or repeated search
for favorable measurements is allowed. Routine build/test corrections precede
this fixed measurement run and will be recorded.

Four routes: preserved current-source baseline 89885a6288e7, the baseline with
the original cached Java parser control, the built production JDK with speedate
enabled, and that same JDK with startup property
`-Djdk.time.instantSpeedate=false`. No module patch or external library path is
used for either production route.

For canonical mixed 0–6 digit timestamps, 50%-hit/25%-fallback/25%-invalid input,
and invalid-only input: three JVM forks, 400000 warmup calls, five rounds of
200000 calls; discard the first round only, retain every observation. Rotate
route order across forks; run JVMs serially with G1, 256MiB fixed heap,
two active processors and -Xbatch. Repeat both CompactStrings modes. Use the
prototype's fixed corpus and volatile escaping result sink. Add no new case to
make a result pass. Verify arithmetic checksums agree.

Local acceptance: canonical median at least 1.5× faster than preserved current
JDK and at least 1.25× faster than cached Java control; mixed and invalid-only
medians within 3% of the current JDK, inspecting fork ranges for uncertainty.
These are newly chosen local engineering criteria, not transferred platform
claims. A miss is reported as a miss; no retry-until-pass.

Correctness: exact differential outcomes and separate-process digests; direct
native hits/misses; missing library, native miss and missing symbol injection;
Serial/G1/ZGC with both String storage modes, allocation pressure, concurrent
cold initialization, and real pre-VM-boot parsing via custom system-loader
construction. Verify native loading happens after boot and exactly once.
Before measurement, native loading was moved out of holder class initialization
and a forced per-library-lock/JNI_OnLoad callback regression was added. The
fixed performance cohorts, counts and gates above are unchanged.

Bootstrap/load cost is measured separately from first parse in ten fresh JVMs:
time bootstrap-library holder initialization, then one warm-library parse;
separately time a cold first public parse and full process wall time. Report all
values without assuming the prototype's bootstrap cost applies.
