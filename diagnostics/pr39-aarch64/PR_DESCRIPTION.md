Use bounded mismatch stubs for native segments and buffers on x86-64 and AArch64

Native, direct and mapped `MemorySegment` and NIO comparisons can use the
vectorized mismatch stub from C2 and the interpreter. AArch64 gains an Advanced
SIMD stub, enabled by default through interpreter, C1 and C2, including heap
arrays that previously used the Java loop.

Native C2 leaves are selected for 128 B through 64 KiB. On AArch64, heap calls
below 128 B retain Java; guarded C2 loads check the first two heap words or the
first sixteen native/mixed words before stub entry. AArch64 C2 heap vector work
is capped at 2 KiB; an equal heap prefix on a larger request calls the existing
Java implementation with all original arguments. Native and mixed C2 calls
retain their full-range stub within the existing 64 KiB bound, with no
post-stub Java rescan. AArch64 C1 uses a leaf only for
constant valid ranges of at most 64 KiB. Short native C2 scans keep the Java loop.
Prefix loads with ambiguous heap/native aliases use compiler ordering barriers
so preceding and following plain heap accesses keep their required order.
Scoped native and mixed
scans use bounded chunks with Java safepoint polls between them; heap segment
scans retain the scoped boundary. The interpreter entry bounds its leaf work,
counts invocations once, and defers profiling, safepoints and JVMTI events to
the ordinary entry. Mapped faults in the stub deliver `InternalError` and NIO
comparisons keep direct-buffer owners reachable.

Related changes fix empty x86 stub ranges, out-of-range reads at low segment
mismatch thresholds, and wide-string terminator bounds. CharBuffer views stage
long string writes through a bounded array; buffer hashCode combines four
elements with the same specified result. There are no public API changes or
new production libraries. Existing legal notices and recovery ancestry are retained.

Validation: [CI run 39027042938](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39027042938)
passed all 57 jobs at `9fedf7ac9`, including native Linux ARM64 and macOS ARM64
builds and tier1. The separate [native AArch64 qualification](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39033175975)
built matched baseline/candidate release images and candidate fastdebug on
Neoverse-N2. All 34 required jtreg records and 108 fresh-VM probes passed across
Serial, G1 and ZGC.

**The native ARM performance gate failed; this PR is not ready to merge.**
The original source's fixed 34-row screen found 21 regressions and 8 inconclusive rows with stable
controls. Heap byte-array early mismatches regressed about 21–23% for 8-byte
requests and 44–47% for 128-byte requests; native short-prefix and equal 64 KiB
heap scans also regressed. The screen stopped before the 98 main timing rows.
The retained compilation logs show C2 code, a measurement-iteration-1 worker
recompilation limitation, and no later target deoptimization; all measured
forks recorded zero collections. Full results, machine/source identities and
attribution limits are in `diagnostics/pr39-aarch64/RESULTS.md`. No application
or x86 speedup is claimed by this qualification. The historical x86 measurements
against `e206bae32` remain separate from this incremental current-master ARM
comparison.

The subsequent AArch64 repair and regression tests are available for review,
with every screening row audited in `diagnostics/pr39-aarch64/REPAIR.md` and its
linked data. The heap-only 2 KiB cutoff preserves a vector opportunity through
the observed byte-1,267 case; it is not a measured optimum. The future plan moves
the existing native equal 4 KiB benefit gate before the remaining timing rows.
The repaired source still needs
native ARM build, correctness and matched performance validation, with actual
instruction bytes retained. No further CI or benchmark has been launched.

---------
- [ ] I confirm that I make this contribution in accordance with the [OpenJDK Interim AI Policy](https://openjdk.org/legal/ai).
