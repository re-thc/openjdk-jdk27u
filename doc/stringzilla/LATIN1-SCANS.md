# Latin-1 line and whitespace scans

The shared StringZilla integration also accelerates eligible Latin-1
`lines`, `trim`, `strip`, `stripLeading`, `stripTrailing` and `isBlank` scans.
UTF-16 retains the existing Unicode scanners.

`trim` removes bytes `0x00`–`0x20`. Latin-1 Character whitespace is exactly
`0x09`–`0x0D` and `0x1C`–`0x20`; NEL and NBSP remain non-whitespace for
strip/blank operations. Line splitting recognizes CR, LF and CRLF.

An immediate character check and a 32-byte scalar probe handle short matches.
Native admission requires at least 256 remaining bytes. A compiled probe of
one checked word can resolve a nearby match before entering native code.
Each native call covers at most 64 KiB; Java loops between windows retain
safepoint opportunities. C1 and C2 use leaf calls, and the interpreter uses JNI.
The initialized kernel table stays fixed for the VM lifetime, allowing compiled
scan calls to target the selected kernel directly.

The x86 SIMD tables use AVX2 byte-set kernels, including when the search backend
selects Skylake. AArch64 uses NEON. Serial backends and the feature-off control
use Java scans. `-XX:-UseStringZillaIntrinsics` disables native admission.

String identity, allocation, lazy line consumption, CRLF handling, splitting,
spliterator fences and consumer exceptions remain in Java. Tests cover all
256 Latin-1 values, both predicates, physical bounds, short/probe/admission and
64 KiB window boundaries, forced interpreter/C1/C2, JNI fallback, compact
strings off, feature off and concurrent GC.

[Combined-source measurements and validation](https://github.com/re-thc/openjdk-jdk27u/blob/codex/stringzilla-final-artifacts/doc/stringzilla/selected-20261022/RESULTS.md)
retain independent-original, prior-source, enabled and disabled controls,
individual samples, paired medians, spread and measured losses. Qualification
applies to the source and complete-image identities recorded there. Earlier
PR4 and PR63 measurements retain their original source identities.
