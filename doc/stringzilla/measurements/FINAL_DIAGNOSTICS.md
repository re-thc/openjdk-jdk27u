# Final-code diagnostics

These checks use the frozen `a7607aa` VM, java.base module and GCC 16 kernels
from the final primary matrix. [Raw samples, source/runtime hashes, candidate
diff and generated C2 code](final-diagnostics.json) are retained. Supplemental
measurements replace no primary result. Means and JMH 99.9% confidence
half-widths are ns/op.

## Interpreter immediate reverse match

The 128-code-unit UTF-16 haystack ends with its four-code-unit needle. The
Java match probe returns before backend dispatch or a StringZilla leaf call.
The primary serial result is 698.22 ± 27.45 enabled, 704.55 ± 24.05 disabled,
and 652.54 ± 17.79 original Java. The enabled and original intervals are
separated by 0.44 ns.

The supplemental run uses three forks, three 500 ms warmups and five 500 ms
measurements per fork, with the same pinned CPU and VM options. Controls
rotate between backends.

| Backend | Original Java | Disabled | Enabled |
| --- | ---: | ---: | ---: |
| serial | 660.49 ± 15.78 | 705.88 ± 22.27 | 707.57 ± 42.63 |
| avx2 | 654.28 ± 9.86 | 744.95 ± 22.42 | 680.79 ± 14.89 |
| avx512 | 665.68 ± 11.06 | 697.14 ± 7.71 | 688.80 ± 30.24 |

Slower means versus original Java remain in this short interpreted path.
The repeat also retains a higher non-overlapping enabled interval versus
original Java with AVX2. The disabled Java dispatcher has similar overhead;
these results do not measure native kernel cost. They do not establish zero
interpreter regressions.

An isolated candidate moved the short match probe ahead of enable/tier
checks and placed its loop in the dispatcher. It did not improve the target
immediate-hit case, so the production code is unchanged. The candidate
uses a java.base patch on the same VM; its source diff, compiled-class hashes
and all three-fork measurements are in the raw diagnostics.

| Serial interpreter workload | Original Java | Final code | Rejected candidate |
| --- | ---: | ---: | ---: |
| Immediate reverse match, 128 / 4 | 674.23 ± 9.99 | 692.76 ± 22.36 | 708.33 ± 30.02 |
| Reverse miss, 4 / 4 | 444.34 ± 14.04 | 458.33 ± 17.28 | 460.22 ± 17.21 |
| Reverse miss, 128 / 4 | 5005.58 ± 204.02 | 555.38 ± 10.36 | 545.63 ± 16.69 |

## C2 equality

Final-code inlining traces confirm the existing JDK equality intrinsic for
enabled, disabled and original-Java controls with serial Latin-1 length 4096
and AVX2 UTF-16 length 129. The records retain the actual JMH loop's normal
C2 compilation, machine-code bytes, inlining context and normalized
instructions. Trace runs use diagnostic printing and are not performance
comparisons.

Serial enabled and disabled loops have identical normalized instruction
sequences (SHA-256 `6eaa048a24751dc131027da2508fb936b4690638939b043c012bb8d1e95b2503`).
The UTF-16 loops retain the same equality vector path but differ in cold-block
placement and branch targets; their full normalized hashes differ. Neither
equality loop enters a StringZilla leaf. The earlier controlled-alignment
[audit](EQUALITY_AUDIT.md) remains separate evidence from an earlier revision.
These checks support retaining the existing C2 intrinsic; they do not
attribute every timing difference to alignment or claim StringZilla equality
improvements in C2.
