Use bounded mismatch stubs for native segments and buffers on x86-64 and AArch64

Native, direct and mapped `MemorySegment` and NIO comparisons can use the
vectorized mismatch stub from C2 and the interpreter. AArch64 gains an Advanced
SIMD stub, enabled by default through interpreter, C1 and C2, including heap
arrays that previously used the Java loop.

Native C2 leaves are selected for 128 B through 64 KiB with a guarded first-word
early exit. Short native C2 scans keep the Java loop. Scoped native and mixed
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

Validation: [CI run 39013245609](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39013245609)
passed all 57 jobs at `d4757b0fc`, including native Linux ARM64 and macOS ARM64
tier1. Head `9fedf7ac9` additionally caches segment bases and addresses before
the prechecks; [its CI run](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39027042938)
requires a completed result before merge.
The native ARM qualification source and fixed campaign are in
`diagnostics/pr39-aarch64/README.md`. [Run 39030274620](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39030274620)
built matched base/candidate release images and candidate fastdebug on native
Neoverse-N2, with development-profile smoke checks passing. It stopped at JMH
processor discovery, before the targeted correctness and timing gates. The
harness processor-path fix is prepared for review; it has not been rerun on ARM.
ARM performance remains unqualified. No application or x86 speedup is claimed
by this qualification package; current author measurements require their own
completed evidence. The shared thresholds require the planned ARM early-exit
and boundary checks before merge review can be completed. The qualification
screen includes 64/128 KiB requests with short matching prefixes and retains
GC and compilation evidence to distinguish setup costs from caller/GC effects.

---------
- [ ] I confirm that I make this contribution in accordance with the [OpenJDK Interim AI Policy](https://openjdk.org/legal/ai).
