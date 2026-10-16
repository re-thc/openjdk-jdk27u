# C2 equality audit

These diagnostics use source `ae6ea74` and the same GCC 14 VM/GCC 16 kernel
image as the historical dispatch matrix. They investigate the reported serial
C2 equality difference; they are separate from final-code results.

C2 compiles both controls to the existing string-equality intrinsic. The normal
JMH loop has identical instruction sequences, small immediates, relative branch
targets and positions within cache lines. External process addresses were
normalized for ASLR. Neither loop calls StringZilla.

The alignment benchmark constructs distinct equal 4096-byte Latin-1 strings,
then selects both array data starts at the requested offset modulo 64. The VM
used a zero-based compressed-oop heap with shift 3 and a 4 GiB maximum. Each
control has three forks, three 500 ms warmups and five 500 ms measurements per
fork. The raw records retain all samples and observed addresses. The ordinary
search benchmark was also run with setup-only address reporting.

| Array data offset modulo 64 | Original Java | Disabled | Enabled |
| --- | ---: | ---: | ---: |
| 0 | 106.37 ± 4.07 | 101.01 ± 1.26 | 105.82 ± 3.44 |
| 8 | 119.01 ± 5.23 | 116.95 ± 2.52 | 112.81 ± 1.63 |
| 16 | 101.97 ± 8.43 | 105.69 ± 14.63 | 106.41 ± 4.00 |
| 24 | 116.41 ± 2.99 | 118.23 ± 6.65 | 116.75 ± 9.26 |

Means and JMH 99.9% confidence half-widths are ns/op. Controlled alignment
explains much of the throughput variation, but smaller slower means remain,
including the enabled result at offset zero. The address-reporting benchmark
produced enabled 109.99 ± 5.83, disabled 114.34 ± 8.68 and original Java
104.49 ± 7.98 ns/op, with different alignments across forks.

The historical loss stays in the primary report. These diagnostics support
retaining the existing C2 equality path and qualifying its timing variation;
they do not establish a StringZilla C2 equality improvement or prove every
observed difference comes from alignment.
